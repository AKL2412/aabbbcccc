-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 20 Novembre 2014 à 22:41
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `gp`
--

-- --------------------------------------------------------

--
-- Structure de la table `affectation`
--

CREATE TABLE IF NOT EXISTS `affectation` (
  `departement` varchar(255) DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `affectationID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`affectationID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `affectation`
--

INSERT INTO `affectation` (`departement`, `service`, `affectationID`) VALUES
('DOSI', 'Gestion de risque', 4),
('Informatique', 'Sécurité Informatique et Conception de base de donnéés', 5),
('Informatique', 'Sécurité Informatique', 6),
('Informatique', 'Gestion de risque', 7),
('DOSI', 'Sécurité Informatique', 8),
('Informatique', 'Sécurité Informatique', 9),
('Informatique', 'Sécurité Informatique', 10),
('Equipe de foot', 'Joueur', 11),
('Marketing', 'Marketing digital', 12),
('Informatique', 'Sécurité Informatique', 13);

-- --------------------------------------------------------

--
-- Structure de la table `avance`
--

CREATE TABLE IF NOT EXISTS `avance` (
  `avanceID` int(11) NOT NULL AUTO_INCREMENT,
  `montant` float NOT NULL,
  `motif` text NOT NULL,
  `exercice` int(11) NOT NULL,
  `mois` int(11) NOT NULL,
  `date` date NOT NULL,
  `salarie` int(11) NOT NULL,
  PRIMARY KEY (`avanceID`),
  KEY `exercice` (`exercice`),
  KEY `salarie` (`salarie`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `avance`
--

INSERT INTO `avance` (`avanceID`, `montant`, `motif`, `exercice`, `mois`, `date`, `salarie`) VALUES
(1, 5000, 'Avance sur salaire, pour des problèmes de santé', 1, 11, '2014-11-20', 5);

-- --------------------------------------------------------

--
-- Structure de la table `bareme`
--

CREATE TABLE IF NOT EXISTS `bareme` (
  `baremeID` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `tranche` varchar(255) NOT NULL,
  `version` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `compagnieID` int(11) NOT NULL,
  `caractere` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`baremeID`),
  KEY `compagnieID` (`compagnieID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Contenu de la table `bareme`
--

INSERT INTO `bareme` (`baremeID`, `nom`, `tranche`, `version`, `type`, `compagnieID`, `caractere`, `description`) VALUES
(2, 'Impot sur revenu', 'somme', '1.0.0', 'Salarié', 2, 'optionnel', 'ras'),
(3, 'CNSS barème', 'somme', '1.0.0', 'Salarié', 3, 'obligatoire', ''),
(7, 'Mon bareme', 'somme', '1.0.0', 'Salarié', 1, 'obligatoire', 'ju'),
(8, 'Impot sur revenu', 'somme', '1.0.0', 'Salarié', 3, 'obligatoire', ''),
(9, 'Impot sur revenu', 'somme', '1.0.0', 'Salarié', 2, 'obligatoire', 'RAS'),
(10, 'Test barème patronal', 'anciennente', '1.0.0', 'Patronal', 3, 'optionnel', 'détails du barème'),
(12, 'un bareme obligat.', 'anciennente', '1.0.0', 'Patronal', 5, 'obligatoire', 'azeertyh');

-- --------------------------------------------------------

--
-- Structure de la table `commission`
--

CREATE TABLE IF NOT EXISTS `commission` (
  `montant` float NOT NULL,
  `motif` text NOT NULL,
  `commissionId` int(11) NOT NULL AUTO_INCREMENT,
  `salarie` int(11) NOT NULL,
  `mois` int(11) NOT NULL,
  `exercice` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`commissionId`),
  KEY `salarie` (`salarie`),
  KEY `exercice` (`exercice`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `commission`
--

INSERT INTO `commission` (`montant`, `motif`, `commissionId`, `salarie`, `mois`, `exercice`, `date`) VALUES
(500, 'pour service rendu', 1, 5, 11, 1, '2014-11-20');

-- --------------------------------------------------------

--
-- Structure de la table `compagnie`
--

CREATE TABLE IF NOT EXISTS `compagnie` (
  `compagnieID` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`compagnieID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `compagnie`
--

INSERT INTO `compagnie` (`compagnieID`, `nom`, `description`) VALUES
(1, 'AXA', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(2, 'RMA Watanya', 'Filiale du 2ème groupe plus grand groupe privé au Maroc, FinanceCom, RMA WATANYA a pris l?engagement, depuis plus de 60 ans, de protéger les biens et les personnes contre les risques de la vie et d?accompagner les particuliers, les professionnels et les entreprises dans la réalisation de leurs projets d?avenir en toute sérénité.\r\n \r\nPlusieurs centaines de milliers de particuliers et de professionnels et plusieurs milliers d?entreprises ont choisi les produits et bénéficient des services de RMA WATANYA avec des taux de satisfaction, régulièrement mesurés, particulièrement élevés.\r\n \r\nLa certification ISO 9001 de nos activités atteste de notre excellence opérationnelle notamment illustrée par HIFAD EXPRESS, notre service de règlement des sinistres matériels Auto en 24 H.\r\n \r\nAssureur leader des risques techniques -barrages, centrales thermiques, aéroports, etc.- mais également des assurances de la personne -maladie, décès, incapacité, etc.- RMA WATANYA s?affirme comme le premier assureur des entreprises au Maroc et entretient des partenariats avec plusieurs réseaux d?assureurs internationaux de renom : INI (International Network of Insurance), INSUROPE, etc.'),
(3, 'CNSS', ''),
(5, 'compagnie de bareme obligat.', 'ras');

-- --------------------------------------------------------

--
-- Structure de la table `conge`
--

CREATE TABLE IF NOT EXISTS `conge` (
  `details` text,
  `datedebut` date DEFAULT NULL,
  `datefin` date DEFAULT NULL,
  `jourtotal` int(11) DEFAULT NULL,
  `congeID` int(11) NOT NULL AUTO_INCREMENT,
  `salarieID` int(11) DEFAULT NULL,
  PRIMARY KEY (`congeID`),
  KEY `FK_Conge_Salarie` (`salarieID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `conge`
--

INSERT INTO `conge` (`details`, `datedebut`, `datefin`, `jourtotal`, `congeID`, `salarieID`) VALUES
('Congés maladie', '2014-11-10', '2014-11-12', 2, 1, 4),
('Repos general', '2014-11-12', '2014-11-25', 9, 2, 4),
('ras', '2014-11-13', '2014-11-20', 5, 3, 5);

-- --------------------------------------------------------

--
-- Structure de la table `contrat`
--

CREATE TABLE IF NOT EXISTS `contrat` (
  `datedebut` date DEFAULT NULL,
  `datedefin` date DEFAULT NULL,
  `datedefinperiodeessai` date DEFAULT NULL,
  `intituleemploi` varchar(255) DEFAULT NULL,
  `nature` varchar(255) DEFAULT NULL,
  `salairebrute` float DEFAULT NULL,
  `salairedebase` float DEFAULT NULL,
  `contratID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`contratID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `contrat`
--

INSERT INTO `contrat` (`datedebut`, `datedefin`, `datedefinperiodeessai`, `intituleemploi`, `nature`, `salairebrute`, `salairedebase`, `contratID`) VALUES
('2014-08-01', '2015-01-01', '2014-11-27', 'MIAGE', 'CDD', 2000, 1500, 4),
('2014-10-01', '2020-03-26', '2014-12-17', 'Chef de sécurité', 'CDI', 2000, 1500, 5),
('2014-10-01', '2015-01-25', '2014-10-03', 'Chef de sécurité', 'CDI', 2000, 1500, 6),
('2014-10-08', '2014-12-20', '2014-11-06', '', '', 201455, 1500, 7),
('2014-10-18', '2015-03-13', '2014-11-13', 'MIAGE', 'CDI', 25875, 12305, 8),
('2014-10-12', '2015-02-14', '2014-12-19', '', '', 2000, 1500, 9),
('2014-10-12', '2015-02-14', '2014-12-19', '', '', 2000, 1500, 10),
('2012-02-02', '2016-10-10', '2012-03-03', 'Joueur pro', 'CDD', 20000, 10000, 11),
('2013-11-17', '2015-11-17', '2013-12-31', 'Marketeur digital', 'CDD', 10000, 10000, 12),
('2008-08-01', '2017-12-31', '2008-11-12', 'Chef de sécurité', 'CDD', 1500, 1600, 13);

-- --------------------------------------------------------

--
-- Structure de la table `coordonneebancaire`
--

CREATE TABLE IF NOT EXISTS `coordonneebancaire` (
  `agence` varchar(255) DEFAULT NULL,
  `banque` varchar(255) DEFAULT NULL,
  `compte` varchar(255) DEFAULT NULL,
  `libellecompte` varchar(255) DEFAULT NULL,
  `coordoneebancaireID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`coordoneebancaireID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `coordonneebancaire`
--

INSERT INTO `coordonneebancaire` (`agence`, `banque`, `compte`, `libellecompte`, `coordoneebancaireID`) VALUES
('Zektouni agence ', 'BCP', '00445779955SC500', 'Dirham converti', 4),
('Ains', 'BCP', '00256846KO', 'Compte épargne', 5),
('Ains', 'BCP', '00256846KO', 'Compte épargne', 6),
('Zektouni agence ', 'BCP', '00445779955SC500', 'Dirham converti', 7),
('Zektouni agence ', 'BCP', '00445779955SC500', 'Dirham converti', 8),
('Zektouni agence ', 'BCP', '00445779955SC500', 'Dirham converti', 9),
('Zektouni agence ', 'BCP', '00445779955SC500', 'Dirham converti', 10),
('Bank Morgen Ag00', 'Morgen Bank', '002255478MO85', 'Compte d''épargne', 11),
('Agence de la place de la liberté', 'BNP Paris', 'QS0000C5589', 'Compte courant', 12),
('CYCLONICA 001', 'CYCLONICA', '192f05de2cc70701404', 'Compte courant', 13);

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

CREATE TABLE IF NOT EXISTS `document` (
  `modele` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `documentID` int(11) NOT NULL AUTO_INCREMENT,
  `salarieID` int(11) DEFAULT NULL,
  PRIMARY KEY (`documentID`),
  KEY `FK_Document_Salarie` (`salarieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `enfant`
--

CREATE TABLE IF NOT EXISTS `enfant` (
  `datenaissance` date DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `enfantID` int(11) NOT NULL AUTO_INCREMENT,
  `etatcivileID` int(11) DEFAULT NULL,
  PRIMARY KEY (`enfantID`),
  KEY `FK_Enfant_Etatcivile` (`etatcivileID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `enfant`
--

INSERT INTO `enfant` (`datenaissance`, `nom`, `prenom`, `enfantID`, `etatcivileID`) VALUES
('2010-10-23', 'RIOUK', 'ManDADA', 1, 5),
('2000-04-01', 'RIOUK', 'Jeanne D''Arc', 2, 5),
('2014-10-25', 'Romuald', 'Améssan', 4, 5),
('2011-11-18', 'ABY', 'Jean D''arc', 5, 4);

-- --------------------------------------------------------

--
-- Structure de la table `etatcivile`
--

CREATE TABLE IF NOT EXISTS `etatcivile` (
  `civilite` varchar(255) DEFAULT NULL,
  `matricule` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `situationfamiliale` varchar(255) DEFAULT NULL,
  `etatcivileID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`etatcivileID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `etatcivile`
--

INSERT INTO `etatcivile` (`civilite`, `matricule`, `nom`, `prenom`, `situationfamiliale`, `etatcivileID`) VALUES
('homme', '00OL', 'ABY', 'Kouassi léon JR', 'célibataire', 4),
('homme', '000OP', 'RIOUK', 'Benzema Palmo', 'Marié', 5),
('homme', '000OP', 'RIOUK', 'Benzema', 'Marié', 6),
('homme', 'aza', 'aa', 'zzz', 'Marié', 7),
('homme', 'zp00', 'Zoe', 'Palmo', 'célibataire', 8),
('femme', '000OP', 'Zoe', 'Bars', 'célibataire', 9),
('femme', '000OP', 'Zoe', 'Bars', 'célibataire', 10),
('homme', 'RM00785', 'Reus', 'Marco', 'marié', 11),
('homme', 'DLM7890', 'DUPON', 'Jean Marc la Bière', 'Marié', 12),
('homme', '4c260f15', 'Russo', 'Ophelia Gross Gay', 'Marié', 13);

-- --------------------------------------------------------

--
-- Structure de la table `exercice`
--

CREATE TABLE IF NOT EXISTS `exercice` (
  `exerciceID` int(11) NOT NULL AUTO_INCREMENT,
  `societeID` int(11) DEFAULT NULL,
  `intituleExercice` varchar(255) NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL,
  `encours` tinyint(1) NOT NULL,
  PRIMARY KEY (`exerciceID`),
  KEY `FK_Excercice_Societe` (`societeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `exercice`
--

INSERT INTO `exercice` (`exerciceID`, `societeID`, `intituleExercice`, `dateDebut`, `dateFin`, `encours`) VALUES
(1, 2, 'Exo du l''année 2015', '2015-01-06', '2015-12-26', 1),
(2, 2, 'Exo du l''année 2016', '2016-01-06', '2016-12-31', 0),
(4, 2, 'Exo du l''année 2017', '2017-01-01', '2017-11-30', 0),
(5, 3, 'Exo premier', '2014-01-06', '2014-12-31', 1);

-- --------------------------------------------------------

--
-- Structure de la table `immatriculation`
--

CREATE TABLE IF NOT EXISTS `immatriculation` (
  `adresse` varchar(255) DEFAULT NULL,
  `cin` varchar(255) DEFAULT NULL,
  `datenaissance` date DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `nationalite` varchar(255) DEFAULT NULL,
  `pays` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `immatriculationID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`immatriculationID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `immatriculation`
--

INSERT INTO `immatriculation` (`adresse`, `cin`, `datenaissance`, `mail`, `nationalite`, `pays`, `ville`, `immatriculationID`) VALUES
('rue 78 casablanca - maroc', 'BE56350X', '2014-09-03', 'kwsyaby@gmail.com', NULL, 'Cote d''Ivoire', 'Casablanca', 4),
('rue 78 milan - Italia', 'CV7895H', '1990-09-16', 'rioukb@gmail.com', NULL, 'Maroc', 'Rabat', 5),
('rue 78 casablanca - maroc', 'CV7895H', '1990-09-16', 'rioukb@gmail.com', NULL, 'Maroc', 'Rabat', 6),
('berlin 44 rue adjoint', 'CV7895H', '1982-10-15', 'rioukb@gmail.com', NULL, 'Maroc', 'Rabat', 7),
('berlin 44 rue adjoint', 'CV7895H', '1975-10-16', 'rioukb@gmail.com', NULL, 'Cote d''Ivoire', 'Casablanca', 8),
('madrid rue 400', 'CV7895H', '1987-10-29', 'Bzoe@gmail.com', NULL, 'USA', 'Chicago', 9),
('madrid rue 400', 'CV7895H', '1987-10-29', 'Bzoe@gmail.com', NULL, 'USA', 'Chicago', 10),
('20 rue das berlin', 'AQ785', '1990-01-01', 'rm@gmail.com', NULL, 'Allemagne', 'Berlin', 11),
('Rue des mariés casablanca', 'AZEO78WX', '1980-11-11', 'd.jmarc@yahoo.fr', NULL, 'France', 'Paris', 12),
('370 Vandervoort Avenue, Moscow, New Jersey, 7006', '6e83b38df020', '1984-05-20', 'grossgay@idealis.com', NULL, 'USA', 'New York', 13);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `messageID` int(11) NOT NULL AUTO_INCREMENT,
  `emetteur` int(11) NOT NULL,
  `destinataire` int(11) NOT NULL,
  `message` text NOT NULL,
  `date` datetime NOT NULL,
  `lu` tinyint(1) NOT NULL,
  `objet` varchar(250) NOT NULL,
  `propbareme` tinyint(1) NOT NULL,
  `description` text,
  PRIMARY KEY (`messageID`),
  KEY `emetteur` (`emetteur`),
  KEY `destinataire` (`destinataire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `paie`
--

CREATE TABLE IF NOT EXISTS `paie` (
  `modepayement` varchar(255) DEFAULT NULL,
  `salairebrute` float DEFAULT NULL,
  `salairedebase` float DEFAULT NULL,
  `paieID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`paieID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `paie`
--

INSERT INTO `paie` (`modepayement`, `salairebrute`, `salairedebase`, `paieID`) VALUES
('Virement', 2000, 1500, 1),
('Cheque', 2000, 1500, 2),
('Cheque', 2000, 1500, 3),
('Cheque', 201455, 1500, 4),
('Virement', 25875, 12305, 5),
('Virement', 2000, 1500, 6),
('Virement', 2000, 1500, 7),
('virement bancaire', 20000, 10000, 8),
('Virement', 10000, 10000, 9),
('Cheque', 1500, 1600, 10);

-- --------------------------------------------------------

--
-- Structure de la table `parametre`
--

CREATE TABLE IF NOT EXISTS `parametre` (
  `parametreId` int(11) NOT NULL AUTO_INCREMENT,
  `alertefinperiodeessai` int(20) DEFAULT NULL,
  `unite` varchar(100) DEFAULT NULL,
  `nbreunite` int(11) DEFAULT NULL,
  PRIMARY KEY (`parametreId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `parametre`
--

INSERT INTO `parametre` (`parametreId`, `alertefinperiodeessai`, `unite`, `nbreunite`) VALUES
(1, 14, 'jours', 26);

-- --------------------------------------------------------

--
-- Structure de la table `poste`
--

CREATE TABLE IF NOT EXISTS `poste` (
  `dateembauche` date DEFAULT NULL,
  `posteID` int(11) NOT NULL AUTO_INCREMENT,
  `affectationID` int(11) DEFAULT NULL,
  PRIMARY KEY (`posteID`),
  KEY `FK_Poste_Affectation` (`affectationID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `poste`
--

INSERT INTO `poste` (`dateembauche`, `posteID`, `affectationID`) VALUES
('2014-09-05', 4, 4),
('2014-09-24', 5, 5),
('2014-09-24', 6, 6),
('2014-10-17', 7, 7),
('2014-10-12', 8, 8),
('2014-10-24', 9, 9),
('2014-10-24', 10, 10),
('2012-02-02', 11, 11),
('2013-11-10', 12, 12),
('2008-08-01', 13, 13);

-- --------------------------------------------------------

--
-- Structure de la table `pret`
--

CREATE TABLE IF NOT EXISTS `pret` (
  `montant` float DEFAULT NULL,
  `pretID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`pretID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `prime`
--

CREATE TABLE IF NOT EXISTS `prime` (
  `primeID` int(11) NOT NULL AUTO_INCREMENT,
  `montant` float NOT NULL,
  `motif` text NOT NULL,
  `type` varchar(100) NOT NULL,
  `nom` varchar(250) NOT NULL,
  `societe` int(11) DEFAULT NULL,
  PRIMARY KEY (`primeID`),
  KEY `societe` (`societe`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `prime`
--

INSERT INTO `prime` (`primeID`, `montant`, `motif`, `type`, `nom`, `societe`) VALUES
(1, 400, 'Pour tous le travail de confiance', 'individuelle', 'Prime pour confiance', 2),
(2, 1500, 'Pour le respect des obligations', 'collective', 'Prime d''assiduité', 2);

-- --------------------------------------------------------

--
-- Structure de la table `primedate`
--

CREATE TABLE IF NOT EXISTS `primedate` (
  `primedateID` int(11) NOT NULL AUTO_INCREMENT,
  `prime` int(11) NOT NULL,
  `mois` int(11) NOT NULL,
  PRIMARY KEY (`primedateID`),
  KEY `prime` (`prime`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `primedate`
--

INSERT INTO `primedate` (`primedateID`, `prime`, `mois`) VALUES
(1, 1, 12),
(2, 2, 1),
(3, 2, 3),
(4, 2, 6),
(5, 2, 12);

-- --------------------------------------------------------

--
-- Structure de la table `primesalarie`
--

CREATE TABLE IF NOT EXISTS `primesalarie` (
  `primesalarieID` int(11) NOT NULL AUTO_INCREMENT,
  `salarie` int(11) NOT NULL,
  `prime` int(11) NOT NULL,
  `date` date NOT NULL,
  `exercice` int(11) NOT NULL,
  PRIMARY KEY (`primesalarieID`),
  KEY `salarie` (`salarie`),
  KEY `prime` (`prime`),
  KEY `exercice` (`exercice`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `primesalarie`
--

INSERT INTO `primesalarie` (`primesalarieID`, `salarie`, `prime`, `date`, `exercice`) VALUES
(1, 5, 1, '2014-11-20', 1);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `roleID` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `detail` text NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `role`
--

INSERT INTO `role` (`roleID`, `code`, `detail`, `num`) VALUES
(1, 'ROLE_ADMIN', 'Administrateur', 1),
(2, 'ROLE_USER', 'Compte ajouté par le compte par defaut de la société', 3),
(3, 'ROLE_SOCIETE', 'Le compte par defaut de la société', 2);

-- --------------------------------------------------------

--
-- Structure de la table `salaire`
--

CREATE TABLE IF NOT EXISTS `salaire` (
  `salaireId` int(11) NOT NULL AUTO_INCREMENT,
  `montant` float NOT NULL,
  `date` date NOT NULL,
  `salarie` int(11) NOT NULL,
  `exercice` int(11) NOT NULL,
  `mois` int(11) NOT NULL,
  PRIMARY KEY (`salaireId`),
  KEY `salarie` (`salarie`),
  KEY `exercice` (`exercice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `salarie`
--

CREATE TABLE IF NOT EXISTS `salarie` (
  `salarieID` int(11) NOT NULL AUTO_INCREMENT,
  `contratID` int(11) DEFAULT NULL,
  `immatriculationID` int(11) DEFAULT NULL,
  `societeID` int(11) DEFAULT NULL,
  `posteID` int(11) DEFAULT NULL,
  `coordoneebancaireID` int(11) DEFAULT NULL,
  `paieID` int(11) DEFAULT NULL,
  `etatcivileID` int(11) DEFAULT NULL,
  `dossier` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `nbrejour` int(11) NOT NULL,
  PRIMARY KEY (`salarieID`),
  KEY `FK_Salarie_Contrat` (`contratID`),
  KEY `FK_Salarie_Immatriculation` (`immatriculationID`),
  KEY `FK_Salarie_Societe` (`societeID`),
  KEY `FK_Salarie_Poste` (`posteID`),
  KEY `FK_Salarie_Coordoneebancaire` (`coordoneebancaireID`),
  KEY `FK_Salarie_Paie` (`paieID`),
  KEY `FK_Salarie_Etatcivile` (`etatcivileID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Contenu de la table `salarie`
--

INSERT INTO `salarie` (`salarieID`, `contratID`, `immatriculationID`, `societeID`, `posteID`, `coordoneebancaireID`, `paieID`, `etatcivileID`, `dossier`, `image`, `nbrejour`) VALUES
(4, 4, 4, 2, 4, 4, 1, 4, 'ABY-Kouassi-leon', 'logo.jpg', 11),
(5, 5, 5, 2, 5, 5, 2, 5, 'RIOUK-Benzema', 'logo.jpg', 17),
(6, 7, 7, 5, 7, 7, 4, 7, 'aa-zzz', NULL, 22),
(7, 8, 8, 5, 8, 8, 5, 8, 'Zoe-Palmo', NULL, 22),
(9, 10, 10, 5, 10, 10, 7, 10, 'Zoe-Bars', NULL, 22),
(10, 11, 11, 3, 11, 11, 8, 11, 'Reus-Marco', 'logo.jpg', 22),
(11, 12, 12, 2, 12, 12, 9, 12, 'DLM7890', 'logo.jpg', 22),
(12, 13, 13, 2, 13, 13, 10, 13, 'salarie20112014214351', 'logo.jpg', 22);

-- --------------------------------------------------------

--
-- Structure de la table `salariebareme`
--

CREATE TABLE IF NOT EXISTS `salariebareme` (
  `salariebaremeID` int(11) NOT NULL AUTO_INCREMENT,
  `salarie` int(11) NOT NULL,
  `bareme` int(11) NOT NULL,
  `salarieID` varchar(255) NOT NULL,
  PRIMARY KEY (`salariebaremeID`),
  KEY `salarie` (`salarie`),
  KEY `salariebareme_ibfk_2` (`bareme`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `salariebareme`
--

INSERT INTO `salariebareme` (`salariebaremeID`, `salarie`, `bareme`, `salarieID`) VALUES
(6, 5, 12, '45564'),
(7, 5, 11, 'CDE45'),
(8, 4, 12, 'aze123'),
(9, 5, 15, 'aee14'),
(10, 5, 10, 'IOP20158');

-- --------------------------------------------------------

--
-- Structure de la table `societe`
--

CREATE TABLE IF NOT EXISTS `societe` (
  `societeID` int(11) NOT NULL AUTO_INCREMENT,
  `intituleSociete` varchar(255) NOT NULL,
  `patente` varchar(255) NOT NULL,
  `idfiscale` varchar(255) NOT NULL,
  `rcCodeTribunal` varchar(200) NOT NULL,
  `cnss` varchar(255) NOT NULL,
  `cimr` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `fax` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `mutuelle` varchar(255) NOT NULL,
  `dateajout` date NOT NULL,
  `logo` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `maxcompte` int(11) NOT NULL,
  `parametre` int(11) DEFAULT NULL,
  PRIMARY KEY (`societeID`),
  KEY `parametre` (`parametre`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `societe`
--

INSERT INTO `societe` (`societeID`, `intituleSociete`, `patente`, `idfiscale`, `rcCodeTribunal`, `cnss`, `cimr`, `telephone`, `fax`, `email`, `adresse`, `mutuelle`, `dateajout`, `logo`, `slug`, `ville`, `maxcompte`, `parametre`) VALUES
(1, 'Kal .INC', '000789', '7852', '5643212', '32153', '02255', '(+212) 587 896 320', '31645', 'kal@inc-service.fr', '33 rue Brahim Nakhai', '2326', '2014-09-19', 'logo2.png', '-', '', 3, NULL),
(2, 'Real de Madrid', '0580', '752014', '784215', '000368', '0014', '(+235) 789 421 569', '201856', 'real.madrid@rm.com', 'madrid rue 400', '2041452', '2014-09-19', 'Satellite.png', 'real-de-madrid', '', 3, 1),
(3, 'Dortmund Borissia', '656', '7854', '64546', '86465', '23856', '2588523', '6455465', 'dortmund@gmail.com', 'berlin 44 rue adjoint', '6565', '2014-09-19', 'logo.png', 'dortmund-borissia', '', 3, NULL),
(4, 'Apple Inc', '6454', '54564564556', '564654', '64554', '5649649', '035464', '65454', 'apple@gmail.com', 'rue 789 carlifornie', '654564', '2014-09-19', 'logo.png', 'apple-inc', '', 3, NULL),
(5, 'Societe de raffinage', '7855', '564564', '564654', '5455', '88555', '(+212) 587 896 320', '54654', 'so@yoo.vom', 'rue 78 casablanca - maroc', '5555', '2014-09-20', 'logo1.jpg', 'societe-de-raffinage', '', 3, NULL),
(6, 'TEDY CONSULTING SARL', '34291195', '14402014', '273941', '9392359', 'NEANT', '(0522)662250', 'NEANT', 'TEDY.CONSULTING@GMAIL.COM', '10 BD LIBERTE 3EME ETG APPART 6 CASA ', 'NEANT', '2014-10-08', 'logo.jpg', 'tedy-consulting-sarl', 'Casa', 3, NULL),
(7, 'Google', '656', '7852', '5643212', '5455', 'NEANT', '2588523', '6455465', 'google@gmail.com', 'Googleplex, Mountain View (États-Unis)', '2326', '2014-10-17', 'logo.jpg', 'google', 'Carlifonie', 3, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `societebareme`
--

CREATE TABLE IF NOT EXISTS `societebareme` (
  `baremeID` int(11) NOT NULL,
  `societeID` int(11) NOT NULL,
  `societebaremeID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`societebaremeID`),
  KEY `Bareme` (`baremeID`),
  KEY `Societe` (`societeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Contenu de la table `societebareme`
--

INSERT INTO `societebareme` (`baremeID`, `societeID`, `societebaremeID`) VALUES
(3, 6, 2),
(9, 6, 3),
(9, 5, 5),
(9, 3, 6),
(9, 1, 7),
(9, 4, 8),
(9, 7, 9),
(7, 2, 10),
(9, 2, 11),
(2, 2, 12),
(3, 7, 13),
(10, 2, 14),
(12, 2, 15),
(12, 5, 16),
(12, 3, 17),
(12, 1, 18),
(12, 4, 19),
(12, 6, 20),
(12, 7, 21);

-- --------------------------------------------------------

--
-- Structure de la table `tranche`
--

CREATE TABLE IF NOT EXISTS `tranche` (
  `trancheId` int(11) NOT NULL AUTO_INCREMENT,
  `debut` float NOT NULL,
  `fin` float NOT NULL,
  `taux` float NOT NULL,
  `formule` text,
  `bareme` int(11) NOT NULL,
  PRIMARY KEY (`trancheId`),
  KEY `bareme` (`bareme`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `tranche`
--

INSERT INTO `tranche` (`trancheId`, `debut`, `fin`, `taux`, `formule`, `bareme`) VALUES
(4, 1000, 1500, 20, '', 2),
(8, 1000, 20000, 10, 'Salaire * Taux', 8),
(9, 20001, 50000, 30, 'S*T', 8),
(10, 1000, 20000, 10, '', 9),
(11, 0, 2000, 5, '', 3),
(12, 2001, 5000, 8, '', 3),
(13, 1, 5, 10, '', 10);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `utilisateurID` int(11) NOT NULL AUTO_INCREMENT,
  `societeID` int(11) DEFAULT NULL,
  `login` varchar(200) NOT NULL,
  `motdepasse` varchar(200) NOT NULL,
  `roleID` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`utilisateurID`),
  UNIQUE KEY `login` (`login`),
  KEY `FK_Utilisateur_Societe` (`societeID`),
  KEY `roleID` (`roleID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`utilisateurID`, `societeID`, `login`, `motdepasse`, `roleID`, `enabled`) VALUES
(1, 1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 1),
(7, 1, 'kal.Inc', '12dea96fec20593566ab75692c9949596833adc9', 3, 1),
(8, 2, 'realdemadrid', 'b52573e0e181b5d14a698395224281ba639ebd75', 3, 1),
(9, 3, 'dortmundborissia', '26e51538fc0217a3258ff394430a27ca51831e9a', 3, 1),
(11, 4, 'appleinc', 'd0be2dc421be4fcd0172e5afceea3970e2f3d940', 3, 1),
(18, 5, 'societederaffinage', 'c87c3aeb2970737ff596811cfd3a846c228ee2ac', 3, 1),
(32, NULL, 'user', '12dea96fec20593566ab75692c9949596833adc9', 2, 1),
(34, 6, 'tedyconsultingsarl', 'ef7671dc4c897303286d60e41afc8315ac431973', 3, 1),
(36, 7, 'google', '759730a97e4373f3a0ee12805db065e3a4a649a5', 3, 1),
(38, 3, 'dort', 'de217d1cab8d51642413e5b152bc37d5c93356ff', 2, 1);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `avance`
--
ALTER TABLE `avance`
  ADD CONSTRAINT `avance_ibfk_2` FOREIGN KEY (`salarie`) REFERENCES `salarie` (`salarieID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `avance_ibfk_1` FOREIGN KEY (`exercice`) REFERENCES `exercice` (`exerciceID`);

--
-- Contraintes pour la table `bareme`
--
ALTER TABLE `bareme`
  ADD CONSTRAINT `bareme_ibfk_1` FOREIGN KEY (`compagnieID`) REFERENCES `compagnie` (`compagnieID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `commission`
--
ALTER TABLE `commission`
  ADD CONSTRAINT `commission_ibfk_1` FOREIGN KEY (`salarie`) REFERENCES `salarie` (`salarieID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commission_ibfk_2` FOREIGN KEY (`exercice`) REFERENCES `exercice` (`exerciceID`);

--
-- Contraintes pour la table `conge`
--
ALTER TABLE `conge`
  ADD CONSTRAINT `FK_Conge_Salarie` FOREIGN KEY (`salarieID`) REFERENCES `salarie` (`salarieID`);

--
-- Contraintes pour la table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `FK_Document_Salarie` FOREIGN KEY (`salarieID`) REFERENCES `salarie` (`salarieID`);

--
-- Contraintes pour la table `enfant`
--
ALTER TABLE `enfant`
  ADD CONSTRAINT `FK_Enfant_Etatcivile` FOREIGN KEY (`etatcivileID`) REFERENCES `etatcivile` (`etatcivileID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `exercice`
--
ALTER TABLE `exercice`
  ADD CONSTRAINT `FK_Excercice_Societe` FOREIGN KEY (`societeID`) REFERENCES `societe` (`societeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`emetteur`) REFERENCES `utilisateur` (`utilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`destinataire`) REFERENCES `utilisateur` (`utilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `poste`
--
ALTER TABLE `poste`
  ADD CONSTRAINT `FK_Poste_Affectation` FOREIGN KEY (`affectationID`) REFERENCES `affectation` (`affectationID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `prime`
--
ALTER TABLE `prime`
  ADD CONSTRAINT `prime_ibfk_1` FOREIGN KEY (`societe`) REFERENCES `societe` (`societeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `primedate`
--
ALTER TABLE `primedate`
  ADD CONSTRAINT `primedate_ibfk_1` FOREIGN KEY (`prime`) REFERENCES `prime` (`primeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `primesalarie`
--
ALTER TABLE `primesalarie`
  ADD CONSTRAINT `primesalarie_ibfk_3` FOREIGN KEY (`exercice`) REFERENCES `exercice` (`exerciceID`),
  ADD CONSTRAINT `primesalarie_ibfk_1` FOREIGN KEY (`salarie`) REFERENCES `salarie` (`salarieID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `primesalarie_ibfk_2` FOREIGN KEY (`prime`) REFERENCES `prime` (`primeID`);

--
-- Contraintes pour la table `salaire`
--
ALTER TABLE `salaire`
  ADD CONSTRAINT `salaire_ibfk_2` FOREIGN KEY (`exercice`) REFERENCES `exercice` (`exerciceID`),
  ADD CONSTRAINT `salaire_ibfk_1` FOREIGN KEY (`salarie`) REFERENCES `salarie` (`salarieID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `salarie`
--
ALTER TABLE `salarie`
  ADD CONSTRAINT `FK_Salarie_Contrat` FOREIGN KEY (`contratID`) REFERENCES `contrat` (`contratID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Salarie_Coordoneebancaire` FOREIGN KEY (`coordoneebancaireID`) REFERENCES `coordonneebancaire` (`coordoneebancaireID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Salarie_Etatcivile` FOREIGN KEY (`etatcivileID`) REFERENCES `etatcivile` (`etatcivileID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Salarie_Immatriculation` FOREIGN KEY (`immatriculationID`) REFERENCES `immatriculation` (`immatriculationID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Salarie_Paie` FOREIGN KEY (`paieID`) REFERENCES `paie` (`paieID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Salarie_Poste` FOREIGN KEY (`posteID`) REFERENCES `poste` (`posteID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Salarie_Societe` FOREIGN KEY (`societeID`) REFERENCES `societe` (`societeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `salariebareme`
--
ALTER TABLE `salariebareme`
  ADD CONSTRAINT `salariebareme_ibfk_1` FOREIGN KEY (`salarie`) REFERENCES `salarie` (`salarieID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `salariebareme_ibfk_2` FOREIGN KEY (`bareme`) REFERENCES `societebareme` (`societebaremeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `societe`
--
ALTER TABLE `societe`
  ADD CONSTRAINT `societe_ibfk_1` FOREIGN KEY (`parametre`) REFERENCES `parametre` (`parametreId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `societebareme`
--
ALTER TABLE `societebareme`
  ADD CONSTRAINT `Bareme` FOREIGN KEY (`baremeID`) REFERENCES `bareme` (`baremeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Societe` FOREIGN KEY (`societeID`) REFERENCES `societe` (`societeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tranche`
--
ALTER TABLE `tranche`
  ADD CONSTRAINT `tranche_ibfk_1` FOREIGN KEY (`bareme`) REFERENCES `bareme` (`baremeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `FK_Utilisateur_Societe` FOREIGN KEY (`societeID`) REFERENCES `societe` (`societeID`),
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`roleID`) REFERENCES `role` (`roleID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
