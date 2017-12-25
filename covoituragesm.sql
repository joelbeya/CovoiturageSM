-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 23, 2017 at 08:09 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `covoituragesm`
--
CREATE DATABASE IF NOT EXISTS `covoituragesm` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `covoituragesm`;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `Enleverespacesunitiles`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Enleverespacesunitiles` (IN `idD` INT(11))  NO SQL
    COMMENT 'On enlève les espaces inutiles'
BEGIN
    SELECT LTRIM(nom), LTRIM(prenom), LTRIM(email)
    FROM membre
    WHERE membre.id = idD;
  END$$

--
-- Functions
--
DROP FUNCTION IF EXISTS `CalculAgedeCovoitureur`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `CalculAgedeCovoitureur` (`date_naisC` DATE) RETURNS INT(11) NO SQL
BEGIN
	DECLARE age INT(11);
	SET age = YEAR(NOW()) - YEAR(date_naisC);
    RETURN age;
  END$$

DROP FUNCTION IF EXISTS `CalculDePrix`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `CalculDePrix` (`idOffresC` INT(255)) RETURNS INT(11) UNSIGNED READS SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE prixke INT(11);
    DECLARE xes INT(11);
    DECLARE Yes INT(11);
    SELECT offres.dist, offres.temps, offres.prix
    INTO Xes, Yes
    FROM offres
    WHERE offres.idOffres = idOffresC;
    IF Xes IS NOT NULL
    AND Yes IS NOT NULL THEN
    SET prixke = Xes / Yes;
    END IF;
    RETURN prixke;
  END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `covoitureurs actifs`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `covoitureurs actifs`;
CREATE TABLE IF NOT EXISTS `covoitureurs actifs` (
`actif` varchar(255)
,`role` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `covoitureurs inscrits`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `covoitureurs inscrits`;
CREATE TABLE IF NOT EXISTS `covoitureurs inscrits` (
`nom` varchar(255)
,`prenom` varchar(255)
,`sexe` enum('F','M','O')
);

-- --------------------------------------------------------

--
-- Table structure for table `membre`
--

DROP TABLE IF EXISTS `membre`;
CREATE TABLE IF NOT EXISTS `membre` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clé primaire',
  `nom` varchar(255) NOT NULL COMMENT 'important',
  `prenom` varchar(255) NOT NULL COMMENT 'pas important ',
  `date_nais` date DEFAULT NULL COMMENT 'date de naissance',
  `sexe` enum('F','M','O') CHARACTER SET utf16 NOT NULL DEFAULT 'F' COMMENT 'Sexe de membre',
  `email` varchar(255) NOT NULL COMMENT 'addmail',
  `mdp` varchar(255) NOT NULL COMMENT 'mot de passe',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `role` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT 'Role dans l''administratiion',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='Spécification du membre de notre site de covoiturage sur mesure ';

--
-- Dumping data for table `membre`
--

INSERT INTO `membre` (`id`, `nom`, `prenom`, `date_nais`, `sexe`, `email`, `mdp`, `active`, `role`) VALUES
(1, 'Merrill', 'Zahir', '2012-07-19', 'O', 'lacus.Ut@interdum.net', 'WLV37YTE8IS', 0, '1'),
(2, 'Harrison', 'Tyler', '1905-03-09', 'F', 'pellentesque.a.facilisis@amet.ca', 'BLK34MWI6MV', 0, '1'),
(3, 'Bruno', 'Kato', '1946-10-07', 'O', 'sed.leo@ac.edu', 'UOW20DQI4JB', 1, '0'),
(4, 'Matthew', 'Kevin', '1943-05-15', 'M', 'nisl@nonmassa.com', 'FCE56LRK4KH', 0, '0'),
(5, 'Yasir', 'Brandon', '2002-07-20', 'M', 'mi.fringilla@Duisac.edu', 'UNX01RYO9LG', 1, '0'),
(6, 'Walker', 'Vincent', '2015-06-23', 'F', 'augue.Sed@sitamet.org', 'LXA31YXQ8RK', 0, '1'),
(7, 'Richard', 'Joseph', '1991-01-31', 'M', 'ornare.egestas.ligula@odioa.net', 'FIB24DRN4LZ', 1, '0'),
(8, 'Wallace', 'Omar', '2012-12-27', 'M', 'Duis.elementum.dui@FuscefeugiatLorem.ca', 'RON24UQL7GK', 0, '0'),
(9, 'Tucker', 'Wylie', '2009-12-18', 'F', 'non.leo@fringilla.com', 'KBW21BFH0MP', 1, '0'),
(10, 'Jackson', 'Owen', '1940-09-18', 'M', 'sed.turpis.nec@duinectempus.net', 'RXZ72VYK2UW', 1, '1'),
(11, 'Neville', 'Kamal', '1909-10-25', 'F', 'non@acmattissemper.org', 'SFU29RHR3RF', 1, '0'),
(12, 'Lee', 'Wade', '1907-10-26', 'O', 'felis@ut.com', 'ZAC18MTM1PD', 1, '0'),
(13, 'Donovan', 'Dorian', '2011-09-27', 'O', 'suscipit@sagittissemperNam.com', 'HLB87CWT6PD', 1, '1'),
(14, 'Donovan', 'Cruz', '1925-09-08', 'O', 'iaculis.enim@imperdietdictum.ca', 'RTF95PIZ5UC', 0, '0'),
(15, 'Hashim', 'Giacomo', '1947-10-27', 'O', 'egestas.a.dui@mollis.co.uk', 'LRD63BCO7VM', 0, '0'),
(16, 'Nolan', 'Barry', '1960-10-12', 'M', 'Fusce@pulvinararcuet.com', 'SKO69BEQ0DG', 0, '1'),
(17, 'Emery', 'Ashton', '1983-10-15', 'O', 'Quisque@euturpis.net', 'VDO48BYM5TX', 1, '0'),
(18, 'Lyle', 'Ishmael', '1963-07-27', 'M', 'Sed@ullamcorper.edu', 'YAV10UDU6QB', 1, '0'),
(19, 'Gray', 'Todd', '1958-05-02', 'F', 'diam.at.pretium@nasceturridiculus.edu', 'CIB27NOL0SP', 0, '1'),
(20, 'Scott', 'Melvin', '1923-04-19', 'F', 'orci.quis@sedsapien.co.uk', 'UFY66VAZ5ZY', 1, '0'),
(21, 'Gil', 'Plato', '1931-06-07', 'M', 'at.lacus.Quisque@ornare.co.uk', 'URU94LSB1PN', 0, '0'),
(22, 'Talon', 'Donovan', '1993-10-04', 'F', 'lacinia@laoreet.org', 'GWP49QWE3OS', 1, '1'),
(23, 'Merritt', 'Silas', '2008-07-29', 'O', 'velit.Pellentesque@Morbi.org', 'QED19SOZ9HZ', 1, '0'),
(24, 'Sawyer', 'Fulton', '1905-08-19', 'O', 'velit@magna.ca', 'EAP85QCC9ER', 1, '0'),
(25, 'Elliott', 'Lars', '1952-05-26', 'F', 'nisi.magna@dictum.ca', 'AKU88CSV3JP', 0, '0'),
(26, 'Jameson', 'Rooney', '1938-06-17', 'F', 'sapien.gravida.non@pretium.org', 'RIS71BAR8GJ', 0, '1'),
(27, 'Brian', 'Merrill', '1987-03-17', 'F', 'dolor.quam.elementum@tellusNunc.edu', 'ZJM17DOK7FA', 1, '0'),
(28, 'Hamilton', 'Jakeem', '1913-08-16', 'M', 'leo@Aliquam.org', 'ONG09ZAR2FE', 1, '1'),
(29, 'Raja', 'Martin', '1911-05-11', 'F', 'tincidunt.congue@id.com', 'WCF15VWH6MM', 0, '0'),
(30, 'Hakeem', 'Chaney', '1923-05-12', 'O', 'mus.Proin@necenimNunc.net', 'RZA64KMQ9CU', 1, '0'),
(31, 'Neil', 'Grant', '1962-07-23', 'M', 'Etiam@vel.org', 'HTM29ZPT5XZ', 1, '1'),
(32, 'Randall', 'Magee', '1918-08-09', 'O', 'nisi.Mauris@aliquetliberoInteger.ca', 'LDQ19XKT1HZ', 0, '1'),
(33, 'Brock', 'Daniel', '1963-05-18', 'M', 'sed@ac.org', 'IES00NSS4UR', 0, '0');

--
-- Triggers `membre`
--
DROP TRIGGER IF EXISTS `ValidationEmail`;
DELIMITER $$
CREATE TRIGGER `ValidationEmail` BEFORE INSERT ON `membre` FOR EACH ROW BEGIN IF NEW.email IS NULL THEN SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'email ne doit pas etre vide'; END IF;
IF NEW.email NOT LIKE '.+@.+..+' THEN SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'email doit contenir un truc du genre ...@... frère !'; END IF; END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `ValidationMotdePasse`;
DELIMITER $$
CREATE TRIGGER `ValidationMotdePasse` BEFORE INSERT ON `membre` FOR EACH ROW BEGIN IF NEW.mdp IS NULL THEN SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'Mot de passe ne doit pas etre vide'; END IF;  END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `ValidationNom`;
DELIMITER $$
CREATE TRIGGER `ValidationNom` BEFORE INSERT ON `membre` FOR EACH ROW BEGIN
	IF NEW.nom IS NULL THEN
      SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'nom ne doit pas etre vide';
END IF;
	IF CHAR_LENGHT(NEW.nom) < 3 THEN
      SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'nom doit avoir au moins trois letres sil vous plait';
END IF;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `ValidationPrenom`;
DELIMITER $$
CREATE TRIGGER `ValidationPrenom` BEFORE INSERT ON `membre` FOR EACH ROW BEGIN IF NEW.prenom IS NULL THEN SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'prenom ne doit pas etre vide'; END IF;
IF CHAR_LENGHT(NEW.prenom) < 3 THEN SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'prenom doit avoir au moins trois letres sil vous plait'; END IF; END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `ValidationRole`;
DELIMITER $$
CREATE TRIGGER `ValidationRole` BEFORE INSERT ON `membre` FOR EACH ROW BEGIN IF NEW.role NOT IN('0', '1', '2') THEN SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'Role doit avoir des valeurs 0(indiquent administrateur), 1(membre permanent), 2(membre passager)'; END IF; 
IF NEW.sexe NOT IN('F', 'M', 'O') THEN SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'Role doit avoir des valeurs F(indiquent Femme), M(Homme-monssieur), 2(autre-transgenre)'; END IF; END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `notification de covoitureurs mal apprécié`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `notification de covoitureurs mal apprécié`;
CREATE TABLE IF NOT EXISTS `notification de covoitureurs mal apprécié` (
`expMemb` int(255)
,`destMemb` int(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `notification pour chaque covoitureur`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `notification pour chaque covoitureur`;
CREATE TABLE IF NOT EXISTS `notification pour chaque covoitureur` (
`expMemb` int(255)
,`destMemb` int(255)
,`moment` datetime
,`appreciation` int(5)
);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `idNotif` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clé primaire ',
  `expMemb` int(255) NOT NULL COMMENT 'Clé étrangère référençant la table membre',
  `destMemb` int(255) NOT NULL COMMENT 'Clé étrangère référençant la table membre',
  `idOffres` int(255) NOT NULL,
  `moment` datetime NOT NULL COMMENT 'heure du depot de la notification',
  `Appreciation` int(5) NOT NULL COMMENT 'description de la notification',
  PRIMARY KEY (`idNotif`),
  KEY `foreignKey` (`destMemb`),
  KEY `cleetr` (`expMemb`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='Notification du voyage ';

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`idNotif`, `expMemb`, `destMemb`, `idOffres`, `moment`, `Appreciation`) VALUES
(1, 24, 9, 39, '2018-05-29 09:35:53', 4),
(2, 25, 27, 17, '2017-11-16 00:04:54', 1),
(3, 15, 48, 13, '2017-11-11 23:33:59', 4),
(4, 28, 48, 6, '2017-10-18 02:42:02', 4),
(5, 59, 38, 16, '2018-04-30 08:20:00', 2),
(6, 5, 32, 32, '2018-08-13 17:49:11', 3),
(7, 39, 46, 8, '2018-04-26 01:34:15', 4),
(8, 1, 9, 17, '2017-05-14 13:35:01', 3),
(9, 34, 2, 42, '2017-09-02 11:26:12', 3),
(10, 24, 1, 45, '2018-11-12 05:14:21', 3),
(11, 2, 52, 16, '2017-11-14 21:15:29', 3),
(12, 38, 41, 28, '2017-09-16 04:08:43', 1),
(13, 16, 43, 26, '2017-07-28 06:57:10', 1),
(14, 14, 12, 30, '2018-04-01 14:09:27', 2),
(15, 45, 37, 16, '2018-04-15 21:50:27', 2),
(16, 57, 22, 46, '2018-03-13 09:41:45', 4),
(17, 4, 39, 1, '2018-03-26 08:43:43', 2),
(18, 55, 51, 37, '2018-04-15 04:13:43', 2),
(19, 4, 6, 33, '2018-10-01 12:10:49', 3),
(20, 6, 31, 35, '2018-06-28 14:40:52', 4),
(21, 57, 45, 32, '2018-12-17 06:29:17', 4),
(22, 1, 52, 12, '2017-01-28 08:12:48', 3),
(23, 59, 53, 30, '2017-12-17 20:22:51', 3),
(24, 12, 16, 9, '2018-07-18 06:25:14', 3),
(25, 9, 4, 28, '2018-06-03 09:12:19', 2),
(26, 30, 49, 45, '2018-09-14 18:52:22', 2),
(27, 28, 43, 6, '2017-02-19 19:02:05', 1),
(28, 53, 18, 31, '2017-12-29 03:53:56', 3),
(29, 24, 2, 26, '2017-07-23 13:16:41', 3),
(30, 56, 19, 12, '2018-09-23 19:38:51', 3),
(31, 24, 4, 41, '2018-07-26 14:59:29', 2),
(32, 27, 60, 5, '2018-05-02 03:58:15', 3),
(33, 4, 19, 13, '2017-04-23 10:02:25', 4),
(34, 52, 54, 12, '2018-09-22 22:19:51', 1),
(35, 26, 38, 4, '2018-07-16 13:03:16', 1),
(36, 22, 17, 36, '2017-02-18 16:09:03', 3),
(37, 32, 41, 31, '2018-08-03 19:07:44', 2),
(38, 40, 31, 6, '2017-11-10 08:48:07', 4),
(39, 49, 54, 34, '2018-11-08 13:16:29', 2),
(40, 35, 50, 13, '2018-01-02 04:06:12', 3),
(41, 45, 59, 16, '2018-07-27 07:24:43', 3),
(42, 34, 24, 20, '2017-10-12 11:17:44', 3),
(43, 42, 12, 13, '2018-04-29 06:21:46', 3),
(44, 32, 40, 46, '2018-12-18 09:53:10', 2),
(45, 15, 15, 17, '2018-07-30 07:04:10', 2),
(46, 50, 13, 14, '2018-08-04 01:40:04', 4),
(47, 51, 50, 9, '2017-10-29 15:55:56', 2);

--
-- Triggers `notifications`
--
DROP TRIGGER IF EXISTS `ValidationAppreciation`;
DELIMITER $$
CREATE TRIGGER `ValidationAppreciation` BEFORE INSERT ON `notifications` FOR EACH ROW BEGIN
IF
	NEW.Appreciation < 0 OR NEW.Appreciation > 6 THEN
  
   SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'pas de plage de valeur sup ou inf a 5'; 
    END IF;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `offres`
--

DROP TABLE IF EXISTS `offres`;
CREATE TABLE IF NOT EXISTS `offres` (
  `idOffres` int(255) NOT NULL AUTO_INCREMENT COMMENT 'Clé primaire ',
  `idVehicule` varchar(255) NOT NULL COMMENT 'Clé étrangère référençant la table véhicule',
  `date_dep` date NOT NULL COMMENT 'Date de depart au forant AAAA MM DD',
  `prix` varchar(255) NOT NULL,
  `description` text NOT NULL COMMENT 'description du voyage proposé ',
  `dist` int(255) NOT NULL COMMENT 'Distance entre les deux villes en m',
  `temps` int(255) NOT NULL COMMENT 'Temps en fonction de la distance et du type de véhicule en sec',
  PRIMARY KEY (`idOffres`),
  KEY `idVehicule` (`idVehicule`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='Description des covoitureurs';

--
-- Dumping data for table `offres`
--

INSERT INTO `offres` (`idOffres`, `idVehicule`, `date_dep`, `prix`, `description`, `dist`, `temps`) VALUES
(2, '1', '2017-02-19', '117', 'Citroën, Toyota', 395857, 226826),
(3, '19', '2018-09-16', '167', 'Dodge, RAM Trucks, Dongfeng Motor', 663421, 201644),
(4, '17', '2017-02-03', '101', 'JLR', 588754, 705469),
(5, '30', '2017-02-08', '189', 'Chrysler', 638256, 850941),
(6, '6', '2018-02-13', '24', 'Porsche, Hyundai Motors', 257103, 966586),
(7, '31', '2017-01-14', '93', '', 802018, 529556),
(8, '21', '2017-08-22', '121', 'Acura, RAM Trucks, FAW', 452286, 726587),
(9, '40', '2017-06-18', '125', 'Maruti Suzuki, Porsche', 92834, 168614),
(10, '43', '2017-01-15', '119', '', 611691, 193885),
(11, '40', '2018-05-06', '165', '', 111528, 945799),
(12, '9', '2018-05-24', '112', 'Cadillac, Subaru, Maruti Suzuki', 416234, 341238),
(13, '29', '2017-06-22', '152', 'Honda, Chrysler, Smart', 139249, 426214),
(14, '24', '2017-12-26', '87', '', 833881, 143681),
(15, '34', '2018-02-15', '74', '', 270585, 817757),
(16, '1', '2017-01-15', '77', 'Honda', 699824, 995874),
(17, '15', '2017-06-17', '67', 'Volkswagen, MINI', 557323, 513738),
(18, '17', '2017-03-20', '96', 'Daimler, JLR, Audi', 272611, 149520),
(19, '16', '2017-11-21', '23', 'BMW, Skoda, Kia Motors', 463690, 736975),
(20, '5', '2018-11-27', '188', '', 219770, 572541),
(21, '11', '2017-08-26', '182', 'Daimler', 468883, 148621),
(22, '43', '2017-01-24', '11', 'Mercedes-Benz, Citroën', 277264, 517692),
(23, '41', '2018-11-01', '91', 'Lexus', 508149, 510044),
(24, '41', '2018-06-08', '77', 'Chrysler', 480287, 506746),
(25, '35', '2017-02-10', '146', 'Lincoln, Hyundai Motors', 595739, 343051),
(26, '35', '2018-11-11', '9', 'Audi, Mitsubishi Motors, GMC', 546670, 449309),
(27, '48', '2018-07-05', '126', '', 917454, 879296),
(28, '12', '2017-12-16', '95', 'Dongfeng Motor, Daimler', 669694, 673719),
(29, '35', '2018-09-20', '191', 'Honda', 414798, 535142),
(30, '3', '2017-02-21', '161', 'Smart, Dacia', 503606, 951062),
(31, '4', '2018-01-03', '13', 'Kenworth', 621099, 535395),
(32, '32', '2017-09-18', '74', '', 600560, 505173),
(33, '23', '2018-06-08', '48', 'Mazda, Vauxhall', 415508, 468487),
(34, '18', '2018-06-17', '118', 'Skoda, Audi', 850032, 443989),
(35, '3', '2018-07-25', '31', '', 57926, 224716),
(36, '23', '2017-09-15', '16', '', 720545, 69411),
(37, '36', '2018-09-02', '157', 'Subaru', 51756, 180036),
(38, '6', '2018-07-01', '95', '', 709149, 717182),
(39, '38', '2018-08-30', '104', 'Kia Motors, Seat, RAM Trucks', 992912, 512477),
(40, '50', '2018-09-03', '136', 'Nissan, Vauxhall, Dacia', 91071, 804689),
(41, '23', '2018-05-20', '39', 'Mercedes-Benz, Nissan, Daimler', 114829, 280916),
(42, '24', '2017-07-19', '73', 'JLR, Fiat', 680955, 75518),
(43, '17', '2017-08-20', '45', 'Fiat', 225563, 790127),
(44, '38', '2017-04-04', '95', '', 419064, 734400),
(45, '46', '2018-10-22', '73', 'GMC, Mazda', 666074, 533545),
(46, '22', '2018-10-28', '25', 'GMC', 567785, 506317),
(47, '43', '2018-07-11', '53', 'MINI, Mitsubishi Motors', 44711, 389060),
(48, '20', '2018-08-16', '63', '', 515758, 208531);

--
-- Triggers `offres`
--
DROP TRIGGER IF EXISTS `ValidationDescription`;
DELIMITER $$
CREATE TRIGGER `ValidationDescription` BEFORE INSERT ON `offres` FOR EACH ROW BEGIN IF NEW.description IS NULL THEN SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'Description ne doit pas etre vide'; END IF; END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `ValidationPrix`;
DELIMITER $$
CREATE TRIGGER `ValidationPrix` BEFORE INSERT ON `offres` FOR EACH ROW BEGIN IF NEW.prix <= 0 THEN SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'Au fait, le prix ne doit pas etre inferieur à 0(ça tu devais le savoir non CUISTRE'; END IF; END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `offres de covoiturages`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `offres de covoiturages`;
CREATE TABLE IF NOT EXISTS `offres de covoiturages` (
`idVehicule` varchar(255)
,`date_dep` date
,`prix` varchar(255)
,`description` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `places disponibles encore pour cehicues`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `places disponibles encore pour cehicues`;
CREATE TABLE IF NOT EXISTS `places disponibles encore pour cehicues` (
`marque` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `idOffres` int(255) NOT NULL COMMENT 'Clé primaire référençant la table offre',
  `passIdMembre` int(255) NOT NULL COMMENT 'Clé primaire référençant la table membres',
  `notesCond` int(2) NOT NULL DEFAULT '0' COMMENT 'Note sur le conducteur',
  `notePass` int(2) NOT NULL DEFAULT '0' COMMENT 'Note sur les passagers',
  `villeDep` int(10) NOT NULL COMMENT 'Clé étrangère référencée par id de la table ville',
  `villeAr` int(10) NOT NULL COMMENT 'Clé étrangère référencée par id de la table ville',
  PRIMARY KEY (`idOffres`,`passIdMembre`),
  KEY `villeDep` (`villeDep`),
  KEY `villeAr` (`villeAr`),
  KEY `passIdMembre` (`passIdMembre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Spécification des reservations des covoitureurs';

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`idOffres`, `passIdMembre`, `notesCond`, `notePass`, `villeDep`, `villeAr`) VALUES
(3, 9, 4, 1, 10, 70),
(6, 19, 1, 3, 11, 98),
(7, 4, 4, 2, 39, 61),
(8, 1, 4, 5, 10, 54),
(8, 8, 2, 4, 18, 71),
(10, 15, 2, 4, 28, 55),
(11, 18, 2, 2, 38, 74),
(12, 15, 5, 3, 40, 62),
(13, 9, 4, 4, 48, 55),
(15, 12, 1, 4, 26, 91),
(15, 25, 3, 1, 42, 55),
(17, 11, 5, 4, 11, 61),
(18, 17, 5, 3, 38, 93),
(18, 23, 1, 1, 27, 81),
(21, 16, 2, 1, 19, 55),
(21, 20, 4, 1, 20, 65),
(24, 16, 2, 3, 31, 65),
(26, 19, 4, 5, 36, 56),
(27, 6, 2, 2, 26, 80),
(27, 23, 5, 3, 19, 88),
(28, 7, 2, 5, 4, 100),
(29, 9, 2, 2, 14, 59),
(29, 21, 5, 5, 16, 99),
(30, 22, 1, 5, 32, 68),
(32, 3, 4, 3, 22, 66),
(32, 14, 2, 1, 12, 76),
(34, 9, 1, 3, 42, 55),
(35, 16, 1, 1, 37, 75),
(36, 6, 5, 4, 44, 57),
(36, 8, 1, 1, 1, 63),
(37, 1, 5, 2, 27, 74),
(38, 17, 1, 3, 33, 60),
(39, 19, 2, 3, 17, 58),
(41, 18, 5, 4, 42, 94),
(43, 6, 4, 5, 32, 75),
(44, 1, 3, 4, 19, 77),
(44, 14, 5, 3, 24, 86),
(45, 13, 3, 1, 9, 98),
(45, 16, 4, 3, 14, 65),
(45, 23, 5, 1, 30, 91),
(46, 2, 4, 5, 18, 51),
(47, 10, 2, 5, 33, 58),
(47, 18, 2, 3, 32, 55),
(48, 16, 1, 3, 19, 78),
(49, 16, 5, 5, 16, 61),
(49, 21, 4, 3, 39, 85);

