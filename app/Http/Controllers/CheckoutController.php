<?php

namespace App\Http\Controllers;

use App\Models\BankAccount;
use App\Models\Event;
use App\Models\EventSession;
use App\Models\Order;
use App\Models\Payment;
use App\Models\SeatAvailability;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;


class CheckoutController extends Controller
{
    public function processDirectRegistration(Request $request, $slug, $sessionId)
    {
        $eventSession = EventSession::with('event')->findOrFail($sessionId);
        $event = $eventSession->event;

        // Cek kuota pendaftaran user (maksimal 4 tiket per event)
        if (!Auth::user()->isAdmin() && !Auth::user()->isSuperAdmin()) {
            $registeredCount = \App\Models\Ticket::whereHas('order', function($q) use ($event) {
                $q->where('user_id', Auth::id())
                  ->whereHas('eventSession', function($sq) use ($event) {
                      $sq->where('event_id', $event->id);
                  })
                  ->whereIn('status', ['pending_payment', 'waiting_verification', 'paid']);
            })->where('status', '!=', 'cancelled')->count();
            
            $incomingCount = $request->input('participant_count', session('participant_count', 1));

            if (($registeredCount + $incomingCount) > 4) {
                return redirect()->route('events.show', $slug)->with('error', 'Pendaftaran gagal: Anda melebihi batas maksimal pendaftaran (4 orang). Sisa kuota Anda adalah ' . (4 - $registeredCount) . ' orang.');
            }
        }

        $participantsData = [];
        
        if ($request->has('participant_count')) {
            $count = $request->input('participant_count');
            $names = $request->input('names', []);
            $orgs = $request->input('organizations', []);
            
            for ($i = 0; $i < $count; $i++) {
                $participantsData[] = [
                    'name' => $names[$i] ?? Auth::user()->name,
                    'organization' => $orgs[$i] ?? 'Umum',
                ];
            }
        } else {
            $participantsData = session('participants_data', []);
        }

        if (empty($participantsData)) {
            $participantsData = [
                ['name' => Auth::user()->name, 'organization' => 'Umum']
            ];
        }

        $orderCode = 'NYA-' . date('Ymd') . '-' . strtoupper(Str::random(6));
        $uniqueCode = 0;
        $totalAmount = 0; // Karena tiket dikasih dulu tanpa kursi, harga diset 0
        $finalAmount = 0;

        try {
            $order = DB::transaction(function () use ($orderCode, $eventSession, $event, $uniqueCode, $totalAmount, $finalAmount, $participantsData) {
                
                $order = Order::create([
                    'order_code' => $orderCode,
                    'user_id' => Auth::id(),
                    'event_session_id' => $eventSession->id,
                    'bank_account_id' => null,
                    'total_amount' => $totalAmount,
                    'unique_code' => $uniqueCode,
                    'final_amount' => $finalAmount,
                    'status' => 'paid', // Langsung dianggap lunas / selesai daftar
                    'participants_data' => $participantsData,
                    'expired_at' => now()->addYears(1),
                ]);

                // Create dummy payment
                \App\Models\Payment::create([
                    'order_id' => $order->id,
                    'proof_path' => 'direct_registration_no_payment',
                    'sender_bank' => 'FREE/DIRECT',
                    'sender_name' => Auth::user()->name ?? 'Guest',
                    'transfer_amount' => 0,
                    'uploaded_at' => now(),
                    'verified_by' => Auth::id(),
                    'verified_at' => now(),
                ]);

                // Generate tickets tanpa kursi
                foreach ($participantsData as $participant) {
                    $ticketCode = 'TKT-' . date('Ymd') . '-' . strtoupper(Str::random(6));
                    $qrHash = hash('sha256', $ticketCode . '-NOSEAT-' . Str::random(12));

                    \App\Models\Ticket::create([
                        'ticket_code' => $ticketCode,
                        'qr_code_hash' => $qrHash,
                        'order_id' => $order->id,
                        'seat_availability_id' => null,
                        'status' => 'valid',
                        'participant_name' => $participant['name'] ?? null,
                        'participant_organization' => $participant['organization'] ?? null,
                    ]);
                }

                return $order;
            });
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Terjadi kesalahan sistem: ' . $e->getMessage());
        }

        session()->forget(['participant_count', 'participants_data']);

        return redirect()->route('my-tickets.index')->with('success', 'Pendaftaran berhasil! E-Tiket Anda telah diterbitkan. Nomor kursi akan ditentukan oleh panitia.');
    }

