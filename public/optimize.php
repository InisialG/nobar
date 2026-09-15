<?php
/**
 * ============================================================
 * Boro Events — Server Optimizer Script
 * ============================================================
 * Menjalankan artisan commands langsung dari PHP tanpa exec()
 * ============================================================
 */

$token = $_GET['token'] ?? '';
if ($token !== 'boro2026') {
    http_response_code(403);
    die('⛔ Akses ditolak. Tambahkan ?token=boro2026 di URL.');
}

$basePath = dirname(__DIR__);

// Bootstrap Laravel
require $basePath . '/vendor/autoload.php';
$app = require_once $basePath . '/bootstrap/app.php';
$kernel = $app->make(\Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

$action = $_GET['action'] ?? 'optimize';

echo "<html><head><title>Boro Events Optimizer</title>";
echo "<style>body{font-family:'Segoe UI',sans-serif;max-width:700px;margin:40px auto;padding:20px;background:#1a1a2e;color:#e0e0e0;}";
echo "h1{color:#ffb200;} h2{color:#8B0000;background:#ffb200;padding:8px 16px;border-radius:8px;display:inline-block;margin-top:16px;}";
echo "pre{background:#16213e;padding:16px;border-radius:12px;overflow-x:auto;border:1px solid #333;font-size:13px;white-space:pre-wrap;}";
echo ".ok{color:#00e676;} .err{color:#ff5252;} .warn{color:#ffb200;}";
echo "a{color:#ffb200;text-decoration:none;padding:8px 16px;border:1px solid #ffb200;border-radius:8px;display:inline-block;margin:4px;}";
echo "a:hover{background:#ffb200;color:#1a1a2e;}</style></head><body>";

echo "<h1>🚀 Boro Events — Server Optimizer</h1>";
echo "<p>Base path: <code>{$basePath}</code></p>";
echo "<hr>";

echo "<p>";
echo "<a href='?token={$token}&action=optimize'>🔧 Optimize</a> ";
echo "<a href='?token={$token}&action=clear'>🧹 Clear Cache</a> ";
echo "<a href='?token={$token}&action=migrate'>📦 Migrate</a> ";
echo "<a href='?token={$token}&action=status'>📊 Status</a> ";
echo "</p><hr>";

function runCmd($command) {
    try {
        $exitCode = \Illuminate\Support\Facades\Artisan::call($command);
        $output = \Illuminate\Support\Facades\Artisan::output();
        return ['output' => trim($output), 'code' => $exitCode];
    } catch (\Throwable $e) {
        return ['output' => 'ERROR: ' . $e->getMessage(), 'code' => 1];
    }
}

function showResult($label, $result) {
    $class = $result['code'] === 0 ? 'ok' : 'err';
    echo "<h2>{$label}</h2>";
    echo "<pre class='{$class}'>" . htmlspecialchars($result['output'] ?: 'OK (no output)') . "</pre>";
}

switch ($action) {
    case 'optimize':
        showResult('Config Cache', runCmd('config:cache'));
        showResult('Route Cache', runCmd('route:cache'));
        showResult('View Cache', runCmd('view:cache'));
        showResult('Event Cache', runCmd('event:cache'));
        echo "<p class='ok'>✅ Semua cache berhasil di-build!</p>";
        break;

    case 'clear':
        showResult('Config Clear', runCmd('config:clear'));
        showResult('Route Clear', runCmd('route:clear'));
        showResult('View Clear', runCmd('view:clear'));
        showResult('Cache Clear', runCmd('cache:clear'));
        showResult('Event Clear', runCmd('event:clear'));
        echo "<p class='ok'>✅ Semua cache berhasil dihapus!</p>";
        break;

    case 'migrate':
        showResult('Migrate', runCmd('migrate --force'));
        break;

    case 'status':
        echo "<h2>📊 System Info</h2>";
        echo "<pre>";
        echo "PHP Version    : " . phpversion() . "\n";
        echo "Laravel Version: " . app()->version() . "\n";
        echo "APP_ENV        : " . config('app.env') . "\n";
        echo "APP_DEBUG      : " . (config('app.debug') ? 'true' : 'false') . "\n";
        echo "APP_URL        : " . config('app.url') . "\n";
        echo "DB_HOST        : " . config('database.connections.mysql.host') . "\n";
        echo "DB_PORT        : " . config('database.connections.mysql.port') . "\n";
        echo "DB_DATABASE    : " . config('database.connections.mysql.database') . "\n";
        echo "SESSION_DRIVER : " . config('session.driver') . "\n";
        echo "CACHE_STORE    : " . config('cache.default') . "\n";
        echo "QUEUE_CONN     : " . config('queue.default') . "\n";
        echo "upload_tmp_dir : " . ini_get('upload_tmp_dir') . "\n";
        echo "max_upload     : " . ini_get('upload_max_filesize') . "\n";
        echo "</pre>";

        echo "<h2>📁 Permissions</h2><pre>";
        $dirs = [
            'storage/app', 'storage/app/public',
            'storage/framework/cache', 'storage/framework/sessions',
            'storage/framework/views', 'storage/logs',
            'bootstrap/cache',
        ];
        foreach ($dirs as $dir) {
            $full = $basePath . '/' . $dir;
            $w = is_writable($full);
            echo ($w ? '✅' : '❌') . " {$dir} — " . ($w ? 'Writable' : 'NOT WRITABLE') . "\n";
        }
        echo "</pre>";

        echo "<h2>💾 Cache Status</h2><pre>";
        $checks = [
            'Config' => 'bootstrap/cache/config.php',
            'Routes' => 'bootstrap/cache/routes-v7.php',
            'Events' => 'bootstrap/cache/events.php',
        ];
        foreach ($checks as $label => $file) {
            $e = file_exists($basePath . '/' . $file);
            echo ($e ? '✅' : '⚠️') . " {$label} — " . ($e ? 'Cached' : 'Not cached') . "\n";
        }
        echo "</pre>";
        break;
}

echo "<hr><p class='warn'>⚠️ Hapus file ini setelah selesai!</p>";
echo "</body></html>";
