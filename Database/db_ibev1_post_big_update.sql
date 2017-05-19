-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 18. Mai 2017 um 21:43
-- Server-Version: 10.1.21-MariaDB
-- PHP-Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db_ibev1`
--
CREATE DATABASE IF NOT EXISTS `db_ibev1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db_ibev1`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_bewertung`
--

DROP TABLE IF EXISTS `tbl_bewertung`;
CREATE TABLE IF NOT EXISTS `tbl_bewertung` (
  `PK_BID` int(11) NOT NULL AUTO_INCREMENT,
  `Stars` int(5) DEFAULT NULL,
  `FK_Hotel` int(11) NOT NULL,
  PRIMARY KEY (`PK_BID`),
  KEY `fk_tbl_Bewertung_tbl_Hotel1_idx` (`FK_Hotel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_bild`
--

DROP TABLE IF EXISTS `tbl_bild`;
CREATE TABLE IF NOT EXISTS `tbl_bild` (
  `PK_Bild` int(11) NOT NULL AUTO_INCREMENT,
  `Bild` varchar(255) DEFAULT NULL,
  `FK_Hotel` int(11) DEFAULT NULL,
  PRIMARY KEY (`PK_Bild`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `tbl_bild`
--

INSERT INTO `tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES
(1, 'img/Hotels/Deutschland/2_hotel_europäischer_hof_hamburg/h2_b2.jpg\r\n', 3),
(2, 'img/Hotels/Deutschland/1_hotel_berlin_alexanderplatz/h1_b1.jpg', 3),
(3, 'img/Hotels/Deutschland/4_azimut_hotel_cologne_city_center/h4_b1.jpg', 4),
(4, 'img\\Hotels\\Schweiz\\1_baur_au_lac\\h1_b1.jpg', 1),
(5, 'img\\Hotels\\Schweiz\\1_baur_au_lac\\h1_b1.jpg', 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_hotel`
--

DROP TABLE IF EXISTS `tbl_hotel`;
CREATE TABLE IF NOT EXISTS `tbl_hotel` (
  `PK_Hotel` int(11) NOT NULL,
  `Name_Hotel` varchar(45) NOT NULL,
  `Location` varchar(1000) DEFAULT NULL,
  `Beschreibung` varchar(4000) DEFAULT NULL,
  `Sterne` int(11) DEFAULT NULL,
  `Bewertung` int(11) DEFAULT NULL,
  `FK_Ort` int(11) DEFAULT NULL,
  PRIMARY KEY (`PK_Hotel`),
  KEY `FK_Ort_idx` (`FK_Ort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `tbl_hotel`
--

INSERT INTO `tbl_hotel` (`PK_Hotel`, `Name_Hotel`, `Location`, `Beschreibung`, `Sterne`, `Bewertung`, `FK_Ort`) VALUES
(1, 'Baur au Lac', 'linkhere', 'Das einzigartig in seinem eigenen Park im Herzen von Zürich gelegene 5-Sterne Hotel Baur au Lac bietet Aussicht auf den Zürichsee und die Alpen sowie elegante und luxuriöse Zimmer und Suiten mit einer kostenfreien Minibar. Sie profitieren zudem von einem preisgekrönten Restaurant, kostenlosem WLAN und einem Fitnesscenter auf der obersten Etage.\r\n\r\n2 berühmte Restaurants, eins mit einer Terrasse im idyllischen Garten, eine einladende Bar sowie ein Nachtclub nur für Mitglieder tragen zum Ruhm des Baur au Lac bei. Das Restaurant Pavillon wurde mit 1 Michelin-Stern und 17 Punkten von Gault Millau ausgezeichnet.\r\n\r\nMedizinische Massagen und Physiotherapie sind auf Anfrage buchbar und ein Friseur-und Schönheitssalon wartet im Hotel auf Ihren Besuch.\r\n\r\nParkservice, Limousinenservice, ein zweimal täglicher Reinigungsservice und ein 24-Stunden-Concierge tragen im Baur au Lac zu einem gelungenen Aufenthalt bei. Ihr Auto wird auf Wunsch in der Hotelgarage repariert und gewaschen, Sie können Blumen kaufen oder das Angebot der Vinothek durchstöbern.\r\n\r\nDas Bankenzentrum am Parade-Platz und die berühmte Einkaufsmeile Bahnhofstrasse sind nur wenige Gehminuten entfernt. \r\n\r\n01. Altstadt - Stadtzentrum ist bei Reisenden, die an einer schönen Altstadt, Shoppen und Spazieren gehen interessiert sind, sehr beliebt.\r\n\r\nLaut unabhängiger Gästebewertungen ist das der beliebteste Teil von Zürich.\r\n\r\nDie Lage in dieser Unterkunft ist auch eine der besten in Zürich! Gästen gefällt die Lage besser als in anderen Unterkünften in dieser Gegend.\r\n\r\nLaut Bewertungen bietet diese Unterkunft das beste Preis-Leistungs-Verhältnis in Zürich. Im Vergleich zu anderen Unterkünften in dieser Stadt bekommen Gäste hier mehr für ihr Geld.\r\n\r\nWir sprechen Ihre Sprache!\r\n\r\nBaur au Lac heißt Booking.com-Gäste seit 14. Dez. 2009 willkommen.', 5, 2, 1),
(2, 'HotelKölnDeutschland', 'beschr', 'link', 4, 4, 2),
(3, 'EuropäischerHof', 'linkhere', 'beschr', 4, 4, 3),
(4, 'AZIMUT Cologne City Center', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2513.633666284065!2d6.9489438515113156!3d50.948987559097226!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47bf25a10cb997b7%3A0x7fdd546adcb6ae26!2sAZIMUT+Hotel+Cologne+City+Center!5e0!3m2!1sde!2sch!4v1490015246939', 'Dieses einzigartige Hotel begrüßt Sie auf 6 Etagen im ehemals höchsten Gebäude Europas. Freuen Sie sich im AZIMUT Hotel Cologne City Center, das im Jahr 2008 eröffnet wurde, auf geräumige Zimmer und die kostenlose Nutzung des Fitnessbereichs mit einer Sauna.\r\n\r\nDas AZIMUT Cologne City Center empfängt Sie im historischen Hansahochhaus aus dem Jahr 1925. Viele Stilelemente und ein Paternoster sind im Original erhalten geblieben. Die hellen und modern eingerichteten, klimatisierten Zimmer erwarten Sie mit Sat-TV und einem Schreibtisch sowie einem eigenen Bad.\r\n\r\nDie Red-Lounge-Bar lädt bei einem Kaffee oder Cocktail zum Verweilen ein.\r\n\r\nDas Hotel bietet Ihnen eine hervorragende Anbindung an den öffentlichen Nahverkehr mit S-Bahn und U-Bahn. Den Kölner Dom und den Hauptbahnhof erreichen Sie nach jeweils nur einer Station. Darüber hinaus genießen Sie eine direkte Anbindung an den internationalen Flughafen Köln/Bonn.\r\n\r\nWLAN nutzen Sie in der Lobby und auf der 1. Etage kostenfrei. \r\n\r\nNeustadt Nord ist bei Reisenden, die an Restaurants, einer tollen Atmosphäre und Bier interessiert sind, sehr beliebt.\r\n\r\nWir sprechen Ihre Sprache!\r\n\r\nAZIMUT Hotel Cologne City Center heißt Booking.com-Gäste seit 30. Jun. 2008 willkommen.', 5, 2, 3),
(5, 'test', 'asdfasdf', 'AéKOLSJpoüasf', 2, 2, 1),
(6, 'Baur', 'asdf', 'asdf', 1, 1, 2),
(9, 'Hot', 'asdf', 'asdf', 1, 1, 2),
(10, 'baure', 'asdf', 'asdf', 2, 2, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_land`
--

DROP TABLE IF EXISTS `tbl_land`;
CREATE TABLE IF NOT EXISTS `tbl_land` (
  `PK_Land` int(11) NOT NULL AUTO_INCREMENT,
  `Name_Land` varchar(45) NOT NULL,
  PRIMARY KEY (`PK_Land`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `tbl_land`
--

INSERT INTO `tbl_land` (`PK_Land`, `Name_Land`) VALUES
(1, 'Schweiz'),
(2, 'Deutschland');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_ort`
--

DROP TABLE IF EXISTS `tbl_ort`;
CREATE TABLE IF NOT EXISTS `tbl_ort` (
  `PK_Ort` int(11) NOT NULL,
  `Name_Ort` varchar(45) DEFAULT NULL,
  `PLZ` int(11) DEFAULT NULL,
  `FK_Land` int(11) NOT NULL,
  PRIMARY KEY (`PK_Ort`),
  KEY `FK_Land_idx` (`FK_Land`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `tbl_ort`
--

INSERT INTO `tbl_ort` (`PK_Ort`, `Name_Ort`, `PLZ`, `FK_Land`) VALUES
(1, 'Visp', 3930, 1),
(2, 'Köln', 1235, 2),
(3, 'Hamburg', 9122, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_reservation`
--

DROP TABLE IF EXISTS `tbl_reservation`;
CREATE TABLE IF NOT EXISTS `tbl_reservation` (
  `PK_Reservation` int(11) NOT NULL AUTO_INCREMENT,
  `Frei` tinyint(1) DEFAULT NULL,
  `Reserviert_von` date DEFAULT NULL,
  `Reserviert_bis` date DEFAULT NULL,
  PRIMARY KEY (`PK_Reservation`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `tbl_reservation`
--

INSERT INTO `tbl_reservation` (`PK_Reservation`, `Frei`, `Reserviert_von`, `Reserviert_bis`) VALUES
(1, 1, '2017-05-11', '2017-05-26');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_zimmer`
--

DROP TABLE IF EXISTS `tbl_zimmer`;
CREATE TABLE IF NOT EXISTS `tbl_zimmer` (
  `PK_Zimmer` int(11) NOT NULL,
  `Name_Zimmer` varchar(45) DEFAULT NULL,
  `Anzahl_Betten` int(11) DEFAULT NULL,
  `Anzahl_Verfuegbar` int(11) DEFAULT NULL,
  `FK_Hotel2` int(11) NOT NULL,
  `Preis` int(11) DEFAULT NULL,
  `FK_Reservation` int(11) NOT NULL,
  PRIMARY KEY (`PK_Zimmer`),
  KEY `FK_Hotel_idx` (`FK_Hotel2`),
  KEY `fk_tbl_Zimmer_tbl_Reservation1_idx` (`FK_Reservation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `tbl_zimmer`
--

INSERT INTO `tbl_zimmer` (`PK_Zimmer`, `Name_Zimmer`, `Anzahl_Betten`, `Anzahl_Verfuegbar`, `FK_Hotel2`, `Preis`, `FK_Reservation`) VALUES
(1, 'Suite', 2, 2, 3, 200, 1);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `tbl_bewertung`
--
ALTER TABLE `tbl_bewertung`
  ADD CONSTRAINT `fk_tbl_Bewertung_tbl_Hotel1` FOREIGN KEY (`FK_Hotel`) REFERENCES `tbl_hotel` (`PK_Hotel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `tbl_hotel`
--
ALTER TABLE `tbl_hotel`
  ADD CONSTRAINT `FK_Ort` FOREIGN KEY (`FK_Ort`) REFERENCES `tbl_ort` (`PK_Ort`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `tbl_ort`
--
ALTER TABLE `tbl_ort`
  ADD CONSTRAINT `FK_Land` FOREIGN KEY (`FK_Land`) REFERENCES `tbl_land` (`PK_Land`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `tbl_zimmer`
--
ALTER TABLE `tbl_zimmer`
  ADD CONSTRAINT `FK_Hotel` FOREIGN KEY (`FK_Hotel2`) REFERENCES `tbl_hotel` (`PK_Hotel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_Zimmer_tbl_Reservation1` FOREIGN KEY (`FK_Reservation`) REFERENCES `tbl_reservation` (`PK_Reservation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
