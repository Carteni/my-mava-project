-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mava
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mava
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mava` DEFAULT CHARACTER SET latin1 ;
USE `mava` ;

-- -----------------------------------------------------
-- Table `mava`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mava`.`user` ;

CREATE TABLE IF NOT EXISTS `mava`.`user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL COMMENT '',
  `bio` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL COMMENT '',
  `email` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `mava`.`workspace`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mava`.`workspace` ;

CREATE TABLE IF NOT EXISTS `mava`.`workspace` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  `description` TINYTEXT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mava`.`project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mava`.`project` ;

CREATE TABLE IF NOT EXISTS `mava`.`project` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `title` VARCHAR(45) NOT NULL COMMENT '',
  `description` TINYTEXT NOT NULL COMMENT '',
  `due_date` DATETIME NOT NULL COMMENT '',
  `workspace_id` INT NOT NULL COMMENT '',
  INDEX `fk_project_idx` (`workspace_id` ASC)  COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  CONSTRAINT `fk_project`
    FOREIGN KEY (`workspace_id`)
    REFERENCES `mava`.`workspace` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mava`.`task`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mava`.`task` ;

CREATE TABLE IF NOT EXISTS `mava`.`task` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `title` VARCHAR(45) NOT NULL COMMENT '',
  `description` TINYTEXT NOT NULL COMMENT '',
  `due_date` DATETIME NOT NULL COMMENT '',
  `attachment` TINYINT(1) NULL COMMENT '',
  `project_id` INT NOT NULL COMMENT '',
  `user_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_task_1_idx` (`project_id` ASC)  COMMENT '',
  INDEX `fk_task_2_idx` (`user_id` ASC)  COMMENT '',
  CONSTRAINT `fk_task_1`
    FOREIGN KEY (`project_id`)
    REFERENCES `mava`.`project` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_task_2`
    FOREIGN KEY (`user_id`)
    REFERENCES `mava`.`user` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
