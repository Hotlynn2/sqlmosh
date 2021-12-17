-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema school
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema school
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `school` DEFAULT CHARACTER SET utf8 ;
USE `school` ;

-- -----------------------------------------------------
-- Table `school`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`students` (
  `student_ID` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NULL,
  `last_name` VARCHAR(50) NULL,
  `email` VARCHAR(255) NULL,
  `date_registered` DATETIME NULL,
  PRIMARY KEY (`student_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`instructors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`instructors` (
  `instructors_ID` SMALLINT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`instructors_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`courses` (
  `course_ID` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL,
  `price` DECIMAL(5,2) NULL,
  `tags` VARCHAR(255) NULL,
  `instructors_ID` SMALLINT NOT NULL,
  PRIMARY KEY (`course_ID`),
  INDEX `fk_courses_instructors1_idx` (`instructors_ID` ASC) VISIBLE,
  CONSTRAINT `fk_courses_instructors1`
    FOREIGN KEY (`instructors_ID`)
    REFERENCES `school`.`instructors` (`instructors_ID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`enrollments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`enrollments` (
  `student_ID` INT NOT NULL,
  `course_ID` INT NOT NULL,
  `date` DATETIME NULL,
  `price` DECIMAL(5,2) NULL,
  INDEX `fk_enrollments_students_idx` (`student_ID` ASC) VISIBLE,
  INDEX `fk_enrollments_courses1_idx` (`course_ID` ASC) VISIBLE,
  PRIMARY KEY (`student_ID`, `course_ID`),
  CONSTRAINT `fk_enrollments_students`
    FOREIGN KEY (`student_ID`)
    REFERENCES `school`.`students` (`student_ID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_enrollments_courses1`
    FOREIGN KEY (`course_ID`)
    REFERENCES `school`.`courses` (`course_ID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`tags` (
  `tags_ID` INT NOT NULL,
  `name` VARCHAR(50) NULL,
  PRIMARY KEY (`tags_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`courses_tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`courses_tags` (
  `course_ID` INT NOT NULL,
  `tags_ID` INT NOT NULL,
  INDEX `fk_courses_tags_courses1_idx` (`course_ID` ASC) VISIBLE,
  INDEX `fk_courses_tags_tags1_idx` (`tags_ID` ASC) VISIBLE,
  CONSTRAINT `fk_courses_tags_courses1`
    FOREIGN KEY (`course_ID`)
    REFERENCES `school`.`courses` (`course_ID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_courses_tags_tags1`
    FOREIGN KEY (`tags_ID`)
    REFERENCES `school`.`tags` (`tags_ID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
