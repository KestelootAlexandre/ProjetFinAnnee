-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le : Ven 17 Mai 2013 à 09:58
-- Version du serveur: 5.5.20
-- Version de PHP: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `frais`
--

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

CREATE TABLE IF NOT EXISTS `etat` (
  `id` char(2) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
('CL', 'Saisie clôturée'),
('CR', 'Fiche créée, saisie en cours'),
('RB', 'Remboursée'),
('VA', 'Validée et mise en paiement');

-- --------------------------------------------------------

--
-- Structure de la table `fichefrais`
--

CREATE TABLE IF NOT EXISTS `fichefrais` (
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `nbJustificatifs` int(11) DEFAULT NULL,
  `montantValide` decimal(10,2) DEFAULT NULL,
  `dateModif` date DEFAULT NULL,
  `idEtat` char(2) DEFAULT 'CR',
  PRIMARY KEY (`idVisiteur`,`mois`),
  KEY `fichefrais_ibfk_1` (`idEtat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `fichefrais`
--

INSERT INTO `fichefrais` (`idVisiteur`, `mois`, `nbJustificatifs`, `montantValide`, `dateModif`, `idEtat`) VALUES
('', '201305', 0, '0.00', '2013-05-14', 'CR'),
('a55', '201305', 0, '0.00', '2013-05-16', 'CR'),
('a93', '201305', 0, '0.00', '2013-05-16', 'CR'),
('f4', '201305', 0, '0.00', '2013-05-13', 'CR');

-- --------------------------------------------------------

--
-- Structure de la table `fraisforfait`
--

CREATE TABLE IF NOT EXISTS `fraisforfait` (
  `id` char(3) NOT NULL,
  `libelle` char(20) DEFAULT NULL,
  `montant` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `fraisforfait`
--

INSERT INTO `fraisforfait` (`id`, `libelle`, `montant`) VALUES
('ETP', 'Forfait Etape', '110.00'),
('KM', 'Frais Kilométrique', '0.62'),
('NUI', 'Nuitée Hôtel', '80.00'),
('REP', 'Repas Restaurant', '25.00');

-- --------------------------------------------------------

--
-- Structure de la table `lignefraisforfait`
--

CREATE TABLE IF NOT EXISTS `lignefraisforfait` (
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `idFraisForfait` char(3) NOT NULL,
  `quantite` int(11) DEFAULT NULL,
  `montant` double DEFAULT NULL,
  PRIMARY KEY (`idVisiteur`,`mois`,`idFraisForfait`),
  KEY `lignefraisforfait_ibfk_2` (`idFraisForfait`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `lignefraisforfait`
--

INSERT INTO `lignefraisforfait` (`idVisiteur`, `mois`, `idFraisForfait`, `quantite`, `montant`) VALUES
('', '201305', 'ETP', 1, NULL),
('', '201305', 'KM', 0, NULL),
('', '201305', 'NUI', 0, NULL),
('', '201305', 'REP', 0, NULL),
('a55', '201305', 'ETP', 0, NULL),
('a55', '201305', 'KM', 0, NULL),
('a55', '201305', 'NUI', 0, NULL),
('a55', '201305', 'REP', 0, NULL),
('a93', '201305', 'ETP', 0, NULL),
('a93', '201305', 'KM', 0, NULL),
('a93', '201305', 'NUI', 0, NULL),
('a93', '201305', 'REP', 0, NULL),
('f4', '201305', 'ETP', 0, NULL),
('f4', '201305', 'KM', 0, NULL),
('f4', '201305', 'NUI', 0, NULL),
('f4', '201305', 'REP', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `lignefraishorsforfait`
--

CREATE TABLE IF NOT EXISTS `lignefraishorsforfait` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lignefraishorsforfait_ibfk_1` (`idVisiteur`,`mois`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `lignefraishorsforfait`
--

INSERT INTO `lignefraishorsforfait` (`id`, `idVisiteur`, `mois`, `libelle`, `date`, `montant`) VALUES
(1, '', '201305', 'stylos', '2013-05-14', '1.00');

-- --------------------------------------------------------

--
-- Structure de la table `profil`
--

CREATE TABLE IF NOT EXISTS `profil` (
  `id` int(10) NOT NULL,
  `profil` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `profil`
--

INSERT INTO `profil` (`id`, `profil`) VALUES
(1, 'comptable'),
(2, 'utilisateur');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` char(4) NOT NULL,
  `nom` char(30) DEFAULT NULL,
  `prenom` char(30) DEFAULT NULL,
  `login` char(20) DEFAULT NULL,
  `mdp` char(100) NOT NULL,
  `adresse` char(30) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `ville` char(30) DEFAULT NULL,
  `dateEmbauche` date DEFAULT NULL,
  `idProfil` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idProfil` (`idProfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `login`, `mdp`, `adresse`, `cp`, `ville`, `dateEmbauche`, `idProfil`) VALUES
('', 'laleau', 'Aymeric', 'Aymeric', '*A4B6157319038724E3560894F7F932C8886EBFCF', NULL, NULL, NULL, NULL, 1),
('a55', 'Bedos', 'Christian', 'cbedos', '*BCEFD2F413F98C73AAF5DB2D00B2F6DB602DD66B', '1 rue Peranud', '46250', 'Montcuq', '1995-01-12', 1),
('a93', 'Tusseau', 'Louis', 'ltusseau', '*81C69E65417F9E29D6676710DFFDE7FE739A78DF', '22 rue des Ternes', '46123', 'Gramat', '2000-05-01', 2),
('b13', 'Bentot', 'Pascal', 'pbentot', '*6A8412484D689587663CEFAF5BEC0DFB3D9DBBFC', '11 allée des Cerises', '46512', 'Bessines', '1992-07-09', 1),
('b16', 'Bioret', 'Luc', 'lbioret', '*EB1DB2531149F79E893ED5A27BB50F14B537F622', '1 Avenue gambetta', '46000', 'Cahors', '1998-05-11', 2),
('b19', 'Bunisset', 'Francis', 'fbunisset', '*139A702D4A8BC630BE369D1AFE89C8E93D822AED', '10 rue des Perles', '93100', 'Montreuil', '1987-10-21', 1),
('b25', 'Bunisset', 'Denise', 'dbunisset', '*7746AD490F2500EB06C9B4526209F96494C9725D', '23 rue Manin', '75019', 'paris', '2010-12-05', 2),
('b28', 'Cacheux', 'Bernard', 'bcacheux', '*E847C18EC7D6BAB8EC64DB478039140731FFEA1C', '114 rue Blanche', '75017', 'Paris', '2009-11-12', 1),
('b34', 'Cadic', 'Eric', 'ecadic', '*6C65DEB24FE7B939EFF4C60E70852048D3A19604', '123 avenue de la République', '75011', 'Paris', '2008-09-23', 2),
('b4', 'Charoze', 'Catherine', 'ccharoze', '*C924A9A7BEAA27B96202A5BD9553369BFA72046D', '100 rue Petit', '75019', 'Paris', '2005-11-12', 1),
('b50', 'Clepkens', 'Christophe', 'cclepkens', '*91704573C976CBC1F419E6ACA639285E9DDCF451', '12 allée des Anges', '93230', 'Romainville', '2003-08-11', 2),
('b59', 'Cottin', 'Vincenne', 'vcottin', '*C21C7A5258AF033FA3FF6717EBDDD37271C3111C', '36 rue Des Roches', '93100', 'Monteuil', '2001-11-18', 1),
('c14', 'Daburon', 'François', 'fdaburon', '*EBA18D10160F36CB81F3194FA24FEDAB8C740157', '13 rue de Chanzy', '94000', 'Créteil', '2002-02-11', 2),
('c3', 'De', 'Philippe', 'pde', '*69DD097E03E1B38FF4C900008946420398DE0570', '13 rue Barthes', '94000', 'Créteil', '2010-12-14', 1),
('c54', 'Debelle', 'Michel', 'mdebelle', '*FC8B03D5575E6221C8075AEBE9765F7AAF6AFFE1', '181 avenue Barbusse', '93210', 'Rosny', '2006-11-23', 2),
('d13', 'Debelle', 'Jeanne', 'jdebelle', '*17BD5E1325E0634CC1C13814036B23C6DB1F2025', '134 allée des Joncs', '44000', 'Nantes', '2000-05-11', 1),
('d51', 'Debroise', 'Michel', 'mdebroise', '*6015C0418FE9FE737B9E5F9A1CEEAF7F98852FC3', '2 Bld Jourdain', '44000', 'Nantes', '2001-04-17', 2),
('e22', 'Desmarquest', 'Nathalie', 'ndesmarquest', '*98A77500C60593DC403B2C42D075C5B0773EFC87', '14 Place d Arc', '45000', 'Orléans', '2005-11-12', 1),
('e24', 'Desnost', 'Pierre', 'pdesnost', '*CD8A7FF0FEB44D872EB82FE68896D514E2F4FA21', '16 avenue des Cèdres', '23200', 'Guéret', '2001-02-05', 2),
('e39', 'Dudouit', 'Frédéric', 'fdudouit', '*12FD3A4A94EEA5087DBBEDF7D0264C85C072967D', '18 rue de l église', '23120', 'GrandBourg', '2000-08-01', 1),
('e49', 'Duncombe', 'Claude', 'cduncombe', '*2C7867C3AD395DCBC72CFD56A398F80E9F2A8BE8', '19 rue de la tour', '23100', 'La souteraine', '1987-10-10', 2),
('e5', 'Enault-Pascreau', 'Céline', 'cenault', '*1391DA4E2A537D6CD7A001B94353B827A4A2C8FB', '25 place de la gare', '23200', 'Gueret', '1995-09-01', 1),
('e52', 'Eynde', 'Valérie', 'veynde', '*BB641A4FCCCF90E5E21ADCBB495A9AD4D7762723', '3 Grand Place', '13015', 'Marseille', '1999-11-01', 2),
('f21', 'Finck', 'Jacques', 'jfinck', '*8802B32F89BEB5272A9BB99B067DE74070EEE206', '10 avenue du Prado', '13002', 'Marseille', '2001-11-10', 1),
('f39', 'Frémont', 'Fernande', 'ffremont', '*D78FD78294C7A68CB09DBB60AED33E0D6D49ABBF', '4 route de la mer', '13012', 'Allauh', '1998-10-01', 2),
('f4', 'Gest', 'Alain', 'agest', '*513BD387CC21E493283EA9EC19746B1EA2375941', '30 avenue de la mer', '13025', 'Berre', '1985-11-01', 1);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD CONSTRAINT `fichefrais_ibfk_1` FOREIGN KEY (`idEtat`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `fichefrais_ibfk_2` FOREIGN KEY (`idVisiteur`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD CONSTRAINT `lignefraisforfait_ibfk_1` FOREIGN KEY (`idVisiteur`, `mois`) REFERENCES `fichefrais` (`idVisiteur`, `mois`),
  ADD CONSTRAINT `lignefraisforfait_ibfk_2` FOREIGN KEY (`idFraisForfait`) REFERENCES `fraisforfait` (`id`);

--
-- Contraintes pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD CONSTRAINT `lignefraishorsforfait_ibfk_1` FOREIGN KEY (`idVisiteur`, `mois`) REFERENCES `fichefrais` (`idVisiteur`, `mois`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`idProfil`) REFERENCES `profil` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