-- --------------------------------------------------------

--
-- Stand-in structure for view `reservation en cours`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `reservation en cours`;
CREATE TABLE IF NOT EXISTS `reservation en cours` (
`passIdMembre` int(255)
,`villeDep` int(10)
,`villeAr` int(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `trajets des villes visibles sur google map marqueurs`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `trajets des villes visibles sur google map marqueurs`;
CREATE TABLE IF NOT EXISTS `trajets des villes visibles sur google map marqueurs` (
`nom` varchar(255)
,`pays` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `trajettype`
--

DROP TABLE IF EXISTS `trajettype`;
CREATE TABLE IF NOT EXISTS `trajettype` (
  `villeDep` int(255) NOT NULL COMMENT 'Clé primaire référençant la table ville',
  `villeAr` int(255) NOT NULL COMMENT 'Clé primaire référençant la table ville',
  `immatVehicule` varchar(6) NOT NULL COMMENT 'Clé primaire référençant la table véhicule',
  `distance` text NOT NULL COMMENT 'Distance entre les deux villes en km',
  `TempsMoyen` text NOT NULL COMMENT 'Temps en fonction de la distance et du type de véhicule en heure',
  PRIMARY KEY (`villeDep`,`villeAr`,`immatVehicule`),
  KEY `trajet-type_arr` (`villeAr`),
  KEY `cleduveh` (`immatVehicule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Trajet type de voyage défini par l''administrateur ';

--
-- Dumping data for table `trajettype`
--

INSERT INTO `trajettype` (`villeDep`, `villeAr`, `immatVehicule`, `distance`, `TempsMoyen`) VALUES
(1, 71, '426', 'huit km', '8 heure'),
(1, 88, '942', 'quatre km', '3 heure'),
(4, 83, '447', 'dix km', '4 heure'),
(5, 58, '635', 'quatre km', '5 heure'),
(5, 72, '596', 'dix km', '8 heure'),
(6, 100, '585', 'deux km', '9 heure'),
(7, 81, '740', 'deux km', '10 heure'),
(10, 61, '481', 'neuf km', '7 heure'),
(11, 86, '835', 'six km', '5 heure'),
(14, 56, '448', 'quatre km', '2 heure'),
(14, 59, '777', 'huit km', '2 heure'),
(15, 65, '377', 'sept km', '5 heure'),
(15, 65, '754', 'un km', '10 heure'),
(15, 71, '645', 'quatre km', '2 heure'),
(15, 84, '317', 'un km', '1 heure'),
(15, 90, '298', 'deux km', '2 heure'),
(15, 96, '526', 'huit km', '4 heure'),
(17, 50, '787', 'sept km', '5 heure'),
(17, 81, '702', 'deux km', '5 heure'),
(18, 77, '310', 'huit km', '8 heure'),
(19, 67, '615', 'neuf km', '5 heure'),
(19, 98, '363', 'quatre km', '1 heure'),
(22, 72, '416', 'six km', '8 heure'),
(23, 63, '623', 'dix km', '5 heure'),
(23, 83, '758', 'deux km', '2 heure'),
(23, 93, '452', 'huit km', '9 heure'),
(25, 56, '787', 'six km', '2 heure'),
(25, 86, '562', 'un km', '5 heure'),
(26, 82, '422', 'quatre km', '6 heure'),
(27, 65, '828', 'deux km', '2 heure'),
(30, 63, '590', 'quatre km', '7 heure'),
(30, 65, '758', 'neuf km', '6 heure'),
(30, 92, '943', 'dix km', '4 heure'),
(30, 98, '180', 'six km', '7 heure'),
(31, 84, '169', 'un km', '10 heure'),
(34, 86, '858', 'cinq km', '2 heure'),
(34, 92, '451', 'huit km', '8 heure'),
(35, 67, '192', 'sept km', '1 heure'),
(35, 84, '546', 'quatre km', '10 heure'),
(36, 62, '166', 'neuf km', '1 heure'),
(37, 66, '630', 'huit km', '10 heure'),
(38, 50, '814', 'quatre km', '7 heure'),
(39, 89, '382', 'sept km', '2 heure'),
(40, 58, '541', 'dix km', '5 heure'),
(42, 64, '269', 'trois km', '4 heure'),
(42, 79, '738', 'quatre km', '3 heure'),
(45, 59, '878', 'sept km', '9 heure'),
(46, 68, '170', 'dix km', '1 heure'),
(48, 53, '512', 'sept km', '9 heure'),
(50, 96, '856', 'sept km', '9 heure');

-- --------------------------------------------------------

--
-- Table structure for table `vehicule`
--

DROP TABLE IF EXISTS `vehicule`;
CREATE TABLE IF NOT EXISTS `vehicule` (
  `immat` varchar(6) NOT NULL COMMENT 'N°Immatriculation du véhicule clé primaire',
  `type` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT 'type de voiture entre 1/voiture, 2/transport en commun divers et 3/marche à pieds ',
  `marque` varchar(255) NOT NULL COMMENT 'marque du véhicule ; Important',
  `nbp` int(10) NOT NULL DEFAULT '1' COMMENT 'Nombre de place du véhicule ; Supra ultra très trop mega giga tera important :)',
  `idMembre` int(11) NOT NULL COMMENT 'Clé étrangère référencée par id de la table membre',
  PRIMARY KEY (`immat`),
  KEY `cledeMemnre` (`idMembre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Spécification du véhicule de covoiturage ';

--
-- Dumping data for table `vehicule`
--

INSERT INTO `vehicule` (`immat`, `type`, `marque`, `nbp`, `idMembre`) VALUES
('119', '1', 'BMW', 4, 21),
('139', '2', 'Mahindra and Mahindra', 4, 3),
('141', '1', 'Isuzu', 4, 12),
('144', '2', 'MINI', 2, 21),
('167', '3', 'BMW', 3, 6),
('169', '3', 'Infiniti', 2, 12),
('181', '3', 'Smart', 4, 5),
('192', '1', 'Vauxhall', 3, 21),
('203', '3', 'Seat', 2, 3),
('221', '1', 'Volkswagen', 1, 15),
('298', '1', 'Volvo', 1, 24),
('303', '1', 'Smart', 3, 21),
('326', '1', 'Suzuki', 4, 25),
('344', '3', 'Buick', 4, 2),
('351', '1', 'Lincoln', 2, 11),
('364', '1', 'Volvo', 4, 25),
('365', '3', 'Kenworth', 1, 12),
('374', '1', 'Renault', 3, 23),
('381', '1', 'Ford', 3, 14),
('387', '3', 'MINI', 4, 19),
('399', '2', 'Renault', 3, 11),
('434', '2', 'Maruti Suzuki', 3, 2),
('440', '2', 'Mercedes-Benz', 1, 3),
('448', '3', 'Mahindra and Mahindra', 4, 5),
('479', '3', 'Vauxhall', 2, 10),
('494', '2', 'Mazda', 3, 3),
('501', '2', 'Mazda', 2, 8),
('502', '3', 'Nissan', 1, 24),
('530', '3', 'Suzuki', 1, 11),
('566', '1', 'Audi', 1, 7),
('584', '1', 'Jeep', 4, 16),
('589', '1', 'Audi', 3, 16),
('666', '3', 'MINI', 4, 9),
('683', '3', 'Smart', 3, 11),
('688', '3', 'Lexus', 4, 17),
('690', '2', 'Chrysler', 1, 25),
('693', '3', 'MINI', 4, 6),
('694', '3', 'Mitsubishi Motors', 4, 25),
('716', '3', 'Skoda', 3, 10),
('742', '1', 'Infiniti', 2, 8),
('745', '3', 'Cadillac', 4, 18),
('774', '2', 'Mazda', 2, 20),
('829', '3', 'Acura', 4, 6),
('851', '2', 'Mahindra and Mahindra', 2, 25),
('867', '1', 'Ferrari', 2, 8),
('899', '3', 'Vauxhall', 4, 17),
('949', '3', 'Peugeot', 1, 12),
('968', '2', 'Mitsubishi Motors', 3, 7),
('969', '3', 'Infiniti', 2, 21),
('978', '2', 'Ford', 1, 19);

--
-- Triggers `vehicule`
--
DROP TRIGGER IF EXISTS `ValidationMarque`;
DELIMITER $$
CREATE TRIGGER `ValidationMarque` BEFORE INSERT ON `vehicule` FOR EACH ROW BEGIN IF NEW.marque IS NULL THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'marque ne doit pas etre vide'; END IF; END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `ValidationNombreDePersonne`;
DELIMITER $$
CREATE TRIGGER `ValidationNombreDePersonne` BEFORE INSERT ON `vehicule` FOR EACH ROW BEGIN
IF NEW.nbp < 0 OR NEW.nbp > 10 THEN SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'Pas de voiture du future avec 0 place dedans ni des gros bus avec plus de 10 personnes (au fait on ne fait pas la TAM :)'; END IF; END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `idVille` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Clé primaire',
  `nom` varchar(255) DEFAULT NULL COMMENT 'important',
  `pays` varchar(255) DEFAULT NULL COMMENT 'important',
  `latlng` varchar(255) NOT NULL DEFAULT '' COMMENT 'latitude et longitude de ville',
  PRIMARY KEY (`idVille`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COMMENT='Description de villes des trajets de covoiturage';

--
-- Dumping data for table `ville`
--

INSERT INTO `ville` (`idVille`, `nom`, `pays`, `latlng`) VALUES
(1, 'Languedoc-Roussillon', 'France', '-48.04411, 54.56394'),
(2, 'Limousin', 'France', '-73.12724, -37.10637'),
(3, 'Centre', 'France', '-48.89153, 157.69315'),
(4, 'Champagne-Ardenne', 'France', '68.16884, -105.81616'),
(5, 'Languedoc-Roussillon', 'France', '-69.06058, -138.51547'),
(6, 'Midi-Pyrénées', 'France', '89.17856, 68.37143'),
(7, 'Lorraine', 'France', '32.89281, -32.5239'),
(8, 'Poitou-Charentes', 'France', '-57.34705, 158.44503'),
(9, 'Île-de-France', 'France', '-19.23419, -12.52037'),
(10, 'Franche-Comté', 'France', '3.92379, -73.04775'),
(11, 'Alsace', 'France', '42.87017, 86.55095'),
(12, 'Basse-Normandie', 'France', '15.68394, -34.17095'),
(13, 'Île-de-France', 'France', '77.00697, -30.05955'),
(14, 'Lorraine', 'France', '10.59361, 113.74786'),
(15, 'Poitou-Charentes', 'France', '-48.11567, -46.20009'),
(16, 'Alsace', 'France', '8.95866, -23.95012'),
(17, 'Basse-Normandie', 'France', '-70.06649, 115.01175'),
(18, 'Champagne-Ardenne', 'France', '-57.92152, 27.86167'),
(19, 'Auvergne', 'France', '0.63638, -125.04389'),
(20, 'Champagne-Ardenne', 'France', '52.76369, -159.37996'),
(21, 'Provence-Alpes-Côte d\'Azur', 'France', '-69.07657, 135.00276'),
(22, 'Bretagne', 'France', '77.7067, 56.24453'),
(23, 'Auvergne', 'France', '-84.9492, -104.24697'),
(24, 'Midi-Pyrénées', 'France', '38.53538, -39.84803'),
(25, 'Franche-Comté', 'France', '-88.50355, -178.5571'),
(26, 'Provence-Alpes-Côte d\'Azur', 'France', '-3.24623, -31.56632'),
(27, 'Haute-Normandie', 'France', '-21.78183, -60.03047'),
(28, 'Lorraine', 'France', '78.44943, -44.76628'),
(29, 'Île-de-France', 'France', '73.11034, 19.97034'),
(30, 'Provence-Alpes-Côte d\'Azur', 'France', '-0.55395, 101.53456'),
(31, 'Île-de-France', 'France', '15.56653, -156.96267'),
(32, 'Basse-Normandie', 'France', '-21.33477, -58.5633'),
(33, 'Nord-Pas-de-Calais', 'France', '-48.65246, -82.48737'),
(34, 'Corse', 'France', '-56.90931, 74.79143'),
(35, 'Bourgogne', 'France', '40.3721, -24.48088'),
(36, 'Bretagne', 'France', '45.18273, -143.33932'),
(37, 'Basse-Normandie', 'France', '-25.24309, 6.32466'),
(38, 'Alsace', 'France', '71.40621, 116.44618'),
(39, 'Lorraine', 'France', '-81.88088, 86.17182'),
(40, 'Centre', 'France', '-64.6098, 69.88326'),
(41, 'Lorraine', 'France', '-10.17158, 88.17895'),
(42, 'Poitou-Charentes', 'France', '-29.40781, -42.05027'),
(43, 'Lorraine', 'France', '24.54693, 96.54684'),
(44, 'Corse', 'France', '-68.59224, -110.44457'),
(45, 'Bretagne', 'France', '-34.7448, -146.30363'),
(46, 'Île-de-France', 'France', '-54.1526, 143.4236'),
(47, 'Nord-Pas-de-Calais', 'France', '-78.34127, 84.77637'),
(48, 'Bretagne', 'France', '-31.47364, -14.26166'),
(49, 'Nord-Pas-de-Calais', 'France', '86.18126, 28.87619'),
(50, 'Corse', 'France', '-72.49227, 165.70767'),
(51, 'Lorraine', 'France', '38.25205, 75.65017'),
(52, 'Corse', 'France', '-8.35127, 46.08877'),
(53, 'Bourgogne', 'France', '85.18794, -157.65538'),
(54, 'Bourgogne', 'France', '-85.71903, 163.35304'),
(55, 'Limousin', 'France', '-70.63866, 105.77581'),
(56, 'Picardie', 'France', '72.9007, -62.58021'),
(57, 'Bretagne', 'France', '-29.60101, -173.77706'),
(58, 'Midi-Pyrénées', 'France', '-69.33606, 6.5307'),
(59, 'Franche-Comté', 'France', '-48.72413, 150.9329'),
(60, 'Bourgogne', 'France', '-59.28084, 72.91501'),
(61, 'Midi-Pyrénées', 'France', '-27.30594, -4.52611'),
(62, 'Picardie', 'France', '-24.04091, 78.51748'),
(63, 'Alsace', 'France', '-51.70516, 67.92907'),
(64, 'Languedoc-Roussillon', 'France', '-6.24289, -100.60091'),
(65, 'Centre', 'France', '73.59394, -108.78694'),
(66, 'Languedoc-Roussillon', 'France', '-57.41182, 106.84361'),
(67, 'Provence-Alpes-Côte d\'Azur', 'France', '81.73858, -160.59014'),
(68, 'Pays de la Loire', 'France', '-59.70443, 134.17916'),
(69, 'Aquitaine', 'France', '-79.11037, -142.14533'),
(70, 'Bretagne', 'France', '-84.81685, -116.43345'),
(71, 'Alsace', 'France', '49.61239, 155.94527'),
(72, 'Provence-Alpes-Côte d\'Azur', 'France', '-57.74781, 161.46211'),
(73, 'Nord-Pas-de-Calais', 'France', '32.46159, -100.55051'),
(74, 'Champagne-Ardenne', 'France', '-66.96777, -93.57757'),
(75, 'Champagne-Ardenne', 'France', '-84.40382, 152.23941'),
(76, 'Centre', 'France', '84.9642, 164.58809'),
(77, 'Languedoc-Roussillon', 'France', '-74.23411, -150.43189'),
(78, 'Nord-Pas-de-Calais', 'France', '-58.55241, -30.78326'),
(79, 'Franche-Comté', 'France', '31.688, 32.8455'),
(80, 'Basse-Normandie', 'France', '-65.64736, -89.82979'),
(81, 'Pays de la Loire', 'France', '17.55874, -49.1303'),
(82, 'Picardie', 'France', '60.40738, 29.29691'),
(83, 'Languedoc-Roussillon', 'France', '72.37441, 150.49543'),
(84, 'Nord-Pas-de-Calais', 'France', '59.82239, -83.26416'),
(85, 'Pays de la Loire', 'France', '22.27761, -80.15398'),
(86, 'Lorraine', 'France', '88.35738, 137.36844'),
(87, 'Nord-Pas-de-Calais', 'France', '-88.0307, -149.22553'),
(88, 'Basse-Normandie', 'France', '-17.16658, 159.56214'),
(89, 'Bourgogne', 'France', '-18.94043, -98.98552');

--
-- Triggers `ville`
--
DROP TRIGGER IF EXISTS `ValidationPays`;
DELIMITER $$
CREATE TRIGGER `ValidationPays` BEFORE INSERT ON `ville` FOR EACH ROW BEGIN IF NEW.pays IS NULL THEN SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'nom de Pays ne doit pas etre vide'; END IF; END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `covoitureurs actifs`
--
DROP TABLE IF EXISTS `covoitureurs actifs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `covoitureurs actifs`  AS  select `membre`.`nom` AS `actif`,`membre`.`prenom` AS `role` from `membre` where ((`membre`.`active` = 1) and (`membre`.`role` in (1,2))) WITH CASCADED CHECK OPTION ;

-- --------------------------------------------------------

--
-- Structure for view `covoitureurs inscrits`
--
DROP TABLE IF EXISTS `covoitureurs inscrits`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `covoitureurs inscrits`  AS  select `membre`.`nom` AS `nom`,`membre`.`prenom` AS `prenom`,`membre`.`sexe` AS `sexe` from `membre` where (`membre`.`role` in (1,2)) WITH CASCADED CHECK OPTION ;

-- --------------------------------------------------------

--
-- Structure for view `notification de covoitureurs mal apprécié`
--
DROP TABLE IF EXISTS `notification de covoitureurs mal apprécié`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `notification de covoitureurs mal apprécié`  AS  select `notifications`.`expMemb` AS `expMemb`,`notifications`.`destMemb` AS `destMemb` from `notifications` where (`notifications`.`Appreciation` > 4) ;

-- --------------------------------------------------------

--
-- Structure for view `notification pour chaque covoitureur`
--
DROP TABLE IF EXISTS `notification pour chaque covoitureur`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `notification pour chaque covoitureur`  AS  select `notifications`.`expMemb` AS `expMemb`,`notifications`.`destMemb` AS `destMemb`,`notifications`.`moment` AS `moment`,`notifications`.`Appreciation` AS `appreciation` from `notifications` ;

-- --------------------------------------------------------

--
-- Structure for view `offres de covoiturages`
--
DROP TABLE IF EXISTS `offres de covoiturages`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `offres de covoiturages`  AS  select `offres`.`idVehicule` AS `idVehicule`,`offres`.`date_dep` AS `date_dep`,`offres`.`prix` AS `prix`,`offres`.`description` AS `description` from `offres` where (`offres`.`date_dep` < unix_timestamp(now())) ;

-- --------------------------------------------------------

--
-- Structure for view `places disponibles encore pour cehicues`
--
DROP TABLE IF EXISTS `places disponibles encore pour cehicues`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `places disponibles encore pour cehicues`  AS  select `vehicule`.`marque` AS `marque` from `vehicule` where (`vehicule`.`nbp` < 4) ;

-- --------------------------------------------------------

--
-- Structure for view `reservation en cours`
--
DROP TABLE IF EXISTS `reservation en cours`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reservation en cours`  AS  select `reservation`.`passIdMembre` AS `passIdMembre`,`reservation`.`villeDep` AS `villeDep`,`reservation`.`villeAr` AS `villeAr` from `reservation` ;

-- --------------------------------------------------------

--
-- Structure for view `trajets des villes visibles sur google map marqueurs`
--
DROP TABLE IF EXISTS `trajets des villes visibles sur google map marqueurs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `trajets des villes visibles sur google map marqueurs`  AS  select `ville`.`nom` AS `nom`,`ville`.`pays` AS `pays` from `ville` ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `cleetr` FOREIGN KEY (`expMemb`) REFERENCES `membre` (`id`),
  ADD CONSTRAINT `foreignKey` FOREIGN KEY (`destMemb`) REFERENCES `membre` (`id`);

--
-- Constraints for table `offres`
--
ALTER TABLE `offres`
  ADD CONSTRAINT `offres_ibfk_1` FOREIGN KEY (`idVehicule`) REFERENCES `vehicule` (`immat`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `cleEtrdevillDep` FOREIGN KEY (`villeDep`) REFERENCES `ville` (`idVille`),
  ADD CONSTRAINT `cleEtrfillArr` FOREIGN KEY (`villeAr`) REFERENCES `ville` (`idVille`),
  ADD CONSTRAINT `reservation2` FOREIGN KEY (`idOffres`) REFERENCES `offres` (`idOffres`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`passIdMembre`) REFERENCES `membre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trajettype`
--
ALTER TABLE `trajettype`
  ADD CONSTRAINT `cleduveh` FOREIGN KEY (`immatVehicule`) REFERENCES `vehicule` (`immat`),
  ADD CONSTRAINT `trajet-type_arr` FOREIGN KEY (`villeAr`) REFERENCES `ville` (`idVille`),
  ADD CONSTRAINT `trajettype_ibfk_1` FOREIGN KEY (`villeDep`) REFERENCES `ville` (`idVille`);

--
-- Constraints for table `vehicule`
--
ALTER TABLE `vehicule`
  ADD CONSTRAINT `cledeMemnre` FOREIGN KEY (`idMembre`) REFERENCES `membre` (`id`);

DELIMITER $$
--
-- Events
--
DROP EVENT `Mettre indication de covoitureur actif à 0(cad non actif)`$$
CREATE DEFINER=`root`@`localhost` EVENT `Mettre indication de covoitureur actif à 0(cad non actif)` ON SCHEDULE EVERY 10 HOUR STARTS '2017-12-02 00:00:00' ENDS '2017-12-31 00:00:00' ON COMPLETION PRESERVE ENABLE COMMENT 'Fermer session si on a atteint plus de 10h sans se connecter' DO UPDATE memebre SET active = 0$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
