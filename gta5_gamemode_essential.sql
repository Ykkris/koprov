-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mar 23 Mai 2017 à 18:33
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
(27, 2885.8059, 4386.5258, 50.7359, 'Vente mineur');

-- --------------------------------------------------------

--
-- Structure de la table `interiors`
--

CREATE TABLE `interiors` (
  `id` int(11) NOT NULL COMMENT 'key id',
  `enter` text NOT NULL COMMENT 'enter coords',
  `exit` text NOT NULL COMMENT 'destination coords',
  `iname` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `interiors`
--

INSERT INTO `interiors` (`id`, `enter`, `exit`, `iname`) VALUES
(1, '{-772.954,312.134,85.6981,130}', '{-781.833,326.111,176.804,240}', 'Appartement'),
(2, '{-428.778,1111.61,327.689,130}', '{136.172,-761.371,242.152,260}', 'Gouvernement');

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
(17, 'Soupe poisson', 0, 0, 30, 0),
(18, 'Pétrole', 0, 0, 30, 0),
(19, 'Essence', 0, 0, 30, 0),
(20, 'Bouteille d\'eau', 5, 1, 10, 0),
(21, 'Sandwich', 8, 2, 10, 0);

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
(1, 'Chômeur', 0),
(2, 'Police', 500),
(3, 'Médecin', 500),
(4, 'Dépanneur', 500),
(5, 'Mineur', 0),
(6, 'Illegal', 0),
(7, 'Bûcheron', 0),
(8, 'Pêcheur', 0),
(9, 'Taxis', 400);

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
  `identifier` varchar(50) DEFAULT NULL,
  `model` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT 'a_m_m_acult_01',
  `percing` int(11) NOT NULL DEFAULT '1',
  `percing_txt` int(11) NOT NULL DEFAULT '1',
  `glasses` int(11) NOT NULL DEFAULT '1',
  `glasses_txt` int(11) NOT NULL DEFAULT '1',
  `helmet` int(11) NOT NULL DEFAULT '1',
  `helmet_txt` int(11) NOT NULL DEFAULT '1',
  `mask` int(11) NOT NULL DEFAULT '0',
  `mask_txt` int(11) NOT NULL DEFAULT '0',
  `mpmodel` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
('steam:110000101f91cd2', 'Recrue'),
('steam:110000103536d2e', 'Recrue'),
('steam:1100001041c6ab2', 'Recrue'),
('steam:110000107acb0e8', 'Recrue'),
('steam:110000107c76c74', 'Recrue'),
('steam:110000108e433db', 'Recrue');

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
(2, 5, 6, 6, 70, 10, 11, 12, 'Vente Coca 1'),
(3, 10, 11, 6, 100, 7, 8, 9, 'Easter egg bêta event'),
(4, 7, 8, 6, 40, 13, 14, 15, 'Vente Cannabis 1'),
(5, 12, 13, 6, 55, 16, 17, 18, 'Vente ecstasy 1'),
(6, 14, 15, 6, 80, 19, 20, 21, 'Vente de cadavres 1'),
(7, 16, 17, 8, 16, 22, 23, 24, 'Vente poisson'),
(8, 18, 19, 5, 10, 25, 26, 27, 'Vente mineur');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `ID` int(32) NOT NULL,
  `identifier` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `first_name` varchar(50) NOT NULL DEFAULT '',
  `last_name` varchar(50) NOT NULL DEFAULT '',
  `age` varchar(50) NOT NULL,
  `matricule` varchar(50) NOT NULL DEFAULT '',
  `phone` varchar(50) NOT NULL DEFAULT '',
  `gender` varchar(50) NOT NULL DEFAULT '',
  `group` varchar(50) NOT NULL DEFAULT '0',
  `permission_level` int(11) NOT NULL DEFAULT '0',
  `skin` longtext,
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
  `contacts` text NOT NULL,
  `sms` text NOT NULL,
  `batterie` varchar(50) NOT NULL DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`ID`, `identifier`, `first_name`, `last_name`, `age`, `matricule`, `phone`, `gender`, `group`, `permission_level`, `skin`, `money`, `bankbalance`, `lastpos`, `job`, `dirty_money`, `dirty_time`, `dirty_wait_money`, `intervention`, `enService`, `phone_number`, `contacts`, `sms`, `batterie`) VALUES
