-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Constituency`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Constituency` (
  `ConstituencyID` INT NOT NULL,
  `ConstituencyName` VARCHAR(50) NOT NULL,
  `MP` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ConstituencyID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Station`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Station` (
  `Site_ID` INT NOT NULL,
  `SiteName` VARCHAR(70) NOT NULL,
  `GeoCode` VARCHAR(100) NOT NULL,
  `ConstituencyID` INT NOT NULL,
  PRIMARY KEY (`Site_ID`),
  INDEX `fk_Station_Constituency_idx` (`ConstituencyID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Readings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Readings` (
  `ReadingID` INT NOT NULL,
  `Date_Time` DATETIME NOT NULL,
  `Site_ID` INT NOT NULL,
  `NOx` FLOAT NULL,
  `NO2` FLOAT NULL,
  `NO` FLOAT NULL,
  `PM10` FLOAT NULL,
  `O3` FLOAT NULL,
  `Temperature` FLOAT NULL,
  `ObjectId` INT NULL,
  `ObjectId2` INT NULL,
  `NVPM10` FLOAT NULL,
  `VPM10` FLOAT NULL,
  `NVPM2_5` FLOAT NULL,
  `PM2_5` FLOAT NULL,
  `VPM2.5` FLOAT NULL,
  `CO` FLOAT NULL,
  `RH` FLOAT NULL,
  `Pressure` FLOAT NULL,
  `SO2` FLOAT NULL,
  PRIMARY KEY (`ReadingID`),
  INDEX `fk_Readings_Station1_idx` (`Site_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Schema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Schema` (
  `SchemaID` INT NOT NULL,
  `Measure` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(100) NOT NULL,
  `Unit` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`SchemaID`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
