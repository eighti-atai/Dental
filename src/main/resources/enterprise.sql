CREATE TABLE IF NOT EXISTS address_tab (
address_id INT(12) SIGNED AUTO_INCREMENT PRIMARY KEY,
street VARCHAR(100) NOT NULL,
city 	VARCHAR(100) NOT NULL,
country VARCHAR(100),
objid VARCHAR(1000) NOT NULL
);

CREATE TABLE IF NOT EXISTS `role_tab` (
  `role_id` BIGINT NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE (`role_name`));

CREATE TABLE IF NOT EXISTS `user_tab` (
  `user_id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `state` VARCHAR(30) NOT NULL,  
  PRIMARY KEY (`user_id`),
  UNIQUE (`user_name`));

CREATE TABLE IF NOT EXISTS `user_role_tab` (
  `user_id` BIGINT NOT NULL,
  `role_id` BIGINT NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`));
  
  CREATE TABLE IF NOT EXISTS customer_tab (
  customer_id VARCHAR(5) PRIMARY KEY,
  customer_name VARCHAR(100) NOT NULL,
  nic VARCHAR(15),
  address_id	INT(12),
  phone_no_1 VARCHAR(15),
  phone_no_2 VARCHAR(15),
  objid VARCHAR(1000) NOT NULL);