    public function showCheckout(Request $request)
    {
        $seatIds = session('checkout_seat_ids', []);
        $sessionId = session('checkout_session_id');

        if (empty($seatIds) || !$sessionId) {
            return redirect('/')->with('error', 'Sesi pemesanan telah berakhir. Silakan pilih kursi kembali.');
        }



        $session = EventSession::with(['event.venue'])->findOrFail($sessionId);
        $event = $session->event;

        $seats = SeatAvailability::with(['seatMaster.seatCategory'])
            ->whereIn('id', $seatIds)
            ->get();

        $bankAccounts = BankAccount::where('is_active', true)->get();

        $totalAmount = 0;
        foreach ($seats as $seat) {
            $totalAmount += $seat->seatMaster->seatCategory?->price ?? 0;
        }

        // Tanpa kode unik (0)
        $uniqueCode = 0;
        $finalAmount = $totalAmount;

        session([
            'checkout_unique_code' => $uniqueCode,
            'checkout_final_amount' => $finalAmount,
        ]);

        return view('checkout.index', compact('event', 'session', 'seats', 'bankAccounts', 'totalAmount', 'uniqueCode', 'finalAmount'));
    }

    public function processCheckout(Request $request)
    {
        $sessionId = session('checkout_session_id');
        $eventSession = EventSession::with('event')->findOrFail($sessionId);
        $event = $eventSession->event;

        if (!$event->is_free) {
            $request->validate([
                'bank_account_id' => ['required', 'exists:bank_accounts,id'],
            ]);
        }

        $seatIds = session('checkout_seat_ids', []);
        $uniqueCode = 0;

        if (empty($seatIds) || !$sessionId) {
            return redirect('/')->with('error', 'Sesi pemesanan telah berakhir.');
        }

        $timeoutHours = (int) $event->payment_verification_timeout_hours;
        if ($timeoutHours <= 0) {
            $timeoutHours = 24;
        }

        $orderCode = 'NYA-' . date('Ymd') . '-' . strtoupper(Str::random(6));

        try {
            $order = DB::transaction(function () use ($request, $orderCode, $eventSession, $event, $uniqueCode, $timeoutHours, $seatIds) {
                // 1. Ambil kursi dari DB dan KUNCI barisnya agar tidak bisa dibeli berbarengan (Race Condition / Pessimistic Locking)
                $seats = SeatAvailability::with('seatMaster.seatCategory')
                    ->whereIn('id', $seatIds)
                    ->lockForUpdate()
                    ->get();

                // 2. Validasi Kursi Ditemukan & Jumlah Sesuai
                if ($seats->isEmpty() || $seats->count() !== count($seatIds)) {
                    throw new \Exception('Beberapa kursi tidak valid atau sudah dihapus dari sistem.');
                }

                $totalAmount = 0;
                foreach ($seats as $seat) {
                    // 3. Validasi Kursi Belum Dibeli Orang Lain
                    if ($seat->status === 'sold' || $seat->order_id !== null) {
                        throw new \Exception('Maaf, kursi ' . ($seat->seatMaster->seat_code ?? '') . ' baru saja di-checkout oleh penonton lain.');
                    }
                    
                    $totalAmount += $seat->seatMaster->seatCategory?->price ?? 0;
                }

                if ($event->is_free) {
                    $totalAmount = 0;
                }

                // 4. Validasi Harga (Mencegah Order Rp 0 / Exploit)
                if (!$event->is_free && $totalAmount <= 0) {
                    throw new \Exception('Terjadi kesalahan perhitungan harga (Total Rp 0).');
                }

                $finalAmount = $totalAmount;

                $order = Order::create([
                    'order_code' => $orderCode,
                    'user_id' => Auth::id(),
                    'event_session_id' => $eventSession->id,
                    'bank_account_id' => $event->is_free ? null : $request->bank_account_id,
                    'total_amount' => $totalAmount,
                    'unique_code' => $uniqueCode,
                    'final_amount' => $finalAmount,
                    'status' => $event->is_free ? 'paid' : 'pending_payment',
                    'participants_data' => session('participants_data', []),
                    'expired_at' => $event->is_free ? now()->addYears(1) : now()->addHours($timeoutHours),
                ]);

                if ($event->is_free) {
                    // Create dummy payment
                    \App\Models\Payment::create([
                        'order_id' => $order->id,
                        'proof_path' => 'free_event_no_payment',
                        'sender_bank' => 'FREE',
                        'sender_name' => Auth::user()->name ?? 'Guest',
                        'transfer_amount' => 0,
                        'uploaded_at' => now(),
                        'verified_by' => Auth::id(),
                        'verified_at' => now(),
                    ]);

                    // Generate tickets immediately
                    $participantsData = session('participants_data', []);
                    $participantIndex = 0;
                    foreach ($seats as $seat) {
                        $seat->update([
                            'order_id' => $order->id,
                            'status' => 'sold',
                            'locked_until' => null,
                        ]);

                        $ticketCode = 'TKT-' . date('Ymd') . '-' . strtoupper(Str::random(6));
                        $qrHash = hash('sha256', $ticketCode . '-' . $seat->id . '-' . Str::random(12));
                        
                        $participant = $participantsData[$participantIndex] ?? null;

                        \App\Models\Ticket::create([
                            'ticket_code' => $ticketCode,
                            'qr_code_hash' => $qrHash,
                            'order_id' => $order->id,
                            'seat_availability_id' => $seat->id,
                            'status' => 'valid',
                            'participant_name' => $participant['name'] ?? null,
                            'participant_organization' => $participant['organization'] ?? null,
                        ]);
                        
                        $participantIndex++;
                    }
                } else {
                    // Assign order_id and set status = locked
                    foreach ($seats as $seat) {
                        $seat->update([
                            'order_id' => $order->id,
                            'status' => 'locked',
                            'locked_until' => $order->expired_at,
                        ]);
                    }
                }

                return $order;
            });
        } catch (\Exception $e) {
            // Bersihkan session jika gagal agar user tidak terus-terusan error
            session()->forget([
                'checkout_seat_ids', 
                'checkout_session_id', 
                'checkout_event_id', 
                'checkout_unique_code', 
                'checkout_final_amount',
                'user_locked_seat_ids_' . $eventSession->id
            ]);
            
            return redirect('/')->with('error', $e->getMessage());
        }

        // Clear checkout transient sessions
        session()->forget([
            'checkout_seat_ids', 
            'checkout_session_id', 
            'checkout_event_id', 
            'checkout_unique_code', 
            'checkout_final_amount',
            'user_locked_seat_ids_' . $eventSession->id
        ]);

        if ($event->is_free) {
            return redirect()->route('checkout.success', $order->order_code)->with('success', 'Tiket gratis berhasil diterbitkan!');
        }

        return redirect()->route('checkout.instructions', $order->order_code);
    }

