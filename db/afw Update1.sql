-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema afs
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema afs
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `afs` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `afs` ;

-- -----------------------------------------------------
-- Table `afs`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `afs`.`roles` (
  `role_id` INT NOT NULL,
  `role_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `afs`.`questions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `afs`.`questions` (
  `que_id` INT NOT NULL,
  `que_text` TEXT NOT NULL,
  PRIMARY KEY (`que_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `afs`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `afs`.`users` (
  `user_id` INT NOT NULL,
  `user_name` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `role_id` INT NULL DEFAULT NULL,
  `que_id` INT NULL DEFAULT NULL,
  `answer` TEXT NULL DEFAULT NULL,
  `approve` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `role_id` (`role_id` ASC) VISIBLE,
  INDEX `que_id` (`que_id` ASC) VISIBLE,
  CONSTRAINT `users_ibfk_1`
    FOREIGN KEY (`role_id`)
    REFERENCES `afs`.`roles` (`role_id`),
  CONSTRAINT `users_ibfk_2`
    FOREIGN KEY (`que_id`)
    REFERENCES `afs`.`questions` (`que_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `afs`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `afs`.`admin` (
  `admin_id` INT NOT NULL,
  `user_id` INT NULL DEFAULT NULL,
  `fname` VARCHAR(255) NULL DEFAULT NULL,
  `lname` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `admin_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `afs`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `afs`.`state`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `afs`.`state` (
  `state_id` INT NOT NULL,
  `state_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`state_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `afs`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `afs`.`city` (
  `city_id` INT NOT NULL,
  `city_name` VARCHAR(255) NOT NULL,
  `state_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`city_id`),
  INDEX `state_id` (`state_id` ASC) VISIBLE,
  CONSTRAINT `city_ibfk_1`
    FOREIGN KEY (`state_id`)
    REFERENCES `afs`.`state` (`state_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `afs`.`area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `afs`.`area` (
  `area_id` INT NOT NULL,
  `area_name` VARCHAR(255) NOT NULL,
  `city_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`area_id`),
  INDEX `city_id` (`city_id` ASC) VISIBLE,
  CONSTRAINT `area_ibfk_1`
    FOREIGN KEY (`city_id`)
    REFERENCES `afs`.`city` (`city_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `afs`.`artists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `afs`.`artists` (
  `artist_id` INT NOT NULL,
  `user_id` INT NULL DEFAULT NULL,
  `fname` VARCHAR(255) NULL DEFAULT NULL,
  `lname` VARCHAR(255) NULL DEFAULT NULL,
  `area_id` INT NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `contact` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`artist_id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  INDEX `area_id` (`area_id` ASC) VISIBLE,
  CONSTRAINT `artists_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `afs`.`users` (`user_id`),
  CONSTRAINT `artists_ibfk_2`
    FOREIGN KEY (`area_id`)
    REFERENCES `afs`.`area` (`area_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `afs`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `afs`.`category` (
  `cat_id` INT NOT NULL,
  `cat_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`cat_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `afs`.`ngo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `afs`.`ngo` (
  `ngo_id` INT NOT NULL,
  `user_id` INT NULL DEFAULT NULL,
  `fname` VARCHAR(255) NULL DEFAULT NULL,
  `lname` VARCHAR(255) NULL DEFAULT NULL,
  `area_id` INT NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `contact` VARCHAR(20) NULL DEFAULT NULL,
  `certificate` VARCHAR(255) NULL DEFAULT NULL,
  `account_no` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`ngo_id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  INDEX `area_id` (`area_id` ASC) VISIBLE,
  CONSTRAINT `ngo_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `afs`.`users` (`user_id`),
  CONSTRAINT `ngo_ibfk_2`
    FOREIGN KEY (`area_id`)
    REFERENCES `afs`.`area` (`area_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `afs`.`art`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `afs`.`art` (
  `art_id` INT NOT NULL,
  `artist_id` INT NULL DEFAULT NULL,
  `cat_id` INT NULL DEFAULT NULL,
  `price` DECIMAL(10,2) NULL DEFAULT NULL,
  `ngo_id` INT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `art_name` VARCHAR(255) NULL DEFAULT NULL,
  `status` VARCHAR(10) NULL DEFAULT NULL,
  `image` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`art_id`),
  INDEX `artist_id` (`artist_id` ASC) VISIBLE,
  INDEX `cat_id` (`cat_id` ASC) VISIBLE,
  INDEX `ngo_id` (`ngo_id` ASC) VISIBLE,
  CONSTRAINT `art_ibfk_1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `afs`.`artists` (`artist_id`),
  CONSTRAINT `art_ibfk_2`
    FOREIGN KEY (`cat_id`)
    REFERENCES `afs`.`category` (`cat_id`),
  CONSTRAINT `art_ibfk_3`
    FOREIGN KEY (`ngo_id`)
    REFERENCES `afs`.`ngo` (`ngo_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `afs`.`afw_fund`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `afs`.`afw_fund` (
  `afwf_id` INT NOT NULL,
  `art_id` INT NULL DEFAULT NULL,
  `amount` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`afwf_id`),
  INDEX `art_id` (`art_id` ASC) VISIBLE,
  CONSTRAINT `afw_fund_ibfk_1`
    FOREIGN KEY (`art_id`)
    REFERENCES `afs`.`art` (`art_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `afs`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `afs`.`customers` (
  `cust_id` INT NOT NULL,
  `user_id` INT NULL DEFAULT NULL,
  `fname` VARCHAR(255) NULL DEFAULT NULL,
  `lname` VARCHAR(255) NULL DEFAULT NULL,
  `area_id` INT NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `contact` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`cust_id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  INDEX `area_id` (`area_id` ASC) VISIBLE,
  CONSTRAINT `customers_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `afs`.`users` (`user_id`),
  CONSTRAINT `customers_ibfk_2`
    FOREIGN KEY (`area_id`)
    REFERENCES `afs`.`area` (`area_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `afs`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `afs`.`cart` (
  `cart_id` INT NOT NULL,
  `cust_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  INDEX `cust_id` (`cust_id` ASC) VISIBLE,
  CONSTRAINT `cart_ibfk_1`
    FOREIGN KEY (`cust_id`)
    REFERENCES `afs`.`customers` (`cust_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `afs`.`cart_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `afs`.`cart_details` (
  `cd_id` INT NOT NULL,
  `cart_id` INT NULL DEFAULT NULL,
  `art_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`cd_id`),
  INDEX `cart_id` (`cart_id` ASC) VISIBLE,
  INDEX `art_id` (`art_id` ASC) VISIBLE,
  CONSTRAINT `cart_details_ibfk_1`
    FOREIGN KEY (`cart_id`)
    REFERENCES `afs`.`cart` (`cart_id`),
  CONSTRAINT `cart_details_ibfk_2`
    FOREIGN KEY (`art_id`)
    REFERENCES `afs`.`art` (`art_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `afs`.`ngo_fund`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `afs`.`ngo_fund` (
  `nf_id` INT NOT NULL,
  `ngo_id` INT NULL DEFAULT NULL,
  `art_id` INT NULL DEFAULT NULL,
  `amount` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`nf_id`),
  INDEX `ngo_id` (`ngo_id` ASC) VISIBLE,
  INDEX `art_id` (`art_id` ASC) VISIBLE,
  CONSTRAINT `ngo_fund_ibfk_1`
    FOREIGN KEY (`ngo_id`)
    REFERENCES `afs`.`ngo` (`ngo_id`),
  CONSTRAINT `ngo_fund_ibfk_2`
    FOREIGN KEY (`art_id`)
    REFERENCES `afs`.`art` (`art_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `afs`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `afs`.`orders` (
  `order_id` INT NOT NULL,
  `cart_id` INT NULL DEFAULT NULL,
  `amount` DECIMAL(10,2) NULL DEFAULT NULL,
  `date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `cart_id` (`cart_id` ASC) VISIBLE,
  CONSTRAINT `orders_ibfk_1`
    FOREIGN KEY (`cart_id`)
    REFERENCES `afs`.`cart` (`cart_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `afs`.`order_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `afs`.`order_details` (
  `od_id` INT NOT NULL,
  `order_id` INT NULL DEFAULT NULL,
  `art_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`od_id`),
  INDEX `order_id` (`order_id` ASC) VISIBLE,
  INDEX `art_id` (`art_id` ASC) VISIBLE,
  CONSTRAINT `order_details_ibfk_1`
    FOREIGN KEY (`order_id`)
    REFERENCES `afs`.`orders` (`order_id`),
  CONSTRAINT `order_details_ibfk_2`
    FOREIGN KEY (`art_id`)
    REFERENCES `afs`.`art` (`art_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
