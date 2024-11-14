-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 08, 2024 at 10:56 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `disposisi`
--

-- --------------------------------------------------------

--
-- Table structure for table `disposisis`
--

CREATE TABLE `disposisis` (
  `id` bigint UNSIGNED NOT NULL,
  `surat_id` bigint UNSIGNED NOT NULL,
  `staf_id` bigint UNSIGNED NOT NULL,
  `kaprodi_id` bigint UNSIGNED NOT NULL,
  `status` enum('Menunggu','Disetujui','Ditolak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Menunggu',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kaprodis`
--

CREATE TABLE `kaprodis` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prodi_kaprodi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kaprodis`
--

INSERT INTO `kaprodis` (`id`, `user_id`, `nama`, `prodi_kaprodi`, `created_at`, `updated_at`) VALUES
(1, 2, 'Kaprodi Teknik', 'Teknik Mesin', '2024-10-03 23:08:19', '2024-10-03 23:08:19');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswas`
--

CREATE TABLE `mahasiswas` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `nim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prodi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mahasiswas`
--

INSERT INTO `mahasiswas` (`id`, `user_id`, `nim`, `nama`, `prodi`, `email`, `created_at`, `updated_at`) VALUES
(1, 3, '123456789', 'NABSS', 'Teknik Elektro', 'mahasiswa@gmail.com', '2024-10-03 23:08:19', '2024-10-08 08:43:23'),
(2, 3, '220602017', 'Ameeeeeeel', 'Teknik Informatika', 'amel@gmail.com', '2024-10-04 08:01:51', '2024-10-08 08:55:38'),
(4, 4, '123456', 'mhs', 'Teknik Inf', 'mahasiswa1@gmail.com', '2024-10-08 07:11:06', '2024-10-08 07:29:47'),
(5, 7, '19002093', 'sheva aja', 'Teknik Elektro', 'sheva@gmail.com', '2024-11-05 14:46:12', '2024-11-05 14:46:12'),
(6, 8, '1234467', 'fachrur rozi', 'Teknik Informatika', 'panjul123@gmail.com', '2024-11-06 06:22:21', '2024-11-06 06:22:21');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_10_01_185741_create_mahasiswas_table', 1),
(6, '2024_10_01_185935_create_surats_table', 1),
(7, '2024_10_01_190131_create_disposisis_table', 1),
(8, '2024_10_01_190232_create_prodis_table', 1),
(9, '2024_10_03_181535_create_permission_tables', 1),
(10, '2024_10_03_182636_create_stafs_table', 1),
(11, '2024_10_03_182726_create_kaprodis_table', 1),
(12, '2024_10_04_151942_alter_surat', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 4),
(4, 'App\\Models\\User', 5),
(5, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 7),
(3, 'App\\Models\\User', 8);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'read surat', 'web', '2024-10-04 09:32:56', '2024-10-04 09:32:56'),
(2, 'create surat', 'web', '2024-10-04 09:33:33', '2024-10-04 09:33:33'),
(3, 'update surat', 'web', '2024-10-04 09:33:47', '2024-10-04 09:33:47'),
(4, 'delete surat', 'web', '2024-10-04 09:33:58', '2024-10-04 09:33:58');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prodis`
--

CREATE TABLE `prodis` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_prodi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'staff', 'web', '2024-10-03 23:08:13', '2024-10-03 23:08:13'),
(2, 'kaprodi', 'web', '2024-10-03 23:08:13', '2024-10-03 23:08:13'),
(3, 'mahasiswa', 'web', '2024-10-03 23:08:13', '2024-10-03 23:08:13'),
(4, 'admin', 'web', '2024-10-04 09:48:45', '2024-10-04 09:48:45'),
(5, 'Kaprodi Teknik Informatika', 'web', '2024-10-08 08:32:03', '2024-10-08 08:32:03'),
(6, 'Kaprodi Teknik Elektro', 'web', '2024-10-08 08:34:25', '2024-10-08 08:34:25'),
(7, 'Kaprodi Teknik Industri', 'web', '2024-10-08 08:35:41', '2024-10-08 08:35:41'),
(8, 'Kaprodi Teknik Kimia', 'web', '2024-10-08 08:36:49', '2024-10-08 08:36:49');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(3, 1),
(1, 2),
(3, 2),
(1, 3),
(2, 3),
(3, 3),
(1, 5),
(3, 5),
(1, 6),
(3, 6),
(1, 7),
(3, 7),
(1, 8),
(3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `stafs`
--

CREATE TABLE `stafs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prodi_staf` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stafs`
--

INSERT INTO `stafs` (`id`, `user_id`, `nama`, `prodi_staf`, `created_at`, `updated_at`) VALUES
(1, 1, 'Staff Teknik', 'Teknik Informatika', '2024-10-03 23:08:19', '2024-10-03 23:08:19');

-- --------------------------------------------------------

--
-- Table structure for table `surats`
--

CREATE TABLE `surats` (
  `id` bigint UNSIGNED NOT NULL,
  `jenis_surat` enum('Keterangan Aktif Kuliah','Izin Magang','Izin Penelitian') COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail_surat` json NOT NULL,
  `tanggal_pengajuan` date NOT NULL,
  `status` enum('Menunggu','Diproses','Disetujui','Ditolak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Menunggu',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mahasiswa_id` bigint UNSIGNED NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `surats`
--

INSERT INTO `surats` (`id`, `jenis_surat`, `detail_surat`, `tanggal_pengajuan`, `status`, `created_at`, `updated_at`, `mahasiswa_id`, `file`) VALUES
(1, 'Keterangan Aktif Kuliah', '{\"semester\": \"5\", \"tahun_ajaran\": \"2024-2025\"}', '2024-10-04', 'Menunggu', '2024-10-04 00:04:26', '2024-10-04 08:14:04', 1, ''),
(2, 'Izin Magang', '{\"perusahaan\": \"PT Freeport \", \"tanggal_mulai\": \"2024-10-04\", \"tanggal_selesai\": \"2024-10-05\"}', '2024-10-04', 'Menunggu', '2024-10-04 08:12:58', '2024-10-04 08:12:58', 2, ''),
(3, 'Keterangan Aktif Kuliah', '{\"semester\": \"5\", \"tahun_ajaran\": \"2024-2025\"}', '2024-10-04', 'Diproses', '2024-10-04 08:26:23', '2024-10-08 08:57:13', 2, '01J9BA66Y3MTZCK5FV63MV7M4X.pdf'),
(4, 'Keterangan Aktif Kuliah', '{\"semester\": \"5\", \"tahun_ajaran\": \"2024-2025\"}', '2024-10-08', 'Diproses', '2024-10-08 07:12:49', '2024-11-05 17:01:44', 4, '01J9NFJCVFZ9W3R9C201MVA6J6.doc'),
(5, 'Keterangan Aktif Kuliah', '{\"semester\": \"5\", \"tahun_ajaran\": \"2024-2025\"}', '2024-10-08', 'Disetujui', '2024-10-08 07:24:08', '2024-10-11 07:00:10', 1, '01J9NG73JPADE0NSHRSPZ6HFCH.doc'),
(6, 'Izin Magang', '{\"perusahaan\": \"pt \", \"tanggal_mulai\": \"2024-10-31\", \"tanggal_selesai\": \"2024-11-09\"}', '2024-10-31', 'Diproses', '2024-10-31 05:38:48', '2024-10-31 05:58:27', 1, '01JBGHARM4T7K9ACP1ABDAX727.doc'),
(8, 'Keterangan Aktif Kuliah', '{\"semester\": \"5\", \"tahun_ajaran\": \"2024-2025\"}', '2024-10-31', 'Disetujui', '2024-10-31 06:57:09', '2024-10-31 07:10:00', 1, '01JBGNT84GAJ6VMQDVGSH7S3NN.pdf'),
(9, 'Keterangan Aktif Kuliah', '{\"semester\": \"9\", \"tahun_ajaran\": \"2024-2025\"}', '2024-11-05', 'Diproses', '2024-11-05 16:42:45', '2024-11-05 17:00:41', 5, '01JBYKA3JNMSNS2VYDWAQ0GF9V.pdf'),
(10, 'Keterangan Aktif Kuliah', '{\"semester\": \"5\", \"tahun_ajaran\": \"2024-2025\"}', '2024-11-06', 'Disetujui', '2024-11-06 06:28:10', '2024-11-08 09:09:43', 6, '01JC02HFKHNFW0NFH64GXA4D1T.pdf'),
(11, 'Izin Magang', '{\"perusahaan\": \"pt petroo\", \"tanggal_mulai\": \"2024-11-21\", \"tanggal_selesai\": \"2024-11-30\"}', '2024-11-08', 'Ditolak', '2024-11-08 08:19:49', '2024-11-08 09:00:31', 5, '01JC5DQBXEPZRC5Q820A6Q8J1Y.pdf'),
(12, 'Keterangan Aktif Kuliah', '{\"semester\": \"6\", \"tahun_ajaran\": \"2024\"}', '2024-11-08', 'Menunggu', '2024-11-08 09:05:01', '2024-11-08 09:05:01', 6, '01JC5GA44FGHXKR7TCNN5K0TVD.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'staff', 'staff@gmail.com', NULL, '$2y$10$GLhacTrV7m7WFaakK3VpJeIva8wyMZlSTBNZmctrZ9yQhPMifwT8e', NULL, '2024-10-03 23:08:18', '2024-10-03 23:08:18'),
(2, 'kaprodi', 'kaprodi@gmail.com', NULL, '$2y$10$xGkKj8bsd2ae5Q2IIdIvX.Iy7aaB63lKwbggBy5MdsmDSkhSQKHuy', NULL, '2024-10-03 23:08:19', '2024-10-03 23:08:19'),
(3, 'mahasiswa', 'mahasiswa@gmail.com', NULL, '$2y$10$XwDlR5A2fQs9Mf4g297as.exgK9izmZGM4obhdhwZP4.iodsxUVGe', NULL, '2024-10-03 23:08:19', '2024-10-03 23:08:19'),
(4, 'fafan', 'ikfanidifangga@gmail.com', NULL, '$2y$10$oiVzGUXwcNqQypqTSVHa6OjkpnjUxpTq61sw1wF418pQ3FHtMyf4S', NULL, '2024-10-04 07:51:17', '2024-10-04 09:45:45'),
(5, 'admin', 'admin@gmail.com', NULL, '$2y$10$y9nHxCmYStm9U.hTwSCN3ONiKKSCUssmoZW3sN7lrUw9R2L3CSjKO', NULL, '2024-10-04 09:49:35', '2024-10-04 09:49:35'),
(6, 'Henny Dwi Bhakti, S.Kom., M.Kom.', 'informatika@gmail.com', NULL, '$2y$10$dODZ.KQckrR62iuivREf7.u4alySlDACs9wNEa.7P0uEMnfbLDzNG', NULL, '2024-10-08 08:41:02', '2024-10-31 06:39:31'),
(7, 'shevaa', 'sheva@gmail.com', NULL, '$2y$10$utX5x6mOGzbLrCWnqokvgOk4oW9W.qHmP7nttMY4s6Gov6q2yoEqO', NULL, '2024-11-05 14:42:53', '2024-11-05 14:42:53'),
(8, 'fachrur rozi', 'panjul123@gmail.com', NULL, '$2y$10$t1P4a5vIngcA98OJ4.op0O.nD0CDvRs69yPVwFUvuCCvJpLvTir.i', NULL, '2024-11-06 06:19:47', '2024-11-06 06:19:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `disposisis`
--
ALTER TABLE `disposisis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disposisis_surat_id_foreign` (`surat_id`),
  ADD KEY `disposisis_staf_id_foreign` (`staf_id`),
  ADD KEY `disposisis_kaprodi_id_foreign` (`kaprodi_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `kaprodis`
--
ALTER TABLE `kaprodis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kaprodis_user_id_foreign` (`user_id`);

--
-- Indexes for table `mahasiswas`
--
ALTER TABLE `mahasiswas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mahasiswas_nim_unique` (`nim`),
  ADD UNIQUE KEY `mahasiswas_email_unique` (`email`),
  ADD KEY `mahasiswas_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `prodis`
--
ALTER TABLE `prodis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `stafs`
--
ALTER TABLE `stafs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stafs_user_id_foreign` (`user_id`);

--
-- Indexes for table `surats`
--
ALTER TABLE `surats`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `disposisis`
--
ALTER TABLE `disposisis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kaprodis`
--
ALTER TABLE `kaprodis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mahasiswas`
--
ALTER TABLE `mahasiswas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prodis`
--
ALTER TABLE `prodis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `stafs`
--
ALTER TABLE `stafs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `surats`
--
ALTER TABLE `surats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `disposisis`
--
ALTER TABLE `disposisis`
  ADD CONSTRAINT `disposisis_kaprodi_id_foreign` FOREIGN KEY (`kaprodi_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `disposisis_staf_id_foreign` FOREIGN KEY (`staf_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `disposisis_surat_id_foreign` FOREIGN KEY (`surat_id`) REFERENCES `surats` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kaprodis`
--
ALTER TABLE `kaprodis`
  ADD CONSTRAINT `kaprodis_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mahasiswas`
--
ALTER TABLE `mahasiswas`
  ADD CONSTRAINT `mahasiswas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stafs`
--
ALTER TABLE `stafs`
  ADD CONSTRAINT `stafs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
