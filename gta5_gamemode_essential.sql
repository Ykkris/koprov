-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Lun 22 Mai 2017 à 08:21
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
(22, -329.66, -4639.384, 3.805, 'Récolte pêche'),
(23, 121.1801, -3103.7897, 6.009, 'Traitement pêche'),
(24, -458.1738, -2265.8498, 8.5158, 'Vente poisson');

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
  `limitation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `items`
--

INSERT INTO `items` (`id`, `libelle`, `limitation`) VALUES
(1, 'Rondin de bois', 30),
(2, 'Planche de bois', 30),
(3, 'Pétrole', 30),
(4, 'Essence', 30),
(5, 'Feuille Coca', 15),
(6, 'Cocaïne pure', 15),
(7, 'Feuille Cannabis', 15),
(8, 'Cannabis', 15),
(10, 'Poulet', 30),
(11, 'Cuisse de poulet', 30),
(12, 'Safrole', 15),
(13, 'MDMA', 15),
(14, 'Cadavre', 15),
(15, 'Poudre d\'os', 15),
(16, 'Poisson', 30),
(17, 'Soupe poisson', 30);

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
-- Structure de la table `outfits`
--

CREATE TABLE `outfits` (
  `identifier` varchar(30) NOT NULL,
  `skin` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT 'mp_m_freemode_01',
  `face` int(11) NOT NULL DEFAULT '0',
  `face_text` int(11) NOT NULL DEFAULT '0',
  `hair` int(11) NOT NULL DEFAULT '0',
  `hair_text` int(11) NOT NULL DEFAULT '0',
  `pants` int(11) NOT NULL DEFAULT '0',
  `pants_text` int(11) NOT NULL DEFAULT '0',
  `shoes` int(11) NOT NULL DEFAULT '0',
  `shoes_text` int(11) NOT NULL DEFAULT '0',
  `torso` int(11) NOT NULL DEFAULT '0',
  `torso_text` int(11) NOT NULL DEFAULT '0',
  `shirt` int(11) NOT NULL DEFAULT '0',
  `shirt_text` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `outfits`
--

INSERT INTO `outfits` (`identifier`, `skin`, `face`, `face_text`, `hair`, `hair_text`, `pants`, `pants_text`, `shoes`, `shoes_text`, `torso`, `torso_text`, `shirt`, `shirt_text`) VALUES
('steam:110000101f91cd2', 'mp_m_freemode_01', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

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
('steam:110000101f91cd2', 'Recrue');

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
(7, 16, 17, 8, 500, 22, 23, 24, 'Vente poisson');

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
  `matricule` int(32) NOT NULL,
  `group` varchar(50) NOT NULL DEFAULT '0',
  `permission_level` int(11) NOT NULL DEFAULT '0',
  `skin` longtext,
  `money` double NOT NULL DEFAULT '0',
  `bankbalance` int(32) DEFAULT '0',
  `lastpos` varchar(255) DEFAULT '{-887.48388671875, -2311.68872070313,  -3.50776553153992, 142.503463745117}',
  `job` int(11) DEFAULT '1',
  `dirty_money` double NOT NULL DEFAULT '0',
  `isFirstConnection` int(11) DEFAULT '1',
  `enService` tinyint(1) NOT NULL DEFAULT '0',
  `contacts` longtext NOT NULL,
  `sms` longtext NOT NULL,
  `phone_number` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`ID`, `identifier`, `first_name`, `last_name`, `age`, `matricule`, `group`, `permission_level`, `skin`, `money`, `bankbalance`, `lastpos`, `job`, `dirty_money`, `isFirstConnection`, `enService`, `contacts`, `sms`, `phone_number`) VALUES
(3, 'steam:11000010599af76', '', '', '', 0, 'user', 0, '{"beard_2":0,"hair_2":0,"pants_2":0,"pants_1":35,"beard_4":0,"helmet_2":0,"face":0,"decals_2":0,"beard_3":0,"beard_1":0,"tshirt_2":0,"torso_1":23,"sex":0,"skin":0,"tshirt_1":21,"torso_2":1,"shoes":21,"hair_1":5,"hair_color_2":0,"decals_1":0,"hair_color_1":0,"glasses_2":2,"helmet_1":8,"arms":33,"glasses_1":5}', 2803040, 61999360, '{-325.620178222656, -4672.46484375,  4.35007762908936, 112.002197265625}', 8, 0, 1, 0, '', '', ''),
(4, 'steam:110000104bd6595', '', '', '', 0, 'user', 0, '{"glasses_1":0,"beard_3":60,"hair_1":4,"helmet_1":0,"sex":0,"shoes":7,"torso_2":2,"face":30,"tshirt_2":5,"torso_1":7,"tshirt_1":0,"pants_2":2,"skin":20,"hair_2":2,"hair_color_2":1,"decals_1":0,"arms":4,"beard_1":10,"pants_1":5,"glasses_2":0,"beard_2":7,"helmet_2":0,"hair_color_1":3,"decals_2":0,"beard_4":7}', 97053589, 10, '{-500.084136962891, 5466.462890625,  80.2827987670898, 6.80106258392334}', 7, 0, 1, 0, '', '', ''),
(5, 'steam:110000101889e5e', '', '', '', 0, 'owner', 6, '{"pants_2":0,"hair_color_1":0,"helmet_1":13,"decals_2":0,"face":0,"tshirt_1":2,"hair_1":6,"shoes":38,"torso_1":64,"decals_1":0,"pants_1":1,"beard_3":0,"beard_4":0,"glasses_2":0,"sex":0,"tshirt_2":2,"beard_1":18,"torso_2":0,"beard_2":10,"hair_2":6,"skin":5,"glasses_1":5,"helmet_2":0,"hair_color_2":0,"arms":18}', 175500, 19800000, '{809.903381347656, -70.7536926269531,  80.2486038208008, 219.060989379883}', 8, 0, 1, 0, '', '', ''),
(6, 'steam:110000107c76c74', '', '', '', 0, 'user', 0, '{"face":4,"pants_1":10,"glasses_1":0,"torso_1":0,"beard_2":0,"hair_color_1":12,"glasses_2":0,"tshirt_2":0,"hair_1":11,"decals_1":0,"pants_2":0,"hair_2":5,"sex":0,"beard_4":0,"beard_3":0,"hair_color_2":4,"shoes":0,"arms":1,"helmet_2":0,"skin":12,"tshirt_1":36,"decals_2":0,"beard_1":3,"helmet_1":0,"torso_2":0}', 0, 500, '{453.686767578125, -1023.87194824219,  27.9993133544922, 203.575454711914}', 1, 0, 1, 0, '', '', ''),
(7, 'steam:1100001055a69e5', '', '', '', 0, 'user', 0, '{"beard_2":0,"sex":0,"beard_3":0,"skin":1,"beard_4":0,"hair_color_1":1,"hair_2":0,"shoes":1,"pants_1":0,"tshirt_2":0,"torso_1":58,"decals_2":0,"pants_2":1,"helmet_2":0,"glasses_1":18,"arms":1,"beard_1":0,"hair_1":10,"decals_1":0,"hair_color_2":1,"torso_2":0,"tshirt_1":23,"helmet_1":8,"glasses_2":0,"face":43}', 500, 0, '{406.6298828125, -1606.748046875,  29.2260932922363, 141.888290405273}', 1, 0, 1, 0, '', '', ''),
(12, 'steam:110000101f91cd2', '', '', '', 0, 'owner', 4, '{"beard_4":0,"decals_2":0,"helmet_2":0,"decals_1":0,"tshirt_1":15,"torso_2":0,"beard_1":0,"sex":0,"hair_color_1":9,"hair_1":2,"glasses_2":0,"glasses_1":0,"hair_2":4,"face":2,"helmet_1":11,"beard_3":0,"pants_2":3,"arms":5,"tshirt_2":0,"shoes":5,"skin":0,"pants_1":16,"hair_color_2":0,"torso_1":17,"beard_2":0}', 99992490, 120, '{1839.30749511719, 3663.83447265625,  33.8214073181152, 343.206726074219}', 2, 0, 0, 0, '@contacts', '@sms', '555-5050');

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
('steam:110000101f91cd2', 16, 0),
('steam:110000104bd6595', 1, 30),
('steam:110000104bd6595', 10, 0),
('steam:11000010599af76', 1, 0),
('steam:11000010599af76', 5, 3),
('steam:11000010599af76', 6, 2),
('steam:11000010599af76', 7, 7),
('steam:11000010599af76', 8, 12),
('steam:11000010599af76', 12, 1),
('steam:11000010599af76', 13, 0);

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
(78, 'steam:11000010599af76', 'Coquette BlackFin', 'coquette3', 290000, '06PKS613', 'in', '2', '2', '134', '156'),
(79, 'steam:11000010599af76', 'Dilettante', 'Dilettante', 6000, '68GTD147', 'in', '4', '0', '111', '156'),
(82, 'steam:110000101f91cd2', 'Blista', 'blista', 10000, '49GRA324', 'four', '7', '0', '5', '156'),
(83, 'steam:110000101889e5e', 'Feltzer', 'feltzer2', 680000, '64DTV097', 'out', '41', '46', '41', '156'),
(84, 'steam:11000010599af76', 'Faggio', 'faggio2', 2000, '20XWX421', 'out', '30', '2', '36', '156');

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
-- Structure de la table `zones`
--

CREATE TABLE `zones` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT pour la table `interiors`
--
ALTER TABLE `interiors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'key id', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `recolt`
--
ALTER TABLE `recolt`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `user_vehicle`
--
ALTER TABLE `user_vehicle`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT pour la table `user_weapons`
--
ALTER TABLE `user_weapons`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
