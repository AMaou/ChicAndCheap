-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Sam 26 Décembre 2015 à 00:39
-- Version du serveur :  5.6.24
-- Version de PHP :  5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `chicandcheap`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `CODEART` char(8) COLLATE utf8_unicode_ci NOT NULL,
  `CODECAT` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `CodeType` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `CODECOULEUR` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `LIBELLEART` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` longtext COLLATE utf8_unicode_ci,
  `TAILLE` char(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Prix` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`CODEART`, `CODECAT`, `CodeType`, `CODECOULEUR`, `LIBELLEART`, `DESCRIPTION`, `TAILLE`, `Prix`) VALUES
('0706_357', 'H', 'M01', 'blue01', 'MANTEAU CROISÉ', 'COMPOSITION\r\n\r\nEXTÉRIEUR\r\n\r\n79% laine, 21% polyamide\r\n\r\nDOUBLURE\r\n\r\n100% polyester', 'm', 159),
('5992_661', 'E', 'M01', 'black01', 'MANTEAU ENFANT', 'COMPOSITION\r\n\r\nEXTÉRIEUR\r\n\r\nTOP: 55% coton, 45% nylon\r\n\r\nCAPUCHE: 100% coton\r\n\r\nDOUBLURE\r\n\r\n100% polyester\r\n\r\nREMBOURRAGE\r\n\r\n100% polyester\r\n\r\n* SAUF DÉCORATIONS', '9 ans', 49),
('ManStre0', 'F', 'M01', 'black01', 'MANTEAU EFFET ASTRAC', 'COMPOSITION\r\n\r\nEXTÉRIEUR\r\n\r\nTISSU PRINCIPAL: 70% mohair, 17% coton, 9% polyamide, 4% laine\r\n\r\nTISSU SECONDAIRE: 45% laine, 30% polyester, 25% viscose\r\n\r\nDOUBLURE\r\n\r\n100% viscose', 'L', 300),
('PUB1', 'H', 'P01', 'blue01', 'Pull Homme Bleu', 'Pull, ta chaud ça race', 'L', 15),
('ROR1', 'F', 'R01', 'red01', 'Longue Robe Rouge', 'Cette robe elle tue', 'M', 150);

-- --------------------------------------------------------

--
-- Structure de la table `categoriearticleclient`
--

