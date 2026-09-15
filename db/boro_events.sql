-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:16282
-- Waktu pembuatan: 15 Sep 2026 pada 08.03
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `boro_events`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_holder` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `bank_name`, `account_number`, `account_holder`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'BCA', '022-182-5658', 'Lembaga Pendidikan Nanyang Indonesia', 1, '2026-08-28 11:09:18', '2026-08-28 15:19:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `venue_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pertunjukan',
  `payment_verification_timeout_hours` int(11) NOT NULL DEFAULT 24,
  `status` enum('coming_soon','registration','ongoing','finished','draft','published','completed','cancelled') COLLATE utf8mb4_unicode_ci DEFAULT 'draft',
  `is_free` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `events`
--

INSERT INTO `events` (`id`, `venue_id`, `created_by`, `title`, `slug`, `poster_path`, `description`, `event_category`, `payment_verification_timeout_hours`, `status`, `is_free`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Pendataan Minat Kehadiran – Nobar & Reuni Keluarga Besar PMVB dan Sekber PMVBI', 'shine-in-harmony', 'boro-event-posters/01M2A1X6QYSJQDZK04EHTCT8RG.jpeg', '<p>Celebrating a cherished tradition and honoring the rich cultural tapestry of the Mid-Autumn Festival through music, dance, and verse.</p><p><strong>Penyelenggara:</strong> Nanyang Zhi Hui Modern Indonesian School</p><p><strong>Syarat &amp; Ketentuan:</strong></p><ul><li><p>Penonton wajib hadir 30 menit sebelum sesi pertunjukan dimulai.</p></li><li><p>E-tiket ber-QR code wajib ditunjukkan kepada petugas pintu masuk venue.</p></li><li><p>Dilarang membawa makanan dan minuman dari luar ke dalam Auditorium.</p></li></ul>', 'Pertunjukan', 24, 'registration', 1, '2026-08-28 11:09:18', '2026-09-12 05:37:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `event_sessions`
--

CREATE TABLE `event_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `session_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `event_sessions`
--

INSERT INTO `event_sessions` (`id`, `event_id`, `session_date`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(1, 1, '2026-10-04', '14:00:00', '16:30:00', '2026-08-28 11:09:18', '2026-09-11 08:18:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"a06a841e-72a8-4e08-869a-cabb85b5e493\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:89;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:22:\\\"pikkopokki93@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(2, 'default', '{\"uuid\":\"9918121d-96bb-4840-8575-b4d6899f7eb3\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:97;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:21:\\\"yoemichelle@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(3, 'default', '{\"uuid\":\"86ae2ba5-93e2-4a58-a1fd-d6276f7d17e2\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:98;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:23:\\\"k00791@nanyangzh.sch.id\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(4, 'default', '{\"uuid\":\"32c19181-4316-47f8-b1c9-560e45dfd6bc\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:99;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:16:\\\"slencd@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(5, 'default', '{\"uuid\":\"bb5fad0d-0071-4bf0-babd-34f96e633032\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:100;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:24:\\\"fergus_anangga@yahoo.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(6, 'default', '{\"uuid\":\"cf070462-55cb-4075-a2a1-8669a39bf8d8\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:101;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:18:\\\"akhunsmp@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(7, 'default', '{\"uuid\":\"d62ccb30-862d-427a-a668-e61a87e41c3f\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:102;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:18:\\\"sylviakw@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(8, 'default', '{\"uuid\":\"86ff138e-689c-4581-b2b3-3859d432aade\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:103;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:20:\\\"msgmelissa@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(9, 'default', '{\"uuid\":\"ed379cd4-2330-439c-ac6b-e8d7775b4cea\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:104;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:26:\\\"apriadi.generali@yahoo.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(10, 'default', '{\"uuid\":\"e8f5aa6b-5a75-4aee-82ec-24debca20c75\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:105;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"sally.cintya123@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(11, 'default', '{\"uuid\":\"12feaef0-75fc-411a-bc35-25e681eae52a\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:106;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:16:\\\"toesta@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(12, 'default', '{\"uuid\":\"397f5af7-909e-497a-9161-5084474d1904\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:108;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:19:\\\"subasni50@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(13, 'default', '{\"uuid\":\"e0d3cbff-23e2-44ff-83c8-f7e8d15fe2f5\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:109;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:23:\\\"yenny.yen1984@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(14, 'default', '{\"uuid\":\"3b5d7564-c92d-4466-8d5e-f9fea48d7711\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:110;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:22:\\\"lenny.ruslee@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(15, 'default', '{\"uuid\":\"e6371ffc-f443-4b68-8707-de6eae89b786\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:111;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:26:\\\"fredericfred1806@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(16, 'default', '{\"uuid\":\"69e3f758-7a2e-487a-8f38-a87de7a27d1a\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:112;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:22:\\\"01051@nanyangzh.sch.id\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(17, 'default', '{\"uuid\":\"3f655acb-a526-4225-910f-85e4f4d1453a\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:113;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:22:\\\"frengkypeter@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(18, 'default', '{\"uuid\":\"a50c4092-2781-4171-9d69-3fb60db65a7e\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:115;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:26:\\\"edwinraymond.box@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(19, 'default', '{\"uuid\":\"d61fa9dc-95f7-4d58-9d2f-9a5eee2317d7\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:116;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:19:\\\"vlnciaong@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(20, 'default', '{\"uuid\":\"18f777af-dc0a-4099-8c8f-4be79b591831\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:117;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:23:\\\"imelda.adrian@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(21, 'default', '{\"uuid\":\"543b69a6-fd26-4708-b977-741024ea65f8\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:118;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"chlorececharles@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(22, 'default', '{\"uuid\":\"6e1ba06d-dcdb-47be-ab28-5dcabb0d4186\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:119;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"cindy.tiofani25@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(23, 'default', '{\"uuid\":\"2bbde2b4-8ce4-463f-a796-aa6eb6918f81\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:120;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:23:\\\"hikari_nana90@yahoo.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(24, 'default', '{\"uuid\":\"7da0fa1f-6e5c-41bd-b6c7-c01521c37b63\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:121;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:20:\\\"chikischen@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(25, 'default', '{\"uuid\":\"2ebea3a4-0497-4bdd-89e2-7f0e5f1b5361\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:122;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:19:\\\"free_4yin@yahoo.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(26, 'default', '{\"uuid\":\"6fbd3bbe-70bc-4299-9722-c23e2ef2f773\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:123;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:22:\\\"anggiesoniah@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(27, 'default', '{\"uuid\":\"6082d4e8-a8a1-41f1-aa58-997a65e8bc76\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:124;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:22:\\\"01027@nanyangzh.sch.id\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(28, 'default', '{\"uuid\":\"35f5b118-6589-468f-8b06-630d3e07ae88\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:125;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:22:\\\"01089@nanyangzh.sch.id\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(29, 'default', '{\"uuid\":\"f52f7734-e96d-49ba-8859-bcf03b9b54e2\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:126;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:19:\\\"come_yapz@yahoo.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(30, 'default', '{\"uuid\":\"32b4550a-569f-41d1-929f-aca3298a9cf1\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:127;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:24:\\\"subscriptionoh@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(31, 'default', '{\"uuid\":\"0679b962-4992-4a11-94dd-1f92d8cfcad1\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:129;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:21:\\\"connielie87@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(32, 'default', '{\"uuid\":\"87a44528-ad82-4e0a-a40e-551afc518f29\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:130;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:24:\\\"suniatytunggal@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(33, 'default', '{\"uuid\":\"eb5594f8-2795-477d-8201-f19ec84eb620\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:131;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:19:\\\"Viviunsri@yahoo.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(34, 'default', '{\"uuid\":\"0caa6f5d-5417-4342-a7f8-5422604a0a3c\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:132;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:22:\\\"00956@nanyangzh.sch.id\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(35, 'default', '{\"uuid\":\"bd0c71dd-153a-47b0-8cf2-ffa053b38838\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:133;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:18:\\\"jonyxu81@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(36, 'default', '{\"uuid\":\"0c2ad416-7d9c-4985-bb3a-f9ac6b57c4d9\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:134;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:22:\\\"00910@nanyangzh.sch.id\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(37, 'default', '{\"uuid\":\"741724e3-a629-461b-97a2-8cd10c300ff9\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:135;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:29:\\\"dialusi.simanjuntak@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(38, 'default', '{\"uuid\":\"dfe4dc4d-9151-4640-970b-139501817a7a\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:136;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:17:\\\"hchua85@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(39, 'default', '{\"uuid\":\"7c2318fd-f7be-4916-9bd0-2204c0bd9969\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:137;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:18:\\\"ikchan88@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(40, 'default', '{\"uuid\":\"45ff3761-89cd-4830-a18a-5a7bf2816fc2\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:138;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"Sarah_taniady@hotmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(41, 'default', '{\"uuid\":\"8ee7611c-1f63-4269-bdd9-efdca9a1ac35\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:140;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:21:\\\"julieneo208@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(42, 'default', '{\"uuid\":\"f9059315-e55a-481b-a4c3-5cdba74ba281\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:141;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:23:\\\"n00262@nanyangzh.sch.id\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(43, 'default', '{\"uuid\":\"9d8a9589-999f-42a7-b172-936db66560c4\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:143;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:17:\\\"hemdurr@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(44, 'default', '{\"uuid\":\"a4dbdec9-9da5-4b8b-bdfc-1949d6502864\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:145;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:24:\\\"chin.liadinata@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(45, 'default', '{\"uuid\":\"e5fb1c0c-0d97-4e85-ac78-2ba382c003b2\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:147;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:23:\\\"n00267@nanyangzh.sch.id\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(46, 'default', '{\"uuid\":\"6b22a4a0-ba53-482c-a38a-b0ff0db767e7\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:148;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:19:\\\"winedwin7@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(47, 'default', '{\"uuid\":\"c58197f1-8017-4920-925c-606403847d5d\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:149;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:21:\\\"kokoodidik7@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(48, 'default', '{\"uuid\":\"7bf20f59-c459-49bb-8295-f8bcdb3b0021\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:150;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:22:\\\"ingridas1882@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(49, 'default', '{\"uuid\":\"ad924295-7ca6-4734-ae4b-9b6fe3c89347\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:151;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:27:\\\"hendrawijaya19891@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(50, 'default', '{\"uuid\":\"21c1bb29-fae5-458f-a1d2-99f0f2679829\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:153;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:22:\\\"nixonrandy13@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(51, 'default', '{\"uuid\":\"e84641d4-7e7f-4cd3-838d-1d13d65899d1\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:154;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:27:\\\"arwinmisheal00212@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(52, 'default', '{\"uuid\":\"29ffd435-4fa5-40bb-9e1e-38a5d844fa02\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:155;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:23:\\\"silvianadwita@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(53, 'default', '{\"uuid\":\"05bf49c1-c72f-4ed1-aa5c-bc86c5da34dc\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:156;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:24:\\\"williamlie2888@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(54, 'default', '{\"uuid\":\"b26bf6be-6f8f-4ec4-b79a-d21139dccec9\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:157;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:20:\\\"irenepohar@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(55, 'default', '{\"uuid\":\"ffed2aec-9f30-4403-9a9e-2b9f736efbd3\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:158;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:27:\\\"evelyn.wijaya2808@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(56, 'default', '{\"uuid\":\"568fe777-05df-4396-93b7-91156a6e5832\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:159;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:18:\\\"sesewu82@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(57, 'default', '{\"uuid\":\"06530b7d-19cb-4b84-934a-e68ee32ee409\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:160;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:27:\\\"hendrawijaya19891@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(58, 'default', '{\"uuid\":\"ebedf355-5e27-4db0-8e5c-f3040db02684\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:162;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:21:\\\"liz.lie.cia@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(59, 'default', '{\"uuid\":\"bceb9e1b-dd0b-43da-953a-7ffb12d0e384\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:163;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:19:\\\"Viviunsri@yahoo.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(60, 'default', '{\"uuid\":\"b42434bd-83c0-4c32-8f0c-17d40641bd6a\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:164;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:22:\\\"gardeniongko@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(61, 'default', '{\"uuid\":\"11ab9108-7852-4f5a-b907-53c8b44a354e\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:166;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:24:\\\"permaisiato143@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(62, 'default', '{\"uuid\":\"1fb7c26d-ad22-42e5-9699-8b2fb7a3148b\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:167;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:22:\\\"angel.chusno@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(63, 'default', '{\"uuid\":\"10f20f10-5024-4bd5-a0c3-2a261bd96845\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:169;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:18:\\\"pinqchuu@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(64, 'default', '{\"uuid\":\"3a27ef84-bab5-4a26-a72f-061afab89d42\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:173;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:21:\\\"wieny280784@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(65, 'default', '{\"uuid\":\"1ccf18ec-be58-4b8b-962e-691b546d6450\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:174;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:22:\\\"00564@nanyangzh.sch.id\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915),
(66, 'default', '{\"uuid\":\"ead4833e-6580-4187-b793-6bffce675cc0\",\"displayName\":\"App\\\\Mail\\\\TicketApprovedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\TicketApprovedMail\\\":3:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:175;s:9:\\\"relations\\\";a:9:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";i:2;s:12:\\\"eventSession\\\";i:3;s:18:\\\"eventSession.event\\\";i:4;s:24:\\\"eventSession.event.venue\\\";i:5;s:7:\\\"tickets\\\";i:6;s:24:\\\"tickets.seatAvailability\\\";i:7;s:35:\\\"tickets.seatAvailability.seatMaster\\\";i:8;s:48:\\\"tickets.seatAvailability.seatMaster.seatCategory\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:22:\\\"01047@nanyangzh.sch.id\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1788413915,\"delay\":null}', 0, NULL, 1788413915, 1788413915);

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_08_15_021354_create_permission_tables', 1),
(5, '2026_08_15_021500_add_google_auth_to_users_table', 1),
(6, '2026_08_15_022000_create_venues_table', 1),
(7, '2026_08_15_022001_create_seat_categories_table', 1),
(8, '2026_08_15_022002_create_seat_masters_table', 1),
(9, '2026_08_15_023000_create_events_table', 1),
(10, '2026_08_15_023001_create_event_sessions_table', 1),
(11, '2026_08_15_023002_create_seat_availabilities_table', 1),
(12, '2026_08_15_023003_create_bank_accounts_table', 1),
(13, '2026_08_15_024000_create_orders_table', 1),
(14, '2026_08_15_024001_create_payments_table', 1),
(15, '2026_08_15_025000_create_tickets_table', 1),
(16, '2026_09_04_084941_add_user_id_to_seat_availabilities_table', 2),
(17, '2026_09_09_121157_add_is_free_to_events_table', 3),
(18, '2026_09_09_145631_modify_users_table_for_phone_login', 4),
(19, '2026_09_11_113532_add_participants_data_to_orders_table', 5),
(20, '2026_09_11_114437_make_seat_availability_id_nullable_on_tickets_table', 6),
(21, '2026_09_11_121318_add_participant_details_to_tickets_table', 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 225),
(3, 'App\\Models\\User', 226),
(3, 'App\\Models\\User', 227),
(3, 'App\\Models\\User', 228),
(3, 'App\\Models\\User', 229),
(3, 'App\\Models\\User', 230),
(3, 'App\\Models\\User', 231);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `event_session_id` bigint(20) UNSIGNED NOT NULL,
  `bank_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `unique_code` int(11) NOT NULL DEFAULT 0,
  `final_amount` decimal(12,2) NOT NULL,
  `status` enum('pending_payment','waiting_verification','paid','cancelled','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending_payment',
  `participants_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`participants_data`)),
  `expired_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `order_code`, `user_id`, `event_session_id`, `bank_account_id`, `total_amount`, `unique_code`, `final_amount`, `status`, `participants_data`, `expired_at`, `created_at`, `updated_at`) VALUES
(193, 'NYA-20260911-6EVYFA', 1, 1, NULL, '0.00', 0, '0.00', 'paid', NULL, '2027-09-11 07:28:26', '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(194, 'NYA-20260911-GC8QEG', 226, 1, NULL, '0.00', 0, '0.00', 'paid', '[{\"name\":\"test 1\",\"organization\":\"Keluarga Besar PMVB\"},{\"name\":\"test 2\",\"organization\":\"Sekber PMVBI\"}]', '2027-09-11 07:58:05', '2026-09-11 07:58:05', '2026-09-11 07:58:05'),
(195, 'NYA-20260911-MBQ9AJ', 227, 1, NULL, '0.00', 0, '0.00', 'paid', '[{\"name\":\"gagfda\",\"organization\":\"Keluarga Besar PMVB\"}]', '2027-09-11 08:52:53', '2026-09-11 08:52:53', '2026-09-11 08:52:53'),
(196, 'NYA-20260911-1FPYM8', 228, 1, NULL, '0.00', 0, '0.00', 'paid', '[{\"name\":\"Testing\",\"organization\":\"Keluarga Besar PMVB\"}]', '2027-09-11 08:57:51', '2026-09-11 08:57:51', '2026-09-11 08:57:51'),
(197, 'NYA-20260911-XN0C9U', 229, 1, NULL, '0.00', 0, '0.00', 'paid', '[{\"name\":\"TES\",\"organization\":\"Keluarga Besar PMVB\"}]', '2027-09-11 09:47:32', '2026-09-11 09:47:32', '2026-09-11 09:47:32'),
(198, 'NYA-20260914-HZWZFY', 230, 1, NULL, '0.00', 0, '0.00', 'paid', '[{\"name\":\"betty bakely\",\"organization\":\"Keluarga Besar PMVB\"},{\"name\":\"hendry nauli\",\"organization\":\"Keluarga Besar PMVB\"}]', '2027-09-14 13:18:14', '2026-09-14 13:18:14', '2026-09-14 13:18:14'),
(199, 'NYA-20260914-FN6QTU', 231, 1, NULL, '0.00', 0, '0.00', 'paid', '[{\"name\":\"Linda\",\"organization\":\"Keluarga Besar PMVB\"}]', '2027-09-14 15:20:29', '2026-09-14 15:20:29', '2026-09-14 15:20:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('nixonrandy13@gmail.com', '$2y$12$BVLjgFQmluTesDQmoL8n4OfCsE759lnKtF1IZYhi8xl/frXl65H5K', '2026-09-02 10:12:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `proof_path` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_bank` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfer_amount` decimal(12,2) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `verified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `verified_at` timestamp NULL DEFAULT NULL,
  `rejection_reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `proof_path`, `sender_bank`, `sender_name`, `transfer_amount`, `uploaded_at`, `verified_by`, `verified_at`, `rejection_reason`, `created_at`, `updated_at`) VALUES
(168, 193, 'admin_vvip_registration', 'ADMIN / VVIP', 'Super Admin Nanya Events', '0.00', '2026-09-11 07:28:26', 1, '2026-09-11 07:28:26', NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(169, 194, 'direct_registration_no_payment', 'FREE/DIRECT', 'test 1', '0.00', '2026-09-11 07:58:05', 226, '2026-09-11 07:58:05', NULL, '2026-09-11 07:58:05', '2026-09-11 07:58:05'),
(170, 195, 'direct_registration_no_payment', 'FREE/DIRECT', 'gagfda', '0.00', '2026-09-11 08:52:53', 227, '2026-09-11 08:52:53', NULL, '2026-09-11 08:52:53', '2026-09-11 08:52:53'),
(171, 196, 'direct_registration_no_payment', 'FREE/DIRECT', 'Testing', '0.00', '2026-09-11 08:57:51', 228, '2026-09-11 08:57:51', NULL, '2026-09-11 08:57:51', '2026-09-11 08:57:51'),
(172, 197, 'direct_registration_no_payment', 'FREE/DIRECT', 'TES', '0.00', '2026-09-11 09:47:32', 229, '2026-09-11 09:47:32', NULL, '2026-09-11 09:47:32', '2026-09-11 09:47:32'),
(173, 198, 'direct_registration_no_payment', 'FREE/DIRECT', 'betty bakely', '0.00', '2026-09-14 13:18:14', 230, '2026-09-14 13:18:14', NULL, '2026-09-14 13:18:14', '2026-09-14 13:18:14'),
(174, 199, 'direct_registration_no_payment', 'FREE/DIRECT', 'Linda', '0.00', '2026-09-14 15:20:29', 231, '2026-09-14 15:20:29', NULL, '2026-09-14 15:20:29', '2026-09-14 15:20:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', '2026-08-28 11:09:17', '2026-08-28 11:09:17'),
(2, 'Admin', 'web', '2026-08-28 11:09:17', '2026-08-28 11:09:17'),
(3, 'User', 'web', '2026-08-28 11:09:17', '2026-08-28 11:09:17'),
(4, 'Panitia', 'web', '2026-09-09 08:30:18', '2026-09-09 08:30:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `seat_availabilities`
--

CREATE TABLE `seat_availabilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_session_id` bigint(20) UNSIGNED NOT NULL,
  `seat_master_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('available','locked','sold') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'available',
  `locked_until` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `seat_availabilities`
--

INSERT INTO `seat_availabilities` (`id`, `event_session_id`, `seat_master_id`, `order_id`, `user_id`, `status`, `locked_until`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(2, 1, 2, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(3, 1, 3, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(4, 1, 4, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(5, 1, 5, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(6, 1, 6, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(7, 1, 7, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(8, 1, 8, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(9, 1, 9, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(10, 1, 10, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(11, 1, 11, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(12, 1, 12, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(13, 1, 13, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(14, 1, 14, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(15, 1, 15, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(16, 1, 16, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(17, 1, 17, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(18, 1, 18, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(19, 1, 19, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(20, 1, 20, 197, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 09:58:42'),
(21, 1, 21, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(22, 1, 22, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(23, 1, 23, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(24, 1, 24, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(25, 1, 25, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(26, 1, 26, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(27, 1, 27, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(28, 1, 28, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(29, 1, 29, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(30, 1, 30, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(31, 1, 31, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(32, 1, 32, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(33, 1, 33, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(34, 1, 34, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(35, 1, 35, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(36, 1, 36, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(37, 1, 37, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(38, 1, 38, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(39, 1, 39, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(40, 1, 40, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(41, 1, 41, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(42, 1, 42, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(43, 1, 43, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(44, 1, 44, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(45, 1, 45, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(46, 1, 46, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(47, 1, 47, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(48, 1, 48, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(49, 1, 49, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(50, 1, 50, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(51, 1, 51, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(52, 1, 52, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(53, 1, 53, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(54, 1, 54, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(55, 1, 55, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(56, 1, 56, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(57, 1, 57, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(58, 1, 58, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(59, 1, 59, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(60, 1, 60, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(61, 1, 61, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(62, 1, 62, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(63, 1, 63, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(64, 1, 64, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(65, 1, 65, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(66, 1, 66, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(67, 1, 67, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(68, 1, 68, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(69, 1, 69, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(70, 1, 70, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(71, 1, 71, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(72, 1, 72, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(73, 1, 73, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(74, 1, 74, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(75, 1, 75, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(76, 1, 76, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(77, 1, 77, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(78, 1, 78, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(79, 1, 79, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(80, 1, 80, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(81, 1, 81, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(82, 1, 82, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(83, 1, 83, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(84, 1, 84, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(85, 1, 85, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(86, 1, 86, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(87, 1, 87, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(88, 1, 88, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(89, 1, 89, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(90, 1, 90, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(91, 1, 91, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(92, 1, 92, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(93, 1, 93, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(94, 1, 94, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(95, 1, 95, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(96, 1, 96, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(97, 1, 97, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(98, 1, 98, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(99, 1, 99, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(100, 1, 100, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(101, 1, 101, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(102, 1, 102, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(103, 1, 103, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(104, 1, 104, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(105, 1, 105, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(106, 1, 106, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(107, 1, 107, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(108, 1, 108, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(109, 1, 109, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(110, 1, 110, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(111, 1, 111, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(112, 1, 112, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(113, 1, 113, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(114, 1, 114, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(115, 1, 115, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(116, 1, 116, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(117, 1, 117, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(118, 1, 118, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(119, 1, 119, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(120, 1, 120, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(121, 1, 121, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(122, 1, 122, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(123, 1, 123, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(124, 1, 124, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(125, 1, 125, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(126, 1, 126, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(127, 1, 127, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(128, 1, 128, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(129, 1, 129, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(130, 1, 130, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(131, 1, 131, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(132, 1, 132, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(133, 1, 133, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(134, 1, 134, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(135, 1, 135, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(136, 1, 136, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(137, 1, 137, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(138, 1, 138, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(139, 1, 139, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(140, 1, 140, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(141, 1, 141, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(142, 1, 142, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(143, 1, 143, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(144, 1, 144, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(145, 1, 145, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(146, 1, 146, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(147, 1, 147, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(148, 1, 148, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(149, 1, 149, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(150, 1, 150, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(151, 1, 151, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(152, 1, 152, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(153, 1, 153, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(154, 1, 154, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(155, 1, 155, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(156, 1, 156, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(157, 1, 157, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(158, 1, 158, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(159, 1, 159, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(160, 1, 160, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(161, 1, 161, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(162, 1, 162, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(163, 1, 163, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(164, 1, 164, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(165, 1, 165, 194, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:59:55'),
(166, 1, 166, 194, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 08:00:06'),
(167, 1, 167, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(168, 1, 168, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(169, 1, 169, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(170, 1, 170, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(171, 1, 171, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(172, 1, 172, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(173, 1, 173, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(174, 1, 174, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(175, 1, 175, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(176, 1, 176, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(177, 1, 177, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(178, 1, 178, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(179, 1, 179, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(180, 1, 180, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(181, 1, 181, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(182, 1, 182, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(183, 1, 183, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(184, 1, 184, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(185, 1, 185, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(186, 1, 186, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(187, 1, 187, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(188, 1, 188, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(189, 1, 189, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(190, 1, 190, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(191, 1, 191, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(192, 1, 192, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(193, 1, 193, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(194, 1, 194, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(195, 1, 195, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(196, 1, 196, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(197, 1, 197, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(198, 1, 198, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(199, 1, 199, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(200, 1, 200, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(201, 1, 201, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(202, 1, 202, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(203, 1, 203, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(204, 1, 204, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(205, 1, 205, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(206, 1, 206, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(207, 1, 207, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(208, 1, 208, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(209, 1, 209, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(210, 1, 210, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(211, 1, 211, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(212, 1, 212, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(213, 1, 213, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(214, 1, 214, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(215, 1, 215, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(216, 1, 216, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(217, 1, 217, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(218, 1, 218, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(219, 1, 219, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(220, 1, 220, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(221, 1, 221, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(222, 1, 222, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(223, 1, 223, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(224, 1, 224, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(225, 1, 225, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(226, 1, 226, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(227, 1, 227, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(228, 1, 228, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(229, 1, 229, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(230, 1, 230, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(231, 1, 231, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(232, 1, 232, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(233, 1, 233, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(234, 1, 234, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(235, 1, 235, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(236, 1, 236, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(237, 1, 237, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(238, 1, 238, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(239, 1, 239, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(240, 1, 240, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(241, 1, 241, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(242, 1, 242, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(243, 1, 243, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(244, 1, 244, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(245, 1, 245, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(246, 1, 246, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(247, 1, 247, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(248, 1, 248, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(249, 1, 249, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(250, 1, 250, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(251, 1, 251, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(252, 1, 252, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(253, 1, 253, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(254, 1, 254, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(255, 1, 255, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(256, 1, 256, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(257, 1, 257, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(258, 1, 258, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(259, 1, 259, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(260, 1, 260, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(261, 1, 261, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(262, 1, 262, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(263, 1, 263, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(264, 1, 264, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(265, 1, 265, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(266, 1, 266, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(267, 1, 267, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(268, 1, 268, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(269, 1, 269, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(270, 1, 270, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(271, 1, 271, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(272, 1, 272, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(273, 1, 273, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(274, 1, 274, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(275, 1, 275, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(276, 1, 276, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(277, 1, 277, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(278, 1, 278, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(279, 1, 279, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(280, 1, 280, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(281, 1, 281, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(282, 1, 282, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(283, 1, 283, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(284, 1, 284, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(285, 1, 285, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(286, 1, 286, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(287, 1, 287, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(288, 1, 288, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(289, 1, 289, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(290, 1, 290, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(291, 1, 291, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(292, 1, 292, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(293, 1, 293, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(294, 1, 294, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(295, 1, 295, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(296, 1, 296, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(297, 1, 297, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(298, 1, 298, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(299, 1, 299, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(300, 1, 300, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(301, 1, 301, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(302, 1, 302, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(303, 1, 303, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(304, 1, 304, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(305, 1, 305, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(306, 1, 306, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(307, 1, 307, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(308, 1, 308, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(309, 1, 309, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(310, 1, 310, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(311, 1, 311, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(312, 1, 312, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(313, 1, 313, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(314, 1, 314, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(315, 1, 315, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(316, 1, 316, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(317, 1, 317, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(318, 1, 318, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(319, 1, 319, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(320, 1, 320, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(321, 1, 321, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(322, 1, 322, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(323, 1, 323, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(324, 1, 324, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(325, 1, 325, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(326, 1, 326, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(327, 1, 327, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(328, 1, 328, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(329, 1, 329, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(330, 1, 330, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(331, 1, 331, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(332, 1, 332, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(333, 1, 333, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(334, 1, 334, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(335, 1, 335, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(336, 1, 336, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(337, 1, 337, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(338, 1, 338, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(339, 1, 339, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(340, 1, 340, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(341, 1, 341, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(342, 1, 342, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(343, 1, 343, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(344, 1, 344, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(345, 1, 345, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(346, 1, 346, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(347, 1, 347, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(348, 1, 348, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(349, 1, 349, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(350, 1, 350, 193, NULL, 'sold', NULL, '2026-08-28 11:09:18', '2026-09-11 07:28:26'),
(351, 1, 351, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(352, 1, 352, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(353, 1, 353, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(354, 1, 354, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(355, 1, 355, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(356, 1, 356, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(357, 1, 357, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(358, 1, 358, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(359, 1, 359, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(360, 1, 360, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(361, 1, 361, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(362, 1, 362, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(363, 1, 363, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(364, 1, 364, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(365, 1, 365, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(366, 1, 366, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(367, 1, 367, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(368, 1, 368, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(369, 1, 369, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(370, 1, 370, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(371, 1, 371, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(372, 1, 372, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(373, 1, 373, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(374, 1, 374, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(375, 1, 375, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(376, 1, 376, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(377, 1, 377, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(378, 1, 378, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(379, 1, 379, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(380, 1, 380, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(381, 1, 381, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(382, 1, 382, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(383, 1, 383, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(384, 1, 384, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(385, 1, 385, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(386, 1, 386, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(387, 1, 387, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(388, 1, 388, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(389, 1, 389, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(390, 1, 390, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(391, 1, 391, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(392, 1, 392, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(393, 1, 393, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(394, 1, 394, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(395, 1, 395, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(396, 1, 396, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(397, 1, 397, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(398, 1, 398, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(399, 1, 399, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(400, 1, 400, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(401, 1, 401, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(402, 1, 402, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(403, 1, 403, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(404, 1, 404, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(405, 1, 405, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(406, 1, 406, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(407, 1, 407, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(408, 1, 408, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(409, 1, 409, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(410, 1, 410, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(411, 1, 411, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(412, 1, 412, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(413, 1, 413, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(414, 1, 414, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(415, 1, 415, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(416, 1, 416, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(417, 1, 417, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(418, 1, 418, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(419, 1, 419, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(420, 1, 420, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(421, 1, 421, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(422, 1, 422, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(423, 1, 423, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(424, 1, 424, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(425, 1, 425, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(426, 1, 426, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(427, 1, 427, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(428, 1, 428, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(429, 1, 429, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(430, 1, 430, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(431, 1, 431, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(432, 1, 432, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(433, 1, 433, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(434, 1, 434, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(435, 1, 435, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(436, 1, 436, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(437, 1, 437, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(438, 1, 438, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(439, 1, 439, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(440, 1, 440, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(441, 1, 441, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(442, 1, 442, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(443, 1, 443, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(444, 1, 444, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(445, 1, 445, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(446, 1, 446, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(447, 1, 447, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(448, 1, 448, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(449, 1, 449, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(450, 1, 450, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(451, 1, 451, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(452, 1, 452, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(453, 1, 453, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(454, 1, 454, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(455, 1, 455, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(456, 1, 456, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(457, 1, 457, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(458, 1, 458, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(459, 1, 459, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(460, 1, 460, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(461, 1, 461, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(462, 1, 462, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(463, 1, 463, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(464, 1, 464, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(465, 1, 465, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(466, 1, 466, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(467, 1, 467, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(468, 1, 468, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(469, 1, 469, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(470, 1, 470, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(471, 1, 471, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(472, 1, 472, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(473, 1, 473, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(474, 1, 474, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(475, 1, 475, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(476, 1, 476, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(477, 1, 477, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(478, 1, 478, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(479, 1, 479, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(480, 1, 480, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(481, 1, 481, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(482, 1, 482, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(483, 1, 483, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(484, 1, 484, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(485, 1, 485, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(486, 1, 486, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(487, 1, 487, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(488, 1, 488, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(489, 1, 489, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(490, 1, 490, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(491, 1, 491, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(492, 1, 492, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(493, 1, 493, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(494, 1, 494, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(495, 1, 495, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(496, 1, 496, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(497, 1, 497, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(498, 1, 498, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(499, 1, 499, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(500, 1, 500, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(501, 1, 501, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(502, 1, 502, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(503, 1, 503, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(504, 1, 504, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(505, 1, 505, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(506, 1, 506, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(507, 1, 507, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(508, 1, 508, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(509, 1, 509, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(510, 1, 510, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(511, 1, 511, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(512, 1, 512, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(513, 1, 513, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(514, 1, 514, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(515, 1, 515, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(516, 1, 516, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(517, 1, 517, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(518, 1, 518, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(519, 1, 519, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(520, 1, 520, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(521, 1, 521, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(522, 1, 522, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(523, 1, 523, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(524, 1, 524, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(525, 1, 525, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(526, 1, 526, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(527, 1, 527, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(528, 1, 528, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(529, 1, 529, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(530, 1, 530, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(531, 1, 531, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(532, 1, 532, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(533, 1, 533, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(534, 1, 534, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(535, 1, 535, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(536, 1, 536, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(537, 1, 537, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(538, 1, 538, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(539, 1, 539, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(540, 1, 540, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(541, 1, 541, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(542, 1, 542, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(543, 1, 543, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(544, 1, 544, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(545, 1, 545, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(546, 1, 546, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(547, 1, 547, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(548, 1, 548, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(549, 1, 549, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(550, 1, 550, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(551, 1, 551, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(552, 1, 552, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(553, 1, 553, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(554, 1, 554, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(555, 1, 555, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(556, 1, 556, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(557, 1, 557, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(558, 1, 558, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18');
INSERT INTO `seat_availabilities` (`id`, `event_session_id`, `seat_master_id`, `order_id`, `user_id`, `status`, `locked_until`, `created_at`, `updated_at`) VALUES
(559, 1, 559, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(560, 1, 560, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(561, 1, 561, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(562, 1, 562, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(563, 1, 563, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(564, 1, 564, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(565, 1, 565, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(566, 1, 566, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(567, 1, 567, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(568, 1, 568, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(569, 1, 569, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(570, 1, 570, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(571, 1, 571, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(572, 1, 572, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(573, 1, 573, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(574, 1, 574, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(575, 1, 575, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(576, 1, 576, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(577, 1, 577, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(578, 1, 578, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(579, 1, 579, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(580, 1, 580, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(581, 1, 581, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(582, 1, 582, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(583, 1, 583, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(584, 1, 584, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(585, 1, 585, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(586, 1, 586, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(587, 1, 587, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(588, 1, 588, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(589, 1, 589, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(590, 1, 590, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(591, 1, 591, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(592, 1, 592, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(593, 1, 593, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(594, 1, 594, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(595, 1, 595, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(596, 1, 596, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(597, 1, 597, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(598, 1, 598, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(599, 1, 599, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(600, 1, 600, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(601, 1, 601, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(602, 1, 602, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(603, 1, 603, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(604, 1, 604, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(605, 1, 605, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(606, 1, 606, NULL, NULL, 'available', NULL, '2026-08-28 11:09:18', '2026-09-11 07:09:18'),
(608, 1, 608, NULL, NULL, 'available', NULL, '2026-09-04 01:31:25', '2026-09-11 07:09:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `seat_categories`
--

CREATE TABLE `seat_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `venue_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#3B82F6',
  `price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `seat_categories`
--

INSERT INTO `seat_categories` (`id`, `venue_id`, `name`, `color_code`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'DIAMOND', '#00C4DF', '300000.00', '2026-08-28 11:09:18', '2026-08-28 14:48:11'),
(2, 1, 'GOLD', '#F59E0B', '250000.00', '2026-08-28 11:09:18', '2026-08-28 14:48:04'),
(3, 1, 'PINK', '#EC4899', '175000.00', '2026-08-28 11:09:18', '2026-08-28 14:47:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `seat_masters`
--

CREATE TABLE `seat_masters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `venue_id` bigint(20) UNSIGNED NOT NULL,
  `seat_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seat_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `row_num` int(11) NOT NULL,
  `col_num` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `seat_masters`
--

INSERT INTO `seat_masters` (`id`, `venue_id`, `seat_category_id`, `seat_code`, `row_num`, `col_num`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'L-A08', 1, 8, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(2, 1, 2, 'L-A09', 1, 9, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(3, 1, 2, 'L-A10', 1, 10, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(4, 1, 2, 'L-A11', 1, 11, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(5, 1, 2, 'L-A12', 1, 12, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(6, 1, 2, 'L-A13', 1, 13, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(7, 1, 2, 'L-A14', 1, 14, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(8, 1, 2, 'L-A15', 1, 15, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(9, 1, 2, 'L-A16', 1, 16, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(10, 1, 2, 'L-A17', 1, 17, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(11, 1, 2, 'L-B27', 2, 27, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(12, 1, 2, 'L-B28', 2, 28, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(13, 1, 2, 'L-B29', 2, 29, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(14, 1, 2, 'L-B30', 2, 30, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(15, 1, 2, 'L-B31', 2, 31, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(16, 1, 2, 'L-B32', 2, 32, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(17, 1, 2, 'L-B33', 2, 33, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(18, 1, 2, 'L-B34', 2, 34, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(19, 1, 2, 'L-B35', 2, 35, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(20, 1, 2, 'L-B36', 2, 36, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(21, 1, 3, 'L-C26', 3, 26, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(22, 1, 3, 'L-C27', 3, 27, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(23, 1, 2, 'L-C28', 3, 28, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(24, 1, 2, 'L-C29', 3, 29, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(25, 1, 2, 'L-C30', 3, 30, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(26, 1, 2, 'L-C31', 3, 31, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(27, 1, 2, 'L-C32', 3, 32, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(28, 1, 2, 'L-C33', 3, 33, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(29, 1, 2, 'L-C34', 3, 34, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(30, 1, 2, 'L-C35', 3, 35, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(31, 1, 2, 'L-C36', 3, 36, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(32, 1, 3, 'L-D29', 4, 29, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(33, 1, 3, 'L-D30', 4, 30, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(34, 1, 3, 'L-D31', 4, 31, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(35, 1, 3, 'L-D32', 4, 32, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(36, 1, 3, 'L-D33', 4, 33, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(37, 1, 2, 'L-D34', 4, 34, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(38, 1, 2, 'L-D35', 4, 35, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(39, 1, 2, 'L-D36', 4, 36, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(40, 1, 2, 'L-D37', 4, 37, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(41, 1, 2, 'L-D38', 4, 38, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(42, 1, 2, 'L-D39', 4, 39, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(43, 1, 2, 'L-E30', 5, 30, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(44, 1, 2, 'L-E31', 5, 31, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(45, 1, 3, 'L-E32', 5, 32, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(46, 1, 3, 'L-E33', 5, 33, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(47, 1, 3, 'L-E34', 5, 34, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(48, 1, 3, 'L-E35', 5, 35, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(49, 1, 2, 'L-E36', 5, 36, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(50, 1, 2, 'L-E37', 5, 37, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(51, 1, 2, 'L-E38', 5, 38, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(52, 1, 2, 'L-E39', 5, 39, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(53, 1, 2, 'L-E40', 5, 40, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(54, 1, 2, 'L-F30', 6, 30, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(55, 1, 2, 'L-F31', 6, 31, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(56, 1, 2, 'L-F32', 6, 32, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(57, 1, 3, 'L-F33', 6, 33, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(58, 1, 3, 'L-F34', 6, 34, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(59, 1, 3, 'L-F35', 6, 35, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(60, 1, 3, 'L-F36', 6, 36, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(61, 1, 3, 'L-F37', 6, 37, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(62, 1, 2, 'L-F38', 6, 38, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(63, 1, 2, 'L-F39', 6, 39, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(64, 1, 2, 'L-F40', 6, 40, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(65, 1, 2, 'L-G31', 7, 31, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(66, 1, 2, 'L-G32', 7, 32, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(67, 1, 2, 'L-G33', 7, 33, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(68, 1, 2, 'L-G34', 7, 34, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(69, 1, 3, 'L-G35', 7, 35, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(70, 1, 3, 'L-G36', 7, 36, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(71, 1, 3, 'L-G37', 7, 37, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(72, 1, 3, 'L-G38', 7, 38, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(73, 1, 3, 'L-G39', 7, 39, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(74, 1, 3, 'L-G40', 7, 40, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(75, 1, 2, 'L-H31', 8, 31, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(76, 1, 2, 'L-H32', 8, 32, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(77, 1, 2, 'L-H33', 8, 33, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(78, 1, 2, 'L-H34', 8, 34, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(79, 1, 2, 'L-H35', 8, 35, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(80, 1, 3, 'L-H36', 8, 36, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(81, 1, 3, 'L-H37', 8, 37, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(82, 1, 3, 'L-H38', 8, 38, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(83, 1, 3, 'L-H39', 8, 39, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(84, 1, 3, 'L-H40', 8, 40, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(85, 1, 2, 'L-J25', 9, 25, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(86, 1, 2, 'L-J26', 9, 26, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(87, 1, 2, 'L-J27', 9, 27, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(88, 1, 2, 'L-J28', 9, 28, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(89, 1, 2, 'L-J29', 9, 29, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(90, 1, 2, 'L-J30', 9, 30, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(91, 1, 2, 'L-J31', 9, 31, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(92, 1, 2, 'L-J32', 9, 32, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(93, 1, 2, 'L-K24', 10, 24, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(94, 1, 2, 'L-K25', 10, 25, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(95, 1, 2, 'L-K26', 10, 26, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(96, 1, 2, 'L-K27', 10, 27, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(97, 1, 2, 'L-K28', 10, 28, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(98, 1, 2, 'L-K29', 10, 29, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(99, 1, 2, 'L-K30', 10, 30, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(100, 1, 2, 'L-K31', 10, 31, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(101, 1, 2, 'L-K32', 10, 32, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(102, 1, 2, 'L-L27', 11, 27, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(103, 1, 2, 'L-L28', 11, 28, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(104, 1, 2, 'L-L29', 11, 29, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(105, 1, 2, 'L-L30', 11, 30, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(106, 1, 2, 'L-L31', 11, 31, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(107, 1, 2, 'L-L32', 11, 32, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(108, 1, 2, 'L-L33', 11, 33, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(109, 1, 2, 'L-L34', 11, 34, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(110, 1, 2, 'L-L35', 11, 35, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(111, 1, 2, 'L-M28', 12, 28, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(112, 1, 2, 'L-M29', 12, 29, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(113, 1, 2, 'L-M30', 12, 30, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(114, 1, 2, 'L-M31', 12, 31, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(115, 1, 2, 'L-M32', 12, 32, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(116, 1, 2, 'L-M33', 12, 33, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(117, 1, 2, 'L-M34', 12, 34, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(118, 1, 2, 'L-M35', 12, 35, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(119, 1, 2, 'L-M36', 12, 36, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(120, 1, 2, 'L-N28', 13, 28, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(121, 1, 2, 'L-N29', 13, 29, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(122, 1, 2, 'L-N30', 13, 30, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(123, 1, 2, 'L-N31', 13, 31, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(124, 1, 2, 'L-N32', 13, 32, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(125, 1, 2, 'L-N33', 13, 33, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(126, 1, 2, 'L-N34', 13, 34, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(127, 1, 2, 'L-N35', 13, 35, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(128, 1, 2, 'L-N36', 13, 36, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(129, 1, 2, 'L-P31', 14, 31, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(130, 1, 2, 'L-P32', 14, 32, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(131, 1, 2, 'L-P33', 14, 33, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(132, 1, 2, 'L-P34', 14, 34, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(133, 1, 2, 'L-P35', 14, 35, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(134, 1, 2, 'L-P36', 14, 36, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(135, 1, 2, 'L-P37', 14, 37, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(136, 1, 2, 'L-P38', 14, 38, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(137, 1, 2, 'L-P39', 14, 39, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(138, 1, 2, 'L-P40', 14, 40, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(139, 1, 2, 'L-P41', 14, 41, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(140, 1, 2, 'L-R31', 15, 31, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(141, 1, 2, 'L-R32', 15, 32, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(142, 1, 2, 'L-R33', 15, 33, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(143, 1, 2, 'L-R34', 15, 34, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(144, 1, 2, 'L-R35', 15, 35, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(145, 1, 2, 'L-R36', 15, 36, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(146, 1, 2, 'L-R37', 15, 37, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(147, 1, 2, 'L-R38', 15, 38, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(148, 1, 2, 'L-R39', 15, 39, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(149, 1, 2, 'L-R40', 15, 40, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(150, 1, 2, 'L-R41', 15, 41, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(151, 1, 2, 'L-S27', 16, 27, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(152, 1, 2, 'L-S28', 16, 28, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(153, 1, 2, 'L-S29', 16, 29, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(154, 1, 2, 'L-S30', 16, 30, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(155, 1, 2, 'L-S31', 16, 31, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(156, 1, 2, 'L-S32', 16, 32, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(157, 1, 2, 'L-S33', 16, 33, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(158, 1, 2, 'L-T27', 17, 27, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(159, 1, 2, 'L-T28', 17, 28, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(160, 1, 2, 'L-T29', 17, 29, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(161, 1, 2, 'L-T30', 17, 30, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(162, 1, 2, 'L-T31', 17, 31, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(163, 1, 2, 'L-T32', 17, 32, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(164, 1, 2, 'L-T33', 17, 33, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(165, 1, 1, 'C-B08', 2, 8, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(166, 1, 1, 'C-B09', 2, 9, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(167, 1, 1, 'C-B10', 2, 10, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(168, 1, 1, 'C-B11', 2, 11, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(169, 1, 1, 'C-B12', 2, 12, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(170, 1, 1, 'C-B13', 2, 13, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(171, 1, 1, 'C-B14', 2, 14, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(172, 1, 1, 'C-B15', 2, 15, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(173, 1, 1, 'C-B16', 2, 16, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(174, 1, 1, 'C-B17', 2, 17, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(175, 1, 1, 'C-B18', 2, 18, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(176, 1, 1, 'C-B19', 2, 19, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(177, 1, 1, 'C-B20', 2, 20, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(178, 1, 1, 'C-B21', 2, 21, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(179, 1, 1, 'C-B22', 2, 22, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(180, 1, 1, 'C-B23', 2, 23, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(181, 1, 1, 'C-B24', 2, 24, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(182, 1, 1, 'C-B25', 2, 25, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(183, 1, 1, 'C-B26', 2, 26, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(184, 1, 1, 'C-C08', 3, 8, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(185, 1, 1, 'C-C09', 3, 9, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(186, 1, 1, 'C-C10', 3, 10, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(187, 1, 1, 'C-C11', 3, 11, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(188, 1, 1, 'C-C12', 3, 12, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(189, 1, 1, 'C-C13', 3, 13, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(190, 1, 1, 'C-C14', 3, 14, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(191, 1, 1, 'C-C15', 3, 15, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(192, 1, 1, 'C-C16', 3, 16, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(193, 1, 1, 'C-C17', 3, 17, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(194, 1, 1, 'C-C18', 3, 18, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(195, 1, 1, 'C-C19', 3, 19, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(196, 1, 1, 'C-C20', 3, 20, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(197, 1, 1, 'C-C21', 3, 21, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(198, 1, 1, 'C-C22', 3, 22, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(199, 1, 1, 'C-C23', 3, 23, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(200, 1, 1, 'C-C24', 3, 24, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(201, 1, 1, 'C-C25', 3, 25, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(202, 1, 1, 'C-D08', 4, 8, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(203, 1, 1, 'C-D09', 4, 9, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(204, 1, 1, 'C-D10', 4, 10, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(205, 1, 1, 'C-D11', 4, 11, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(206, 1, 1, 'C-D12', 4, 12, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(207, 1, 1, 'C-D13', 4, 13, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(208, 1, 1, 'C-D14', 4, 14, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(209, 1, 1, 'C-D15', 4, 15, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(210, 1, 1, 'C-D16', 4, 16, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(211, 1, 1, 'C-D17', 4, 17, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(212, 1, 1, 'C-D18', 4, 18, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(213, 1, 1, 'C-D19', 4, 19, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(214, 1, 1, 'C-D20', 4, 20, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(215, 1, 1, 'C-D21', 4, 21, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(216, 1, 1, 'C-D22', 4, 22, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(217, 1, 1, 'C-D23', 4, 23, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(218, 1, 1, 'C-D24', 4, 24, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(219, 1, 1, 'C-D25', 4, 25, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(220, 1, 1, 'C-D26', 4, 26, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(221, 1, 1, 'C-D27', 4, 27, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(222, 1, 1, 'C-D28', 4, 28, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(223, 1, 1, 'C-E08', 5, 8, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(224, 1, 1, 'C-E09', 5, 9, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(225, 1, 1, 'C-E10', 5, 10, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(226, 1, 1, 'C-E11', 5, 11, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(227, 1, 1, 'C-E12', 5, 12, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(228, 1, 1, 'C-E13', 5, 13, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(229, 1, 1, 'C-E14', 5, 14, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(230, 1, 1, 'C-E15', 5, 15, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(231, 1, 1, 'C-E16', 5, 16, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(232, 1, 1, 'C-E17', 5, 17, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(233, 1, 1, 'C-E18', 5, 18, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(234, 1, 1, 'C-E19', 5, 19, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(235, 1, 1, 'C-E20', 5, 20, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(236, 1, 1, 'C-E21', 5, 21, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(237, 1, 1, 'C-E22', 5, 22, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(238, 1, 1, 'C-E23', 5, 23, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(239, 1, 1, 'C-E24', 5, 24, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(240, 1, 1, 'C-E25', 5, 25, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(241, 1, 1, 'C-E26', 5, 26, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(242, 1, 1, 'C-E27', 5, 27, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(243, 1, 1, 'C-E28', 5, 28, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(244, 1, 1, 'C-E29', 5, 29, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(245, 1, 1, 'C-F08', 6, 8, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(246, 1, 1, 'C-F09', 6, 9, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(247, 1, 1, 'C-F10', 6, 10, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(248, 1, 1, 'C-F11', 6, 11, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(249, 1, 1, 'C-F12', 6, 12, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(250, 1, 1, 'C-F13', 6, 13, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(251, 1, 1, 'C-F14', 6, 14, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(252, 1, 1, 'C-F15', 6, 15, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(253, 1, 1, 'C-F16', 6, 16, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(254, 1, 1, 'C-F17', 6, 17, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(255, 1, 1, 'C-F18', 6, 18, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(256, 1, 1, 'C-F19', 6, 19, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(257, 1, 1, 'C-F20', 6, 20, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(258, 1, 1, 'C-F21', 6, 21, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(259, 1, 1, 'C-F22', 6, 22, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(260, 1, 1, 'C-F23', 6, 23, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(261, 1, 1, 'C-F24', 6, 24, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(262, 1, 1, 'C-F25', 6, 25, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(263, 1, 1, 'C-F26', 6, 26, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(264, 1, 1, 'C-F27', 6, 27, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(265, 1, 1, 'C-F28', 6, 28, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(266, 1, 1, 'C-F29', 6, 29, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(267, 1, 1, 'C-G08', 7, 8, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(268, 1, 1, 'C-G09', 7, 9, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(269, 1, 1, 'C-G10', 7, 10, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(270, 1, 1, 'C-G11', 7, 11, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(271, 1, 1, 'C-G12', 7, 12, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(272, 1, 1, 'C-G13', 7, 13, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(273, 1, 1, 'C-G14', 7, 14, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(274, 1, 1, 'C-G15', 7, 15, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(275, 1, 1, 'C-G16', 7, 16, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(276, 1, 1, 'C-G17', 7, 17, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(277, 1, 1, 'C-G18', 7, 18, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(278, 1, 1, 'C-G19', 7, 19, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(279, 1, 1, 'C-G20', 7, 20, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(280, 1, 1, 'C-G21', 7, 21, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(281, 1, 1, 'C-G22', 7, 22, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(282, 1, 1, 'C-G23', 7, 23, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(283, 1, 1, 'C-G24', 7, 24, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(284, 1, 1, 'C-G25', 7, 25, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(285, 1, 1, 'C-G26', 7, 26, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(286, 1, 1, 'C-G27', 7, 27, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(287, 1, 1, 'C-G28', 7, 28, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(288, 1, 1, 'C-G29', 7, 29, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(289, 1, 1, 'C-G30', 7, 30, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(290, 1, 1, 'C-H07', 8, 7, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(291, 1, 1, 'C-H08', 8, 8, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(292, 1, 1, 'C-H09', 8, 9, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(293, 1, 1, 'C-H10', 8, 10, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(294, 1, 1, 'C-H11', 8, 11, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(295, 1, 1, 'C-H12', 8, 12, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(296, 1, 1, 'C-H13', 8, 13, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(297, 1, 1, 'C-H14', 8, 14, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(298, 1, 1, 'C-H15', 8, 15, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(299, 1, 1, 'C-H16', 8, 16, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(300, 1, 1, 'C-H17', 8, 17, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(301, 1, 1, 'C-H18', 8, 18, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(302, 1, 1, 'C-H19', 8, 19, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(303, 1, 1, 'C-H20', 8, 20, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(304, 1, 1, 'C-H21', 8, 21, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(305, 1, 1, 'C-H22', 8, 22, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(306, 1, 1, 'C-H23', 8, 23, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(307, 1, 1, 'C-H24', 8, 24, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(308, 1, 1, 'C-H25', 8, 25, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(309, 1, 1, 'C-H26', 8, 26, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(310, 1, 1, 'C-H27', 8, 27, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(311, 1, 1, 'C-H28', 8, 28, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(312, 1, 1, 'C-H29', 8, 29, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(313, 1, 1, 'C-H30', 8, 30, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(314, 1, 1, 'C-J06', 9, 6, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(315, 1, 1, 'C-J07', 9, 7, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(316, 1, 1, 'C-J08', 9, 8, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(317, 1, 1, 'C-J09', 9, 9, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(318, 1, 1, 'C-J10', 9, 10, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(319, 1, 1, 'C-J11', 9, 11, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(320, 1, 1, 'C-J12', 9, 12, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(321, 1, 1, 'C-J13', 9, 13, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(322, 1, 1, 'C-J14', 9, 14, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(323, 1, 1, 'C-J15', 9, 15, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(324, 1, 1, 'C-J16', 9, 16, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(325, 1, 1, 'C-J17', 9, 17, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(326, 1, 1, 'C-J18', 9, 18, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(327, 1, 1, 'C-J19', 9, 19, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(328, 1, 1, 'C-J20', 9, 20, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(329, 1, 1, 'C-J21', 9, 21, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(330, 1, 1, 'C-J22', 9, 22, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(331, 1, 1, 'C-J23', 9, 23, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(332, 1, 1, 'C-J24', 9, 24, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(333, 1, 1, 'C-K06', 10, 6, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(334, 1, 1, 'C-K07', 10, 7, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(335, 1, 1, 'C-K08', 10, 8, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(336, 1, 1, 'C-K09', 10, 9, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(337, 1, 1, 'C-K10', 10, 10, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(338, 1, 1, 'C-K11', 10, 11, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(339, 1, 1, 'C-K12', 10, 12, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(340, 1, 1, 'C-K13', 10, 13, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(341, 1, 1, 'C-K14', 10, 14, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(342, 1, 1, 'C-K15', 10, 15, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(343, 1, 1, 'C-K16', 10, 16, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(344, 1, 1, 'C-K17', 10, 17, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(345, 1, 1, 'C-K18', 10, 18, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(346, 1, 1, 'C-K19', 10, 19, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(347, 1, 1, 'C-K20', 10, 20, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(348, 1, 1, 'C-K21', 10, 21, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(349, 1, 1, 'C-K22', 10, 22, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(350, 1, 1, 'C-K23', 10, 23, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(351, 1, 1, 'C-L06', 11, 6, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(352, 1, 1, 'C-L07', 11, 7, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(353, 1, 1, 'C-L08', 11, 8, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(354, 1, 1, 'C-L09', 11, 9, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(355, 1, 1, 'C-L10', 11, 10, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(356, 1, 1, 'C-L11', 11, 11, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(357, 1, 1, 'C-L12', 11, 12, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(358, 1, 1, 'C-L13', 11, 13, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(359, 1, 1, 'C-L14', 11, 14, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(360, 1, 1, 'C-L15', 11, 15, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(361, 1, 1, 'C-L16', 11, 16, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(362, 1, 1, 'C-L17', 11, 17, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(363, 1, 1, 'C-L18', 11, 18, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(364, 1, 1, 'C-L19', 11, 19, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(365, 1, 1, 'C-L20', 11, 20, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(366, 1, 1, 'C-L21', 11, 21, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(367, 1, 1, 'C-L22', 11, 22, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(368, 1, 1, 'C-L23', 11, 23, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(369, 1, 1, 'C-L24', 11, 24, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(370, 1, 1, 'C-L25', 11, 25, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(371, 1, 1, 'C-L26', 11, 26, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(372, 1, 1, 'C-M06', 12, 6, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(373, 1, 1, 'C-M07', 12, 7, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(374, 1, 1, 'C-M08', 12, 8, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(375, 1, 1, 'C-M09', 12, 9, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(376, 1, 1, 'C-M10', 12, 10, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(377, 1, 1, 'C-M11', 12, 11, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(378, 1, 1, 'C-M12', 12, 12, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(379, 1, 1, 'C-M13', 12, 13, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(380, 1, 1, 'C-M14', 12, 14, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(381, 1, 1, 'C-M15', 12, 15, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(382, 1, 1, 'C-M16', 12, 16, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(383, 1, 1, 'C-M17', 12, 17, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(384, 1, 1, 'C-M18', 12, 18, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(385, 1, 1, 'C-M19', 12, 19, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(386, 1, 1, 'C-M20', 12, 20, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(387, 1, 1, 'C-M21', 12, 21, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(388, 1, 1, 'C-M22', 12, 22, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(389, 1, 1, 'C-M23', 12, 23, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(390, 1, 1, 'C-M24', 12, 24, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(391, 1, 1, 'C-M25', 12, 25, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(392, 1, 1, 'C-M26', 12, 26, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(393, 1, 1, 'C-M27', 12, 27, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(394, 1, 1, 'C-N06', 13, 6, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(395, 1, 1, 'C-N07', 13, 7, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(396, 1, 1, 'C-N08', 13, 8, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(397, 1, 1, 'C-N09', 13, 9, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(398, 1, 1, 'C-N10', 13, 10, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(399, 1, 1, 'C-N11', 13, 11, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(400, 1, 1, 'C-N12', 13, 12, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(401, 1, 1, 'C-N13', 13, 13, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(402, 1, 1, 'C-N14', 13, 14, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(403, 1, 1, 'C-N15', 13, 15, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(404, 1, 1, 'C-N16', 13, 16, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(405, 1, 1, 'C-N17', 13, 17, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(406, 1, 1, 'C-N18', 13, 18, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(407, 1, 1, 'C-N19', 13, 19, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(408, 1, 1, 'C-N20', 13, 20, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(409, 1, 1, 'C-N21', 13, 21, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(410, 1, 1, 'C-N22', 13, 22, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(411, 1, 1, 'C-N23', 13, 23, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(412, 1, 1, 'C-N24', 13, 24, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(413, 1, 1, 'C-N25', 13, 25, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(414, 1, 1, 'C-N26', 13, 26, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(415, 1, 1, 'C-N27', 13, 27, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(416, 1, 1, 'C-P08', 14, 8, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(417, 1, 1, 'C-P09', 14, 9, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(418, 1, 1, 'C-P10', 14, 10, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(419, 1, 1, 'C-P11', 14, 11, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(420, 1, 1, 'C-P12', 14, 12, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(421, 1, 1, 'C-P13', 14, 13, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(422, 1, 1, 'C-P14', 14, 14, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(423, 1, 1, 'C-P15', 14, 15, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(424, 1, 1, 'C-P16', 14, 16, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(425, 1, 1, 'C-P17', 14, 17, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(426, 1, 1, 'C-P18', 14, 18, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(427, 1, 1, 'C-P19', 14, 19, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(428, 1, 1, 'C-P20', 14, 20, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(429, 1, 1, 'C-P21', 14, 21, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(430, 1, 1, 'C-P22', 14, 22, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(431, 1, 1, 'C-P23', 14, 23, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(432, 1, 1, 'C-P24', 14, 24, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(433, 1, 1, 'C-P25', 14, 25, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(434, 1, 1, 'C-P26', 14, 26, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(435, 1, 1, 'C-P27', 14, 27, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(436, 1, 1, 'C-P28', 14, 28, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(437, 1, 1, 'C-P29', 14, 29, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(438, 1, 1, 'C-P30', 14, 30, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(439, 1, 1, 'C-R08', 15, 8, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(440, 1, 1, 'C-R09', 15, 9, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(441, 1, 1, 'C-R10', 15, 10, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(442, 1, 1, 'C-R11', 15, 11, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(443, 1, 1, 'C-R12', 15, 12, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(444, 1, 1, 'C-R13', 15, 13, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(445, 1, 1, 'C-R14', 15, 14, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(446, 1, 1, 'C-R15', 15, 15, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(447, 1, 1, 'C-R16', 15, 16, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(448, 1, 1, 'C-R17', 15, 17, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(449, 1, 1, 'C-R18', 15, 18, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(450, 1, 1, 'C-R19', 15, 19, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(451, 1, 1, 'C-R20', 15, 20, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(452, 1, 1, 'C-R21', 15, 21, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(453, 1, 1, 'C-R22', 15, 22, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(454, 1, 1, 'C-R23', 15, 23, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(455, 1, 1, 'C-R24', 15, 24, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(456, 1, 1, 'C-R25', 15, 25, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(457, 1, 1, 'C-R26', 15, 26, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(458, 1, 1, 'C-R27', 15, 27, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(459, 1, 1, 'C-R28', 15, 28, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(460, 1, 1, 'C-R29', 15, 29, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(461, 1, 1, 'C-R30', 15, 30, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(462, 1, 1, 'C-S08', 16, 8, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(463, 1, 1, 'C-S09', 16, 9, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(464, 1, 1, 'C-S10', 16, 10, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(465, 1, 1, 'C-S11', 16, 11, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(466, 1, 1, 'C-S12', 16, 12, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(467, 1, 1, 'C-S13', 16, 13, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(468, 1, 1, 'C-S14', 16, 14, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(469, 1, 1, 'C-S15', 16, 15, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(470, 1, 1, 'C-S16', 16, 16, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(471, 1, 1, 'C-S17', 16, 17, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(472, 1, 1, 'C-S18', 16, 18, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(473, 1, 1, 'C-S19', 16, 19, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(474, 1, 1, 'C-S20', 16, 20, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(475, 1, 1, 'C-S21', 16, 21, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(476, 1, 1, 'C-S22', 16, 22, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(477, 1, 1, 'C-S23', 16, 23, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(478, 1, 1, 'C-S24', 16, 24, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(479, 1, 1, 'C-S25', 16, 25, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(480, 1, 1, 'C-S26', 16, 26, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(481, 1, 1, 'C-T08', 17, 8, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(482, 1, 1, 'C-T09', 17, 9, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(483, 1, 1, 'C-T10', 17, 10, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(484, 1, 1, 'C-T11', 17, 11, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(485, 1, 1, 'C-T12', 17, 12, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(486, 1, 1, 'C-T13', 17, 13, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(487, 1, 1, 'C-T14', 17, 14, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(488, 1, 1, 'C-T15', 17, 15, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(489, 1, 1, 'C-T16', 17, 16, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(490, 1, 1, 'C-T17', 17, 17, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(491, 1, 1, 'C-T18', 17, 18, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(492, 1, 1, 'C-T19', 17, 19, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(493, 1, 1, 'C-T20', 17, 20, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(494, 1, 1, 'C-T21', 17, 21, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(495, 1, 1, 'C-T22', 17, 22, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(496, 1, 1, 'C-T23', 17, 23, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(497, 1, 1, 'C-T24', 17, 24, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(498, 1, 1, 'C-T25', 17, 25, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(499, 1, 2, 'R-A01', 1, 1, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(500, 1, 2, 'R-A02', 1, 2, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(501, 1, 2, 'R-A03', 1, 3, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(502, 1, 2, 'R-A04', 1, 4, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(503, 1, 2, 'R-A05', 1, 5, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(504, 1, 2, 'R-A06', 1, 6, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(505, 1, 2, 'R-A07', 1, 7, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(506, 1, 2, 'R-B01', 2, 1, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(507, 1, 2, 'R-B02', 2, 2, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(508, 1, 2, 'R-B03', 2, 3, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(509, 1, 2, 'R-B04', 2, 4, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(510, 1, 2, 'R-B05', 2, 5, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(511, 1, 2, 'R-B06', 2, 6, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(512, 1, 2, 'R-B07', 2, 7, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(513, 1, 2, 'R-C01', 3, 1, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(514, 1, 2, 'R-C02', 3, 2, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(515, 1, 2, 'R-C03', 3, 3, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(516, 1, 2, 'R-C04', 3, 4, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(517, 1, 3, 'R-C05', 3, 5, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(518, 1, 3, 'R-C06', 3, 6, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(519, 1, 3, 'R-C07', 3, 7, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(520, 1, 2, 'R-D01', 4, 1, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(521, 1, 2, 'R-D02', 4, 2, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(522, 1, 2, 'R-D03', 4, 3, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(523, 1, 3, 'R-D04', 4, 4, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(524, 1, 3, 'R-D05', 4, 5, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(525, 1, 3, 'R-D06', 4, 6, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(526, 1, 3, 'R-D07', 4, 7, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(527, 1, 3, 'R-E01', 5, 1, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(528, 1, 3, 'R-E02', 5, 2, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(529, 1, 3, 'R-E03', 5, 3, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(530, 1, 3, 'R-E04', 5, 4, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(531, 1, 3, 'R-E05', 5, 5, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(532, 1, 3, 'R-E06', 5, 6, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(533, 1, 2, 'R-E07', 5, 7, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(534, 1, 3, 'R-F01', 6, 1, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(535, 1, 3, 'R-F02', 6, 2, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(536, 1, 3, 'R-F03', 6, 3, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(537, 1, 3, 'R-F04', 6, 4, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(538, 1, 3, 'R-F05', 6, 5, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(539, 1, 2, 'R-F06', 6, 6, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(540, 1, 2, 'R-F07', 6, 7, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(541, 1, 3, 'R-G01', 7, 1, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(542, 1, 3, 'R-G02', 7, 2, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(543, 1, 3, 'R-G03', 7, 3, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(544, 1, 3, 'R-G04', 7, 4, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(545, 1, 2, 'R-G05', 7, 5, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(546, 1, 2, 'R-G06', 7, 6, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(547, 1, 2, 'R-G07', 7, 7, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(548, 1, 3, 'R-H01', 8, 1, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(549, 1, 3, 'R-H02', 8, 2, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(550, 1, 2, 'R-H03', 8, 3, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(551, 1, 2, 'R-H04', 8, 4, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(552, 1, 2, 'R-H05', 8, 5, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(553, 1, 2, 'R-H06', 8, 6, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(554, 1, 2, 'R-J01', 9, 1, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(555, 1, 2, 'R-J02', 9, 2, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(556, 1, 2, 'R-J03', 9, 3, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(557, 1, 2, 'R-J04', 9, 4, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(558, 1, 2, 'R-J05', 9, 5, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(559, 1, 2, 'R-K01', 10, 1, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(560, 1, 2, 'R-K02', 10, 2, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(561, 1, 2, 'R-K03', 10, 3, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(562, 1, 2, 'R-K04', 10, 4, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(563, 1, 2, 'R-K05', 10, 5, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(564, 1, 2, 'R-L01', 11, 1, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(565, 1, 2, 'R-L02', 11, 2, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(566, 1, 2, 'R-L03', 11, 3, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(567, 1, 2, 'R-L04', 11, 4, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(568, 1, 2, 'R-L05', 11, 5, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(569, 1, 2, 'R-M01', 12, 1, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(570, 1, 2, 'R-M02', 12, 2, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(571, 1, 2, 'R-M03', 12, 3, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(572, 1, 2, 'R-M04', 12, 4, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(573, 1, 2, 'R-M05', 12, 5, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(574, 1, 2, 'R-N01', 13, 1, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(575, 1, 2, 'R-N02', 13, 2, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(576, 1, 2, 'R-N03', 13, 3, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(577, 1, 2, 'R-N04', 13, 4, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(578, 1, 2, 'R-N05', 13, 5, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(579, 1, 2, 'R-P01', 14, 1, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(580, 1, 2, 'R-P02', 14, 2, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(581, 1, 2, 'R-P03', 14, 3, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(582, 1, 2, 'R-P04', 14, 4, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(583, 1, 2, 'R-P05', 14, 5, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(584, 1, 2, 'R-P06', 14, 6, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(585, 1, 2, 'R-P07', 14, 7, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(586, 1, 2, 'R-R01', 15, 1, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(587, 1, 2, 'R-R02', 15, 2, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(588, 1, 2, 'R-R03', 15, 3, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(589, 1, 2, 'R-R04', 15, 4, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(590, 1, 2, 'R-R05', 15, 5, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(591, 1, 2, 'R-R06', 15, 6, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(592, 1, 2, 'R-R07', 15, 7, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(593, 1, 2, 'R-S01', 16, 1, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(594, 1, 2, 'R-S02', 16, 2, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(595, 1, 2, 'R-S03', 16, 3, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(596, 1, 2, 'R-S04', 16, 4, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(597, 1, 2, 'R-S05', 16, 5, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(598, 1, 2, 'R-S06', 16, 6, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(599, 1, 2, 'R-S07', 16, 7, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(600, 1, 2, 'R-T01', 17, 1, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(601, 1, 2, 'R-T02', 17, 2, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(602, 1, 2, 'R-T03', 17, 3, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(603, 1, 2, 'R-T04', 17, 4, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(604, 1, 2, 'R-T05', 17, 5, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(605, 1, 2, 'R-T06', 17, 6, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(606, 1, 2, 'R-T07', 17, 7, 1, '2026-08-28 11:09:18', '2026-08-28 11:09:18'),
(608, 1, 1, 'C-T26', 17, 26, 1, '2026-09-04 01:31:25', '2026-09-04 01:31:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `seat_availability_id` bigint(20) UNSIGNED DEFAULT NULL,
  `participant_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `participant_organization` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('valid','used','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'valid',
  `scanned_at` timestamp NULL DEFAULT NULL,
  `scanned_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tickets`
--

INSERT INTO `tickets` (`id`, `ticket_code`, `qr_code_hash`, `order_id`, `seat_availability_id`, `participant_name`, `participant_organization`, `status`, `scanned_at`, `scanned_by`, `created_at`, `updated_at`) VALUES
(648, 'TKT-20260911-M3VVQO', 'f1a8d07aeec2c099e6cc3ac43b3eced34ad709c0603f07505a6c4835aa2758ef', 193, 314, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(649, 'TKT-20260911-FVZ4OJ', 'cbf5942f079ab591223fddc45703e04ee012b9546db93e052cb534b4c8c2d49c', 193, 315, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(650, 'TKT-20260911-CS2SZ0', '524679d04ba41de4c00c0861c22a758d073fca7e61f080d76f890de2e1464f51', 193, 316, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(651, 'TKT-20260911-BJ0L7N', 'da7e4a08fc071f278861aacb5f73a49c9d112ead57baa32f8396a4e2b95a914a', 193, 317, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(652, 'TKT-20260911-WK1HPW', '03ef51aedff877fe0d234c05a4a82742328ac3185aeb62a123c7c725c8c218dc', 193, 318, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(653, 'TKT-20260911-MCHDC3', '1ad9989ee1d8e301b202dd04e424a8590b3435df0603e093bee04c2c38323105', 193, 319, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(654, 'TKT-20260911-UBVPXO', 'eeb2421607814e03ebaabbd13bdb5ed8bfdf40f9b61c33dd7cda6a1260783e31', 193, 320, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(655, 'TKT-20260911-8K60Y1', 'f75ce473a945b9cb3b47bddaa4b9a375012332f3f8fce73b9e59ced1a22881e9', 193, 321, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(656, 'TKT-20260911-XEKANB', '4ade434ec4eaf2ec5e0c9fea5764100233541b549e84d8dfaad0b50666713802', 193, 322, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(657, 'TKT-20260911-71AHJE', '48c7db1b6c9217ab98f8921630942732e0ce1ab056b0f8d2229f56b166e11d72', 193, 323, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(658, 'TKT-20260911-TMY014', '79cdfee3eef99cdc4997ff81a65c5827ca179ba691eb4dcf1c670cd8dc163176', 193, 324, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(659, 'TKT-20260911-EQKREF', '7c63867214265df4f343c0663f3b252e2aaaf2056a3525a9e3cefa6829fa0703', 193, 325, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(660, 'TKT-20260911-XAHKVX', '0640069e0f2f2d42835c43796ab2bd0159beb96decbbe9ffbcbc2c261595a462', 193, 326, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(661, 'TKT-20260911-LEBJIA', 'cab96327b88696627cc951bc6c3472c9f86027f1df81132b166deab81dde4554', 193, 327, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(662, 'TKT-20260911-AWYXS2', '672a77dfbe02c57510d1241ddf2a5e9b049ae06f9a9abf3c2dc46863c7beff60', 193, 328, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(663, 'TKT-20260911-JEQOMC', 'c0919c9248df3f9cef051d1aaca383fc3a334850390a458877bf3cf2d1faa55a', 193, 329, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(664, 'TKT-20260911-YIDHRA', 'aa65439864f095df96b02ff369be3e1ad7185d7ef7a5d0755ebeedb279a6d5ce', 193, 330, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(665, 'TKT-20260911-IL105S', '4505241021887d6acd53ca2f0fb5b219e4c9d44ad250a9afe3d34454f318b48c', 193, 331, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(666, 'TKT-20260911-UL56AU', '52fe1b9038a7efe9eb33c349de72cde31f270c6b9c8b76b282e1df2c70dcb13c', 193, 332, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(667, 'TKT-20260911-ZDDI1G', '36728e125b97afd889631cda47f142084bffa2e52a591cb41b8a87b9792c341e', 193, 333, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(668, 'TKT-20260911-Y2E89O', 'cb6fd32e371502554b5baec730ec0d60b4191ddf3194e22d90f2c5a650ce1d6f', 193, 334, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(669, 'TKT-20260911-FMGFES', 'c5877c543fbf61b2fd0045ddf0778e26545b04d9d2cf89a6a1212b0e31039d1c', 193, 335, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(670, 'TKT-20260911-NRV3MH', 'e7c32c35bf6a8585c422e651b2be52f66599f1c4b78f0cd378433dd8a45958e6', 193, 336, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(671, 'TKT-20260911-IZMI2X', '8591c193c09254e317ed023e80b9125c08ae328bf42665421b42d42167aa29bb', 193, 337, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(672, 'TKT-20260911-IQWHET', '445149901bb47f1ff6db52d54f8d327136d52bea1b72205192ff1c79015368a0', 193, 338, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(673, 'TKT-20260911-H8BOJJ', '0b14ea810c918186558bd362281135351795fa87f37c3e0a889ccf6878056a6d', 193, 339, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(674, 'TKT-20260911-SUQAHE', '9ae1b1893c609aefb5c0dcf1d90ea7f08737308c828adf93dea4de0af7f63d94', 193, 340, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(675, 'TKT-20260911-Q5TZL9', '2d8ce98c3512b75148d4ba83f24bce040c0988da4fb364c5854dc8f6eb82da73', 193, 341, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(676, 'TKT-20260911-IX3JXX', '8357ccc2ec3463869bb9d9918e8c031ee0cb48ccc87e6ad8521d331d38c35382', 193, 342, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(677, 'TKT-20260911-HFZAOH', 'c611539e3ee8f97bf537ee7dc58bdce38fb94d728fa88c788423e10b6617f54c', 193, 343, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(678, 'TKT-20260911-OKUL4L', '4a692b03db2c7a289539d29796cccdb867386d26a774ba3640d9e66c35c237ed', 193, 344, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(679, 'TKT-20260911-Y6ZWNH', 'd2c4865bf9ff1656c758064e93bd52a04b779c4c544ae3edad1c7944434c46a2', 193, 345, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(680, 'TKT-20260911-TH4ZU0', '21b4574747220ca2120aa76d1244e786aea1794ccbf663e7f03f5f6d36f444dc', 193, 346, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(681, 'TKT-20260911-5VSPCS', '65d89256d382d7b2c689c131e25f6caeda690ac5f35d2d926404966ba4eff7ce', 193, 347, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(682, 'TKT-20260911-4VEAT6', '276475dc97fa32ef8691dd02ef69e3cb54dea2f7d2cc720ba9d2f9432e7dd5c3', 193, 348, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(683, 'TKT-20260911-QDO03D', '4cd3f822973791044bef119286e1b13e5084a67a048f41fe38212e4831b0d8ed', 193, 349, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(684, 'TKT-20260911-W8H5QY', '2114288461d40a2fa6f4fedb5a0626da42668a3cf2cbe5d6e9ea3c2f621ec3e7', 193, 350, 'Tamu VVIP', 'VVIP', 'valid', NULL, NULL, '2026-09-11 07:28:26', '2026-09-11 07:28:26'),
(685, 'TKT-20260911-YMLYG1', '59d63ee6af446bd5bf09cf6206686a0f278af0b47498517fddb2ae3d5e0eaf5e', 194, 165, 'test 1', 'Keluarga Besar PMVB', 'valid', NULL, NULL, '2026-09-11 07:58:05', '2026-09-11 07:59:55'),
(686, 'TKT-20260911-SE4RL9', '22971cd8449c0d78f09b4bc5f4bb0023431c1c2cac673f8dd1df61d8be6d4673', 194, 166, 'test 2', 'Sekber PMVBI', 'valid', NULL, NULL, '2026-09-11 07:58:05', '2026-09-11 08:00:06'),
(687, 'TKT-20260911-J4YILS', '0bad304f2ee913a7a426e2f4dac6872dcc15518854c3db4795202200f2b7ba82', 195, NULL, 'gagfda', 'Keluarga Besar PMVB', 'valid', NULL, NULL, '2026-09-11 08:52:53', '2026-09-11 08:52:53'),
(688, 'TKT-20260911-N1HIU8', '2c5733553e4c1e96cba7049c262c712fa91e1a6c85c7009d885d185993850f22', 196, NULL, 'Testing', 'Keluarga Besar PMVB', 'valid', NULL, NULL, '2026-09-11 08:57:51', '2026-09-11 08:57:51'),
(689, 'TKT-20260911-2I2YIO', 'ebd1c72218a61532be03244d84a7974c1b4b2259e42cdb7627fe4336fdd602e6', 197, 20, 'TES', 'Keluarga Besar PMVB', 'valid', NULL, NULL, '2026-09-11 09:47:32', '2026-09-11 09:58:42'),
(690, 'TKT-20260914-L0XIS8', '262c20314ea09e8964307dff1341fb170088de145884c8210803aedeb246d1d3', 198, NULL, 'betty bakely', 'Keluarga Besar PMVB', 'valid', NULL, NULL, '2026-09-14 13:18:14', '2026-09-14 13:18:14'),
(691, 'TKT-20260914-QDMBDE', '366acbf2b6233c3bbe311c8d2ee025d4975697cab2b5b54dde3d2a85e4fdc15b', 198, NULL, 'hendry nauli', 'Keluarga Besar PMVB', 'valid', NULL, NULL, '2026-09-14 13:18:14', '2026-09-14 13:18:14'),
(692, 'TKT-20260914-YWQDTI', '321d554e3533caa35f6c085f035c2080aa304816c92e4b4c8172ae53b5732abb', 199, NULL, 'Linda', 'Keluarga Besar PMVB', 'valid', NULL, NULL, '2026-09-14 15:20:29', '2026-09-14 15:20:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `phone_number`, `email`, `google_id`, `avatar`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin Borobudur', NULL, 'admin@borobudur.org', NULL, NULL, '2026-08-28 11:09:17', '$2y$12$lSmk/.QjtTMdqwnNa3u.1eAv.Obg.RXJuPLFoKSabw0ZcdhYfs56.', NULL, '2026-08-28 11:09:17', '2026-09-11 07:39:18'),
(2, 'Panitia Borobudur', NULL, 'panitia@borobudur.org', NULL, NULL, '2026-08-28 11:09:17', '$2y$12$27KTtdGTBscwuCNuYZTuH..rYnbqSK/FEyVRaOtffNbRW6w9Gg4q.', NULL, '2026-08-28 11:09:17', '2026-09-11 07:39:18'),
(225, 'ada', '123123123123', NULL, NULL, NULL, NULL, NULL, 'zBJ06PVI1oJZn8g1rq9v7E5k0OKKYK8XicZHXLMeSawr3VlwPDNTmcOrCFoz', '2026-09-11 06:59:36', '2026-09-11 06:59:36'),
(226, 'test 1', '123123', NULL, NULL, NULL, NULL, NULL, 'T3y1Yvlq5SvkzmZIYAClCEfIRp02RDLhj0ebMpFXC6O8TjuUhNv0nu3w6stm', '2026-09-11 07:58:05', '2026-09-11 07:58:05'),
(227, 'gagfda', '025605456041', NULL, NULL, NULL, NULL, NULL, 'qS08izp8uCLW3hLIRbqHseEq1XfklVDLFpHaO4qY3rpFpXXXvNqKXvKXiotw', '2026-09-11 08:52:53', '2026-09-11 08:52:53'),
(228, 'Testing', '082164866673', NULL, NULL, NULL, NULL, NULL, '2LpcLEWM00un1TwZwqTWl9GFQjdsgQI3NLblrnq3fxaEcxbv5OjPT2dGhwJV', '2026-09-11 08:57:51', '2026-09-11 08:57:51'),
(229, 'TES', '08116530515', NULL, NULL, NULL, NULL, NULL, '7DJAM8PigndU8paQy8LjKL66V9EwXR6rJWNbjJVcYFxMl5K8UuIW18y29JPs', '2026-09-11 09:47:32', '2026-09-11 09:47:32'),
(230, 'betty bakely', '081269059577', NULL, NULL, NULL, NULL, NULL, 'Xv6faGtJ327xkb6rYvsjIz2ruTht9GT5CrcWESjpbiQiJm7elgHW87zP726V', '2026-09-14 13:18:13', '2026-09-14 13:18:13'),
(231, 'Linda', '081361760067', NULL, NULL, NULL, NULL, NULL, 'EKoIHkQ86jxesPOVlNJSMSjBtjk8rdbTDyBKeHMyijUCO32euILFnaO9AOJE', '2026-09-14 15:20:29', '2026-09-14 15:20:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `venues`
--

CREATE TABLE `venues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_rows` int(11) NOT NULL DEFAULT 10,
  `total_columns` int(11) NOT NULL DEFAULT 12,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `venues`
--

INSERT INTO `venues` (`id`, `name`, `address`, `total_rows`, `total_columns`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Auditorium Sailendra Lt. 3 Vihara Borobudur', 'Vihara Borobudur, Jl. Imam Bonjol No. 21 Medan', 17, 41, 1, '2026-08-28 11:09:18', '2026-08-28 14:51:09');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indeks untuk tabel `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `events_slug_unique` (`slug`),
  ADD KEY `events_venue_id_foreign` (`venue_id`),
  ADD KEY `events_created_by_foreign` (`created_by`);

--
-- Indeks untuk tabel `event_sessions`
--
ALTER TABLE `event_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_sessions_event_id_foreign` (`event_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_code_unique` (`order_code`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_event_session_id_foreign` (`event_session_id`),
  ADD KEY `orders_bank_account_id_foreign` (`bank_account_id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_order_id_foreign` (`order_id`),
  ADD KEY `payments_verified_by_foreign` (`verified_by`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `seat_availabilities`
--
ALTER TABLE `seat_availabilities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `seat_availabilities_event_session_id_seat_master_id_unique` (`event_session_id`,`seat_master_id`),
  ADD KEY `seat_availabilities_seat_master_id_foreign` (`seat_master_id`),
  ADD KEY `seat_availabilities_order_id_index` (`order_id`),
  ADD KEY `seat_availabilities_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `seat_categories`
--
ALTER TABLE `seat_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seat_categories_venue_id_foreign` (`venue_id`);

--
-- Indeks untuk tabel `seat_masters`
--
ALTER TABLE `seat_masters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `seat_masters_venue_id_seat_code_unique` (`venue_id`,`seat_code`),
  ADD KEY `seat_masters_seat_category_id_foreign` (`seat_category_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tickets_ticket_code_unique` (`ticket_code`),
  ADD UNIQUE KEY `tickets_qr_code_hash_unique` (`qr_code_hash`),
  ADD KEY `tickets_order_id_foreign` (`order_id`),
  ADD KEY `tickets_seat_availability_id_foreign` (`seat_availability_id`),
  ADD KEY `tickets_scanned_by_foreign` (`scanned_by`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_number_unique` (`phone_number`);

--
-- Indeks untuk tabel `venues`
--
ALTER TABLE `venues`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `event_sessions`
--
ALTER TABLE `event_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT untuk tabel `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `seat_availabilities`
--
ALTER TABLE `seat_availabilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=609;

--
-- AUTO_INCREMENT untuk tabel `seat_categories`
--
ALTER TABLE `seat_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `seat_masters`
--
ALTER TABLE `seat_masters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=609;

--
-- AUTO_INCREMENT untuk tabel `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=693;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT untuk tabel `venues`
--
ALTER TABLE `venues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `events_venue_id_foreign` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `event_sessions`
--
ALTER TABLE `event_sessions`
  ADD CONSTRAINT `event_sessions_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_bank_account_id_foreign` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_accounts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_event_session_id_foreign` FOREIGN KEY (`event_session_id`) REFERENCES `event_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_verified_by_foreign` FOREIGN KEY (`verified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `seat_availabilities`
--
ALTER TABLE `seat_availabilities`
  ADD CONSTRAINT `seat_availabilities_event_session_id_foreign` FOREIGN KEY (`event_session_id`) REFERENCES `event_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `seat_availabilities_seat_master_id_foreign` FOREIGN KEY (`seat_master_id`) REFERENCES `seat_masters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `seat_availabilities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `seat_categories`
--
ALTER TABLE `seat_categories`
  ADD CONSTRAINT `seat_categories_venue_id_foreign` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `seat_masters`
--
ALTER TABLE `seat_masters`
  ADD CONSTRAINT `seat_masters_seat_category_id_foreign` FOREIGN KEY (`seat_category_id`) REFERENCES `seat_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `seat_masters_venue_id_foreign` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tickets_scanned_by_foreign` FOREIGN KEY (`scanned_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tickets_seat_availability_id_foreign` FOREIGN KEY (`seat_availability_id`) REFERENCES `seat_availabilities` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
