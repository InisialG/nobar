<?php
require __DIR__.'/vendor/autoload.php';
$app = require_once __DIR__.'/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use App\Models\User;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Hash;

$superAdminRole = Role::firstOrCreate(['name' => 'Super Admin', 'guard_name' => 'web']);
$panitiaRole = Role::firstOrCreate(['name' => 'Panitia', 'guard_name' => 'web']);
$userRole = Role::firstOrCreate(['name' => 'User', 'guard_name' => 'web']);

$superAdmin = User::updateOrCreate(
    ['email' => 'admin@borobudur.org'],
    [
        'name' => 'Super Admin',
        'password' => Hash::make('password123'),
        'email_verified_at' => now(),
    ]
);
$superAdmin->assignRole($superAdminRole);

$admin = User::updateOrCreate(
    ['email' => 'panitia@borobudur.org'],
    [
        'name' => 'Admin Panitia',
        'password' => Hash::make('password123'),
        'email_verified_at' => now(),
    ]
);
$admin->assignRole($panitiaRole);

$user = User::updateOrCreate(
    ['email' => 'penonton@borobudur.org'],
    [
        'name' => 'Penonton Biasa',
        'password' => Hash::make('password123'),
        'email_verified_at' => now(),
    ]
);
$user->assignRole($userRole);

echo "Users created successfully!\n";
