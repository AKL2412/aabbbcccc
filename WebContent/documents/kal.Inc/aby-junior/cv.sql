-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Jeu 28 Août 2014 à 15:34
-- Version du serveur: 5.0.24a-community-nt
-- Version de PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `gestionintegration`
--

-- --------------------------------------------------------

--
-- Structure de la table `agence`
--

CREATE TABLE IF NOT EXISTS `agence` (
  `code` varchar(255) default NULL,
  `nom` varchar(255) default NULL,
  `agenceID` int(11) NOT NULL auto_increment,
  `succursaleID` int(11) NOT NULL,
  PRIMARY KEY  (`agenceID`),
  KEY `appartenir` (`succursaleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `agence`
--

INSERT INTO `agence` (`code`, `nom`, `agenceID`, `succursaleID`) VALUES
('AG001', 'Agence Kaloumn', 1, 1),
('AG002', 'Agence d''ANFA RUE KHALEL', 2, 36),
('AG003', 'Agence de Tetouan', 3, 1),
('AG004', 'Agence de Sahel', 4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `assessmentcenter`
--

CREATE TABLE IF NOT EXISTS `assessmentcenter` (
  `assessmentCenterID` int(11) NOT NULL,
  PRIMARY KEY  (`assessmentCenterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `assessmentcenter`
--

INSERT INTO `assessmentcenter` (`assessmentCenterID`) VALUES
(10);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `nom` varchar(255) default NULL,
  `anciennete` int(11) default NULL,
  `categorieID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`categorieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`nom`, `anciennete`, `categorieID`) VALUES
('1ère année', 1, 1),
('2e année', 2, 2),
('3e année', 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `categorieposte`
--

CREATE TABLE IF NOT EXISTS `categorieposte` (
  `id` int(11) NOT NULL auto_increment,
  `poste` int(11) NOT NULL,
  `categorie` int(11) NOT NULL,
  `created` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `poste` (`poste`),
  KEY `categorie` (`categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `categorieposte`
--

INSERT INTO `categorieposte` (`id`, `poste`, `categorie`, `created`) VALUES
(1, 1, 1, '2014-07-12 02:54:09'),
(2, 1, 2, '2014-07-12 02:54:09'),
(3, 1, 3, '2014-07-12 02:54:09'),
(4, 2, 1, '2014-07-12 02:55:12'),
(5, 2, 2, '2014-07-12 02:55:12'),
(6, 2, 3, '2014-07-12 02:55:12'),
(7, 3, 1, '2014-07-12 02:55:12'),
(8, 3, 2, '2014-07-12 02:55:12'),
(9, 3, 3, '2014-07-12 02:55:12');

-- --------------------------------------------------------

--
-- Structure de la table `champquestionnaire`
--

CREATE TABLE IF NOT EXISTS `champquestionnaire` (
  `label` varchar(255) default NULL,
  `typeChamp` varchar(255) default NULL,
  `typeDonnees` varchar(255) default NULL,
  `champQuestionnaireID` int(11) NOT NULL auto_increment,
  `questionnaireID` int(11) NOT NULL,
  PRIMARY KEY  (`champQuestionnaireID`),
  KEY `FK_ChampQuestionnaire_Questionnaire` (`questionnaireID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Contenu de la table `champquestionnaire`
--

INSERT INTO `champquestionnaire` (`label`, `typeChamp`, `typeDonnees`, `champQuestionnaireID`, `questionnaireID`) VALUES
('Dans l''ensemble êtes vous satisfait(e) de votre activité professionelle à la BCP ?', 'select', 'typeDonnee', 3, 1),
('Etes vous satisfait de votre lieu de travail ?', 'select', 'typeDonnee', 4, 1),
('La prise de décision au niveau hierarchique est-elle rapide ?', 'select', 'typeDonnee', 5, 1),
('Quelle mesure la BCP pourrait-elle mettre en oeuvre pour vous motiver d''avantage ?', 'textarea', 'typeDonnee', 6, 1),
('Nom', 'input', 'text', 7, 2),
('Prenom', 'input', 'text', 8, 2),
('Votre avis', 'textarea', 'typeDonnee', 9, 2),
('Presentez vous : ', 'textarea', 'typeDonnee', 10, 3),
('Details ', 'textarea', 'typeDonnee', 11, 4),
('nom', 'input', 'text', 12, 5),
('présentation', 'textarea', 'typeDonnee', 13, 5),
('Aimez vous le football?', 'select', 'typeDonnee', 14, 5),
('reert', 'textarea', 'typeDonnee', 15, 6),
('Que pensez vous de l''assessment center, doit on l''arrêter?', 'textarea', 'typeDonnee', 16, 7),
('Voulez vous l''intégration des activités sportif?', 'select', 'typeDonnee', 17, 7),
('votre nom', 'input', 'text', 18, 8),
('aimez vous le foot?', 'select', 'typeDonnee', 19, 8),
('Nom', 'input', 'text', 20, 9),
('Prenom', 'input', 'text', 21, 9),
('Age', 'input', 'number', 22, 9),
('Presentation (parcours scolaire)', 'textarea', 'typeDonnee', 23, 9);

-- --------------------------------------------------------

--
-- Structure de la table `champreponse`
--

CREATE TABLE IF NOT EXISTS `champreponse` (
  `donneeSaisie` text,
  `champReponseID` int(11) NOT NULL auto_increment,
  `champQuestionnaireID` int(11) default NULL,
  `reponseID` int(11) NOT NULL,
  PRIMARY KEY  (`champReponseID`),
  KEY `FK_ChampReponse_ChampQuestionnaire` (`champQuestionnaireID`),
  KEY `FK_ChampReponse_Reponse` (`reponseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Contenu de la table `champreponse`
--

INSERT INTO `champreponse` (`donneeSaisie`, `champReponseID`, `champQuestionnaireID`, `reponseID`) VALUES
('koi', 1, 15, 2),
('ABy', 2, 12, 3),
('Une presentation', 3, 13, 3),
('Oui', 4, 14, 3),
('oui', 5, 17, 4),
('C''est une bonne évaluation,à mon sens.Et il mérite d''être continué,mais avec un peu revision et d''apport nouveau', 6, 16, 4),
('Je crois qu''on devrait arrêter ce centre d''évaluation.nous faisons déjà nos preuves sur le terrain ce ne sont pas un ensemble de quelques questions qui pouront determiner le niveau de determination et de motivation', 7, 16, 5),
('non', 8, 17, 5),
('gbybhfyudr', 9, 18, 6),
('non', 10, 19, 6),
('vro', 11, 15, 7),
('k', 12, 16, 8),
('oui', 13, 17, 8),
('lamia', 14, 18, 9),
('oui', 15, 19, 9),
('yttyt', 16, 13, 10),
('Non', 17, 14, 10),
('tytyt', 18, 12, 10),
('Mon nom est parKard', 19, 18, 11),
('oui', 20, 19, 11),
('null', 21, 16, 12),
('indifférent(e)', 22, 17, 12);

-- --------------------------------------------------------

--
-- Structure de la table `coaching`
--

CREATE TABLE IF NOT EXISTS `coaching` (
  `coachingID` int(11) NOT NULL,
  `typeCoachingID` int(11) default NULL,
  PRIMARY KEY  (`coachingID`),
  KEY `FK_Coaching_TypeCoaching` (`typeCoachingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `coaching`
--

INSERT INTO `coaching` (`coachingID`, `typeCoachingID`) VALUES
(17, 1),
(18, 3),
(11, 4);

-- --------------------------------------------------------

--
-- Structure de la table `competence`
--

CREATE TABLE IF NOT EXISTS `competence` (
  `code` varchar(255) default NULL,
  `nom` varchar(255) default NULL,
  `competenceID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`competenceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Contenu de la table `competence`
--

INSERT INTO `competence` (`code`, `nom`, `competenceID`) VALUES
('CO1', 'présentation du cpm', 1),
('CO2', 'rencontre avec un directeur d''agence', 2),
('CO3', 'attitudes et comportements', 3),
('CO4', 'techniques d''accueil et de communication', 4),
('CO5', 'techniques de vente', 5),
('CO6', 'réglementation et responsabilité du banquier', 6),
('CO7', 'produits de financement', 7),
('CO8', 'offres monétiques', 8),
('CO9', 'produits mdm', 9),
('CO10', 'placements', 10),
('CO11', 'banque privée', 11),
('CO12', 'offres packagée', 12),
('CO13', 'inclusion bancaire', 13),
('CO14', 'e-banking & m-banking', 14),
('CO15', 'bancassurances', 15),
('CO16', 'pilotage commercial', 16),
('CO17', 'qualité', 17),
('CO18', 'système de gestion des réclamations', 18),
('CO19', 'présentation du posi', 19),
('CO20', 'présentation du centre de traitements national', 20),
('CO21', 'système d''information agence', 21),
('CO22', 'comptes et moyens de paiements', 22),
('CO23', 'manipulation de fonds : (billets de banque: dh et devises)', 23),
('CO24', 'fiscalité', 24),
('CO25', 'comptabilité', 25),
('CO26', 'risques opérationnels', 26),
('CO27', 'gestion des risques', 27),
('CO28', 'l''éthique, déontologie et conformité', 28),
('CO29', 'dispositif de vigilance et lab', 29),
('CO30', 'éthique, déontologie et conformité', 30),
('CO31', 'sécurité des biens et des personnes', 31);

-- --------------------------------------------------------

--
-- Structure de la table `competencedoamaine`
--

CREATE TABLE IF NOT EXISTS `competencedoamaine` (
  `domaineID` int(11) default NULL,
  `competenceID` int(11) default NULL,
  KEY `Domaine` (`domaineID`),
  KEY `Competence` (`competenceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `compteutilisateur`
--

CREATE TABLE IF NOT EXISTS `compteutilisateur` (
  `login` varchar(255) default NULL,
  `motDePasse` varchar(255) default NULL,
  `compteUtilisateurID` int(11) NOT NULL auto_increment,
  `enabled` tinyint(1) NOT NULL default '1',
  `image` varchar(250) default NULL,
  PRIMARY KEY  (`compteUtilisateurID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=112 ;

--
-- Contenu de la table `compteutilisateur`
--

INSERT INTO `compteutilisateur` (`login`, `motDePasse`, `compteUtilisateurID`, `enabled`, `image`) VALUES
('admin', '96835dd8bfa718bd6447ccc87af89ae1675daeca', 10, 1, 'tom.jpg'),
('fmereym', '3c81a121f93d44292e148be026ecf004d560de44', 15, 1, 'bcp.jpeg'),
('amara', '1d9e5eb12f9fdbe59d2c7a67eedbfb816f86ca2f', 20, 1, 'amara.jpg'),
('amine', '23bc6df7647b818d79ce7fc43fa0f460c188205a', 21, 1, 'amine.jpg'),
('rachid', 'af045d9e68f1279af589eff3a2682851ea4e8686', 22, 1, 'default.jpg'),
('lamia', '6199c572a2fb4d26b437c850b1ffab359c74ee7d', 23, 1, 'lamia.jpg'),
('romolo', 'c352f41b55617f5a447986c6eeacf58dee1e0ef0', 24, 1, 'romolo.jpg'),
('BE00IOL', '3c81a121f93d44292e148be026ecf004d560de44', 27, 1, 'be00iol.jpg'),
('DR002014', '46acaeea82e9042402486d2f88d6c34d79bb0253', 28, 1, 'dr002014.jpg'),
('DA0012014', '61ae8e994c7c9924f5012146e4814d965e76e6f5', 29, 1, 'da0012014.jpg'),
('1520078', '6d4235f295caf35add3c9012e7c386bcab4458d4', 30, 1, 'default.jpg'),
('45002335', '367c654deb1c8ec09a9be98bc00aced9f9ee3e6a', 31, 1, 'default.jpg'),
('reeta', '4bf29955babb4c8cca84928c06e0b1f16edac808', 32, 1, 'reeta.jpg'),
('85577', '84ce9c3ad20853c0df234638f335c6372b791ec2', 33, 1, '85577.png'),
('1000', 'e3cbba8883fe746c6e35783c9404b4bc0c7ee9eb', 34, 1, 'default.jpg'),
('1003', '9f6bf828c80134b8d3e07b058045fba6acd4e9ac', 35, 1, 'default.jpg'),
('1022', '2e2f7b99fbabb51ec37d8f54b164f309b2a6fc36', 36, 1, 'default.jpg'),
('1012', '899a19b6bec5cddc50179f183ba138b628cf94b3', 37, 1, '1012.jpg'),
('1040', 'ea10e810f96fca6858e37fda9832ace147eed87c', 38, 1, 'default.jpg'),
('1045', 'ef9cb1abfdb1d45bb08bd2742f179591c8266187', 39, 1, 'default.jpg'),
('1066', 'dc543d2abbb092d676b4e412354e0d2e0d7bf91b', 40, 1, 'default.jpg'),
('1028', 'd9935e84bd763cd4b8be14cb7861f1266f659f31', 41, 1, 'default.jpg'),
('1064', '76a9e39fc0fb7fefce78c4940c4aa5468c8c8df4', 42, 1, 'default.jpg'),
('1027', 'e194ee413805ba5a6aabf4d34db2066149dc0369', 43, 1, 'default.jpg'),
('1060', '02f84308fab673d8332e1ab780a8ade20987e925', 44, 1, 'default.jpg'),
('1033', 'e0f05ed4fd4ffb1af17b55948173bfe2900cefb4', 45, 1, 'default.jpg'),
('1132', '081be7c370bf9e7b4c6e696276c1b2d57623b26b', 46, 1, 'default.jpg'),
('1065', '3c19eb2961d9d449e857615c28aa47615562bc87', 47, 1, 'default.jpg'),
('1140', '715e82fa3b623c04f4eb343985dbbe7555a0be99', 48, 1, 'default.jpg'),
('1150', 'e9a20a4af61c91b0232679bc583058b278fb2926', 49, 1, 'default.jpg'),
('1032', '8422051640d7c9a740564eff35fbdce111c6c557', 50, 1, 'default.jpg'),
('1034', '290448489a06c6a2dc62e82491212444bd6e341f', 51, 1, 'default.jpg'),
('1144', '4b19229e380e9ca29673fdb967fd09cdcf4b5b44', 52, 1, 'default.jpg'),
('1209', 'b1d2e166d988e74123924d7bff9cd30a63aff067', 53, 1, 'default.jpg'),
('1080', '0cf950b5e4d2ebd7c978c76091ddce6176845697', 54, 1, 'default.jpg'),
('1210', '7c7b84eeaec18233e982d101637ab2a4033c6fb0', 55, 1, 'default.jpg'),
('11320', '5e6be0299a26c1d08fbeef56844bb0253615c9d4', 57, 1, 'default.jpg'),
('1161', '25c65868b540200530fe4d75eb95a9a92c0c76ce', 58, 1, 'default.jpg'),
('1072', '6b4142e2e97b851a319b0fcab23709b40e3fc19f', 59, 1, 'default.jpg'),
('1175', '566ee6d19fef04459d959b08349d6c07b3a309a2', 60, 1, 'default.jpg'),
('1156', '54f9c5db018042c5624c67dc1de588c11164e3ac', 61, 1, 'default.jpg'),
('1135', 'ad5955c8503631249178de05628e1434aad35af0', 62, 1, 'default.jpg'),
('1112', '7161a2409087e392cf68559ddac9f1b64b07510c', 63, 1, 'default.jpg'),
('1174', 'be98fbb5fef1a2a7ce8be317fcbce6b1912024c3', 64, 1, 'default.jpg'),
('2013', 'd08b10a32612f9d3bc06be41124becfd39536eee', 65, 1, 'default.jpg'),
('2021', 'fd93ac461456a118d38a8d6b4d18f6741682f3eb', 66, 1, 'default.jpg'),
('2017', '04e8696e6424c21d717e46008780505d598eb59a', 67, 1, 'default.jpg'),
('2031', '0d0c9e996263c5a31c80793e1718d66c9a924525', 68, 1, 'default.jpg'),
('2041', '35006d20b65b0d5c62e933195a3d1e04e0b41971', 69, 1, 'default.jpg'),
('2028', '431f6b7d5b29f0d72c8e0add95ac64e7aa6b01d3', 70, 1, 'default.jpg'),
('2025', '004be89dd9e070ecb080b9b759e5be29ec24881b', 71, 1, 'default.jpg'),
('2076', 'bae6cc738619d483e071055c87eb596982bb09c4', 72, 1, 'default.jpg'),
('2061', 'c2a0932a9280d0b05e8265a8573fb3939e4babff', 73, 1, 'default.jpg'),
('2067', '14e7c3fe18fe6c317b09c7f9cd32a59f0718d7a0', 74, 1, 'default.jpg'),
('2043', 'f56b036b2b7ee161296702a7022b11ee08c12d08', 75, 1, 'default.jpg'),
('2101', '86e1d3bdc221331bba64e508b1df9d8c9382f219', 76, 1, 'default.jpg'),
('2085', 'd32f6a6a74d2012dc8146e7da9c03e6191747556', 77, 1, 'default.jpg'),
('2104', 'a8c97ea909919d6c4c818c1460fb9349eed14423', 78, 1, 'default.jpg'),
('2167', '190b4404bb885e4726d13a9ebf39ae8c7b0d6d22', 79, 1, 'default.jpg'),
('2148', 'd7c1f0dd609c0024d00c7eb35743bcc476459876', 80, 1, 'default.jpg'),
('2093', '3f1e66218faccc2a055093df892286ea4177456b', 81, 1, 'default.jpg'),
('2081', 'ba6191c6b3bdd7ff76ed3450dd8cd88a18c88a09', 82, 1, 'default.jpg'),
('2139', '38017081fee8e75390584b3656f2abf2880803dd', 83, 1, 'default.jpg'),
('2089', '1a95ad74a660b002850095b906f53328ffa173c6', 84, 1, 'default.jpg'),
('2153', '1a753df8cc84df7caed624437d6ab67dc76f4552', 85, 1, 'default.jpg'),
('2181', '271e283cdf2d8cd6544390a4f304d279ccd2db84', 86, 1, 'default.jpg'),
('201300', '8305103847e8ba5b3da5c12abe3620ca4dcb236b', 88, 1, 'default.jpg'),
('2174', '0d4dba0783daabf31a43ce728ae5505e5b301d2a', 89, 1, 'default.jpg'),
('2013001', '1b0a1fb941bbd8fb2d1e11db8501614eecdaec99', 90, 1, 'default.jpg'),
('201200', 'c4b30d24c6fce73b5d743b8fdb93c94c8857864b', 91, 1, 'default.jpg'),
('201206', 'f017b47dc9560076b5d65b66e4a369f539096e07', 92, 1, 'default.jpg'),
('201222', 'c186c86fb72db9bf2ee9a3caf612daef980240ad', 93, 1, 'default.jpg'),
('201227', 'd8cf5d4d3833877aca21637528d94073ca7384c1', 94, 1, 'default.jpg'),
('201244', 'f0d5c01913830c0829a2a45384eeb0ea9dc0995c', 95, 1, 'default.jpg'),
('201240', 'c5cbce09a5ace49d3e4513683f76919c05dbbf4e', 96, 1, 'default.jpg'),
('201248', 'df907d2d113ffa5acc5af2a8be1092f36f095977', 97, 1, '201248.jpg'),
('201263', 'd52e610981e31cfc84c17e4f63497462b5cb4472', 98, 1, 'default.jpg'),
('20124008', '2d923aeafbf897d4014d58a95bc8da7d4a85ca1e', 100, 1, 'default.jpg'),
('201281', 'fa287ad9ab6e2293f57a51611b939e1ba1cd659c', 101, 1, 'default.jpg'),
('201200147', '6df0f20bbcc4960ceb4e275fd20304e211d67237', 102, 1, 'default.jpg'),
('201277', '60294142e83ffa541b1980dc1937ccdcc1669982', 103, 1, 'default.jpg'),
('201284', '844688afc8c71e5382f42e174a7499bb3cc326a9', 104, 1, 'default.jpg'),
('201291', 'a4bfc8a43fe4f8cb5cd9a4ecab9a319944d32c19', 105, 1, 'default.jpg'),
('201354', '4069f27bcaa73998047b062b0667911055faa176', 106, 1, 'default.jpg'),
('201275', '7ae17dc666f9653cf0eabb8ba94f706f61b08a49', 107, 1, 'default.jpg'),
('201312', 'cec18c40c844887ab4986d8f323f769ceeb90170', 108, 1, 'default.jpg'),
('201285', '57244a04890caa108de1779b3852b3a1e6d096da', 109, 1, 'default.jpg'),
('201308', 'f0dc6b2870643e8edcc69c7f106b632b2ad201fa', 110, 1, 'default.jpg'),
('201333', '886d4683d09a90415915749e6e2a3781a5d2c63f', 111, 1, 'default.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `connected`
--

CREATE TABLE IF NOT EXISTS `connected` (
  `id` int(11) NOT NULL auto_increment,
  `compteId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  `time` double NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `compteId` (`compteId`),
  KEY `roleId` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `connected`
--

INSERT INTO `connected` (`id`, `compteId`, `roleId`, `time`) VALUES
(6, 15, 3, 1404837455771),
(7, 20, 5, 1404837661351),
(8, 10, 1, 1404837972466),
(9, 10, 1, 1404838879438),
(10, 10, 1, 1404839002710),
(11, 10, 1, 1404839387572),
(12, 20, 5, 1404840133401),
(13, 20, 5, 1404841755013);

-- --------------------------------------------------------

--
-- Structure de la table `convocation`
--

CREATE TABLE IF NOT EXISTS `convocation` (
  `date` date default NULL,
  `heure` varchar(20) default NULL,
  `lieu` varchar(255) default NULL,
  `sujet` text,
  `convocationID` int(11) NOT NULL auto_increment,
  `created` datetime NOT NULL,
  PRIMARY KEY  (`convocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `convocation`
--

INSERT INTO `convocation` (`date`, `heure`, `lieu`, `sujet`, `convocationID`, `created`) VALUES
('2014-07-27', '08h59', 'Centre de formation', 'Une réunion', 2, '2014-07-19 05:14:34'),
('2014-07-16', '09h50', 'Le poulet', 'Un poulet! Oui un poulet', 3, '2014-07-20 23:42:29'),
('2014-07-02', '09h30', 'lieu', 'un sujet', 4, '2014-07-21 10:45:12'),
('2014-08-02', '02h52', 'lieur', 'sujet pour', 7, '2014-07-31 16:33:33'),
('2014-07-11', '11h30', 'A LA MAISON BLANCHE', 'Pour sauver les enfants de guerre', 8, '2014-07-31 16:34:30'),
('2014-09-11', '09h30', 'Rabat Siège bleu', 'Une visite ', 9, '2014-08-15 19:39:14');

-- --------------------------------------------------------

--
-- Structure de la table `convoquer`
--

CREATE TABLE IF NOT EXISTS `convoquer` (
  `convocationID` int(11) default NULL,
  `date` date NOT NULL,
  `vueRecrue` tinyint(1) NOT NULL,
  `convoquerID` int(11) NOT NULL auto_increment,
  `recrueID` int(11) NOT NULL,
  PRIMARY KEY  (`convoquerID`),
  KEY `Convocation` (`convocationID`),
  KEY `recrueID` (`recrueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Contenu de la table `convoquer`
--

INSERT INTO `convoquer` (`convocationID`, `date`, `vueRecrue`, `convoquerID`, `recrueID`) VALUES
(2, '2014-07-19', 1, 2, 8),
(3, '2014-07-20', 1, 4, 9),
(3, '2014-07-20', 0, 5, 11),
(3, '2014-07-20', 0, 6, 8),
(3, '2014-07-20', 0, 7, 10),
(3, '2014-07-20', 0, 8, 7),
(3, '2014-07-20', 0, 9, 13),
(4, '2014-07-21', 0, 10, 5),
(4, '2014-07-21', 1, 11, 9),
(4, '2014-07-21', 0, 12, 11),
(4, '2014-07-21', 0, 13, 6),
(4, '2014-07-21', 0, 14, 8),
(4, '2014-07-21', 0, 15, 4),
(4, '2014-07-21', 0, 16, 10),
(4, '2014-07-21', 0, 17, 12),
(4, '2014-07-21', 0, 18, 13),
(4, '2014-07-21', 0, 19, 7),
(7, '2014-07-31', 0, 22, 14),
(8, '2014-07-31', 1, 23, 14),
(9, '2014-08-15', 0, 24, 9);

-- --------------------------------------------------------

--
-- Structure de la table `cursus`
--

CREATE TABLE IF NOT EXISTS `cursus` (
  `nom` varchar(255) default NULL,
  `cursusID` int(11) NOT NULL,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY  (`cursusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `cursus`
--

INSERT INTO `cursus` (`nom`, `cursusID`, `label`) VALUES
('Agent Commercial', 7, 'Cursus 1'),
('Chargé de produit', 8, 'Cursus 2'),
('Chargé Clientèle', 14, 'Cursus 3'),
('Responsable Administratif', 15, 'Cursus 4'),
('Directeur d''agence', 16, 'Cursus 5');

-- --------------------------------------------------------

--
-- Structure de la table `destiner`
--

CREATE TABLE IF NOT EXISTS `destiner` (
  `recrueID` int(11) default NULL,
  `questionnaireID` int(11) default NULL,
  `date` date NOT NULL,
  `vueRecrue` tinyint(1) NOT NULL,
  `vueResInt` tinyint(1) NOT NULL,
  `destinerID` int(11) NOT NULL auto_increment,
  `dateLimiteValidation` date NOT NULL,
  PRIMARY KEY  (`destinerID`),
  KEY `Recrue` (`recrueID`),
  KEY `Questionnaire` (`questionnaireID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=125 ;

--
-- Contenu de la table `destiner`
--

INSERT INTO `destiner` (`recrueID`, `questionnaireID`, `date`, `vueRecrue`, `vueResInt`, `destinerID`, `dateLimiteValidation`) VALUES
(4, 1, '2014-07-18', 0, 0, 1, '2014-07-20'),
(10, 4, '2014-07-20', 0, 0, 2, '2014-07-10'),
(9, 5, '2014-07-21', 1, 0, 3, '2014-07-11'),
(6, 5, '2014-07-21', 0, 0, 4, '2014-07-11'),
(8, 5, '2014-07-21', 0, 0, 5, '2014-07-11'),
(12, 5, '2014-07-21', 0, 0, 6, '2014-07-11'),
(13, 5, '2014-07-21', 0, 0, 7, '2014-07-11'),
(7, 5, '2014-07-21', 1, 0, 8, '2014-07-11'),
(5, 6, '2014-07-21', 1, 0, 9, '2014-07-24'),
(9, 1, '2014-07-21', 0, 0, 10, '2014-07-24'),
(11, 6, '2014-07-21', 0, 0, 11, '2014-07-24'),
(6, 6, '2014-07-21', 0, 0, 12, '2014-07-24'),
(8, 6, '2014-07-21', 0, 0, 13, '2014-07-24'),
(4, 6, '2014-07-21', 0, 0, 14, '2014-07-24'),
(10, 6, '2014-07-21', 0, 0, 15, '2014-07-24'),
(12, 6, '2014-07-21', 0, 0, 16, '2014-07-24'),
(13, 6, '2014-07-21', 0, 0, 17, '2014-07-24'),
(7, 6, '2014-07-21', 1, 1, 18, '2014-07-24'),
(5, 7, '2014-07-28', 0, 0, 19, '2014-07-02'),
(9, 7, '2014-07-28', 1, 0, 20, '2014-07-02'),
(11, 7, '2014-07-28', 0, 0, 21, '2014-07-02'),
(6, 7, '2014-07-28', 0, 0, 22, '2014-07-02'),
(8, 7, '2014-07-28', 1, 0, 23, '2014-07-02'),
(4, 7, '2014-07-28', 1, 0, 24, '2014-07-02'),
(10, 7, '2014-07-28', 0, 0, 25, '2014-07-02'),
(12, 7, '2014-07-28', 0, 0, 26, '2014-07-02'),
(13, 7, '2014-07-28', 0, 0, 27, '2014-07-02'),
(7, 7, '2014-07-28', 1, 0, 28, '2014-07-02'),
(5, 8, '2014-07-28', 0, 0, 29, '2014-07-27'),
(9, 8, '2014-07-28', 1, 0, 30, '2014-07-27'),
(11, 8, '2014-07-28', 0, 0, 31, '2014-07-27'),
(6, 8, '2014-07-28', 0, 0, 32, '2014-07-27'),
(8, 8, '2014-07-28', 0, 0, 33, '2014-07-27'),
(4, 8, '2014-07-28', 1, 0, 34, '2014-07-27'),
(10, 8, '2014-07-28', 0, 0, 35, '2014-07-27'),
(12, 8, '2014-07-28', 0, 0, 36, '2014-07-27'),
(13, 8, '2014-07-28', 0, 0, 37, '2014-07-27'),
(7, 8, '2014-07-28', 1, 0, 38, '2014-07-27'),
(4, 9, '2014-08-22', 0, 0, 39, '2014-08-31'),
(7, 9, '2014-08-22', 0, 0, 40, '2014-08-31'),
(18, 9, '2014-08-22', 0, 0, 41, '2014-08-31'),
(20, 9, '2014-08-22', 0, 0, 42, '2014-08-31'),
(24, 9, '2014-08-22', 0, 0, 43, '2014-08-31'),
(36, 9, '2014-08-22', 0, 0, 44, '2014-08-31'),
(40, 9, '2014-08-22', 0, 0, 45, '2014-08-31'),
(43, 9, '2014-08-22', 0, 0, 46, '2014-08-31'),
(44, 9, '2014-08-22', 0, 0, 47, '2014-08-31'),
(48, 9, '2014-08-22', 0, 0, 48, '2014-08-31'),
(51, 9, '2014-08-22', 0, 0, 49, '2014-08-31'),
(55, 9, '2014-08-22', 0, 0, 50, '2014-08-31'),
(59, 9, '2014-08-22', 0, 0, 51, '2014-08-31'),
(60, 9, '2014-08-22', 0, 0, 52, '2014-08-31'),
(63, 9, '2014-08-22', 0, 0, 53, '2014-08-31'),
(64, 9, '2014-08-22', 0, 0, 54, '2014-08-31'),
(65, 9, '2014-08-22', 0, 0, 55, '2014-08-31'),
(66, 9, '2014-08-22', 0, 0, 56, '2014-08-31'),
(68, 9, '2014-08-22', 0, 0, 57, '2014-08-31'),
(69, 9, '2014-08-22', 0, 0, 58, '2014-08-31'),
(76, 9, '2014-08-22', 0, 0, 59, '2014-08-31'),
(84, 9, '2014-08-22', 0, 0, 60, '2014-08-31'),
(88, 9, '2014-08-22', 0, 0, 61, '2014-08-31'),
(5, 9, '2014-08-22', 0, 0, 62, '2014-08-31'),
(6, 9, '2014-08-22', 0, 0, 63, '2014-08-31'),
(12, 9, '2014-08-22', 0, 0, 64, '2014-08-31'),
(14, 9, '2014-08-22', 0, 0, 65, '2014-08-31'),
(17, 9, '2014-08-22', 0, 0, 66, '2014-08-31'),
(21, 9, '2014-08-22', 0, 0, 67, '2014-08-31'),
(22, 9, '2014-08-22', 0, 0, 68, '2014-08-31'),
(25, 9, '2014-08-22', 0, 0, 69, '2014-08-31'),
(26, 9, '2014-08-22', 0, 0, 70, '2014-08-31'),
(38, 9, '2014-08-22', 0, 0, 71, '2014-08-31'),
(50, 9, '2014-08-22', 0, 0, 72, '2014-08-31'),
(61, 9, '2014-08-22', 0, 0, 73, '2014-08-31'),
(74, 9, '2014-08-22', 0, 0, 74, '2014-08-31'),
(75, 9, '2014-08-22', 0, 0, 75, '2014-08-31'),
(78, 9, '2014-08-22', 0, 0, 76, '2014-08-31'),
(82, 9, '2014-08-22', 0, 0, 77, '2014-08-31'),
(85, 9, '2014-08-22', 0, 0, 78, '2014-08-31'),
(86, 9, '2014-08-22', 0, 0, 79, '2014-08-31'),
(89, 9, '2014-08-22', 0, 0, 80, '2014-08-31'),
(9, 9, '2014-08-22', 0, 0, 81, '2014-08-31'),
(13, 9, '2014-08-22', 0, 0, 82, '2014-08-31'),
(15, 9, '2014-08-22', 0, 0, 83, '2014-08-31'),
(23, 9, '2014-08-22', 0, 0, 84, '2014-08-31'),
(28, 9, '2014-08-22', 0, 0, 85, '2014-08-31'),
(33, 9, '2014-08-22', 0, 0, 86, '2014-08-31'),
(34, 9, '2014-08-22', 0, 0, 87, '2014-08-31'),
(35, 9, '2014-08-22', 0, 0, 88, '2014-08-31'),
(41, 9, '2014-08-22', 0, 0, 89, '2014-08-31'),
(45, 9, '2014-08-22', 0, 0, 90, '2014-08-31'),
(46, 9, '2014-08-22', 0, 0, 91, '2014-08-31'),
(47, 9, '2014-08-22', 0, 0, 92, '2014-08-31'),
(56, 9, '2014-08-22', 0, 0, 93, '2014-08-31'),
(57, 9, '2014-08-22', 0, 0, 94, '2014-08-31'),
(70, 9, '2014-08-22', 0, 0, 95, '2014-08-31'),
(79, 9, '2014-08-22', 0, 0, 96, '2014-08-31'),
(83, 9, '2014-08-22', 0, 0, 97, '2014-08-31'),
(87, 9, '2014-08-22', 0, 0, 98, '2014-08-31'),
(8, 9, '2014-08-22', 0, 0, 99, '2014-08-31'),
(10, 9, '2014-08-22', 0, 0, 100, '2014-08-31'),
(11, 9, '2014-08-22', 0, 0, 101, '2014-08-31'),
(16, 9, '2014-08-22', 0, 0, 102, '2014-08-31'),
(19, 9, '2014-08-22', 0, 0, 103, '2014-08-31'),
(27, 9, '2014-08-22', 0, 0, 104, '2014-08-31'),
(29, 9, '2014-08-22', 0, 0, 105, '2014-08-31'),
(30, 9, '2014-08-22', 0, 0, 106, '2014-08-31'),
(31, 9, '2014-08-22', 0, 0, 107, '2014-08-31'),
(32, 9, '2014-08-22', 0, 0, 108, '2014-08-31'),
(37, 9, '2014-08-22', 0, 0, 109, '2014-08-31'),
(39, 9, '2014-08-22', 0, 0, 110, '2014-08-31'),
(42, 9, '2014-08-22', 0, 0, 111, '2014-08-31'),
(49, 9, '2014-08-22', 0, 0, 112, '2014-08-31'),
(52, 9, '2014-08-22', 0, 0, 113, '2014-08-31'),
(53, 9, '2014-08-22', 0, 0, 114, '2014-08-31'),
(54, 9, '2014-08-22', 0, 0, 115, '2014-08-31'),
(58, 9, '2014-08-22', 0, 0, 116, '2014-08-31'),
(62, 9, '2014-08-22', 0, 0, 117, '2014-08-31'),
(67, 9, '2014-08-22', 0, 0, 118, '2014-08-31'),
(71, 9, '2014-08-22', 0, 0, 119, '2014-08-31'),
(72, 9, '2014-08-22', 0, 0, 120, '2014-08-31'),
(73, 9, '2014-08-22', 0, 0, 121, '2014-08-31'),
(77, 9, '2014-08-22', 0, 0, 122, '2014-08-31'),
(80, 9, '2014-08-22', 0, 0, 123, '2014-08-31'),
(81, 9, '2014-08-22', 0, 0, 124, '2014-08-31');

-- --------------------------------------------------------

--
-- Structure de la table `detailsevenementsuivi`
--

CREATE TABLE IF NOT EXISTS `detailsevenementsuivi` (
  `nbreSession` int(11) default NULL,
  `appreciation` text,
  `detailsEvenementSuiviID` int(11) NOT NULL auto_increment,
  `recrue` int(11) default NULL,
  `realiserID` int(11) default NULL,
  PRIMARY KEY  (`detailsEvenementSuiviID`),
  KEY `FK_DetailsEvenementSuivi_Recrue` (`recrue`),
  KEY `FK_DetailsEvenementSuivi_Evenement` (`realiserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Contenu de la table `detailsevenementsuivi`
--

INSERT INTO `detailsevenementsuivi` (`nbreSession`, `appreciation`, `detailsEvenementSuiviID`, `recrue`, `realiserID`) VALUES
(1, '', 1, 58, 30),
(1, '', 2, 58, 20),
(1, '', 3, 58, 14),
(4, '', 4, 58, 1),
(1, '', 5, 86, 23),
(1, 'observation', 6, 34, 14),
(1, '', 7, 34, 20),
(1, '', 8, 34, 30),
(4, '', 9, 87, 2),
(1, '', 10, 87, 23),
(1, '', 11, 66, 20),
(1, '', 12, 66, 30),
(4, '', 13, 66, 1),
(1, '', 14, 66, 14),
(0, 'mauvais élève', 15, 65, 31);

-- --------------------------------------------------------

--
-- Structure de la table `detailsrencontres`
--

CREATE TABLE IF NOT EXISTS `detailsrencontres` (
  `detailsrencontreID` int(11) NOT NULL auto_increment,
  `duree` int(11) NOT NULL,
  `heureDebut` varchar(20) NOT NULL,
  `sessionID` int(11) NOT NULL,
  PRIMARY KEY  (`detailsrencontreID`),
  KEY `sessionID` (`sessionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `domaine`
--

CREATE TABLE IF NOT EXISTS `domaine` (
  `code` varchar(255) default NULL,
  `nom` varchar(255) default NULL,
  `domaineID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`domaineID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `domaine`
--

INSERT INTO `domaine` (`code`, `nom`, `domaineID`) VALUES
('DO1', 'comportemental', 1),
('DO2', 'produits et services', 2),
('DO3', 'traitement des opérations', 3),
('DO4', 'risques opérationnels', 4);

-- --------------------------------------------------------

--
-- Structure de la table `entretien`
--

CREATE TABLE IF NOT EXISTS `entretien` (
  `duree` int(11) default NULL,
  `heureDeDebut` int(11) default NULL,
  `lieu` varchar(255) default NULL,
  `entretienID` int(11) NOT NULL,
  PRIMARY KEY  (`entretienID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE IF NOT EXISTS `evenement` (
  `code` varchar(255) default NULL,
  `sujet` varchar(255) default NULL,
  `description` text,
  `evenementID` int(11) NOT NULL auto_increment,
  `moisDebut` int(11) NOT NULL,
  `moisFin` int(11) NOT NULL,
  PRIMARY KEY  (`evenementID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Contenu de la table `evenement`
--

INSERT INTO `evenement` (`code`, `sujet`, `description`, `evenementID`, `moisDebut`, `moisFin`) VALUES
('EV1CU1', 'Le cycle Générique de Formation Agence', '<h3>La vocation</h3>\n<p>Le Cycle Générique de Formation Agence - Cursus <strong>Agent Commercial</strong> a pour vocation de former des collaborateurs capables de :</p>\n<ul>\n	<li>Répondre aux demandes d''information de la clientèle</li>\n	<li>Orienter le client vers l''interlocuteur approprié en dehors des opérations de guichet </li>\n	<li>Traiter les opérations courantes </li>\n	<li>Gérer les fonds dont il a la responsabiltié dans le respect des dispositions en viguer</li>\n	<li>Veiller à la réaliation des objectifs commerciaux fixés par agent ;</li>\n	<li>Prendre en charge le classement des documents et pièces justificatives et mettre à jour les dossiers </li>\n	<li>Effectuer les opérations de pointage et de rapprochement </li>\n	<li>Assuerer la maintenance des automates</li>\n</ul>\n<h3>La cible</h3>\n<p>Ce cycle de Formation s''adresse aux : </p>\n<ul>\n	<li>Nouvelles Recrues du réseau BCP : Objectif initial</li>\n	<li>Agents Commerciaux en activité : Objectif de mise à niveau </li>\n	<li>Agents redéployés vers le réseau</li>\n</ul>', 7, 1, 12),
('EV2CU2', 'Le cycle Générique de Formation Agence', 'jkjkdfjkfdjkdfjkjkfd', 8, 0, 0),
('EV3RE1', 'Rassemblement', '', 9, 1, 12),
('EV4AS1', 'Centre d''évaluation', 'un simple test', 10, 1, 6),
('EV5CO0', 'Entretien de langage clientèle', 'Comment s''adresser au client\r\nComment s''habiller', 11, 4, 4),
('EV6RE2', 'Rencontre de toutes les recrues de la region de casablanca', '', 12, 1, 12),
('EV7RE3', 'La rencontre des chefs', '', 13, 1, 12),
('EV8CU3', 'Le cycle Générique de Formation Agence', 'Ce cycle de formation a pour cible les Chargés clientèle professionnels et particuliers en activité pour établir une mise à niveau  et les nouvelles recrues.  ', 14, 0, 0),
('EV9CU4', 'Le cycle Générique de Formation Agence', 'Ce cycle de formation a pour cible les responsables administratifs (RA) en activité pour d?établir une mise à niveau, les chargés de clientèle proposés dans le plan de  relève et les nouvelles recrues.  ', 15, 0, 0),
('EV10CU5', 'Le cycle Générique de Formation Agence', 'Ce cycle de formation a pour cible les directeurs d?agence en activité pour une mise à niveau,  les  responsables  administratifs  proposés  dans  le  plan  de  relève  et  les  nouvelles recrues.  ', 16, 0, 0),
('EV11CO0', 'Formation sur l''image personnelle', '', 17, 3, 3),
('EV12CO0', 'Formation sur le langage et la communication', '', 18, 5, 5);

-- --------------------------------------------------------

--
-- Structure de la table `listereponse`
--

CREATE TABLE IF NOT EXISTS `listereponse` (
  `id` int(11) NOT NULL auto_increment,
  `reponse` varchar(255) NOT NULL,
  `champquestionnaire` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `champquestionnaire` (`champquestionnaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Contenu de la table `listereponse`
--

INSERT INTO `listereponse` (`id`, `reponse`, `champquestionnaire`) VALUES
(1, 'Tout à fait', 3),
(2, 'moyen', 3),
(3, 'pas vraiment', 3),
(4, 'Ne sait pas/pas d''opinion', 3),
(5, 'Tout à fait', 4),
(6, 'moyen', 4),
(7, 'pas vraiment', 4),
(8, 'Pas d''opinion', 4),
(9, 'Tout à fait', 5),
(10, 'moyen', 5),
(11, 'pas vraiment', 5),
(12, 'pas d''opinion', 5),
(13, 'Oui', 14),
(14, 'Non', 14),
(15, 'Un peu', 14),
(16, 'oui', 17),
(17, 'non', 17),
(18, 'indifférent(e)', 17),
(19, 'oui', 19),
(20, 'non', 19);

-- --------------------------------------------------------

--
-- Structure de la table `membredfr`
--

CREATE TABLE IF NOT EXISTS `membredfr` (
  `matricule` varchar(255) default NULL,
  `nom` varchar(255) default NULL,
  `prenom` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `telephone` varchar(255) default NULL,
  `sexe` varchar(255) default NULL,
  `membreDFRID` int(11) NOT NULL auto_increment,
  `compteUtilisateurID` int(11) default NULL,
  PRIMARY KEY  (`membreDFRID`),
  KEY `FK_MembreDFR_CompteUtilisateur` (`compteUtilisateurID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `membredfr`
--

INSERT INTO `membredfr` (`matricule`, `nom`, `prenom`, `email`, `telephone`, `sexe`, `membreDFRID`, `compteUtilisateurID`) VALUES
('00IO23TH', 'Zakaria', 'Amine ', 'k.bensoumahoro@bcp.co.ma', '06543214', 'homme', 1, 10),
('0P567YU', 'Amara', 'Karim', 'A.karim@bcp.co.ma', '09765532256', 'homme', 2, 20);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `messageID` int(11) NOT NULL auto_increment,
  `emis` int(11) NOT NULL,
  `recu` int(11) NOT NULL,
  `contenu` text NOT NULL,
  `date` datetime NOT NULL,
  `lu` tinyint(1) NOT NULL,
  PRIMARY KEY  (`messageID`),
  KEY `emis` (`emis`),
  KEY `recu` (`recu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- Contenu de la table `message`
--

INSERT INTO `message` (`messageID`, `emis`, `recu`, `contenu`, `date`, `lu`) VALUES
(1, 27, 15, 'Salut!comment vas tu?', '2014-08-18 18:58:09', 1),
(2, 15, 27, 'merci je vais bien. et toi?', '2014-08-18 19:11:46', 1),
(3, 37, 27, 'bonjour!je dois vous voir.', '2014-08-18 19:14:10', 1),
(4, 27, 15, 'ça va!merci', '2014-08-19 14:44:22', 1),
(5, 27, 37, 'c''est pourquoi?', '2014-08-19 14:46:35', 0),
(6, 27, 45, 'salut', '2014-08-19 14:46:53', 0),
(7, 27, 37, 'où?', '2014-08-20 18:20:42', 0),
(8, 10, 27, 'salut! ici c''est l''admin', '2014-08-20 18:36:35', 1),
(9, 27, 10, 'ok! merci', '2014-08-20 19:44:16', 0),
(10, 15, 27, 'et tes affaires?', '2014-08-20 20:31:52', 1),
(11, 27, 15, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2014-08-20 20:54:53', 1),
(12, 27, 37, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2014-08-20 20:56:44', 0),
(13, 15, 27, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2014-08-20 21:16:42', 1),
(14, 15, 27, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2014-08-20 21:21:43', 1),
(15, 15, 27, 'c.html()', '2014-08-20 21:44:15', 1),
(16, 27, 15, 'rtfghrtghrt try r thrfgjhfjhfbh hyty', '2014-08-20 21:44:45', 1),
(17, 15, 27, 'lol', '2014-08-20 23:25:31', 1),
(18, 15, 27, 'lol230', '2014-08-20 23:32:34', 1),
(19, 27, 15, 'sol789', '2014-08-20 23:37:24', 1),
(20, 27, 15, 'azee\n', '2014-08-20 23:37:54', 1),
(21, 27, 15, 'kel way?', '2014-08-20 23:38:40', 1),
(22, 15, 27, 'aaa', '2014-08-21 06:11:57', 1),
(23, 15, 27, 'bbb', '2014-08-21 06:12:46', 1),
(24, 27, 15, 'vvv', '2014-08-21 06:12:58', 1),
(25, 27, 15, 'jjj', '2014-08-21 06:13:24', 1),
(26, 27, 15, 'aze', '2014-08-21 06:13:42', 1),
(27, 27, 15, 'pour', '2014-08-21 06:25:01', 1),
(28, 27, 15, 'koi', '2014-08-21 06:25:32', 1),
(29, 15, 27, 'cè koi tn blème?', '2014-08-21 06:31:07', 1),
(30, 27, 15, 'je suis fatigué!!', '2014-08-21 06:31:42', 1),
(31, 15, 27, 'va dormir !! ', '2014-08-21 06:35:29', 1),
(32, 27, 15, 'ok', '2014-08-21 06:36:14', 1),
(33, 27, 15, 'mais je dois finir ce truc avant', '2014-08-21 06:36:50', 1),
(34, 15, 27, 'ok', '2014-08-21 06:39:48', 1),
(35, 15, 27, 'fais doucement hoo', '2014-08-21 06:40:28', 1),
(36, 27, 15, 'w', '2014-08-21 06:43:54', 1),
(37, 15, 27, 'koi', '2014-08-21 06:45:18', 1),
(38, 27, 15, 'koi', '2014-08-21 06:48:11', 1),
(39, 27, 15, 'poul', '2014-08-21 06:48:38', 0),
(40, 20, 97, 'salut gill', '2014-08-22 14:04:53', 0),
(41, 20, 97, 'salut gill', '2014-08-23 02:10:36', 0),
(42, 20, 97, '', '2014-08-26 01:07:15', 0),
(43, 20, 43, '', '2014-08-26 18:09:37', 0);

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

CREATE TABLE IF NOT EXISTS `niveau` (
  `niveauID` int(11) NOT NULL auto_increment,
  `niveau` varchar(255) NOT NULL,
  PRIMARY KEY  (`niveauID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `niveau`
--

INSERT INTO `niveau` (`niveauID`, `niveau`) VALUES
(1, 'Bac +2'),
(2, 'Bac +3'),
(3, 'Bac +4'),
(4, 'Bac +5');

-- --------------------------------------------------------

--
-- Structure de la table `parcours`
--

CREATE TABLE IF NOT EXISTS `parcours` (
  `id` int(11) NOT NULL auto_increment,
  `recrue` int(11) NOT NULL,
  `promocateposteID` int(11) NOT NULL,
  `created` timestamp NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `recrue` (`recrue`),
  KEY `promocateposteID` (`promocateposteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=156 ;

--
-- Contenu de la table `parcours`
--

INSERT INTO `parcours` (`id`, `recrue`, `promocateposteID`, `created`) VALUES
(1, 14, 10, '2014-07-31 13:56:41'),
(2, 5, 10, '2014-08-02 13:17:22'),
(3, 11, 10, '2014-08-02 13:52:52'),
(4, 12, 10, '2014-08-02 13:52:52'),
(5, 15, 12, '2014-08-02 14:43:22'),
(6, 16, 12, '2014-08-02 14:43:23'),
(7, 17, 12, '2014-08-02 14:43:24'),
(8, 18, 11, '2014-08-02 14:43:26'),
(9, 19, 11, '2014-08-02 14:43:27'),
(10, 20, 12, '2014-08-02 14:43:28'),
(11, 21, 12, '2014-08-02 14:43:30'),
(12, 22, 12, '2014-08-02 14:43:31'),
(13, 23, 12, '2014-08-02 14:43:32'),
(14, 24, 12, '2014-08-02 14:43:33'),
(15, 25, 10, '2014-08-02 14:43:35'),
(16, 26, 11, '2014-08-02 14:43:36'),
(17, 27, 12, '2014-08-02 14:43:38'),
(18, 28, 11, '2014-08-02 14:43:39'),
(19, 29, 12, '2014-08-02 14:43:41'),
(20, 30, 10, '2014-08-02 14:43:42'),
(21, 31, 10, '2014-08-02 14:43:43'),
(22, 32, 11, '2014-08-02 14:43:45'),
(23, 33, 11, '2014-08-02 14:43:46'),
(24, 34, 11, '2014-08-02 14:43:48'),
(25, 35, 10, '2014-08-02 14:43:50'),
(26, 36, 12, '2014-08-02 14:43:51'),
(27, 37, 10, '2014-08-02 14:49:36'),
(28, 38, 12, '2014-08-02 14:49:38'),
(29, 39, 12, '2014-08-02 14:49:40'),
(30, 40, 11, '2014-08-02 14:49:41'),
(31, 41, 12, '2014-08-02 14:49:43'),
(32, 42, 12, '2014-08-02 14:49:45'),
(33, 43, 11, '2014-08-02 14:49:46'),
(34, 44, 10, '2014-08-02 14:49:48'),
(35, 45, 19, '2014-08-02 14:58:18'),
(36, 46, 19, '2014-08-02 14:58:19'),
(37, 47, 21, '2014-08-02 14:58:21'),
(38, 48, 20, '2014-08-02 14:58:23'),
(39, 49, 20, '2014-08-02 14:58:25'),
(40, 50, 20, '2014-08-02 14:58:27'),
(41, 51, 21, '2014-08-02 14:58:28'),
(42, 52, 20, '2014-08-02 14:58:31'),
(43, 53, 21, '2014-08-02 14:58:33'),
(44, 54, 20, '2014-08-02 14:58:35'),
(45, 55, 21, '2014-08-02 14:58:36'),
(46, 56, 21, '2014-08-02 14:58:38'),
(47, 57, 21, '2014-08-02 14:58:40'),
(48, 58, 19, '2014-08-02 14:58:42'),
(49, 59, 21, '2014-08-02 14:58:44'),
(50, 60, 20, '2014-08-02 14:58:46'),
(51, 61, 19, '2014-08-02 14:58:48'),
(52, 62, 19, '2014-08-02 14:58:51'),
(53, 63, 21, '2014-08-02 14:58:53'),
(54, 64, 20, '2014-08-02 14:58:55'),
(55, 65, 20, '2014-08-02 14:58:57'),
(56, 66, 21, '2014-08-02 14:58:59'),
(57, 67, 21, '2014-08-02 15:02:01'),
(58, 68, 19, '2014-08-02 15:02:03'),
(59, 69, 20, '2014-08-02 15:02:05'),
(60, 70, 29, '2014-08-02 15:12:57'),
(61, 71, 28, '2014-08-02 15:12:59'),
(62, 72, 29, '2014-08-02 15:13:01'),
(63, 73, 30, '2014-08-02 15:13:03'),
(64, 74, 28, '2014-08-02 15:13:05'),
(65, 75, 29, '2014-08-02 15:13:08'),
(66, 76, 28, '2014-08-02 15:13:10'),
(67, 77, 28, '2014-08-02 15:13:12'),
(68, 78, 29, '2014-08-02 15:15:51'),
(69, 79, 28, '2014-08-02 15:15:54'),
(70, 80, 28, '2014-08-02 15:15:56'),
(71, 81, 28, '2014-08-02 15:15:59'),
(72, 82, 28, '2014-08-02 15:16:02'),
(73, 83, 29, '2014-08-02 15:16:04'),
(74, 84, 30, '2014-08-02 15:16:07'),
(75, 85, 28, '2014-08-02 15:16:09'),
(76, 86, 28, '2014-08-02 15:16:12'),
(77, 87, 29, '2014-08-02 15:16:14'),
(78, 88, 29, '2014-08-02 15:16:17'),
(79, 89, 29, '2014-08-02 15:16:19'),
(80, 8, 18, '2014-08-02 20:37:16'),
(81, 8, 24, '2014-08-02 20:45:12'),
(82, 8, 30, '2014-08-02 20:45:12'),
(84, 81, 22, '2014-08-06 01:08:33'),
(85, 81, 16, '2014-08-06 01:12:38'),
(86, 68, 13, '2014-08-06 01:19:36'),
(87, 76, 22, '2014-08-06 01:20:27'),
(88, 76, 16, '2014-08-06 01:22:31'),
(89, 74, 22, '2014-08-06 01:36:07'),
(90, 74, 16, '2014-08-06 02:25:35'),
(91, 61, 13, '2014-08-06 02:30:43'),
(92, 82, 22, '2014-08-06 02:36:21'),
(93, 82, 16, '2014-08-06 02:37:43'),
(94, 85, 22, '2014-08-06 02:49:26'),
(95, 86, 22, '2014-08-06 02:51:19'),
(96, 79, 22, '2014-08-06 02:52:12'),
(97, 79, 16, '2014-08-06 02:52:34'),
(98, 46, 13, '2014-08-06 02:59:52'),
(99, 45, 13, '2014-08-06 02:59:52'),
(100, 58, 13, '2014-08-06 02:59:55'),
(101, 62, 13, '2014-08-06 02:59:58'),
(102, 62, 16, '2014-08-06 03:00:03'),
(103, 77, 22, '2014-08-06 03:00:13'),
(104, 71, 22, '2014-08-06 03:00:14'),
(105, 80, 22, '2014-08-06 03:00:14'),
(106, 80, 16, '2014-08-06 03:02:07'),
(107, 77, 16, '2014-08-06 03:02:12'),
(108, 71, 16, '2014-08-06 03:02:15'),
(109, 86, 16, '2014-08-06 03:02:17'),
(110, 85, 16, '2014-08-06 03:02:17'),
(111, 48, 14, '2014-08-06 03:03:27'),
(112, 60, 14, '2014-08-06 03:03:33'),
(113, 64, 14, '2014-08-06 03:03:34'),
(114, 65, 14, '2014-08-06 03:03:39'),
(115, 69, 14, '2014-08-06 03:03:39'),
(116, 88, 23, '2014-08-06 03:04:11'),
(117, 50, 14, '2014-08-06 03:04:17'),
(118, 75, 23, '2014-08-06 03:04:18'),
(119, 78, 23, '2014-08-06 03:04:21'),
(120, 89, 23, '2014-08-06 03:04:22'),
(121, 83, 23, '2014-08-06 03:04:31'),
(122, 87, 23, '2014-08-06 03:04:32'),
(123, 70, 23, '2014-08-06 03:04:32'),
(124, 72, 23, '2014-08-06 03:05:12'),
(125, 54, 14, '2014-08-06 03:05:15'),
(126, 52, 14, '2014-08-06 03:05:19'),
(127, 49, 14, '2014-08-06 03:05:21'),
(128, 88, 17, '2014-08-06 03:06:07'),
(129, 75, 17, '2014-08-06 03:06:10'),
(130, 78, 17, '2014-08-06 03:06:17'),
(131, 89, 17, '2014-08-06 03:06:18'),
(132, 70, 17, '2014-08-06 03:06:20'),
(133, 83, 17, '2014-08-06 03:06:54'),
(134, 87, 17, '2014-08-06 03:06:56'),
(135, 72, 17, '2014-08-06 03:07:00'),
(136, 51, 15, '2014-08-06 03:07:58'),
(137, 55, 15, '2014-08-06 03:08:02'),
(138, 59, 15, '2014-08-06 03:08:04'),
(139, 66, 15, '2014-08-06 03:08:08'),
(140, 63, 15, '2014-08-06 03:08:11'),
(141, 84, 24, '2014-08-06 03:08:15'),
(142, 84, 18, '2014-08-06 03:08:37'),
(143, 47, 15, '2014-08-06 03:08:42'),
(144, 56, 15, '2014-08-06 03:08:44'),
(145, 57, 15, '2014-08-06 03:08:45'),
(146, 67, 15, '2014-08-06 03:08:52'),
(147, 53, 15, '2014-08-06 03:08:54'),
(148, 73, 24, '2014-08-06 03:10:48'),
(149, 73, 18, '2014-08-06 03:11:23'),
(150, 9, 11, '2014-08-06 03:56:48'),
(151, 4, 11, '2014-08-06 03:57:50'),
(152, 13, 11, '2014-08-06 03:59:06'),
(153, 10, 12, '2014-08-06 04:02:02'),
(154, 7, 14, '2014-08-06 04:05:24'),
(155, 7, 20, '2014-08-06 04:05:24');

-- --------------------------------------------------------

--
-- Structure de la table `persistent_logins`
--

CREATE TABLE IF NOT EXISTS `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `planning`
--

CREATE TABLE IF NOT EXISTS `planning` (
  `dateDeDebut` date default NULL,
  `dateDeFin` date default NULL,
  `planningID` int(11) NOT NULL auto_increment,
  `realiserID` int(11) NOT NULL,
  PRIMARY KEY  (`planningID`),
  KEY `FK_Planning_Evenement` (`realiserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=91 ;

--
-- Contenu de la table `planning`
--

INSERT INTO `planning` (`dateDeDebut`, `dateDeFin`, `planningID`, `realiserID`) VALUES
('2013-06-24', '2013-06-24', 9, 14),
('2013-01-07', '2013-12-27', 14, 1),
('2013-02-04', '2013-08-23', 15, 2),
('2013-07-01', '2013-11-29', 16, 5),
('2013-01-01', '2013-12-27', 17, 6),
('2013-01-01', '2013-06-28', 18, 8),
('2013-07-01', '2013-11-22', 19, 9),
('2013-01-01', '2013-12-27', 20, 10),
('2013-01-01', '2013-11-22', 21, 11),
('2013-07-01', '2013-11-29', 22, 27),
('2013-01-01', '2013-11-29', 23, 23),
('2013-01-01', '2013-06-28', 24, 25),
('2013-07-01', '2013-11-29', 25, 28),
('2013-01-01', '2013-12-31', 26, 24),
('2013-01-01', '2013-06-28', 27, 26),
('2013-02-07', '2013-02-07', 28, 19),
('2013-05-01', '2013-05-01', 29, 29),
('2013-06-26', '2013-06-26', 30, 30),
('2013-04-04', '2013-04-04', 31, 31),
('2013-02-04', '2013-02-04', 32, 32),
('2013-03-11', '2013-03-11', 33, 20),
('2013-07-01', '2013-07-01', 34, 33),
('2013-08-05', '2013-08-05', 35, 34),
('2013-01-01', '2013-06-28', 36, 3),
('2013-01-01', '2013-06-28', 37, 7),
('2013-01-01', '2013-06-28', 38, 12),
('2014-06-24', '2014-06-24', 39, 14),
('2014-01-07', '2014-12-27', 40, 1),
('2014-02-04', '2014-08-23', 41, 2),
('2014-07-01', '2014-11-29', 42, 5),
('2014-01-01', '2014-12-27', 43, 6),
('2014-01-01', '2014-06-28', 44, 8),
('2014-07-01', '2014-11-22', 45, 9),
('2014-01-01', '2014-12-27', 46, 10),
('2014-01-01', '2014-11-22', 47, 11),
('2014-07-01', '2014-11-29', 48, 27),
('2014-01-01', '2014-11-29', 49, 23),
('2014-01-01', '2014-06-28', 50, 25),
('2014-07-01', '2014-11-29', 51, 28),
('2014-01-01', '2014-12-31', 52, 24),
('2014-01-01', '2014-06-28', 53, 26),
('2014-02-07', '2014-02-07', 54, 19),
('2014-05-01', '2014-05-01', 55, 29),
('2014-06-26', '2014-06-26', 56, 30),
('2014-04-04', '2014-04-04', 57, 31),
('2014-02-04', '2014-02-04', 58, 32),
('2014-03-11', '2014-03-11', 59, 20),
('2014-07-01', '2014-07-01', 60, 33),
('2014-08-05', '2014-08-05', 61, 34),
('2014-01-01', '2014-06-28', 62, 3),
('2014-01-01', '2014-06-28', 63, 7),
('2014-01-01', '2014-06-28', 64, 12),
('2012-06-24', '2012-06-24', 65, 14),
('2012-01-07', '2012-12-27', 66, 1),
('2012-02-04', '2012-08-23', 67, 2),
('2012-07-01', '2012-11-29', 68, 5),
('2012-01-01', '2012-12-27', 69, 6),
('2012-01-01', '2012-06-28', 70, 8),
('2012-07-01', '2012-11-22', 71, 9),
('2012-01-01', '2012-12-27', 72, 10),
('2012-01-01', '2012-11-22', 73, 11),
('2012-07-01', '2012-11-29', 74, 27),
('2012-01-01', '2012-11-29', 75, 23),
('2012-01-01', '2012-06-28', 76, 25),
('2012-07-01', '2012-11-29', 77, 28),
('2012-01-01', '2012-12-31', 78, 24),
('2012-01-01', '2012-06-28', 79, 26),
('2012-02-07', '2012-02-07', 80, 19),
('2012-05-01', '2012-05-01', 81, 29),
('2012-06-26', '2012-06-26', 82, 30),
('2012-04-04', '2012-04-04', 83, 31),
('2012-02-04', '2012-02-04', 84, 32),
('2012-03-11', '2012-03-11', 85, 20),
('2012-07-01', '2012-07-01', 86, 33),
('2012-08-05', '2012-08-05', 87, 34),
('2012-01-01', '2012-06-28', 88, 3),
('2012-01-01', '2012-06-28', 89, 7),
('2012-01-01', '2012-06-28', 90, 12);

-- --------------------------------------------------------

--
-- Structure de la table `posseder`
--

CREATE TABLE IF NOT EXISTS `posseder` (
  `roleID` int(11) NOT NULL,
  `compteUtilisateurID` int(11) NOT NULL,
  KEY `roleID` (`roleID`,`compteUtilisateurID`),
  KEY `compteUtilisateurID` (`compteUtilisateurID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `posseder`
--

INSERT INTO `posseder` (`roleID`, `compteUtilisateurID`) VALUES
(1, 10),
(3, 15),
(3, 21),
(3, 22),
(3, 23),
(3, 24),
(3, 27),
(3, 28),
(3, 29),
(3, 30),
(3, 31),
(3, 32),
(3, 33),
(3, 34),
(3, 35),
(3, 36),
(3, 37),
(3, 38),
(3, 39),
(3, 40),
(3, 41),
(3, 42),
(3, 43),
(3, 44),
(3, 45),
(3, 46),
(3, 47),
(3, 48),
(3, 49),
(3, 50),
(3, 51),
(3, 52),
(3, 53),
(3, 54),
(3, 55),
(3, 57),
(3, 58),
(3, 59),
(3, 60),
(3, 61),
(3, 62),
(3, 63),
(3, 64),
(3, 65),
(3, 66),
(3, 67),
(3, 68),
(3, 69),
(3, 70),
(3, 71),
(3, 72),
(3, 73),
(3, 74),
(3, 75),
(3, 76),
(3, 77),
(3, 78),
(3, 79),
(3, 80),
(3, 81),
(3, 82),
(3, 83),
(3, 84),
(3, 85),
(3, 86),
(3, 88),
(3, 89),
(3, 90),
(3, 91),
(3, 92),
(3, 93),
(3, 94),
(3, 95),
(3, 96),
(3, 97),
(3, 98),
(3, 100),
(3, 101),
(3, 102),
(3, 103),
(3, 104),
(3, 105),
(3, 106),
(3, 107),
(3, 108),
(3, 109),
(3, 110),
(3, 111),
(5, 20);

-- --------------------------------------------------------

--
-- Structure de la table `poste`
--

CREATE TABLE IF NOT EXISTS `poste` (
  `code` varchar(255) default NULL,
  `nom` varchar(255) default NULL,
  `description` text,
  `posteID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`posteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `poste`
--

INSERT INTO `poste` (`code`, `nom`, `description`, `posteID`) VALUES
('AGTCOM', 'Agent Commercial', 'Les  agents  commerciaux  entretiennent  des  relations  avec  leurs  clients  et  prennent contact avec des clients potentiels pour :\n-	Vérifier leurs besoins réels ;  \n-	Exposer tous les bénéfices qu’ils y trouveront ; \n-	Préciser les modalités d’acquisition ; \n-	Signer les bons de commande\n', 1),
('CHGPROD', 'Chargé produit', 'Le  chargé  de  produit  dépend  du  responsable  Marketing.  Il  gère  les  ventes  et  la progression d’un produit, en analysant l’environnement de ce dernier (concurrence …), et en recherchant des axes d’amélioration ou de création de valeur ajoutée pour ledit produit.', 2),
('CHGCLT', 'Chargé Clientèle', 'Un chargé de clientèle est un salarié à qui l’on attribue un portefeuille de clients. Il est chargé de  fidéliser cette clientèle, d’augmenter les opérations avec elle en lui vendant d’autres produits, et enfin, d’accroître le portefeuille en prospectant de nouveaux clients.', 3);

-- --------------------------------------------------------

--
-- Structure de la table `promocateposte`
--

CREATE TABLE IF NOT EXISTS `promocateposte` (
  `promocateposteID` int(11) NOT NULL auto_increment,
  `categorieposteID` int(11) NOT NULL,
  `promotionID` int(11) NOT NULL,
  PRIMARY KEY  (`promocateposteID`),
  KEY `categorieposteID` (`categorieposteID`),
  KEY `promotionID` (`promotionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=82 ;

--
-- Contenu de la table `promocateposte`
--

INSERT INTO `promocateposte` (`promocateposteID`, `categorieposteID`, `promotionID`) VALUES
(1, 1, 4),
(2, 4, 4),
(3, 7, 4),
(4, 2, 4),
(5, 5, 4),
(6, 8, 4),
(7, 3, 4),
(8, 6, 4),
(9, 9, 4),
(10, 1, 1),
(11, 4, 1),
(12, 7, 1),
(13, 2, 1),
(14, 5, 1),
(15, 8, 1),
(16, 3, 1),
(17, 6, 1),
(18, 9, 1),
(19, 1, 2),
(20, 4, 2),
(21, 7, 2),
(22, 2, 2),
(23, 5, 2),
(24, 8, 2),
(25, 3, 2),
(26, 6, 2),
(27, 9, 2),
(28, 1, 3),
(29, 4, 3),
(30, 7, 3),
(31, 2, 3),
(32, 5, 3),
(33, 8, 3),
(34, 3, 3),
(35, 6, 3),
(36, 9, 3),
(37, 1, 5),
(38, 4, 5),
(39, 7, 5),
(40, 2, 5),
(41, 5, 5),
(42, 8, 5),
(43, 3, 5),
(44, 6, 5),
(45, 9, 5),
(46, 1, 6),
(47, 4, 6),
(48, 7, 6),
(49, 2, 6),
(50, 5, 6),
(51, 8, 6),
(52, 3, 6),
(53, 6, 6),
(54, 9, 6),
(55, 1, 7),
(56, 4, 7),
(57, 7, 7),
(58, 2, 7),
(59, 5, 7),
(60, 8, 7),
(61, 3, 7),
(62, 6, 7),
(63, 9, 7),
(64, 1, 8),
(65, 4, 8),
(66, 7, 8),
(67, 2, 8),
(68, 5, 8),
(69, 8, 8),
(70, 3, 8),
(71, 6, 8),
(72, 9, 8),
(73, 1, 9),
(74, 4, 9),
(75, 7, 9),
(76, 2, 9),
(77, 5, 9),
(78, 8, 9),
(79, 3, 9),
(80, 6, 9),
(81, 9, 9);

-- --------------------------------------------------------

--
-- Structure de la table `promotion`
--

CREATE TABLE IF NOT EXISTS `promotion` (
  `id` int(11) NOT NULL auto_increment,
  `annee` int(11) NOT NULL,
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `promotion`
--

INSERT INTO `promotion` (`id`, `annee`, `date`) VALUES
(1, 2014, '2014-06-11 12:57:44'),
(2, 2013, '2014-06-14 13:36:13'),
(3, 2012, '2014-06-14 13:36:13'),
(4, 2015, '2014-07-31 13:56:39'),
(5, 2016, '2014-08-22 16:29:33'),
(6, 2017, '2014-08-22 16:33:50'),
(7, 2018, '2014-08-22 16:40:40'),
(8, 2019, '2014-08-22 16:42:07'),
(9, 2020, '2014-08-22 16:44:49');

-- --------------------------------------------------------

--
-- Structure de la table `questionnaire`
--

CREATE TABLE IF NOT EXISTS `questionnaire` (
  `version` varchar(255) default NULL,
  `etat` varchar(255) default NULL,
  `titre` varchar(255) default NULL,
  `resume` text,
  `questionnaireID` int(11) NOT NULL auto_increment,
  `created` datetime NOT NULL,
  PRIMARY KEY  (`questionnaireID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `questionnaire`
--

INSERT INTO `questionnaire` (`version`, `etat`, `titre`, `resume`, `questionnaireID`, `created`) VALUES
('1.0.0', 'utilisable', 'Enquête de satisfaction auprès des nouvelles recrues', 'sysduydsb suygsdygduy dfhiudn duiidghui diughiudgh fugk duih iuhdi hid ujhd oihdfui ouhdif io ujhs dfouihoshdoi uhoksdhio shdiohd  hiduhdiu fuidghisu dgfui qsgg dfuigfuisgdfiugsui fsiu fg sifusdgfiu sgfuisdgfuisgfuisdgfisugd g u sidgfy sdg dg syug uyskiq qskjkjqsb kqhdsquqid qiduquidbhqsidbu qd qsiduq diqugs uidgqis qiqsgdug', 1, '2014-07-18 23:56:35'),
('1.0.0', 'utilisable', 'Deuxième formulaire', 'Lorem ipsum dolor sit ametkhf ugjkf ifgh ghojh o ghio hihifu hiodhiohdf oihod ouihdfio hioodhodf hohiohdf ohiohodfh ioiohoidfh iohiohd uiohdofuihuiohfdo oi ihoi dofhioiphod iuo hdf uiguidfodfuuiuiohdfui oidfh uihoidfhiohodf ohdfoihdfohiodfh ohdf oh odfiohhiodf ough hioihdf uiohudhf uiuoghdfsioopsuieioydofduigid fhuioghdfhih dfoi hfdioh odfhoidf oi dfoiofiho dfh iohif dfohf oihdf d odfd', 2, '2014-07-20 14:43:15'),
('1.0.0', 'utilisable', 'Troisieme formulaire', 'Le resume du formulaire trois', 3, '2014-07-20 14:53:36'),
('1.0.0', 'utilisable', 'formulaire 4 ', 'le resue du form 4', 4, '2014-07-20 15:03:15'),
('1.0.0', 'utilisable', 'sghsd', 'dghfyzsg', 5, '2014-07-21 10:42:01'),
('1.0.0', 'utilisable', 'abcdefghijklmnopqrstuvwxy zabcdefgh', 'ereret', 6, '2014-07-21 10:44:19'),
('1.0.0', 'utilisable', 'Sondage ', 'Nous aimerions avoir votre avis sur la suite des activités liées au processus d''intégration', 7, '2014-07-28 10:26:53'),
('1.0.0', 'utilisable', 'un tire', 'jkdfjkhdf', 8, '2014-07-28 12:27:04'),
('1.0.0', 'utilisable', 'Un bon p''tit formulaire pour des tests', 'Ce formulaire  est un test.Il est envoyé à toutes les recrues  tous postes confondus', 9, '2014-08-22 20:42:10');

-- --------------------------------------------------------

--
-- Structure de la table `realiser`
--

CREATE TABLE IF NOT EXISTS `realiser` (
  `evenementID` int(11) default NULL,
  `categorieposte` int(11) default NULL,
  `moisDebut` int(11) NOT NULL,
  `moisFin` int(11) NOT NULL,
  `realiserID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`realiserID`),
  KEY `Evenement` (`evenementID`),
  KEY `Categorie` (`categorieposte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Contenu de la table `realiser`
--

INSERT INTO `realiser` (`evenementID`, `categorieposte`, `moisDebut`, `moisFin`, `realiserID`) VALUES
(7, 1, 1, 12, 1),
(8, 2, 1, 12, 2),
(10, 3, 1, 6, 3),
(8, 4, 1, 12, 5),
(14, 5, 1, 12, 6),
(10, 6, 1, 6, 7),
(8, 7, 1, 6, 8),
(14, 7, 7, 12, 9),
(15, 8, 1, 12, 10),
(16, 9, 1, 12, 11),
(10, 9, 1, 6, 12),
(9, 1, 1, 12, 14),
(9, 4, 1, 12, 19),
(13, 1, 1, 12, 20),
(11, 2, 1, 12, 23),
(11, 5, 1, 12, 24),
(18, 3, 1, 6, 25),
(18, 6, 1, 6, 26),
(17, 3, 7, 12, 27),
(17, 6, 7, 12, 28),
(9, 7, 1, 12, 29),
(12, 1, 1, 12, 30),
(12, 4, 1, 12, 31),
(12, 7, 1, 12, 32),
(13, 4, 1, 12, 33),
(13, 7, 1, 12, 34);

-- --------------------------------------------------------

--
-- Structure de la table `recrue`
--

CREATE TABLE IF NOT EXISTS `recrue` (
  `matricule` varchar(255) default NULL,
  `nom` varchar(255) default NULL,
  `prenom` varchar(255) default NULL,
  `dateNaissance` date default NULL,
  `dateRecrutement` date default NULL,
  `niveau` int(11) NOT NULL,
  `email` varchar(255) default NULL,
  `telephone` varchar(255) default NULL,
  `sexe` int(11) NOT NULL,
  `recrueID` int(11) NOT NULL auto_increment,
  `agenceID` int(11) default NULL,
  `categorie` int(11) default NULL,
  `compteUtilisateurID` int(11) default NULL,
  `posteID` int(11) default NULL,
  `nationalite` varchar(255) NOT NULL,
  PRIMARY KEY  (`recrueID`),
  UNIQUE KEY `matricule` (`matricule`),
  KEY `affecter` (`agenceID`),
  KEY `concerner` (`categorie`),
  KEY `FK_Recrue_CompteUtilisateur` (`compteUtilisateurID`),
  KEY `occuper` (`posteID`),
  KEY `niveau` (`niveau`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=90 ;

--
-- Contenu de la table `recrue`
--

INSERT INTO `recrue` (`matricule`, `nom`, `prenom`, `dateNaissance`, `dateRecrutement`, `niveau`, `email`, `telephone`, `sexe`, `recrueID`, `agenceID`, `categorie`, `compteUtilisateurID`, `posteID`, `nationalite`) VALUES
('BE56350X', 'Fikri', 'Mereym', '2013-10-29', '2014-05-14', 1, 'F.mereym@cpm.co.ma', '0641746727', 2, 4, 1, 1, 15, 2, 'Marocaine'),
('201310150005', 'Khaled', 'Amine', '2014-06-10', '2014-06-19', 2, 'k.amine@cmp.co.ma', '02374855', 1, 5, 1, 1, 21, 1, 'Marocaine'),
('201310150008', 'Zakaria', 'rachid', '2014-06-10', '2014-06-19', 2, 'z.rachid@cmp.co.ma', '0237485555', 1, 6, 1, 2, 22, 1, 'Marocaine'),
('201403170045', 'Boucheboun', 'lamia', '2014-06-10', '2014-06-01', 1, 'b.lamia@cpm.co.ma', '06874589', 2, 7, 2, 2, 23, 2, 'Marocaine'),
('000457822', 'ABY', 'Romolo', '1990-11-12', '2012-01-12', 4, 'A.romolo@cpm.co.ma', '(+212)0678451236', 1, 8, 1, 3, 24, 3, 'Ivoirienne'),
('BE00IOL', 'Aby', 'Kouassi Léon', '2000-05-14', '2014-09-01', 3, 'A.kouassileon@cpm.co.ma', '0642785698', 1, 9, 1, 1, 27, 2, 'Ivoirienne'),
('DR002014', 'Dupont', 'Reeta', '2014-07-08', '2014-07-10', 4, 'D.reeta@cpm.co.ma', '0354781931', 2, 10, 3, 1, 32, 3, 'Française'),
('DA0012014', 'Dramé', 'Abibou', '2014-07-03', '2014-07-05', 4, 'D.abibou@cpm.co.ma', '', 1, 11, 4, 1, 29, 1, 'Sénégalaise'),
('1520078', 'MARGO', 'Eliza', '2014-07-12', '2014-07-14', 2, 'M.eliza@cpm.co.ma', '025856261', 2, 12, 3, 1, 30, 1, 'Américaine'),
('45002335', 'Markov', 'Walch', '2014-05-22', '2014-07-10', 3, 'M.walch@cpm.co.ma', '0258', 2, 13, 2, 1, 31, 2, 'Russe'),
('85577', 'RiouK', 'Tromudj', '2012-12-07', '2014-01-01', 2, 'R.tromudj@cpm.co.ma', '695802764', 1, 14, 1, 1, 33, 1, 'Belge'),
('1000', 'Hebert', 'Dolly Garcia', '1990-06-16', '2013-05-20', 3, 'H.dolly.garcia@cpm.co.ma', '+1 (806) 581-2456', 1, 15, 2, 1, 34, 3, 'Andorra'),
('1003', 'Douglas', 'Dena Duffy', '1980-11-06', '2014-04-20', 4, 'D.dena.duffy@cpm.co.ma', '+1 (815) 564-2040', 2, 16, 4, 1, 35, 3, 'Bermuda'),
('1022', 'Randall', 'Alice Tyson', '1984-11-12', '2013-08-17', 2, 'R.alice.tyson@cpm.co.ma', '+1 (884) 554-2141', 2, 17, 1, 1, 36, 3, 'Sao Tome and Principe'),
('1012', 'Olson', 'Ines King', '1984-09-17', '2013-01-16', 1, 'O.ines.king@cpm.co.ma', '+1 (846) 551-2102', 2, 18, 4, 1, 37, 2, 'Malawi'),
('1040', 'Harrington', 'Sims Osborn', '1984-06-23', '2013-06-10', 4, 'H.sims.osborn@cpm.co.ma', '+1 (971) 449-2023', 1, 19, 4, 1, 38, 2, 'Italy'),
('1045', 'Cleveland', 'Candy Adkins', '1983-06-16', '2014-05-31', 1, 'C.candy.adkins@cpm.co.ma', '+1 (837) 575-3847', 1, 20, 1, 1, 39, 3, 'Finland'),
('1066', 'Chandler', 'May Fuentes', '1986-03-05', '2014-07-02', 2, 'C.may.fuentes@cpm.co.ma', '+1 (850) 503-2944', 1, 21, 2, 1, 40, 3, 'Anguilla'),
('1028', 'Hicks', 'Alma Guy', '1981-10-27', '2013-02-28', 2, 'H.alma.guy@cpm.co.ma', '+1 (941) 465-2129', 1, 22, 4, 1, 41, 3, 'Gabon'),
('1064', 'Wooten', 'Bender Mullins', '1986-06-17', '2014-03-23', 3, 'W.bender.mullins@cpm.co.ma', '+1 (835) 481-2237', 1, 23, 1, 1, 42, 3, 'Iraq'),
('1027', 'Sanchez', 'Wallace Sanders', '1983-12-20', '2013-04-15', 1, 'S.wallace.sanders@cpm.co.ma', '+1 (920) 531-3465', 1, 24, 2, 1, 43, 3, 'Swaziland'),
('1060', 'Hogan', 'Shelia Sheppard', '1989-09-26', '2013-07-07', 2, 'H.shelia.sheppard@cpm.co.ma', '+1 (971) 526-3290', 1, 25, 4, 1, 44, 1, 'Marshall Islands'),
('1033', 'Gay', 'Cannon Gonzalez', '1980-03-08', '2013-12-08', 2, 'G.cannon.gonzalez@cpm.co.ma', '+1 (800) 551-3825', 1, 26, 4, 1, 45, 2, 'Luxembourg'),
('1132', 'Hubbard', 'Petra Tate', '1988-12-27', '2014-07-23', 4, 'H.petra.tate@cpm.co.ma', '+1 (997) 529-3741', 1, 27, 4, 1, 46, 3, 'Virgin Islands (British)'),
('1065', 'Rios', 'Eve Mathis', '1986-06-03', '2013-05-11', 3, 'R.eve.mathis@cpm.co.ma', '+1 (965) 460-3203', 2, 28, 3, 1, 47, 2, 'Falkland Islands (Malvinas)'),
('1140', 'Bradshaw', 'Kerry Macdonald', '1983-11-22', '2014-08-01', 4, 'B.kerry.macdonald@cpm.co.ma', '+1 (864) 548-2005', 2, 29, 2, 1, 48, 3, 'Belize'),
('1150', 'Logan', 'Maritza Cabrera', '1990-04-16', '2014-06-12', 4, 'L.maritza.cabrera@cpm.co.ma', '+1 (970) 525-3312', 2, 30, 1, 1, 49, 1, 'Ecuador'),
('1032', 'Ford', 'Palmer Guzman', '1983-02-06', '2014-06-23', 4, 'F.palmer.guzman@cpm.co.ma', '+1 (995) 480-3178', 1, 31, 2, 1, 50, 1, 'China'),
('1034', 'Holmes', 'Day Wynn', '1989-01-09', '2013-05-03', 4, 'H.day.wynn@cpm.co.ma', '+1 (802) 564-2117', 1, 32, 2, 1, 51, 2, 'Belarus'),
('1144', 'Shepard', 'Cole Phillips', '1983-02-06', '2013-04-10', 3, 'S.cole.phillips@cpm.co.ma', '+1 (891) 585-3641', 2, 33, 3, 1, 52, 2, 'Argentina'),
('1209', 'Lamb', 'Carey Stuart', '1990-04-04', '2013-01-06', 3, 'L.carey.stuart@cpm.co.ma', '+1 (877) 475-2235', 2, 34, 1, 1, 53, 2, 'United Arab Emirates'),
('1080', 'Butler', 'Perkins Emerson', '1985-04-17', '2013-02-19', 3, 'B.perkins.emerson@cpm.co.ma', '+1 (810) 466-3404', 1, 35, 3, 1, 54, 1, 'Switzerland'),
('1210', 'Baldwin', 'Salazar Brooks', '1980-12-19', '2014-05-01', 1, 'B.salazar.brooks@cpm.co.ma', '+1 (847) 537-3157', 1, 36, 4, 1, 55, 3, 'Denmark'),
('11320', 'Kirby', 'Mccarthy Gallegos', '1984-08-23', '2014-01-31', 4, 'K.mccarthy.gallegos@cpm.co.ma', '+1 (868) 452-2542', 2, 37, 1, 1, 57, 1, 'France'),
('1161', 'Rush', 'Agnes Allison', '1985-06-01', '2014-05-05', 2, 'R.agnes.allison@cpm.co.ma', '+1 (963) 512-2742', 1, 38, 2, 1, 58, 3, 'Samoa'),
('1072', 'Lambert', 'Leblanc Francis', '1985-08-04', '2013-11-02', 4, 'L.leblanc.francis@cpm.co.ma', '+1 (801) 575-3878', 1, 39, 2, 1, 59, 3, 'Afghanistan'),
('1175', 'Rosales', 'Sue Pruitt', '1983-12-08', '2013-03-19', 1, 'R.sue.pruitt@cpm.co.ma', '+1 (844) 435-3861', 2, 40, 3, 1, 60, 2, 'East Timor'),
('1156', 'Kramer', 'Leslie Cruz', '1984-04-29', '2014-01-29', 3, 'K.leslie.cruz@cpm.co.ma', '+1 (918) 501-3736', 1, 41, 2, 1, 61, 3, 'Peru'),
('1135', 'Wong', 'Millie Palmer', '1984-04-22', '2013-11-29', 4, 'W.millie.palmer@cpm.co.ma', '+1 (938) 531-2378', 1, 42, 2, 1, 62, 3, 'Sudan'),
('1112', 'Watkins', 'Bray Mcfarland', '1981-06-02', '2013-04-02', 1, 'W.bray.mcfarland@cpm.co.ma', '+1 (957) 461-2316', 2, 43, 3, 1, 63, 2, 'Bulgaria'),
('1174', 'Ayala', 'Brigitte Koch', '1985-07-03', '2014-03-04', 1, 'A.brigitte.koch@cpm.co.ma', '+1 (812) 518-3194', 1, 44, 1, 1, 64, 1, 'Panama'),
('2013', 'Brown', 'Alyce Henry', '1986-08-29', '2012-06-17', 3, 'B.alyce.henry@cpm.co.ma', '+1 (860) 412-2061', 2, 45, 1, 2, 65, 1, 'Chile'),
('2021', 'Ramos', 'Rosalyn Lawson', '1981-05-19', '2012-09-05', 3, 'R.rosalyn.lawson@cpm.co.ma', '+1 (947) 512-3825', 1, 46, 1, 2, 66, 1, 'Slovak Republic'),
('2017', 'Mullen', 'Kirsten Gross', '1987-02-06', '2012-02-15', 3, 'M.kirsten.gross@cpm.co.ma', '+1 (865) 448-2281', 2, 47, 1, 2, 67, 3, 'Nepal'),
('2031', 'Joyce', 'Blake Castro', '1980-05-21', '2012-08-03', 1, 'J.blake.castro@cpm.co.ma', '+1 (965) 435-3119', 1, 48, 4, 2, 68, 2, 'Zimbabwe'),
('2041', 'Cobb', 'Lula Burks', '1981-03-06', '2012-04-12', 4, 'C.lula.burks@cpm.co.ma', '+1 (971) 439-3937', 1, 49, 2, 2, 69, 2, 'El Salvador'),
('2028', 'Colon', 'Emma Rojas', '1980-07-21', '2012-10-12', 2, 'C.emma.rojas@cpm.co.ma', '+1 (880) 571-3535', 1, 50, 1, 2, 70, 2, 'Afghanistan'),
('2025', 'Cummings', 'Mccullough Carpenter', '1980-05-13', '2012-05-09', 1, 'C.mccullough.carpenter@cpm.co.ma', '+1 (988) 451-3034', 1, 51, 3, 2, 71, 3, 'Australia'),
('2076', 'Merritt', 'Cox Sheppard', '1986-04-10', '2012-12-11', 4, 'M.cox.sheppard@cpm.co.ma', '+1 (848) 587-3530', 2, 52, 2, 2, 72, 2, 'Gambia'),
('2061', 'Pittman', 'Paul Willis', '1981-03-29', '2012-06-19', 4, 'P.paul.willis@cpm.co.ma', '+1 (889) 468-2276', 2, 53, 1, 2, 73, 3, 'Mauritania'),
('2067', 'Hubbard', 'Juarez Grant', '1982-06-05', '2012-12-03', 4, 'H.juarez.grant@cpm.co.ma', '+1 (933) 446-3718', 1, 54, 1, 2, 74, 2, 'Tunisia'),
('2043', 'Simon', 'Workman Ball', '1983-03-18', '2012-03-05', 1, 'S.workman.ball@cpm.co.ma', '+1 (869) 445-3816', 1, 55, 1, 2, 75, 3, 'Uzbekistan'),
('2101', 'Greene', 'Rosa Mccarty', '1989-04-03', '2012-11-25', 3, 'G.rosa.mccarty@cpm.co.ma', '+1 (841) 472-2006', 2, 56, 4, 2, 76, 3, 'Spain'),
('2085', 'Acosta', 'Lana Raymond', '1988-11-28', '2012-11-06', 3, 'A.lana.raymond@cpm.co.ma', '+1 (957) 590-2291', 2, 57, 2, 2, 77, 3, 'Solomon Islands'),
('2104', 'Vaughn', 'Pugh Gaines', '1987-05-06', '2012-01-12', 4, 'V.pugh.gaines@cpm.co.ma', '+1 (899) 434-3392', 1, 58, 2, 2, 78, 1, 'Viet Nam'),
('2167', 'Cortez', 'Craft Porter', '1985-05-28', '2012-04-24', 1, 'C.craft.porter@cpm.co.ma', '+1 (854) 562-2986', 1, 59, 3, 2, 79, 3, 'Armenia'),
('2148', 'Fields', 'Esperanza Dunlap', '1981-10-18', '2012-09-09', 1, 'F.esperanza.dunlap@cpm.co.ma', '+1 (942) 420-3660', 2, 60, 2, 2, 80, 2, 'Peru'),
('2093', 'Munoz', 'Stacy Baxter', '1982-03-15', '2012-01-28', 2, 'M.stacy.baxter@cpm.co.ma', '+1 (938) 468-2096', 1, 61, 4, 2, 81, 1, 'Saudi Arabia'),
('2081', 'Jarvis', 'Schultz Clay', '1987-05-31', '2012-04-26', 4, 'J.schultz.clay@cpm.co.ma', '+1 (936) 567-3949', 2, 62, 4, 3, 82, 1, 'Cote D''Ivoire (Ivory Coast)'),
('2139', 'Molina', 'Rosanne Herrera', '1987-09-25', '2012-01-17', 1, 'M.rosanne.herrera@cpm.co.ma', '+1 (961) 521-2220', 1, 63, 1, 2, 83, 3, 'Romania'),
('2089', 'Hyde', 'Etta Figueroa', '1988-02-21', '2012-08-24', 1, 'H.etta.figueroa@cpm.co.ma', '+1 (824) 412-3389', 1, 64, 1, 2, 84, 2, 'Ghana'),
('2153', 'Carroll', 'Byers Nieves', '1986-10-17', '2012-04-01', 1, 'C.byers.nieves@cpm.co.ma', '+1 (904) 451-2151', 1, 65, 4, 2, 85, 2, 'Guyana'),
('2181', 'Abbott', 'Cobb Barrera', '1987-12-23', '2012-04-21', 1, 'A.cobb.barrera@cpm.co.ma', '+1 (854) 585-2916', 1, 66, 1, 2, 86, 3, 'Guinea-Bissau'),
('201300', 'Mueller', 'Roslyn Lee', '1983-08-08', '2012-12-10', 4, 'M.roslyn.lee@cpm.co.ma', '+1 (907) 600-3553', 2, 67, 1, 2, 88, 3, 'Dominican Republic'),
('2174', 'Benjamin', 'Jane Horn', '1982-01-04', '2012-04-09', 1, 'B.jane.horn@cpm.co.ma', '+1 (956) 556-3505', 1, 68, 4, 2, 89, 1, 'Italy'),
('2013001', 'Buchanan', 'Luna Sharpe', '1986-08-05', '2012-07-22', 1, 'B.luna.sharpe@cpm.co.ma', '+1 (870) 444-2889', 1, 69, 2, 2, 90, 2, 'Congo'),
('201200', 'Hayden', 'Rae Harrington', '1980-12-20', '2011-11-07', 3, 'H.rae.harrington@cpm.co.ma', '+1 (888) 568-2714', 1, 70, 4, 3, 91, 2, 'Azerbaijan'),
('201206', 'Pratt', 'Guthrie Montoya', '1986-11-21', '2011-12-12', 4, 'P.guthrie.montoya@cpm.co.ma', '+1 (941) 424-2503', 2, 71, 1, 3, 92, 1, 'Afghanistan'),
('201222', 'Guthrie', 'Dina Farley', '1986-02-11', '2011-12-04', 4, 'G.dina.farley@cpm.co.ma', '+1 (940) 463-2568', 1, 72, 3, 3, 93, 2, 'Malawi'),
('201227', 'Lambert', 'Kirby Madden', '1980-09-02', '2011-10-02', 4, 'L.kirby.madden@cpm.co.ma', '+1 (948) 527-2622', 2, 73, 1, 3, 94, 3, 'Saint Lucia'),
('201244', 'Odonnell', 'April Koch', '1983-08-06', '2011-11-03', 2, 'O.april.koch@cpm.co.ma', '+1 (896) 490-3951', 1, 74, 2, 3, 95, 1, 'India'),
('201240', 'Gallagher', 'Lori Ferrell', '1988-07-07', '2011-10-28', 2, 'G.lori.ferrell@cpm.co.ma', '+1 (948) 499-2318', 2, 75, 3, 3, 96, 2, 'Nigeria'),
('201248', 'Gill', 'Melinda Holman', '1988-11-11', '2011-10-11', 1, 'G.melinda.holman@cpm.co.ma', '+1 (861) 410-3322', 2, 76, 4, 3, 97, 1, 'Guinea'),
('201263', 'Mendez', 'Glenn Wilkins', '1985-08-04', '2011-11-23', 4, 'M.glenn.wilkins@cpm.co.ma', '+1 (919) 585-2522', 2, 77, 2, 3, 98, 1, 'Moldova'),
('20124008', 'Hamilton', 'Rollins Moody', '1983-06-07', '2011-10-19', 2, 'H.rollins.moody@cpm.co.ma', '+1 (960) 492-3350', 2, 78, 2, 3, 100, 2, 'Austria'),
('201281', 'Holland', 'Watts Blankenship', '1987-07-18', '2011-11-26', 3, 'H.watts.blankenship@cpm.co.ma', '+1 (850) 462-2507', 1, 79, 3, 3, 101, 1, 'Senegal'),
('201200147', 'Dudley', 'Francine Johns', '1980-06-21', '2011-10-08', 4, 'D.francine.johns@cpm.co.ma', '+1 (847) 568-3881', 1, 80, 1, 3, 102, 1, 'Denmark'),
('201277', 'Alston', 'Jerri Curry', '1981-02-13', '2011-11-11', 4, 'A.jerri.curry@cpm.co.ma', '+1 (814) 448-2156', 1, 81, 1, 3, 103, 1, 'Faroe Islands'),
('201284', 'Christensen', 'Frankie Cameron', '1981-07-14', '2011-10-01', 2, 'C.frankie.cameron@cpm.co.ma', '+1 (984) 476-3558', 2, 82, 3, 3, 104, 1, 'Lithuania'),
('201291', 'Gross', 'Elnora Adkins', '1982-03-12', '2011-12-12', 3, 'G.elnora.adkins@cpm.co.ma', '+1 (868) 555-2868', 2, 83, 3, 3, 105, 2, 'Falkland Islands (Malvinas)'),
('201354', 'Hernandez', 'Patti Duke', '1981-01-13', '2011-11-20', 1, 'H.patti.duke@cpm.co.ma', '+1 (822) 458-3286', 2, 84, 3, 3, 106, 3, 'Svalbard and Jan Mayen Islands'),
('201275', 'Garza', 'Knowles Owens', '1988-12-10', '2011-10-18', 2, 'G.knowles.owens@cpm.co.ma', '+1 (846) 552-3396', 2, 85, 4, 3, 107, 1, 'Jordan'),
('201312', 'Wilcox', 'Preston Jordan', '1982-10-07', '2011-12-17', 2, 'W.preston.jordan@cpm.co.ma', '+1 (801) 499-2820', 1, 86, 4, 3, 108, 1, 'Italy'),
('201285', 'Preston', 'Long Nieves', '1985-10-31', '2011-11-15', 3, 'P.long.nieves@cpm.co.ma', '+1 (844) 452-3171', 1, 87, 2, 3, 109, 2, 'St. Helena'),
('201308', 'Contreras', 'Cook Burch', '1985-11-22', '2011-12-10', 1, 'C.cook.burch@cpm.co.ma', '+1 (848) 537-2823', 2, 88, 1, 3, 110, 2, 'Albania'),
('201333', 'Sweeney', 'Keith Trevino', '1980-12-26', '2011-12-19', 2, 'S.keith.trevino@cpm.co.ma', '+1 (925) 546-2603', 2, 89, 1, 3, 111, 2, 'Tonga');

-- --------------------------------------------------------

--
-- Structure de la table `recruesession`
--

CREATE TABLE IF NOT EXISTS `recruesession` (
  `recruesessionId` int(11) NOT NULL auto_increment,
  `recrue` int(11) NOT NULL,
  `session` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY  (`recruesessionId`),
  KEY `recrue` (`recrue`,`session`),
  KEY `session` (`session`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `regrouper`
--

CREATE TABLE IF NOT EXISTS `regrouper` (
  `domaineID` int(11) default NULL,
  `cursusID` int(11) default NULL,
  KEY `Cursus` (`cursusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `rencontre`
--

CREATE TABLE IF NOT EXISTS `rencontre` (
  `rencontreID` int(11) NOT NULL,
  `typeRencontreID` int(11) default NULL,
  PRIMARY KEY  (`rencontreID`),
  KEY `FK_Rencontre_TypeRencontre` (`typeRencontreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `rencontre`
--

INSERT INTO `rencontre` (`rencontreID`, `typeRencontreID`) VALUES
(9, 1),
(13, 2),
(12, 3);

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

CREATE TABLE IF NOT EXISTS `reponse` (
  `dateReponse` date default NULL,
  `reponseID` int(11) NOT NULL auto_increment,
  `questionnaireID` int(11) default NULL,
  `recrueID` int(11) default NULL,
  PRIMARY KEY  (`reponseID`),
  KEY `FK_Reponse_Questionnaire` (`questionnaireID`),
  KEY `FK_Reponse_Recrue` (`recrueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Contenu de la table `reponse`
--

INSERT INTO `reponse` (`dateReponse`, `reponseID`, `questionnaireID`, `recrueID`) VALUES
('2014-07-22', 2, 6, 5),
('2014-07-22', 3, 5, 9),
('2014-07-28', 4, 7, 4),
('2014-07-28', 5, 7, 8),
('2014-07-28', 6, 8, 4),
('2014-07-31', 7, 6, 7),
('2014-08-05', 8, 7, 7),
('2014-08-05', 9, 8, 7),
('2014-08-05', 10, 5, 7),
('2014-08-13', 11, 8, 9),
('2014-08-15', 12, 7, 9);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `code` varchar(255) default NULL,
  `nom` varchar(255) default NULL,
  `roleID` int(11) NOT NULL auto_increment,
  `detail` varchar(250) NOT NULL,
  PRIMARY KEY  (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `role`
--

INSERT INTO `role` (`code`, `nom`, `roleID`, `detail`) VALUES
('RA', 'ROLE_ADMIN', 1, 'Administrateur'),
('RR', 'ROLE_RECRUE', 3, 'Recrue'),
('RRR', 'ROLE_RESRECRUT', 4, 'Responsable de recrutement'),
('RRI', 'ROLE_RESINTE', 5, 'Responsable d''intégration');

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `dateDeDebut` date default NULL,
  `dateDeFin` date default NULL,
  `lieu` varchar(255) default NULL,
  `animateur` varchar(255) default NULL,
  `sessionID` int(11) NOT NULL auto_increment,
  `planningID` int(11) NOT NULL,
  `etat` tinyint(1) NOT NULL,
  PRIMARY KEY  (`sessionID`),
  KEY `FK_Session_Evenement` (`planningID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=144 ;

--
-- Contenu de la table `session`
--

INSERT INTO `session` (`dateDeDebut`, `dateDeFin`, `lieu`, `animateur`, `sessionID`, `planningID`, `etat`) VALUES
('2013-01-07', '2013-01-25', 'Centre de formation', 'inconnu', 17, 14, 0),
('2013-02-04', '2013-02-28', 'Centre de formation', 'M. riouk', 18, 14, 0),
('2013-04-01', '2013-06-28', 'Rabat centre de formation', 'M Diallo, M Ali, Mme Sandrine', 19, 14, 0),
('2013-07-01', '2013-09-26', 'Centre de formation', 'inconnu', 20, 14, 0),
('2013-11-04', '2013-12-27', 'casa twin center 40e', 'Inconnu', 21, 14, 0),
('2013-02-04', '2013-04-26', 'Centre de formation', '*', 22, 15, 0),
('2013-05-06', '2013-06-28', 'Centre de formation', '*', 23, 15, 0),
('2013-07-01', '2013-07-31', 'Centre de formation', '*', 24, 15, 0),
('2013-08-01', '2013-08-22', 'Centre de formation', '*', 25, 15, 0),
('2013-07-01', '2013-08-31', 'Centre de formation', '*', 26, 16, 0),
('2013-09-02', '2013-09-27', 'Centre de formation', '*', 27, 16, 0),
('2013-10-01', '2013-10-25', 'Centre de formation', '*', 28, 16, 0),
('2013-11-01', '2013-11-29', 'Centre de formation', '*', 29, 16, 0),
('2013-01-01', '2013-03-01', 'Centre de formation', '*', 30, 17, 0),
('2013-03-04', '2013-06-01', 'Centre de formation', '*', 31, 17, 0),
('2013-06-03', '2013-08-01', 'Centre de formation', '*', 32, 17, 0),
('2013-08-05', '2013-10-31', 'Centre de formation', '*', 33, 17, 0),
('2013-01-01', '2013-02-22', 'Centre de formation', '*', 34, 18, 0),
('2013-03-04', '2013-05-31', 'cnf', '*', 35, 18, 0),
('2013-06-03', '2013-06-28', 'Centre de formation', '*', 36, 18, 0),
('2013-07-01', '2013-07-31', 'cnf', '*', 37, 19, 0),
('2013-08-05', '2013-09-27', 'cnf', '*', 38, 19, 0),
('2013-01-01', '2013-06-21', 'Centre de formation', '*', 39, 20, 0),
('2013-01-01', '2013-07-31', 'Centre de formation', 'M ali moud', 40, 21, 0),
('2013-07-01', '2013-08-30', 'Rabat', 'M Raoul m.', 41, 22, 0),
('2013-01-01', '2013-06-28', 'Centre de formation', '*', 42, 23, 0),
('2013-01-01', '2013-04-25', 'Centre de formation', '*', 43, 24, 0),
('2013-07-01', '2013-09-27', 'Centre de formation', '*', 44, 25, 0),
('2013-01-01', '2013-07-31', 'Centre de formation', '*', 45, 26, 0),
('2013-01-01', '2013-06-28', 'Centre de formation', '*', 46, 27, 0),
('2013-06-24', '2013-06-24', 'Siège', 'Directeur', 47, 9, 0),
('2013-02-07', '2013-02-07', 'Siège Zektouni', '*', 48, 28, 0),
('2013-05-01', '2013-05-01', 'Centre de formation', 'RH', 49, 29, 0),
('2013-06-26', '2013-06-26', 'Centre de formation', '*', 50, 30, 0),
('2013-04-04', '2013-04-04', 'cnf', '*', 51, 31, 0),
('2013-02-04', '2013-02-04', 'siège anfa', '*', 52, 32, 0),
('2013-03-11', '2013-03-11', 'Centre de formation', '*', 53, 33, 0),
('2013-07-01', '2013-07-01', 'cnf', '*', 54, 34, 0),
('2013-08-05', '2013-08-05', 'Centre de formation', '*', 55, 35, 0),
('2013-01-01', '2013-04-25', 'Centre de formation', '*', 56, 36, 0),
('2013-01-01', '2013-04-26', 'Centre de formation', '*', 57, 37, 0),
('2013-01-01', '2013-02-28', 'Centre de formation', '*', 58, 38, 0),
('2014-01-07', '2014-01-25', 'Centre de formation', 'inconnu', 59, 40, 0),
('2014-02-04', '2014-02-28', 'Centre de formation', 'M. riouk', 60, 40, 0),
('2014-04-01', '2014-06-28', 'Rabat centre de formation', 'M Diallo, M Ali, Mme Sandrine', 61, 40, 0),
('2014-07-01', '2014-09-26', 'Centre de formation', 'inconnu', 62, 40, 0),
('2014-11-04', '2014-12-27', 'casa twin center 40e', 'Inconnu', 63, 40, 0),
('2014-02-04', '2014-04-26', 'Centre de formation', '*', 64, 41, 0),
('2014-05-06', '2014-06-28', 'Centre de formation', '*', 65, 41, 0),
('2014-07-01', '2014-07-31', 'Centre de formation', '*', 66, 41, 0),
('2014-08-01', '2014-08-22', 'Centre de formation', '*', 67, 41, 0),
('2014-07-01', '2014-08-31', 'Centre de formation', '*', 68, 42, 0),
('2014-09-02', '2014-09-27', 'Centre de formation', '*', 69, 42, 0),
('2014-10-01', '2014-10-25', 'Centre de formation', '*', 70, 42, 0),
('2014-11-01', '2014-11-29', 'Centre de formation', '*', 71, 42, 0),
('2014-01-01', '2014-03-01', 'Centre de formation', '*', 72, 43, 0),
('2014-03-04', '2014-06-01', 'Centre de formation', '*', 73, 43, 0),
('2014-06-03', '2014-08-01', 'Centre de formation', '*', 74, 43, 0),
('2014-08-05', '2014-10-31', 'Centre de formation', '*', 75, 43, 0),
('2014-01-01', '2014-02-22', 'Centre de formation', '*', 76, 44, 0),
('2014-03-04', '2014-05-31', 'cnf', '*', 77, 44, 0),
('2014-06-03', '2014-06-28', 'Centre de formation', '*', 78, 44, 0),
('2014-07-01', '2014-07-31', 'cnf', '*', 79, 45, 0),
('2014-08-05', '2014-09-27', 'cnf', '*', 80, 45, 0),
('2014-01-01', '2014-06-21', 'Centre de formation', '*', 81, 46, 0),
('2014-01-01', '2014-07-31', 'Centre de formation', 'M ali moud', 82, 47, 0),
('2014-07-01', '2014-08-30', 'Rabat', 'M Raoul m.', 83, 48, 0),
('2014-01-01', '2014-06-28', 'Centre de formation', '*', 84, 49, 0),
('2014-01-01', '2014-04-25', 'Centre de formation', '*', 85, 50, 0),
('2014-07-01', '2014-09-27', 'Centre de formation', '*', 86, 51, 0),
('2014-01-01', '2014-07-31', 'Centre de formation', '*', 87, 52, 0),
('2014-01-01', '2014-06-28', 'Centre de formation', '*', 88, 53, 0),
('2014-06-24', '2014-06-24', 'Siège', 'Directeur', 89, 39, 0),
('2014-02-07', '2014-02-07', 'Siège Zektouni', '*', 90, 54, 0),
('2014-05-01', '2014-05-01', 'Centre de formation', 'RH', 91, 54, 0),
('2014-06-26', '2014-06-26', 'Centre de formation', '*', 92, 56, 0),
('2014-04-04', '2014-04-04', 'cnf', '*', 93, 57, 0),
('2014-02-04', '2014-02-04', 'siège anfa', '*', 94, 58, 0),
('2014-03-11', '2014-03-11', 'Centre de formation', '*', 95, 59, 0),
('2014-07-01', '2014-07-01', 'cnf', '*', 96, 60, 0),
('2014-08-05', '2014-08-05', 'Centre de formation', '*', 97, 61, 0),
('2014-01-01', '2014-04-25', 'Centre de formation', '*', 98, 62, 0),
('2014-01-01', '2014-04-26', 'Centre de formation', '*', 99, 63, 0),
('2014-01-01', '2014-02-28', 'Centre de formation', '*', 100, 64, 0),
('2012-01-07', '2012-01-25', 'Centre de formation', 'inconnu', 101, 66, 0),
('2012-02-04', '2012-02-28', 'Centre de formation', 'M. riouk', 102, 66, 0),
('2012-04-01', '2012-06-28', 'Rabat centre de formation', 'M Diallo, M Ali, Mme Sandrine', 103, 66, 0),
('2012-07-01', '2012-09-26', 'Centre de formation', 'inconnu', 104, 66, 0),
('2012-11-04', '2012-12-27', 'casa twin center 40e', 'Inconnu', 105, 66, 0),
('2012-02-04', '2012-04-26', 'Centre de formation', '*', 106, 67, 0),
('2012-05-06', '2012-06-28', 'Centre de formation', '*', 107, 67, 0),
('2012-07-01', '2012-07-31', 'Centre de formation', '*', 108, 67, 0),
('2012-08-01', '2012-08-22', 'Centre de formation', '*', 109, 67, 0),
('2012-07-01', '2012-08-31', 'Centre de formation', '*', 110, 68, 0),
('2012-09-02', '2012-09-27', 'Centre de formation', '*', 111, 68, 0),
('2012-10-01', '2012-10-25', 'Centre de formation', '*', 112, 68, 0),
('2012-11-01', '2012-11-29', 'Centre de formation', '*', 113, 68, 0),
('2012-01-01', '2012-03-01', 'Centre de formation', '*', 114, 69, 0),
('2012-03-04', '2012-06-01', 'Centre de formation', '*', 115, 69, 0),
('2012-06-03', '2012-08-01', 'Centre de formation', '*', 116, 69, 0),
('2012-08-05', '2012-10-31', 'Centre de formation', '*', 117, 69, 0),
('2012-01-01', '2012-02-22', 'Centre de formation', '*', 118, 70, 0),
('2012-03-04', '2012-05-31', 'cnf', '*', 119, 70, 0),
('2012-06-03', '2012-06-28', 'Centre de formation', '*', 120, 70, 0),
('2012-07-01', '2012-07-31', 'cnf', '*', 121, 71, 0),
('2012-08-05', '2012-09-27', 'cnf', '*', 122, 71, 0),
('2012-01-01', '2012-06-21', 'Centre de formation', '*', 123, 72, 0),
('2012-01-01', '2012-07-31', 'Centre de formation', 'M ali moud', 124, 73, 0),
('2012-07-01', '2012-08-30', 'Rabat', 'M Raoul m.', 125, 74, 0),
('2012-01-01', '2012-06-28', 'Centre de formation', '*', 126, 75, 0),
('2012-01-01', '2012-04-25', 'Centre de formation', '*', 127, 76, 0),
('2012-07-01', '2012-09-27', 'Centre de formation', '*', 128, 77, 0),
('2012-01-01', '2012-07-31', 'Centre de formation', '*', 129, 78, 0),
('2012-01-01', '2012-06-28', 'Centre de formation', '*', 130, 79, 0),
('2012-06-24', '2012-06-24', 'Siège', 'Directeur', 131, 65, 0),
('2012-02-07', '2012-02-07', 'Siège Zektouni', '*', 132, 80, 0),
('2012-05-01', '2012-05-01', 'Centre de formation', 'RH', 133, 81, 0),
('2012-06-26', '2012-06-26', 'Centre de formation', '*', 134, 82, 0),
('2012-04-04', '2012-04-04', 'cnf', '*', 135, 83, 0),
('2012-02-04', '2012-02-04', 'siège anfa', '*', 136, 84, 0),
('2012-03-11', '2012-03-11', 'Centre de formation', '*', 137, 85, 0),
('2012-07-01', '2012-07-01', 'cnf', '*', 138, 86, 0),
('2012-08-05', '2012-08-05', 'Centre de formation', '*', 139, 87, 0),
('2012-01-01', '2012-04-25', 'Centre de formation', '*', 140, 88, 0),
('2012-01-01', '2012-04-26', 'Centre de formation', '*', 141, 89, 0),
('2012-01-01', '2012-02-28', 'Centre de formation', '*', 142, 90, 0),
('2014-05-01', '2014-05-01', 'centre', '', 143, 55, 0);

-- --------------------------------------------------------

--
-- Structure de la table `succursale`
--

CREATE TABLE IF NOT EXISTS `succursale` (
  `nom` varchar(255) default NULL,
  `codeSuccursale` varchar(255) default NULL,
  `codeBanque` varchar(255) default NULL,
  `succursaleID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`succursaleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- Contenu de la table `succursale`
--

INSERT INTO `succursale` (`nom`, `codeSuccursale`, `codeBanque`, `succursaleID`) VALUES
('ABDELMOUMEN', 'D2345254', 'BU893U3873234', 1),
('AIN CHOCK', 'AE234', '00I8', 2),
('AIN SEBAA', 'AO9234', '0023I8', 3),
('BEAUSEJOUR', '0°UI', 'O30J', 36),
('DERB SOLTAN', 'S09121', 'VR892', 37),
('MABROUKA', 'S091223', 'VR89A23', 38),
('MOHAMMEDIA', 'S0912', 'VR89', 39),
('SIDI BELYOUT', 'S09127', 'VR1289', 40);

-- --------------------------------------------------------

--
-- Structure de la table `typecoaching`
--

CREATE TABLE IF NOT EXISTS `typecoaching` (
  `nom` varchar(255) default NULL,
  `typeCoachingID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`typeCoachingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `typecoaching`
--

INSERT INTO `typecoaching` (`nom`, `typeCoachingID`) VALUES
('Image Personnelle', 1),
('Communication et langage', 3),
('Posture Commerciale', 4);

-- --------------------------------------------------------

--
-- Structure de la table `typerencontre`
--

CREATE TABLE IF NOT EXISTS `typerencontre` (
  `nom` varchar(255) default NULL,
  `typeRencontreID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`typeRencontreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `typerencontre`
--

INSERT INTO `typerencontre` (`nom`, `typeRencontreID`) VALUES
('Rencontre RH', 1),
('Rencontre Présidence', 2),
('Rencontre RDC', 3);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `agence`
--
ALTER TABLE `agence`
  ADD CONSTRAINT `appartenir` FOREIGN KEY (`succursaleID`) REFERENCES `succursale` (`succursaleID`);

--
-- Contraintes pour la table `assessmentcenter`
--
ALTER TABLE `assessmentcenter`
  ADD CONSTRAINT `FK_AssessmentCenter_Evenement` FOREIGN KEY (`assessmentCenterID`) REFERENCES `evenement` (`evenementID`);

--
-- Contraintes pour la table `categorieposte`
--
ALTER TABLE `categorieposte`
  ADD CONSTRAINT `categorieposte_ibfk_1` FOREIGN KEY (`poste`) REFERENCES `poste` (`posteID`),
  ADD CONSTRAINT `categorieposte_ibfk_2` FOREIGN KEY (`categorie`) REFERENCES `categorie` (`categorieID`);

--
-- Contraintes pour la table `champquestionnaire`
--
ALTER TABLE `champquestionnaire`
  ADD CONSTRAINT `champquestionnaire_ibfk_1` FOREIGN KEY (`questionnaireID`) REFERENCES `questionnaire` (`questionnaireID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `champreponse`
--
ALTER TABLE `champreponse`
  ADD CONSTRAINT `champreponse_ibfk_1` FOREIGN KEY (`champQuestionnaireID`) REFERENCES `champquestionnaire` (`champQuestionnaireID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `champreponse_ibfk_4` FOREIGN KEY (`reponseID`) REFERENCES `reponse` (`reponseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `coaching`
--
ALTER TABLE `coaching`
  ADD CONSTRAINT `FK_Coaching_Evenement` FOREIGN KEY (`coachingID`) REFERENCES `evenement` (`evenementID`),
  ADD CONSTRAINT `FK_Coaching_TypeCoaching` FOREIGN KEY (`typeCoachingID`) REFERENCES `typecoaching` (`typeCoachingID`);

--
-- Contraintes pour la table `competencedoamaine`
--
ALTER TABLE `competencedoamaine`
  ADD CONSTRAINT `Competence` FOREIGN KEY (`competenceID`) REFERENCES `competence` (`competenceID`),
  ADD CONSTRAINT `Domaine` FOREIGN KEY (`domaineID`) REFERENCES `domaine` (`domaineID`);

--
-- Contraintes pour la table `connected`
--
ALTER TABLE `connected`
  ADD CONSTRAINT `connected_ibfk_1` FOREIGN KEY (`compteId`) REFERENCES `compteutilisateur` (`compteUtilisateurID`),
  ADD CONSTRAINT `connected_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleID`);

--
-- Contraintes pour la table `convoquer`
--
ALTER TABLE `convoquer`
  ADD CONSTRAINT `convoquer_ibfk_1` FOREIGN KEY (`recrueID`) REFERENCES `recrue` (`recrueID`),
  ADD CONSTRAINT `convoquer_ibfk_2` FOREIGN KEY (`convocationID`) REFERENCES `convocation` (`convocationID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `cursus`
--
ALTER TABLE `cursus`
  ADD CONSTRAINT `FK_Cursus_Evenement` FOREIGN KEY (`cursusID`) REFERENCES `evenement` (`evenementID`);

--
-- Contraintes pour la table `destiner`
--
ALTER TABLE `destiner`
  ADD CONSTRAINT `destiner_ibfk_1` FOREIGN KEY (`recrueID`) REFERENCES `recrue` (`recrueID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `destiner_ibfk_2` FOREIGN KEY (`questionnaireID`) REFERENCES `questionnaire` (`questionnaireID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `detailsevenementsuivi`
--
ALTER TABLE `detailsevenementsuivi`
  ADD CONSTRAINT `detailsevenementsuivi_ibfk_2` FOREIGN KEY (`recrue`) REFERENCES `parcours` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detailsevenementsuivi_ibfk_3` FOREIGN KEY (`realiserID`) REFERENCES `realiser` (`realiserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `detailsrencontres`
--
ALTER TABLE `detailsrencontres`
  ADD CONSTRAINT `detailsrencontres_ibfk_2` FOREIGN KEY (`sessionID`) REFERENCES `session` (`sessionID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `entretien`
--
ALTER TABLE `entretien`
  ADD CONSTRAINT `FK_Entretien_Evenement` FOREIGN KEY (`entretienID`) REFERENCES `evenement` (`evenementID`);

--
-- Contraintes pour la table `listereponse`
--
ALTER TABLE `listereponse`
  ADD CONSTRAINT `listereponse_ibfk_1` FOREIGN KEY (`champquestionnaire`) REFERENCES `champquestionnaire` (`champQuestionnaireID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `membredfr`
--
ALTER TABLE `membredfr`
  ADD CONSTRAINT `FK_MembreDFR_CompteUtilisateur` FOREIGN KEY (`compteUtilisateurID`) REFERENCES `compteutilisateur` (`compteUtilisateurID`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`emis`) REFERENCES `compteutilisateur` (`compteUtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`recu`) REFERENCES `compteutilisateur` (`compteUtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `parcours`
--
ALTER TABLE `parcours`
  ADD CONSTRAINT `parcours_ibfk_2` FOREIGN KEY (`recrue`) REFERENCES `recrue` (`recrueID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `parcours_ibfk_3` FOREIGN KEY (`promocateposteID`) REFERENCES `promocateposte` (`promocateposteID`);

--
-- Contraintes pour la table `planning`
--
ALTER TABLE `planning`
  ADD CONSTRAINT `planning_ibfk_2` FOREIGN KEY (`realiserID`) REFERENCES `realiser` (`realiserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `posseder`
--
ALTER TABLE `posseder`
  ADD CONSTRAINT `posseder_ibfk_1` FOREIGN KEY (`roleID`) REFERENCES `role` (`roleID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posseder_ibfk_2` FOREIGN KEY (`compteUtilisateurID`) REFERENCES `compteutilisateur` (`compteUtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `promocateposte`
--
ALTER TABLE `promocateposte`
  ADD CONSTRAINT `promocateposte_ibfk_1` FOREIGN KEY (`categorieposteID`) REFERENCES `categorieposte` (`id`),
  ADD CONSTRAINT `promocateposte_ibfk_3` FOREIGN KEY (`promotionID`) REFERENCES `promotion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `realiser`
--
ALTER TABLE `realiser`
  ADD CONSTRAINT `realiser_ibfk_3` FOREIGN KEY (`evenementID`) REFERENCES `evenement` (`evenementID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `realiser_ibfk_4` FOREIGN KEY (`categorieposte`) REFERENCES `categorieposte` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `recrue`
--
ALTER TABLE `recrue`
  ADD CONSTRAINT `affecter` FOREIGN KEY (`agenceID`) REFERENCES `agence` (`agenceID`),
  ADD CONSTRAINT `occuper` FOREIGN KEY (`posteID`) REFERENCES `poste` (`posteID`),
  ADD CONSTRAINT `recrue_ibfk_1` FOREIGN KEY (`niveau`) REFERENCES `niveau` (`niveauID`),
  ADD CONSTRAINT `recrue_ibfk_2` FOREIGN KEY (`categorie`) REFERENCES `categorie` (`categorieID`),
  ADD CONSTRAINT `recrue_ibfk_3` FOREIGN KEY (`compteUtilisateurID`) REFERENCES `compteutilisateur` (`compteUtilisateurID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `recruesession`
--
ALTER TABLE `recruesession`
  ADD CONSTRAINT `recruesession_ibfk_1` FOREIGN KEY (`recrue`) REFERENCES `recrue` (`recrueID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recruesession_ibfk_2` FOREIGN KEY (`session`) REFERENCES `session` (`sessionID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `regrouper`
--
ALTER TABLE `regrouper`
  ADD CONSTRAINT `Cursus` FOREIGN KEY (`cursusID`) REFERENCES `cursus` (`cursusID`);

--
-- Contraintes pour la table `rencontre`
--
ALTER TABLE `rencontre`
  ADD CONSTRAINT `FK_Rencontre_Evenement` FOREIGN KEY (`rencontreID`) REFERENCES `evenement` (`evenementID`),
  ADD CONSTRAINT `FK_Rencontre_TypeRencontre` FOREIGN KEY (`typeRencontreID`) REFERENCES `typerencontre` (`typeRencontreID`);

--
-- Contraintes pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD CONSTRAINT `reponse_ibfk_1` FOREIGN KEY (`questionnaireID`) REFERENCES `questionnaire` (`questionnaireID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reponse_ibfk_2` FOREIGN KEY (`recrueID`) REFERENCES `recrue` (`recrueID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_2` FOREIGN KEY (`planningID`) REFERENCES `planning` (`planningID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
