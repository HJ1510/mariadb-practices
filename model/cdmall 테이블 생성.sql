-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cdmall
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cdmall
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cdmall` DEFAULT CHARACTER SET utf8 ;
USE `cdmall` ;

-- -----------------------------------------------------
-- Table `cdmall`.`company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdmall`.`company` ;

CREATE TABLE IF NOT EXISTS `cdmall`.`company` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `tel` VARCHAR(13) NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdmall`.`album`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdmall`.`album` ;

CREATE TABLE IF NOT EXISTS `cdmall`.`album` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `price` MEDIUMINT NOT NULL,
  `company_no` INT NOT NULL,
  PRIMARY KEY (`no`),
  CONSTRAINT `fk_album_company1`
    FOREIGN KEY (`company_no`)
    REFERENCES `cdmall`.`company` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdmall`.`artist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdmall`.`artist` ;

CREATE TABLE IF NOT EXISTS `cdmall`.`artist` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `gender` ENUM('male', 'female') NOT NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdmall`.`song`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdmall`.`song` ;

CREATE TABLE IF NOT EXISTS `cdmall`.`song` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `length` MEDIUMINT NOT NULL,
  `album_no` INT NOT NULL,
  `artist_no` INT NOT NULL,
  PRIMARY KEY (`no`),
  CONSTRAINT `fk_song_album`
    FOREIGN KEY (`album_no`)
    REFERENCES `cdmall`.`album` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_song_artist1`
    FOREIGN KEY (`artist_no`)
    REFERENCES `cdmall`.`artist` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdmall`.`genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdmall`.`genre` ;

CREATE TABLE IF NOT EXISTS `cdmall`.`genre` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `abbr_name` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdmall`.`song_genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdmall`.`song_genre` ;

CREATE TABLE IF NOT EXISTS `cdmall`.`song_genre` (
  `song_no` INT NOT NULL,
  `genre_no` INT NOT NULL,
  CONSTRAINT `fk_song_genre_song1`
    FOREIGN KEY (`song_no`)
    REFERENCES `cdmall`.`song` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_song_genre_genre1`
    FOREIGN KEY (`genre_no`)
    REFERENCES `cdmall`.`genre` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

show tables;