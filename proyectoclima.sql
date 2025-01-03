-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-01-2025 a las 22:58:08
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectoclima`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('lebili8544@stikezz.com|127.0.0.1', 'i:2;', 1734028613),
('lebili8544@stikezz.com|127.0.0.1:timer', 'i:1734028613;', 1734028613),
('yeroen.medina@ucsp.edu.pe|127.0.0.1', 'i:1;', 1734244451),
('yeroen.medina@ucsp.edu.pe|127.0.0.1:timer', 'i:1734244451;', 1734244451),
('yeroen@gmail.com|127.0.0.1', 'i:2;', 1734028421),
('yeroen@gmail.com|127.0.0.1:timer', 'i:1734028421;', 1734028421);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
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
-- Estructura de tabla para la tabla `jobs`
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
-- Estructura de tabla para la tabla `job_batches`
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
-- Estructura de tabla para la tabla `lugares`
--

CREATE TABLE `lugares` (
  `idLugares` int(11) NOT NULL,
  `ubicacion` varchar(100) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `idSensores` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lugares`
--

INSERT INTO `lugares` (`idLugares`, `ubicacion`, `estado`, `idSensores`) VALUES
(1, 'arequipa', 0, 1),
(2, 'camana', 1, 1),
(3, 'caraveli', 1, 1),
(4, 'castilla', 1, 1),
(5, 'caylloma', 1, 2),
(6, 'condesuyos', 1, 2),
(7, 'islay', 1, 1),
(8, 'union', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(6, '2024_12_12_064648_add_role_to_users_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('yeroen.medina@gmail.com', '$2y$12$0iVAh/FbjhtgWwBKhCRSfe1VjWRVoVJkXLThiyJigZih0ml6Eo5FW', '2024-12-12 22:29:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros`
--

CREATE TABLE `registros` (
  `idRegistro` int(11) NOT NULL,
  `temperatura` int(11) NOT NULL,
  `humedad` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idLugares` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registros`
--

INSERT INTO `registros` (`idRegistro`, `temperatura`, `humedad`, `fecha_hora`, `idLugares`) VALUES
(1, 18, 40, '2024-12-08 00:00:00', 4),
(2, 15, 45, '2024-12-08 00:00:00', 5),
(3, 18, 35, '2024-12-08 00:00:00', 6),
(4, 25, 30, '2024-12-08 00:00:00', 7),
(5, 20, 37, '2024-12-08 00:00:00', 8),
(6, 19, 40, '2024-12-08 00:00:00', 1),
(7, 25, 30, '2024-12-08 00:00:00', 2),
(8, 15, 45, '2024-12-08 00:00:00', 3),
(9, 17, 41, '2024-12-09 00:00:00', 4),
(10, 15, 35, '2024-12-09 00:00:00', 5),
(11, 19, 32, '2024-12-09 00:00:00', 6),
(12, 24, 50, '2024-12-09 00:00:00', 7),
(13, 25, 45, '2024-12-09 00:00:00', 8),
(14, 19, 30, '2024-12-09 00:00:00', 1),
(15, 25, 35, '2024-12-09 00:00:00', 2),
(16, 19, 41, '2024-12-09 00:00:00', 3),
(17, 18, 32, '2024-12-10 00:00:00', 4),
(18, 22, 17, '2024-12-19 18:34:55', 1),
(19, 22, 17, '2024-12-19 18:34:56', 2),
(20, 22, 17, '2024-12-19 18:34:57', 3),
(21, 22, 17, '2024-12-19 18:34:59', 4),
(22, 22, 17, '2024-12-19 18:35:00', 5),
(23, 22, 17, '2024-12-19 18:35:01', 6),
(24, 22, 17, '2024-12-19 18:35:02', 7),
(25, 22, 17, '2024-12-19 18:35:04', 8),
(26, 22, 17, '2024-12-19 18:35:15', 1),
(27, 22, 17, '2024-12-19 18:35:17', 2),
(28, 22, 17, '2024-12-19 18:35:18', 3),
(29, 22, 17, '2024-12-19 18:35:19', 4),
(30, 22, 17, '2024-12-19 18:35:21', 5),
(31, 22, 18, '2024-12-19 18:35:22', 6),
(32, 22, 17, '2024-12-19 18:35:24', 7),
(33, 22, 17, '2024-12-19 18:35:25', 8),
(34, 22, 17, '2024-12-19 18:35:36', 1),
(35, 22, 18, '2024-12-19 18:35:37', 2),
(36, 22, 18, '2024-12-19 18:35:39', 3),
(37, 22, 17, '2024-12-19 18:35:40', 4),
(38, 22, 17, '2024-12-19 18:35:41', 5),
(39, 22, 17, '2024-12-19 18:35:42', 6),
(40, 22, 17, '2024-12-19 18:35:43', 7),
(41, 22, 17, '2024-12-19 18:35:45', 8),
(42, 22, 17, '2024-12-19 18:35:56', 1),
(43, 22, 18, '2024-12-19 18:35:57', 2),
(44, 22, 17, '2024-12-19 18:35:59', 3),
(45, 22, 17, '2024-12-19 18:36:00', 4),
(46, 22, 17, '2024-12-19 18:36:01', 5),
(47, 22, 18, '2024-12-19 18:36:02', 6),
(48, 22, 17, '2024-12-19 18:36:03', 7),
(49, 22, 17, '2024-12-19 18:36:05', 8),
(50, 22, 17, '2024-12-19 18:36:16', 1),
(51, 22, 17, '2024-12-19 18:36:17', 2),
(52, 22, 17, '2024-12-19 18:36:18', 3),
(53, 22, 17, '2024-12-19 18:36:20', 4),
(54, 22, 17, '2024-12-19 18:36:21', 5),
(55, 22, 17, '2024-12-19 18:36:23', 6),
(56, 22, 17, '2024-12-19 18:36:24', 7),
(57, 22, 17, '2024-12-19 18:36:25', 8),
(58, 22, 17, '2024-12-19 18:36:36', 1),
(59, 22, 17, '2024-12-19 18:36:38', 2),
(60, 22, 17, '2024-12-19 18:36:39', 3),
(61, 22, 17, '2024-12-19 18:36:40', 4),
(62, 22, 17, '2024-12-19 18:36:42', 5),
(63, 22, 17, '2024-12-19 18:36:43', 6),
(64, 22, 18, '2024-12-19 18:36:44', 7),
(65, 22, 17, '2024-12-19 18:36:45', 8),
(66, 21, 17, '2024-12-19 18:36:57', 1),
(67, 21, 17, '2024-12-19 18:36:58', 2),
(68, 21, 17, '2024-12-19 18:36:59', 3),
(69, 21, 17, '2024-12-19 18:37:00', 4),
(70, 21, 17, '2024-12-19 18:37:01', 5),
(71, 21, 17, '2024-12-19 18:37:03', 6),
(72, 21, 17, '2024-12-19 18:37:04', 7),
(73, 21, 18, '2024-12-19 18:37:05', 8),
(74, 21, 17, '2024-12-19 18:37:17', 1),
(75, 21, 17, '2024-12-19 18:37:18', 2),
(76, 21, 17, '2024-12-19 18:37:19', 3),
(77, 21, 17, '2024-12-19 18:37:20', 4),
(78, 21, 17, '2024-12-19 18:37:21', 5),
(79, 21, 17, '2024-12-19 18:37:23', 6),
(80, 21, 17, '2024-12-19 18:37:24', 7),
(81, 21, 17, '2024-12-19 18:37:25', 8),
(82, 22, 17, '2024-12-19 18:38:13', 1),
(83, 22, 17, '2024-12-19 18:38:14', 2),
(84, 22, 17, '2024-12-19 18:38:16', 3),
(85, 22, 17, '2024-12-19 18:38:17', 4),
(86, 22, 17, '2024-12-19 18:38:18', 5),
(87, 22, 18, '2024-12-19 18:38:20', 6),
(88, 22, 17, '2024-12-19 18:38:21', 7),
(89, 22, 17, '2024-12-19 18:38:22', 8),
(90, 22, 19, '2024-12-19 18:38:48', 1),
(91, 20, 13, '2024-12-19 18:38:49', 2),
(92, 22, 13, '2024-12-19 18:38:50', 3),
(93, 15, 25, '2024-12-19 18:38:52', 4),
(94, 27, 11, '2024-12-19 18:38:53', 5),
(95, 25, 13, '2024-12-19 18:38:54', 6),
(96, 30, 25, '2024-12-19 18:38:55', 7),
(97, 15, 16, '2024-12-19 18:38:57', 8),
(98, 25, 19, '2024-12-19 18:39:08', 1),
(99, 15, 13, '2024-12-19 18:39:09', 2),
(100, 22, 11, '2024-12-19 18:39:11', 3),
(101, 30, 19, '2024-12-19 18:39:12', 4),
(102, 20, 16, '2024-12-19 18:39:13', 5),
(103, 15, 16, '2024-12-19 18:39:14', 6),
(104, 17, 11, '2024-12-19 18:39:16', 7),
(105, 20, 25, '2024-12-19 18:39:17', 8),
(106, 22, 22, '2024-12-19 18:39:29', 1),
(107, 30, 23, '2024-12-19 18:39:30', 2),
(108, 22, 14, '2024-12-19 18:39:31', 3),
(109, 25, 11, '2024-12-19 18:39:33', 4),
(110, 32, 23, '2024-12-19 18:39:34', 5),
(111, 32, 16, '2024-12-19 18:39:35', 6),
(112, 35, 22, '2024-12-19 18:39:36', 7),
(113, 32, 22, '2024-12-19 18:39:38', 8),
(114, 28, 29, '2024-12-19 18:39:49', 1),
(115, 18, 30, '2024-12-19 18:39:50', 2),
(116, 18, 29, '2024-12-19 18:39:52', 3),
(117, 20, 27, '2024-12-19 18:39:53', 4),
(118, 23, 36, '2024-12-19 18:39:54', 5),
(119, 18, 39, '2024-12-19 18:39:55', 6),
(120, 20, 41, '2024-12-19 18:39:57', 7),
(121, 20, 33, '2024-12-19 18:39:58', 8),
(122, 17, 12, '2024-12-19 18:40:09', 1),
(123, 19, 19, '2024-12-19 18:40:10', 2),
(124, 29, 18, '2024-12-19 18:40:12', 3),
(125, 22, 22, '2024-12-19 18:40:13', 4),
(126, 19, 18, '2024-12-19 18:40:14', 5),
(127, 17, 24, '2024-12-19 18:40:15', 6),
(128, 32, 22, '2024-12-19 18:40:17', 7),
(129, 19, 27, '2024-12-19 18:40:18', 8),
(130, 25, 13, '2024-12-19 18:41:05', 1),
(131, 20, 16, '2024-12-19 18:41:06', 2),
(132, 25, 16, '2024-12-19 18:41:08', 3),
(133, 25, 23, '2024-12-19 18:41:09', 4),
(134, 25, 16, '2024-12-19 18:41:10', 5),
(135, 22, 11, '2024-12-19 18:41:11', 6),
(136, 17, 20, '2024-12-19 18:41:13', 7),
(137, 25, 10, '2024-12-19 18:41:14', 8),
(138, 25, 19, '2024-12-19 18:41:36', 1),
(139, 19, 16, '2024-12-19 18:41:37', 2),
(140, 24, 19, '2024-12-19 18:41:38', 3),
(141, 23, 19, '2024-12-19 18:41:40', 4),
(142, 23, 13, '2024-12-19 18:41:41', 5),
(143, 23, 14, '2024-12-19 18:41:42', 6),
(144, 21, 15, '2024-12-19 18:41:43', 7),
(145, 25, 13, '2024-12-19 18:41:44', 8),
(146, 24, 17, '2024-12-19 18:41:56', 1),
(147, 25, 19, '2024-12-19 18:41:57', 2),
(148, 25, 18, '2024-12-19 18:41:58', 3),
(149, 19, 17, '2024-12-19 18:41:59', 4),
(150, 23, 14, '2024-12-19 18:42:00', 5),
(151, 23, 14, '2024-12-19 18:42:02', 6),
(152, 23, 16, '2024-12-19 18:42:03', 7),
(153, 19, 14, '2024-12-19 18:42:04', 8),
(154, 20, 18, '2024-12-19 18:42:15', 1),
(155, 21, 19, '2024-12-19 18:42:16', 2),
(156, 25, 17, '2024-12-19 18:42:18', 3),
(232, 27, 14, '2024-12-20 13:10:48', 1),
(233, 28, 9, '2024-12-20 13:10:50', 2),
(234, 32, 9, '2024-12-20 13:10:53', 3),
(235, 33, 14, '2024-12-20 13:10:56', 4),
(236, 32, 10, '2024-12-20 13:10:58', 5),
(237, 31, 16, '2024-12-20 13:11:00', 6),
(238, 28, 16, '2024-12-20 13:11:02', 7),
(239, 29, 15, '2024-12-20 13:11:05', 8),
(240, 33, 11, '2024-12-20 13:11:11', 1),
(241, 31, 13, '2024-12-20 13:11:13', 2),
(242, 27, 13, '2024-12-20 13:11:18', 3),
(243, 32, 16, '2024-12-20 13:11:21', 4),
(244, 27, 9, '2024-12-20 13:11:23', 5),
(245, 31, 16, '2024-12-20 13:11:26', 6),
(246, 31, 15, '2024-12-20 13:11:28', 7),
(247, 31, 14, '2024-12-20 13:11:30', 8),
(248, 27, 16, '2024-12-20 13:11:37', 1),
(249, 31, 13, '2024-12-20 13:11:39', 2),
(250, 29, 14, '2024-12-20 13:11:42', 3),
(251, 30, 11, '2024-12-20 13:11:44', 4),
(252, 27, 13, '2024-12-20 13:11:46', 5),
(253, 30, 10, '2024-12-20 13:11:49', 6),
(254, 29, 9, '2024-12-20 13:11:51', 7),
(255, 28, 13, '2024-12-20 13:11:54', 8),
(256, 32, 12, '2024-12-20 13:12:00', 1),
(257, 32, 16, '2024-12-20 13:12:03', 2),
(258, 29, 10, '2024-12-20 13:12:05', 3),
(259, 31, 10, '2024-12-20 13:12:07', 4),
(260, 28, 12, '2024-12-20 13:12:09', 5),
(261, 28, 13, '2024-12-20 13:12:12', 6),
(262, 32, 14, '2024-12-20 13:12:14', 7),
(263, 31, 14, '2024-12-20 13:12:16', 8),
(264, 30, 9, '2024-12-20 13:12:23', 1),
(265, 27, 9, '2024-12-20 13:12:25', 2),
(266, 28, 16, '2024-12-20 13:12:27', 3),
(267, 27, 16, '2024-12-21 13:24:49', 1),
(268, 26, 10, '2024-12-21 13:24:51', 2),
(269, 27, 14, '2024-12-21 13:24:54', 3),
(270, 29, 10, '2024-12-21 13:24:56', 4),
(271, 26, 14, '2024-12-21 13:24:58', 5),
(272, 26, 11, '2024-12-21 13:25:00', 6),
(273, 27, 11, '2024-12-21 13:25:02', 7),
(274, 30, 17, '2024-12-21 13:25:05', 8),
(275, 29, 10, '2024-12-21 13:25:12', 1),
(276, 26, 12, '2024-12-21 13:25:14', 2),
(277, 25, 16, '2024-12-21 13:25:17', 3),
(278, 26, 17, '2024-12-21 13:25:19', 4),
(279, 29, 16, '2024-12-21 13:25:21', 5),
(280, 26, 10, '2024-12-21 13:25:23', 6),
(281, 28, 15, '2024-12-21 13:25:25', 7),
(282, 31, 16, '2024-12-21 13:25:28', 8),
(283, 26, 13, '2024-12-21 13:25:34', 1),
(284, 25, 17, '2024-12-21 13:25:37', 2),
(285, 31, 14, '2024-12-21 13:25:39', 3),
(286, 28, 13, '2024-12-21 13:25:41', 4),
(287, 30, 11, '2024-12-21 13:25:44', 5),
(288, 31, 11, '2024-12-21 13:25:46', 6),
(289, 27, 15, '2024-12-21 13:25:48', 7),
(290, 30, 10, '2024-12-21 13:25:51', 8),
(291, 26, 17, '2024-12-21 13:25:57', 1),
(292, 27, 16, '2024-12-21 13:26:00', 2),
(293, 25, 17, '2024-12-21 13:26:03', 3),
(294, 29, 15, '2024-12-21 13:26:05', 4),
(295, 28, 14, '2024-12-21 13:26:07', 5),
(296, 26, 14, '2024-12-21 13:26:10', 6),
(297, 30, 16, '2024-12-21 13:26:12', 7),
(298, 25, 15, '2024-12-21 13:26:15', 8),
(299, 27, 10, '2024-12-21 13:26:21', 1),
(300, 28, 17, '2024-12-21 13:26:23', 2),
(301, 30, 17, '2024-12-21 13:26:26', 3),
(302, 27, 10, '2024-12-21 13:26:28', 4),
(303, 29, 14, '2024-12-21 13:26:31', 5),
(304, 30, 12, '2024-12-21 13:26:33', 6),
(305, 27, 17, '2024-12-21 13:26:36', 7),
(306, 26, 14, '2024-12-21 13:26:38', 8),
(307, 29, 13, '2024-12-22 16:25:48', 1),
(308, 33, 14, '2024-12-22 16:25:50', 2),
(309, 31, 14, '2024-12-22 16:25:52', 3),
(310, 33, 9, '2024-12-22 16:25:55', 4),
(311, 34, 14, '2024-12-22 16:25:57', 5),
(312, 31, 10, '2024-12-22 16:25:59', 6),
(313, 33, 14, '2024-12-22 16:26:01', 7),
(314, 30, 10, '2024-12-22 16:26:03', 8),
(315, 33, 11, '2024-12-22 16:26:09', 1),
(316, 31, 13, '2024-12-22 16:26:11', 2),
(317, 34, 14, '2024-12-22 16:26:14', 3),
(318, 33, 15, '2024-12-22 16:26:16', 4),
(319, 29, 13, '2024-12-22 16:26:18', 5),
(320, 31, 11, '2024-12-22 16:26:20', 6),
(321, 34, 12, '2024-12-22 16:26:22', 7),
(322, 30, 8, '2024-12-22 16:26:24', 8),
(323, 29, 15, '2024-12-22 16:26:30', 1),
(324, 33, 12, '2024-12-22 16:26:33', 2),
(325, 31, 10, '2024-12-22 16:26:35', 3),
(326, 29, 11, '2024-12-22 16:26:37', 4),
(327, 31, 14, '2024-12-22 16:26:39', 5),
(328, 32, 13, '2024-12-22 16:26:41', 6),
(329, 32, 14, '2024-12-22 16:26:43', 7),
(330, 30, 13, '2024-12-22 16:26:45', 8),
(331, 34, 12, '2024-12-22 16:26:51', 1),
(332, 28, 15, '2024-12-22 16:26:53', 2),
(333, 34, 9, '2024-12-22 16:26:56', 3),
(334, 30, 10, '2024-12-22 16:26:58', 4),
(335, 30, 11, '2024-12-22 16:27:00', 5),
(336, 29, 15, '2024-12-22 16:27:02', 6),
(337, 33, 15, '2024-12-22 16:27:04', 7),
(338, 30, 14, '2024-12-22 16:27:06', 8),
(345, 26, 16, '2024-12-23 18:21:21', 1),
(346, 26, 14, '2024-12-23 18:21:23', 2),
(347, 24, 14, '2024-12-23 18:21:26', 3),
(348, 24, 15, '2024-12-23 18:21:28', 4),
(349, 23, 16, '2024-12-23 18:21:30', 5),
(350, 25, 18, '2024-12-23 18:21:33', 6),
(351, 23, 17, '2024-12-23 18:21:35', 7),
(352, 26, 11, '2024-12-23 18:21:38', 8),
(353, 21, 13, '2024-12-23 18:21:44', 1),
(354, 20, 17, '2024-12-23 18:21:46', 2),
(355, 20, 13, '2024-12-23 18:21:48', 3),
(356, 21, 15, '2024-12-23 18:21:51', 4),
(357, 20, 12, '2024-12-23 18:21:53', 5),
(358, 24, 18, '2024-12-23 18:21:55', 6),
(359, 25, 17, '2024-12-23 18:21:58', 7),
(360, 22, 14, '2024-12-23 18:22:00', 8),
(361, 24, 14, '2024-12-23 18:22:07', 1),
(362, 26, 16, '2024-12-23 18:22:10', 2),
(363, 26, 15, '2024-12-23 18:22:15', 3),
(364, 26, 15, '2024-12-23 18:22:17', 4),
(365, 21, 12, '2024-12-23 18:22:19', 5),
(366, 24, 12, '2024-12-23 18:22:22', 6),
(367, 22, 16, '2024-12-23 18:22:24', 7),
(368, 24, 17, '2024-12-23 18:22:26', 8),
(369, 23, 19, '2024-12-23 18:22:33', 1),
(370, 21, 14, '2024-12-23 18:22:35', 2),
(371, 25, 18, '2024-12-23 18:22:38', 3),
(372, 22, 12, '2024-12-23 18:22:40', 4),
(373, 24, 16, '2024-12-23 18:22:42', 5),
(374, 23, 19, '2024-12-23 18:22:44', 6),
(375, 26, 12, '2024-12-23 18:22:47', 7),
(376, 24, 14, '2024-12-23 18:22:49', 8),
(377, 24, 13, '2024-12-23 18:22:55', 1),
(378, 21, 12, '2024-12-23 18:22:58', 2),
(379, 24, 12, '2024-12-23 18:23:00', 3),
(380, 22, 12, '2024-12-23 18:23:02', 4),
(381, 24, 13, '2024-12-23 18:23:04', 5),
(382, 22, 12, '2024-12-23 18:23:07', 6),
(383, 23, 12, '2024-12-23 18:23:09', 7),
(384, 21, 13, '2024-12-23 18:23:13', 8),
(385, 23, 19, '2024-12-23 18:23:19', 1),
(386, 22, 18, '2024-12-23 18:23:22', 2),
(387, 21, 12, '2024-12-23 18:23:24', 3),
(388, 26, 19, '2024-12-23 18:23:27', 4),
(389, 24, 17, '2024-12-23 18:23:29', 5),
(390, 20, 15, '2024-12-23 18:23:31', 6),
(391, 22, 14, '2024-12-23 18:23:33', 7),
(392, 22, 15, '2024-12-23 18:23:36', 8),
(393, 25, 15, '2024-12-23 18:23:42', 1),
(394, 21, 18, '2024-12-23 18:23:44', 2),
(395, 26, 19, '2024-12-23 18:23:47', 3),
(396, 26, 13, '2024-12-23 18:23:49', 4),
(397, 26, 14, '2024-12-23 18:23:52', 5),
(398, 23, 15, '2024-12-23 18:23:54', 6),
(399, 21, 16, '2024-12-23 18:23:57', 7),
(400, 25, 17, '2024-12-23 18:23:59', 8),
(401, 21, 13, '2024-12-23 18:24:09', 1),
(402, 21, 14, '2024-12-23 18:24:11', 2),
(403, 21, 15, '2024-12-23 18:24:14', 3),
(404, 21, 13, '2024-12-23 18:24:16', 4),
(405, 21, 19, '2024-12-23 18:24:18', 5),
(406, 20, 12, '2024-12-23 18:24:20', 6),
(407, 22, 17, '2024-12-23 18:24:23', 7),
(408, 23, 18, '2024-12-23 18:24:25', 8),
(409, 25, 16, '2024-12-23 18:24:31', 1),
(410, 21, 13, '2024-12-23 18:24:34', 2),
(411, 24, 16, '2024-12-23 18:24:36', 3),
(412, 22, 14, '2024-12-23 18:24:39', 4),
(413, 24, 13, '2024-12-23 18:24:41', 5),
(414, 27, 17, '2024-12-23 18:24:43', 6),
(415, 24, 19, '2024-12-23 18:24:46', 7),
(416, 26, 14, '2024-12-23 18:24:49', 8),
(417, 21, 19, '2024-12-23 18:24:55', 1),
(418, 24, 16, '2024-12-23 18:24:57', 2),
(419, 26, 17, '2024-12-23 18:24:59', 3),
(420, 25, 16, '2024-12-23 18:25:01', 4),
(421, 21, 17, '2024-12-23 18:25:04', 5),
(422, 25, 16, '2024-12-23 18:25:06', 6),
(423, 26, 17, '2024-12-23 18:25:08', 7),
(424, 26, 17, '2024-12-23 18:25:11', 8),
(425, 21, 14, '2024-12-23 18:25:17', 1),
(426, 22, 12, '2024-12-23 18:25:20', 2),
(427, 23, 14, '2024-12-23 18:25:22', 3),
(428, 21, 12, '2024-12-23 18:25:24', 4),
(429, 21, 12, '2024-12-23 18:25:27', 5),
(430, 20, 12, '2024-12-23 18:25:29', 6),
(431, 20, 12, '2024-12-23 18:25:31', 7),
(432, 26, 12, '2024-12-23 18:25:34', 8),
(433, 26, 13, '2024-12-23 18:25:40', 1),
(434, 22, 19, '2024-12-23 18:25:43', 2),
(435, 23, 12, '2024-12-23 18:25:45', 3),
(436, 26, 16, '2024-12-23 18:25:48', 4),
(437, 23, 16, '2024-12-23 18:25:50', 5),
(438, 26, 17, '2024-12-23 18:25:53', 6),
(439, 22, 12, '2024-12-23 18:25:55', 7),
(440, 20, 19, '2024-12-23 18:25:58', 8),
(441, 22, 16, '2024-12-23 18:26:04', 1),
(442, 26, 15, '2024-12-23 18:26:06', 2),
(443, 21, 14, '2024-12-23 18:26:09', 3),
(444, 23, 17, '2024-12-23 18:26:11', 4),
(445, 23, 14, '2024-12-23 18:26:14', 5),
(446, 25, 15, '2024-12-23 18:26:16', 6),
(447, 25, 19, '2024-12-23 18:26:19', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sensores`
--

CREATE TABLE `sensores` (
  `idSensores` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sensores`
--

INSERT INTO `sensores` (`idSensores`, `tipo`) VALUES
(1, 'dht11'),
(2, 'dht22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
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
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('j3VQ5YmYR4GjFRzFn3MtEpd7qgglammGcfdXiIv1', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZ01mZDJaQ0NWZWtyVjJ6NWdESDRYM0sxbHZhakpDR0pOR2FGTlExMSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9tYXBhIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjQ6ImF1dGgiO2E6MTp7czoyMToicGFzc3dvcmRfY29uZmlybWVkX2F0IjtpOjE3MzQ5OTYyMTM7fX0=', 1734996480);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(255) NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `rol`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'yeroen', 'yeroen.medina@gmail.com', NULL, '$2y$12$Iy9hBiDi./eC6k721NMVvOjISqXn/Vg8SSeJboEisfg5Ci.IYNxty', 'admin', NULL, '2024-12-12 21:57:56', '2024-12-12 21:57:56'),
(2, 'yero', 'ymedinavi@unsa.edu.pe', NULL, '$2y$12$JFC60rOJRAHWV3XVzqR7YuUGSDqmumOTA.zH7kYxa/Xgi4bSYH27y', 'user', NULL, '2024-12-15 04:44:47', '2024-12-15 04:44:47'),
(3, 'madely', 'madely@unsa.edu.pe', NULL, '$2y$12$/9kFp/EjAuAQ6YZrq98QZ.PXBDjXTrIE1LGB72d2U/K.Ze099etfu', 'user', NULL, '2024-12-23 21:47:10', '2024-12-23 21:47:10'),
(4, 'ale', 'ale@gmail.com', NULL, '$2y$12$PDx69RUlYqRCcvMaWMB1yO6USON.iuln3i68.fozhDm.U7yND2rPa', 'user', NULL, '2024-12-23 23:20:03', '2024-12-23 23:20:03');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lugares`
--
ALTER TABLE `lugares`
  ADD PRIMARY KEY (`idLugares`),
  ADD KEY `fk_Lugares_Sensores_idx` (`idSensores`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `registros`
--
ALTER TABLE `registros`
  ADD PRIMARY KEY (`idRegistro`),
  ADD KEY `fk_Registro_Lugares_idx` (`idLugares`);

--
-- Indices de la tabla `sensores`
--
ALTER TABLE `sensores`
  ADD PRIMARY KEY (`idSensores`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lugares`
--
ALTER TABLE `lugares`
  MODIFY `idLugares` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `registros`
--
ALTER TABLE `registros`
  MODIFY `idRegistro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=448;

--
-- AUTO_INCREMENT de la tabla `sensores`
--
ALTER TABLE `sensores`
  MODIFY `idSensores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `lugares`
--
ALTER TABLE `lugares`
  ADD CONSTRAINT `fk_Lugares_Sensores` FOREIGN KEY (`idSensores`) REFERENCES `sensores` (`idSensores`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `registros`
--
ALTER TABLE `registros`
  ADD CONSTRAINT `fk_Registro_Lugares1` FOREIGN KEY (`idLugares`) REFERENCES `lugares` (`idLugares`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