(15, 'steam:110000101f91cd2', 'Peter', 'Patasel', '', '555-999', '', '', 'owner', 4, '{"arms":5,"pants_1":16,"face":2,"decals_2":0,"skin":0,"beard_4":0,"beard_3":0,"glasses_2":0,"helmet_2":0,"hair_color_2":0,"helmet_1":21,"beard_1":0,"torso_1":17,"decals_1":0,"pants_2":3,"torso_2":0,"shoes":5,"glasses_1":0,"tshirt_1":15,"hair_1":2,"hair_color_1":9,"sex":0,"beard_2":0,"tshirt_2":0,"hair_2":4}', 0, 5999, '{29.6968574523926, -1351.37731933594,  29.3377952575684, 150.030166625977}', 2, 0, '10', 0, 0, 0, '555-8032', '', '@sms', '100'),
(16, 'steam:110000107c76c74', '', '', '', '', '', '', 'user', 0, '{"beard_1":0,"torso_2":0,"decals_2":0,"sex":0,"tshirt_2":0,"skin":0,"hair_1":11,"decals_1":0,"pants_2":0,"beard_3":0,"glasses_1":0,"torso_1":55,"glasses_2":0,"hair_2":0,"helmet_2":0,"beard_2":0,"beard_4":0,"helmet_1":8,"arms":41,"pants_1":0,"hair_color_1":12,"tshirt_1":55,"hair_color_2":0,"face":8,"shoes":1}', 6230, 6919, '{458.005462646484, -990.918518066406,  30.6896018981934, 260.857604980469}', 3, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(17, 'steam:110000101889e5e', 'Nicolas', 'Delpra', '', '555-888', '', '', 'owner', 4, '{"tshirt_1":15,"tshirt_2":0,"shoes":38,"decals_2":0,"glasses_2":0,"beard_4":0,"torso_1":70,"pants_2":0,"pants_1":1,"decals_1":0,"helmet_1":13,"torso_2":4,"beard_2":10,"helmet_2":0,"hair_2":0,"beard_3":0,"sex":0,"glasses_1":0,"beard_1":18,"skin":0,"face":0,"hair_color_1":0,"hair_1":6,"arms":14,"hair_color_2":0}', 613, 2100, '{-326.689147949219, -979.752563476563,  31.0806140899658, 346.939636230469}', 9, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(18, 'steam:110000100ce9487', '', '', '', '', '', '', 'user', 0, '{"torso_2":0,"pants_1":37,"beard_1":11,"tshirt_1":23,"hair_color_1":0,"arms":6,"sex":0,"hair_2":0,"face":4,"helmet_1":8,"hair_1":15,"decals_1":0,"decals_2":0,"glasses_2":2,"beard_2":7,"shoes":10,"skin":4,"tshirt_2":1,"pants_2":2,"helmet_2":0,"hair_color_2":0,"glasses_1":23,"beard_4":0,"beard_3":0,"torso_1":4}', 91, 8400, '{-1640.17712402344, -835.646362304688,  9.32129955291748, 318.615417480469}', 6, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(19, 'steam:110000107acb0e8', '', '', '', '', '', '', 'user', 0, '{"decals_2":0,"tshirt_2":0,"torso_2":2,"hair_2":0,"glasses_2":0,"hair_1":5,"sex":0,"pants_1":0,"hair_color_1":0,"arms":0,"torso_1":0,"hair_color_2":0,"decals_1":0,"glasses_1":8,"tshirt_1":0,"beard_1":0,"helmet_2":0,"beard_2":0,"pants_2":1,"skin":0,"face":0,"beard_4":0,"shoes":48,"helmet_1":11,"beard_3":0}', 470, 3769, '{303.651519775391, -1443.19738769531,  29.7937908172607, 107.80061340332}', 2, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(20, 'steam:110000107f3f84f', '', '', '', '', '', '', 'user', 0, '{"face":0,"hair_2":0,"glasses_2":0,"glasses_1":0,"beard_1":7,"decals_2":0,"sex":0,"tshirt_2":0,"hair_color_2":0,"pants_2":0,"shoes":10,"tshirt_1":0,"beard_2":10,"torso_1":0,"helmet_1":8,"hair_color_1":8,"beard_4":0,"skin":0,"torso_2":2,"decals_1":0,"beard_3":0,"hair_1":1,"arms":0,"pants_1":1,"helmet_2":0}', 634, 225, '{-267.463836669922, -1080.08959960938,  24.1590919494629, 158.882751464844}', 5, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(21, 'steam:110000104bd6595', 'Nicolas', 'Delpra', '', '555-777', '0651727985', 'M', 'user', 0, '{"hair_2":2,"tshirt_1":10,"face":30,"hair_color_2":1,"beard_2":8,"torso_1":20,"decals_2":0,"shoes":38,"beard_4":0,"hair_color_1":2,"beard_3":2,"torso_2":3,"beard_1":10,"helmet_2":0,"arms":4,"pants_1":48,"decals_1":0,"pants_2":0,"sex":0,"glasses_2":2,"helmet_1":13,"tshirt_2":10,"hair_1":3,"glasses_1":5,"skin":16}', 800, -50, '{389.9013671875, -573.1279296875,  28.7094650268555, 324.363616943359}', 9, 0, '0', 0, 0, 0, '555-7600', '@contacts', '@sms', '100'),
(22, 'steam:11000010599af76', '', '', '', '', '', '', 'owner', 4, '{"decals_2":0,"skin":0,"torso_2":0,"beard_4":0,"helmet_2":0,"shoes":9,"tshirt_2":0,"hair_1":5,"pants_1":23,"arms":1,"beard_1":18,"hair_color_1":2,"sex":0,"pants_2":4,"helmet_1":8,"hair_2":0,"torso_1":12,"hair_color_2":0,"glasses_1":0,"beard_3":0,"beard_2":10,"decals_1":0,"face":13,"glasses_2":0,"tshirt_1":15}', 5010, 0, '{363.164306640625, -1457.86071777344,  37.5059127807617, 110.71312713623}', 3, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(23, 'steam:110000103de0cb5', '', '', '', '', '', '', 'user', 0, '{"glasses_2":0,"beard_1":29,"shoes":1,"glasses_1":0,"torso_2":0,"pants_1":5,"arms":2,"hair_color_1":0,"beard_3":3,"hair_color_2":0,"helmet_1":0,"tshirt_1":1,"face":2,"hair_1":14,"decals_1":0,"decals_2":0,"helmet_2":0,"beard_4":6,"torso_1":0,"hair_2":3,"sex":0,"beard_2":10,"skin":1,"pants_2":2,"tshirt_2":5}', 0, 500, '{20.2024993896484, -1106.47998046875,  29.7970180511475, 0}', 1, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(24, 'steam:110000101d96ca9', '', '', '', '', '', '', 'user', 0, '{"arms":0,"decals_1":0,"hair_color_2":1,"pants_1":55,"beard_3":27,"hair_2":0,"tshirt_2":0,"torso_1":0,"face":12,"torso_2":7,"glasses_1":5,"beard_2":10,"tshirt_1":0,"decals_2":0,"skin":1,"glasses_2":1,"sex":0,"beard_1":11,"pants_2":1,"shoes":46,"hair_color_1":2,"beard_4":2,"hair_1":6,"helmet_1":8,"helmet_2":0}', 0, 800, '{292.681518554688, 320.793121337891,  105.658561706543, 57.349494934082}', 6, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(25, 'steam:1100001017c21ee', '', '', '', '', '', '', 'user', 0, '{"decals_1":0,"skin":34,"beard_2":6,"hair_color_1":3,"beard_4":0,"arms":0,"glasses_1":11,"glasses_2":0,"beard_1":18,"pants_2":0,"helmet_2":0,"tshirt_2":0,"decals_2":0,"helmet_1":8,"torso_1":75,"beard_3":0,"hair_1":2,"pants_1":48,"face":43,"shoes":1,"tshirt_1":0,"hair_2":4,"torso_2":0,"sex":0,"hair_color_2":4}', 191, 500, '{-290.255920410156, 2839.85693359375,  54.6931457519531, 329.276733398438}', 6, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(26, 'steam:1100001010bf4c6', '', '', '', '', '', '', 'user', 0, '{"hair_2":0,"tshirt_2":0,"beard_2":10,"helmet_1":2,"tshirt_1":0,"beard_3":0,"skin":3,"shoes":4,"torso_1":0,"arms":0,"beard_4":0,"torso_2":0,"hair_1":8,"sex":0,"pants_1":1,"helmet_2":0,"hair_color_1":0,"hair_color_2":0,"decals_1":0,"beard_1":11,"decals_2":0,"face":3,"pants_2":0,"glasses_2":0,"glasses_1":0}', 998, 0, '{-1581.41796875, -2404.81884765625,  5.13970947265625, 142.660125732422}', 6, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(27, 'steam:11000010c24e8fe', '', '', '', '', '', '', 'user', 0, '{"beard_3":0,"shoes":0,"decals_2":0,"tshirt_2":0,"hair_2":0,"helmet_1":0,"face":0,"sex":1,"pants_1":0,"glasses_2":0,"skin":0,"beard_4":0,"beard_2":0,"decals_1":0,"hair_color_2":0,"hair_1":0,"pants_2":0,"torso_2":0,"helmet_2":0,"arms":0,"glasses_1":0,"tshirt_1":0,"torso_1":0,"beard_1":0,"hair_color_1":0}', 500, 0, '{-1037.74133, -2738.0571,  20.16929, 142.503463745117}', 1, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(28, 'steam:11000010d60238d', '', '', '', '', '', '', 'user', 0, '{"arms":1,"tshirt_1":4,"hair_1":2,"pants_2":1,"hair_color_1":8,"face":0,"glasses_1":3,"hair_2":0,"beard_3":0,"tshirt_2":0,"glasses_2":0,"shoes":9,"beard_2":9,"helmet_1":58,"helmet_2":0,"torso_1":122,"decals_2":0,"skin":0,"hair_color_2":0,"torso_2":9,"decals_1":0,"beard_1":7,"pants_1":24,"beard_4":0,"sex":0}', 4500, 2988, '{-143.067123413086, -1732.61450195313,  29.7187118530273, 120.468605041504}', 6, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(29, 'steam:110000106d822b9', '', '', '', '', '', '', 'user', 0, '{"torso_2":1,"skin":7,"tshirt_1":15,"helmet_2":0,"helmet_1":39,"beard_4":0,"beard_2":10,"hair_color_2":0,"hair_color_1":0,"tshirt_2":0,"shoes":10,"beard_1":3,"decals_1":0,"pants_1":3,"face":17,"glasses_1":0,"decals_2":0,"hair_1":8,"arms":1,"glasses_2":0,"sex":0,"hair_2":0,"pants_2":2,"torso_1":107,"beard_3":0}', 4842, 3550, '{302.479553222656, -1444.40905761719,  29.7925758361816, 259.879150390625}', 6, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(30, 'steam:1100001041c6ab2', '', '', '', '', '', '', 'user', 0, '{"beard_4":7,"beard_1":18,"hair_color_2":0,"beard_2":10,"pants_1":4,"decals_1":0,"hair_2":0,"hair_color_1":13,"decals_2":0,"glasses_1":2,"torso_1":11,"helmet_2":0,"skin":0,"pants_2":0,"helmet_1":8,"face":12,"arms":0,"beard_3":14,"glasses_2":0,"tshirt_1":6,"torso_2":0,"sex":0,"hair_1":2,"shoes":10,"tshirt_2":2}', 5475, 5209, '{369.509063720703, -1049.55261230469,  28.9002628326416, 279.140655517578}', 2, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(31, 'steam:110000100e840de', '', '', '', '', '', '', 'user', 0, '{"hair_color_1":2,"tshirt_1":0,"sex":0,"shoes":4,"torso_1":0,"helmet_1":21,"hair_2":0,"glasses_1":4,"beard_3":0,"decals_1":0,"helmet_2":0,"skin":6,"hair_1":18,"tshirt_2":0,"beard_4":0,"torso_2":3,"arms":0,"beard_1":0,"pants_2":4,"hair_color_2":0,"decals_2":0,"glasses_2":0,"face":17,"beard_2":0,"pants_1":5}', 0, 6878, '{-3026.06372070313, 355.397644042969,  13.9391574859619, 141.80842590332}', 6, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(32, 'steam:110000108e433db', '', '', '', '', '', '', 'user', 0, '{"skin":17,"arms":0,"beard_2":10,"sex":0,"hair_2":0,"helmet_1":4,"pants_2":0,"tshirt_1":14,"hair_color_2":4,"glasses_2":0,"helmet_2":0,"torso_1":37,"beard_4":2,"beard_3":4,"shoes":7,"face":20,"tshirt_2":0,"glasses_1":0,"pants_1":9,"hair_color_1":0,"beard_1":19,"decals_2":0,"hair_1":19,"torso_2":0,"decals_1":0}', 500, 0, '{216.058120727539, -1233.49133300781,  28.8692188262939, 176.153793334961}', 5, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(33, 'steam:11000010e343011', '', '', '', '', '', '', 'user', 0, '{"sex":0,"decals_2":0,"beard_4":2,"face":0,"beard_1":14,"glasses_1":10,"tshirt_2":0,"hair_color_2":4,"tshirt_1":75,"helmet_2":0,"torso_1":150,"glasses_2":0,"beard_3":8,"hair_color_1":10,"beard_2":7,"pants_2":0,"pants_1":35,"decals_1":0,"hair_2":4,"shoes":15,"arms":14,"torso_2":0,"helmet_1":37,"skin":7,"hair_1":2}', 1000, 14230, '{-1336.76245117188, -1287.74389648438,  4.83847904205322, 216.152816772461}', 4, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(34, 'steam:11000010a60b009', '', '', '', '', '', '', 'user', 0, NULL, 706, 0, '{2890.11376953125, 4384.80615234375,  50.2988319396973, 140.288360595703}', 5, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(35, 'steam:110000103536d2e', '', '', '', '', '', '', 'user', 0, '{"helmet_1":10,"hair_1":1,"torso_2":0,"beard_1":10,"hair_color_2":0,"decals_2":0,"beard_4":0,"arms":22,"hair_color_1":0,"hair_2":0,"sex":0,"decals_1":0,"tshirt_1":0,"tshirt_2":0,"glasses_2":0,"skin":5,"torso_1":0,"pants_1":6,"shoes":18,"glasses_1":0,"pants_2":0,"beard_2":10,"face":13,"beard_3":0,"helmet_2":0}', -93, 341, '{-39.683910369873, -932.891906738281,  28.9139652252197, 177.117004394531}', 7, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(36, 'steam:1100001067b5cb1', '', '', '', '', '', '', 'user', 0, '{"helmet_2":0,"glasses_1":4,"hair_2":0,"arms":1,"hair_1":2,"helmet_1":11,"skin":5,"sex":0,"torso_2":0,"decals_2":0,"hair_color_1":10,"torso_1":4,"decals_1":2,"hair_color_2":0,"tshirt_2":1,"tshirt_1":3,"beard_3":7,"beard_4":0,"beard_2":9,"pants_1":4,"shoes":10,"beard_1":7,"pants_2":1,"glasses_2":0,"face":4}', 62, 1700, '{401.314147949219, -1609.84533691406,  29.3351993560791, 126.486053466797}', 4, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(37, 'steam:1100001019b2b4d', '', '', '', '', '', '', 'user', 0, '{"face":7,"pants_1":13,"tshirt_1":13,"helmet_2":0,"arms":1,"hair_color_1":14,"beard_3":7,"tshirt_2":0,"decals_1":0,"glasses_1":5,"sex":0,"beard_4":0,"decals_2":0,"skin":0,"pants_2":1,"helmet_1":12,"torso_1":4,"glasses_2":0,"beard_2":10,"torso_2":0,"hair_2":1,"shoes":10,"hair_color_2":0,"beard_1":12,"hair_1":1}', 0, 2799, '{397.205932617188, -1615.8955078125,  29.2919483184814, 125.633193969727}', 9, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(38, 'steam:11000010ae51845', '', '', '', '', '', '', 'user', 0, '{"torso_2":0,"tshirt_2":10,"arms":0,"helmet_2":0,"torso_1":13,"beard_2":0,"sex":0,"hair_color_2":0,"tshirt_1":6,"decals_2":0,"hair_color_1":3,"pants_1":25,"face":0,"skin":0,"glasses_1":0,"decals_1":0,"hair_2":0,"helmet_1":8,"pants_2":1,"glasses_2":0,"beard_4":0,"beard_3":0,"hair_1":19,"shoes":10,"beard_1":0}', 600, 2229, '{-262.211486816406, -976.511962890625,  31.2195606231689, 318.665191650391}', 6, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(39, 'steam:110000104b8154b', '', '', '', '', '', '', 'user', 0, '{"glasses_1":0,"hair_color_2":0,"torso_1":0,"torso_2":0,"tshirt_1":0,"beard_2":0,"glasses_2":0,"helmet_1":0,"shoes":0,"tshirt_2":0,"beard_3":0,"hair_1":0,"helmet_2":0,"skin":1,"face":10,"decals_2":0,"pants_2":0,"beard_4":0,"pants_1":0,"hair_color_1":0,"sex":0,"arms":0,"decals_1":0,"beard_1":0,"hair_2":0}', 1442, 0, '{-439.537170410156, 5375.52783203125,  80.1675415039063, 339.577484130859}', 7, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(40, 'steam:110000111d5d7f4', '', '', '', '', '', '', 'user', 0, '{"shoes":10,"sex":0,"decals_1":0,"skin":21,"beard_4":3,"tshirt_2":0,"arms":4,"beard_1":18,"pants_2":0,"glasses_1":0,"glasses_2":3,"beard_3":8,"hair_color_2":0,"beard_2":8,"hair_2":3,"hair_color_1":8,"torso_2":0,"pants_1":24,"helmet_1":8,"hair_1":19,"face":4,"tshirt_1":21,"torso_1":142,"helmet_2":0,"decals_2":0}', 300, 500, '{318.640838623047, -1472.80053710938,  46.5095252990723, 211.402297973633}', 6, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(41, 'steam:1100001093c8c5b', '', '', '', '', '', '', 'user', 0, '{"beard_3":0,"shoes":15,"beard_2":10,"arms":1,"pants_2":0,"hair_1":0,"helmet_2":0,"glasses_2":2,"sex":0,"tshirt_2":2,"skin":0,"torso_1":142,"face":43,"glasses_1":5,"helmet_1":50,"hair_2":0,"decals_1":0,"pants_1":13,"beard_1":0,"decals_2":0,"tshirt_1":12,"hair_color_2":0,"beard_4":0,"hair_color_1":0,"torso_2":0}', 3264, 6703, '{298.714202880859, -1451.65515136719,  29.1846504211426, 315.426544189453}', 6, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(42, 'steam:11000010607a33f', '', '', '', '', '', '', 'user', 0, '{"decals_1":0,"hair_color_2":0,"beard_2":0,"tshirt_2":0,"glasses_1":0,"beard_4":0,"sex":0,"glasses_2":0,"tshirt_1":5,"beard_1":0,"pants_2":0,"helmet_2":0,"decals_2":0,"hair_2":0,"torso_1":5,"skin":4,"torso_2":2,"arms":15,"pants_1":4,"shoes":14,"beard_3":0,"hair_1":0,"helmet_1":15,"hair_color_1":0,"face":8}', 0, 2744, '{-1647.49890136719, -1041.89233398438,  4.55051183700562, 235.139282226563}', 6, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(43, 'steam:1100001145a7a54', '', '', '', '', '', '', 'user', 0, '{"beard_4":0,"decals_1":0,"hair_1":4,"hair_2":1,"pants_1":4,"sex":0,"beard_3":0,"glasses_1":0,"decals_2":0,"face":10,"torso_1":6,"hair_color_1":2,"tshirt_2":0,"hair_color_2":0,"skin":10,"arms":2,"shoes":1,"pants_2":0,"helmet_1":8,"glasses_2":0,"beard_1":1,"beard_2":9,"torso_2":0,"helmet_2":0,"tshirt_1":10}', 120, 1600, '{156.483108520508, -1039.46240234375,  28.8626556396484, 156.196365356445}', 5, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(44, 'steam:110000102756417', '', '', '', '', '', '', 'user', 0, '{"shoes":7,"torso_2":2,"decals_1":12,"skin":5,"hair_2":5,"hair_color_2":0,"torso_1":3,"face":6,"arms":6,"pants_2":0,"pants_1":1,"beard_1":6,"beard_2":10,"beard_4":4,"tshirt_2":0,"decals_2":0,"beard_3":6,"glasses_1":15,"helmet_2":0,"sex":0,"hair_color_1":5,"tshirt_1":4,"glasses_2":1,"helmet_1":66,"hair_1":3}', 1700, 0, '{-225.569046020508, -958.501708984375,  29.1410789489746, 161.014419555664}', 9, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(45, 'steam:1100001012fa921', '', '', '', '', '', '', 'user', 0, '{"hair_color_1":3,"decals_1":0,"glasses_2":0,"helmet_2":0,"skin":0,"hair_1":11,"beard_2":10,"beard_1":5,"shoes":4,"torso_1":4,"decals_2":0,"sex":0,"tshirt_2":1,"beard_3":0,"hair_2":4,"arms":1,"face":19,"tshirt_1":3,"torso_2":0,"pants_1":0,"pants_2":0,"helmet_1":8,"glasses_1":0,"beard_4":0,"hair_color_2":0}', 0, 3819, '{534.164978027344, 2388.6220703125,  48.5159797668457, 290.816650390625}', 9, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(46, 'steam:1100001062a4bc0', '', '', '', '', '', '', 'user', 0, '{"hair_2":0,"arms":5,"beard_1":18,"decals_2":0,"face":42,"glasses_1":6,"tshirt_2":0,"decals_1":0,"skin":1,"pants_2":0,"beard_3":0,"beard_4":0,"torso_2":0,"helmet_1":65,"beard_2":10,"hair_color_2":0,"tshirt_1":15,"helmet_2":0,"torso_1":1,"glasses_2":0,"pants_1":4,"hair_color_1":4,"shoes":4,"sex":0,"hair_1":2}', 734, -100, '{-1948.33801269531, 406.235717773438,  96.5070571899414, 190.20002746582}', 6, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(47, 'steam:110000109b90292', '', '', '', '', '', '', 'user', 0, '{"skin":0,"beard_4":0,"shoes":4,"face":0,"hair_color_2":0,"decals_1":0,"glasses_2":0,"sex":0,"helmet_2":0,"torso_1":62,"pants_1":4,"hair_2":0,"beard_3":6,"beard_2":10,"pants_2":0,"arms":0,"beard_1":10,"torso_2":0,"tshirt_1":16,"tshirt_2":0,"hair_color_1":7,"decals_2":0,"glasses_1":5,"hair_1":10,"helmet_1":8}', 800, 0, '{1706.04223632813, 1522.11560058594,  84.9044647216797, 171.246963500977}', 7, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(48, 'steam:1100001053da139', '', '', '', '', '', '', 'user', 0, '{"beard_2":10,"decals_2":0,"beard_1":10,"helmet_2":0,"pants_2":0,"shoes":12,"beard_3":0,"glasses_1":8,"hair_color_2":2,"decals_1":0,"skin":0,"arms":8,"beard_4":0,"pants_1":4,"glasses_2":0,"tshirt_1":11,"hair_2":0,"hair_1":2,"tshirt_2":2,"torso_1":35,"sex":0,"face":0,"hair_color_1":3,"torso_2":0,"helmet_1":8}', 771, 0, '{308.912872314453, -783.012451171875,  29.3368339538574, 160.681213378906}', 7, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(49, 'steam:110000116f9a8d9', '', '', '', '', '', '', 'user', 0, '{"face":32,"sex":0,"hair_2":1,"torso_2":3,"glasses_1":0,"shoes":8,"tshirt_1":0,"beard_1":7,"helmet_1":8,"beard_2":10,"decals_2":0,"beard_4":0,"arms":6,"torso_1":23,"glasses_2":0,"tshirt_2":0,"decals_1":0,"helmet_2":0,"hair_color_2":0,"hair_1":14,"hair_color_1":3,"pants_1":8,"pants_2":0,"beard_3":0,"skin":4}', 500, 0, '{913.996643066406, -166.762588500977,  74.3341445922852, 207.031448364258}', 9, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(50, 'steam:11000010fe7c190', '', '', '', '', '', '', 'user', 0, '{"tshirt_2":0,"helmet_1":0,"glasses_2":0,"beard_2":0,"hair_2":0,"hair_color_2":0,"pants_2":0,"decals_1":0,"beard_3":0,"decals_2":0,"beard_1":0,"pants_1":0,"hair_1":0,"hair_color_1":0,"sex":0,"glasses_1":0,"shoes":0,"arms":0,"tshirt_1":0,"face":0,"beard_4":0,"torso_2":0,"skin":0,"torso_1":0,"helmet_2":0}', 1100, 0, '{1370.73120117188, 1626.31103515625,  100.681030273438, 176.298217773438}', 5, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(51, 'steam:11000010ac432a3', '', '', '', '', '', '', 'user', 0, '{"decals_1":0,"helmet_2":0,"tshirt_2":0,"hair_color_2":4,"pants_2":0,"torso_2":1,"helmet_1":5,"glasses_2":3,"glasses_1":5,"skin":5,"pants_1":10,"decals_2":0,"arms":0,"beard_4":3,"tshirt_1":6,"hair_2":4,"shoes":10,"sex":0,"beard_1":10,"torso_1":11,"hair_1":8,"hair_color_1":0,"face":8,"beard_3":15,"beard_2":8}', 980, 0, '{-430.606567382813, -2273.50732421875,  7.6081805229187, 272.385681152344}', 8, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(52, 'steam:11000010079d096', '', '', '', '', '', '', 'user', 0, '{"sex":0,"face":44,"helmet_2":0,"decals_2":0,"tshirt_1":22,"glasses_1":9,"tshirt_2":4,"shoes":3,"skin":0,"hair_1":4,"arms":1,"torso_1":11,"hair_color_2":0,"beard_3":0,"pants_1":7,"beard_4":0,"beard_2":10,"glasses_2":4,"torso_2":1,"pants_2":0,"decals_1":0,"hair_2":0,"helmet_1":12,"hair_color_1":0,"beard_1":2}', 136, 0, '{378.05712890625, -1620.45288085938,  29.2919292449951, 284.006927490234}', 4, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(53, 'steam:1100001055a69e5', '', '', '', '', '', '', 'user', 0, '{"shoes":20,"hair_color_1":2,"hair_color_2":2,"beard_3":0,"glasses_1":8,"glasses_2":3,"decals_1":0,"beard_2":4,"helmet_1":8,"arms":1,"tshirt_2":7,"pants_2":1,"torso_2":11,"beard_4":0,"pants_1":1,"hair_1":19,"beard_1":7,"skin":1,"torso_1":6,"tshirt_1":11,"helmet_2":0,"face":42,"sex":0,"hair_2":4,"decals_2":0}', 300, 0, '{421.911926269531, 1221.17639160156,  253.694046020508, 170.755615234375}', 1, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(54, 'steam:1100001009af64c', '', '', '', '', '', '', 'user', 0, '{"torso_1":0,"beard_1":0,"face":0,"tshirt_1":0,"torso_2":0,"beard_2":0,"sex":0,"shoes":0,"hair_color_2":0,"helmet_1":0,"hair_2":0,"decals_2":0,"hair_1":0,"glasses_1":0,"beard_3":0,"skin":0,"pants_1":0,"pants_2":0,"decals_1":0,"hair_color_1":0,"helmet_2":0,"glasses_2":0,"arms":0,"beard_4":0,"tshirt_2":0}', 464, 0, '{-693.659301757813, -4702.416015625,  -0.729181051254272, 182.331192016602}', 8, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(55, 'steam:110000102cd23b4', '', '', '', '', '', '', 'user', 0, '{"arms":0,"helmet_2":0,"skin":19,"beard_3":0,"hair_color_2":0,"hair_2":2,"shoes":24,"torso_2":0,"sex":0,"face":20,"hair_color_1":0,"beard_2":10,"tshirt_1":32,"torso_1":59,"beard_1":18,"beard_4":0,"helmet_1":12,"glasses_1":23,"decals_1":0,"hair_1":14,"pants_2":9,"decals_2":0,"tshirt_2":12,"pants_1":7,"glasses_2":0}', 47, 2000, '{-265.593811035156, -962.587524414063,  31.2231216430664, 22.2284698486328}', 7, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(56, 'steam:110000109cfe4a6', '', '', '', '', '', '', 'user', 0, '{"decals_1":6,"tshirt_2":0,"hair_color_2":0,"glasses_2":0,"hair_2":0,"torso_1":3,"skin":0,"helmet_2":0,"torso_2":0,"helmet_1":8,"beard_1":0,"face":33,"beard_3":0,"tshirt_1":8,"pants_1":0,"hair_color_1":9,"glasses_1":0,"shoes":1,"arms":1,"hair_1":13,"pants_2":0,"decals_2":0,"beard_2":0,"sex":0,"beard_4":0}', 0, 800, '{353.751861572266, -2178.02734375,  13.3986225128174, 234.663101196289}', 5, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(57, 'steam:110000107580724', '', '', '', '', '', '', 'user', 0, '{"beard_3":0,"torso_2":2,"hair_2":0,"hair_color_2":0,"pants_2":0,"beard_1":0,"glasses_2":0,"sex":1,"beard_4":0,"skin":12,"helmet_1":61,"tshirt_2":12,"hair_1":4,"torso_1":6,"arms":1,"beard_2":0,"decals_1":0,"hair_color_1":6,"helmet_2":0,"tshirt_1":39,"decals_2":0,"face":25,"shoes":6,"pants_1":34,"glasses_1":6}', 500, 1638, '{2886.71313476563, 4383.908203125,  50.3936462402344, 14.379955291748}', 5, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(58, 'steam:11000010304f5ce', '', '', '', '', '', '', 'user', 0, '{"hair_color_1":0,"hair_color_2":0,"torso_2":4,"hair_2":0,"sex":0,"tshirt_2":0,"decals_2":0,"pants_2":17,"beard_3":0,"glasses_2":1,"skin":7,"helmet_1":11,"decals_1":0,"hair_1":0,"arms":5,"glasses_1":18,"beard_2":0,"face":44,"shoes":6,"tshirt_1":15,"beard_1":0,"beard_4":0,"pants_1":69,"helmet_2":0,"torso_1":36}', 800, 0, '{2885.4345703125, 4384.89306640625,  50.6242637634277, 268.346374511719}', 5, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(59, 'steam:110000103ca319b', '', '', '', '', '', '', 'user', 0, '{"face":44,"shoes":1,"decals_2":0,"glasses_2":0,"pants_2":4,"hair_color_1":0,"hair_1":11,"torso_1":59,"helmet_2":0,"decals_1":0,"tshirt_1":12,"arms":1,"beard_1":10,"torso_2":2,"beard_2":9,"skin":0,"pants_1":0,"beard_4":0,"hair_2":2,"beard_3":0,"tshirt_2":3,"hair_color_2":0,"helmet_1":8,"glasses_1":0,"sex":0}', 5, 1100, '{-1152.2060546875, 1007.21826171875,  204.018295288086, 347.415313720703}', 6, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(60, 'steam:1100001000cf976', '', '', '', '', '', '', 'user', 0, '{"beard_3":0,"helmet_1":11,"face":4,"glasses_2":0,"beard_2":6,"shoes":1,"beard_4":0,"torso_2":4,"hair_1":10,"torso_1":7,"skin":11,"hair_color_1":4,"decals_2":0,"hair_color_2":0,"hair_2":5,"arms":0,"beard_1":27,"pants_1":0,"glasses_1":0,"tshirt_1":0,"sex":0,"pants_2":0,"helmet_2":0,"decals_1":0,"tshirt_2":0}', 480, 0, '{187.487487792969, -1378.29187011719,  28.5168724060059, 177.100723266602}', 5, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(61, 'steam:11000010c393f8b', '', '', '', '', '', '', 'user', 0, '{"beard_1":0,"helmet_1":8,"arms":0,"hair_color_2":0,"tshirt_1":4,"glasses_2":0,"tshirt_2":0,"glasses_1":0,"face":17,"hair_2":3,"torso_1":0,"skin":0,"decals_1":0,"beard_4":0,"sex":0,"pants_2":0,"helmet_2":0,"decals_2":0,"torso_2":2,"shoes":15,"beard_2":0,"pants_1":20,"hair_1":17,"beard_3":0,"hair_color_1":0}', 800, 0, '{-13.9395551681519, -4049.13598632813,  0.304675996303558, 189.286697387695}', 8, 0, '0', 0, 0, 0, NULL, '', '', '100'),
(62, 'steam:110000107102b2c', 'Stanko', 'Novosel', '32', '', '', '', 'user', 0, '{"torso_1":7,"hair_color_1":6,"hair_2":0,"tshirt_1":11,"shoes":8,"arms":0,"torso_2":0,"beard_3":0,"tshirt_2":2,"pants_1":0,"beard_2":10,"beard_1":10,"helmet_2":0,"decals_1":0,"face":2,"hair_1":7,"hair_color_2":0,"decals_2":0,"helmet_1":0,"beard_4":0,"pants_2":0,"glasses_1":0,"skin":4,"sex":0,"glasses_2":0}', 99169627, 6000, '{1494.41711425781, 2146.67919921875,  88.0159378051758, 358.471099853516}', 1, 0, '0', 0, 0, 0, '555-4577', '', '', '100');

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
('steam:1100001000cf976', 16, 0),
('steam:1100001000cf976', 17, 0),
('steam:11000010079d096', 1, 0),
('steam:11000010079d096', 2, 0),
('steam:110000100ce9487', 7, 0),
('steam:110000100ce9487', 8, 0),
('steam:110000100ce9487', 12, 5),
('steam:110000100ce9487', 14, 0),
('steam:110000100ce9487', 15, 6),
('steam:110000100ce9487', 18, 0),
('steam:110000100ce9487', 19, 0),
('steam:110000100e840de', 1, 0),
('steam:110000100e840de', 2, 0),
('steam:110000100e840de', 7, 0),
('steam:110000100e840de', 8, 0),
('steam:110000100e840de', 12, 0),
('steam:110000100e840de', 14, 0),
('steam:110000100e840de', 16, 0),
('steam:110000100e840de', 17, 0),
('steam:110000100e840de', 18, 0),
('steam:110000100e840de', 19, 0),
('steam:1100001010bf4c6', 1, 0),
('steam:1100001010bf4c6', 2, 0),
('steam:1100001010bf4c6', 7, 0),
('steam:1100001010bf4c6', 8, 15),
('steam:1100001010bf4c6', 14, 3),
('steam:1100001010bf4c6', 16, 0),
('steam:1100001010bf4c6', 17, 0),
('steam:1100001012fa921', 1, 0),
('steam:1100001012fa921', 2, 0),
('steam:1100001012fa921', 18, 0),
('steam:1100001012fa921', 19, 0),
('steam:1100001017c21ee', 1, 0),
('steam:1100001017c21ee', 2, 0),
('steam:1100001017c21ee', 16, 0),
('steam:110000101889e5e', 1, 0),
('steam:110000101889e5e', 2, 0),
('steam:110000101889e5e', 18, 0),
('steam:110000101889e5e', 19, 0),
('steam:1100001019b2b4d', 1, 0),
('steam:1100001019b2b4d', 2, 0),
('steam:1100001019b2b4d', 18, 0),
('steam:1100001019b2b4d', 19, 0),
('steam:110000101d96ca9', 1, 0),
('steam:110000101d96ca9', 2, 0),
('steam:110000101d96ca9', 7, 0),
('steam:110000101d96ca9', 8, 0),
('steam:110000101d96ca9', 14, 0),
('steam:110000101d96ca9', 16, 0),
('steam:110000101d96ca9', 17, 0),
('steam:110000101f91cd2', 1, 0),
('steam:110000101f91cd2', 2, 0),
('steam:110000101f91cd2', 7, 0),
('steam:110000101f91cd2', 8, 0),
('steam:110000101f91cd2', 14, 0),
('steam:110000101f91cd2', 15, 0),
('steam:110000101f91cd2', 20, 1),
('steam:110000101f91cd2', 21, 0),
('steam:110000102cd23b4', 1, 0),
('steam:110000102cd23b4', 2, 0),
('steam:110000102cd23b4', 16, 0),
('steam:110000102cd23b4', 17, 0),
('steam:110000102cd23b4', 18, 0),
('steam:110000102cd23b4', 19, 0),
('steam:11000010304f5ce', 18, 0),
('steam:11000010304f5ce', 19, 0),
('steam:110000103536d2e', 1, 0),
('steam:110000103536d2e', 2, 0),
('steam:110000103ca319b', 12, 0),
('steam:110000103ca319b', 13, 0),
('steam:110000104b8154b', 1, 30),
('steam:110000104b8154b', 2, 0),
('steam:110000104b8154b', 16, 0),
('steam:110000104bd6595', 1, 0),
('steam:110000104bd6595', 2, 0),
('steam:110000104bd6595', 18, 0),
('steam:110000104bd6595', 19, 0),
('steam:1100001053da139', 1, 0),
('steam:1100001053da139', 2, 0),
('steam:11000010599af76', 10, 0),
('steam:11000010599af76', 11, 0),
('steam:11000010599af76', 12, 0),
('steam:11000010599af76', 13, 0),
('steam:11000010599af76', 16, 0),
('steam:11000010599af76', 17, 0),
('steam:11000010607a33f', 7, 0),
('steam:11000010607a33f', 8, 0),
('steam:1100001062a4bc0', 16, 0),
('steam:1100001062a4bc0', 18, 0),
('steam:1100001062a4bc0', 19, 0),
('steam:1100001067b5cb1', 1, 0),
('steam:1100001067b5cb1', 2, 0),
('steam:110000106d822b9', 1, 0),
('steam:110000106d822b9', 2, 0),
('steam:110000106d822b9', 7, 0),
('steam:110000106d822b9', 8, 0),
('steam:110000106d822b9', 12, 0),
('steam:110000106d822b9', 13, 0),
('steam:110000106d822b9', 14, 0),
('steam:110000106d822b9', 15, 0),
('steam:110000106d822b9', 16, 0),
('steam:110000106d822b9', 17, 0),
('steam:110000106d822b9', 18, 0),
('steam:110000106d822b9', 19, 0),
('steam:110000107102b2c', 20, 1),
('steam:110000107102b2c', 21, 1),
('steam:110000107580724', 1, 0),
('steam:110000107580724', 2, 0),
('steam:110000107580724', 18, 0),
('steam:110000107580724', 19, 0),
('steam:110000107acb0e8', 1, 0),
('steam:110000107acb0e8', 2, 0),
('steam:110000107acb0e8', 16, 0),
('steam:110000107acb0e8', 17, 0),
('steam:110000107acb0e8', 18, 0),
('steam:110000107acb0e8', 19, 0),
('steam:110000107f3f84f', 1, 0),
('steam:110000107f3f84f', 2, 0),
('steam:110000107f3f84f', 7, 0),
('steam:110000107f3f84f', 8, 0),
('steam:110000107f3f84f', 12, 0),
('steam:110000107f3f84f', 13, 0),
('steam:110000107f3f84f', 14, 0),
('steam:110000107f3f84f', 15, 0),
('steam:1100001093c8c5b', 7, 0),
('steam:1100001093c8c5b', 8, 0),
('steam:1100001093c8c5b', 12, 0),
('steam:1100001093c8c5b', 13, 0),
('steam:1100001093c8c5b', 16, 0),
('steam:1100001093c8c5b', 17, 0),
('steam:1100001093c8c5b', 18, 0),
('steam:1100001093c8c5b', 19, 0),
('steam:110000109b90292', 1, 0),
('steam:110000109b90292', 2, 0),
('steam:110000109cfe4a6', 18, 0),
('steam:110000109cfe4a6', 19, 0),
('steam:11000010a60b009', 18, 0),
('steam:11000010a60b009', 19, 0),
('steam:11000010ac432a3', 16, 0),
('steam:11000010ac432a3', 17, 0),
('steam:11000010ae51845', 7, 0),
('steam:11000010ae51845', 8, 0),
('steam:11000010ae51845', 14, 0),
('steam:11000010ae51845', 15, 0),
('steam:11000010ae51845', 16, 0),
('steam:11000010ae51845', 17, 0),
('steam:11000010ae51845', 18, 0),
('steam:11000010ae51845', 19, 0),
('steam:11000010c393f8b', 1, 0),
('steam:11000010c393f8b', 2, 0),
('steam:11000010c393f8b', 16, 7),
('steam:11000010d60238d', 1, 0),
('steam:11000010d60238d', 2, 0),
('steam:11000010d60238d', 7, 0),
('steam:11000010d60238d', 8, 0),
('steam:11000010d60238d', 12, 0),
('steam:11000010d60238d', 13, 0),
('steam:11000010d60238d', 14, 0),
('steam:11000010d60238d', 15, 0),
('steam:11000010d60238d', 16, 0),
('steam:11000010d60238d', 17, 0),
('steam:11000010d60238d', 18, 0),
('steam:11000010d60238d', 19, 0),
('steam:11000010e343011', 1, 0),
('steam:11000010e343011', 2, 0),
('steam:11000010e343011', 7, 0),
('steam:11000010e343011', 8, 0),
('steam:11000010e343011', 12, 0),
('steam:11000010e343011', 13, 0),
('steam:11000010e343011', 14, 0),
('steam:11000010e343011', 15, 0),
('steam:11000010e343011', 16, 0),
('steam:11000010e343011', 17, 0),
('steam:11000010e343011', 18, 0),
('steam:11000010e343011', 19, 0),
('steam:11000010fe7c190', 18, 0),
('steam:11000010fe7c190', 19, 0),
('steam:110000111d5d7f4', 7, 0),
('steam:110000111d5d7f4', 8, 0),
('steam:110000111d5d7f4', 14, 0),
('steam:110000111d5d7f4', 18, 0),
('steam:110000111d5d7f4', 19, 0),
('steam:1100001145a7a54', 18, 0),
('steam:1100001145a7a54', 19, 0);

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
(86, 'steam:110000100e840de', 'Faggio', 'faggio2', 2000, '42OZR105', 'out', '8', '1', '5', '156'),
(87, 'steam:110000106d822b9', 'Surge', 'surge', 7500, '45PFY741', 'out', '61', '0', '68', '156'),
(88, 'steam:110000101f91cd2', 'Issi', 'issi2', 18000, '29JUS770', 'in', '36', '4', '38', '156'),
(89, 'steam:110000101f91cd2', 'Issi', 'issi2', 18000, '49FGD537', 'four', '34', '0', '28', '156'),
(90, 'steam:110000101f91cd2', 'Blista', 'blista', 10000, '83EWI564', 'four', '7', '0', '5', '156'),
(91, 'steam:110000101f91cd2', '9F', 'ninef', 800000, '29MDL722', 'four', '3', '1', '7', '156'),
(92, 'steam:110000101f91cd2', 'Blista', 'blista', 10000, '26IRN334', 'four', '6', '0', '111', '156'),
(93, 'steam:110000101f91cd2', 'Blista', 'blista', 10000, '26JOR865', 'four', '7', '0', '5', '156'),
(94, 'steam:110000107102b2c', 'Dilettante', 'Dilettante', 6000, '20DID876', 'four', '6', '0', '111', '156'),
(95, 'steam:110000107102b2c', 'JB 700', 'jb700', 820000, '41LLY720', 'four', '4', '0', '111', '156');

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
(5, 'steam:110000106d822b9', 'WEAPON_KnuckleDuster', 4),
(6, 'steam:110000101f91cd2', 'WEAPON_Machete', 8),
(7, 'steam:110000100e840de', 'WEAPON_SwitchBlade', 4),
(8, 'steam:110000100ce9487', 'WEAPON_Hatchet', 9),
(10, 'steam:1100001093c8c5b', 'WEAPON_Ball', 5),
(11, 'steam:1100001012fa921', 'WEAPON_Flashlight', 1),
(12, 'steam:1100001093c8c5b', 'WEAPON_SwitchBlade', 4),
(13, 'steam:110000100e840de', 'WEAPON_SNSPistol', 20),
(14, 'steam:110000100e840de', 'WEAPON_SwitchBlade', 4),
(15, 'steam:110000106d822b9', 'WEAPON_SNSPistol', 20),
(16, 'steam:11000010079d096', 'WEAPON_Pistol', 50),
(17, 'steam:11000010e343011', 'WEAPON_SNSPistol', 20),
(18, 'steam:11000010e343011', 'WEAPON_Flashlight', 1),
(19, 'steam:11000010e343011', 'WEAPON_Snowball', 1),
(20, 'steam:11000010e343011', 'WEAPON_Snowball', 1),
(21, 'steam:11000010e343011', 'WEAPON_Snowball', 1),
(22, 'steam:11000010e343011', 'WEAPON_Snowball', 1),
(23, 'steam:1100001093c8c5b', 'WEAPON_SNSPistol', 20),
(24, 'steam:110000106d822b9', 'WEAPON_Bat', 6),
(25, 'steam:1100001000cf976', 'WEAPON_Knife', 8),
(26, 'steam:110000101f91cd2', 'WEAPON_Pistol', 50);

-- --------------------------------------------------------

--
-- Structure de la table `zones`
--

CREATE TABLE `zones` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL DEFAULT '',
  `x` double NOT NULL DEFAULT '0',
  `y` double NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `zones`
--

INSERT INTO `zones` (`id`, `nom`, `x`, `y`) VALUES
(1, '@name', -71.5884246826172, -2613.5712890625),
(2, 'test', -103.759719848633, -2615.93579101563);

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
-- Index pour la table `interiors`
--
ALTER TABLE `interiors`
  ADD PRIMARY KEY (`id`);

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
-- Index pour la table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT pour la table `interiors`
--
ALTER TABLE `interiors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'key id', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `recolt`
--
ALTER TABLE `recolt`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT pour la table `user_vehicle`
--
ALTER TABLE `user_vehicle`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
--
-- AUTO_INCREMENT pour la table `user_weapons`
--
ALTER TABLE `user_weapons`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT pour la table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
