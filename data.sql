-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  Dim 27 déc. 2020 à 10:29
-- Version du serveur :  10.4.8-MariaDB
-- Version de PHP :  7.3.10


use projetbi2;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projetbi2`
--

-- --------------------------------------------------------

--
-- Structure de la table `agent`
--

CREATE TABLE `agent` (
  `codeAgent` int(11) NOT NULL,
  `nomAgent` varchar(20) NOT NULL,
  `prenomAgent` varchar(20) NOT NULL,
  `teleAgent` int(10) NOT NULL,
  `situation` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- Index pour la table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`codeAgent`);

--
-- Déchargement des données de la table `agent`
--

INSERT INTO `agent` (`codeAgent`, `nomAgent`, `prenomAgent`, `teleAgent`, `situation`) VALUES
(1, 'HAMADOU', 'AOUDI', 678126762, 'agent'),
(2, 'NDZONO', 'MICHEL', 678342522, 'employe'),
(3, 'OBOUNOU', 'JEAN PIERRE', 698649823, 'agent'),
(4, 'MOHAMED', 'BABA', 689428734, 'employe'),
(5, 'MAMADOU ', 'BOUCKAR', 687236472, 'employe'),
(6, 'ZAID', 'MuHA', 678126762, 'agent'),
(7, 'Nassim', 'Karim', 678342522, 'employe'),
(8, 'Hamza', 'Ait Salhi', 629383, 'agent'),
(9, 'Mohamed', 'Agouray', 689428734, 'employe'),
(10, 'Yassine ', 'Kassimi', 687236472, 'employe'),
(11, 'Omar', 'Bartal', 687236472, 'agent'),
(12, 'Youssef ', 'Kassimi', 687236472, 'employe'),
(13, 'Sofiane ', 'Zeddou', 687236472, 'agent'),
(14, 'zakaria', 'BOUCKAR', 687236472, 'employe'),
(15, 'Karim ', 'Ait Bamouha', 687236472, 'employe'),
(16, 'Rabbie ', 'Ouhadda', 687236472, 'agent'),
(17, 'Hassnae ', 'Olmo', 687236472, 'employe'),
(18, 'Sabrine ', 'Yakouti', 687236472, 'employe');

-- --------------------------------------------------------

--
-- Structure de la table `bien`
--

CREATE TABLE `bien` (
  `codeBien` int(11) NOT NULL,
  `libelleBien` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- Index pour la table `bien`
--
ALTER TABLE `bien`
  ADD PRIMARY KEY (`codeBien`);

--
-- Déchargement des données de la table `bien`
--

INSERT INTO `bien` (`codeBien`, `libelleBien`) VALUES
(1, 'Premier véhicule'),
(2, 'Deuxième véhicule'),
(3, 'Deuxième véhicule'),
(4, 'Résidence secondaire'),
(5, 'Résidence secondaire'),
(6, 'Responsabilité civile conjoint');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `codeClient` varchar(10) NOT NULL,
  `nomClient` varchar(20) NOT NULL,
  `prenomClient` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`codeClient`);

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`codeClient`, `nomClient`, `prenomClient`) VALUES
('ALFKI', 'Alfreds', 'Futterkiste'),
('ANATR', 'Berglunds', 'snabbköp'),
('ANTARA', 'antara', 'Snogui'),
('ANTON', 'Bottom-Dollar', 'Markets'),
('AROUT', 'Comércio', 'Mineiro'),
('AYA', 'Aya', 'Elhadrti'),
('BERGS', 'Eastern', 'Connection'),
('BLAUS', 'Drachenblut', 'Delikatessen'),
('Hamid', 'Hamid', 'Karazay'),
('ILYY', 'Ilyass', 'Chentof'),
('OUSS', 'OUSSAMA', 'Outsa'),
('YOUSS', 'Youssera', 'Hourra');

-- --------------------------------------------------------

--
-- Structure de la table `date`
--

CREATE TABLE `date` (
  `date` date NOT NULL,
  `libelleMois` varchar(10) NOT NULL,
  `libelleAnnee` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
ALTER TABLE `date`
  ADD PRIMARY KEY (`date`);

--
-- Déchargement des données de la table `date`
--

INSERT INTO `date` (`date`, `libelleMois`, `libelleAnnee`) VALUES
('2019-07-17', '7', '2019'),
('2019-08-06', '8', '2019'),
('2019-09-04', '9', '2019'),
('2019-10-15', '10', '2019'),
('2019-11-09', '11', '2019'),
('2020-01-12', '1', '2020'),
('2020-01-15', '1', '2020'),
('2020-02-05', '2', '2020'),
('2020-02-12', '2', '2020'),
('2020-02-13', '2', '2020'),
('2020-02-19', '2', '2020'),
('2020-03-18', '3', '2020'),
('2020-03-20', '3', '2020'),
('2020-03-28', '3', '2020'),
('2020-04-07', '4', '2020'),
('2020-04-14', '4', '2020'),
('2020-04-15', '4', '2020'),
('2020-04-21', '4', '2020'),
('2020-05-03', '5', '2020'),
('2020-05-11', '5', '2020'),
('2020-05-12', '5', '2020'),
('2020-05-13', '5', '2020'),
('2020-05-20', '5', '2020'),
('2020-05-21', '5', '2020'),
('2020-05-30', '5', '2020'),
('2020-06-10', '6', '2020'),
('2020-06-30', '6', '2020'),
('2020-07-01', '7', '2020'),
('2020-07-22', '7', '2020'),
('2020-08-12', '8', '2020'),
('2020-08-15', '8', '2020'),
('2020-09-17', '9', '2020'),
('2020-09-22', '9', '2020'),
('2020-09-23', '9', '2020'),
('2020-10-06', '10', '2020'),
('2020-10-08', '10', '2020'),
('2020-11-10', '11', '2020'),
('2020-11-19', '11', '2020'),
('2020-12-01', '12', '2020'),
('2020-12-17', '12', '2020'),
('2020-12-23', '12', '2020'),
('2021-03-12', '3', '2021'),
('2021-05-01', '5', '2021');


-- --------------------------------------------------------

--
-- Structure de la table `police`
--

CREATE TABLE `police` (
  `idPolice` int(11) NOT NULL,
  `codeEtat` varchar(50) NOT NULL,
  `note` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Index pour la table `police`
--
ALTER TABLE `police`
  ADD PRIMARY KEY (`idPolice`);

--
-- Déchargement des données de la table `police`
--

INSERT INTO `police` (`idPolice`, `codeEtat`, `note`) VALUES
(1, 'cree', '2'),
(2, 'modifiee', '2'),
(3, 'cree', '3'),
(4, 'modifiee', '4'),
(5, 'modifiee', '5'),
(6, 'cree', '2'),
(7, 'cree', '2'),
(8, 'cree', '2'),
(9, 'modifiee', '2'),
(10, 'cree', '3'),
(11, 'modifiee', '4'),
(12, 'modifiee', '5'),
(13, 'cree', '2'),
(14, 'cree', '2'),
(15, 'cree', '2'),
(16, 'cree', '2'),
(17, 'cree', '2'),
(18, 'cree', '2'),
(19, 'cree', '2'),
(20, 'cree', '2'),
(21, 'cree', '2'),
(22, 'cree', '2'),
(23, 'cree', '2'),
(24, 'cree', '2'),
(25, 'cree', '2'),
(26, 'cree', '2'),
(27, 'cree', '2'),
(28, 'modifiée', '2'),
(29, 'accepté', '3'),
(30, 'cree', '4'),
(31, 'cree', '2'),
(32, 'créée', '2'),
(33, 'accepté', '2');

-- --------------------------------------------------------

--
-- Structure de la table `risque`
--

CREATE TABLE `risque` (
  `typeRisque` varchar(10) NOT NULL,
  `libelleRisque` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Index pour la table `risque`
--
ALTER TABLE `risque`
  ADD PRIMARY KEY (`typeRisque`);

--
-- Déchargement des données de la table `risque`
--

INSERT INTO `risque` (`typeRisque`, `libelleRisque`) VALUES
('aa', 'automobile'),
('ah', 'habitation'),
('arc', 'responsabilité civile');

-- --------------------------------------------------------

--
-- Structure de la table `sinistre`
--

CREATE TABLE `sinistre` (
  `codeSinistre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Index pour la table `sinistre`
