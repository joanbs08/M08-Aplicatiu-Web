-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 23-05-2023 a las 10:25:05
-- Versión del servidor: 10.3.38-MariaDB-0ubuntu0.20.04.1
-- Versión de PHP: 7.4.3-4ubuntu2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `CentreEducatiu`
--
DROP DATABASE IF EXISTS `CentreEducatiu`;
CREATE DATABASE `CentreEducatiu`;
USE `CentreEducatiu`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Assignacions`
--

CREATE TABLE `Assignacions` (
  `id` int(11) NOT NULL,
  `idMaterial` int(11) NOT NULL,
  `idAlumne` int(11) NOT NULL,
  `dataInici` date NOT NULL,
  `dataFinal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Assignacions`
--

INSERT INTO `Assignacions` (`id`, `idMaterial`, `idAlumne`, `dataInici`, `dataFinal`) VALUES
(1, 1, 1, '2023-05-23', NULL),
(2, 2, 2, '2023-05-23', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Estats`
--

CREATE TABLE `Estats` (
  `id` int(11) NOT NULL,
  `estat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Estats`
--

INSERT INTO `Estats` (`id`, `estat`) VALUES
(1, 'correcte'),
(2, 'amb algunes falles');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Incidencies`
--

CREATE TABLE `Incidencies` (
  `id` int(11) NOT NULL,
  `informacio` varchar(5000) DEFAULT NULL,
  `dataOberta` date DEFAULT NULL,
  `dataTancada` date DEFAULT NULL,
  `idAlumne` int(11) DEFAULT NULL,
  `idDispositiu` int(11) DEFAULT NULL,
  `idEstat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Incidencies`
--

INSERT INTO `Incidencies` (`id`, `informacio`, `dataOberta`, `dataTancada`, `idAlumne`, `idDispositiu`, `idEstat`) VALUES
(1, 'pantalla trencada', '2023-05-25', NULL, 1, 1, 2),
(2, 'carregador tablet trencat', '2023-05-24', NULL, 2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `horaAcces` datetime DEFAULT NULL,
  `accio` varchar(10) DEFAULT NULL,
  `ipRemota` varchar(50) DEFAULT NULL,
  `tipusNavegador` varchar(50) DEFAULT NULL,
  `idUsuari` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Material`
--

CREATE TABLE `Material` (
  `id` int(11) NOT NULL,
  `idTipus` int(11) NOT NULL,
  `idInventari` varchar(10) DEFAULT NULL,
  `etiquetaDepInf` varchar(50) DEFAULT NULL,
  `numSerie` varchar(50) DEFAULT NULL,
  `macEthernet` varchar(50) DEFAULT NULL,
  `macWifi` varchar(50) DEFAULT NULL,
  `SACE` varchar(50) DEFAULT NULL,
  `dataAdquisicio` date DEFAULT NULL,
  `idUbicacio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Material`
--

INSERT INTO `Material` (`id`, `idTipus`, `idInventari`, `etiquetaDepInf`, `numSerie`, `macEthernet`, `macWifi`, `SACE`, `dataAdquisicio`, `idUbicacio`) VALUES
(1, 1, '1', '5566677', '55556444', '3938384', '449498484', 'e48448484', '2023-05-23', 1),
(2, 2, '2', '4448484', '4949494', '44494994', '4448383', '3383833', '2023-05-23', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Material2`
--

CREATE TABLE `Material2` (
  `id` int(11) NOT NULL,
  `etiquetaDepInf` varchar(255) NOT NULL,
  `numSerie` varchar(255) NOT NULL,
  `macEthernet` varchar(255) NOT NULL,
  `macWifi` varchar(255) NOT NULL,
  `SACE` varchar(255) NOT NULL,
  `dataAdquisicio` varchar(255) NOT NULL,
  `idUbicacio` varchar(255) NOT NULL,
  `idTipus` varchar(255) NOT NULL,
  `dia` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Material2`
--

INSERT INTO `Material2` (`id`, `etiquetaDepInf`, `numSerie`, `macEthernet`, `macWifi`, `SACE`, `dataAdquisicio`, `idUbicacio`, `idTipus`, `dia`) VALUES
(1, '455454', '443646', '775544', '45678', '443i84', '22-05-2023', 'aula23', 'portatil', '2023-05-22 18:21:42'),
(2, '455454', '443646', '775544', '45678', '443i84', '22-05-2023', 'aula23', 'portatil', '2023-05-22 18:23:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MaterialSolicitud`
--

CREATE TABLE `MaterialSolicitud` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `primer_cognom` varchar(50) NOT NULL,
  `segon_cognom` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cicle` varchar(50) NOT NULL,
  `nom_cicle` varchar(100) NOT NULL,
  `localitat` varchar(50) NOT NULL,
  `direccio` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `codi_postal` varchar(10) NOT NULL,
  `prioridad` varchar(10) NOT NULL,
  `motiu` text NOT NULL,
  `dia` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `MaterialSolicitud`
--

INSERT INTO `MaterialSolicitud` (`id`, `nom`, `primer_cognom`, `segon_cognom`, `email`, `cicle`, `nom_cicle`, `localitat`, `direccio`, `telefono`, `codi_postal`, `prioridad`, `motiu`, `dia`) VALUES
(1, 'joan', 'bayarri', 'subirats', 'joanbayarri@iesmontsia.org', 'superior', 'administracio', 'amposta', 'carrer', '623209395', '43870', 'baja', 'fffffff', '2023-05-19 07:38:03'),
(2, 'sergi', 'villarroya', 'cavaller', 'sergivillarroya@iesmontsia.org', 'Superior', 'ASIX-DAW', 'La rapita', 'no u se', '639459485', '43850', 'baja', 'ordinador trencat. necessito un de nou', '2023-05-20 11:05:33'),
(3, 'joan', 'bayarri', 'subirats', 'joanbayarri@iesmontsia.org', 'superior', 'asiinfrird', 'rrrrrr', '4rr4r4r', '63848484', '55955', 'baja', '5ytrfedwsa', '2023-05-22 18:26:02'),
(4, 'joan', 'bayarri', 'subirats', 'joanbayarri@iesmontsia.org', 'superior', 'swjsjsjs', 'amposta', 'fffff', '844474774', '938484', 'media', 'iejwjfeijijed', '2023-05-23 08:45:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TipusMaterial`
--

CREATE TABLE `TipusMaterial` (
  `id` int(11) NOT NULL,
  `tipus` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `origen` enum('GENE','DEP') DEFAULT 'DEP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `TipusMaterial`
--

INSERT INTO `TipusMaterial` (`id`, `tipus`, `model`, `origen`) VALUES
(1, 'ordinador', 'acer', 'DEP'),
(2, 'tablet', 'iphad', 'DEP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ubicacions`
--

CREATE TABLE `Ubicacions` (
  `id` int(11) NOT NULL,
  `nom` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Ubicacions`
--

INSERT INTO `Ubicacions` (`id`, `nom`) VALUES
(1, 'Aula22'),
(2, 'AUla21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuaris`
--

CREATE TABLE `Usuaris` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `contrasenya` varchar(50) NOT NULL,
  `rol` int(11) NOT NULL,
  `cognom1` varchar(50) NOT NULL,
  `cognom2` varchar(50) NOT NULL,
  `grup_classe` varchar(50) NOT NULL,
  `correu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Usuaris`
--

INSERT INTO `Usuaris` (`id`, `nom`, `contrasenya`, `rol`, `cognom1`, `cognom2`, `grup_classe`, `correu`) VALUES
(1, 'joan', 'c98a0d7fe575cc92f0cc931db5e31552', 0, 'bayarri', 'subirats', '1rA', 'joanbayarri@iesmontsia.org'),
(2, 'sergi', 'c98a0d7fe575cc92f0cc931db5e31552', 0, 'villarroya', 'cavaller', '1rA', 'sergivillarroya@iesmontsia.org'),
(3, 'javier', '1145cbf42070c6704b66d6ac75347726', 1, '', '', '', ''),
(4, 'paula', 'c98a0d7fe575cc92f0cc931db5e31552', 0, 'cruzado', '', '1rA', 'paulacruzado@iesmontsia.org'),
(5, 'secundino', '1145cbf42070c6704b66d6ac75347726', 1, '', '', '', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Assignacions`
--
ALTER TABLE `Assignacions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idMaterial` (`idMaterial`),
  ADD KEY `idAlumne` (`idAlumne`);

--
-- Indices de la tabla `Estats`
--
ALTER TABLE `Estats`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Incidencies`
--
ALTER TABLE `Incidencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idAlumne` (`idAlumne`),
  ADD KEY `idDispositiu` (`idDispositiu`),
  ADD KEY `idEstat` (`idEstat`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUsuari` (`idUsuari`);

--
-- Indices de la tabla `Material`
--
ALTER TABLE `Material`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idInventari` (`idInventari`),
  ADD UNIQUE KEY `etiquetaDepInf` (`etiquetaDepInf`),
  ADD UNIQUE KEY `numSerie` (`numSerie`),
  ADD UNIQUE KEY `macEthernet` (`macEthernet`),
  ADD UNIQUE KEY `macWifi` (`macWifi`),
  ADD UNIQUE KEY `SACE` (`SACE`),
  ADD KEY `idTipus` (`idTipus`),
  ADD KEY `idUbicacio` (`idUbicacio`);

--
-- Indices de la tabla `Material2`
--
ALTER TABLE `Material2`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `MaterialSolicitud`
--
ALTER TABLE `MaterialSolicitud`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `TipusMaterial`
--
ALTER TABLE `TipusMaterial`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Ubicacions`
--
ALTER TABLE `Ubicacions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Usuaris`
--
ALTER TABLE `Usuaris`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Material2`
--
ALTER TABLE `Material2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `MaterialSolicitud`
--
ALTER TABLE `MaterialSolicitud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Assignacions`
--
ALTER TABLE `Assignacions`
  ADD CONSTRAINT `Assignacions_ibfk_1` FOREIGN KEY (`idMaterial`) REFERENCES `Material` (`id`),
  ADD CONSTRAINT `Assignacions_ibfk_2` FOREIGN KEY (`idAlumne`) REFERENCES `Usuaris` (`id`);

--
-- Filtros para la tabla `Incidencies`
--
ALTER TABLE `Incidencies`
  ADD CONSTRAINT `Incidencies_ibfk_1` FOREIGN KEY (`idAlumne`) REFERENCES `Usuaris` (`id`),
  ADD CONSTRAINT `Incidencies_ibfk_2` FOREIGN KEY (`idDispositiu`) REFERENCES `Material` (`id`),
  ADD CONSTRAINT `Incidencies_ibfk_3` FOREIGN KEY (`idEstat`) REFERENCES `Estats` (`id`);

--
-- Filtros para la tabla `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`idUsuari`) REFERENCES `Usuaris` (`id`);

--
-- Filtros para la tabla `Material`
--
ALTER TABLE `Material`
  ADD CONSTRAINT `Material_ibfk_1` FOREIGN KEY (`idTipus`) REFERENCES `TipusMaterial` (`id`),
  ADD CONSTRAINT `Material_ibfk_2` FOREIGN KEY (`idUbicacio`) REFERENCES `Ubicacions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;