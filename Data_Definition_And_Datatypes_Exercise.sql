CREATE SCHEMA `minions`;
USE `minions`;

CREATE TABLE `minions` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(200) NOT NULL,
    `age` INT 
);

CREATE TABLE `towns`(
	`town_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(30) NOT NULL
);

ALTER TABLE `minions`
ADD COLUMN `town_id` INT, 
ADD CONSTRAINT fk_minons_towns
FOREIGN KEY `minions`(`town_id`)
REFERENCES `towns`(`id`);


INSERT INTO `towns`
VALUES
(1, 'Sofia'),
(2, 'Plovdiv'),
(3, 'Varna');

INSERT INTO `minions`
VALUES
(1, 'Kevin', 22, 1),
(2, 'Bob', 15, 3),
(3, 'Steward', NULL, 2);

TRUNCATE `minions`;

DROP TABLE `minions`;
DROP TABLE `towns`;












CREATE TABLE `people`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(200) NOT NULL,
    `picture` BLOB,
    `height` FLOAT(5, 2),
    `weight` FLOAT(5, 2),
    `gender` CHAR(1) NOT NULL,
    `birthdate` DATE NOT NULL,
    `biography` TEXT
);

INSERT INTO `people` (`id`, `name`, `picture`, `height`, `weight`, `gender`, `birthdate`, `biography`)
VALUES
(1, 'asd', NULL, 175.69, 85.26, 'F', '2017-08-15', NULL);

INSERT INTO `people` (`id`, `name`, `picture`, `height`, `weight`, `gender`, `birthdate`, `biography`)
VALUES
(2, 'sdf', NULL, 174.69, 65.26, 'M', '2013-06-15', NULL);

INSERT INTO `people` (`id`, `name`, `picture`, `height`, `weight`, `gender`, `birthdate`, `biography`)
VALUES
(3, 'afsd', NULL, 75.69, 35.26, 'F', '2014-06-15', NULL);

INSERT INTO `people` (`id`, `name`, `picture`, `height`, `weight`, `gender`, `birthdate`, `biography`)
VALUES
(4, 'ajhsd', NULL, 275.69, 45.26, 'M', '2017-06-15', NULL);

INSERT INTO `people` (`id`, `name`, `picture`, `height`, `weight`, `gender`, `birthdate`, `biography`)
VALUES
(5, 'askud', NULL, 105.69, 15.26, 'F', '2007-06-15', NULL);












CREATE TABLE `users` (
`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL UNIQUE, 
`username` VARCHAR(30) NOT NULL UNIQUE,
`password` VARCHAR(26) NOT NULL,
`profile_picture` BLOB, 
`last_login_time` DATETIME,
`is_deleted` BOOLEAN);

INSERT INTO `users` (`username`, `password`, `profile_picture`, `last_login_time`, `is_deleted`) VALUES ('Ivan', 'asdf', NULL, NULL, NULL);
INSERT INTO `users` (`username`, `password`, `profile_picture`, `last_login_time`, `is_deleted`) VALUES ('Dragan', 'aefzsfsdf', NULL, NULL, NULL);
INSERT INTO `users` (`username`, `password`, `profile_picture`, `last_login_time`, `is_deleted`) VALUES ('Magdalena', 'aghyjhjsdf', NULL, NULL, NULL);
INSERT INTO `users` (`username`, `password`, `profile_picture`, `last_login_time`, `is_deleted`) VALUES ('Sasho', 'aergdbsdf', NULL, NULL, NULL);
INSERT INTO `users` (`username`, `password`, `profile_picture`, `last_login_time`, `is_deleted`) VALUES ('Kety', 'asghjgdf', NULL, NULL, NULL);

ALTER TABLE `users`
DROP PRIMARY KEY,
ADD CONSTRAINT pk_users
PRIMARY KEY (`id`, `username`);