--
ALTER TABLE `sinistre`
  ADD PRIMARY KEY (`codeSinistre`);

--
-- Déchargement des données de la table `sinistre`
--

INSERT INTO `sinistre` (`codeSinistre`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(28),
(29),
(30),
(31),
(32),
(33),
(34),
(35),
(36),
(37),
(38),
(39),
(40),
(41),
(42),
(43),
(44),
(45),
(46),
(47),
(48),
(49),
(50),
(51),
(52);


-- --------------------------------------------------------

--
-- Structure de la table `faitpolice`
--

CREATE TABLE `faitpolice` (
  `codePolice` int(11) NOT NULL,
  `dateEcriture` date NOT NULL,
  `codeAgent` int(11) NOT NULL,
  `codeClient` varchar(10) NOT NULL,
  `typeRisque` varchar(10) NOT NULL,
  `codeBien` int(11) NOT NULL,
  `NbTransaction` int(11) NOT NULL,
  `montant` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Index pour la table `faitpolice`
--
ALTER TABLE `faitpolice`
  ADD KEY `police_ibfk1` (`dateEcriture`),
  ADD KEY `police_ibfk2` (`codeClient`),
  ADD KEY `police_ibfk3` (`typeRisque`),
  ADD KEY `police_ibfk5` (`codeBien`),
  ADD KEY `police_ibfk7` (`codePolice`),
  ADD KEY `police_ibfk8` (`codeAgent`);

ALTER TABLE `faitpolice`
  ADD CONSTRAINT `police_ibfk1` FOREIGN KEY (`dateEcriture`) REFERENCES `date` (`date`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `police_ibfk2` FOREIGN KEY (`codeClient`) REFERENCES `client` (`CodeClient`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `police_ibfk3` FOREIGN KEY (`typeRisque`) REFERENCES `risque` (`typeRisque`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `police_ibfk5` FOREIGN KEY (`codeBien`) REFERENCES `bien` (`codeBien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `police_ibfk7` FOREIGN KEY (`codePolice`) REFERENCES `police` (`idPolice`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `police_ibfk8` FOREIGN KEY (`codeAgent`) REFERENCES `agent` (`codeAgent`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Déchargement des données de la table `faitpolice`
--

INSERT INTO `faitpolice` (`codePolice`, `dateEcriture`, `codeAgent`, `codeClient`, `typeRisque`, `codeBien`, `NbTransaction`, `montant`) VALUES
(1, '2021-05-01', 1, 'AROUT', 'aa', 1, 1, 1200),
(2, '2019-09-04', 5, 'ANTON', 'aa', 5, 2, 4000),
(4, '2020-04-14', 2, 'BERGS', 'arc', 4, 3, 15000),
(7, '2020-05-03', 3, 'ALFKI', 'arc', 4, 1, 2000);

-- --------------------------------------------------------

--
-- Structure de la table `faitsinistre`
--

CREATE TABLE `faitsinistre` (
  `codeSinistre` int(11) NOT NULL,
  `dateEffet` date NOT NULL,
  `codeClient` varchar(10) NOT NULL,
  `codePolice` int(11) NOT NULL,
  `codeAgent` int(11) NOT NULL,
  `typeRisque` varchar(10) NOT NULL,
  `codeBien` int(11) NOT NULL,
  `montant` float NOT NULL,
  `NbTransaction` int(11) NOT NULL,
  `paye` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Index pour la table `faitsinistre`
--
ALTER TABLE `faitsinistre`
  ADD KEY `police_ibfk_1` (`codePolice`),
  ADD KEY `police_ibfk_2` (`typeRisque`),
  ADD KEY `police_ibfk_3` (`codeClient`),
  ADD KEY `police_ibfk_4` (`codeAgent`),
  ADD KEY `police_ibfk_6` (`codeBien`),
  ADD KEY `police_ibfk_7` (`codeSinistre`),
  ADD KEY `police_ibfk_8` (`dateEffet`);


ALTER TABLE `faitsinistre`
  ADD CONSTRAINT `police_ibfk_1` FOREIGN KEY (`codePolice`) REFERENCES `police` (`idPolice`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `police_ibfk_2` FOREIGN KEY (`typeRisque`) REFERENCES `risque` (`typeRisque`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `police_ibfk_3` FOREIGN KEY (`codeClient`) REFERENCES `client` (`CodeClient`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `police_ibfk_4` FOREIGN KEY (`codeAgent`) REFERENCES `agent` (`codeAgent`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `police_ibfk_6` FOREIGN KEY (`codeBien`) REFERENCES `bien` (`codeBien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `police_ibfk_7` FOREIGN KEY (`codeSinistre`) REFERENCES `sinistre` (`codeSinistre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `police_ibfk_8` FOREIGN KEY (`dateEffet`) REFERENCES `date` (`date`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
--
-- Déchargement des données de la table `faitsinistre`
--

INSERT INTO `faitsinistre` (`codeSinistre`, `dateEffet`, `codeClient`, `codePolice`, `codeAgent`, `typeRisque`, `codeBien`, `montant`, `NbTransaction`, `paye`) VALUES
(7, '2020-02-19', 'AROUT', 1, 2, 'ah', 4, 2569, 1, 159),
(9, '2020-01-12', 'ANTON', 2, 4, 'ah', 3, 2400, 2, 800),
(1, '2020-05-12', 'ANTON', 2, 4, 'ah', 5, 1400, 7, 1050),
(13, '2020-08-12', 'ANTON', 2, 4, 'ah', 5, 2000, 1, 100),
(11, '2020-01-15', 'AROUT', 3, 4, 'ah', 2, 2350, 1, 100),
(8, '2020-05-11', 'BERGS', 4, 5, 'aa', 3, 2459, 1, 400),
(15, '2020-02-13', 'ANTON', 9, 4, 'arc', 2, 3000, 3, 1500),
(35, '2020-01-15', 'AYA', 33, 15, 'arc', 1, 2400, 2, 200),
(36, '2020-02-19', 'AYA', 33, 15, 'aa', 2, 4000, 2, 420),
(48, '2020-03-28', 'AYA', 33, 15, 'aa', 1, 10694, 2, 680),
(37, '2020-03-20', 'AYA', 33, 15, 'ah', 3, 40000, 4, 4480),
(47, '2020-03-18', 'AYA', 33, 15, 'arc', 6, 914, 2, 280),
(38, '2020-04-07', 'AYA', 33, 15, 'arc', 4, 10000, 2, 640),
(39, '2020-05-13', 'AYA', 33, 15, 'aa', 5, 5200, 2, 2440),
(49, '2020-05-21', 'AYA', 33, 15, 'ah', 2, 1929, 3, 1620),
(40, '2020-06-30', 'AYA', 33, 15, 'ah', 6, 2400, 2, 1960),
(41, '2020-07-01', 'AYA', 33, 15, 'arc', 1, 16410, 3, 2340),
(42, '2020-08-15', 'AYA', 33, 15, 'aa', 2, 4350, 3, 2280),
(43, '2020-09-22', 'AYA', 33, 15, 'ah', 3, 9042, 2, 1300),
(44, '2020-10-06', 'AYA', 33, 15, 'arc', 4, 7350, 3, 1950),
(45, '2020-11-10', 'AYA', 33, 15, 'aa', 5, 2295, 3, 690),
(52, '2020-11-19', 'AYA', 33, 15, 'ah', 5, 1026, 3, 630),
(51, '2020-12-23', 'AYA', 33, 15, 'aa', 4, 1308, 3, 690),
(46, '2020-12-01', 'AYA', 33, 15, 'ah', 6, 1132, 2, 1080);

--
-- Index pour les tables déchargées
--

--

--


--
-- Index pour la table `date`


--
-- Contraintes pour la table `faitsinistre`
--




/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
