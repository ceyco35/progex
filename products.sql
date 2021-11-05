-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Erstellungszeit: 05. Nov 2021 um 15:50
-- Server-Version: 10.4.21-MariaDB
-- PHP-Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `shop`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `products`
--

CREATE TABLE `products` (
  `id` int(10) NOT NULL,
  `titel` varchar(255) NOT NULL,
  `describtion` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `products`
--

INSERT INTO `products` (`id`, `titel`, `describtion`, `price`, `image`) VALUES
(1, 'Test product 1', 'Beschreibung 1', 4.99, 'https://static.nike.com/a/images/t_prod_ss/w_640,c_limit,f_auto/b1f0f0de-35a3-4078-9dc4-27ea8e69385a/air-force-1-next-nature-brown-kelp-dc8744-301-%E2%80%93-erscheinungsdatum.jpg'),
(2, 'Test product 2', 'Beschreibung 2', 5.99, 'https://static.nike.com/a/images/f_auto,b_rgb:f5f5f5,w_440/016fe58c-cff9-42da-8545-1606cf326c10/custom-nike-air-force-1-low-cozi-custom-shoe.png'),
(3, 'Test product 3', 'Beschreibung 3', 9.99, 'https://static.nike.com/a/images/f_auto,b_rgb:f5f5f5,w_440/d9c61530-88e8-46c2-a3aa-fef1d49de7f7/air-force-1-experimental-herrenschuh-6VmxCl.png'),
(4, 'Test product 4', 'Beschreibung 4', 10.56, 'https://static.nike.com/a/images/f_auto,b_rgb:f5f5f5,w_440/c3916202-2131-461b-8dd2-f6daebdea302/pegasus-trail-3-trail-laufschuh-fur-3BMMJx.png');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
