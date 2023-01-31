-- --------------------------------------------------------
-- Verkkotietokone:              127.0.0.1
-- Palvelinversio:               10.6.7-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Versio:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for car_rent
CREATE DATABASE IF NOT EXISTS `car_rent` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `car_rent`;

-- Dumping structure for taulu car_rent.order
CREATE TABLE IF NOT EXISTS `order` (
  `Order_id` int(11) NOT NULL AUTO_INCREMENT,
  `Personal_id` varchar(11) DEFAULT NULL,
  `First_name` varchar(45) DEFAULT NULL,
  `Last_name` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Phone_Number` varchar(13) DEFAULT NULL,
  `Home_address` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Postal_code` int(5) DEFAULT NULL,
  `Additional_info` text DEFAULT NULL,
  `Payment` varchar(50) DEFAULT NULL,
  `Vehicle_id` int(11) DEFAULT NULL,
  `Date_create` datetime DEFAULT NULL,
  `Order_start` datetime DEFAULT NULL,
  `Order_end` datetime DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Order_id`),
  KEY `fk_Order_Vehicle_id` (`Vehicle_id`),
  CONSTRAINT `fk_Order_Vehicle_id` FOREIGN KEY (`Vehicle_id`) REFERENCES `vehicle` (`Vehicle_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table car_rent.order: ~0 rows (suunnilleen)
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`Order_id`, `Personal_id`, `First_name`, `Last_name`, `Email`, `Phone_Number`, `Home_address`, `City`, `Postal_code`, `Additional_info`, `Payment`, `Vehicle_id`, `Date_create`, `Order_start`, `Order_end`, `Amount`) VALUES
	(12, '444444-333Y', 'Matti', 'Meikäläinen', 'example@gmail.com', '+35844412365', 'Urho Kekkosenkatu 10', 'Helsinki', 100, '', 'Tilisiirto', 1, '2022-04-07 18:53:00', '2022-05-07 21:00:00', '2022-05-08 21:00:00', 360.00);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

-- Dumping structure for taulu car_rent.vehicle
CREATE TABLE IF NOT EXISTS `vehicle` (
  `Vehicle_id` int(11) NOT NULL AUTO_INCREMENT,
  `Vehicle_type` int(11) NOT NULL COMMENT 'Type = for example: passenger car, minibus, jne',
  `Vehicle_model` varchar(45) NOT NULL,
  `Reg_number` varchar(7) NOT NULL,
  `Vehicle_descr` longtext DEFAULT NULL,
  `Vehicle_src` varchar(255) NOT NULL,
  `ordered` char(1) NOT NULL DEFAULT 'N',
  `Price` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`Vehicle_id`),
  KEY `fk_Vehicle_Vehicle_type` (`Vehicle_type`),
  CONSTRAINT `fk_Vehicle_Vehicle_type` FOREIGN KEY (`Vehicle_type`) REFERENCES `vehicle_type` (`Type_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table car_rent.vehicle: ~12 rows (suunnilleen)
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` (`Vehicle_id`, `Vehicle_type`, `Vehicle_model`, `Reg_number`, `Vehicle_descr`, `Vehicle_src`, `ordered`, `Price`) VALUES
	(1, 1, 'Ford focus RS', 'YHS-229', 'Urheilullisempi Ford Focus RS tarjoaa tehokkaan moottorin lisäksi erinomaisen ajotuntuman', 'focus_rs.jpg', '0', 15.00),
	(2, 2, 'Ford Transit', 'OAO-334', 'Ford Transit on täynnä edistyksellisiä teknologioita, jotka kaikki auttavat työskentelemään entistä tehokkaammin ja taloudellisemmin', 'ford-transit.jpg', '0', 20.00),
	(3, 1, 'Toyota Corolla', 'OHO-712', 'Käytännöllinen Toyota', 'toyota.jpg', 'N', 10.00),
	(4, 1, 'Fiat Punto', 'JOO-132', '...', 'fiat_punto.jpg', 'N', 5.00),
	(5, 1, 'Model5', 'VKL-442', '....', 'honda.jpg', 'N', 10.00),
	(6, 4, 'Fiat Carado', 'HEP-122', '....', 'fiat_carado.jpg', 'N', 50.00),
	(7, 1, 'Hyundai Getz', 'UEA-666', 'gotta getz em all', 'hyundai_getz.jpg', 'N', 10.00),
	(8, 1, 'Volkswagen Polo', 'APO-747', '....', 'volkswagen.jpg', 'N', 10.00),
	(9, 1, 'Kia Rio', 'ETH-978', '....', 'kia.jpg', 'N', 10.00),
	(10, 3, 'Wolkswagen Transporter', 'KEK-536', '....', 'volkswagen-transporter.jpg', 'N', 20.00),
	(11, 1, 'Honda Civic', 'ANU-299', '....', 'honda_civic.jpg', 'N', 10.00),
	(12, 1, 'Tesla model 3', 'TSL-500', '....', 'tesla.jpg', 'N', 20.00);
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;

-- Dumping structure for taulu car_rent.vehicle_type
CREATE TABLE IF NOT EXISTS `vehicle_type` (
  `Type_id` int(11) NOT NULL AUTO_INCREMENT,
  `Type_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table car_rent.vehicle_type: ~4 rows (suunnilleen)
/*!40000 ALTER TABLE `vehicle_type` DISABLE KEYS */;
INSERT INTO `vehicle_type` (`Type_id`, `Type_name`) VALUES
	(1, 'Henkilöauto'),
	(2, 'Pakettiauto'),
	(3, 'Minibussi'),
	(4, 'Karavaanari');
/*!40000 ALTER TABLE `vehicle_type` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
