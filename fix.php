<?php
// ============================================================
// ALL-IN-ONE SQL DUMP FIXER untuk Shared Hosting / cPanel
// Mengatasi SEMUA masalah izin user terbatas
// ============================================================

echo "=== Memulai proses lengkap ===\n\n";

// STEP 1: Dump ulang dari database lokal
echo "[1/7] Dumping database dari lokal...\n";
exec('mysqldump -u root --skip-lock-tables --skip-add-locks boro_events 2>&1', $output, $code);
if ($code !== 0) {
    echo "GAGAL: " . implode("\n", $output) . "\n";
    exit(1);
}
$content = implode("\n", $output);
echo "  OK (" . number_format(strlen($content)) . " bytes)\n";

// STEP 2: Fix collation MySQL 8 -> kompatibel semua versi
echo "[2/7] Fixing collation...\n";
$content = str_replace('utf8mb4_0900_ai_ci', 'utf8mb4_unicode_ci', $content);
$content = str_replace('utf8mb3_general_ci', 'utf8_general_ci', $content);
$content = str_replace('utf8mb3', 'utf8', $content);

// STEP 3: Hapus DROP TABLE (user hosting tidak punya izin DROP)
echo "[3/7] Removing DROP TABLE...\n";
$content = preg_replace('/^DROP TABLE IF EXISTS `[^`]+`;\s*$/m', '', $content);

// STEP 4: CREATE TABLE -> CREATE TABLE IF NOT EXISTS
echo "[4/7] Adding IF NOT EXISTS...\n";
$content = str_replace('CREATE TABLE `', 'CREATE TABLE IF NOT EXISTS `', $content);

// STEP 5: INSERT INTO -> INSERT IGNORE INTO (skip duplikat, tanpa perlu izin DELETE)
echo "[5/7] Changing INSERT to INSERT IGNORE...\n";
$content = str_replace('INSERT INTO `', 'INSERT IGNORE INTO `', $content);

// STEP 6: Hapus LOCK/UNLOCK TABLES (sering ditolak shared hosting)
echo "[6/7] Removing LOCK/UNLOCK TABLES...\n";
$content = preg_replace('/^LOCK TABLES `[^`]+` WRITE;\s*$/m', '', $content);
$content = preg_replace('/^UNLOCK TABLES;\s*$/m', '', $content);

// STEP 7: Buat file final dengan header USE database
echo "[7/7] Writing final SQL file...\n";

$header  = "-- ============================================================\n";
$header .= "-- SQL Dump: boro_events\n";
$header .= "-- Kompatibel dengan: MySQL 5.7+, MySQL 8, MariaDB 10+\n";
$header .= "-- Aman untuk: Shared Hosting, cPanel, user terbatas\n";
$header .= "-- Generated: " . date('Y-m-d H:i:s') . "\n";
$header .= "-- ============================================================\n\n";
$header .= "SET NAMES utf8mb4;\n";
$header .= "SET FOREIGN_KEY_CHECKS = 0;\n";
$header .= "SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO';\n\n";

$footer  = "\n\nSET FOREIGN_KEY_CHECKS = 1;\n";

file_put_contents('boro_events.sql', $header . $content . $footer);

$finalSize = number_format(filesize('boro_events.sql'));
echo "\n=== SELESAI! ===\n";
echo "File: boro_events.sql ($finalSize bytes)\n";
echo "\nCATATAN PENTING:\n";
echo "- TIDAK ADA perintah DROP TABLE\n";
echo "- TIDAK ADA perintah LOCK/UNLOCK TABLES\n";
echo "- TIDAK ADA perintah REPLACE INTO (butuh izin DELETE)\n";
echo "- TIDAK ADA perintah CREATE DATABASE / USE\n";
echo "\n=> Di phpMyAdmin: KLIK DATABASE DULU di sidebar kiri, baru Import!\n";
