-- MySQL Workbench Synchronization
-- Generated: 2021-12-17 12:44
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: dell

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `school`.`courses` 
DROP FOREIGN KEY `fk_courses_instructors1`;

ALTER TABLE `school`.`enrollments` 
DROP FOREIGN KEY `fk_enrollments_courses1`;

ALTER TABLE `school`.`courses_tags` 
DROP FOREIGN KEY `fk_courses_tags_courses1`,
DROP FOREIGN KEY `fk_courses_tags_tags1`;

ALTER TABLE `school`.`students` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `school`.`courses` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `school`.`enrollments` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
ADD COLUMN `coupon` VARCHAR(50) NULL DEFAULT NULL AFTER `price`,
CHANGE COLUMN `date` `date` DATETIME NOT NULL ,
CHANGE COLUMN `price` `price` DECIMAL(5,2) NOT NULL ;

ALTER TABLE `school`.`tags` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `school`.`courses_tags` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `school`.`instructors` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `school`.`courses` 
ADD CONSTRAINT `fk_courses_instructors1`
  FOREIGN KEY (`instructors_ID`)
  REFERENCES `school`.`instructors` (`instructors_ID`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

ALTER TABLE `school`.`enrollments` 
DROP FOREIGN KEY `fk_enrollments_students`;

ALTER TABLE `school`.`enrollments` ADD CONSTRAINT `fk_enrollments_students`
  FOREIGN KEY (`student_ID`)
  REFERENCES `school`.`students` (`student_ID`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_enrollments_courses1`
  FOREIGN KEY (`course_ID`)
  REFERENCES `school`.`courses` (`course_ID`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

ALTER TABLE `school`.`courses_tags` 
ADD CONSTRAINT `fk_courses_tags_courses1`
  FOREIGN KEY (`course_ID`)
  REFERENCES `school`.`courses` (`course_ID`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_courses_tags_tags1`
  FOREIGN KEY (`tags_ID`)
  REFERENCES `school`.`tags` (`tags_ID`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
