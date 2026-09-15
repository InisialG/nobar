<?php

namespace App\Filament\Resources\OrderResource\Pages;

use App\Filament\Resources\OrderResource;
use App\Models\SeatAvailability;
use App\Models\Ticket;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class CreateOrder extends CreateRecord
{
    protected static string $resource = OrderResource::class;
    
    public array $tempSelectedSeats = [];

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $data['order_code'] = 'NYA-' . date('Ymd') . '-' . strtoupper(Str::random(6));
        $data['unique_code'] = 0;
        $data['user_id'] = Auth::id();
        $data['status'] = 'paid';
        
        $data['final_amount'] = $data['total_amount'] ?? 0;
        $data['total_amount'] = $data['total_amount'] ?? 0;
        
        $data['expired_at'] = now()->addYears(1);
        
        if (isset($data['selected_seat_ids'])) {
            $this->tempSelectedSeats = $data['selected_seat_ids'];
            unset($data['selected_seat_ids']);
        }

        return $data;
    }

    protected function afterCreate(): void
    {
        $order = $this->record;
        
        $selectedSeatIds = $this->tempSelectedSeats;
        $participantsData = $order->participants_data ?? [];

        if (count($selectedSeatIds) > 0) {
            $seats = SeatAvailability::whereIn('id', $selectedSeatIds)->get();
            
            $participantIndex = 0;
            foreach ($seats as $seat) {
                $seat->update([
                    'order_id' => $order->id,
                    'status' => 'sold', 
                    'locked_until' => null,
                ]);

                $ticketCode = 'TKT-' . date('Ymd') . '-' . strtoupper(Str::random(6));
                $qrHash = hash('sha256', $ticketCode . '-' . $seat->id . '-' . Str::random(12));
                
                $participantName = 'Tamu VVIP';
                $participantOrg = 'VVIP';
                if (isset($participantsData[$participantIndex])) {
                    $participantName = $participantsData[$participantIndex]['name'] ?? 'Tamu VVIP';
                    $participantOrg = $participantsData[$participantIndex]['organization'] ?? 'VVIP';
                }

                Ticket::create([
                    'ticket_code' => $ticketCode,
                    'qr_code_hash' => $qrHash,
                    'order_id' => $order->id,
                    'seat_availability_id' => $seat->id,
                    'status' => 'valid',
                    'participant_name' => $participantName,
                    'participant_organization' => $participantOrg,
                ]);
                
                $participantIndex++;
            }
        } else {
            // Jika admin tidak memilih kursi, minimal buat 1 tiket VVIP atau sesuai jumlah (tapi form tidak ada jumlahnya)
            // Jadi buat 1 saja jika kosong
            if (empty($participantsData)) {
                $participantsData = [['name' => 'Tamu VVIP', 'organization' => 'VVIP']];
            }
            
            foreach ($participantsData as $participant) {
                $ticketCode = 'TKT-' . date('Ymd') . '-' . strtoupper(Str::random(6));
                $qrHash = hash('sha256', $ticketCode . '-NOSEAT-' . Str::random(12));

                Ticket::create([
                    'ticket_code' => $ticketCode,
                    'qr_code_hash' => $qrHash,
                    'order_id' => $order->id,
                    'seat_availability_id' => null,
                    'status' => 'valid',
                    'participant_name' => $participant['name'] ?? 'Tamu VVIP',
                    'participant_organization' => $participant['organization'] ?? 'VVIP',
                ]);
            }
        }

        \App\Models\Payment::create([
            'order_id' => $order->id,
            'proof_path' => 'admin_vvip_registration',
            'sender_bank' => 'ADMIN / VVIP',
            'sender_name' => Auth::user()->name ?? 'Admin',
            'transfer_amount' => $order->final_amount,
            'uploaded_at' => now(),
            'verified_by' => Auth::id(),
            'verified_at' => now(),
        ]);
    }

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
