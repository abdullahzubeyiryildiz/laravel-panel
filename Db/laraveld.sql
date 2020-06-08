-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 08 Haz 2020, 15:51:51
-- Sunucu sürümü: 10.1.37-MariaDB
-- PHP Sürümü: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `laraveld`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Abdullah Yıldız', 'pratikyazilimci@gmail.com', NULL, '$2y$10$Ajat.bRkGs8yXQCDAw1.RuCdRNRFqZdAhaoU9XzoBAhXg.KNRskFO', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Genel', 'genel', 1, '2020-06-07 22:23:45', '2020-06-07 22:24:35', NULL),
(2, 'Kategori 1', 'kategori-1', 1, '2020-06-07 22:23:45', '2020-06-08 09:15:11', NULL),
(3, 'Kategori 2', 'kategori-2', 1, '2020-06-07 22:23:45', '2020-06-07 22:23:45', NULL),
(4, 'Kategori 3', 'kategori-3', 1, '2020-06-07 22:23:45', '2020-06-07 22:23:45', NULL),
(5, 'Kategori 4', 'kategori-4', 1, '2020-06-07 22:23:45', '2020-06-07 22:23:45', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `diameters`
--

CREATE TABLE `diameters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_17_163919_categories', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2020_06_06_154340_products', 1),
(6, '2020_06_06_161052_diameters', 1),
(7, '2020_06_06_164203_admins', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0:pasif 1:aktif',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `image`, `content`, `status`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 7, 'Ms. Georgiana Ledner DDS', 'https://lorempixel.com/800/400/cats/?64453', 'A laborum excepturi doloribus cumque. Recusandae deleniti quo distinctio magni vero. Nobis voluptatem sunt dolor cumque. Eligendi architecto quisquam perferendis illum eos. Id et fuga ex delectus est voluptate. Minus nostrum qui sed necessitatibus velit. Provident voluptate nisi earum iusto sit aliquid.', 1, 'ms-yoshiko-zboncak', NULL, '1998-05-03 21:18:00', '2020-06-07 22:23:45'),
(2, 3, 'Mr. Bailey Leffler DDS', 'https://lorempixel.com/800/400/cats/?44697', 'Ducimus est molestias perspiciatis enim possimus. Earum aut delectus similique quia nihil aut sint. Et non blanditiis nobis et. Assumenda quas voluptates itaque earum distinctio commodi aliquam. Repellat ipsum itaque consequatur inventore facere necessitatibus. Vitae aliquid voluptates debitis est unde minima.', 1, 'hans-frami', NULL, '2008-07-04 08:49:30', '2020-06-07 22:23:45'),
(3, 3, 'Sean Turcotte', 'https://lorempixel.com/800/400/cats/?60324', 'Dolor sapiente iure ex voluptatem id necessitatibus dolorem. Sit exercitationem cum enim perferendis quisquam veniam pariatur. Laborum non cumque aut voluptatem omnis ducimus labore quis. Omnis animi impedit a laboriosam temporibus et aspernatur. Ipsa soluta corporis ex vitae totam suscipit. Enim quia maiores unde eaque voluptas veniam. Eaque et veritatis delectus autem autem asperiores.', 1, 'layla-bartoletti', NULL, '1988-09-11 19:18:33', '2020-06-07 22:23:45'),
(4, 3, 'Ms. Dahlia Bartell MD', 'https://lorempixel.com/800/400/cats/?19069', 'Accusantium aut repudiandae ea modi dolores cupiditate. Beatae culpa id rem perferendis. Aut autem molestiae quasi repellat qui. Ab magnam soluta autem quos labore eius. Inventore et repellendus tempore molestiae dolorem. Fuga accusamus dolorem vel vel reprehenderit. Quia sint error consectetur dolorem. Laudantium perferendis ut sit molestiae.', 1, 'bailey-schumm', NULL, '1996-11-14 09:57:14', '2020-06-07 22:23:45'),
(5, 2, 'Khalil Ankunding', 'https://lorempixel.com/800/400/cats/?66872', 'Accusamus sed rerum vel velit itaque sed. Incidunt sed id earum. Hic modi quas accusamus ut. Voluptate enim ratione qui ipsa doloremque non.', 0, 'kirstin-toy', NULL, '2000-12-05 23:16:55', '2020-06-07 22:24:07'),
(6, 2, 'Felicity Schuppe I', 'https://lorempixel.com/800/400/cats/?65807', 'Error aliquam dignissimos non ipsam necessitatibus et perspiciatis aut. Laborum laudantium consequatur suscipit asperiores ullam quod voluptatem. Laudantium magnam quidem beatae cupiditate est exercitationem nulla. Officiis et nihil enim et et. Excepturi similique sequi fugit assumenda sit. Dignissimos possimus earum beatae assumenda.', 1, 'dr-vergie-kihn-i', NULL, '1977-09-20 21:53:46', '2020-06-07 22:23:45'),
(7, 6, 'Chelsea Pacocha', 'https://lorempixel.com/800/400/cats/?69980', 'Eius vero officia sunt facilis. Veniam minus voluptatem assumenda eos tempore. Iure aliquid quas ullam sed. Aut distinctio necessitatibus nobis repellendus ipsam. Quo in quam voluptatem aut. Sequi labore maxime laudantium veritatis nemo vel. Nemo voluptatibus nisi et et exercitationem cum ullam incidunt.', 1, 'layla-braun', NULL, '1992-11-17 04:49:14', '2020-06-07 22:23:45'),
(8, 2, 'Miss Larissa Parisian', 'https://lorempixel.com/800/400/cats/?19722', 'Nulla rerum dolorem quaerat blanditiis quia impedit dolores. Eos soluta cumque vel non minus distinctio veniam. Dolor voluptatem impedit dolore odit aperiam quo impedit. Ratione fugit sit et consequatur.', 1, 'prof-adriel-mccullough', NULL, '2018-11-07 14:36:43', '2020-06-07 22:24:18'),
(9, 5, 'Sage Langosh', 'https://lorempixel.com/800/400/cats/?24102', 'Aliquam ipsam qui qui harum unde perferendis. Qui est optio deleniti perspiciatis. Rem qui vero hic mollitia voluptatum laboriosam et. At voluptatum exercitationem qui ut dolores. Consequatur occaecati nulla vel voluptatem molestiae quod iusto. Sit voluptatem cum aperiam temporibus ipsum. Et corrupti illum corporis vel. Aut aperiam voluptatem iste est et aut molestiae.', 1, 'pattie-marquardt', NULL, '2012-10-21 07:42:56', '2020-06-07 22:24:20'),
(10, 2, 'Herta Hermiston', 'https://lorempixel.com/800/400/cats/?50008', 'Id distinctio omnis deserunt voluptatem odit. Qui optio nemo reiciendis velit. Perspiciatis vel molestiae illum minus minima eum doloribus quod. Doloremque voluptates illum ea sint totam eum voluptatem cumque. Error quo impedit ut pariatur.', 1, 'brandy-beer-dvm', NULL, '1996-12-15 04:05:28', '2020-06-07 22:23:46'),
(11, NULL, 'Deneme Ürün', 'uploads/deneme-urun.png', 'test', 1, 'deneme-urun', NULL, '2020-06-07 22:23:54', '2020-06-07 22:24:17'),
(12, 3, 'Deneme Ürünsada', 'uploads/deneme-urunsada.png', 'asdad', 1, 'deneme-urunsada', NULL, '2020-06-08 10:49:52', '2020-06-08 10:51:03');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `diameters`
--
ALTER TABLE `diameters`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Tablo için indeksler `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `diameters`
--
ALTER TABLE `diameters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
