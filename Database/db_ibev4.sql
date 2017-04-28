-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 28. Apr 2017 um 16:03
-- Server-Version: 10.1.13-MariaDB
-- PHP-Version: 7.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db_ibev4`
--
CREATE DATABASE IF NOT EXISTS `db_ibev4` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db_ibev4`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_bewertung`
--

DROP TABLE IF EXISTS `tbl_bewertung`;
CREATE TABLE `tbl_bewertung` (
  `PK_BID` int(11) NOT NULL,
  `Stars` int(5) DEFAULT NULL,
  `FK_Hotel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_bild`
--

DROP TABLE IF EXISTS `tbl_bild`;
CREATE TABLE `tbl_bild` (
  `PK_Bild` int(11) NOT NULL,
  `Bild` varchar(255) DEFAULT NULL,
  `FK_Hotel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `tbl_bild`
--

INSERT INTO `tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES
(1, 'img/Hotel2_Bild1_de.jpg', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_hotel`
--

DROP TABLE IF EXISTS `tbl_hotel`;
CREATE TABLE `tbl_hotel` (
  `PK_Hotel` int(11) NOT NULL,
  `Name_Hotel` varchar(45) NOT NULL,
  `Sterne` int(11) DEFAULT NULL,
  `Bewertung` int(11) DEFAULT NULL,
  `Preis` int(255) DEFAULT NULL,
  `FK_Ort` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `tbl_hotel`
--

INSERT INTO `tbl_hotel` (`PK_Hotel`, `Name_Hotel`, `Sterne`, `Bewertung`, `Preis`, `FK_Ort`) VALUES
(1, 'HotelVispSchweiz', 4, 2, 1, 1),
(2, 'HotelKölnDeutschland', 4, 4, 1, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_land`
--

DROP TABLE IF EXISTS `tbl_land`;
CREATE TABLE `tbl_land` (
  `PK_Land` int(11) NOT NULL,
  `Name_Land` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
CREATE TABLE `tbl_ort` (
  `PK_Ort` int(11) NOT NULL,
  `Name_Ort` varchar(45) DEFAULT NULL,
  `PLZ` int(11) DEFAULT NULL,
  `FK_Land` int(11) NOT NULL
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
CREATE TABLE `tbl_reservation` (
  `PK_Reservation` int(11) NOT NULL,
  `Frei` tinyint(1) DEFAULT NULL,
  `Reserviert_von` date DEFAULT NULL,
  `Reserviert_bis` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_zimmer`
--

DROP TABLE IF EXISTS `tbl_zimmer`;
CREATE TABLE `tbl_zimmer` (
  `PK_Zimmer` int(11) NOT NULL,
  `Name_Zimmer` varchar(45) DEFAULT NULL,
  `Anzahl_Betten` int(11) DEFAULT NULL,
  `Anzahl_Verfuegbar` int(11) DEFAULT NULL,
  `FK_Hotel` int(11) NOT NULL,
  `Preis` int(11) DEFAULT NULL,
  `FK_Reservation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `tbl_bewertung`
--
ALTER TABLE `tbl_bewertung`
  ADD PRIMARY KEY (`PK_BID`),
  ADD KEY `fk_tbl_Bewertung_tbl_Hotel1_idx` (`FK_Hotel`);

--
-- Indizes für die Tabelle `tbl_bild`
--
ALTER TABLE `tbl_bild`
  ADD PRIMARY KEY (`PK_Bild`);

--
-- Indizes für die Tabelle `tbl_hotel`
--
ALTER TABLE `tbl_hotel`
  ADD PRIMARY KEY (`PK_Hotel`),
  ADD KEY `FK_Ort_idx` (`FK_Ort`);

--
-- Indizes für die Tabelle `tbl_land`
--
ALTER TABLE `tbl_land`
  ADD PRIMARY KEY (`PK_Land`);

--
-- Indizes für die Tabelle `tbl_ort`
--
ALTER TABLE `tbl_ort`
  ADD PRIMARY KEY (`PK_Ort`),
  ADD KEY `FK_Land_idx` (`FK_Land`);

--
-- Indizes für die Tabelle `tbl_reservation`
--
ALTER TABLE `tbl_reservation`
  ADD PRIMARY KEY (`PK_Reservation`);

--
-- Indizes für die Tabelle `tbl_zimmer`
--
ALTER TABLE `tbl_zimmer`
  ADD PRIMARY KEY (`PK_Zimmer`),
  ADD KEY `FK_Hotel_idx` (`FK_Hotel`),
  ADD KEY `fk_tbl_Zimmer_tbl_Reservation1_idx` (`FK_Reservation`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `tbl_bewertung`
--
ALTER TABLE `tbl_bewertung`
  MODIFY `PK_BID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `tbl_bild`
--
ALTER TABLE `tbl_bild`
  MODIFY `PK_Bild` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `tbl_land`
--
ALTER TABLE `tbl_land`
  MODIFY `PK_Land` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `tbl_reservation`
--
ALTER TABLE `tbl_reservation`
  MODIFY `PK_Reservation` int(11) NOT NULL AUTO_INCREMENT;
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
  ADD CONSTRAINT `FK_Hotel` FOREIGN KEY (`FK_Hotel`) REFERENCES `tbl_hotel` (`PK_Hotel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_Zimmer_tbl_Reservation1` FOREIGN KEY (`FK_Reservation`) REFERENCES `tbl_reservation` (`PK_Reservation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