CREATE TABLE IF NOT EXISTS `categoriearticleclient` (
  `CODECAT` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `LIBELLECAT` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `categoriearticleclient`
--

INSERT INTO `categoriearticleclient` (`CODECAT`, `LIBELLECAT`) VALUES
('E', 'enfant'),
('F', 'femme'),
('H', 'homme');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE IF NOT EXISTS `commande` (
  `NUMEROCOMMANDE` char(26) COLLATE utf8_unicode_ci NOT NULL,
  `id_visiteur` int(11) NOT NULL,
  `dateCommande` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`NUMEROCOMMANDE`, `id_visiteur`, `dateCommande`) VALUES
('01', 1, '2015-12-25');

-- --------------------------------------------------------

--
-- Structure de la table `couleur`
--

CREATE TABLE IF NOT EXISTS `couleur` (
  `CODECOULEUR` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `LIBELLECOULEUR` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `couleur`
--

INSERT INTO `couleur` (`CODECOULEUR`, `LIBELLECOULEUR`) VALUES
('black01', 'Noir'),
('blue01', 'bleu'),
('grey01', 'Gris'),
('Mar01', 'Marron'),
('oran01', 'Orange'),
('pink01', 'Rose'),
('red01', 'rouge '),
('white01', 'Blanc'),
('Yel01', 'Jaune');

-- --------------------------------------------------------

--
-- Structure de la table `lignecommande`
--

CREATE TABLE IF NOT EXISTS `lignecommande` (
  `NUMEROCOMMANDE` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `CODEART` char(8) COLLATE utf8_unicode_ci NOT NULL,
  `QTE` decimal(8,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `lignecommande`
--

INSERT INTO `lignecommande` (`NUMEROCOMMANDE`, `CODEART`, `QTE`) VALUES
('01', '0706_357', '5'),
('01', '5992_661', '2');

-- --------------------------------------------------------

--
-- Structure de la table `typearticle`
--

CREATE TABLE IF NOT EXISTS `typearticle` (
  `CodeType` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `LibelleType` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `typearticle`
--

INSERT INTO `typearticle` (`CodeType`, `LibelleType`) VALUES
('A01', 'Accessoire'),
('B01', 'Blazers'),
('C01', 'Chaussures'),
('C02', 'Chemises'),
('J01', 'Jupes'),
('M01', 'Manteaux'),
('P01', 'Pull'),
('P03', 'Pantalons'),
('R01', 'Robe Court'),
('R02', 'robe longu'),
('S01', 'Sacs'),
('S02', 'Smocking'),
('V02', 'Vestes');

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

CREATE TABLE IF NOT EXISTS `visiteur` (
  `id_visiteur` int(11) NOT NULL,
  `nom_visiteur` varchar(100) DEFAULT NULL,
  `prenom_visiteur` varchar(100) DEFAULT NULL,
  `adresse_visiteur` varchar(200) DEFAULT NULL,
  `cp_visiteur` char(5) DEFAULT NULL,
  `ville_visiteur` varchar(100) DEFAULT NULL,
  `login_visiteur` varchar(50) DEFAULT NULL,
  `pwd_visiteur` varchar(200) DEFAULT NULL,
  `salt` varchar(23) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `visiteur`
--

INSERT INTO `visiteur` (`id_visiteur`, `nom_visiteur`, `prenom_visiteur`, `adresse_visiteur`, `cp_visiteur`, `ville_visiteur`, `login_visiteur`, `pwd_visiteur`, `salt`, `role`) VALUES
(1, 'Villechalane', 'Louis', '8 cours Lafontaine', '29000', 'BREST', 'Villechalane', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(2, 'Andre', 'David', '1 r Aimon de Chissée', '38100', 'GRENOBLE', 'Andre', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(3, 'Bedos', 'Christian', '1 r Bénédictins', '65000', 'TARBES', 'Bedos', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(4, 'Tusseau', 'Louis', '22 r Renou', '86000', 'POITIERS', 'TusseauL', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(5, 'Bentot', 'Pascal', '11 av 6 Juin', '67000', 'STRASBOURG', 'Bentot', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(6, 'Bioret', 'Luc', '1 r Linne', '35000', 'RENNES', 'Bioret', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(7, 'Bunisset', 'Francis', '10 r Nicolas Chorier', '85000', 'LA ROCHE SUR YON', 'BunissetF', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(8, 'Bunisset', 'Denise', '1 r Lionne', '49100', 'ANGERS', 'BunissetD', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(9, 'Cacheux', 'Bernard', '114 r Authie', '34000', 'MONTPELLIER', 'Cacheux', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(10, 'Cadic', 'Eric', '123 r Caponière', '41000', 'BLOIS', 'Cadic', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(11, 'Charoze', 'Catherine', '100 pl Géants', '33000', 'BORDEAUX', 'Charoze', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(12, 'Clepkens', 'Christophe', '12 r Fédérico Garcia Lorca', '13000', 'MARSEILLE', 'Clepkens', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(13, 'Cottin', 'Vincenne', '36 sq Capucins', '05000', 'GAP', 'Cottin', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(14, 'Daburon', 'François', '13 r Champs Elysées', '06000', 'NICE', 'Daburon', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(15, 'De', 'Philippe', '13 r Charles Peguy', '10000', 'TROYES', 'De', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(16, 'Debelle', 'Michel', '181 r Caponière', '88000', 'EPINAL', 'DebelleM', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(17, 'Debelle', 'Jeanne', '134 r Stalingrad', '44000', 'NANTES', 'DebelleJ', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(18, 'Debroise', 'Michel', '2 av 6 Juin', '70000', 'VESOUL', 'Debroise', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(19, 'Desmarquest', 'Nathalie', '14 r Fédérico Garcia Lorca', '54000', 'NANCY', 'Desmarquest', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(20, 'Desnost', 'Pierre', '16 r Barral de Montferrat', '55000', 'VERDUN', 'Desnost', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(21, 'Dudouit', 'Frédéric', '18 quai Xavier Jouvin', '75000', 'PARIS', 'Dudouit', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(22, 'Duncombe', 'Claude', '19 av Alsace Lorraine', '09000', 'FOIX', 'Duncombe', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(23, 'Enault-Pascreau', 'Céline', '25B r Stalingrad', '40000', 'MONT DE MARSAN', 'Enault-Pascreau', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(24, 'Eynde', 'Valérie', '3 r Henri Moissan', '76000', 'ROUEN', 'Eynde', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(25, 'Finck', 'Jacques', 'rte Montreuil Bellay', '74000', 'ANNECY', 'Finck', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(26, 'Frémont', 'Fernande', '4 r Jean Giono', '69000', 'LYON', 'Frémont', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(27, 'Gest', 'Alain', '30 r Authie', '46000', 'FIGEAC', 'Gest', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(28, 'Gheysen', 'Galassus', '32 bd Mar Foch', '75000', 'PARIS', 'Gheysen', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(29, 'Girard', 'Yvon', '31 av 6 Juin', '80000', 'AMIENS', 'Girard', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(30, 'Gombert', 'Luc', '32 r Emile Gueymard', '56000', 'VANNES', 'Gombert', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(31, 'Guindon', 'Caroline', '40 r Mar Montgomery', '87000', 'LIMOGES', 'GuindonC', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(32, 'Guindon', 'François', '44 r Picotière', '19000', 'TULLE', 'GuindonF', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(33, 'Igigabel', 'Guy', '33 gal Arlequin', '94000', 'CRETEIL', 'Igigabel', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(34, 'Jourdren', 'Pierre', '34 av Jean Perrot', '15000', 'AURRILLAC', 'Jourdren', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(35, 'Juttard', 'Pierre-Raoul', '34 cours Jean Jaurès', '08000', 'SEDAN', 'Juttard', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(36, 'Labouré-Morel', 'Saout', '38 cours Berriat', '52000', 'CHAUMONT', 'Labouré-Morel', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(37, 'Landré', 'Philippe', '4 av Gén Laperrine', '59000', 'LILLE', 'Landré', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(38, 'Langeard', 'Hugues', '39 av Jean Perrot', '93000', 'BAGNOLET', 'Langeard', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(39, 'Lanne', 'Bernard', '4 r Bayeux', '30000', 'NIMES', 'Lanne', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(40, 'Le', 'Noël', '4 av Beauvert', '68000', 'MULHOUSE', 'LeN', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(41, 'Le', 'Jean', '39 r Raspail', '53000', 'LAVAL', 'LeJ', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(42, 'Leclercq', 'Servane', '11 r Quinconce', '18000', 'BOURGES', 'Leclercq', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(43, 'Lecornu', 'Jean-Bernard', '4 bd Mar Foch', '72000', 'LA FERTE BERNARD', 'LecornuJ', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(44, 'Lecornu', 'Ludovic', '4 r Abel Servien', '25000', 'BESANCON', 'LecornuL', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(45, 'Lejard', 'Agnès', '4 r Anthoard', '82000', 'MONTAUBAN', 'Lejard', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(46, 'Lesaulnier', 'Pascal', '47 r Thiers', '57000', 'METZ', 'Lesaulnier', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(47, 'Letessier', 'Stéphane', '5 chem Capuche', '27000', 'EVREUX', 'Letessier', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(48, 'Loirat', 'Didier', 'Les Pêchers cité Bourg la Croix', '45000', 'ORLEANS', 'Loirat', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(49, 'Maffezzoli', 'Thibaud', '5 r Chateaubriand', '02000', 'LAON', 'Maffezzoli', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(50, 'Mancini', 'Anne', '5 r D''Agier', '48000', 'MENDE', 'Mancini', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(51, 'Marcouiller', 'Gérard', '7 pl St Gilles', '91000', 'ISSY LES MOULINEAUX', 'Marcouiller', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(52, 'Michel', 'Jean-Claude', '5 r Gabriel Péri', '61000', 'FLERS', 'Michel', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(53, 'Montecot', 'Françoise', '6 r Paul Valéry', '17000', 'SAINTES', 'Montecot', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(54, 'Notini', 'Veronique', '5 r Lieut Chabal', '60000', 'BEAUVAIS', 'Notini', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(55, 'Onfroy', 'Den', '5 r Sidonie Jacolin', '37000', 'TOURS', 'Onfroy', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(56, 'Pascreau', 'Charles', '57 bd Mar Foch', '64000', 'PAU', 'Pascreau', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(57, 'Pernot', 'Claude-Noël', '6 r Alexandre 1 de Yougoslavie', '11000', 'NARBONNE', 'Pernot', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(58, 'Perrier', 'Maître', '6 r Aubert Dubayet', '71000', 'CHALON SUR SAONE', 'Perrier', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(59, 'Petit', 'Jean-Louis', '7 r Ernest Renan', '50000', 'SAINT LO', 'Petit', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(60, 'Piquery', 'Patrick', '9 r Vaucelles', '14000', 'CAEN', 'Piquery', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(61, 'Quiquandon', 'Joël', '7 r Ernest Renan', '29000', 'QUIMPER', 'Quiquandon', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(62, 'Retailleau', 'Josselin', '88Bis r Saumuroise', '39000', 'DOLE', 'RetailleauJ', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(63, 'Retailleau', 'Pascal', '32 bd Ayrault', '23000', 'MONTLUCON', 'RetailleauP', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(64, 'Souron', 'Maryse', '7B r Gay Lussac', '21000', 'DIJON', 'Souron', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(65, 'Tiphagne', 'Patrick', '7B r Gay Lussac', '62000', 'ARRAS', 'Tiphagne', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(66, 'Tréhet', 'Alain', '7D chem Barral', '12000', 'RODEZ', 'Tréhet', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(67, 'Tusseau', 'Josselin', '63 r Bon Repos', '28000', 'CHARTRES', 'TusseauJ', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(68, 'swiss', 'bourdin', '', '', '', 'swiss', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(69, 'Auchon', 'Paul', '', '', '', 'auchon', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(70, 'Gathor', 'Ali', '', '', '', 'gathor', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(71, 'Zhette', 'Annie', '', '', '', 'zhette', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', ''),
(72, 'Khyroul', 'Pierre', '', '', '', 'khyroul', 'YRKBx8oeQ2sLBrEqjJeqc8UwC9HPp+Ed6dhCeeHPQJ9vY4vbMepUbS14/rE6njWr4RZd4E+tU4pcOMI0h8Z6UA==', 'mnPEaJNz6,rUPbAYGg6$UXt', '');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`CODEART`), ADD KEY `CORRESPOND_FK` (`CODECOULEUR`), ADD KEY `CATEGORISER_FK` (`CODECAT`), ADD KEY `CORRESPONDRE_FK` (`CodeType`);

--
-- Index pour la table `categoriearticleclient`
--
ALTER TABLE `categoriearticleclient`
  ADD PRIMARY KEY (`CODECAT`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`NUMEROCOMMANDE`), ADD KEY `CONCERNE_FK` (`id_visiteur`);

--
-- Index pour la table `couleur`
--
ALTER TABLE `couleur`
  ADD PRIMARY KEY (`CODECOULEUR`);

--
-- Index pour la table `lignecommande`
--
ALTER TABLE `lignecommande`
  ADD PRIMARY KEY (`NUMEROCOMMANDE`,`CODEART`), ADD KEY `LIGNECOMMANDE_FK` (`NUMEROCOMMANDE`), ADD KEY `LIGNECOMMANDE2_FK` (`CODEART`);

--
-- Index pour la table `typearticle`
--
ALTER TABLE `typearticle`
  ADD PRIMARY KEY (`CodeType`);

--
-- Index pour la table `visiteur`
--
ALTER TABLE `visiteur`
  ADD PRIMARY KEY (`id_visiteur`), ADD UNIQUE KEY `uniq_login_visiteur` (`login_visiteur`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `visiteur`
--
ALTER TABLE `visiteur`
  MODIFY `id_visiteur` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=73;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
ADD CONSTRAINT `FK_CATEGORISER` FOREIGN KEY (`CODECAT`) REFERENCES `categoriearticleclient` (`CODECAT`),
ADD CONSTRAINT `FK_CORRESPOND` FOREIGN KEY (`CODECOULEUR`) REFERENCES `couleur` (`CODECOULEUR`),
ADD CONSTRAINT `cleEtrType` FOREIGN KEY (`CodeType`) REFERENCES `typearticle` (`CodeType`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
ADD CONSTRAINT `FK_CONCERNE` FOREIGN KEY (`id_visiteur`) REFERENCES `visiteur` (`id_visiteur`);

--
-- Contraintes pour la table `lignecommande`
--
ALTER TABLE `lignecommande`
ADD CONSTRAINT `FK_LIGNECOMMANDE` FOREIGN KEY (`NUMEROCOMMANDE`) REFERENCES `commande` (`NUMEROCOMMANDE`),
ADD CONSTRAINT `FK_LIGNECOMMANDE2` FOREIGN KEY (`CODEART`) REFERENCES `article` (`CODEART`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