ALTER TABLE `users`
CHANGE COLUMN `last_login_time` `last_login_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE `users`
DROP PRIMARY KEY,
ADD PRIMARY KEY (`id`),
ADD CONSTRAINT unique_username
UNIQUE (`username`);

















CREATE DATABASE `movies`;
USE `movies`;

CREATE TABLE `directors` (
	`id` INT UNSIGNED PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
	`director_name` VARCHAR(30) NOT NULL,
	`notes` TEXT
);

CREATE TABLE `genres` (
	`id` INT UNSIGNED PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
	`genre_name` VARCHAR(30) NOT NULL,
	`notes` TEXT
);

CREATE TABLE `categories` (
	`id` INT UNSIGNED PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
	`category_name` VARCHAR(30) NOT NULL,
	`notes` TEXT
);

CREATE TABLE `movies` (
	`id` INT UNSIGNED PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
	`title` VARCHAR(30) NOT NULL,
	`director_id` INT UNSIGNED NOT NULL,
	`copyright_year` YEAR NOT NULL,
	`length` TIME NOT NULL,
	`genre_id` INT UNSIGNED NOT NULL,
	`category_id` INT UNSIGNED NOT NULL,
	`rating` DOUBLE NOT NULL DEFAULT 0,
	`notes` TEXT
);

INSERT INTO `movies`
	(`id`, `title`, `director_id`, `copyright_year`, `length`, `genre_id`, `category_id`)
VALUES
	(11,"kamen",2,'2016',23,1,2),
	(10,"kamen",2,'2016',23,1,2),
	(13,"kamen",2,'2016',23,1,2),
	(14,"kamen",2,'2016',23,1,2),
	(15,"kamen",1,'2016',23,1,2);

INSERT INTO `directors`
	(`id`, `director_name`, `notes`)
VALUES
	(1,'dasdasd','fasdfasdfasdfa'),
	(2,'dasdasd','fasdfasdfasdfa'),
	(3,'dasdasd','fasdfasdfasdfa'),
	(4,'dasdasd','fasdfasdfasdfa'),
	(5,'dasdasd','fasdfasdfasdfa');

INSERT INTO `categories`
	(`id`, `category_name`)
VALUES
	(1,'wi-fi'),
	(2,'wi-fi'),
	(3,'wi-fi'),
	(4,'wi-fi'),
	(5,'wi-fi');

INSERT INTO `genres`
	( `id`, `genre_name`, `notes`)
VALUES
	(2,'dasdad','kaman'),
	(1,'dasdad','kaman'),
	(3,'dasdad','kaman'),
	(4,'dasdad','kaman'),
	(5,'dasdad','kaman');




















CREATE DATABASE `car_rental`;

USE `car_rental`;

CREATE TABLE `categories` (
`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
`category` VARCHAR(50),
`daily_rate` INT, 
`weekly_rate` INT,
`monthly_rate` INT,
`weekend_rate` INT);

INSERT INTO `categories` (`category`) VALUES ('sedan');
INSERT INTO `categories` (`category`) VALUES ('suv');
INSERT INTO `categories` (`category`) VALUES ('cabrio');

CREATE TABLE `cars` (
`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
`plate_number` VARCHAR(12) NOT NULL,
`make` VARCHAR(15) NOT NULL,
`model` VARCHAR(15) NOT NULL,
`car_year` DATE NOT NULL,
`category_id` INT,
`doors` INT,
`picture` BLOB,
`car_condition` VARCHAR(100),
`available` BOOLEAN NOT NULL);

INSERT INTO `cars` (`plate_number`, `make`, `model`, `car_year`, `available`)
VALUES ('CO222222', 'porsche', 'carerra', '2020-10-18', true);
INSERT INTO `cars` (`plate_number`, `make`, `model`, `car_year`, `available`)
VALUES ('CO8050AT', 'toyota', 'camry', '2020-03-11', true);
INSERT INTO `cars` (`plate_number`, `make`, `model`, `car_year`, `available`)
VALUES ('CB1111CB', 'alfa romeo', 'giulia', '2020-09-23', true); 

CREATE TABLE `employees` (
`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR(30) NOT NULL,
`last_name` VARCHAR(30) NOT NULL,
`title` VARCHAR(30),
`notes` TEXT);

INSERT INTO `employees` (`first_name`, `last_name`) VALUES ('george', 'dimitrov');
INSERT INTO `employees` (`first_name`, `last_name`) VALUES ('asen', 'asenov');
INSERT INTO `employees` (`first_name`, `last_name`) VALUES ('ivan', 'ivanov');

