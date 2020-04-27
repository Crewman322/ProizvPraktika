-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 27 2020 г., 15:32
-- Версия сервера: 5.5.63-MariaDB
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bibi`
--

-- --------------------------------------------------------

--
-- Структура таблицы `avtor`
--

CREATE TABLE `avtor` (
  `id` int(11) NOT NULL,
  `FIO` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ost` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `avtor`
--

INSERT INTO `avtor` (`id`, `FIO`, `ost`) VALUES
(8, 'Башмаков Кирилл Николаевич', 'Боец'),
(9, 'Кастрюлькин Аристакрат Малькович', 'Карантинный гурман');

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avtor_id` int(11) NOT NULL,
  `godizda` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hranitsa` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`id`, `name`, `avtor_id`, `godizda`, `hranitsa`) VALUES
(10, 'Солянка злодейская', 8, '2019', 'Маркетинг'),
(12, 'Армартура', 9, '222', '2112'),
(13, 'Тест', 9, '2001', 'Тест1');

-- --------------------------------------------------------

--
-- Структура таблицы `reader`
--

CREATE TABLE `reader` (
  `id` int(11) NOT NULL,
  `fio` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `adress` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `phonenum` varchar(12) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `reader`
--

INSERT INTO `reader` (`id`, `fio`, `adress`, `phonenum`) VALUES
(7, 'Тарас', 'ул.Тарасова', '890003'),
(8, 'Маляр', 'ул.Маляров', '890021'),
(9, 'Крышас', 'ул.Крыши', '8093123');

-- --------------------------------------------------------

--
-- Структура таблицы `vidacha`
--

CREATE TABLE `vidacha` (
  `id` int(11) NOT NULL,
  `reader_id` int(11) NOT NULL,
  `datevid` date NOT NULL,
  `dateback` date NOT NULL,
  `books_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `vidacha`
--

INSERT INTO `vidacha` (`id`, `reader_id`, `datevid`, `dateback`, `books_id`) VALUES
(61, 7, '2020-04-02', '2020-05-02', 10),
(62, 8, '2020-04-01', '2020-04-24', 13);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `avtor`
--
ALTER TABLE `avtor`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `avtor_id` (`avtor_id`);

--
-- Индексы таблицы `reader`
--
ALTER TABLE `reader`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `vidacha`
--
ALTER TABLE `vidacha`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reader_id_2` (`reader_id`),
  ADD UNIQUE KEY `books_id_2` (`books_id`),
  ADD KEY `books_id` (`books_id`),
  ADD KEY `reader_id` (`reader_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `avtor`
--
ALTER TABLE `avtor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `reader`
--
ALTER TABLE `reader`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `vidacha`
--
ALTER TABLE `vidacha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`avtor_id`) REFERENCES `avtor` (`id`);

--
-- Ограничения внешнего ключа таблицы `vidacha`
--
ALTER TABLE `vidacha`
  ADD CONSTRAINT `vidacha_ibfk_1` FOREIGN KEY (`reader_id`) REFERENCES `reader` (`id`),
  ADD CONSTRAINT `vidacha_ibfk_2` FOREIGN KEY (`books_id`) REFERENCES `books` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
