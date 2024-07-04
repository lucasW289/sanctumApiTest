-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 04, 2024 at 10:27 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_07_03_042012_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'API TOKEN', 'ba3f2972cd0ab12675691753d797963b7f29b9b14f4b432e845084bf95fc4121', '[\"*\"]', NULL, NULL, '2024-07-03 08:39:23', '2024-07-03 08:39:23'),
(2, 'App\\Models\\User', 4, 'API TOKEN', '1be1e7cfe2797eb4e7ed5716e6297c554ae02b9f4dea4525c9dc2748723599e5', '[\"*\"]', NULL, NULL, '2024-07-03 19:39:48', '2024-07-03 19:39:48'),
(3, 'App\\Models\\User', 5, 'API TOKEN', '75e935fd3820a4beb85d0c5d3bb63609145ea6be6e227a53531f7d9dca22cd46', '[\"*\"]', NULL, NULL, '2024-07-03 19:41:48', '2024-07-03 19:41:48'),
(8, 'App\\Models\\User', 8, 'API TOKEN', '17141db9d7146b641e2154b7f92cda8ea938c2b4f700a253a56cb9c93ea0efd6', '[\"*\"]', NULL, NULL, '2024-07-03 22:55:27', '2024-07-03 22:55:27'),
(9, 'App\\Models\\User', 8, 'API TOKEN', 'a917a2c9d1a74258d34ba9d75c21a6454630a29cad6d41ee286674ecef99cdfb', '[\"*\"]', NULL, NULL, '2024-07-03 23:03:09', '2024-07-03 23:03:09'),
(10, 'App\\Models\\User', 8, 'API TOKEN', '3c7806b2379490ce1ddc913148e9b3b7ef886d404aabb95323f112fe0cdef651', '[\"*\"]', NULL, NULL, '2024-07-03 23:09:39', '2024-07-03 23:09:39'),
(11, 'App\\Models\\User', 8, 'API TOKEN', 'a1322278be78999da2564d7f400bf2e0d366517d6c0648dfac5c7102c65f4443', '[\"*\"]', NULL, NULL, '2024-07-03 23:09:52', '2024-07-03 23:09:52'),
(12, 'App\\Models\\User', 8, 'API TOKEN', '9ba3986aeb0c265399c97ba70e8f44a1b8e7c167c807149cefffdb4c8514bfef', '[\"*\"]', NULL, NULL, '2024-07-03 23:11:15', '2024-07-03 23:11:15'),
(13, 'App\\Models\\User', 8, 'API TOKEN', '10999dced757c7a371ffe10a8b3e178cee2242dcaa363b740c96b146a20576d8', '[\"*\"]', NULL, NULL, '2024-07-03 23:14:17', '2024-07-03 23:14:17'),
(14, 'App\\Models\\User', 8, 'API TOKEN', 'afb96b1a8ff92f7a186e3e264ba9be16dd138cbfbf17963cda13a6a3efbee1d6', '[\"*\"]', NULL, NULL, '2024-07-03 23:15:34', '2024-07-03 23:15:34'),
(15, 'App\\Models\\User', 8, 'API TOKEN', 'd48aeba58d76c475016d7a7a4b5cee153e21b6e9ed3d1d84b2017b4d90dfb23a', '[\"*\"]', NULL, NULL, '2024-07-03 23:20:44', '2024-07-03 23:20:44'),
(16, 'App\\Models\\User', 8, 'API TOKEN', 'b9c443870c694999ff33b9078947caf27609e4bd3ae2f5b1ffa4516f40c7fe41', '[\"*\"]', NULL, NULL, '2024-07-03 23:21:16', '2024-07-03 23:21:16'),
(17, 'App\\Models\\User', 8, 'API TOKEN', 'ea57b999bea40c639ef6838b8b8b6afdd053b04bb4d4ac334cab0b3ec901699e', '[\"*\"]', NULL, NULL, '2024-07-03 23:22:15', '2024-07-03 23:22:15'),
(18, 'App\\Models\\User', 8, 'API TOKEN', 'b4eaa1d9d973e72144c521e6f436691405eccb526afced7211d39247c59da0c2', '[\"*\"]', NULL, NULL, '2024-07-03 23:23:36', '2024-07-03 23:23:36'),
(19, 'App\\Models\\User', 8, 'API TOKEN', 'f9843377b8948f5f4dad03c282021dc986c399bed693b59bc2653f1c3c8ae68f', '[\"*\"]', NULL, NULL, '2024-07-03 23:24:46', '2024-07-03 23:24:46'),
(20, 'App\\Models\\User', 8, 'API TOKEN', '928251ca38441c6591555f70dda4a92441a3e14f363f94eb7046d9d330172300', '[\"*\"]', NULL, NULL, '2024-07-03 23:27:20', '2024-07-03 23:27:20'),
(21, 'App\\Models\\User', 8, 'API TOKEN', '97bad4ee6e7c779d0a5faa2fe275ea26a2f26056d03435fe167c58fdcbc0adf6', '[\"*\"]', NULL, NULL, '2024-07-03 23:29:04', '2024-07-03 23:29:04'),
(22, 'App\\Models\\User', 8, 'API TOKEN', '3abbce307b9663aebc5385f062c077d45bab740ae1e89b1a4be8c98c53a8e5d6', '[\"*\"]', NULL, NULL, '2024-07-03 23:30:11', '2024-07-03 23:30:11'),
(23, 'App\\Models\\User', 8, 'API TOKEN', 'b763a4c94f42003fe66e8fa6713ef55604b3cc828896e047a500d48ab613528e', '[\"*\"]', NULL, NULL, '2024-07-03 23:31:36', '2024-07-03 23:31:36'),
(24, 'App\\Models\\User', 8, 'API TOKEN', '067c3aff3b472b05ba8d78f1dfbf130b40577afa34c8b2110c9b5dcfdb23a4ca', '[\"*\"]', NULL, NULL, '2024-07-03 23:33:27', '2024-07-03 23:33:27'),
(25, 'App\\Models\\User', 8, 'API TOKEN', 'ab1e4970d4d28b115749d3197754326c9d6614ba5aa6b6cc3c5c3fa6faa3a562', '[\"*\"]', NULL, NULL, '2024-07-03 23:35:33', '2024-07-03 23:35:33'),
(26, 'App\\Models\\User', 6, 'API TOKEN', 'ffeb2c52391e2262f7a689408ff12d470adac48143af914b11bda21fa7c010d8', '[\"*\"]', NULL, NULL, '2024-07-03 23:41:50', '2024-07-03 23:41:50'),
(27, 'App\\Models\\User', 6, 'API TOKEN', '496f171ffe0870e3d45297f0b9f39d731cca7bf65bbb333238fcb0f9bb6d0944', '[\"*\"]', NULL, NULL, '2024-07-03 23:42:12', '2024-07-03 23:42:12'),
(28, 'App\\Models\\User', 6, 'API TOKEN', '8317562143c51ee56260449bd510e7c97133d917f5262869d13ba3d65ec1220e', '[\"*\"]', NULL, NULL, '2024-07-03 23:44:33', '2024-07-03 23:44:33'),
(29, 'App\\Models\\User', 6, 'API TOKEN', 'c46a6e8210c46b10cf8f44440ea1f98989c216e35d1b3a75580b18023d36b2b7', '[\"*\"]', NULL, NULL, '2024-07-03 23:44:37', '2024-07-03 23:44:37'),
(30, 'App\\Models\\User', 6, 'API TOKEN', 'ae0dca820a06dc25e8c2558b1e62f4535ea8f6179990b7cfaba9fc10cdeca07a', '[\"*\"]', NULL, NULL, '2024-07-03 23:44:39', '2024-07-03 23:44:39'),
(31, 'App\\Models\\User', 6, 'API TOKEN', '66bb55a95e8bfbbd4f1670b2e84b9febf8b79ac9e9f086fb72c775f04b947f42', '[\"*\"]', NULL, NULL, '2024-07-03 23:44:40', '2024-07-03 23:44:40'),
(32, 'App\\Models\\User', 6, 'API TOKEN', 'ba458ad7bfbba474ff236fea6c282b1b71cbf411cd86dd63ec9a76d0999ce118', '[\"*\"]', NULL, NULL, '2024-07-03 23:44:42', '2024-07-03 23:44:42'),
(33, 'App\\Models\\User', 8, 'API TOKEN', 'b2fabcc8da0fbd7c3b80e868f628d5873cd4b3ef4825c40eb31fd32e297a34f9', '[\"*\"]', NULL, NULL, '2024-07-03 23:44:55', '2024-07-03 23:44:55'),
(34, 'App\\Models\\User', 8, 'API TOKEN', '9179dd53ff3c75ff764a9e0c15646f633bd6c1da5948e9e3800cf1ba6c9041d1', '[\"*\"]', NULL, NULL, '2024-07-03 23:47:19', '2024-07-03 23:47:19'),
(35, 'App\\Models\\User', 8, 'API TOKEN', '55611080b27ea7e343392063d6f30a8ca2ac9e7341d99ef4b2d1add8960ac1d0', '[\"*\"]', NULL, NULL, '2024-07-03 23:51:06', '2024-07-03 23:51:06'),
(36, 'App\\Models\\User', 8, 'API TOKEN', 'd1c2c540b6b83332c8a09c0a140cd2a201574d2f757313dd91504980dfe8eee2', '[\"*\"]', NULL, NULL, '2024-07-04 00:20:15', '2024-07-04 00:20:15'),
(37, 'App\\Models\\User', 8, 'API TOKEN', 'db490f3fdaf38a7bfaab1a47597372686127bdc0d84042a2d3e85e1560d91e58', '[\"*\"]', NULL, NULL, '2024-07-04 00:21:51', '2024-07-04 00:21:51'),
(38, 'App\\Models\\User', 8, 'API TOKEN', '72b7ef20b2ad6a4828b7335d68de4f18fedccaa08617b58b79735d3ef5a81bcf', '[\"*\"]', NULL, NULL, '2024-07-04 00:24:19', '2024-07-04 00:24:19'),
(39, 'App\\Models\\User', 8, 'API TOKEN', '86758c2694a69372ceed38a868fd77a6ce8583c11cf00da45963a3a4dda42b0a', '[\"*\"]', NULL, NULL, '2024-07-04 00:26:32', '2024-07-04 00:26:32'),
(40, 'App\\Models\\User', 8, 'API TOKEN', '599dca945f693cbf31e6292ef7b69809cb4f9b2331d4cdc929911026edf5803f', '[\"*\"]', NULL, NULL, '2024-07-04 00:29:47', '2024-07-04 00:29:47'),
(41, 'App\\Models\\User', 8, 'API TOKEN', 'fb27cdafd519abe4e192b67bfd64d541b5702aa9ba54ffd3776e79cb8162a3b4', '[\"*\"]', NULL, NULL, '2024-07-04 00:34:49', '2024-07-04 00:34:49'),
(42, 'App\\Models\\User', 6, 'API TOKEN', '67db74b07476c6a3b8cedbe1bb68db8df844e9138b9acb3127619f9e93bfcb1a', '[\"*\"]', NULL, NULL, '2024-07-04 00:35:46', '2024-07-04 00:35:46'),
(43, 'App\\Models\\User', 8, 'API TOKEN', '09d6e3a920c9affded6eff42e12ce441c42978c178418b4ba3d592c0a538a134', '[\"*\"]', NULL, NULL, '2024-07-04 00:37:06', '2024-07-04 00:37:06'),
(44, 'App\\Models\\User', 8, 'API TOKEN', '85b85b94f79a97c10a0ff731c2cd2433d32c437ca1ddbbef24f2d79afe0e4099', '[\"*\"]', NULL, NULL, '2024-07-04 00:38:46', '2024-07-04 00:38:46'),
(45, 'App\\Models\\User', 8, 'API TOKEN', 'c8af750917e8203992182f0cc22fb0e9a99eed906b14ae60555c56ec4eb4a471', '[\"*\"]', NULL, NULL, '2024-07-04 00:42:11', '2024-07-04 00:42:11'),
(46, 'App\\Models\\User', 8, 'API TOKEN', '80dea894393bf4a83d044edfe07e063e9d34f37e160ff4494d09ba1722df0da9', '[\"*\"]', NULL, NULL, '2024-07-04 00:55:58', '2024-07-04 00:55:58'),
(47, 'App\\Models\\User', 6, 'API TOKEN', '53d93d148d72609b9b8f1ca75068cf949b0a4930abd30202e52644725f00c512', '[\"*\"]', NULL, NULL, '2024-07-04 01:01:16', '2024-07-04 01:01:16'),
(48, 'App\\Models\\User', 8, 'API TOKEN', '2d1c76852c33d4e6863d447b9222abc831fabdaa386d69bcb9b0d1a587ffef3d', '[\"*\"]', NULL, NULL, '2024-07-04 01:05:52', '2024-07-04 01:05:52'),
(49, 'App\\Models\\User', 6, 'API TOKEN', 'b13976b1f1ef07745571508963ccb31118d66b54ef9f86a63e0131b5a49450c0', '[\"*\"]', NULL, NULL, '2024-07-04 01:07:19', '2024-07-04 01:07:19'),
(50, 'App\\Models\\User', 6, 'API TOKEN', '26626355403236d7af627079b8fedb559a57e063d0c6e429c797bc3cfcc8dad5', '[\"*\"]', NULL, NULL, '2024-07-04 01:16:18', '2024-07-04 01:16:18'),
(51, 'App\\Models\\User', 8, 'API TOKEN', '766833c4a0c609823197617c5362e87655c0bcf14f187075756c21781736e477', '[\"*\"]', NULL, NULL, '2024-07-04 01:18:55', '2024-07-04 01:18:55'),
(52, 'App\\Models\\User', 9, 'API TOKEN', '5f38aff37824dd3ff76aa5fb85dbf90ca123dd8e7f21b2b31bf891091b76db89', '[\"*\"]', NULL, NULL, '2024-07-04 01:21:25', '2024-07-04 01:21:25');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('gk9fkUiyBV7XK2W6wAq9vZOUGDZwc4rNTiyD10Vx', NULL, '127.0.0.1', 'PostmanRuntime/7.39.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzR4TDcwRUJSdkJmMnFJRExncmttWE9vRjgxeFVEYm1LblY3cWJ0dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9maWxlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1720075323),
('yJaxrF6GXq7gbfONvH2YPl8k019n35aVKdyXkoBQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYmpaamszWnFFN0xvbEZNalFKMm4zaWxzbkJjczNCd3NPOXo1ZDBUdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9maWxlIjt9fQ==', 1720081273);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'lucas', 'luca@gmail.com', NULL, '$2y$12$8Yb0C6Dxkd.VJtbX8zW7GuJpC/.wARjIVmFy5RY71JUj5TLKtVo36', NULL, '2024-07-03 08:37:31', '2024-07-03 08:37:31'),
(3, 'lucas', 'luc@gmail.com', NULL, '$2y$12$3jA5.Ty7R33xBFyQFk62xO67NAacXtq.ZSMkLb7p3AglwWoBPXXaq', NULL, '2024-07-03 08:39:23', '2024-07-03 08:39:23'),
(4, 'lucas', 'lu@gmail.com', NULL, '$2y$12$eSlJvJgEP8e8T0jUnH4U1eWozeqTr6ASmQBUJGMXdhueJ8NSYgpty', NULL, '2024-07-03 19:39:48', '2024-07-03 19:39:48'),
(5, 'lucas', 'l@gmail.com', NULL, '$2y$12$W4/JhrELQUjjI8smIT6zT.Oe/bX3.D1SwayE54lxA90cF8.sLvKfC', NULL, '2024-07-03 19:41:48', '2024-07-03 19:41:48'),
(6, 'lucas', 'testing@gmail.com', NULL, '$2y$12$hDfwGAEitJWBVteh7K22wOShesXJFuE9AWt9If6rN.QzdyrbtFPe6', NULL, '2024-07-03 19:43:22', '2024-07-03 19:43:22'),
(7, 'lucas', 'test@gmail.com', NULL, '$2y$12$pCMQ2jOfhRHD5THNrsYxJuho4GGhm.pJqf2pXnJTzVoUDvYUfsxcC', NULL, '2024-07-03 20:18:02', '2024-07-03 20:18:02'),
(8, 'test2', 'test2@gmail.com', NULL, '$2y$12$9FQUz.1s7zS6mEaxzNWHMO4JLJaqedWW0OaF002iKR0Tne/..gfPa', NULL, '2024-07-03 22:55:27', '2024-07-03 22:55:27'),
(9, 'test3', 'aungphyolinn289@gmail.com', NULL, '$2y$12$rcikvCp0NkcYUwamtj.kFucVIhxnjNQn.nXpmojb/6PPdsDemKqVe', NULL, '2024-07-04 01:21:25', '2024-07-04 01:21:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
