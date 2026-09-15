# Panduan Deploy Boro-Events ke Server (Referensi dari admin-dhammatalk)

> Dokumen ini berisi konfigurasi server yang diambil dari project **admin-dhammatalk** yang **sudah berjalan** di server `viharaborobudur.org`. Gunakan sebagai acuan untuk men-deploy project **boro-events**.

---

## Informasi Server

| Item | Nilai |
|------|-------|
| **Domain** | `viharaborobudur.org` |
| **Port HTTP** | `16284` |
| **Port MySQL** | `16282` |
| **DB Username** | `boro` |
| **DB Password** | `buddh4Y4nav1510n` |
| **Web Server** | Apache (mod_rewrite aktif) |
| **PHP** | 8.2+ (CGI/FastCGI) |
| **Panel** | Kemungkinan CWP (CentOS Web Panel) atau semacamnya |

---

## 1. Struktur .htaccess

### 1a. Root `.htaccess` (di folder project utama)

File ini berfungsi untuk **mengarahkan semua request ke folder `public/`** secara otomatis, sehingga Anda tidak perlu menambahkan `/public` di URL.

```apache
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteRule ^(.*)$ public/$1 [L]
</IfModule>
```

> **Catatan untuk boro-events:** Project Anda saat ini memiliki root `.htaccess` yang berisi komentar saja (dinonaktifkan). Anda harus **menggantinya** dengan isi di atas agar routing ke `/public` berjalan otomatis.

### 1b. `public/.htaccess` (di dalam folder public)

File ini adalah standar Laravel untuk menangani routing:

```apache
<IfModule mod_rewrite.c>
    <IfModule mod_negotiation.c>
        Options -MultiViews -Indexes
    </IfModule>

    RewriteEngine On

    # Handle Authorization Header
    RewriteCond %{HTTP:Authorization} .
    RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]

    # Redirect Trailing Slashes If Not A Folder...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_URI} (.+)/$
    RewriteRule ^ %1 [L,R=301]

    # Send Requests To Front Controller...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^ index.php [L]
</IfModule>
```

> **Catatan untuk boro-events:** `public/.htaccess` Anda sudah memiliki rule tambahan untuk `storage-serve.php` dan `acme-challenge`. Pastikan rule-rule tersebut tetap ada karena dibutuhkan untuk serving file storage tanpa symlink.

---

## 2. File `public/index.php`

### Versi admin-dhammatalk (standar Laravel):
```php
<?php
use Illuminate\Http\Request;
define('LARAVEL_START', microtime(true));
if (file_exists($maintenance = __DIR__.'/../storage/framework/maintenance.php')) {
    require $maintenance;
}
require __DIR__.'/../vendor/autoload.php';
(require_once __DIR__.'/../bootstrap/app.php')
    ->handleRequest(Request::capture());
```

### Versi boro-events (sudah dimodifikasi):
```php
<?php
// Force PHP upload temp directory
@ini_set('upload_tmp_dir', '/tmp');
@ini_set('sys_temp_dir', '/tmp');

use Illuminate\Foundation\Application;
use Illuminate\Http\Request;
define('LARAVEL_START', microtime(true));
if (file_exists($maintenance = __DIR__.'/../storage/framework/maintenance.php')) {
    require $maintenance;
}
require __DIR__.'/../vendor/autoload.php';
$app = require_once __DIR__.'/../bootstrap/app.php';
$app->handleRequest(Request::capture());
```

> **Kesimpulan:** `index.php` boro-events sudah benar. Perbedaan hanya pada pengaturan `upload_tmp_dir` dan `sys_temp_dir` yang dibutuhkan karena partisi home read-only di server.

---

## 3. Konfigurasi `.env` untuk Server Produksi

Berdasarkan pola dari admin-dhammatalk, `.env` untuk boro-events di server harusnya:

```env
APP_NAME="Boro Events"
APP_ENV=production
APP_DEBUG=false
APP_TIMEZONE=Asia/Jakarta
APP_URL=http://viharaborobudur.org:16284/boro-events/public

APP_LOCALE=id
APP_FALLBACK_LOCALE=en
APP_FAKER_LOCALE=id_ID

APP_MAINTENANCE_DRIVER=file

BCRYPT_ROUNDS=12

LOG_CHANNEL=daily
LOG_STACK=daily
LOG_DEPRECATIONS_CHANNEL=null
LOG_LEVEL=error

DB_CONNECTION=mysql
DB_HOST=localhost
DB_PORT=16282
DB_DATABASE=boro_events
DB_USERNAME=boro
DB_PASSWORD=buddh4Y4nav1510n

SESSION_DRIVER=file
SESSION_LIFETIME=120
SESSION_ENCRYPT=false
SESSION_PATH=/
SESSION_DOMAIN=

BROADCAST_CONNECTION=log
FILESYSTEM_DISK=public
QUEUE_CONNECTION=sync

CACHE_STORE=file
CACHE_PREFIX=

MAIL_MAILER=log
```

