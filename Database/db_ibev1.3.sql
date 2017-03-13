-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 13. Mrz 2017 um 16:04
-- Server-Version: 10.1.13-MariaDB
-- PHP-Version: 7.0.5

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
-- Tabellenstruktur für Tabelle `tbl_bilder`
--

DROP TABLE IF EXISTS `tbl_bilder`;
CREATE TABLE IF NOT EXISTS `tbl_bilder` (
  `PK_Bild` int(11) NOT NULL AUTO_INCREMENT,
  `Bild` longblob,
  `Bild_Typ` varchar(45) DEFAULT NULL,
  `FK_Hotel` int(11) NOT NULL,
  PRIMARY KEY (`PK_Bild`),
  KEY `fk_tbl_Bilder_tbl_Hotel1_idx` (`FK_Hotel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_hotel`
--

DROP TABLE IF EXISTS `tbl_hotel`;
CREATE TABLE IF NOT EXISTS `tbl_hotel` (
  `PK_Hotel` int(11) NOT NULL,
  `Name_Hotel` varchar(45) NOT NULL,
  `Sterne` int(11) DEFAULT NULL,
  `Bewertung` int(11) DEFAULT NULL,
  `Behindertengerecht` tinyint(1) DEFAULT NULL,
  `FK_Ort` int(11) DEFAULT NULL,
  PRIMARY KEY (`PK_Hotel`),
  KEY `FK_Ort_idx` (`FK_Ort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `tbl_hotel`
--

INSERT INTO `tbl_hotel` (`PK_Hotel`, `Name_Hotel`, `Sterne`, `Bewertung`, `Behindertengerecht`, `FK_Ort`) VALUES
(1, 'Britannia', 4, 2, 1, 1),
(2, 'BestHotel', 4, 4, 1, 2);

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
(2, 'Köln', 1235, 2);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `FK_Hotel` int(11) NOT NULL,
  `Preis` int(11) DEFAULT NULL,
  `FK_Reservation` int(11) NOT NULL,
  PRIMARY KEY (`PK_Zimmer`),
  KEY `FK_Hotel_idx` (`FK_Hotel`),
  KEY `fk_tbl_Zimmer_tbl_Reservation1_idx` (`FK_Reservation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `tbl_bewertung`
--
ALTER TABLE `tbl_bewertung`
  ADD CONSTRAINT `fk_tbl_Bewertung_tbl_Hotel1` FOREIGN KEY (`FK_Hotel`) REFERENCES `tbl_hotel` (`PK_Hotel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `tbl_bilder`
--
ALTER TABLE `tbl_bilder`
  ADD CONSTRAINT `fk_tbl_Bilder_tbl_Hotel1` FOREIGN KEY (`FK_Hotel`) REFERENCES `tbl_hotel` (`PK_Hotel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `FK_Hotel` FOREIGN KEY (`FK_Hotel`) REFERENCES `tbl_hotel` (`PK_Hotel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_Zimmer_tbl_Reservation1` FOREIGN KEY (`FK_Reservation`) REFERENCES `tbl_reservation` (`PK_Reservation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
