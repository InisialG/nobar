<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role;

class LoginController extends Controller
{
    public function showLoginForm(Request $request)
    {
        return view('auth.login', [
            'event_slug' => $request->query('event'),
            'session_id' => $request->query('session')
        ]);
    }

    public function login(Request $request)
    {
        $request->validate([
            'phone_number' => ['required', 'string', 'max:20'],
            'participant_count' => ['required', 'integer', 'min:1', 'max:4'],
            'names' => ['required', 'array', 'min:1', 'max:4'],
            'names.*' => ['required', 'string', 'max:255'],
            'organizations' => ['required', 'array', 'min:1', 'max:4'],
            'organizations.*' => ['required', 'string', 'max:255'],
        ]);

        // Bersihkan spasi atau karakter non-angka pada nomor hp (opsional)
        $phone = preg_replace('/[^0-9]/', '', $request->phone_number);

        // Cari user berdasarkan no hp
        $user = User::where('phone_number', $phone)->first();
        $mainName = $request->names[0];

        // Jika belum ada, buat user baru
        if (!$user) {
            $user = User::create([
                'name' => $mainName,
                'phone_number' => $phone,
            ]);

            $userRole = Role::firstOrCreate(['name' => 'User', 'guard_name' => 'web']);
            $user->assignRole($userRole);
        } else {
            // Opsional: perbarui nama jika mereka memasukkan nama yang berbeda?
            // Uncomment baris di bawah jika ingin nama selalu di-update
            // $user->update(['name' => $mainName]);
        }

        Auth::login($user, $request->boolean('remember', true));

        // Format participant data
        $participantsData = [];
        for ($i = 0; $i < $request->participant_count; $i++) {
            $participantsData[] = [
                'name' => $request->names[$i] ?? 'Peserta ' . ($i+1),
                'organization' => $request->organizations[$i],
            ];
        }

        // Simpan jumlah peserta ke dalam session
        session([
            'participant_count' => $request->participant_count,
            'participants_data' => $participantsData
        ]);

        $request->session()->regenerate();

        if ($request->filled('event_slug') && $request->filled('session_id')) {
            return app(\App\Http\Controllers\CheckoutController::class)->processDirectRegistration(
                $request, 
                $request->event_slug, 
                $request->session_id
            );
        }

        return redirect()->intended('/')->with('success', 'Selamat datang!');
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect('/')->with('success', 'Anda telah keluar.');
    }
}
