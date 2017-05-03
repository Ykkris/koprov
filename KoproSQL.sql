-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server versie:                10.1.21-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Versie:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Databasestructuur van gta5_gamemode_essential wordt geschreven
CREATE DATABASE IF NOT EXISTS `gta5_gamemode_essential` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gta5_gamemode_essential`;


-- Structuur van  tabel gta5_gamemode_essential.bans wordt geschreven
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `banned` varchar(50) NOT NULL DEFAULT '0',
  `banner` varchar(50) NOT NULL,
  `reason` varchar(150) NOT NULL DEFAULT '0',
  `expires` datetime NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd


-- Structuur van  tabel gta5_gamemode_essential.users wordt geschreven
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `group` varchar(50) NOT NULL DEFAULT '0',
  `permission_level` int(11) NOT NULL DEFAULT '0',
  `skin` longtext,
  `money` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `users`
  ADD PRIMARY KEY (`identifier`);

ALTER TABLE users ADD COLUMN bankbalance INT(32) DEFAULT 0;




-- Structure pour le garage et vehshop
CREATE TABLE `user_vehicle` (
  `ID` int(10) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `vehicle_name` varchar(60) DEFAULT NULL,
  `vehicle_model` varchar(60) DEFAULT NULL,
  `vehicle_plate` varchar(60) DEFAULT NULL,
  `vehicle_state` varchar(60) DEFAULT NULL,
  `vehicle_colorsecondary` varchar(60) DEFAULT NULL,
  `vehicle_colorprimary` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `user_vehicle`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `user_vehicle`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;



  -- Structure du weapon shop
  CREATE TABLE IF NOT EXISTS `user_weapons` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `weapon_model` varchar(60) NOT NULL,
  `withdraw_cost` int(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;




# Affichage de la table items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Affichage de la table user_inventory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_inventory`;

CREATE TABLE `user_inventory` (
  `user_id` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `item_id` int(11) unsigned NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `user_inventory_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



ALTER TABLE `users` ADD `job` int(11) DEFAULT '1';

CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL,
  `job_name` varchar(40) NOT NULL,
  `salary` int(11) NOT NULL DEFAULT '500'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `jobs`
  ADD PRIMARY KEY (`job_id`);

ALTER TABLE `jobs` MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT;


-- Data exporteren was gedeselecteerd
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;