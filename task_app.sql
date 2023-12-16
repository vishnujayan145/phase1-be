-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2023 at 07:05 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_12_14_085618_users', 2),
(8, '2023_12_15_103806_create_task_modals_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_modals`
--

CREATE TABLE IF NOT EXISTS `task_modals` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_modals`
--

INSERT INTO `task_modals` (`id`, `user_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, '5', 'code', 'gdgfvhgj', '2023-12-15 06:17:48', '2023-12-15 06:17:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(2000) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `token`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'amrutha', 'suresh', 'amrutha@gmail.com', '$2y$12$vwyLNy8FVzdCCZNzarCzBumRKtwnY4kFjhdO3ZaVkgWIh2fNXcrqi', NULL, NULL, NULL, '2023-12-15 04:25:13', '2023-12-15 04:25:13'),
(2, 'Vishnu', 'jayan', 'vishnu@gmail.com', '$2y$12$G.KRS9oZ5bOxVjOIeYk9ueGPmiF4MjQx6a/dz9ochl8ocdRYsDyjm', NULL, NULL, NULL, '2023-12-15 04:35:49', '2023-12-15 04:35:49'),
(3, 'Akhila', 'prasad', 'akhila@gmail.com', '$2y$12$/c18fFMD3UvqJ9HZNWSUe.R8xLfmXk8Bpbj1KBOFqBjSFcIibdGi.', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNzAyNjM1ODYwLCJleHAiOjE3MDI2Mzk0NjAsIm5iZiI6MTcwMjYzNTg2MCwianRpIjoiZXJpQXg1U2VaUExFYmVPZyIsInN1YiI6IjMiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.RHwSkUXI3xwLRX-Mn6ywEI2Nag6rC5xFdxrw0pBsB3Q', NULL, NULL, '2023-12-15 04:37:03', '2023-12-15 04:54:20'),
(5, 'Arathi', 'Ajith', 'arathi@gmail.com', '$2y$12$WxXdqCbdB9W/6DcsDY2W7uJM5KVL5P5T5mrxeSzx0KpCoGHrriozS', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNzAyNjQwNjA5LCJleHAiOjE3MDI2NDQyMDksIm5iZiI6MTcwMjY0MDYwOSwianRpIjoia2t5cExkSWd5Y29Ub3BqWiIsInN1YiI6IjUiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.d9cmdQ19qaCfSncHpsej-HK3beui9a31V2Oz1y6z5lE', NULL, NULL, '2023-12-15 06:12:04', '2023-12-15 06:13:29'),
(6, 'jayan', 'r', 'jayan@gmail.com', '$2y$12$L/u4QAFpGOIHm1OadtB1AuWTzAkePb9KNAX6x3DxTQ3K2lvHqBome', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNzAyNjU5MzQ0LCJleHAiOjE3MDI2NjI5NDQsIm5iZiI6MTcwMjY1OTM0NCwianRpIjoibkFSWUZJMGVGbWRYbVVvTyIsInN1YiI6IjYiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.a7pu6zm2_ck_Avx0ytjQLxtyYW1SO03lkU2z8NradsY', NULL, NULL, '2023-12-15 11:21:28', '2023-12-15 11:25:44');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
