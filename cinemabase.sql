-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Час створення: Гру 22 2021 р., 11:00
-- Версія сервера: 8.0.24
-- Версія PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `cinemabase`
--
CREATE DATABASE IF NOT EXISTS `cinemabase` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cinemabase`;

-- --------------------------------------------------------

--
-- Структура таблиці `film`
--

CREATE TABLE `film` (
  `id_film` bigint UNSIGNED NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `price` int NOT NULL,
  `rating` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `film`
--

INSERT INTO `film` (`id_film`, `name`, `price`, `rating`) VALUES
(1, 'Перший месник 2', 85, 8.4),
(2, 'Пірати Карибського моря 5', 110, 7.4),
(3, 'Форсаж: Дорога додому', 110, 7.8),
(4, 'Душа', 75, 9.4),
(5, 'Веном 2', 120, 8.5),
(6, 'Астрал 5', 85, 8.4),
(7, 'Воно 2', 90, 8.1),
(8, 'Анабель', 100, 9.5),
(9, 'Спіріт: душа Прерії', 90, 8.9),
(10, 'Будка поцілунків', 75, 9);

-- --------------------------------------------------------

--
-- Структура таблиці `hall`
--

CREATE TABLE `hall` (
  `id_hall` bigint UNSIGNED NOT NULL,
  `count_of_seates` int NOT NULL,
  `count_of_seates_VIP` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `hall`
--

INSERT INTO `hall` (`id_hall`, `count_of_seates`, `count_of_seates_VIP`) VALUES
(1, 20, 5),
(2, 25, NULL),
(3, 15, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `roles`
--

CREATE TABLE `roles` (
  `id_roles` bigint UNSIGNED NOT NULL,
  `name_role` varchar(45) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `roles`
--

INSERT INTO `roles` (`id_roles`, `name_role`) VALUES
(1, 'Користувач'),
(2, 'Адміністратор'),
(3, 'Гість');

-- --------------------------------------------------------

--
-- Структура таблиці `role_user`
--

CREATE TABLE `role_user` (
  `id_role_user` bigint UNSIGNED NOT NULL,
  `user_id_user` bigint UNSIGNED NOT NULL,
  `roles_id_roles` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `role_user`
--

INSERT INTO `role_user` (`id_role_user`, `user_id_user`, `roles_id_roles`) VALUES
(37, 45, 2),
(38, 46, 1),
(39, 47, 1),
(40, 48, 1),
(41, 49, 1),
(42, 50, 1),
(43, 51, 1),
(45, 53, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `session`
--

CREATE TABLE `session` (
  `id_session` bigint UNSIGNED NOT NULL,
  `film_id_film` bigint UNSIGNED NOT NULL,
  `hall_id_hall` bigint UNSIGNED NOT NULL,
  `time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `session`
--

INSERT INTO `session` (`id_session`, `film_id_film`, `hall_id_hall`, `time`) VALUES
(1, 10, 2, '2021-11-24'),
(2, 2, 2, '2021-11-21'),
(3, 3, 3, '2021-11-21'),
(4, 7, 3, '2021-11-19'),
(5, 2, 1, '2021-11-24'),
(6, 4, 2, '2021-11-21'),
(7, 10, 2, '2021-11-24'),
(8, 10, 2, '2021-11-14'),
(9, 7, 3, '2021-11-20'),
(10, 1, 3, '2021-12-05'),
(15, 10, 2, '2021-11-24');

-- --------------------------------------------------------

--
-- Структура таблиці `tickets`
--

CREATE TABLE `tickets` (
  `id_ticket` bigint UNSIGNED NOT NULL,
  `user_id_user` bigint UNSIGNED NOT NULL,
  `session_id_session` bigint UNSIGNED NOT NULL,
  `VIP` tinyint(1) DEFAULT NULL,
  `place` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `tickets`
--

INSERT INTO `tickets` (`id_ticket`, `user_id_user`, `session_id_session`, `VIP`, `place`) VALUES
(34, 46, 1, 1, 1),
(35, 46, 2, 0, 5),
(36, 46, 6, 0, 5),
(37, 46, 15, 0, 7),
(38, 47, 4, 0, 4),
(39, 47, 5, 1, 6),
(40, 47, 10, 0, 10),
(41, 47, 9, 0, 9),
(42, 46, 4, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблиці `user`
--

CREATE TABLE `user` (
  `id_user` bigint UNSIGNED NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(17) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `user`
--

INSERT INTO `user` (`id_user`, `name`, `phone`, `password`) VALUES
(45, '2', '2', 'c81e728d9d4c2f636f067f89cc14862c'),
(46, '1', '1', 'c4ca4238a0b923820dcc509a6f75849b'),
(47, '3', '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3'),
(48, 'First', '0937871847', '77b75a1e5ae5126ca2e5bcdba114b716'),
(49, '4', '4', 'a87ff679a2f3e71d9181a67b7542122c'),
(50, '5', '5', 'e4da3b7fbbce2345d7772b0674a318d5'),
(51, '6', '6', '1679091c5a880faf6fb5e6087eb1b2dc'),
(53, 'admin', '+38(073)89-69-999', '202cb962ac59075b964b07152d234b70');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id_film`),
  ADD UNIQUE KEY `id_film` (`id_film`);

--
-- Індекси таблиці `hall`
--
ALTER TABLE `hall`
  ADD PRIMARY KEY (`id_hall`),
  ADD UNIQUE KEY `id_hall` (`id_hall`);

--
-- Індекси таблиці `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_roles`),
  ADD UNIQUE KEY `id_roles` (`id_roles`);

--
-- Індекси таблиці `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id_role_user`),
  ADD UNIQUE KEY `id_role_user` (`id_role_user`),
  ADD UNIQUE KEY `user_id_user` (`user_id_user`) USING BTREE,
  ADD KEY `roles_id_roles` (`roles_id_roles`) USING BTREE;

--
-- Індекси таблиці `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id_session`),
  ADD UNIQUE KEY `id_session` (`id_session`),
  ADD KEY `film_id_film` (`film_id_film`),
  ADD KEY `hall_id_hall` (`hall_id_hall`);

--
-- Індекси таблиці `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id_ticket`),
  ADD UNIQUE KEY `id_ticket` (`id_ticket`),
  ADD KEY `user_id_user` (`user_id_user`),
  ADD KEY `session_id_session` (`session_id_session`);

--
-- Індекси таблиці `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `film`
--
ALTER TABLE `film`
  MODIFY `id_film` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблиці `hall`
--
ALTER TABLE `hall`
  MODIFY `id_hall` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `roles`
--
ALTER TABLE `roles`
  MODIFY `id_roles` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id_role_user` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT для таблиці `session`
--
ALTER TABLE `session`
  MODIFY `id_session` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблиці `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id_ticket` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT для таблиці `user`
--
ALTER TABLE `user`
  MODIFY `id_user` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_ibfk_1` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_ibfk_2` FOREIGN KEY (`roles_id_roles`) REFERENCES `roles` (`id_roles`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`film_id_film`) REFERENCES `film` (`id_film`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `session_ibfk_2` FOREIGN KEY (`hall_id_hall`) REFERENCES `hall` (`id_hall`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`session_id_session`) REFERENCES `session` (`id_session`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
