-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mar 25 Avril 2017 à 17:09
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gta5_gamemode_essential`
--
CREATE DATABASE IF NOT EXISTS `gta5_gamemode_essential` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gta5_gamemode_essential`;

-- --------------------------------------------------------

--
-- Structure de la table `interiors`
--
CREATE TABLE IF NOT EXISTS `interiors` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'key id',
  `enter` text NOT NULL COMMENT 'enter coords',
  `exit` text NOT NULL COMMENT 'destination coords',
  `iname` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `interiors`
--
INSERT INTO `interiors` (`id`, `enter`, `exit`, `iname`) VALUES
(1, '{-772.954,312.134,85.6981,130}', '{-781.833,326.111,176.804,240}', 'Appartement'),
(2, '{-428.778,1111.61,327.689,130}', '{136.172,-761.371,242.152,260}', 'Gouvernement');


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;