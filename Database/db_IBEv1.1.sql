-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema db_IBEv1
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `db_IBEv1` ;

-- -----------------------------------------------------
-- Schema db_IBEv1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_IBEv1` DEFAULT CHARACTER SET utf8 ;
USE `db_IBEv1` ;

-- -----------------------------------------------------
-- Table `db_IBEv1`.`tbl_Land`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_IBEv1`.`tbl_Land` ;

CREATE TABLE IF NOT EXISTS `db_IBEv1`.`tbl_Land` (
  `PK_Land` INT NOT NULL AUTO_INCREMENT,
  `Name_Land` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PK_Land`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_IBEv1`.`tbl_Ort`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_IBEv1`.`tbl_Ort` ;

CREATE TABLE IF NOT EXISTS `db_IBEv1`.`tbl_Ort` (
  `PK_Ort` INT NOT NULL,
  `Name_Ort` VARCHAR(45) NULL,
  `PLZ` INT NULL,
  `FK_Land` INT NOT NULL,
  PRIMARY KEY (`PK_Ort`),
  INDEX `FK_Land_idx` (`FK_Land` ASC),
  CONSTRAINT `FK_Land`
    FOREIGN KEY (`FK_Land`)
    REFERENCES `db_IBEv1`.`tbl_Land` (`PK_Land`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_IBEv1`.`tbl_Hotel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_IBEv1`.`tbl_Hotel` ;

CREATE TABLE IF NOT EXISTS `db_IBEv1`.`tbl_Hotel` (
  `PK_Hotel` INT NOT NULL,
  `Name_Hotel` VARCHAR(45) NOT NULL,
  `Sterne` INT NULL,
  `Bewertung` INT NULL,
  `Behindertengerecht` TINYINT(1) NULL,
  `FK_Ort` INT NULL,
  PRIMARY KEY (`PK_Hotel`),
  INDEX `FK_Ort_idx` (`FK_Ort` ASC),
  CONSTRAINT `FK_Ort`
    FOREIGN KEY (`FK_Ort`)
    REFERENCES `db_IBEv1`.`tbl_Ort` (`PK_Ort`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_IBEv1`.`tbl_Reservation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_IBEv1`.`tbl_Reservation` ;

CREATE TABLE IF NOT EXISTS `db_IBEv1`.`tbl_Reservation` (
  `PK_Reservation` INT NOT NULL AUTO_INCREMENT,
  `Frei` TINYINT(1) NULL,
  `Reserviert_von` DATE NULL,
  `Reserviert_bis` DATE NULL,
  PRIMARY KEY (`PK_Reservation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_IBEv1`.`tbl_Zimmer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_IBEv1`.`tbl_Zimmer` ;

CREATE TABLE IF NOT EXISTS `db_IBEv1`.`tbl_Zimmer` (
  `PK_Zimmer` INT NOT NULL,
  `Name_Zimmer` VARCHAR(45) NULL,
  `Anzahl_Betten` INT NULL,
  `Anzahl_Verfuegbar` INT NULL,
  `FK_Hotel` INT NOT NULL,
  `Preis` INT NULL,
  `FK_Reservation` INT NOT NULL,
  PRIMARY KEY (`PK_Zimmer`),
  INDEX `FK_Hotel_idx` (`FK_Hotel` ASC),
  INDEX `fk_tbl_Zimmer_tbl_Reservation1_idx` (`FK_Reservation` ASC),
  CONSTRAINT `FK_Hotel`
    FOREIGN KEY (`FK_Hotel`)
    REFERENCES `db_IBEv1`.`tbl_Hotel` (`PK_Hotel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_Zimmer_tbl_Reservation1`
    FOREIGN KEY (`FK_Reservation`)
    REFERENCES `db_IBEv1`.`tbl_Reservation` (`PK_Reservation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_IBEv1`.`tbl_Bilder`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_IBEv1`.`tbl_Bilder` ;

CREATE TABLE IF NOT EXISTS `db_IBEv1`.`tbl_Bilder` (
  `PK_Bild` INT NOT NULL AUTO_INCREMENT,
  `Bild` LONGBLOB NULL,
  `Bild_Typ` VARCHAR(45) NULL,
  `FK_Hotel` INT NOT NULL,
  PRIMARY KEY (`PK_Bild`),
  INDEX `fk_tbl_Bilder_tbl_Hotel1_idx` (`FK_Hotel` ASC),
  CONSTRAINT `fk_tbl_Bilder_tbl_Hotel1`
    FOREIGN KEY (`FK_Hotel`)
    REFERENCES `db_IBEv1`.`tbl_Hotel` (`PK_Hotel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_IBEv1`.`tbl_Bewertung`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_IBEv1`.`tbl_Bewertung` ;

CREATE TABLE IF NOT EXISTS `db_IBEv1`.`tbl_Bewertung` (
  `PK_BID` INT NOT NULL AUTO_INCREMENT,
  `Stars` INT(5) NULL,
  `FK_Hotel` INT NOT NULL,
  PRIMARY KEY (`PK_BID`),
  INDEX `fk_tbl_Bewertung_tbl_Hotel1_idx` (`FK_Hotel` ASC),
  CONSTRAINT `fk_tbl_Bewertung_tbl_Hotel1`
    FOREIGN KEY (`FK_Hotel`)
    REFERENCES `db_IBEv1`.`tbl_Hotel` (`PK_Hotel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
