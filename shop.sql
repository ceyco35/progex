-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Erstellungszeit: 01. Dez 2021 um 00:53
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
-- Tabellenstruktur für Tabelle `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `product_id` int(10) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `delivery_addresses`
--

CREATE TABLE `delivery_addresses` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `recipient` text NOT NULL,
  `city` text NOT NULL,
  `street` text NOT NULL,
  `streetNumber` varchar(50) NOT NULL,
  `zipCode` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `delivery_addresses`
--

INSERT INTO `delivery_addresses` (`id`, `user_id`, `recipient`, `city`, `street`, `streetNumber`, `zipCode`) VALUES
(6, 1, 'test', 'test', 'test', 'test', 'test'),
(7, 3, 'RicardoMilos', 'Konstanz', 'Schürmann- Horster- Weg', '8', '78467'),
(8, 4, 'RicardoMilos', 'Konstanz', 'Schürmann- Horster- Weg', '8', '78467'),
(9, 5, 'Minh Do Hai', 'Konstanz', 'Schürmann- Horster- Weg', '8', '78467');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `orders`
--

CREATE TABLE `orders` (
  `id` int(10) NOT NULL,
  `orderDate` datetime DEFAULT current_timestamp(),
  `deliveryDate` date DEFAULT NULL,
  `status` enum('new','canceled','payed','sent','delivered') DEFAULT 'new',
  `userId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `orders`
--

INSERT INTO `orders` (`id`, `orderDate`, `deliveryDate`, `status`, `userId`) VALUES
(105, '2021-12-01 00:00:00', '0000-00-00', 'new', 4),
(106, '2021-12-01 00:00:00', '0000-00-00', 'new', 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `order_address`
--

CREATE TABLE `order_address` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `recipient` text NOT NULL,
  `city` text NOT NULL,
  `street` text NOT NULL,
  `streetNumber` varchar(50) NOT NULL,
  `zipCode` varchar(50) NOT NULL,
  `type` enum('delivery','invoice','both') NOT NULL DEFAULT 'both'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `order_address`
--

INSERT INTO `order_address` (`id`, `order_id`, `recipient`, `city`, `street`, `streetNumber`, `zipCode`, `type`) VALUES
(28, 105, 'RicardoMilos', 'Konstanz', 'Schürmann- Horster- Weg', '8', '78467', 'both'),
(29, 106, 'RicardoMilos', 'Konstanz', 'Schürmann- Horster- Weg', '8', '78467', 'both');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `order_products`
--

CREATE TABLE `order_products` (
  `id` int(10) NOT NULL,
  `titel` varchar(255) NOT NULL,
  `amount` int(10) NOT NULL,
  `price` double NOT NULL,
  `taxInPercent` double NOT NULL,
  `orderId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `order_products`
--

INSERT INTO `order_products` (`id`, `titel`, `amount`, `price`, `taxInPercent`, `orderId`) VALUES
(46, 'Airforce', 1, 72.82, 19, 105),
(47, 'Nike Pegasus Trail 3', 1, 76.87, 19, 105);

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
(1, 'Airforce', 'Damenschuh', 89.9, 'https://static.nike.com/a/images/t_prod_ss/w_640,c_limit,f_auto/b1f0f0de-35a3-4078-9dc4-27ea8e69385a/air-force-1-next-nature-brown-kelp-dc8744-301-%E2%80%93-erscheinungsdatum.jpg'),
(2, 'Airforce', 'Damenschuh', 89.9, 'https://static.nike.com/a/images/f_auto,b_rgb:f5f5f5,w_440/016fe58c-cff9-42da-8545-1606cf326c10/custom-nike-air-force-1-low-cozi-custom-shoe.png'),
(3, 'Airforce', 'Damenschuh', 89.9, 'https://static.nike.com/a/images/f_auto,b_rgb:f5f5f5,w_440/d9c61530-88e8-46c2-a3aa-fef1d49de7f7/air-force-1-experimental-herrenschuh-6VmxCl.png'),
(4, 'Nike Pegasus Trail 3', 'Damenschuh', 94.9, 'https://static.nike.com/a/images/f_auto,b_rgb:f5f5f5,w_440/c3916202-2131-461b-8dd2-f6daebdea302/pegasus-trail-3-trail-laufschuh-fur-3BMMJx.png'),
(5, 'Air VaporMax 2021', 'Damenschuh', 140, 'https://www.snipes.com/dw/image/v2/BDCB_PRD/on/demandware.static/-/Sites-snse-master-eu/default/dwd8d5eaad/1929674_P.jpg?sw=780&sh=780&sm=fit&sfrm=png'),
(6, 'Air VaporMax 2021 FK', 'Damenschuh', 140, 'https://www.snipes.com/dw/image/v2/BDCB_PRD/on/demandware.static/-/Sites-snse-master-eu/default/dw8b970589/1929690_P.jpg?sw=780&sh=780&sm=fit&sfrm=png'),
(7, 'Nike Air Max 97', 'Herrenschuh', 197.99, 'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/1632439a-15ca-4213-842e-4e8b062a6c86/air-max-97-herrenschuh-CV3dl7.png');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`) VALUES
(1, 'test', '$2y$10$Zka6OFJSuRZZXhIGMRLSVuBl8MyL8y2ySQ2bwnziiVP3OGM3FqqM6', NULL),
(3, 'ricardoMilos', '$2y$10$Oy6My34jLELZS2kb9a1VGeCSNG5o8FVK0Cbwde8ycTNjvJZ.8DOQW', 'ricardoMilos@gmail.com'),
(4, 'songthan9xa1', '$2y$10$vH53VX.azEx8HVywjsm7HOChK58zVn.rLiA/0U5U/nhY6gWs7S7Wu', 'songthan9x@gmail.com'),
(5, 'songthan9x', '$2y$10$ZMeoiyv0K5NKp4KdmJ4n9.BJsDgrmLMYih5hNWuxUGtPd0ZEzAQ5S', 'dohaiminh@yahoo.com.vn');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id` (`product_id`);

--
-- Indizes für die Tabelle `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_user_delivery_addresses` (`user_id`);

--
-- Indizes für die Tabelle `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_orders_to_user` (`userId`);

--
-- Indizes für die Tabelle `order_address`
--
ALTER TABLE `order_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ORDER_ADDRESS` (`order_id`);

--
-- Indizes für die Tabelle `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_orders_to_oder_products` (`orderId`);

--
-- Indizes für die Tabelle `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT für Tabelle `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT für Tabelle `order_address`
--
ALTER TABLE `order_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT für Tabelle `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT für Tabelle `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_cart_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints der Tabelle `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  ADD CONSTRAINT `FK_user_delivery_addresses` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_orders_to_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `order_address`
--
ALTER TABLE `order_address`
  ADD CONSTRAINT `FK_ORDER_ADDRESS` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `FK_orders_to_oder_products` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