CREATE TABLE `customers` (
`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
`driver_licence` INT NOT NULL,
`full_name` VARCHAR(50) NOT NULL,
`address` VARCHAR(200) NOT NULL,
`city` VARCHAR(200) NOT NULL,
`zip_code` INT, 
`notes` TEXT);


INSERT INTO `customers` (`driver_licence`, `full_name`, `address`, `city`)
VALUES (111111 , 'peter dimitrov', 'krustova vada, ul 5', 'sofia');
INSERT INTO `customers` (`driver_licence`, `full_name`, `address`, `city`)
VALUES (111111 , 'dimitar georgiev', 'kapana, muha 155', 'plovdiv');
INSERT INTO `customers` (`driver_licence`, `full_name`, `address`, `city`)
VALUES (111111 , 'levis straus', 'somewhere, str street', 'london');

CREATE TABLE `rental_orders` (
`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
`employee_id` INT NOT NULL REFERENCES `employees` (`id`),
`customer_id` INT NOT NULL REFERENCES `customers` (`id`),
`car_id` INT NOT NULL REFERENCES `cars` (`id`),
`car_condition` VARCHAR(100),
`tank_level` FLOAT(3,2),
`kilometrage_start` INT NOT NULL,
`kilometrage_end` INT NOT NULL,
`total_kilometrage` INT,
`start_date` DATETIME,
`end_date` DATETIME,
`total_days` INT,
`rate_applied` INT,
`tax_rate` DECIMAL,
`order_status` VARCHAR(50),
`notes` TEXT); 

INSERT INTO `rental_orders` (`employee_id`, `customer_id`, `car_id`, `kilometrage_start`, `kilometrage_end`)
VALUES (1, 3, 2, 3333, 3399);
INSERT INTO `rental_orders` (`employee_id`, `customer_id`, `car_id`, `kilometrage_start`, `kilometrage_end`)
VALUES (13, 13, 23, 3333, 3399);
INSERT INTO `rental_orders` (`employee_id`, `customer_id`, `car_id`, `kilometrage_start`, `kilometrage_end`)
VALUES (15, 83, 72, 333443, 339469);













CREATE DATABASE `soft_uni`;
Use `soft_uni`;

CREATE TABLE `towns`(
`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL
);

CREATE TABLE `addresses`(
`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
`address_text` VARCHAR(45),
`town_id`INT,
CONSTRAINT fk_addresses_towns
FOREIGN KEY (`town_id`)
REFERENCES `towns` (`id`)
);

CREATE TABLE `departments`(
`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL
);


CREATE TABLE `employees`(
`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
`first_name` VARCHAR(45) NOT NULL,
`middle_name` VARCHAR(45) NOT NULL,
`last_name` VARCHAR(45) NOT NULL,
`job_title` VARCHAR(45) NOT NULL,
`department_id` INT NOT NULL ,
`hire_date` DATE NOT NULL,
`salary` DECIMAL(19,2) NOT NULL,
`address_id` INT,
CONSTRAINT fk_employees_departments
foreign key (`department_id`)
references `departments`(`id`),
CONSTRAINT fk_employees_addresses
foreign key (`address_id`)
references `addresses`(`id`)
);

INSERT INTO  `towns`
values 
(1, 'Sofia'),
(2, 'Plovdiv'),
(3, 'Varna'),
(4, 'Burgas');

INSERT INTO  `departments`
values 
(1, 'Engineering'),
(2, 'Sales'),
(3, 'Marketing'),
(4, 'Software Development'),
(5, 'Quality Assurance');

INSERT INTO `employees`(`id`, `first_name`, `middle_name`, `last_name`, `job_title`
, `department_id`, `hire_date`, `salary`)
values
(1, 'Ivan','Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01',3500.00),
(2, 'Petar','Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02',4000.00),
(3, 'Maria ','Petrova', 'Ivanova', 'Intern', 5, '2016-08-28',525.25),
(4, 'Georgi','Terziev', 'Ivanov', 'CEO', 2, '2007-12-09',3000.00),
(5, 'Peter','Pan', 'Pan', 'Intern', 3, '2016-08-28',599.88);

SELECT * FROM `towns`;
SELECT * FROM `departments`;
SELECT * FROM `employees`;

SELECT * FROM `towns`
order by `name`;
SELECT * FROM `departments`
order by `name`;
SELECT * FROM `employees`
order by `salary` desc;


SELECT `name` FROM `towns`
ORDER BY `name`;
SELECT `name` FROM `departments`
ORDER BY `name`;
SELECT `first_name`, `last_name`, `job_title`, `salary` FROM`employees`
ORDER BY salary DESC;


UPDATE `employees` 
SET 
	`salary` = `salary` * 1.1;

SELECT `salary` FROM `employees`;



TRUNCATE TABLE `occupancies`;