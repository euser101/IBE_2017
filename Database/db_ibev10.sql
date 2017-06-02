-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema db_ibev1
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `db_ibev1` ;

-- -----------------------------------------------------
-- Schema db_ibev1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_ibev1` DEFAULT CHARACTER SET utf8 ;
USE `db_ibev1` ;

-- -----------------------------------------------------
-- Table `db_ibev1`.`tbl_land`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ibev1`.`tbl_land` (
  `PK_Land` INT(11) NOT NULL AUTO_INCREMENT,
  `Name_Land` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PK_Land`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_ibev1`.`tbl_ort`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ibev1`.`tbl_ort` (
  `PK_Ort` INT(11) NOT NULL,
  `Name_Ort` VARCHAR(45) NULL DEFAULT NULL,
  `PLZ` INT(11) NULL DEFAULT NULL,
  `FK_Land` INT(11) NOT NULL,
  PRIMARY KEY (`PK_Ort`),
  INDEX `FK_Land_idx` (`FK_Land` ASC),
  CONSTRAINT `FK_Land`
    FOREIGN KEY (`FK_Land`)
    REFERENCES `db_ibev1`.`tbl_land` (`PK_Land`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_ibev1`.`tbl_hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ibev1`.`tbl_hotel` (
  `PK_Hotel` INT(11) NOT NULL,
  `Name_Hotel` VARCHAR(45) NOT NULL,
  `Location` VARCHAR(1000) NULL DEFAULT NULL,
  `Beschreibung` VARCHAR(4000) NULL DEFAULT NULL,
  `Sterne` INT(11) NULL DEFAULT NULL,
  `Bewertung` INT(11) NULL DEFAULT NULL,
  `FK_Ort` INT(11) NULL DEFAULT NULL,
  `Preis` INT NULL,
  PRIMARY KEY (`PK_Hotel`),
  INDEX `FK_Ort_idx` (`FK_Ort` ASC),
  CONSTRAINT `FK_Ort`
    FOREIGN KEY (`FK_Ort`)
    REFERENCES `db_ibev1`.`tbl_ort` (`PK_Ort`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_ibev1`.`tbl_bewertung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ibev1`.`tbl_bewertung` (
  `PK_BID` INT(11) NOT NULL AUTO_INCREMENT,
  `Stars` INT(5) NULL DEFAULT NULL,
  `FK_Hotel` INT(11) NOT NULL,
  PRIMARY KEY (`PK_BID`),
  INDEX `fk_tbl_Bewertung_tbl_Hotel1_idx` (`FK_Hotel` ASC),
  CONSTRAINT `fk_tbl_Bewertung_tbl_Hotel1`
    FOREIGN KEY (`FK_Hotel`)
    REFERENCES `db_ibev1`.`tbl_hotel` (`PK_Hotel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_ibev1`.`tbl_bild`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ibev1`.`tbl_bild` (
  `PK_Bild` INT(11) NOT NULL AUTO_INCREMENT,
  `Bild` VARCHAR(255) NULL DEFAULT NULL,
  `FK_Hotel` INT(11) NOT NULL,
  PRIMARY KEY (`PK_Bild`),
  INDEX `fk_tbl_bild_tbl_hotel1_idx` (`FK_Hotel` ASC),
  CONSTRAINT `Fk_Hotel`
    FOREIGN KEY (`FK_Hotel`)
    REFERENCES `db_ibev1`.`tbl_hotel` (`PK_Hotel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_ibev1`.`tbl_reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ibev1`.`tbl_reservation` (
  `PK_Reservation` INT(11) NOT NULL AUTO_INCREMENT,
  `Frei` TINYINT(1) NULL DEFAULT NULL,
  `Reserviert_von` DATE NULL DEFAULT NULL,
  `Reserviert_bis` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`PK_Reservation`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_ibev1`.`tbl_zimmer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ibev1`.`tbl_zimmer` (
  `PK_Zimmer` INT(11) NOT NULL,
  `Name_Zimmer` VARCHAR(45) NULL DEFAULT NULL,
  `Anzahl_Betten` INT(11) NULL DEFAULT NULL,
  `Anzahl_Verfuegbar` INT(11) NULL DEFAULT NULL,
  `FK_Hotel2` INT(11) NOT NULL,
  `Preis` INT(11) NULL DEFAULT NULL,
  `FK_Reservation` INT(11) NOT NULL,
  PRIMARY KEY (`PK_Zimmer`),
  INDEX `FK_Hotel_idx` (`FK_Hotel2` ASC),
  INDEX `fk_tbl_Zimmer_tbl_Reservation1_idx` (`FK_Reservation` ASC),
  CONSTRAINT `FK_Hotel2`
    FOREIGN KEY (`FK_Hotel2`)
    REFERENCES `db_ibev1`.`tbl_hotel` (`PK_Hotel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_Zimmer_tbl_Reservation1`
    FOREIGN KEY (`FK_Reservation`)
    REFERENCES `db_ibev1`.`tbl_reservation` (`PK_Reservation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `db_ibev1`.`tbl_land`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_ibev1`;
INSERT INTO `db_ibev1`.`tbl_land` (`PK_Land`, `Name_Land`) VALUES (1, 'Deutschland');
INSERT INTO `db_ibev1`.`tbl_land` (`PK_Land`, `Name_Land`) VALUES (2, 'Frankreich');
INSERT INTO `db_ibev1`.`tbl_land` (`PK_Land`, `Name_Land`) VALUES (3, 'Italien');
INSERT INTO `db_ibev1`.`tbl_land` (`PK_Land`, `Name_Land`) VALUES (4, 'Schweiz');
INSERT INTO `db_ibev1`.`tbl_land` (`PK_Land`, `Name_Land`) VALUES (5, 'Spanien');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_ibev1`.`tbl_ort`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_ibev1`;
INSERT INTO `db_ibev1`.`tbl_ort` (`PK_Ort`, `Name_Ort`, `PLZ`, `FK_Land`) VALUES (1, 'Köln', NULL, 1);
INSERT INTO `db_ibev1`.`tbl_ort` (`PK_Ort`, `Name_Ort`, `PLZ`, `FK_Land`) VALUES (2, 'Berlin', NULL, 1);
INSERT INTO `db_ibev1`.`tbl_ort` (`PK_Ort`, `Name_Ort`, `PLZ`, `FK_Land`) VALUES (3, 'Paris', NULL, 2);
INSERT INTO `db_ibev1`.`tbl_ort` (`PK_Ort`, `Name_Ort`, `PLZ`, `FK_Land`) VALUES (4, 'Mailand', NULL, 3);
INSERT INTO `db_ibev1`.`tbl_ort` (`PK_Ort`, `Name_Ort`, `PLZ`, `FK_Land`) VALUES (5, 'Genf', NULL, 4);
INSERT INTO `db_ibev1`.`tbl_ort` (`PK_Ort`, `Name_Ort`, `PLZ`, `FK_Land`) VALUES (6, 'Zermatt', NULL, 4);
INSERT INTO `db_ibev1`.`tbl_ort` (`PK_Ort`, `Name_Ort`, `PLZ`, `FK_Land`) VALUES (7, 'Barcelona', NULL, 5);
INSERT INTO `db_ibev1`.`tbl_ort` (`PK_Ort`, `Name_Ort`, `PLZ`, `FK_Land`) VALUES (8, 'Madrid', NULL, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_ibev1`.`tbl_hotel`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_ibev1`;
INSERT INTO `db_ibev1`.`tbl_hotel` (`PK_Hotel`, `Name_Hotel`, `Location`, `Beschreibung`, `Sterne`, `Bewertung`, `FK_Ort`, `Preis`) VALUES (1, 'AZIMUT Cologne City Center', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2513.63384904297!2d6.948949215749525!3d50.94898417954721!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47bf25a10cb997b7%3A0x7fdd546adcb6ae26!2sAZIMUT+Hotel+Cologne+City+Center!5e0!3m2!1sde!2sch!4v1496408349632', 'Dieses einzigartige Hotel begrüßt Sie auf 6 Etagen im ehemals höchsten Gebäude Europas. Freuen Sie sich im AZIMUT Hotel Cologne City Center, das im Jahr 2008 eröffnet wurde, auf geräumige Zimmer und die kostenlose Nutzung des Fitnessbereichs mit einer Sauna.', 3, 4, 1, 98);
INSERT INTO `db_ibev1`.`tbl_hotel` (`PK_Hotel`, `Name_Hotel`, `Location`, `Beschreibung`, `Sterne`, `Bewertung`, `FK_Ort`, `Preis`) VALUES (2, 'H2 Hotel Berlin-Alexanderplatz', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2427.458949554714!2d13.411826315807696!3d52.52512997981512!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47a84e1e91cc6319%3A0x131d07b4d4898297!2sH2+Hotel+Berlin-Alexanderplatz!5e0!3m2!1sde!2sch!4v1496408479580', 'Dieses moderne Hotel begrüßt Sie in idealer Lage im Herzen von Berlin, nur 3 Gehminuten vom Alexanderplatz und dem kultigen Fernsehturm entfernt. Es bietet schallisolierte Zimmer mit kostenfreiem WLAN und innovativem Design.', 4, 4, 2, 187);
INSERT INTO `db_ibev1`.`tbl_hotel` (`PK_Hotel`, `Name_Hotel`, `Location`, `Beschreibung`, `Sterne`, `Bewertung`, `FK_Ort`, `Preis`) VALUES (3, 'Melia Paris La Defense', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2623.4145697900876!2d2.2484072156754578!3d48.88843587929048!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e6650e2ac7a89f%3A0x275cffe2dfdbdb6b!2sMeli%C3%A1+Paris+La+D%C3%A9fense!5e0!3m2!1sde!2sch!4v1496408547802', 'Das Designhotel Melia Paris La Defense erwartet Sie im Zentrum des Geschäftsviertels La Défense und bietet Ihnen eine Bar-Lounge auf der 19. Etage mit Panoramablick über die Stadt. Freuen Sie sich auf kostenfreien Zugang zum Fitnesscenter sowie kostenfreies Glasfaser-WLAN.', 5, 3, 3, 345);
INSERT INTO `db_ibev1`.`tbl_hotel` (`PK_Hotel`, `Name_Hotel`, `Location`, `Beschreibung`, `Sterne`, `Bewertung`, `FK_Ort`, `Preis`) VALUES (4, 'Aparthotel Adagio Access La Défense - Léonard De Vinci', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2622.9705204175325!2d2.2324773156757467!3d48.89689897929132!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e664ffd0c96e29%3A0x19a86159c01eedc4!2sAparthotel+Adagio+Access+La+D%C3%A9fense+L%C3%A9onard+de+Vinci!5e0!3m2!1sde!2sch!4v1496408594767', 'Das Aparthotel Adagio Access La Défense - Léonard De Vinci erwartet Sie 500 m vom Grande Arche de la Défense und dem beliebten Einkaufszentrum 4 Temps entfernt. WLAN nutzen Sie in diesem Aparthotel kostenfrei.', 4, 4, 3, 295);
INSERT INTO `db_ibev1`.`tbl_hotel` (`PK_Hotel`, `Name_Hotel`, `Location`, `Beschreibung`, `Sterne`, `Bewertung`, `FK_Ort`, `Preis`) VALUES (5, 'Room Mate Giulia', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2798.2316608931983!2d9.187336215557469!3d45.46513707910097!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4786c6add329ca21%3A0xbc8a5a4db5159804!2sRoom+Mate+Giulia!5e0!3m2!1sde!2sch!4v1496408649681', 'Das Hotel Room Mate Giulia bietet Ihnen Zimmer und Suiten in wenigen Schritten Entfernung vom Mailänder Dom. Das Mailänder Modeviertel erreichen Sie nach einem 10-minütigen Spaziergang. Zu den kostenfreien Annehmlichkeiten gehören WLAN sowie die Nutzung des Fitnesscenters mit einer Sauna.', 3, 3, 4, 80);
INSERT INTO `db_ibev1`.`tbl_hotel` (`PK_Hotel`, `Name_Hotel`, `Location`, `Beschreibung`, `Sterne`, `Bewertung`, `FK_Ort`, `Preis`) VALUES (6, 'The Square Milano Duomo', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2798.443939162446!2d9.186832815557318!3d45.46086037910091!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4786c6a97aea9abd%3A0x12964b9b82d9f3de!2sThe+Square+Milano+Duomo!5e0!3m2!1sde!2sch!4v1496408690651', 'Das The Square Milano Duomo erwartet Sie in einem historischen Gebäude, nur 5 Gehminuten vom Mailänder Dom, vom Teatro alla Scala und vom Einkaufsviertel Vittorio Emanuele entfernt. Freuen Sie sich auf ein Restaurant, eine Bar und kostenloses WLAN in der gesamten Unterkunft.', 4, 4, 4, 145);
INSERT INTO `db_ibev1`.`tbl_hotel` (`PK_Hotel`, `Name_Hotel`, `Location`, `Beschreibung`, `Sterne`, `Bewertung`, `FK_Ort`, `Preis`) VALUES (7, 'Mandarin Oriental, Geneva', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2761.2412569537514!2d6.138463315582431!3d46.20565547911665!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x478c64d7da5c4f53%3A0xd7c864881c475e30!2sMandarin+Oriental%2C+Geneva!5e0!3m2!1sde!2sch!4v1496410094774', 'Diese Unterkunft ist 14 Gehminuten vom Strand entfernt. Das luxuriöse Mandarin Oriental erwartet Sie mit 2 Gourmetrestaurants am rechten Ufer der Rhône, nur 5 bis 10 Gehminuten von Banken, Geschäften und Galerien in Genf entfernt. Das stilvolle Interieur bringt die feinen Art déco-Details des Gebäudes zur Geltung.', 5, 5, 5, 420);
INSERT INTO `db_ibev1`.`tbl_hotel` (`PK_Hotel`, `Name_Hotel`, `Location`, `Beschreibung`, `Sterne`, `Bewertung`, `FK_Ort`, `Preis`) VALUES (8, 'Wellness Hotel Alpenhof', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2770.388470547409!2d7.749100715576275!3d46.02339697911155!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x478f3675e8b93fcb%3A0xe306b69f0d73ca83!2sHotel+Alpenhof!5e0!3m2!1sde!2sch!4v1496410131828', 'Das familiengeführte 4-Sterne-Hotel Wellness Alpenhof empfängt Sie im Zentrum von Zermatt, direkt gegenüber der Seilbahn Sunnegga und 5 Gehminuten von der Gornergratbahn entfernt.', 4, 4, 6, 234);
INSERT INTO `db_ibev1`.`tbl_hotel` (`PK_Hotel`, `Name_Hotel`, `Location`, `Beschreibung`, `Sterne`, `Bewertung`, `FK_Ort`, `Preis`) VALUES (9, 'Boutique Barcelona Bed and Breakfast', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2993.0893931144883!2d2.1631173154259717!3d41.39386497926358!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x12a4a2ecc545b4ad%3A0xf752238c5716cbc7!2sBoutique+Barcelona+Bed+And+Breakfast!5e0!3m2!1sde!2sch!4v1496410169585', 'Im Herzen des modernistischen Barcelona liegt das moderne Hotel Boutique nur einen kurzen Spaziergang von den Gaudí-Bauten La Pedrera und Casa Batlló entfernt.', 2, 2, 7, 50);
INSERT INTO `db_ibev1`.`tbl_hotel` (`PK_Hotel`, `Name_Hotel`, `Location`, `Beschreibung`, `Sterne`, `Bewertung`, `FK_Ort`, `Preis`) VALUES (10, 'GranViaCapital', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3037.4544570411776!2d-3.7082998846039286!3d40.42093477936463!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd42287cf07aaaab%3A0xf39a3646264b4754!2sGran+V%C3%ADa+Capital!5e0!3m2!1sde!2sch!4v1496410206200', 'Die klimatisierte Unterkunft Gran Vía Capital bietet Ihnen kostenfreies WLAN und begrüßt Sie 500 m von de Puerta del Sol entfernt. Freuen Sie sich auf einen saisonalen Pool mit Wasserdüsen und eine Terrasse mit Chill-out-Bereich.', 2, 3, 8, 69);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_ibev1`.`tbl_bild`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_ibev1`;
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (1, 'Hotel4_Bild1_de.jpg', 1);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (2, 'Hotel4_Bild2_de.jpg', 1);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (3, 'Hotel4_Bild3_de.jpg', 1);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (4, 'Hotel1_Bild1_de.jpg', 2);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (5, 'Hotel1_Bild2_de.jpg', 2);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (6, 'Hotel1_Bild3_de.jpg', 2);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (7, 'Hotel3_Bild4_fr.jpg', 3);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (8, 'Hotel3_Bild1_fr.jpg', 3);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (9, 'Hotel3_Bild2_fr.jpg', 3);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (10, 'Hotel3_Bild3_fr.jpg', 3);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (11, 'Hotel4_Bild1_fr.jpg', 4);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (12, 'Hotel4_Bild2_fr.jpg', 4);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (13, 'Hotel4_Bild3_fr.jpg', 4);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (14, 'Hotel1_Bild1_it.jpg', 5);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (15, 'Hotel1_Bild2_it.jpg', 5);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (16, 'Hotel1_Bild3_it.jpg', 5);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (17, 'Hotel2_Bild1_it.jpg', 6);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (18, 'Hotel2_Bild2_it.jpg', 6);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (19, 'Hotel2_Bild3_it.jpg', 6);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (20, 'Hotel2_Bild1_ch.jpg', 7);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (21, 'Hotel2_Bild2_ch.jpg', 7);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (22, 'Hotel2_Bild3_ch.jpg', 7);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (23, 'Hotel3_Bild1_ch.jpg', 8);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (24, 'Hotel3_Bild2_ch.jpg', 8);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (25, 'Hotel3_Bild3_ch.jpg', 8);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (26, 'Hotel1_Bild1_es.jpg', 9);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (27, 'Hotel1_Bild2_es.jpg', 9);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (28, 'Hotel1_Bild3_es.jpg', 9);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (29, 'Hotel3_Bild1_es.jpg', 10);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (30, 'Hotel3_Bild2_es.jpg', 10);
INSERT INTO `db_ibev1`.`tbl_bild` (`PK_Bild`, `Bild`, `FK_Hotel`) VALUES (31, 'Hotel3_Bild3_es.jpg', 10);

COMMIT;