    public function showPaymentInstructions($orderCode)
    {
        $order = Order::with(['eventSession.event.venue', 'bankAccount', 'seatAvailabilities.seatMaster.seatCategory', 'payment'])
            ->where('order_code', $orderCode)
            ->where('user_id', Auth::id())
            ->firstOrFail();

        // Check if expired (DIBEKUKAN SEMENTARA - Jangan batal otomatis)
        /*
        if ($order->status === 'pending_payment' && $order->expired_at < now()) {
            DB::transaction(function () use ($order) {
                $order->update(['status' => 'cancelled']);
                SeatAvailability::where('order_id', $order->id)
                    ->update([
                        'status' => 'available',
                        'order_id' => null,
                        'locked_until' => null,
                    ]);
            });
        }
        */

        // Kita tidak akan me-redirect pengguna ke halaman depan, 
        // melainkan membiarkan view merender UI khusus "Pesanan Dibatalkan".
        // if ($order->status === 'cancelled') {
        //     return redirect()->route('events.index')->with('error', 'Pesanan ' . $order->order_code . ' telah dibatalkan karena melewati batas waktu (expired).');
        // }

        if ($order->status === 'paid') {
            return redirect()->route('my-tickets.index')->with('success', 'Pembayaran untuk pesanan ' . $order->order_code . ' telah disetujui! E-Tiket Anda telah diterbitkan.');
        }

        return view('checkout.instructions', compact('order'));
    }

