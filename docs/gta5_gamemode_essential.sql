-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mar 30 Mai 2017 à 17:35
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

-- --------------------------------------------------------

--
-- Structure de la table `bans`
--

CREATE TABLE `bans` (
  `id` int(10) UNSIGNED NOT NULL,
  `banned` varchar(50) NOT NULL DEFAULT '0',
  `banner` varchar(50) NOT NULL,
  `reason` varchar(150) NOT NULL DEFAULT '0',
  `expires` datetime NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `coordinates`
--

CREATE TABLE `coordinates` (
  `id` int(11) UNSIGNED NOT NULL,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL,
  `z` double DEFAULT NULL,
  `Commentaire` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `coordinates`
--

INSERT INTO `coordinates` (`id`, `x`, `y`, `z`, `Commentaire`) VALUES
(1, -499.389, 5569.231, 71.233, 'Récolte bûcheron'),
(2, -549.633, 5359.31, 72.17, 'Traitement bûcheron'),
(3, 2703.205, 3456.562, 55.58, 'Vente bûcheron'),
(4, 1526.682, -2067.93, 77.274, 'Récolte mineur'),
(5, 2885.417, 4387.268, 50.735, 'Traitement mineur'),
(6, 2790.636, 1711.745, 24.613, 'Vente mineur'),
(7, 2126.68, 5013.56, 40.42, 'Easter egg bêta event'),
(8, -86.886329650879, 6229.0234375, 31.089, 'Easter egg bêta event'),
(9, -584.66271972656, -897.07525634766, 25.9431, 'Easter egg bêta event'),
(10, -1827.58, 2624.977, 2.817, 'Récolte Coca 1'),
(11, 1388.827, 3606.078, 38.941, 'Traitement Coca 1'),
(12, -2166.15, 5197.72, 16.88, 'Vente Coca 1'),
(13, 883.7756, 4178.208, 36.871, 'Récolte cannabis 1'),
(14, 1443.031, 6332.649, 23.98, 'Traitement canabis 1'),
(15, -1644.12, -1023.02, 5.92, 'Vente canabis 1'),
(16, -660.752, 1764.591, 201.268, 'Récolte ecstasy 1'),
(17, -1530.118, 837.406, 181.594, 'Traitement ecstasy 1'),
(18, -2637.629, 1870.471, 160.1345, 'Vente ecstasy 1'),
(19, -290.047, 2841.011, 55.082, 'Récolte de cadavre 1'),
(20, 663.011, 1282.631, 360.295, 'Traitement de cadavre 1'),
(21, 424.175, 6471.44, 35.873, 'Vente de cadavre 1'),
(22, -628.6624, -4535.9184, 5.77976, 'Récolte pêche'),
(23, 121.1801, -3103.7897, 6.009, 'Traitement pêche'),
(24, -458.1738, -2265.8498, 8.5158, 'Vente poisson'),
(25, 1537.10314, -2075.0009, 77.217, 'Récolte mineur'),
(26, 2792.23779, 1710.5305, 24.628156, 'Traitement mineur'),
(27, 2885.8059, 4386.5258, 50.7359, 'Vente mineur'),
(28, -2722.46, 1193.47, 105.397, 'Recolte Cannabis 2'),
(29, 1639.38, 4879.49, 42.1407, 'Traitement Cannabis 2'),
(30, 268.879, -1985.21, 20.8027, 'Vente Cannabis 2'),
(31, -282.418, 2217.632, 130.486, 'Recolte Cocaine 2'),
(32, 2433.32, 4968.59, 42.3476, 'Traitement Cocaine 2'),
(33, 1027.91, 134.35, 89.4905, 'Vente Cocaine 2'),
(34, -1442.41, 5421.01, 23.06, 'Recolte ecstasy 2'),
(35, 3818.08, 4475.37, 2.2, 'Traitement ecstasy 2'),
(36, -1200.9, -1793.58, 3.908, 'Vente ecstasy 2'),
(37, -1272.77, -1775.69, 48.4931, 'Recolte cadavre 2'),
(38, 1599.88, 3588.35, 38.76, 'Traitement cadavre 2'),
(39, 306.237, -561.22, 43.316, 'Recolte cadavre 2');

-- --------------------------------------------------------

--
-- Structure de la table `ems`
--

CREATE TABLE `ems` (
  `identifier` varchar(255) NOT NULL,
  `rank` varchar(255) NOT NULL DEFAULT 'Recrue'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ems`
--

INSERT INTO `ems` (`identifier`, `rank`) VALUES
('steam:1100001012fa921', 'Recrue'),
('steam:11000010599af76', 'Recrue');

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

CREATE TABLE `items` (
  `id` int(11) UNSIGNED NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `limitation` int(11) NOT NULL,
  `illegal` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `items`
--

INSERT INTO `items` (`id`, `libelle`, `value`, `type`, `limitation`, `illegal`) VALUES
(1, 'Rondin de bois', 0, 0, 30, 0),
(2, 'Planche de bois', 0, 0, 30, 0),
(3, 'Pétrole', 0, 0, 30, 0),
(4, 'Essence', 0, 0, 30, 0),
(5, 'Feuille Coca', 0, 0, 15, 1),
(6, 'Cocaïne pure', 0, 0, 15, 1),
(7, 'Feuille Cannabis', 0, 0, 15, 1),
(8, 'Cannabis', 0, 0, 15, 1),
(10, 'Poulet', 0, 0, 30, 0),
(11, 'Cuisse de poulet', 0, 0, 30, 0),
(12, 'Safrole', 0, 0, 15, 1),
(13, 'MDMA', 0, 0, 15, 1),
(14, 'Cadavre', 0, 0, 15, 1),
(15, 'Poudre d\'os', 0, 0, 15, 1),
(16, 'Poisson', 0, 0, 30, 0),
(17, 'Soupe poisson', 23, 2, 30, 0),
(18, 'Pétrole', 0, 0, 30, 0),
(19, 'Essence', 0, 0, 30, 0),
(20, 'Bouteille d\'eau', 25, 1, 20, 0),
(21, 'Sandwich', 18, 2, 10, 0),
(22, 'Tacos', 20, 2, 10, 0),
(23, 'Poutine', 25, 2, 10, 0);

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL,
  `job_name` varchar(40) NOT NULL,
  `salary` int(11) NOT NULL DEFAULT '500'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `jobs`
--

INSERT INTO `jobs` (`job_id`, `job_name`, `salary`) VALUES
(1, 'Civil', 0),
(2, 'Police', 150),
(3, 'Médecin', 150),
(4, 'Dépanneur', 125),
(5, 'Mineur', 0),
(6, 'Illegal', 0),
(7, 'Bûcheron', 0),
(8, 'Pêcheur', 0),
(9, 'Taxis', 100),
(10, 'Fermier', 0),
(11, 'Journaliste', 100);

-- --------------------------------------------------------

--
-- Structure de la table `medic`
--

CREATE TABLE `medic` (
  `identifier` varchar(255) NOT NULL,
  `rank` varchar(255) NOT NULL DEFAULT 'Recrue'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `medic`
--

INSERT INTO `medic` (`identifier`, `rank`) VALUES
('steam:110000101f91cd2', 'Recrue');

-- --------------------------------------------------------

--
-- Structure de la table `modelmenu`
--

CREATE TABLE `modelmenu` (
  `identifier` varchar(50) NOT NULL,
  `model` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT 'a_m_m_acult_01',
  `percing` int(11) NOT NULL DEFAULT '1',
  `percing_txt` int(11) NOT NULL DEFAULT '1',
  `glasses` int(11) NOT NULL DEFAULT '1',
  `glasses_txt` int(11) NOT NULL DEFAULT '1',
  `helmet` int(11) NOT NULL DEFAULT '1',
  `helmet_txt` int(11) NOT NULL DEFAULT '1',
  `mask` int(11) NOT NULL DEFAULT '0',
  `mask_txt` int(11) NOT NULL DEFAULT '0',
  `head` int(11) NOT NULL DEFAULT '0',
  `hair` int(11) NOT NULL DEFAULT '0',
  `hair_colour` int(11) NOT NULL DEFAULT '0',
  `shirt` int(11) NOT NULL DEFAULT '0',
  `shirt_txt` int(11) NOT NULL DEFAULT '0',
  `hand` int(11) NOT NULL DEFAULT '0',
  `shoe` int(11) NOT NULL DEFAULT '0',
  `shoe_txt` int(11) NOT NULL DEFAULT '0',
  `pants` int(11) NOT NULL DEFAULT '0',
  `pants_txt` int(11) NOT NULL DEFAULT '0',
  `undershirt` int(11) NOT NULL DEFAULT '0',
  `undershirt_txt` int(11) NOT NULL DEFAULT '0',
  `armour` int(11) NOT NULL DEFAULT '0',
  `armour_txt` int(11) NOT NULL DEFAULT '0',
  `mpmodel` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `modelmenu`
--

INSERT INTO `modelmenu` (`identifier`, `model`, `percing`, `percing_txt`, `glasses`, `glasses_txt`, `helmet`, `helmet_txt`, `mask`, `mask_txt`, `head`, `hair`, `hair_colour`, `shirt`, `shirt_txt`, `hand`, `shoe`, `shoe_txt`, `pants`, `pants_txt`, `undershirt`, `undershirt_txt`, `armour`, `armour_txt`, `mpmodel`) VALUES
('steam:1100001000cf976', 'mp_m_freemode_01', 1, 1, 240, 1, 1, 1, 0, 0, 43, 2, 4, 1, 4, 0, 4, 1, 1, 5, 0, 240, 0, 0, 1),
('steam:110000100363fb6', 'mp_m_freemode_01', 3, 1, 15, 2, 5, 0, 0, 0, 43, 0, 19, 86, 0, 17, 12, 6, 9, 12, 11, 10, 0, 0, 1),
('steam:1100001005a39f0', 'mp_m_freemode_01', 240, 1, 240, 1, 1, 1, 0, 0, 44, 10, 0, 77, 1, 2, 24, 0, 10, 0, 3, 0, 0, 0, 1),
('steam:11000010079d096', 'mp_m_freemode_01', 0, 0, 23, 2, 12, 0, 0, 0, 43, 4, 0, 6, 8, 1, 4, 1, 1, 0, 4, 0, 0, 0, 1),
('steam:110000100ce9487', 'mp_m_freemode_01', 240, 0, 5, 5, 240, 0, 0, 0, 4, 13, 0, 4, 0, 1, 10, 0, 7, 0, 1, 0, 0, 0, 1),
('steam:110000100e840de', 'mp_m_freemode_01', 30, 0, 4, 0, 21, 0, 0, 0, 17, 18, 1, 0, 3, 0, 12, 12, 1, 0, 0, 0, 0, 0, 1),
('steam:1100001010bf4c6', 'mp_m_freemode_01', 240, 1, 240, 1, 4, 1, 0, 0, 14, 14, 2, 75, 2, 1, 1, 2, 27, 3, 0, 240, 0, 0, 1),
('steam:1100001012fa921', 'mp_m_freemode_01', 1, 1, 0, 1, 240, 2, 0, 0, 44, 4, 3, 4, 3, 1, 32, 3, 4, 2, 1, 5, 0, 0, 1),
('steam:1100001017c21ee', 'mp_m_freemode_01', 240, 1, 240, 1, 14, 1, 0, 0, 2, 19, 2, 86, 3, 2, 32, 0, 5, 4, 0, 240, 0, 0, 1),
('steam:110000101889e5e', 'mp_m_freemode_01', 240, 1, 240, 1, 240, 1, 0, 0, 0, 7, 26, 72, 2, 14, 10, 0, 1, 1, 1, 16, 0, 0, 1),
('steam:1100001019b2b4d', 'mp_m_freemode_01', 6, 1, 15, 6, 1, 1, 0, 0, 0, 19, 1, 9, 11, 0, 1, 1, 0, 14, 0, 240, 0, 1, 1),
('steam:110000101ab9a22', 'mp_m_freemode_01', 1, 1, 2, 9, 240, 0, 0, 2, 12, 4, 1, 7, 4, 1, 1, 2, 4, 0, 1, 0, 0, 0, 1),
('steam:110000101d96ca9', 'mp_m_freemode_01', 240, 1, 240, 1, 21, 1, 0, 0, 43, 12, 26, 9, 2, 0, 12, 12, 0, 11, 0, 240, 0, 4, 1),
('steam:110000101f91cd2', 'mp_m_freemode_01', 240, 1, 5, 3, 240, 0, 0, 0, 0, 2, 56, 0, 3, 0, 5, 0, 16, 3, 0, 240, 0, 0, 1),
('steam:1100001024f707e', 'a_m_m_acult_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:11000010274c3bf', 'a_m_m_acult_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:110000102946cda', 'mp_m_freemode_01', 240, 1, 240, 9, 7, 0, 0, 0, 42, 5, 5, 42, 0, 11, 1, 4, 24, 5, 0, 240, 0, 0, 1),
('steam:110000102c35113', 'mp_m_freemode_01', 1, 1, 5, 6, 240, 0, 0, 0, 44, 18, 2, 0, 2, 19, 10, 0, 25, 0, 0, 240, 0, 0, 1),
('steam:110000102d1440e', 'mp_m_freemode_01', 1, 1, 8, 3, 0, 7, 0, 0, 0, 11, 4, 50, 0, 1, 15, 0, 4, 4, 0, 240, 0, 0, 1),
('steam:110000102f38cb7', 'mp_m_freemode_01', 1, 1, 8, 2, 3, 2, 0, 0, 1, 0, 0, 13, 13, 0, 14, 4, 0, 0, 0, 240, 0, 0, 1),
('steam:110000103377b34', 'mp_m_freemode_01', 240, 0, 240, 0, 240, 0, 0, 0, 44, 10, 4, 4, 3, 1, 20, 7, 22, 12, 4, 0, 0, 0, 1),
('steam:11000010337f491', 'mp_f_freemode_01', 3, 0, 240, 0, 240, 0, 0, 0, 21, 17, 19, 26, 1, 12, 0, 0, 9, 8, 0, 240, 0, 0, 1),
('steam:1100001034ab108', 'mp_m_freemode_01', 240, 0, 5, 4, 240, 0, 0, 0, 0, 10, 18, 4, 11, 4, 10, 0, 10, 2, 3, 2, 0, 0, 1),
('steam:110000103536d2e', 'mp_m_freemode_01', 1, 1, 5, 3, 1, 1, 0, 0, 12, 2, 2, 7, 4, 0, 4, 1, 0, 2, 1, 1, 0, 0, 1),
('steam:1100001038318d9', 'mp_m_freemode_01', 240, 1, 17, 7, 240, 2, 0, 0, 44, 0, 0, 63, 0, 30, 12, 6, 25, 0, 0, 240, 0, 0, 1),
('steam:1100001038b0f11', 'mp_m_freemode_01', 1, 1, 1, 1, 1, 1, 0, 0, 44, 7, 4, 0, 2, 0, 10, 0, 7, 0, 0, 0, 0, 0, 1),
('steam:110000103aedfe6', 'mp_m_freemode_01', 2, 1, 5, 1, 240, 7, 0, 0, 0, 10, 55, 13, 5, 11, 10, 0, 22, 0, 0, 240, 0, 0, 1),
('steam:110000103af647a', 'mp_m_freemode_01', 240, 1, 18, 3, 240, 1, 0, 0, 42, 12, 0, 12, 5, 1, 1, 2, 3, 2, 0, 240, 0, 0, 1),
('steam:1100001040a7e16', 'mp_m_freemode_01', 1, 1, 2, 0, 1, 1, 0, 0, 12, 2, 1, 7, 15, 0, 3, 1, 0, 1, 1, 6, 0, 1, 1),
('steam:1100001040f4769', 'mp_m_freemode_01', 1, 1, 5, 5, 1, 1, 0, 0, 12, 7, 0, 4, 14, 4, 32, 8, 4, 2, 32, 2, 0, 0, 1),
('steam:1100001041c6ab2', 'mp_m_freemode_01', 1, 1, 1, 1, 240, 0, 0, 0, 0, 2, 10, 69, 0, 0, 26, 0, 7, 0, 2, 1, 0, 0, 1),
('steam:110000104321495', 'mp_f_freemode_01', 15, 0, 4, 9, 240, 14, 0, 0, 40, 14, 35, 16, 1, 4, 11, 1, 25, 3, 10, 1, 0, 0, 1),
('steam:1100001043822ec', 'a_m_m_acult_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:110000104a3560f', 'mp_m_freemode_01', 1, 1, 1, 1, 1, 1, 0, 0, 44, 15, 1, 4, 0, 1, 21, 0, 24, 6, 4, 0, 0, 0, 1),
('steam:110000104abd684', 'mp_m_freemode_01', 240, 1, 4, 1, 1, 1, 0, 1, 0, 2, 2, 12, 11, 1, 4, 2, 0, 2, 0, 240, 0, 0, 1),
('steam:110000104bc9698', 'mp_m_freemode_01', 6, 1, 2, 0, 1, 1, 0, 0, 0, 4, 2, 4, 2, 1, 4, 2, 4, 4, 1, 4, 0, 0, 1),
('steam:110000104bd6595', 'mp_m_freemode_01', 30, 1, 5, 5, 240, 2, 0, 0, 44, 5, 2, 4, 0, 4, 3, 15, 10, 0, 11, 14, 0, 3, 1),
('steam:110000104d3327b', 'mp_m_freemode_01', 5, 1, 5, 6, 240, 1, 0, 0, 44, 3, 11, 9, 3, 0, 32, 4, 4, 1, 0, 240, 0, 0, 1),
('steam:110000104ea5d91', 'a_m_m_acult_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:110000105195a9a', 'mp_m_freemode_01', 1, 1, 5, 3, 4, 0, 0, 0, 0, 4, 4, 70, 2, 6, 0, 10, 4, 2, 1, 1, 0, 0, 1),
('steam:1100001051e8060', 'mp_m_freemode_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:11000010533a4e9', 'mp_m_freemode_01', 1, 1, 5, 2, 6, 1, 0, 0, 44, 2, 60, 13, 2, 11, 12, 3, 9, 13, 0, 240, 1, 4, 1),
('steam:1100001054cda0a', 'mp_m_freemode_01', 0, 1, 23, 9, 6, 1, 0, 3, 44, 5, 2, 61, 1, 17, 12, 6, 9, 13, 2, 20, 0, 4, 1),
('steam:1100001055a69e5', 'mp_m_freemode_01', 240, 1, 5, 7, 1, 1, 0, 0, 43, 19, 59, 6, 11, 0, 10, 12, 0, 1, 10, 7, 0, 0, 1),
('steam:110000105622120', 'mp_m_freemode_01', 240, 1, 240, 10, 240, 14, 0, 0, 0, 9, 3, 6, 9, 1, 32, 1, 0, 8, 2, 2, 0, 0, 1),
('steam:1100001058e2e0b', 'mp_m_freemode_01', 1, 1, 0, 0, 7, 0, 0, 0, 0, 3, 4, 89, 2, 5, 1, 1, 4, 0, 0, 240, 0, 0, 1),
('steam:11000010599af76', 'mp_m_freemode_01', 240, 1, 5, 1, 240, 1, 0, 0, 44, 5, 0, 31, 1, 4, 15, 0, 10, 0, 31, 2, 0, 0, 1),
('steam:110000105aef513', 'mp_m_freemode_01', 240, 1, 5, 1, 1, 1, 0, 0, 44, 4, 26, 0, 2, 0, 32, 1, 4, 0, 0, 0, 0, 0, 1),
('steam:1100001064d8856', 'mp_m_freemode_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:110000106670ad3', 'a_m_m_acult_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:1100001069d5bca', 'mp_m_freemode_01', 1, 1, 5, 1, 240, 1, 0, 0, 44, 21, 3, 41, 0, 17, 12, 0, 1, 0, 0, 240, 0, 0, 1),
('steam:1100001070759de', 'mp_m_freemode_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:110000107102b2c', 'mp_m_freemode_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 2, 1, 0, 3, 0, 3, 1, 2, 11, 0, 0, 0, 0, 1),
('steam:1100001071dd617', 'mp_m_freemode_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:110000107acb0e8', 'mp_m_freemode_01', 240, 1, 8, 3, 240, 1, 0, 0, 0, 5, 0, 0, 2, 30, 12, 6, 1, 11, 0, 240, 0, 0, 1),
('steam:110000107c76c74', 'mp_m_freemode_01', 1, 1, 1, 1, 1, 1, 0, 0, 12, 11, 3, 14, 4, 47, 5, 3, 7, 5, 0, 240, 0, 0, 1),
('steam:110000107f3f84f', 'mp_m_freemode_01', 240, 1, 240, 0, 7, 2, 0, 0, 0, 3, 7, 0, 2, 0, 1, 14, 1, 15, 0, 240, 0, 0, 1),
('steam:11000010882162b', 'mp_m_freemode_01', 1, 1, 1, 1, 1, 1, 0, 0, 12, 4, 4, 1, 5, 0, 1, 2, 1, 1, 0, 240, 0, 0, 1),
('steam:110000108829369', 'mp_m_freemode_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:1100001090a54b5', 'a_m_m_acult_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:110000109653e8f', 'mp_m_freemode_01', 0, 1, 5, 0, 240, 1, 0, 6, 0, 19, 1, 89, 1, 0, 4, 1, 4, 4, 0, 240, 0, 0, 1),
('steam:110000109bd1bf7', 'a_m_m_acult_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:110000109cfe4a6', 'mp_m_freemode_01', 13, 1, 5, 2, 5, 1, 0, 0, 0, 2, 56, 0, 1, 0, 1, 6, 7, 3, 1, 20, 0, 0, 1),
('steam:11000010a303bad', 'mp_f_freemode_01', 2, 1, 240, 1, 240, 1, 0, 0, 21, 4, 3, 2, 6, 2, 0, 0, 4, 8, 0, 240, 0, 0, 1),
('steam:11000010a3f5a39', 'mp_m_freemode_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:11000010a6e50ac', 'mp_m_freemode_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:11000010aef5214', 'a_m_m_acult_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:11000010af59496', 'mp_m_freemode_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:11000010c174612', 'mp_m_freemode_01', 240, 1, 2, 0, 240, 1, 0, 0, 44, 21, 1, 57, 0, 30, 12, 14, 0, 4, 0, 240, 0, 4, 1),
('steam:11000010c30f1f7', 'mp_m_freemode_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:11000010c393f8b', 'mp_m_freemode_01', 240, 1, 240, 1, 240, 1, 0, 0, 5, 14, 2, 3, 2, 0, 21, 9, 1, 2, 1, 0, 0, 0, 1),
('steam:11000010c3bb676', 'mp_m_freemode_01', 0, 1, 17, 7, 1, 1, 0, 0, 0, 19, 41, 23, 2, 19, 10, 0, 22, 4, 3, 1, 0, 0, 1),
('steam:11000010c9565b1', 'mp_m_freemode_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:11000010cc1ff1f', 'mp_m_freemode_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:11000010d60238d', 'mp_m_freemode_01', 1, 1, 5, 0, 0, 0, 0, 0, 0, 2, 3, 23, 2, 1, 9, 9, 28, 6, 3, 2, 0, 0, 1),
('steam:11000010dd9e196', 'a_m_m_acult_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:11000010e1c4381', 'mp_m_freemode_01', 1, 1, 2, 3, 240, 0, 0, 0, 44, 7, 1, 0, 2, 0, 4, 1, 0, 6, 0, 0, 0, 0, 1),
('steam:11000010e343011', 'mp_m_freemode_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 2, 4, 76, 2, 1, 30, 1, 0, 0, 3, 2, 0, 0, 1),
('steam:11000010e694487', 'mp_m_freemode_01', 1, 1, 19, 0, 1, 1, 0, 0, 2, 14, 3, 4, 3, 1, 1, 1, 4, 2, 10, 3, 0, 4, 1),
('steam:11000010ee3a2e3', 'mp_m_freemode_01', 1, 1, 5, 0, 6, 0, 0, 0, 44, 11, 8, 0, 1, 0, 12, 6, 1, 9, 0, 1, 0, 0, 1),
('steam:11000010f5a70d1', 'a_m_m_acult_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:1100001101eade8', 'mp_m_freemode_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:1100001114924f4', 'mp_m_freemode_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:1100001117acabf', 'mp_m_freemode_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:1100001119c47c3', 'mp_m_freemode_01', 3, 1, 0, 5, 240, 2, 0, 0, 4, 7, 0, 61, 3, 1, 25, 0, 31, 0, 0, 240, 0, 3, 1),
('steam:110000112dbbe61', 'mp_m_freemode_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:11000011385b84b', 'a_m_m_acult_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:1100001145a7a54', 'mp_m_freemode_01', 1, 1, 7, 2, 3, 2, 0, 0, 13, 1, 1, 7, 1, 0, 3, 2, 4, 2, 0, 3, 0, 0, 1),
('steam:1100001154e70ff', 'mp_f_freemode_01', 14, 0, 240, 0, 240, 0, 0, 0, 23, 16, 55, 16, 0, 4, 15, 10, 30, 3, 2, 1, 0, 0, 1),
('steam:1100001158fbb8b', 'a_m_m_acult_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:110000115a5c87b', 'mp_m_freemode_01', 0, 0, 19, 1, 7, 2, 0, 0, 4, 9, 1, 61, 3, 1, 12, 4, 9, 1, 0, 240, 0, 0, 1),
('steam:1100001191030d2', 'mp_m_freemode_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:110000119400318', 'a_m_m_acult_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:1100001195a047c', 'mp_m_freemode_01', 240, 1, 5, 0, 1, 1, 0, 0, 44, 12, 9, 61, 3, 0, 2, 13, 0, 3, 1, 18, 0, 0, 1),
('steam:1100001195c2496', 'mp_m_freemode_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('steam:110000119b06fc7', 'mp_m_freemode_01', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `police`
--

CREATE TABLE `police` (
  `identifier` varchar(255) NOT NULL,
  `rank` varchar(255) NOT NULL DEFAULT 'Recrue'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `police`
--

INSERT INTO `police` (`identifier`, `rank`) VALUES
('steam:1100001005a39f0', 'Recrue'),
('steam:110000101f91cd2', 'Recrue'),
('steam:110000103536d2e', 'Recrue'),
('steam:1100001038318d9', 'Recrue'),
('steam:1100001041c6ab2', 'Recrue'),
('steam:1100001055a69e5', 'Recrue'),
('steam:110000105aef513', 'Recrue'),
('steam:110000107102b2c', 'Recrue'),
('steam:110000107acb0e8', 'Recrue'),
('steam:11000010c3bb676', 'Recrue');

-- --------------------------------------------------------

--
-- Structure de la table `recolt`
--

CREATE TABLE `recolt` (
  `ID` int(11) UNSIGNED NOT NULL,
  `raw_id` int(11) UNSIGNED DEFAULT NULL,
  `treated_id` int(11) UNSIGNED DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `treatment_id` int(10) UNSIGNED DEFAULT NULL,
  `seller_id` int(10) UNSIGNED DEFAULT NULL,
  `Commentaire` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `recolt`
--

INSERT INTO `recolt` (`ID`, `raw_id`, `treated_id`, `job_id`, `price`, `field_id`, `treatment_id`, `seller_id`, `Commentaire`) VALUES
(1, 1, 2, 7, 10, 1, 2, 3, 'Récolte bûcheron'),
(2, 5, 6, 6, 180, 10, 32, 33, 'Vente Coca 1'),
(3, 10, 11, 10, 10, 7, 8, 9, 'Fermier poulet'),
(4, 7, 8, 6, 90, 28, 29, 30, 'Vente Cannabis 1'),
(5, 12, 13, 6, 140, 34, 35, 36, 'Vente ecstasy 1'),
(6, 14, 15, 6, 210, 37, 38, 39, 'Vente de cadavres 1'),
(7, 16, 17, 8, 16, 22, 23, 24, 'Vente poisson'),
(8, 18, 19, 5, 10, 25, 26, 27, 'Vente mineur');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `ID` int(32) NOT NULL,
  `identifier` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `player_state` int(255) NOT NULL DEFAULT '0',
  `first_name` varchar(50) NOT NULL DEFAULT 'John',
  `last_name` varchar(50) NOT NULL DEFAULT 'Doe',
  `age` varchar(50) NOT NULL DEFAULT '0',
  `matricule` varchar(50) NOT NULL DEFAULT '',
  `gender` varchar(50) NOT NULL DEFAULT '',
  `group` varchar(50) NOT NULL DEFAULT '0',
  `permission_level` int(11) NOT NULL DEFAULT '0',
  `money` double NOT NULL DEFAULT '0',
  `bankbalance` int(32) DEFAULT '0',
  `lastpos` varchar(255) DEFAULT '{-1037.74133, -2738.0571,  20.16929, 142.503463745117}',
  `job` int(11) DEFAULT '1',
  `dirty_money` double NOT NULL DEFAULT '0',
  `dirty_time` varchar(32) NOT NULL DEFAULT '0',
  `dirty_wait_money` int(32) NOT NULL DEFAULT '0',
  `intervention` int(11) NOT NULL DEFAULT '0',
  `enService` tinyint(1) NOT NULL DEFAULT '0',
  `phone_number` text,
  `contacts` text,
  `sms` text,
  `batterie` varchar(50) NOT NULL DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`ID`, `identifier`, `player_state`, `first_name`, `last_name`, `age`, `matricule`, `gender`, `group`, `permission_level`, `money`, `bankbalance`, `lastpos`, `job`, `dirty_money`, `dirty_time`, `dirty_wait_money`, `intervention`, `enService`, `phone_number`, `contacts`, `sms`, `batterie`) VALUES
(1, 'steam:110000102f38cb7', 0, 'Otto', 'Stoschek', '58', 'KPR-92538', 'M', 'owner', 4, 375, 1400, '{157.983306884766, -3132.33325195313,  7.02873659133911, 4.39598560333252}', 8, 0, '0', 0, 0, 0, '555-7572', NULL, NULL, '100'),
(2, 'steam:110000107102b2c', 0, 'Stanko', 'Novosel', '32', 'KPR-56552', 'M', 'owner', 4, 350, 0, '{-18.438928604126, -2664.08715820313,  5.8988676071167, 90}', 2, 0, '0', 0, 0, 0, '555-6539', NULL, NULL, '100'),
(3, 'steam:110000101f91cd2', 0, 'Peter', 'Patasel', '29', 'KPR-99689', 'M', 'owner', 4, 1025, 3300, '{396.794189453125, -1635.95397949219,  29.2919292449951, 152.578094482422}', 2, 0, '0', 0, 0, 0, '555-7738', '[{"first_name":"Julia","last_name":"Salvador","number":"555-7629"},{"first_name":"Edouardo","last_name":"Delfa","number":"555-1924"}]', '[{"first_name":"Julia","last_name":"Salvador","text":"Mr Patasel ? ","jour":29,"heure":3,"minute":26,"mois":5},{"first_name":"Eduardo","last_name":"Delfa","text":"Nous somme au tequi-la-la si tu veux nous rejoindre","jour":29,"heure":3,"minute":34,"mois":5},{"first_name":"Eduardo","last_name":"Delfa","text":"On est en route ;)","jour":30,"heure":1,"minute":20,"mois":5}]', '100'),
(4, 'steam:110000101ab9a22', 0, 'Peter', 'McCarty', '25', 'KPR-57233', 'M', 'user', 0, 0, 9880, '{83.8380737304688, -2607.46752929688,  5.52264356613159, 92.2864837646484}', 7, 0, '0', 0, 0, 0, '555-3867', '[{"first_name":"Tom","last_name":"Sithis","number":"555-7960"},{"first_name":"Val","last_name":"Harrods","number":"555-9359"},{"first_name":"Eduardo","last_name":"Delfa","number":"555-1924"},{"first_name":"Jonathan","last_name":"Drake","number":"555-3398"},{"first_name":"Steve","last_name":"Williams","number":"555-5745"}]', '[{"first_name":"Jonathan","last_name":"Drake","text":"Ok donc le RDV avec Mr. K c\'est vrai on va l\'avoir","jour":28,"heure":3,"minute":31,"mois":5},{"first_name":"Jonathan","last_name":"Drake","text":"Il est en dehors de la ville je crois","jour":28,"heure":19,"minute":51,"mois":5}]', '100'),
(5, 'steam:1100001012fa921', 0, 'Eduardo', 'Delfa', '28', 'KPR-39782', 'M', 'user', 0, 300, 24129, '{74.6481857299805, -1396.91540527344,  29.3761501312256, 154.224899291992}', 3, 0, '0', 0, 0, 1, '555-1924', '[{"first_name":"[Cadet]","last_name":"Harquin","number":"555-7974"},{"first_name":"[LSFD]","last_name":"Drulak","number":"555-9531"},{"first_name":"[Cadet]","last_name":"Stark","number":"555-6472"},{"first_name":"Peter","last_name":"Patacel","number":"555-7738"},{"first_name":"STEWART","last_name":"Helena","number":"555-9549"},{"first_name":"Christopher","last_name":"Keen","number":"555-5157"},{"first_name":"Ivan","last_name":"Barychnikov","number":"555-9202"},{"first_name":"Peter","last_name":"McCarty","number":"555-3867"},{"first_name":"Tyrese","last_name":"Hogan","number":"555-6591"},{"first_name":"[Journaliste]","last_name":"Val","number":"555-9359"},{"first_name":"[Lt]","last_name":"Gabiota","number":"555-6947"},{"first_name":"Julia","last_name":"Salvador","number":"555-7629"},{"first_name":"John","last_name":"Drake","number":"555-3398"},{"first_name":"James","last_name":"TURNER","number":"555-8409"},{"first_name":"Luciano","last_name":"Bagarela","number":"555-3398"},{"first_name":"Faren","last_name":"Costallo","number":"555-3577"},{"first_name":"George","last_name":"Meilleur","number":"555-2277"},{"first_name":"George","last_name":"Tissimo","number":"555-1881"},{"first_name":"Luciano","last_name":"BAGARELLO","number":"555-1023"},{"first_name":"Tristant","last_name":"Douille","number":"555-1682"}]', '[{"first_name":"Ivan","last_name":"Barychnikov","text":"Bonsoir, vou ete libre ?","jour":26,"heure":23,"minute":24,"mois":5},{"first_name":"James","last_name":"Turner","text":"Bonjour doc! ","jour":28,"heure":18,"minute":18,"mois":5},{"first_name":"James","last_name":"Turner","text":"je vous doit toujours 20$ pour hier dites moi quand vous etes disponnible ","jour":28,"heure":18,"minute":19,"mois":5},{"first_name":"Helena","last_name":"Stewart","text":"Tu es dispo ?","jour":28,"heure":20,"minute":42,"mois":5},{"first_name":"James","last_name":"Turner","text":"Bonjour Doc\' vous etes disponible pour une visite médicale?","jour":29,"heure":15,"minute":13,"mois":5}]', '100'),
(6, 'steam:110000115a5c87b', 0, 'Bertrand', 'Legrain', '32', 'KPR-38549', 'M', 'user', 0, 0, 3423, '{214.521911621094, -790.703247070313,  30.8450813293457, 227.254791259766}', 8, 0, '0', 0, 0, 0, '555-5505', '[{"first_name":"Cadet","last_name":"Stark","number":"555-6472"},{"first_name":"Fahren","last_name":"Costello","number":"555-3577"},{"first_name":"Oliver","last_name":"Bing","number":"555-6677"},{"first_name":"Duke","last_name":"Dinger","number":"555-4452"},{"first_name":"André","last_name":"Harquin","number":"555-7974"},{"first_name":"George","last_name":"Meilleur","number":"555-2277"},{"first_name":"Ivan","last_name":"Barycnikov","number":"555-9202"},{"first_name":"Ashley","last_name":"Moore","number":"555-8381"},{"first_name":"Tyrese","last_name":"Hogan","number":"555-6591"},{"first_name":"Val","last_name":"Harods","number":"555-9359"},{"first_name":"Val","last_name":"Harods","number":"555-9359"},{"first_name":"Zack","last_name":"Prost","number":"555-1169"}]', '[{"first_name":"Ivan","last_name":"Barychnikov","text":"je vi1 de lui envoyé un sms","jour":28,"heure":2,"minute":51,"mois":5},{"first_name":"Ashley","last_name":"Moore","text":"Salut Bertrand, désolée j\'ai pas vu ton msg. La j\'ai fini ma journé, je pars me coucher. Msg moi pour qd je me lève! xx","jour":28,"heure":11,"minute":34,"mois":5},{"first_name":"Ashley","last_name":"Moore","text":"jlui ai rien dit, tu es ou la? jme suis achete un scooter, je suis en ville!","jour":28,"heure":22,"minute":28,"mois":5},{"first_name":"Ivan","last_name":"Barychnikov","text":"On peut se voir ?","jour":30,"heure":2,"minute":27,"mois":5},{"first_name":"Duke","last_name":"Dinger","text":"nil","jour":30,"heure":2,"minute":36,"mois":5},{"first_name":"Duke","last_name":"Dinger","text":"C\'est bon. Tout est réglé avec M.Delfa. Detend toi. Aucune informations n\'a fuitée sur toi.","jour":30,"heure":2,"minute":37,"mois":5}]', '100'),
(7, 'steam:110000107c76c74', 0, 'Arthur', 'Housman', '21', 'KPR-93268', 'M', 'user', 0, 90, 0, '{208.990219116211, -809.352783203125,  31.0362358093262, 118.81184387207}', 4, 0, '0', 0, 0, 0, '555-4722', '[{"first_name":"Wilson","last_name":"Nori","number":"555-8454"},{"first_name":"Wislon","last_name":"Nori","number":"555-8445"},{"first_name":"Coleman","last_name":"Alexandre","number":"555-3995"},{"first_name":"Sithis","last_name":"Tom","number":"555-7960"},{"first_name":"Helena","last_name":"Stewart","number":"555-9549"},{"first_name":"Meilleur","last_name":"Gorges","number":"555-2277"},{"first_name":"James","last_name":"Turner","number":"555-8409"},{"first_name":"Tarys","last_name":"Hogan","number":"555-6591"}]', '[{"first_name":"Alexandre","last_name":"Coleman","text":"nil","jour":26,"heure":20,"minute":31,"mois":5},{"first_name":"Alexandre","last_name":"Coleman","text":"Tu vas recolter ou pas? Je me suis fait voler mon camion","jour":26,"heure":20,"minute":37,"mois":5},{"first_name":"James","last_name":"Turner","text":"yo t es ou","jour":27,"heure":4,"minute":43,"mois":5},{"first_name":"James","last_name":"Turner","text":"nil","jour":28,"heure":0,"minute":27,"mois":5}]', '100'),
(8, 'steam:1100001040f4769', 0, 'George', 'Meilleur', '33', 'KPR-26212', 'M', 'user', 0, 145, 3500, '{921.672790527344, -163.876113891602,  74.4704513549805, 283.384429931641}', 9, 0, '0', 0, 0, 0, '555-2277', '[{"first_name":"Bertrand","last_name":"Legrand","number":"5555505"},{"first_name":"Helena","last_name":"Stewart","number":"5559559"},{"first_name":"Eduardo","last_name":"Delfa","number":"555-1924"},{"first_name":"Helena","last_name":"Stewart","number":"555-9549"},{"first_name":"Duke","last_name":"Dinger","number":"555-4452"},{"first_name":"Oliver","last_name":"Bing","number":"555-6677"},{"first_name":"Paul","last_name":"Bismuth","number":"555-2094"},{"first_name":"Bertrand","last_name":"Legrain","number":"555-5505"},{"first_name":"Tom","last_name":"Sithis","number":"555-7960"},{"first_name":"Sam","last_name":"Kun","number":"555-4855"},{"first_name":"[LSPD]","last_name":"Gabiotta","number":"555-6947"},{"first_name":"Ashley","last_name":"Moore","number":"555-8381"},{"first_name":"Ivan","last_name":"B","number":"555-9202"},{"first_name":"Luciano","last_name":"Bagarella","number":"555-1023"}]', '[{"first_name":"José","last_name":"GABIOTA","text":"RDV au commissariat ASAP pour briefing avant la Grève","jour":30,"heure":1,"minute":10,"mois":5}]', '100'),
(9, 'steam:11000010079d096', 0, 'Tristan', 'Douille', '29', 'KPR-35640', 'M', 'user', 0, 810, 3000, '{352.141021728516, -1593.05810546875,  29.2919521331787, 155.021850585938}', 4, 0, '0', 0, 0, 0, '555-1682', '[{"first_name":"Max","last_name":"Krieger","number":"555-2694"},{"first_name":"God","last_name":"ZEUS","number":"555-7685."},{"first_name":"[R]","last_name":"ZEUS","number":"555-7685"},{"first_name":"[News]","last_name":"Costello","number":"555-9359"},{"first_name":"[News]","last_name":"Arrods","number":"555-3577"},{"first_name":"[Agent]","last_name":"Stark","number":"555-6472"},{"first_name":"[Medecin]","last_name":"Delfa","number":"555-1924"},{"first_name":"Boris","last_name":"Yourinov","number":"555-3533"}]', '[{"first_name":"Max","last_name":"Krieger","text":"nil","jour":27,"heure":13,"minute":29,"mois":5},{"first_name":"Max","last_name":"Krieger","text":"Salut Tristan, je suis arrivé ce midi à LS. Je te recontacte sous peu, j\'ai pris un job au port de pêche.","jour":27,"heure":20,"minute":35,"mois":5},{"first_name":"Max","last_name":"Krieger","text":"On s\'est loupé. De toute façon il va falloir bientôt se voir, j\'ai 2 recrues potentielle qu\'il faut que tu rencontre.","jour":29,"heure":3,"minute":14,"mois":5},{"first_name":"Max","last_name":"Krieger","text":"Parfait pour les infos sur Mr K. Je planche sur un moyen de mettre notre plan en action.","jour":29,"heure":3,"minute":16,"mois":5},{"first_name":"Max","last_name":"Krieger","text":"J\'attends aussi des nouvelles de Boris. Il avait l\'air crevé, avant que je parte pour L.S. J\'éspère que tout va bien.","jour":29,"heure":3,"minute":16,"mois":5},{"first_name":"Max","last_name":"Krieger","text":"Je travaille cette nuit, et sans doute demain après midi.","jour":29,"heure":3,"minute":17,"mois":5},{"first_name":"Max","last_name":"Krieger","text":"nil","jour":29,"heure":20,"minute":1,"mois":5}]', '100'),
(10, 'steam:110000100ce9487', 0, 'Tom', 'SITHIS', '40', 'KPR-75300', 'M', 'user', 0, 20, 1800, '{217.733154296875, -809.319091796875,  30.7076683044434, 243.205291748047}', 7, 0, '0', 0, 0, 0, '555-7960', '[{"first_name":"Wilson","last_name":"NORI","number":"555-8445"},{"first_name":"Hafna","last_name":"STARCY","number":"555-6895"},{"first_name":"Arthur","last_name":"HOUSMAN","number":"555-4722"},{"first_name":"Jonathan","last_name":"DRAKE","number":"555-3398"},{"first_name":"Alex","last_name":"MORRISSON","number":"555-9949"},{"first_name":"Omar","last_name":"WALLAD","number":"555-8947"},{"first_name":"Johnny","last_name":"BOBZER","number":"555-4058"},{"first_name":"Denis","last_name":"SOLEDRA","number":"555-8852"},{"first_name":"Helena","last_name":"STEWART","number":"555-9549"},{"first_name":"Eduardo","last_name":"DELFA","number":"555-1924"},{"first_name":"Peter","last_name":"McCARTHY","number":"555-3867"},{"first_name":"Alexandre","last_name":"COLEMAN","number":"555-3995"},{"first_name":"James","last_name":"TURNER","number":"555-8409"},{"first_name":"Vlad","last_name":"EMELIANENKO","number":"555-1894"},{"first_name":"Steve","last_name":"WILLIAMS","number":"555-5745"},{"first_name":"Val","last_name":"HARRODS","number":"555-9359"},{"first_name":"Fahren","last_name":"COSTELO","number":"555-3577"},{"first_name":"Ashley","last_name":"MOORE","number":"555-8381"},{"first_name":"Georges","last_name":"MEILLEUR","number":"555-2277"},{"first_name":"Carl","last_name":"LANUS","number":"555-2744"}]', '[{"first_name":"James","last_name":"Turner","text":"Yo tom tu fais des tour de scierie? ","jour":28,"heure":18,"minute":23,"mois":5},{"first_name":"Omar","last_name":"Wallad","text":"Salut ! tu va bien ?","jour":30,"heure":3,"minute":5,"mois":5}]', '100'),
(11, 'steam:110000101d96ca9', 0, 'Johnny', 'Bobzer', '41', 'KPR-65510', 'M', 'user', 0, 200, 8425, '{-357.761138916016, 16.2269344329834,  47.8547477722168, 241.717742919922}', 9, 0, '0', 0, 0, 0, '555-4058', '[{"first_name":"George","last_name":"Mailler","number":"5552277"},{"first_name":"Wilson","last_name":"Nori","number":"5558445"},{"first_name":"Tom","last_name":"Sithis","number":"5557960"},{"first_name":"Wilson","last_name":"Nori","number":"555-8445"},{"first_name":"Charles","last_name":"Berenson","number":"555-1006"},{"first_name":"Tom","last_name":"Sithis","number":"555-7960"}]', NULL, '100'),
(12, 'steam:1100001038318d9', 0, 'Duke', 'Dinger', '34', 'KPR-92038', 'M', 'user', 0, 450, 25085, '{156.263977050781, -1042.1611328125,  29.0622711181641, 160.508178710938}', 2, 0, '0', 0, 0, 0, '555-4452', '[{"first_name":"Val","last_name":"Harrods","number":"555-9359"},{"first_name":"Bertrand","last_name":"Legrain","number":"555-5505"},{"first_name":"André","last_name":"Harquin","number":"555-7974"},{"first_name":"Bruce","last_name":"Stark","number":"555-6472"},{"first_name":"Denis","last_name":"Soledra","number":"555-8852"},{"first_name":"Fafaski","last_name":"Riders","number":"555-8286"},{"first_name":"Samuel","last_name":"Boisirie","number":"555-6591"},{"first_name":"George","last_name":"Meilleur","number":"555-2277"},{"first_name":"James","last_name":"Turner","number":"555-8409"}]', '[{"first_name":"James","last_name":"Turner","text":"Mr l agent vous etes en ville?","jour":29,"heure":1,"minute":43,"mois":5},{"first_name":"Bertrand","last_name":"Legrain","text":"C\'est à dire ? ","jour":30,"heure":15,"minute":17,"mois":5}]', '100'),
(13, 'steam:11000010c3bb676', 0, 'André', 'Harquin', '25', 'KPR-77591', 'M', 'user', 0, 2520, 13865, '{-890.139282226563, -573.901062011719,  31.8317260742188, 208.878616333008}', 2, 0, '0', 0, 0, 1, '555-7974', '[{"first_name":"Eduardo","last_name":"DELFA","number":"555-1924"},{"first_name":"Fahren","last_name":"Costello","number":"555-3577"},{"first_name":"Val","last_name":"HARRODS","number":"555-9359"},{"first_name":"Bertrand","last_name":"LEGRAIN","number":"555-5505"},{"first_name":"Helena","last_name":"STEWART","number":"555-9549"},{"first_name":"Duke","last_name":"DINGER","number":"555-4452"}]', '[{"first_name":"Bertrand","last_name":"Legrain","text":"Salut ma biche !","jour":27,"heure":14,"minute":27,"mois":5},{"first_name":"Bertrand","last_name":"Legrain","text":"Coucou ma beauté ! Tu es où ?","jour":27,"heure":22,"minute":58,"mois":5},{"first_name":"Helena","last_name":"Stewart","text":"hey bonjour Harquin :D je me suis permise, j\'ai demandé votre numéro a un de vos collegue ;)","jour":27,"heure":23,"minute":10,"mois":5}]', '100'),
(14, 'steam:1100001000cf976', 0, 'Oliver', 'Bing', '30', 'KPR-69719', 'M', 'user', 0, 0, 1629, '{-290.421325683594, -3676.8134765625,  1.37306606769562, 160.823013305664}', 8, 0, '0', 0, 0, 0, '555-6677', '[{"first_name":"Georges","last_name":"Taxi","number":"5552277"},{"first_name":"Bertrand","last_name":"Legrain","number":"5555505"},{"first_name":"Vlad","last_name":"Russe","number":"5551894"},{"first_name":"Bertrand","last_name":"Leg","number":"555-5505"}]', '[{"first_name":"George","last_name":"Meilleur","text":"Bonjour Mr Bing, c\'est Mr Meilleur, vous n\'avez toujours pas réglé votre facture. Cordialement,","jour":28,"heure":5,"minute":16,"mois":5},{"first_name":"George","last_name":"Meilleur","text":"Bonjour Mr Bing","jour":28,"heure":20,"minute":35,"mois":5}]', '100'),
(15, 'steam:110000107acb0e8', 0, 'Bruce', 'Stark', '25', 'KPR-10301', 'M', 'user', 0, 150, 5650, '{286.654418945313, -936.821716308594,  29.4678592681885, 338.134063720703}', 1, 80, '0', 0, 0, 0, '555-6472', '[{"first_name":"Eduardo","last_name":"DELFA","number":"555-1924"},{"first_name":"LSPD","last_name":"-","number":"555-7974"},{"first_name":"André","last_name":"HARQUIN","number":"555-7974"},{"first_name":"Denis","last_name":"SOLEDRA","number":"[NUMERO"},{"first_name":"Denis","last_name":"SOLEDRA","number":"555-8852"},{"first_name":"Duke","last_name":"DINGER","number":"555-4452"},{"first_name":"Val","last_name":"HARRODS","number":"555-9359"}]', NULL, '100'),
(16, 'steam:1100001010bf4c6', 0, 'Omar', 'Wallad', '21', 'KPR-78763', 'M', 'user', 0, 200, 5670, '{-81.3127212524414, -1316.72912597656,  28.738899230957, 80.2247314453125}', 9, 1350, '0', 0, 0, 0, '555-8947', '[{"first_name":"George","last_name":"Mailler","number":"555-2277"},{"first_name":"Willson","last_name":"Nori","number":"555-8445"},{"first_name":"TOM","last_name":"SHITIS","number":"555-7960"}]', '[{"first_name":"Wilson","last_name":"Nori","text":"T4es en ville ?","jour":28,"heure":0,"minute":25,"mois":5},{"first_name":"Wilson","last_name":"Nori","text":"Yo t\'es en ville ?","jour":29,"heure":23,"minute":44,"mois":5}]', '100'),
(17, 'steam:110000104bd6595', 0, 'Nicolas', 'Delpra', '24', 'KPR-85128', 'M', 'user', 0, 0, 325, '{124.958419799805, -1311.42529296875,  29.1332626342773, 290.568176269531}', 9, 0, '0', 0, 0, 0, '555-4336', NULL, NULL, '100'),
(18, 'steam:110000107f3f84f', 0, 'Carl', 'Lanus', '40', 'KPR-14557', 'M', 'user', 0, 0, 8775, '{-582.502746582031, 5227.2587890625,  70.7784881591797, 14.3530750274658}', 7, 0, '0', 0, 0, 0, '555-2744', '[{"first_name":"Steve","last_name":"Williams","number":"555-5745"},{"first_name":"Tom","last_name":"Sithis","number":"555-7960"},{"first_name":"Ivan","last_name":"Barychnikov","number":"555-9202"}]', NULL, '100'),
(19, 'steam:110000109cfe4a6', 0, 'Alexandre', 'Coleman', '20', 'KPR-82691', 'M', 'user', 0, 595, 8230, '{2425.91772460938, 5733.880859375,  45.003589630127, 27.3292484283447}', 7, 0, '0', 0, 0, 0, '555-3995', '[{"first_name":"Tom","last_name":"cithis","number":"555-7960"},{"first_name":"Housman","last_name":"Arthur","number":"555-4722"},{"first_name":"James","last_name":"Turner","number":"555-8459"},{"first_name":"Alex","last_name":"Morrison","number":"555-9949"}]', '[{"first_name":"Alex","last_name":"Morrison","text":"nil","jour":29,"heure":19,"minute":38,"mois":5}]', '100'),
(20, 'steam:110000104abd684', 0, 'James', 'Turner', '25', 'KPR-32424', 'M', 'user', 0, 0, 2000, '{269.839965820313, -1446.37878417969,  29.2999401092529, 44.2470970153809}', 4, 0, '0', 0, 0, 0, '555-8409', '[{"first_name":"Tyrese","last_name":"Hogan","number":"555-6591"},{"first_name":"Arthur","last_name":"Housman","number":"555-4722"},{"first_name":"Alexandre","last_name":"Colmen","number":"555-3995"},{"first_name":"Tom","last_name":"Sithis","number":"555-7960"},{"first_name":"Vladimir","last_name":"Emilan","number":"555-1894"},{"first_name":"medecin","last_name":"perso","number":"555-1924"},{"first_name":"Duke","last_name":"Dinger","number":"555-4452"},{"first_name":"Vad","last_name":"Harrods","number":"555-9359"},{"first_name":"Jin","last_name":"Phoenix","number":"555-6384"},{"first_name":"Luciano","last_name":"Bagarella","number":"555-1023"}]', '[{"first_name":"Eduardo","last_name":"Delfa","text":"Je suis au comisseriat, je n\'avais pas votre numéro pour vous répondre vant désolé","jour":28,"heure":22,"minute":37,"mois":5},{"first_name":"Tom","last_name":"SITHIS","text":"Yep James. J\'suis avec Steve pour le moment, on tourne. hésite pas à nous rejoindre. ;)","jour":29,"heure":21,"minute":30,"mois":5},{"first_name":"Eduardo","last_name":"Delfa","text":"Vous m\'avez envoyé un sms Mr Turner ?","jour":29,"heure":21,"minute":49,"mois":5}]', '100'),
(21, 'steam:110000103af647a', 0, 'Ivan', 'Barychnikov', '29', 'KPR-12052', 'M', 'user', 0, 1467, 4800, '{124.93285369873, -225.023483276367,  54.5578308105469, 349.045867919922}', 9, 0, '0', 0, 0, 0, '555-9202', '[{"first_name":"[PRENOM]","last_name":"[NOM]","number":"555-1924"},{"first_name":"Edouardo","last_name":"Medecin","number":"555-1924"},{"first_name":"Fahren","last_name":"Costello","number":"555-3577"},{"first_name":"Val","last_name":"harrods","number":"555-9359"},{"first_name":"Bertrand","last_name":"Legrain","number":"555-5505"},{"first_name":"Ashley","last_name":"Moore","number":"555-8381"},{"first_name":"Ebbony","last_name":"Santini","number":"555-9987"},{"first_name":"George","last_name":"Meilleur","number":"555-2277"}]', '[{"first_name":"Ebony","last_name":"Santini","text":"oué! :)","jour":30,"heure":2,"minute":44,"mois":5},{"first_name":"George","last_name":"Meilleur","text":"Ivan, tout va bien ? On t\'a perdu de vu et tu ne réponds pas à la radio","jour":30,"heure":3,"minute":39,"mois":5}]', '100'),
(22, 'steam:110000103377b34', 0, 'Val', 'Harrods', '28', 'KPR-37716', 'M', 'user', 0, 1434, 10290, '{-1087.00073242188, -263.764465332031,  37.7574768066406, 70.6960601806641}', 11, 0, '0', 0, 0, 0, '555-9359', '[{"first_name":"André","last_name":"Harquin","number":"555-7974"},{"first_name":"Duke","last_name":"Dinger","number":"555-4452"},{"first_name":"Bruce","last_name":"Starck","number":"555-6472"},{"first_name":"Ivan","last_name":"Taxi","number":"555-9202"},{"first_name":"Johnatan","last_name":"Drake","number":"555-3398"},{"first_name":"Eduardo","last_name":"Delfa","number":"555-1924"},{"first_name":"Bertrand","last_name":"Legrain","number":"555-5505"},{"first_name":"Peter","last_name":"McCarty","number":"555-3857"},{"first_name":"Peter","last_name":"McCarty1","number":"555-3867"},{"first_name":"James","last_name":"Turner","number":"555-8409"},{"first_name":"Tyrese","last_name":"Hogan","number":"555-6591"},{"first_name":"Meyer","last_name":"Taxi","number":"555-2277"}]', '[{"first_name":"James","last_name":"Turner","text":"vous etes en ville?","jour":29,"heure":16,"minute":53,"mois":5},{"first_name":"James","last_name":"Turner","text":"fusillade devant la casse","jour":29,"heure":16,"minute":54,"mois":5},{"first_name":"Tristan","last_name":"Douille","text":"Bonjour. Mr.Douille, dépanneur. Je suis à votre recherche pour des infos sur ma copine disparue dont on m\'a dit [1/2]","jour":29,"heure":21,"minute":33,"mois":5},{"first_name":"Tristan","last_name":"Douille","text":"que vous auriez des possibles infos sur une personne qui le saurait. [2/2]","jour":29,"heure":21,"minute":33,"mois":5}]', '100'),
(23, 'steam:1100001034ab108', 0, 'Fahren', 'Costello', '28', 'KPR-40278', 'M', 'user', 0, 100, 15362, '{882.148376464844, 179.183853149414,  74.7373123168945, 139.133575439453}', 11, 0, '0', 0, 0, 0, '555-3577', '[{"first_name":"Andre","last_name":"Arquin","number":""},{"first_name":"Duc","last_name":"Dinger","number":"555-4452"},{"first_name":"Val","last_name":"Harrods","number":"555-9359"},{"first_name":"Bertrand","last_name":"legrain","number":"555-5505"},{"first_name":"Ivan","last_name":"Baritchikov","number":"555-9202"},{"first_name":"Peter","last_name":"Mcharty","number":"555-3867"},{"first_name":"Edouardo","last_name":"Delfa","number":"555-1924"}]', NULL, '100'),
(24, 'steam:1100001119c47c3', 0, 'Jonathan', 'Drake', '21', 'KPR-30523', 'M', 'user', 0, 0, 7350, '{-283.277984619141, 1206.35864257813,  318.158996582031, 298.2392578125}', 7, 0, '0', 0, 0, 0, '555-3398', '[{"first_name":"Wilson","last_name":"Nori","number":"555-8445"},{"first_name":"Tom","last_name":"Cithis","number":"555-7960"},{"first_name":"Helena","last_name":"Stewart","number":"555-9549"},{"first_name":"Val","last_name":"Harrods","number":"555-9359"},{"first_name":"Peter","last_name":"McCarthy","number":"555-3867"},{"first_name":"Vladimir","last_name":"Emelianko","number":"555-1894"},{"first_name":"Octor","last_name":"Ericsson","number":"555-5770"}]', '[{"first_name":"Wilson","last_name":"Nori","text":"Et pourqUOI IL t\'on parlé de ca alors ? olala je comprend plus rien x)","jour":28,"heure":3,"minute":35,"mois":5},{"first_name":"Peter","last_name":"McCarty","text":"Tu tiens ca de qui?","jour":28,"heure":13,"minute":16,"mois":5},{"first_name":"Tom","last_name":"SITHIS","text":"Présent véhicule sportive noir qui vient de passer.","jour":29,"heure":0,"minute":19,"mois":5},{"first_name":"Eduardo","last_name":"Delfa","text":"Vous pouvez demandez a Mr Douille de venir au comico s\'il vous plait ?","jour":29,"heure":21,"minute":56,"mois":5},{"first_name":"Eduardo","last_name":"Delfa","text":"Test","jour":29,"heure":23,"minute":0,"mois":5},{"first_name":"Wilson","last_name":"Nori","text":"Je suis au golf","jour":30,"heure":21,"minute":10,"mois":5}]', '100'),
(25, 'steam:11000010533a4e9', 0, 'Alex', 'Morrison', '30', 'KPR-42639', 'M', 'user', 0, 1265, 15695, '{2654.78686523438, 3474.76831054688,  59.2204818725586, 335.512023925781}', 7, 675, '0', 0, 0, 0, '555-9949', '[{"first_name":"Tom","last_name":"Sithis","number":"555-7960"},{"first_name":"Alexandre","last_name":"Coleman","number":"555-3995"},{"first_name":"Medecin","last_name":"inconnu","number":"555-1924"}]', '[{"first_name":"Alexandre","last_name":"Coleman","text":"Tu es en ville?","jour":28,"heure":3,"minute":43,"mois":5}]', '100'),
(27, 'steam:11000010882162b', 0, 'Christopher', 'Keen', '21', 'KPR-64832', 'M', 'user', 0, 0, 1395, '{-289.052886962891, -985.750427246094,  24.1370525360107, 331.987731933594}', 5, 0, '0', 0, 0, 0, '555-5157', '[{"first_name":"Pablo","last_name":"Costa","number":"555-9631"},{"first_name":"Medoc","last_name":"chef","number":"555-1924"},{"first_name":"John","last_name":"Mercier","number":"555-6209"}]', NULL, '100'),
(28, 'steam:11000010ee3a2e3', 0, 'Tyrese', 'Hogan', '30', 'KPR-32343', 'M', 'user', 0, 580, 4775, '{218.083160400391, -787.963134765625,  30.8081340789795, 350.111053466797}', 4, 0, '0', 0, 0, 0, '555-6591', '[{"first_name":"Bertrand","last_name":"Legrain","number":"555-5505"},{"first_name":"James","last_name":"Turner","number":"555-8409"},{"first_name":"Arthur","last_name":"Hussman","number":"555-4722"},{"first_name":"Carl","last_name":"taxi","number":"555-2744"},{"first_name":"Val","last_name":"harod","number":"555-9359"}]', '[{"first_name":"James","last_name":"Turner","text":"Yo t\'es occupé la?","jour":27,"heure":3,"minute":3,"mois":5}]', '100'),
(29, 'steam:11000010e343011', 0, 'Pablo', 'Costa', '24', 'KPR-88544', 'M', 'user', 0, 920, 0, '{76.3251571655273, -1295.93603515625,  29.2302207946777, 12.8658332824707}', 5, 0, '0', 0, 0, 0, '555-9631', '[{"first_name":"Christopher","last_name":"Keen","number":"555-5157"}]', NULL, '100'),
(30, 'steam:110000105622120', 0, 'Wilson', 'Nori', '24', 'KPR-52694', 'M', 'user', 0, 300, 4232, '{-45.6128120422363, -483.141387939453,  40.0105895996094, 159.283126831055}', 7, 0, '0', 0, 0, 0, '555-8445', '[{"first_name":"IVan","last_name":"Taxi","number":"555-9202"},{"first_name":"George","last_name":"Meyer","number":"555-2277"},{"first_name":"Johnny","last_name":"Bobzer","number":"555-4058"},{"first_name":"Omar","last_name":"Wallad","number":"555-8947"},{"first_name":"Tom","last_name":"sithis","number":"555-7960"},{"first_name":"Jhonatan","last_name":"Drake","number":"555-3398"},{"first_name":"Jhonny","last_name":"Bobzer","number":"555-4058"},{"first_name":"Pedro","last_name":"Ramos","number":"555-9835"},{"first_name":"Peter","last_name":"Person","number":"555-7738"},{"first_name":"Alexandre","last_name":"Colman","number":"555-3995"}]', '[{"first_name":"Omar","last_name":"Wallad","text":"Ha . Pas grave au pire ont ce voie demain !","jour":30,"heure":3,"minute":5,"mois":5}]', '100'),
(31, 'steam:1100001145a7a54', 0, 'Hafna', 'Starcy', '22', 'KPR-92503', 'M', 'user', 0, 145, 2059, '{-766.516174316406, -840.036499023438,  21.9230079650879, 269.312927246094}', 10, 0, '0', 0, 0, 0, '555-6895', '[{"first_name":"Tom","last_name":"Sithis","number":"555-7960"}]', NULL, '100'),
(32, 'steam:11000010c174612', 0, 'Vladimir', 'Emelianko', '38', 'KPR-50303', 'M', 'user', 0, 0, 1720, '{721.182739257813, 6509.79443359375,  26.9687633514404, 77.0138244628906}', 7, 0, '0', 0, 0, 0, '555-1894', '[{"first_name":"Octar","last_name":"Ericson","number":"555-5770"},{"first_name":"John","last_name":"Doe","number":"[NUMERO]"},{"first_name":"Zack","last_name":"Prost","number":"555-1169"},{"first_name":"Tom","last_name":"Sithis","number":"555-7960"},{"first_name":"James","last_name":"Turner","number":"555-8409"},{"first_name":"Jonathan","last_name":"Drake","number":"555-3398"}]', '[{"first_name":"James","last_name":"Turner","text":"Bonjour Doc\' vous etes disponible pour une visite médicale?","jour":29,"heure":15,"minute":19,"mois":5},{"first_name":"James","last_name":"Turner","text":"j ai des infos pour toi","jour":30,"heure":16,"minute":30,"mois":5}]', '100'),
(33, 'steam:11000010a303bad', 0, 'Julia', 'Salvador', '29', 'KPR-95180', 'F', 'user', 0, 85, 956, '{909.651062011719, -158.219604492188,  74.1288681030273, 258.701690673828}', 9, 0, '0', 0, 0, 0, '555-7629', '[{"first_name":"Mon","last_name":"Mari","number":"555-6240"},{"first_name":"Mr","last_name":"Patasel","number":"555-7738"},{"first_name":"Helena","last_name":"Stewart","number":"555-9549"},{"first_name":"Eduardo","last_name":"Delfa","number":"555-1924"}]', '[{"first_name":"Helena","last_name":"Stewart","text":"Coucou tu es en ville ?","jour":28,"heure":20,"minute":58,"mois":5},{"first_name":"Eduardo","last_name":"Delfa","text":"Julia il faudra voir pour ta visite médical, je sais que tu as pas mon numéro, on peu se retrouver au taxi si tu veux","jour":28,"heure":21,"minute":47,"mois":5}]', '100'),
(34, 'steam:110000104a3560f', 0, 'John', 'Mercier', '43', 'KPR-37862', 'M', 'user', 0, 500, 0, '{2789.9228515625, 1708.34716796875,  24.5687255859375, 354.146728515625}', 5, 0, '0', 0, 0, 0, '555-6209', '[{"first_name":"Taxi","last_name":"Keen","number":"555-5157"}]', NULL, '100'),
(35, 'steam:1100001038b0f11', 0, 'Alban', 'Drulak', '30', 'KPR-21655', 'M', 'user', 0, 865, 2040, '{-1034.87646484375, -2732.19995117188,  20.1692695617676, 204.094253540039}', 3, 0, '0', 0, 0, 0, '555-9531', '[{"first_name":"Eduardo","last_name":"\\"Netto\\"","number":"555-1924"}]', NULL, '100'),
(36, 'steam:1100001005a39f0', 0, 'Tom', 'Creuse', '30', 'KPR-52947', 'M', 'user', 0, 1580, 1300, '{334.389190673828, -1011.47662353516,  29.2926177978516, 78.5787963867188}', 1, 0, '0', 0, 0, 0, '555-7685', NULL, NULL, '100'),
(37, 'steam:11000010337f491', 0, 'Helena', 'Stewart', '24', 'KPR-52876', 'F', 'user', 0, 22, 4100, '{124.983085632324, -225.784896850586,  54.5578269958496, 184.75959777832}', 9, 0, '0', 0, 0, 0, '555-9549', '[{"first_name":"Eduardo","last_name":"Delfa","number":"555-1924"},{"first_name":"Arthur","last_name":"HOUSMAN","number":"555-4722"},{"first_name":"Georges","last_name":"Meilleur","number":"555-2277"},{"first_name":"André","last_name":"Harquin","number":"555-7974"},{"first_name":"Julia","last_name":"SALVADOR","number":"555-7629"},{"first_name":"Peter","last_name":"PATASEL","number":"555-7738"},{"first_name":"Duke","last_name":"DINGER","number":"555-4452"},{"first_name":"Ivan","last_name":"BARYCHNIKOV","number":"555-9202"},{"first_name":"Luciano","last_name":"BAGARELLA","number":"555-1023"},{"first_name":"Denis","last_name":"SOLEDRA","number":"555-8852"}]', '[{"first_name":"Eduardo","last_name":"Delfa","text":"tu as un ticket avec harquin je pense ;)","jour":30,"heure":2,"minute":24,"mois":5}]', '100'),
(38, 'steam:110000100e840de', 0, 'Sam', 'Kun', '26', 'KPR-63458', 'M', 'user', 0, 55, 5710, '{-510.260345458984, -4285.50244140625,  1.32780027389526, 159.68473815918}', 8, 0, '0', 0, 0, 0, '555-4855', '[{"first_name":"Georges","last_name":"Meilleur","number":"555-2277"},{"first_name":"Max","last_name":"Krieger","number":"555-2694"},{"first_name":"Ashley","last_name":"Moore","number":"555-8381"}]', NULL, '100'),
(39, 'steam:11000010d60238d', 0, 'Wade', 'Hudson', '28', 'KPR-17624', 'M', 'user', 0, 500, 0, '{-115.541648864746, -1308.40673828125,  29.3013076782227, 356.733612060547}', 1, 0, '0', 0, 0, 0, '555-7365', NULL, NULL, '100'),
(40, 'steam:110000103536d2e', 0, 'Fafaskii', 'Riders', '25', 'KPR-39023', 'M', 'user', 0, 1000, 5440, '{453.431121826172, -988.785034179688,  30.6895942687988, 47.9862670898438}', 1, 0, '0', 0, 0, 0, '555-8286', '[{"first_name":"Denis","last_name":"Soledra","number":"555-8852"}]', NULL, '100'),
(41, 'steam:110000105195a9a', 0, 'Zack', 'Prost', '21', 'KPR-35652', 'M', 'user', 0, 305, 1585, '{-2790.921875, 2068.88110351563,  93.3373184204102, 167.007659912109}', 5, 0, '0', 0, 0, 0, '555-1169', '[{"first_name":"Ollivier","last_name":"Bing","number":"555-677"}]', NULL, '100'),
(42, 'steam:1100001019b2b4d', 0, 'FOX', 'Riders', '22', 'KPR-30534', 'M', 'user', 0, 275, 3350, '{388.402526855469, -1620.80981445313,  29.376163482666, 248.011108398438}', 4, 0, '0', 0, 0, 0, '555-9504', '[{"first_name":"James","last_name":"Turner","number":"555-8409"}]', NULL, '100'),
(43, 'steam:1100001058e2e0b', 0, 'Rease', 'Caparzo', '24', 'KPR-51998', 'M', 'user', 0, 27, 3301, '{298.120574951172, -367.791473388672,  44.5878715515137, 98.3619003295898}', 9, 0, '0', 0, 0, 0, '555-4243', NULL, NULL, '100'),
(44, 'steam:1100001041c6ab2', 0, 'Denis', 'Soledra', '25', 'KPR-83710', 'M', 'user', 0, 600, 8435, '{-1027.1142578125, -314.972747802734,  37.6419830322266, 212.1025390625}', 2, 0, '0', 0, 0, 1, '555-8852', '[{"first_name":"TOM","last_name":"SITHIS","number":"555-7960"},{"first_name":"ANDRE","last_name":"HARQUIN","number":"555-7974"},{"first_name":"DUKE","last_name":"DINGER","number":"555-4452"},{"first_name":"BRUCE","last_name":"STARK","number":"555-7472"},{"first_name":"FAFASKII","last_name":"RIDER","number":"555-8286"},{"first_name":"HAFNA","last_name":"STARCY","number":"555-6895"},{"first_name":"GABIOTA","last_name":"JOSE","number":"555-6947"}]', NULL, '100'),
(45, 'steam:1100001154e70ff', 0, 'Ebony', 'Santini', '26', 'KPR-43734', 'F', 'user', 0, 297, 1800, '{901.58203125, -178.772262573242,  73.9307250976563, 106.712715148926}', 9, 0, '0', 0, 0, 0, '555-9987', '[{"first_name":"Ivano","last_name":"2","number":"555-9202"}]', NULL, '100'),
(46, 'steam:110000104321495', 0, 'Ashley', 'Moore', '27', 'KPR-43327', 'F', 'user', 0, 170, 800, '{148.000961303711, -1298.49084472656,  28.7719764709473, 181.394058227539}', 8, 0, '0', 0, 0, 0, '555-8381', '[{"first_name":"Bertrand","last_name":"Legrain","number":"555-5505"},{"first_name":"Hephaistos","last_name":"-","number":"555-1853"},{"first_name":"Hades","last_name":"-","number":"555-2694"},{"first_name":"Hermes","last_name":"-","number":"555-1682"},{"first_name":"Nathan","last_name":"Salvador","number":"555-6240"},{"first_name":"Tom","last_name":"Sithis","number":"555-7960"},{"first_name":"George","last_name":"Meilleur","number":"555-2277"},{"first_name":"Sam","last_name":"Kun","number":"555-4855"}]', '[{"first_name":"Ivan","last_name":"Barychnikov","text":"Bonjour, bertrand essai de te contacté si tu peu lui repondre merci","jour":28,"heure":2,"minute":50,"mois":5},{"first_name":"Bertrand","last_name":"Legrain","text":"Bonsoir Ashley !","jour":28,"heure":3,"minute":0,"mois":5},{"first_name":"Bertrand","last_name":"Legrain","text":"Ah ça me fait plaisir que tu m\'ai répondu Ashley ahah, je m\'inquiétais je ne te voyais plus au boulot !","jour":28,"heure":13,"minute":47,"mois":5}]', '100'),
(47, 'steam:110000103aedfe6', 0, 'Edward', 'Anderson', '28', 'KPR-12366', 'M', 'user', 0, 265, 2500, '{324.535522460938, -2464.53295898438,  5.87624597549438, 168.507659912109}', 5, 0, '0', 0, 0, 0, '555-5349', NULL, NULL, '100'),
(48, 'steam:110000102d1440e', 0, 'Alex', 'Cobretti', '25', 'KPR-89464', 'M', 'user', 0, 220, 1000, '{410.121734619141, -1653.28234863281,  29.2918128967285, 88.6560516357422}', 7, 0, '0', 0, 0, 0, '555-4793', '[{"first_name":"George","last_name":"meilleur","number":"555-2277"}]', NULL, '100'),
(49, 'steam:1100001069d5bca', 0, 'Octar', 'Ericson', '26', 'KPR-58936', 'M', 'user', 0, 65, 1797, '{1312.39636230469, 6493.884765625,  19.774507522583, 87.9211196899414}', 7, 40, '0', 0, 0, 0, '555-5770', '[{"first_name":"Z","last_name":"P","number":"555-1119"},{"first_name":"Zack","last_name":"P","number":"555-1169"},{"first_name":"Vladimir","last_name":"Emalianko","number":"555-1894"},{"first_name":"tom","last_name":"sithis","number":"555-7960"},{"first_name":"jonathan","last_name":"drake","number":"555-3398"}]', NULL, '100'),
(50, 'steam:110000104ea5d91', 0, 'John', 'Doe', '0', 'KPR-11860', '', 'user', 0, 915, 0, '{424.389404296875, -987.352111816406,  30.7126693725586, 336.543212890625}', 1, 0, '0', 0, 0, 0, '555-9598', NULL, NULL, '100'),
(51, 'steam:110000104d3327b', 0, 'Fred', 'leJunk', '25', 'KPR-72509', 'M', 'user', 0, 186, 8830, '{374.894256591797, -1622.79064941406,  29.2927055358887, 117.596343994141}', 4, 0, '0', 0, 0, 0, '555-3374', NULL, NULL, '100'),
(52, 'steam:1100001071dd617', 0, 'Prénom', 'et', '27', 'KPR-34704', '', 'user', 0, 0, 0, '{-568.963745117188, -1966.95190429688,  16.805269241333, 134.440292358398}', 1, 0, '0', 0, 0, 0, '555-2231', NULL, NULL, '100'),
(53, 'steam:11000010a6e50ac', 0, 'Georges', 'Ekinci', '22', 'KPR-88508', 'M', 'user', 0, 500, 0, '{-1033.865234375, -2739.51586914063,  20.1692790985107, 168.687408447266}', 1, 0, '0', 0, 0, 0, '555-3301', NULL, NULL, '100'),
(54, 'steam:110000109653e8f', 0, 'Nattan', 'Salvador', '30', 'KPR-56616', 'M', 'user', 0, 480, 5063, '{-434.714630126953, -2269.23193359375,  7.38001298904419, 88.2316970825195}', 8, 0, '0', 0, 0, 0, '555-6240', '[{"first_name":"Ma","last_name":"femme","number":"555-7629"},{"first_name":"Ashley","last_name":"More","number":"555-8381"}]', NULL, '100'),
(55, 'steam:1100001054cda0a', 0, 'Luciano', 'Bagarella', '34', 'KPR-84582', 'M', 'user', 0, 750, 6150, '{330.612670898438, -1512.66552734375,  28.6121692657471, 48.3743171691895}', 4, 0, '0', 0, 0, 0, '555-1023', '[{"first_name":"James","last_name":"Turner","number":"555-8409"}]', NULL, '100'),
(56, 'steam:110000105aef513', 0, 'Paul', 'Person', '40', 'KPR-71062', 'M', 'user', 0, 765, 1500, '{416.134613037109, -997.581359863281,  29.3275470733643, 179.84245300293}', 1, 0, '0', 0, 0, 0, '555-5045', NULL, NULL, '100'),
(57, 'steam:110000102c35113', 0, 'Max', 'Krieger', '36', 'KPR-76809', 'M', 'user', 0, 270, 1007, '{231.041061401367, -752.822021484375,  30.8261852264404, 239.290161132813}', 8, 0, '0', 0, 0, 0, '555-2694', '[{"first_name":"Tristan","last_name":"Douille","number":"555-1682"},{"first_name":"Le","last_name":"Grec","number":"5551853"},{"first_name":"Deus","last_name":"Zeus","number":"5557685"},{"first_name":"Sergio","last_name":"Lopez","number":"555-1853"},{"first_name":"Sam","last_name":"Kun","number":"555-"},{"first_name":"[PRENOM]","last_name":"[NOM","number":""},{"first_name":"Sam","last_name":"Kum","number":"555-4855"},{"first_name":"Ashley","last_name":"Moore","number":"555-8381"}]', '[{"first_name":"Tristan","last_name":"Douille","text":"Ok Max. Pour l\'instant bien intégrer dans le service de dépannage et pose la confiance avec la mairie.","jour":28,"heure":6,"minute":30,"mois":5},{"first_name":"Tristan","last_name":"Douille","text":"Infos sur K. Voir avec les journalistes, en savent beaucoup. Je vais tenter une approche.","jour":28,"heure":6,"minute":54,"mois":5},{"first_name":"Tristan","last_name":"Douille","text":"T\'es en service ?","jour":28,"heure":21,"minute":18,"mois":5},{"first_name":"Tristan","last_name":"Douille","text":"Boris retrouvé, amnésique.","jour":30,"heure":1,"minute":43,"mois":5}]', '100'),
(58, 'steam:1100001195a047c', 0, 'Alvaro', 'Capavone', '45', 'KPR-52679', 'M', 'user', 0, 340, 900, '{-615.634033203125, 1.87250804901123,  41.8127670288086, 98.066535949707}', 5, 0, '0', 0, 0, 0, '555-6033', NULL, NULL, '100'),
(59, 'steam:1100001040a7e16', 0, 'Sergio', 'Lopez', '31', 'KPR-79600', 'M', 'user', 0, 0, 2429, '{315.210693359375, -1383.09362792969,  31.9494972229004, 321.657867431641}', 8, 0, '0', 0, 0, 0, '555-1851', '[{"first_name":"Max","last_name":"Krieger","number":"5552694"},{"first_name":"Max","last_name":"Krieger","number":"555-2694"}]', NULL, '100'),
(60, 'steam:1100001055a69e5', 0, 'José', 'GABIOTA', '53', 'KPR-28963', 'M', 'user', 0, 185, 9780, '{386.831817626953, -993.74609375,  29.4179382324219, 84.9565124511719}', 1, 40, '0', 0, 0, 0, '555-6947', '[{"first_name":"Zack","last_name":"PROST","number":"555-1169"},{"first_name":"Eduardo","last_name":"DELFA","number":"555-1924"},{"first_name":"George","last_name":"MEILLEUR","number":"555-2277"}]', '[{"first_name":"Eduardo","last_name":"Delfa","text":"Ou etes vous ?","jour":29,"heure":5,"minute":28,"mois":5}]', '100'),
(61, 'steam:110000102946cda', 0, 'Paul', 'Bismuth', '28', 'KPR-81766', 'M', 'user', 0, 350, 0, '{-567.352294921875, 279.858215332031,  82.9759750366211, 218.681549072266}', 8, 0, '0', 0, 0, 0, '555-2094', '[{"first_name":"Ebony","last_name":"Santini","number":"555-9987"},{"first_name":"George","last_name":"Meiller","number":"555-2277"}]', NULL, '100'),
(62, 'steam:11000010e1c4381', 0, 'Steve', 'Williams', '24', 'KPR-46536', 'M', 'user', 0, 0, 1500, '{-62.1942901611328, -1835.1064453125,  26.7714939117432, 214.662445068359}', 7, 0, '0', 0, 0, 0, '555-5745', '[{"first_name":"[PRENOM]","last_name":"[NOM]Julia","number":"[NUMERO]5557629"},{"first_name":"[PRENOM]","last_name":"[NOM]Julia","number":"[NUMERO]555-7924"},{"first_name":"[PRENOM]","last_name":"[NOM]Julia","number":"[NUMERO]555-7629"},{"first_name":"[PRENOM]","last_name":"[NOM]","number":"[NUMERO]555-7629"},{"first_name":"[PRENOM]","last_name":"[NOM]Salvador","number":"[NUMERO]555-7629"},{"first_name":"[PRENOM]","last_name":"[NOM]police","number":"[NUMERO]555-4452"},{"first_name":"[PRENOM]","last_name":"[NOM]Tom","number":"[NUMERO]555-7960"},{"first_name":"Tom","last_name":"Sithis","number":"555-7960"},{"first_name":"Peter","last_name":"McCarty","number":"555-3867"},{"first_name":"Carl","last_name":"Lanus","number":"555-2744"}]', NULL, '100'),
(63, 'steam:11000010e694487', 0, 'Chris', 'Thorek', '32', 'KPR-75803', 'M', 'user', 0, 300, 2060, '{2943.90869140625, 3915.28881835938,  51.6349983215332, 0.948925793170929}', 7, 0, '0', 0, 0, 0, '555-1575', '[{"first_name":"Tom","last_name":"Sithis","number":"555-7960"}]', NULL, '100'),
(64, 'steam:110000109bd1bf7', 0, 'John', 'Doe', '0', 'KPR-26448', '', 'user', 0, 500, 0, '{-1037.74133, -2738.0571,  20.16929, 142.503463745117}', 1, 0, '0', 0, 0, 0, '555-2594', NULL, NULL, '100'),
(65, 'steam:11000010af59496', 0, 'John', 'Doe', '0', 'KPR-82361', '', 'user', 0, 500, 0, '{416.857055664063, -806.497863769531,  29.3842449188232, 83.5991897583008}', 1, 0, '0', 0, 0, 0, '555-8341', NULL, NULL, '100'),
(66, 'steam:1100001017c21ee', 0, 'Charles', 'Berenson', '57', 'KPR-89813', 'M', 'user', 0, 375, 1625, '{-568.998352050781, -2227.69018554688,  5.32949781417847, 312.326446533203}', 4, 0, '0', 0, 0, 0, '555-1006', '[{"first_name":"[PRENOM]","last_name":"[NOM]Johnny","number":"[NUMERO]555-4058"},{"first_name":"Johnny","last_name":"Bobzer","number":"555-4058"}]', NULL, '100'),
(67, 'steam:110000101889e5e', 0, 'Günthers', 'Shlecht', '36', 'KPR-90003', '', 'owner', 4, 400, 0, '{-1003.08911132813, -2687.08276367188,  13.9832143783569, 41.4347038269043}', 1, 0, '0', 0, 0, 0, '555-8969', NULL, NULL, '100'),
(68, 'steam:1100001158fbb8b', 0, 'John', 'Doe', '0', 'KPR-31937', '', 'user', 0, -50, 0, '{-984.164672851563, -2700.09741210938,  13.3482084274292, 86.3130187988281}', 1, 0, '0', 0, 0, 0, '555-5132', NULL, NULL, '100'),
(69, 'steam:1100001195c2496', 0, 'Jack', 'Poblac', '27', 'KPR-66360', '', 'user', 0, 350, 0, '{-823.48193359375, -1074.28881835938,  11.3281011581421, 71.3284072875977}', 1, 0, '0', 0, 0, 0, '555-9379', NULL, NULL, '100'),
(70, 'steam:11000010a3f5a39', 0, 'Prénom', 'et', 'Age : 25', 'KPR-18071', '', 'user', 0, 400, 0, '{261.799133300781, -842.309997558594,  28.9267749786377, 51.656421661377}', 9, 0, '0', 0, 0, 0, '555-2340', NULL, NULL, '100'),
(71, 'steam:11000010c30f1f7', 0, 'John', 'Doe', '0', 'KPR-67716', '', 'user', 0, 0, 0, '{29.3912715911865, -1347.11376953125,  29.0755290985107, 226.396926879883}', 5, 0, '0', 0, 0, 0, '555-5762', NULL, NULL, '100'),
(72, 'steam:110000112dbbe61', 0, 'John', 'Doe', '0', 'KPR-33261', '', 'user', 0, 620, 0, '{2887.34204101563, 4385.27685546875,  50.5538940429688, 86.1379318237305}', 5, 0, '0', 0, 0, 0, '555-8555', NULL, NULL, '100'),
(73, 'steam:11000011385b84b', 0, 'John', 'Doe', '0', 'KPR-47653', '', 'user', 0, 0, 0, '{-350.885711669922, -1138.65063476563,  27.6284275054932, 258.271301269531}', 1, 0, '0', 0, 0, 0, '555-8868', NULL, NULL, '100'),
(74, 'steam:110000119400318', 0, 'John', 'Doe', '0', 'KPR-87739', '', 'user', 0, 500, 0, '{413.052551269531, -974.576416015625,  29.4393062591553, 118.120208740234}', 1, 0, '0', 0, 0, 0, '555-5983', NULL, NULL, '100'),
(75, 'steam:11000010f5a70d1', 0, 'John', 'Doe', '0', 'KPR-37424', '', 'user', 0, 500, 0, '{147.611114501953, -1035.794921875,  29.3431224822998, 249.376678466797}', 9, 0, '0', 0, 0, 0, '555-7259', NULL, NULL, '100'),
(76, 'steam:110000104bc9698', 0, 'Jin', 'Fox', '35', 'KPR-87386', '', 'user', 0, 0, 795, '{-211.570373535156, -901.47265625,  29.2699069976807, 243.823776245117}', 4, 0, '0', 0, 0, 0, '555-6384', '[{"first_name":"JAMES","last_name":"TURNER","number":"555-8509"},{"first_name":"FRED","last_name":"LEJUNCK","number":"555-3374"}]', '[{"first_name":"James","last_name":"Turner","text":"ok j arrive","jour":30,"heure":2,"minute":25,"mois":5},{"first_name":"James","last_name":"Turner","text":"tu es vers la fourriere","jour":30,"heure":2,"minute":26,"mois":5}]', '100'),
(77, 'steam:11000010c9565b1', 0, 'John', 'Doe', '0', 'KPR-61449', '', 'user', 0, 500, 0, '{490.911895751953, -893.371643066406,  25.7112941741943, 357.418792724609}', 1, 0, '0', 0, 0, 0, '555-3370', NULL, NULL, '100'),
(78, 'steam:11000010aef5214', 0, 'John', 'Doe', '0', 'KPR-50005', '', 'user', 0, 500, 0, '{-740.428344726563, -2572.08642578125,  13.8285036087036, 90.0675582885742}', 1, 0, '0', 0, 0, 0, '555-4596', NULL, NULL, '100'),
(79, 'steam:1100001070759de', 0, 'John', 'Doe', '0', 'KPR-40031', '', 'user', 0, 0, 0, '{1233.9287109375, -1215.47631835938,  35.3516693115234, 185.056991577148}', 5, 0, '0', 0, 0, 0, '555-8351', NULL, NULL, '100'),
(80, 'steam:110000106670ad3', 0, 'John', 'Doe', '0', 'KPR-80897', '', 'user', 0, 500, 0, '{409.20947265625, -972.751586914063,  28.6136054992676, 352.854309082031}', 1, 0, '0', 0, 0, 0, '555-8485', NULL, NULL, '100'),
(81, 'steam:11000010599af76', 0, 'Georges', 'Tissimo', '42', 'KPR-71656', 'M', 'owner', 4, 750, 49683100, '{-370.667816162109, 277.179809570313,  86.4219970703125, 359.997833251953}', 1, 0, '1496117513', 0, 0, 0, '555-1881', '[{"first_name":"[PRENOM]","last_name":"[NOM]Eduardo","number":"[NUMERO]555-1924"}]', NULL, '100'),
(82, 'steam:110000108829369', 0, 'Rustine', 'Jean', '20', 'KPR-69892', '', 'user', 0, 0, 0, '{2543.6259765625, 343.62841796875,  107.656112670898, 310.294311523438}', 5, 0, '0', 0, 0, 0, '555-1121', NULL, NULL, '100'),
(83, 'steam:1100001117acabf', 0, 'Prénom', 'et', 'Age : [ESC] pour quitter.18', 'KPR-39189', '', 'user', 0, 350, 0, '{440.376220703125, -955.294738769531,  28.9738941192627, 256.652099609375}', 9, 0, '0', 0, 0, 0, '555-1135', NULL, NULL, '100'),
(84, 'steam:1100001114924f4', 0, 'WALTER', 'BENS', '24', 'KPR-59228', '', 'user', 0, 400, 0, '{397.095489501953, -827.88623046875,  29.291690826416, 142.404205322266}', 1, 0, '0', 0, 0, 0, '555-6645', NULL, NULL, '100'),
(85, 'steam:1100001090a54b5', 0, 'Baï', 'Cong', '37', 'KPR-20260', '', 'user', 0, 100, 0, '{-1040.58129882813, -2736.02270507813,  20.1692695617676, 74.8674240112305}', 1, 0, '0', 0, 0, 0, '555-1187', NULL, NULL, '100'),
(86, 'steam:1100001043822ec', 0, 'John', 'Doe', '0', 'KPR-72468', '', 'user', 0, 500, 0, '{-1037.74133, -2738.0571,  20.16929, 142.503463745117}', 1, 0, '0', 0, 0, 0, '555-4775', NULL, NULL, '100'),
(87, 'steam:11000010cc1ff1f', 0, 'John', 'Doe', '0', 'KPR-27641', '', 'user', 0, 500, 0, '{-1001.01123046875, -2748.61791992188,  19.9656352996826, 73.3686981201172}', 1, 0, '0', 0, 0, 0, '555-3107', NULL, NULL, '100'),
(88, 'steam:1100001101eade8', 0, 'John', 'Doe', '0', 'KPR-34169', '', 'user', 0, 500, 0, '{-477.963043212891, -2058.70703125,  35.9761695861816, 271.390441894531}', 1, 0, '0', 0, 0, 0, '555-1911', NULL, NULL, '100'),
(89, 'steam:1100001064d8856', 0, 'John', 'Doe', '0', 'KPR-47730', '', 'user', 0, 200, 0, '{439.476165771484, -983.837951660156,  30.6896057128906, 328.788848876953}', 1, 0, '0', 0, 0, 0, '555-9835', NULL, NULL, '100'),
(90, 'steam:110000100363fb6', 0, 'Boris', 'Yourinov', '42', 'KPR-85969', '', 'user', 0, 500, 320, '{385.322967529297, -1632.47937011719,  29.2919311523438, 7.38791465759277}', 4, 0, '0', 0, 0, 0, '555-3533', '[{"first_name":"Tristqn","last_name":"Douille","number":"555-1682"},{"first_name":"Max","last_name":"Krieger","number":"555-2694"}]', NULL, '100'),
(91, 'steam:110000119b06fc7', 0, 'Tony', 'Scoffield', 'Age : 20 ', 'KPR-43907', '', 'user', 0, 475, 0, '{427.197479248047, -977.840209960938,  30.7099514007568, 188.54573059082}', 4, 0, '0', 0, 0, 0, '555-3563', NULL, NULL, '100'),
(92, 'steam:11000010dd9e196', 0, 'John', 'Doe', '0', 'KPR-80174', '', 'user', 0, 500, 0, '{-1040.1806640625, -2745.72705078125,  13.5799112319946, 147.063552856445}', 1, 0, '0', 0, 0, 0, '555-3002', NULL, NULL, '100'),
(94, 'steam:1100001051e8060', 0, 'John', 'Doe', '0', 'KPR-28913', '', 'user', 0, 450, 0, '{-1006.87896728516, -2691.30200195313,  13.985954284668, 92.2565307617188}', 1, 0, '0', 0, 0, 0, '555-4825', NULL, NULL, '100'),
(95, 'steam:11000010274c3bf', 0, 'John', 'Doe', '0', 'KPR-60998', '', 'user', 0, 340, 0, '{-1290.88134765625, -899.850341796875,  10.9488220214844, 238.114166259766}', 10, 0, '0', 0, 0, 0, '555-3169', NULL, NULL, '100'),
(96, 'steam:1100001191030d2', 0, 'Bugsy', 'Hendrickx', '22', 'KPR-19942', '', 'user', 0, 280, 0, '{2886.79760742188, 4386.46630859375,  50.7357902526855, 45.9388275146484}', 5, 0, '0', 0, 0, 0, '555-5457', NULL, NULL, '100');
INSERT INTO `users` (`ID`, `identifier`, `player_state`, `first_name`, `last_name`, `age`, `matricule`, `gender`, `group`, `permission_level`, `money`, `bankbalance`, `lastpos`, `job`, `dirty_money`, `dirty_time`, `dirty_wait_money`, `intervention`, `enService`, `phone_number`, `contacts`, `sms`, `batterie`) VALUES
(97, 'steam:11000010c393f8b', 0, 'Eugène', 'Bosselo', '33', 'KPR-57467', '', 'user', 0, 100, 3000, '{-591.41455078125, 5231.6865234375,  70.6849594116211, 143.439987182617}', 7, 0, '0', 0, 0, 0, '555-5044', NULL, NULL, '100'),
(98, 'steam:1100001024f707e', 0, 'John', 'Doe', '0', 'KPR-36106', '', 'user', 0, 500, 0, '{-1037.74133, -2738.0571,  20.16929, 142.503463745117}', 1, 0, '0', 0, 0, 0, '555-3757', NULL, NULL, '100');

-- --------------------------------------------------------

--
-- Structure de la table `user_inventory`
--

CREATE TABLE `user_inventory` (
  `user_id` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `item_id` int(11) UNSIGNED NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `user_inventory`
--

INSERT INTO `user_inventory` (`user_id`, `item_id`, `quantity`) VALUES
('steam:1100001000cf976', 1, 0),
('steam:1100001000cf976', 2, 0),
('steam:1100001000cf976', 10, 0),
('steam:1100001000cf976', 11, 0),
('steam:1100001000cf976', 12, 0),
('steam:1100001000cf976', 14, 0),
('steam:1100001000cf976', 15, 0),
('steam:1100001000cf976', 16, 0),
('steam:1100001000cf976', 17, 0),
('steam:1100001000cf976', 18, 0),
('steam:1100001000cf976', 19, 0),
('steam:1100001000cf976', 20, 0),
('steam:1100001000cf976', 21, 0),
('steam:1100001000cf976', 22, 0),
('steam:1100001000cf976', 23, 0),
('steam:110000100363fb6', 20, 11),
('steam:110000100363fb6', 22, 9),
('steam:1100001005a39f0', 20, 4),
('steam:1100001005a39f0', 21, 0),
('steam:1100001005a39f0', 22, 8),
('steam:11000010079d096', 20, 0),
('steam:11000010079d096', 21, 0),
('steam:11000010079d096', 22, 0),
('steam:11000010079d096', 23, 0),
('steam:110000100ce9487', 1, 0),
('steam:110000100ce9487', 2, 0),
('steam:110000100ce9487', 7, 0),
('steam:110000100ce9487', 8, 1),
('steam:110000100ce9487', 18, 0),
('steam:110000100ce9487', 19, 0),
('steam:110000100ce9487', 20, 0),
('steam:110000100ce9487', 21, 0),
('steam:110000100ce9487', 22, 0),
('steam:110000100ce9487', 23, 0),
('steam:110000100e840de', 10, 0),
('steam:110000100e840de', 11, 0),
('steam:110000100e840de', 16, 0),
('steam:110000100e840de', 17, 0),
('steam:110000100e840de', 18, 0),
('steam:110000100e840de', 19, 0),
('steam:110000100e840de', 20, 16),
('steam:110000100e840de', 21, 14),
('steam:110000100e840de', 22, 0),
('steam:110000100e840de', 23, 0),
('steam:1100001010bf4c6', 1, 0),
('steam:1100001010bf4c6', 2, 0),
('steam:1100001010bf4c6', 7, 0),
('steam:1100001010bf4c6', 8, 0),
('steam:1100001010bf4c6', 10, 0),
('steam:1100001010bf4c6', 11, 0),
('steam:1100001010bf4c6', 18, 0),
('steam:1100001010bf4c6', 19, 0),
('steam:1100001010bf4c6', 20, 3),
('steam:1100001010bf4c6', 21, 1),
('steam:1100001010bf4c6', 23, 0),
('steam:1100001012fa921', 20, 8),
('steam:1100001012fa921', 21, 8),
('steam:1100001012fa921', 22, 0),
('steam:1100001012fa921', 23, 0),
('steam:1100001017c21ee', 7, 0),
('steam:1100001017c21ee', 8, 0),
('steam:1100001017c21ee', 20, 0),
('steam:1100001017c21ee', 21, 0),
('steam:1100001017c21ee', 22, 0),
('steam:1100001019b2b4d', 20, 5),
('steam:1100001019b2b4d', 21, 6),
('steam:110000101ab9a22', 1, 0),
('steam:110000101ab9a22', 2, 0),
('steam:110000101ab9a22', 10, 0),
('steam:110000101ab9a22', 11, 0),
('steam:110000101ab9a22', 16, 0),
('steam:110000101ab9a22', 17, 0),
('steam:110000101ab9a22', 18, 0),
('steam:110000101ab9a22', 19, 0),
('steam:110000101ab9a22', 20, 3),
('steam:110000101ab9a22', 21, 5),
('steam:110000101d96ca9', 1, 0),
('steam:110000101d96ca9', 2, 0),
('steam:110000101d96ca9', 7, 0),
('steam:110000101d96ca9', 8, 0),
('steam:110000101d96ca9', 10, 0),
('steam:110000101d96ca9', 11, 0),
('steam:110000101d96ca9', 18, 0),
('steam:110000101d96ca9', 19, 0),
('steam:110000101d96ca9', 20, 0),
('steam:110000101d96ca9', 21, 0),
('steam:110000101d96ca9', 22, 0),
('steam:110000101d96ca9', 23, 0),
('steam:110000101f91cd2', 18, 0),
('steam:110000101f91cd2', 20, 11),
('steam:110000101f91cd2', 21, 0),
('steam:110000101f91cd2', 22, 16),
('steam:11000010274c3bf', 1, 0),
('steam:11000010274c3bf', 2, 0),
('steam:11000010274c3bf', 10, 0),
('steam:11000010274c3bf', 11, 26),
('steam:11000010274c3bf', 20, 9),
('steam:11000010274c3bf', 21, 11),
('steam:110000102946cda', 16, 0),
('steam:110000102946cda', 17, 0),
('steam:110000102946cda', 20, 10),
('steam:110000102946cda', 21, 10),
('steam:110000102c35113', 16, 0),
('steam:110000102c35113', 17, 0),
('steam:110000102c35113', 20, 4),
('steam:110000102c35113', 21, 4),
('steam:110000102d1440e', 1, 0),
('steam:110000102d1440e', 2, 0),
('steam:110000102d1440e', 20, 11),
('steam:110000102d1440e', 21, 10),
('steam:110000102f38cb7', 16, 7),
('steam:110000102f38cb7', 17, 0),
('steam:110000102f38cb7', 20, 3),
('steam:110000102f38cb7', 21, 3),
('steam:110000103377b34', 1, 0),
('steam:110000103377b34', 2, 0),
('steam:110000103377b34', 20, 6),
('steam:110000103377b34', 21, 0),
('steam:110000103377b34', 22, 1),
('steam:110000103377b34', 23, 10),
('steam:11000010337f491', 20, 10),
('steam:11000010337f491', 21, 10),
('steam:1100001034ab108', 20, 3),
('steam:1100001034ab108', 21, 0),
('steam:1100001034ab108', 22, 7),
('steam:110000103536d2e', 14, 0),
('steam:110000103536d2e', 20, 33),
('steam:110000103536d2e', 21, 12),
('steam:1100001038318d9', 14, 0),
('steam:1100001038318d9', 20, 2),
('steam:1100001038318d9', 21, 4),
('steam:1100001038b0f11', 20, 1),
('steam:1100001038b0f11', 21, 1),
('steam:1100001038b0f11', 22, 1),
('steam:1100001038b0f11', 23, 1),
('steam:110000103aedfe6', 1, 0),
('steam:110000103aedfe6', 2, 0),
('steam:110000103aedfe6', 18, 0),
('steam:110000103aedfe6', 19, 0),
('steam:110000103aedfe6', 20, 6),
('steam:110000103aedfe6', 21, 9),
('steam:110000103af647a', 16, 0),
('steam:110000103af647a', 17, 0),
('steam:110000103af647a', 20, 3),
('steam:110000103af647a', 21, 2),
('steam:110000103af647a', 22, 1),
('steam:1100001040a7e16', 16, 0),
('steam:1100001040a7e16', 17, 0),
('steam:1100001040a7e16', 20, 0),
('steam:1100001040a7e16', 21, 0),
('steam:1100001040f4769', 20, 8),
('steam:1100001040f4769', 21, 7),
('steam:1100001040f4769', 22, 0),
('steam:1100001040f4769', 23, 0),
('steam:1100001041c6ab2', 14, 0),
('steam:1100001041c6ab2', 15, 1),
('steam:1100001041c6ab2', 20, 1),
('steam:1100001041c6ab2', 21, 22),
('steam:1100001041c6ab2', 22, 12),
('steam:1100001041c6ab2', 23, 12),
('steam:110000104321495', 16, 0),
('steam:110000104321495', 17, 0),
('steam:110000104321495', 20, 5),
('steam:110000104321495', 21, 4),
('steam:110000104321495', 22, 0),
('steam:110000104321495', 23, 0),
('steam:110000104a3560f', 18, 24),
('steam:110000104a3560f', 19, 6),
('steam:110000104abd684', 1, 0),
('steam:110000104abd684', 2, 0),
('steam:110000104abd684', 20, 0),
('steam:110000104abd684', 21, 0),
('steam:110000104abd684', 22, 0),
('steam:110000104bc9698', 20, 2),
('steam:110000104bc9698', 21, 0),
('steam:110000104bc9698', 22, 3),
('steam:110000104bd6595', 21, 1),
('steam:110000104d3327b', 1, 0),
('steam:110000104d3327b', 2, 0),
('steam:110000104d3327b', 20, 0),
('steam:110000104d3327b', 21, 0),
('steam:110000104d3327b', 23, 0),
('steam:110000104ea5d91', 20, 4),
('steam:110000104ea5d91', 21, 3),
('steam:110000105195a9a', 12, 0),
('steam:110000105195a9a', 14, 0),
('steam:110000105195a9a', 15, 0),
('steam:110000105195a9a', 16, 0),
('steam:110000105195a9a', 17, 0),
('steam:110000105195a9a', 18, 0),
('steam:110000105195a9a', 19, 0),
('steam:110000105195a9a', 20, 1),
('steam:110000105195a9a', 21, 0),
('steam:11000010533a4e9', 1, 0),
('steam:11000010533a4e9', 2, 0),
('steam:11000010533a4e9', 7, 0),
('steam:11000010533a4e9', 8, 0),
('steam:11000010533a4e9', 10, 0),
('steam:11000010533a4e9', 11, 0),
('steam:11000010533a4e9', 18, 0),
('steam:11000010533a4e9', 19, 0),
('steam:11000010533a4e9', 20, 2),
('steam:11000010533a4e9', 21, 1),
('steam:11000010533a4e9', 22, 2),
('steam:11000010533a4e9', 23, 2),
('steam:1100001054cda0a', 20, 0),
('steam:1100001054cda0a', 21, 0),
('steam:1100001054cda0a', 22, 0),
('steam:1100001054cda0a', 23, 0),
('steam:1100001055a69e5', 14, 0),
('steam:1100001055a69e5', 15, 0),
('steam:1100001055a69e5', 20, 0),
('steam:1100001055a69e5', 21, 13),
('steam:1100001055a69e5', 22, 0),
('steam:110000105622120', 1, 0),
('steam:110000105622120', 2, 30),
('steam:110000105622120', 10, 0),
('steam:110000105622120', 11, 0),
('steam:110000105622120', 18, 0),
('steam:110000105622120', 19, 0),
('steam:110000105622120', 20, 0),
('steam:110000105622120', 21, 0),
('steam:110000105622120', 22, 0),
('steam:110000105622120', 23, 0),
('steam:1100001058e2e0b', 18, 0),
('steam:1100001058e2e0b', 19, 0),
('steam:1100001058e2e0b', 20, 0),
('steam:1100001058e2e0b', 22, 0),
('steam:11000010599af76', 7, 0),
('steam:11000010599af76', 8, 0),
('steam:11000010599af76', 10, 0),
('steam:11000010599af76', 11, 0),
('steam:11000010599af76', 12, 0),
('steam:11000010599af76', 13, 0),
('steam:11000010599af76', 14, 0),
('steam:11000010599af76', 15, 0),
('steam:11000010599af76', 20, 1),
('steam:11000010599af76', 21, 1),
('steam:110000105aef513', 20, 7),
('steam:110000105aef513', 21, 7),
('steam:110000105aef513', 22, 2),
('steam:1100001064d8856', 20, 10),
('steam:1100001064d8856', 21, 10),
('steam:1100001069d5bca', 1, 0),
('steam:1100001069d5bca', 2, 0),
('steam:1100001069d5bca', 14, 0),
('steam:1100001069d5bca', 15, 0),
('steam:1100001069d5bca', 18, 0),
('steam:1100001069d5bca', 19, 0),
('steam:1100001069d5bca', 20, 8),
('steam:1100001069d5bca', 21, 8),
('steam:1100001070759de', 18, 4),
('steam:1100001070759de', 19, 0),
('steam:1100001070759de', 20, 0),
('steam:1100001070759de', 23, 0),
('steam:110000107acb0e8', 14, 0),
('steam:110000107acb0e8', 15, 0),
('steam:110000107acb0e8', 20, 18),
('steam:110000107acb0e8', 22, 15),
('steam:110000107c76c74', 1, 0),
('steam:110000107c76c74', 2, 0),
('steam:110000107c76c74', 16, 0),
('steam:110000107c76c74', 18, 0),
('steam:110000107c76c74', 19, 0),
('steam:110000107c76c74', 20, 9),
('steam:110000107c76c74', 21, 6),
('steam:110000107f3f84f', 1, 0),
('steam:110000107f3f84f', 2, 0),
('steam:110000107f3f84f', 10, 0),
('steam:110000107f3f84f', 11, 0),
('steam:110000107f3f84f', 20, 5),
('steam:110000107f3f84f', 21, 12),
('steam:110000107f3f84f', 22, 0),
('steam:110000107f3f84f', 23, 3),
('steam:11000010882162b', 18, 0),
('steam:11000010882162b', 19, 0),
('steam:11000010882162b', 20, 6),
('steam:11000010882162b', 21, 1),
('steam:11000010882162b', 22, 3),
('steam:110000108829369', 18, 0),
('steam:110000108829369', 20, 0),
('steam:110000108829369', 21, 0),
('steam:110000109653e8f', 10, 0),
('steam:110000109653e8f', 11, 0),
('steam:110000109653e8f', 16, 0),
('steam:110000109653e8f', 17, 0),
('steam:110000109653e8f', 20, 5),
('steam:110000109653e8f', 21, 6),
('steam:110000109cfe4a6', 1, 0),
('steam:110000109cfe4a6', 2, 0),
('steam:110000109cfe4a6', 18, 0),
('steam:110000109cfe4a6', 19, 0),
('steam:110000109cfe4a6', 20, 2),
('steam:110000109cfe4a6', 21, 0),
('steam:11000010a303bad', 10, 0),
('steam:11000010a303bad', 11, 0),
('steam:11000010a303bad', 16, 0),
('steam:11000010a303bad', 17, 0),
('steam:11000010a303bad', 20, 7),
('steam:11000010a303bad', 21, 0),
('steam:11000010a303bad', 22, 4),
('steam:11000010a303bad', 23, 0),
('steam:11000010c174612', 1, 0),
('steam:11000010c174612', 2, 0),
('steam:11000010c174612', 10, 0),
('steam:11000010c174612', 11, 0),
('steam:11000010c174612', 14, 0),
('steam:11000010c174612', 18, 0),
('steam:11000010c174612', 19, 0),
('steam:11000010c174612', 20, 14),
('steam:11000010c174612', 21, 0),
('steam:11000010c174612', 22, 1),
('steam:11000010c174612', 23, 0),
('steam:11000010c30f1f7', 18, 0),
('steam:11000010c30f1f7', 19, 0),
('steam:11000010c393f8b', 1, 0),
('steam:11000010c393f8b', 2, 0),
('steam:11000010c3bb676', 14, 0),
('steam:11000010c3bb676', 20, 8),
('steam:11000010c3bb676', 21, 4),
('steam:11000010c3bb676', 22, 0),
('steam:11000010e1c4381', 1, 0),
('steam:11000010e1c4381', 2, 0),
('steam:11000010e1c4381', 10, 0),
('steam:11000010e1c4381', 11, 0),
('steam:11000010e1c4381', 18, 0),
('steam:11000010e1c4381', 19, 0),
('steam:11000010e1c4381', 20, 0),
('steam:11000010e1c4381', 21, 0),
('steam:11000010e343011', 20, 14),
('steam:11000010e343011', 21, 16),
('steam:11000010e694487', 1, 0),
('steam:11000010e694487', 2, 0),
('steam:11000010e694487', 16, 0),
('steam:11000010e694487', 17, 0),
('steam:11000010e694487', 20, 2),
('steam:11000010e694487', 21, 3),
('steam:11000010e694487', 22, 1),
('steam:11000010e694487', 23, 1),
('steam:11000010ee3a2e3', 1, 0),
('steam:11000010ee3a2e3', 2, 0),
('steam:11000010ee3a2e3', 10, 0),
('steam:11000010ee3a2e3', 11, 0),
('steam:11000010ee3a2e3', 16, 0),
('steam:11000010ee3a2e3', 17, 0),
('steam:11000010ee3a2e3', 20, 2),
('steam:11000010ee3a2e3', 21, 6),
('steam:11000010ee3a2e3', 22, 0),
('steam:1100001119c47c3', 1, 0),
('steam:1100001119c47c3', 2, 0),
('steam:1100001119c47c3', 10, 0),
('steam:1100001119c47c3', 11, 0),
('steam:1100001119c47c3', 14, 0),
('steam:1100001119c47c3', 15, 2),
('steam:1100001119c47c3', 16, 0),
('steam:1100001119c47c3', 17, 0),
('steam:1100001119c47c3', 18, 0),
('steam:1100001119c47c3', 19, 0),
('steam:1100001119c47c3', 20, 0),
('steam:1100001119c47c3', 21, 0),
('steam:110000112dbbe61', 18, 0),
('steam:110000112dbbe61', 19, 13),
('steam:1100001145a7a54', 10, 0),
('steam:1100001145a7a54', 11, 26),
('steam:1100001145a7a54', 16, 0),
('steam:1100001145a7a54', 17, 0),
('steam:1100001145a7a54', 18, 0),
('steam:1100001145a7a54', 19, 0),
('steam:1100001145a7a54', 20, 0),
('steam:1100001145a7a54', 21, 0),
('steam:1100001145a7a54', 22, 0),
('steam:1100001154e70ff', 20, 0),
('steam:1100001154e70ff', 21, 1),
('steam:1100001154e70ff', 22, 0),
('steam:110000115a5c87b', 1, 0),
('steam:110000115a5c87b', 2, 0),
('steam:110000115a5c87b', 16, 0),
('steam:110000115a5c87b', 17, 0),
('steam:110000115a5c87b', 20, 0),
('steam:110000115a5c87b', 21, 0),
('steam:110000115a5c87b', 22, 0),
('steam:110000115a5c87b', 23, 0),
('steam:1100001191030d2', 1, 0),
('steam:1100001191030d2', 2, 0),
('steam:1100001191030d2', 18, 0),
('steam:1100001191030d2', 19, 0),
('steam:1100001191030d2', 20, 10),
('steam:1100001191030d2', 21, 10),
('steam:1100001191030d2', 22, 0),
('steam:1100001191030d2', 23, 0),
('steam:1100001195a047c', 10, 0),
('steam:1100001195a047c', 11, 0),
('steam:1100001195a047c', 16, 0),
('steam:1100001195a047c', 17, 0),
('steam:1100001195a047c', 18, 0),
('steam:1100001195a047c', 19, 0),
('steam:1100001195a047c', 20, 3),
('steam:1100001195a047c', 21, 3),
('steam:1100001195a047c', 22, 0);

-- --------------------------------------------------------

--
-- Structure de la table `user_vehicle`
--

CREATE TABLE `user_vehicle` (
  `ID` int(10) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `vehicle_name` varchar(60) DEFAULT NULL,
  `vehicle_model` varchar(60) DEFAULT NULL,
  `vehicle_price` int(60) DEFAULT NULL,
  `vehicle_plate` varchar(60) DEFAULT NULL,
  `vehicle_state` varchar(60) DEFAULT NULL,
  `vehicle_colorprimary` varchar(60) DEFAULT NULL,
  `vehicle_colorsecondary` varchar(60) DEFAULT NULL,
  `vehicle_pearlescentcolor` varchar(60) NOT NULL,
  `vehicle_wheelcolor` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `user_vehicle`
--

INSERT INTO `user_vehicle` (`ID`, `identifier`, `vehicle_name`, `vehicle_model`, `vehicle_price`, `vehicle_plate`, `vehicle_state`, `vehicle_colorprimary`, `vehicle_colorsecondary`, `vehicle_pearlescentcolor`, `vehicle_wheelcolor`) VALUES
(2, 'steam:110000107c76c74', 'Blista', 'blista', 10000, '83MTO079', 'in', '7', '0', '5', '156'),
(3, 'steam:11000010ee3a2e3', 'Bagger', 'bagger', 8000, '86SBN117', 'in', '8', '2', '5', '156'),
(4, 'steam:1100001000cf976', 'Blista', 'blista', 10000, '45UUT091', 'in', '7', '0', '5', '156'),
(5, 'steam:110000109cfe4a6', 'Surge', 'surge', 7500, '28FIW498', 'in', '6', '0', '111', '156'),
(6, 'steam:110000104abd684', 'Surge', 'surge', 7500, '48LVB585', 'in', '33', '0', '27', '156'),
(7, 'steam:110000100e840de', 'Faggio', 'faggio2', 2000, '41WME130', 'in', '8', '1', '5', '156'),
(9, 'steam:110000115a5c87b', 'Panto', 'panto', 6500, '21MTC131', 'in', '0', '0', '0', '156'),
(10, 'steam:1100001041c6ab2', 'Blista', 'blista', 10000, '64TTK414', 'in', '7', '0', '5', '156'),
(11, 'steam:110000107acb0e8', 'Bati 801', 'bati', 18000, '47OOR604', 'in', '0', '0', '18', '156'),
(12, 'steam:110000100e840de', 'Blista', 'blista', 10000, '64OSY739', 'four', '41', '0', '41', '156'),
(13, 'steam:110000102c35113', 'Surge', 'surge', 7500, '86GGL305', 'in', '111', '0', '0', '156'),
(15, 'steam:11000010599af76', 'Panto', 'panto', 6500, '24GQU179', 'in', '111', '111', '0', '156'),
(16, 'steam:110000100ce9487', 'Akuma', 'AKUMA', 17000, '84PUW491', 'in', '0', '2', '4', '156'),
(17, 'steam:11000010599af76', 'Ingot', 'ingot', 12000, '25CIT510', 'in', '5', '3', '111', '156'),
(18, 'steam:11000010599af76', 'Coquette BlackFin', 'coquette3', 290000, '00XUK179', 'in', '19', '19', '134', '156'),
(19, 'steam:110000104321495', 'Surge', 'surge', 7500, '68ZSZ548', 'four', '2', '0', '67', '156'),
(20, 'steam:11000010e1c4381', 'Blista', 'blista', 10000, '20LTH195', 'in', '61', '0', '65', '156');

-- --------------------------------------------------------

--
-- Structure de la table `user_weapons`
--

CREATE TABLE `user_weapons` (
  `ID` int(10) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `weapon_model` varchar(60) NOT NULL,
  `withdraw_cost` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `user_weapons`
--

INSERT INTO `user_weapons` (`ID`, `identifier`, `weapon_model`, `withdraw_cost`) VALUES
(1, 'steam:11000010ee3a2e3', 'WEAPON_Flashlight', 1),
(2, 'steam:1100001069d5bca', 'WEAPON_KnuckleDuster', 4),
(3, 'steam:11000010c174612', 'WEAPON_Knife', 8),
(4, 'steam:11000010079d096', 'WEAPON_Bat', 6),
(5, 'steam:11000010ee3a2e3', 'WEAPON_SwitchBlade', 4),
(6, 'steam:1100001145a7a54', 'WEAPON_SwitchBlade', 4),
(7, 'steam:110000109cfe4a6', 'WEAPON_SNSPistol', 20),
(8, 'steam:11000010533a4e9', 'WEAPON_SNSPistol', 20),
(9, 'steam:11000010079d096', 'WEAPON_Pistol', 50),
(10, 'steam:1100001054cda0a', 'WEAPON_Crowbar', 6),
(11, 'steam:1100001054cda0a', 'WEAPON_Flashlight', 1),
(13, 'steam:11000010079d096', 'WEAPON_Knife', 8),
(14, 'steam:110000103377b34', 'WEAPON_Pistol', 50),
(15, 'steam:1100001034ab108', 'WEAPON_Pistol', 50),
(16, 'steam:1100001012fa921', 'WEAPON_Bat', 6),
(17, 'steam:110000104abd684', 'WEAPON_Pistol', 50),
(18, 'steam:110000103aedfe6', 'WEAPON_Flashlight', 1),
(19, 'steam:110000104d3327b', 'WEAPON_Machete', 8),
(20, 'steam:1100001012fa921', 'WEAPON_SNSPistol', 20),
(21, 'steam:11000010533a4e9', 'WEAPON_Flashlight', 1),
(22, 'steam:110000103af647a', 'WEAPON_SNSPistol', 20),
(23, 'steam:11000010599af76', 'WEAPON_Pistol', 50),
(24, 'steam:110000115a5c87b', 'WEAPON_Pistol', 50),
(25, 'steam:1100001069d5bca', 'WEAPON_Pistol', 50),
(26, 'steam:11000010c174612', 'WEAPON_Pistol', 50);

-- --------------------------------------------------------

--
-- Structure de la table `user_whitelist`
--

CREATE TABLE `user_whitelist` (
  `identifier` varchar(255) NOT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `user_whitelist`
--

INSERT INTO `user_whitelist` (`identifier`, `whitelisted`) VALUES
('steam:1100001000CF976', 1),
('steam:110000100363FB6', 1),
('steam:1100001005A39F0', 1),
('steam:110000100712EC7', 1),
('steam:11000010079D096', 1),
('steam:1100001009AF64C', 1),
('steam:110000100CE9487', 1),
('steam:110000100E840DE', 1),
('steam:110000100F247F4', 1),
('steam:1100001010BF4C6', 1),
('steam:1100001012FA921', 1),
('steam:1100001017C21EE', 1),
('steam:110000101889e5e', 1),
('steam:1100001019B2B4D', 1),
('steam:110000101AB9A22', 1),
('steam:110000101D505C8', 1),
('steam:110000101D96CA9', 1),
('steam:110000101DEE850', 1),
('steam:110000101f91cd2', 1),
('steam:1100001022E929E', 1),
('steam:1100001024E9678', 1),
('steam:1100001024F707E', 1),
('steam:110000102756417', 1),
('steam:110000102946CDA', 1),
('steam:110000102C35113', 1),
('steam:110000102CD23B4', 1),
('steam:110000102D1440E', 1),
('steam:110000102f38cb7', 1),
('steam:11000010304F5CE', 1),
('steam:1100001030D8B06', 1),
('steam:110000103377B34', 1),
('steam:11000010337F491', 1),
('steam:1100001034AB108', 1),
('steam:110000103536D2E', 1),
('steam:1100001038318D9', 1),
('steam:1100001038B0F11', 1),
('steam:110000103AEDFE6', 1),
('steam:110000103AF647A', 1),
('steam:110000103C361C5', 1),
('steam:110000103CA319B', 1),
('steam:110000103DE0CB5', 1),
('steam:1100001040A7E16', 1),
('steam:1100001040F4769', 1),
('steam:1100001041C6AB2', 1),
('steam:110000104321495', 1),
('steam:1100001049CDD33', 1),
('steam:110000104A3560F', 1),
('steam:110000104ABD684', 1),
('steam:110000104B8154B', 1),
('steam:110000104bd6595', 1),
('steam:110000104D3327B', 1),
('steam:110000104DEDAF8', 1),
('steam:110000104EA5D91', 1),
('steam:110000105195A9A', 1),
('steam:11000010533A4E9', 1),
('steam:1100001053DA139', 1),
('steam:1100001054CDA0A', 1),
('steam:1100001055A69E5', 1),
('steam:110000105622120', 1),
('steam:1100001058E2E0B', 1),
('steam:11000010599af76', 1),
('steam:110000105AEF513', 1),
('steam:11000010607A33F', 1),
('steam:1100001062A4BC0', 1),
('steam:1100001067B5CB1', 1),
('steam:1100001069D5BCA', 1),
('steam:110000106D822B9', 1),
('steam:110000107102B2C', 1),
('steam:1100001071DD617', 1),
('steam:11000010751313C', 1),
('steam:110000107580724', 1),
('steam:110000107ACB0E8', 1),
('steam:110000107B0EB62', 1),
('steam:110000107C76C74', 1),
('steam:110000107F3F84F', 1),
('steam:11000010882162B', 1),
('steam:110000108E433DB', 1),
('steam:1100001090A54B5', 1),
('steam:1100001092EFD99', 1),
('steam:1100001093C8C5B', 1),
('steam:11000010964852B', 1),
('steam:110000109653E8F', 1),
('steam:110000109908F60', 1),
('steam:110000109B90292', 1),
('steam:110000109CFE4A6', 1),
('steam:11000010A303BAD', 1),
('steam:11000010A60B009', 1),
('steam:11000010A6E50AC', 1),
('steam:11000010AC432A3', 1),
('steam:11000010AE51845', 1),
('steam:11000010AF9F9C0', 1),
('steam:11000010C174612', 1),
('steam:11000010C393F8B', 1),
('steam:11000010C3BB676', 1),
('steam:11000010D60238D', 1),
('steam:11000010E1C4381', 1),
('steam:11000010E2649E2', 1),
('steam:11000010E343011', 1),
('steam:11000010E694487', 1),
('steam:11000010EE3A2E3', 1),
('steam:11000010FE7C190', 1),
('steam:1100001119C47C3', 1),
('steam:110000111D5D7F4', 1),
('steam:110000112503DB0', 1),
('steam:1100001145A7A54', 1),
('steam:1100001154E70FF', 1),
('steam:110000115A5C87B', 1),
('steam:110000116F9A8D9', 1),
('steam:1100001178004D2', 1),
('steam:110000117CC2152', 1),
('steam:1100001195A047C', 1),
('steam:11000011991E58E', 1);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `coordinates`
--
ALTER TABLE `coordinates`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ems`
--
ALTER TABLE `ems`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`job_id`);

--
-- Index pour la table `modelmenu`
--
ALTER TABLE `modelmenu`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `police`
--
ALTER TABLE `police`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `recolt`
--
ALTER TABLE `recolt`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `raw_id` (`raw_id`),
  ADD KEY `treated_id` (`treated_id`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `field_id` (`field_id`),
  ADD KEY `treatment_id` (`treatment_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `user_inventory`
--
ALTER TABLE `user_inventory`
  ADD PRIMARY KEY (`user_id`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Index pour la table `user_vehicle`
--
ALTER TABLE `user_vehicle`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `user_weapons`
--
ALTER TABLE `user_weapons`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `user_whitelist`
--
ALTER TABLE `user_whitelist`
  ADD PRIMARY KEY (`identifier`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `coordinates`
--
ALTER TABLE `coordinates`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT pour la table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `recolt`
--
ALTER TABLE `recolt`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;
--
-- AUTO_INCREMENT pour la table `user_vehicle`
--
ALTER TABLE `user_vehicle`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT pour la table `user_weapons`
--
ALTER TABLE `user_weapons`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `recolt`
--
ALTER TABLE `recolt`
  ADD CONSTRAINT `recolt_ibfk_1` FOREIGN KEY (`raw_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `recolt_ibfk_2` FOREIGN KEY (`treated_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `recolt_ibfk_3` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`),
  ADD CONSTRAINT `recolt_ibfk_4` FOREIGN KEY (`field_id`) REFERENCES `coordinates` (`id`),
  ADD CONSTRAINT `recolt_ibfk_5` FOREIGN KEY (`treatment_id`) REFERENCES `coordinates` (`id`),
  ADD CONSTRAINT `recolt_ibfk_6` FOREIGN KEY (`seller_id`) REFERENCES `coordinates` (`id`);

--
-- Contraintes pour la table `user_inventory`
--
ALTER TABLE `user_inventory`
  ADD CONSTRAINT `user_inventory_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
