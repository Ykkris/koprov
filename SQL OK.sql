-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 25 Mai 2017 à 15:01
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
(28, 1502.906, 3922.546, 31.753, 'Recolte Cannabis 2'),
(29, 2337.936, 2570.414, 47.72, 'Traitement Cannabis 2'),
(30, -1639.667, -1054.311, 4.577, 'Vente Cannabis 2'),
(31, -282.418, 2217.632, 130.486, 'Recolte Cocaine 2'),
(32, 1388.827, 3606.078, 38.941, 'Traitement Cocaine 2'),
(33, -2637.629, 1870.471, 160.134, 'Vente Cocaine 2'),
(34, -660.752, 1764.591, 201.268, 'Recolte ecstasy 2'),
(35, 1737.711, -1474.976, 113.942, 'Traitement ecstasy 2'),
(36, 1502.906, 3922.546, 31.753, 'Vente ecstasy 2'),
(37, -1661.626, -149.023, 58.338, 'Recolte cadavre 2'),
(38, 424.175, 6471.444, 35.873, 'Vente cadavre 2');

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
(20, 'Bouteille d\'eau', 5, 1, 20, 0),
(21, 'Sandwich', 8, 2, 10, 0),
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
(1, 'Chômeur', 0),
(2, 'Police', 250),
(3, 'Médecin', 250),
(4, 'Dépanneur', 250),
(5, 'Mineur', 0),
(6, 'Illegal', 0),
(7, 'Bûcheron', 0),
(8, 'Pêcheur', 0),
(9, 'Taxis', 0),
(10, 'Fermier', 0),
(11, 'Journaliste', 250);

-- --------------------------------------------------------

--
-- Structure de la table `medic`
--

CREATE TABLE `medic` (
  `identifier` varchar(255) NOT NULL,
  `rank` varchar(255) NOT NULL DEFAULT 'Recrue'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Structure de la table `police`
--

CREATE TABLE `police` (
  `identifier` varchar(255) NOT NULL,
  `rank` varchar(255) NOT NULL DEFAULT 'Recrue'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(2, 5, 6, 6, 70, 31, 32, 33, 'Vente Coca 1'),
(3, 10, 11, 10, 10, 7, 8, 9, 'Fermier poulet'),
(4, 7, 8, 6, 40, 28, 29, 30, 'Vente Cannabis 1'),
(5, 12, 13, 6, 55, 34, 35, 36, 'Vente ecstasy 1'),
(6, 14, 15, 6, 80, 37, 20, 38, 'Vente de cadavres 1'),
(7, 16, 17, 8, 16, 22, 23, 24, 'Vente poisson'),
(8, 18, 19, 5, 10, 25, 26, 27, 'Vente mineur');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `ID` int(32) NOT NULL,
  `identifier` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
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

-- --------------------------------------------------------

--
-- Structure de la table `user_inventory`
--

CREATE TABLE `user_inventory` (
  `user_id` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `item_id` int(11) UNSIGNED NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
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
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `recolt`
--
-- ALTER TABLE `recolt`
--   ADD CONSTRAINT `recolt_ibfk_1` FOREIGN KEY (`raw_id`) REFERENCES `items` (`id`),
--   ADD CONSTRAINT `recolt_ibfk_2` FOREIGN KEY (`treated_id`) REFERENCES `items` (`id`),
--   ADD CONSTRAINT `recolt_ibfk_3` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`),
--   ADD CONSTRAINT `recolt_ibfk_4` FOREIGN KEY (`field_id`) REFERENCES `coordinates` (`id`),
--   ADD CONSTRAINT `recolt_ibfk_5` FOREIGN KEY (`treatment_id`) REFERENCES `coordinates` (`id`),
--   ADD CONSTRAINT `recolt_ibfk_6` FOREIGN KEY (`seller_id`) REFERENCES `coordinates` (`id`);

--
-- Contraintes pour la table `user_inventory`
--
ALTER TABLE `user_inventory`
  ADD CONSTRAINT `user_inventory_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;