DROP DATABASE IF EXISTS `CentreEducatiu`;
CREATE DATABASE `CentreEducatiu`;
USE `CentreEducatiu`;
CREATE TABLE `Alumnes` (
  `id` int PRIMARY KEY,
  `nom` varchar(50) NOT NULL,
  `cognom1` varchar(50) NOT NULL,
  `cognom2` varchar(50),
  `correu` varchar(50) UNIQUE NOT NULL,
  `grupClasse` varchar(10) NOT NULL
);

CREATE TABLE `Ubicacions` (
  `id` int PRIMARY KEY,
  `nom` varchar(6)
);

CREATE TABLE `TipusMaterial` (
  `id` int PRIMARY KEY,
  `tipus` varchar(50),
  `model` varchar(50),
  `origen` ENUM ('GENE', 'DEP') DEFAULT "DEP"
);

CREATE TABLE `Material` (
  `id` int PRIMARY KEY,
  `idTipus` int NOT NULL,
  `idInventari` varchar(10) UNIQUE,
  `etiquetaDepInf` varchar(50) UNIQUE,
  `numSerie` varchar(50) UNIQUE,
  `macEthernet` varchar(50) UNIQUE,
  `macWifi` varchar(50) UNIQUE,
  `SACE` varchar(50) UNIQUE,
  `dataAdquisicio` date,
  `idUbicacio` int NOT NULL
);

CREATE TABLE `Assignacions` (
  `id` int PRIMARY KEY,
  `idMaterial` int NOT NULL,
  `idAlumne` int NOT NULL,
  `dataInici` date NOT NULL,
  `dataFinal` date
);

CREATE TABLE `Estats` (
  `id` int PRIMARY KEY,
  `estat` varchar(50)
);

CREATE TABLE `Incidencies` (
  `id` int PRIMARY KEY,
  `informacio` varchar(5000),
  `dataOberta` date,
  `dataTancada` date,
  `idAlumne` int,
  `idDispositiu` int,
  `idEstat` int
);

ALTER TABLE `Material` ADD FOREIGN KEY (`idTipus`) REFERENCES `TipusMaterial` (`id`);

ALTER TABLE `Material` ADD FOREIGN KEY (`idUbicacio`) REFERENCES `Ubicacions` (`id`);

ALTER TABLE `Assignacions` ADD FOREIGN KEY (`idMaterial`) REFERENCES `Material` (`id`);

ALTER TABLE `Assignacions` ADD FOREIGN KEY (`idAlumne`) REFERENCES `Alumnes` (`id`);

ALTER TABLE `Incidencies` ADD FOREIGN KEY (`idAlumne`) REFERENCES `Alumnes` (`id`);

ALTER TABLE `Incidencies` ADD FOREIGN KEY (`idDispositiu`) REFERENCES `Material` (`id`);

ALTER TABLE `Incidencies` ADD FOREIGN KEY (`idEstat`) REFERENCES `Estats` (`id`);