> [!IMPORTANT]
> Perbedaan kritis dari `.env` lokal:
> - `APP_ENV=production` dan `APP_DEBUG=false` (WAJIB untuk keamanan!)
> - `DB_PORT=16282` (bukan 3306 standar)
> - `DB_USERNAME=boro` dan `DB_PASSWORD` sesuai server
> - `SESSION_DRIVER=file` (bukan `cookie`, lebih stabil di server)
> - `QUEUE_CONNECTION=sync` (lebih sederhana tanpa perlu worker)
> - `CACHE_STORE=file` (bukan `array`)

---

## 4. Konfigurasi PHP (`.user.ini`)

File `.user.ini` diperlukan karena tidak bisa menggunakan `php_value` di `.htaccess` (menyebabkan error 500).

Letakkan di **root project** dan juga di **folder `public/`**:

```ini
; PHP-FPM per-directory config untuk Boro Events
upload_tmp_dir = /tmp
sys_temp_dir = /tmp

; Upload & POST Limits
post_max_size = 20M
upload_max_filesize = 20M
max_file_uploads = 10

; Session
session.save_path = /tmp
```

> **Catatan:** File ini sudah ada di project boro-events. Pastikan tersalin ke server.

---

## 5. Perbedaan Penting antara Kedua Project

| Aspek | admin-dhammatalk | boro-events | Catatan |
|-------|-----------------|-------------|---------|
| **Root .htaccess** | ✅ Redirect ke `public/` | ❌ Dinonaktifkan | **Harus ditambahkan!** |
| **Storage** | Standar `storage:link` | `storage-serve.php` | Karena symlink tidak bisa dibuat di server |
| **Session Driver** | `file` | `cookie` (lokal) | Ubah ke `file` untuk server |
| **Queue** | `sync` | `database` (lokal) | Ubah ke `sync` jika tidak pakai worker |
| **Cache** | `file` | `array` (lokal) | Ubah ke `file` untuk server |
| **Upload temp** | Standar | `/tmp` (custom) | Diperlukan karena partisi read-only |

---

## 6. Langkah-Langkah Deploy

### Persiapan di Lokal (Sebelum Upload):
```bash
# 1. Install dependencies production
composer install --optimize-autoloader --no-dev

# 2. Cache konfigurasi
php artisan config:cache
php artisan route:cache
php artisan view:cache
```

### Di Server (Setelah Upload):
```bash
# 1. Generate key (jika belum)
C:\xampp82\php\php.exe artisan key:generate

# 2. Jalankan migrasi
C:\xampp82\php\php.exe artisan migrate --force

# 3. Bersihkan dan rebuild cache
C:\xampp82\php\php.exe artisan optimize:clear
C:\xampp82\php\php.exe artisan config:cache
C:\xampp82\php\php.exe artisan route:cache
C:\xampp82\php\php.exe artisan view:cache
```

### Pastikan Permission Folder:
Folder-folder berikut harus **writable** oleh web server:
- `storage/` (dan semua sub-folder)
- `bootstrap/cache/`

---

## 7. File Tambahan Khusus Boro-Events

Karena keterbatasan server (read-only filesystem, tidak bisa symlink), boro-events memiliki file-file tambahan ini yang **HARUS ikut di-deploy**:

| File | Fungsi |
|------|--------|
| `public/storage-serve.php` | Melayani file dari `storage/app/public/` tanpa symlink |
| `public/.user.ini` | Konfigurasi PHP per-directory |
| `.user.ini` (root) | Konfigurasi PHP per-directory |
| `public/.htaccess` | Routing + rule storage-serve |

---

## 8. URL Akses Setelah Deploy

Berdasarkan pola admin-dhammatalk (`http://viharaborobudur.org:16284/admin-dhammatalk/public`):

| Halaman | URL |
|---------|-----|
| **Homepage** | `http://viharaborobudur.org:16284/boro-events/public` |
| **Admin Panel** | `http://viharaborobudur.org:16284/boro-events/public/admin` |
| **Login** | `http://viharaborobudur.org:16284/boro-events/public/login` |

> [!TIP]
> Jika root `.htaccess` dengan redirect ke `public/` sudah aktif, maka URL bisa diakses tanpa `/public`:
> `http://viharaborobudur.org:16284/boro-events/`
