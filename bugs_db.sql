-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Дек 09 2016 г., 01:22
-- Версия сервера: 10.1.16-MariaDB
-- Версия PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bugs_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bugs`
--

CREATE TABLE `bugs` (
  `bug_id` int(16) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `short_description` varchar(128) NOT NULL,
  `full_description` text NOT NULL,
  `user_id` int(16) NOT NULL,
  `status` char(1) NOT NULL,
  `urgency` char(1) NOT NULL,
  `criticality` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bugs`
--

INSERT INTO `bugs` (`bug_id`, `create_date`, `short_description`, `full_description`, `user_id`, `status`, `urgency`, `criticality`) VALUES
(1, '2016-12-05 00:48:47', 'short descr', 'full descr', 1, 'C', 'B', 'C'),
(2, '2016-12-08 09:59:26', '2nd bug', 'checking bugs list', 1, 'S', 'A', 'A'),
(8, '2016-12-08 20:59:02', 'short', 'qwerty', 0, 'N', 'D', 'Q'),
(15, '2016-12-08 22:56:55', 'final test bug', 'This bug will help me to test my system', 1, 'O', 'A', 'C');

-- --------------------------------------------------------

--
-- Структура таблицы `bugs_history`
--

CREATE TABLE `bugs_history` (
  `bug_id` int(16) NOT NULL,
  `user_id` int(16) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action` char(1) NOT NULL,
  `comment` varchar(128) NOT NULL,
  `action_id` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bugs_history`
--

INSERT INTO `bugs_history` (`bug_id`, `user_id`, `date`, `action`, `comment`, `action_id`) VALUES
(1, 1, '2016-12-08 12:11:38', 'S', 'comment', 1),
(1, 1, '2016-12-08 12:18:50', 'S', 'comment', 2),
(1, 1, '2016-12-08 12:59:26', 'S', 'comment', 3),
(8, 0, '2016-12-08 20:59:02', 'N', 'comment', 4),
(1, 1, '2016-12-08 22:39:25', 'O', 'Opened again', 5),
(1, 1, '2016-12-08 22:39:49', 'S', 'Finally solved', 6),
(1, 1, '2016-12-08 22:40:15', 'C', 'Close', 7),
(2, 1, '2016-12-08 22:42:47', 'S', 'Got the error readon. Fixed by changing rules of generating', 8),
(2, 1, '2016-12-08 22:43:06', 'S', 'Got the error readon. Fixed by changing rules of generating', 9),
(10, 1, '2016-12-08 22:49:33', 'N', 'Got the bug.', 10),
(11, 1, '2016-12-08 22:50:02', 'N', 'Got the bug.', 11),
(12, 1, '2016-12-08 22:53:33', 'N', 'Got the bug.', 12),
(13, 1, '2016-12-08 22:55:54', 'N', 'Got the bug.', 13),
(14, 1, '2016-12-08 22:56:23', 'N', 'Got the bug.', 14),
(15, 1, '2016-12-08 22:56:55', 'N', 'Got the bug.', 15),
(15, 1, '2016-12-08 22:59:18', 'O', 'Continue testing', 16);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` int(16) NOT NULL,
  `login` varchar(32) NOT NULL,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `login`, `password`, `first_name`, `last_name`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Ivan', 'Ivanov'),
(8, 'user1', 'D8578EDF8458CE06FBC5BB76A58C5CA4', 'Vladimir', 'Leskin');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bugs`
--
ALTER TABLE `bugs`
  ADD PRIMARY KEY (`bug_id`);

--
-- Индексы таблицы `bugs_history`
--
ALTER TABLE `bugs_history`
  ADD PRIMARY KEY (`action_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bugs`
--
ALTER TABLE `bugs`
  MODIFY `bug_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT для таблицы `bugs_history`
--
ALTER TABLE `bugs_history`
  MODIFY `action_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
