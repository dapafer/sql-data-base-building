-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema blockbuster
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blockbuster
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blockbuster` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `blockbuster` ;

-- -----------------------------------------------------
-- Table `blockbuster`.`actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`actors` (
  `actor_id` INT NOT NULL,
  `first_name` TEXT NULL DEFAULT NULL,
  `last_name` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`categories` (
  `category_id` INT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`films` (
  `film_id` INT NOT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `release_year` INT NULL DEFAULT NULL,
  `language` TEXT NULL DEFAULT NULL,
  `rental_duration` INT NULL DEFAULT NULL,
  `rental_rate` DOUBLE NULL DEFAULT NULL,
  `length` INT NULL DEFAULT NULL,
  `replacement_cost` DOUBLE NULL DEFAULT NULL,
  `rating` TEXT NULL DEFAULT NULL,
  `special_features` TEXT NULL DEFAULT NULL,
  `category_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  INDEX `fk_films_categories1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_films_categories1`
    FOREIGN KEY (`category_id`)
    REFERENCES `blockbuster`.`categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`actors_films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`actors_films` (
  `actor_id` INT NULL,
  `film_id` INT NULL,
  INDEX `fk_actors_films_actors_idx` (`actor_id` ASC) VISIBLE,
  INDEX `fk_actors_films_films1_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `fk_actors_films_actors`
    FOREIGN KEY (`actor_id`)
    REFERENCES `blockbuster`.`actors` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_actors_films_films1`
    FOREIGN KEY (`film_id`)
    REFERENCES `blockbuster`.`films` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`stores` (
  `store_id` INT NOT NULL,
  `adress` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`store_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`inventories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`inventories` (
  `inventory_id` INT NOT NULL,
  `film_id` INT NULL DEFAULT NULL,
  `store_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  INDEX `fk_inventories_films1_idx` (`film_id` ASC) VISIBLE,
  INDEX `fk_inventories_stores1_idx` (`store_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventories_films1`
    FOREIGN KEY (`film_id`)
    REFERENCES `blockbuster`.`films` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventories_stores1`
    FOREIGN KEY (`store_id`)
    REFERENCES `blockbuster`.`stores` (`store_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`customers` (
  `customer_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`staff` (
  `staff_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`rentals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`rentals` (
  `rental_id` INT NOT NULL,
  `rental_date` TEXT NULL DEFAULT NULL,
  `inventory_id` INT NULL DEFAULT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `return_date` TEXT NULL DEFAULT NULL,
  `staff_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`rental_id`),
  INDEX `fk_rentals_inventories1_idx` (`inventory_id` ASC) VISIBLE,
  INDEX `fk_rentals_customers1_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_rentals_staff1_idx` (`staff_id` ASC) VISIBLE,
  CONSTRAINT `fk_rentals_inventories1`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `blockbuster`.`inventories` (`inventory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rentals_customers1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `blockbuster`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rentals_staff1`
    FOREIGN KEY (`staff_id`)
    REFERENCES `blockbuster`.`staff` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
