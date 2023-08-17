-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 17 Sie 2023, 17:02
-- Wersja serwera: 8.0.32
-- Wersja PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `cinema`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `films`
--

CREATE TABLE `films` (
  `id` int NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `films`
--

INSERT INTO `films` (`id`, `title`) VALUES
(1, 'Peppa Pig: The True Story'),
(2, 'Minions: The Rise of Gru');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `reservations`
--

CREATE TABLE `reservations` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `screening_id` int NOT NULL,
  `place` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `reservations`
--

INSERT INTO `reservations` (`id`, `user_id`, `screening_id`, `place`) VALUES
(1, 10, 1, 204),
(2, 10, 1, 184),
(3, 10, 1, 164),
(4, 10, 1, 165),
(5, 10, 1, 166),
(6, 10, 1, 186),
(7, 10, 1, 206),
(8, 10, 1, 205),
(9, 10, 1, 88),
(10, 10, 1, 108),
(11, 10, 1, 128),
(12, 10, 1, 148),
(13, 10, 1, 168),
(14, 10, 1, 188),
(15, 10, 1, 208),
(16, 10, 1, 189),
(17, 10, 1, 210),
(18, 10, 1, 170),
(19, 13, 6, 87),
(20, 13, 6, 154),
(21, 13, 6, 58),
(22, 13, 4, 109),
(23, 13, 4, 129),
(24, 13, 4, 149),
(25, 14, 1, 112),
(26, 14, 1, 132),
(27, 14, 1, 133),
(28, 14, 1, 113),
(29, 14, 10, 20),
(30, 14, 10, 23);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `screenings`
--

CREATE TABLE `screenings` (
  `id` int NOT NULL,
  `film_id` int NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `screenings`
--

INSERT INTO `screenings` (`id`, `film_id`, `date`, `time`) VALUES
(1, 1, '2021-10-24', '14:00:00'),
(2, 1, '2021-10-24', '16:00:00'),
(3, 1, '2021-10-24', '18:00:00'),
(4, 1, '2021-10-24', '20:00:00'),
(5, 1, '2021-10-31', '14:00:00'),
(6, 1, '2021-10-31', '16:00:00'),
(7, 1, '2021-10-31', '18:00:00'),
(8, 1, '2021-10-31', '20:00:00'),
(9, 2, '2021-10-24', '14:00:00'),
(10, 2, '2021-10-24', '16:00:00'),
(11, 2, '2021-10-24', '18:00:00'),
(12, 2, '2021-10-24', '20:00:00'),
(13, 2, '2021-10-31', '14:00:00'),
(14, 2, '2021-10-31', '16:00:00'),
(15, 2, '2021-10-31', '18:00:00'),
(16, 2, '2021-10-31', '20:00:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `login` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `number`) VALUES
(10, 'janusz', '2e31097ea05f626c457965ba2d5dafddc3cc4853', '123123123'),
(13, 'BeeJeeEss', '7e240de74fb1ed08fa08d38063f6a6a91462a815', '000000000'),
(14, 'asd', 'f10e2821bbbea527ea02200352313bc059445190', '123321123');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user_id`),
  ADD KEY `screening` (`screening_id`);

--
-- Indeksy dla tabeli `screenings`
--
ALTER TABLE `screenings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `film` (`film_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `films`
--
ALTER TABLE `films`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT dla tabeli `screenings`
--
ALTER TABLE `screenings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `screening` FOREIGN KEY (`screening_id`) REFERENCES `screenings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `screenings`
--
ALTER TABLE `screenings`
  ADD CONSTRAINT `film` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