    public function uploadProof(Request $request, $orderCode)
    {
        $order = Order::where('order_code', $orderCode)
            ->where('user_id', Auth::id())
            ->firstOrFail();

        // DIBEKUKAN SEMENTARA: Biarkan user tetap bisa upload meski lewat batas waktu
        if ($order->status === 'cancelled') {
            return redirect()->route('events.index')->with('error', 'Pesanan ini sudah dibatalkan.');
        }

        $request->validate([
            'proof_file' => ['required', 'file', 'mimes:jpg,jpeg,png,pdf', 'max:10240'],
            'sender_bank' => ['required', 'string'],
            'sender_name' => ['required', 'string'],
        ], [
            'proof_file.required' => 'File bukti transfer wajib dipilih.',
            'proof_file.mimes' => 'File harus berupa gambar (JPG, PNG) atau PDF.',
            'proof_file.max' => 'Ukuran file maksimal 10MB.',
        ]);

        try {
            $file = $request->file('proof_file');
            
            // Simpan file ke local storage
            $path = $file->store('boro-payment-proofs', 'public');

            if (!$path) {
                throw new \Exception('Gagal menyimpan file ke local storage.');
            }

            DB::transaction(function () use ($order, $path, $request) {
                Payment::updateOrCreate(
                    ['order_id' => $order->id],
                    [
                        'proof_path' => $path,
                        'sender_bank' => $request->input('sender_bank'),
                        'sender_name' => $request->input('sender_name'),
                        'transfer_amount' => $order->final_amount,
                        'uploaded_at' => now(),
                    ]
                );

                \Illuminate\Support\Facades\DB::table('orders')->where('id', $order->id)->update([
                    'status' => 'waiting_verification',
                    'updated_at' => now(),
                ]);
            });

            return redirect()->route('checkout.success', $order->order_code)->with('success', 'Bukti transfer berhasil diunggah!');

        } catch (\Exception $e) {
            return redirect()->back()->withInput()->withErrors([
                'proof_file' => 'Gagal upload: ' . $e->getMessage()
            ]);
        }
    }



    public function showSuccess($orderCode)
    {
        $order = Order::with(['eventSession.event.venue', 'bankAccount', 'seatAvailabilities.seatMaster.seatCategory', 'payment'])
            ->where('order_code', $orderCode)
            ->where('user_id', Auth::id())
            ->firstOrFail();

        if ($order->status === 'paid') {
            return redirect()->route('my-tickets.index')->with('success', 'Pembayaran untuk pesanan ' . $order->order_code . ' telah disetujui! E-Tiket Anda telah diterbitkan.');
        }

        return view('checkout.success', compact('order'));
    }
}
