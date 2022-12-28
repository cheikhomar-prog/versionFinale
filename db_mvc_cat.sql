-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 01 juil. 2022 à 21:28
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_mvc_cat`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `nomComplet` varchar(40) COLLATE utf8_bin NOT NULL,
  `email` varchar(80) COLLATE utf8_bin NOT NULL,
  `passWord` varchar(60) COLLATE utf8_bin NOT NULL,
  `numTele` varchar(40) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`nomComplet`, `email`, `passWord`, `numTele`) VALUES
('reda', 'admin@gmail.com', 'admin123', '113344556677');

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomComplet` varchar(70) NOT NULL,
  `email` varchar(70) NOT NULL,
  `password` varchar(70) NOT NULL,
  `Numerotelephone` varchar(20) NOT NULL,
  `datenaissance` date DEFAULT NULL,
  `adresse` varchar(70) DEFAULT NULL,
  `salt` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id`, `nomComplet`, `email`, `password`, `Numerotelephone`, `datenaissance`, `adresse`, `salt`) VALUES
(3, 'mouad', 'mouadbenthami@gmail.com', 'Oi8bhJRzlC1QWCMOrOXEA+dziSkN4ecWWz5zSv0hS6c=', '+212 060 132 432', '2001-05-13', 'teouane  city', 'b0XoQvkqg6uyAq5ZcssxgbBOoZoT3c'),
(12, 'hatim benomar', 'hatim999@gmail.com', 'rGKQDqH9iIE1UjYcnymmYssfolr47dGVt7DoAVrokM4=', '0633316570', '2005-02-03', 'MARTIL', '3yG5TgQqhuLaRcmVQGakiDTkdOTxzd'),
(10, 'Driss BENOMAR', 'benomard999@gmail.com', 'GhNfpIvNLx5jC7HsQx8PeNqw/tG2I7QEEbZP8Pxg+cA=', '0633316570', '2001-02-03', 'MARTIL', '3uf4O3gKT2DBz4TezaUrqemSdCz2L3'),
(16, 'khalid', 'khail@gmail.com', '6T5/yB3RshGjuUhdHj1/KHwNWV52cqH1ncOMmLuEM50=', '771122336699', '2000-11-11', 'av kholdon tetouan maroc', 'vRi5aJa6cXhCYqJNPFw9CuQD6g3YOS'),
(17, 'Driss BENOMAR', 'bennnnn@gmail.com', 'wiMXpn9NhBLqx1ugnm8rRN/u/lViZawJoyQz+2YR9rs=', '0633316570', '2001-02-03', 'MARTIL', 'FJEUibsz5zhtpCj1Zj6bcKWO8qI8FU');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idclient` int(11) NOT NULL,
  `datelivraison` date NOT NULL,
  `datecommande` date NOT NULL,
  `prixtotale` double NOT NULL,
  `idTache` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idclient` (`idclient`),
  KEY `idTache` (`idTache`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `idclient`, `datelivraison`, `datecommande`, `prixtotale`, `idTache`) VALUES
(14, 16, '2022-06-16', '2022-06-16', 140, 49),
(19, 3, '2022-06-18', '2022-06-18', 8, 50),
(16, 3, '2022-06-17', '2022-06-18', 190, 50),
(17, 3, '2022-06-17', '2022-06-17', 320, 49),
(18, 3, '2022-06-17', '2022-06-17', 200, 50),
(20, 17, '2022-07-01', '2022-07-01', 33, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `commandelivrer`
--

DROP TABLE IF EXISTS `commandelivrer`;
CREATE TABLE IF NOT EXISTS `commandelivrer` (
  `id` int(11) NOT NULL,
  `idClient` int(11) NOT NULL,
  `dateLivraison` date NOT NULL,
  `dateCommande` date NOT NULL,
  `prixTotale` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idClient` (`idClient`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commandelivrer`
--

INSERT INTO `commandelivrer` (`id`, `idClient`, `dateLivraison`, `dateCommande`, `prixTotale`) VALUES
(1, 3, '2022-03-20', '2022-03-30', 232),
(5, 13, '2022-03-20', '2022-03-30', 111),
(6, 16, '2022-03-20', '2022-03-30', 231),
(9, 16, '2022-03-12', '2022-04-08', 123.76),
(3, 3, '2022-06-17', '2022-06-15', 123),
(4, 13, '2022-06-16', '2022-06-14', 264);

-- --------------------------------------------------------

--
-- Structure de la table `commendeproduit`
--

DROP TABLE IF EXISTS `commendeproduit`;
CREATE TABLE IF NOT EXISTS `commendeproduit` (
  `idproduit` int(11) NOT NULL,
  `idcommende` int(11) NOT NULL,
  `quantiteproduit` double NOT NULL,
  KEY `idcommende` (`idcommende`),
  KEY `idproduit` (`idproduit`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commendeproduit`
--

INSERT INTO `commendeproduit` (`idproduit`, `idcommende`, `quantiteproduit`) VALUES
(1, 3, 1.75),
(2, 9, 13),
(3, 9, 11),
(10, 9, 13),
(12, 9, 11),
(11, 7, 4),
(2, 7, 6),
(19, 7, 4),
(21, 7, 6),
(19, 13, 1),
(20, 13, 3),
(23, 14, 2),
(21, 14, 1),
(21, 15, 2),
(23, 15, 1),
(19, 16, 2),
(21, 16, 1),
(23, 16, 2),
(21, 17, 1),
(20, 17, 1),
(20, 18, 1),
(19, 18, 1),
(26, 19, 2),
(25, 20, 1),
(28, 20, 2);

-- --------------------------------------------------------

--
-- Structure de la table `demande_livreurs`
--

DROP TABLE IF EXISTS `demande_livreurs`;
CREATE TABLE IF NOT EXISTS `demande_livreurs` (
  `cin` varchar(20) NOT NULL,
  `nomComplet` varchar(30) NOT NULL,
  `DATENAISSANCE` date NOT NULL,
  `ADRESSE` varchar(50) NOT NULL,
  `NUMEROTELEPHONE` varchar(20) NOT NULL,
  `EMAIL` varchar(40) NOT NULL,
  PRIMARY KEY (`cin`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `livreurs`
--

DROP TABLE IF EXISTS `livreurs`;
CREATE TABLE IF NOT EXISTS `livreurs` (
  `cin` varchar(20) NOT NULL,
  `NOMCOMPLET` varchar(30) NOT NULL,
  `DATENAISSANCE` date NOT NULL,
  `ADRESSE` varchar(50) NOT NULL,
  `NUMEROTELEPHONE` varchar(20) NOT NULL,
  PRIMARY KEY (`cin`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `livreurs`
--

INSERT INTO `livreurs` (`cin`, `NOMCOMPLET`, `DATENAISSANCE`, `ADRESSE`, `NUMEROTELEPHONE`) VALUES
('p902', 'ali tantan', '1999-11-12', 'av marrakech rue 3 tetouan casa', '0612345678'),
('ABCDE1234', 'rida lhamidi', '2001-02-03', 'av 9 avril MARTIL Maroc', '0632116570'),
('ABCDE', 'mohamed lkhaldi', '2000-11-11', 'av casablanca rue 3 tetouan maroc', '07781532215');

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

DROP TABLE IF EXISTS `panier`;
CREATE TABLE IF NOT EXISTS `panier` (
  `idClient` int(11) NOT NULL,
  `idProduit` int(11) NOT NULL,
  `quantiteProduit` int(11) NOT NULL,
  KEY `idClient` (`idClient`),
  KEY `idProduit` (`idProduit`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `ID_PRODUIT` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_PRODUIT` varchar(25) NOT NULL,
  `PRIX` double NOT NULL,
  `Quantite` double NOT NULL,
  `prixAchat` double NOT NULL,
  `remis` double NOT NULL,
  `profit` double NOT NULL,
  `QuantiteVendue` double DEFAULT NULL,
  PRIMARY KEY (`ID_PRODUIT`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`ID_PRODUIT`, `NOM_PRODUIT`, `PRIX`, `Quantite`, `prixAchat`, `remis`, `profit`, `QuantiteVendue`) VALUES
(24, 'CONCOMBRE', 8, 11, 7, 0, 1, 0),
(25, 'AUBERGINE', 6, 9, 5, 0, 1, 0),
(26, 'TOMATE', 8, 15, 6, 0, 2, 3),
(27, 'OIGNON', 10, 7, 7, 0, 3, 1),
(28, 'Pomme', 14, 17, 11, 1, 2, 5),
(29, 'Fraise', 12, 11, 7, 0, 5, 3),
(30, 'KIWI', 25, 7, 21, 0, 4, 1),
(31, 'Mandarines', 10, 11, 7, 0, 3, 2),
(32, 'ANANAS', 30, 12, 24, 0, 6, 2),
(33, 'BANANE', 14, 7, 9, 0, 5, 2),
(34, 'AIL', 17, 22, 15, 2, 0, 0),
(35, 'CHILI', 7, 11, 3.5, 0, 3.5, 3),
(36, 'JUS DE FRUIT', 23, 6, 17, 2, 4, 0),
(37, 'BROCOLI', 14, 6, 11, 0, 3, 0),
(38, 'CHOU ROUGE', 17, 9, 14, 0, 3, 0),
(39, 'HARICOTS VERTS', 9, 13, 4, 0, 5, 2),
(40, 'POIVRON', 12, 11, 8, 1, 3, 1),
(41, 'lenovo', 3500, 4, 3000, 0, 500, 2);

-- --------------------------------------------------------

--
-- Structure de la table `tache`
--

DROP TABLE IF EXISTS `tache`;
CREATE TABLE IF NOT EXISTS `tache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cin` varchar(20) DEFAULT NULL,
  `matricule` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cin` (`cin`),
  KEY `matricule` (`matricule`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tache`
--

INSERT INTO `tache` (`id`, `cin`, `matricule`) VALUES
(32, 'p902', '44 1959'),
(46, 'ABCDE', '77722321'),
(44, 'p902', 'QSA11'),
(49, 'ABCDE1234', 'AWMM');

-- --------------------------------------------------------

--
-- Structure de la table `voitures`
--

DROP TABLE IF EXISTS `voitures`;
CREATE TABLE IF NOT EXISTS `voitures` (
  `matricule` varchar(20) NOT NULL,
  `marque` varchar(20) NOT NULL,
  PRIMARY KEY (`matricule`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `voitures`
--

INSERT INTO `voitures` (`matricule`, `marque`) VALUES
('QSA11', 'fiat'),
('44 1959', 'renult'),
('77722321', 'toyota '),
('AWMM', 'dacia logan');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
