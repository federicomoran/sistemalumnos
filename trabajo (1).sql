-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 27-11-2023 a las 11:44:22
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `trabajo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_alumno`
--

DROP TABLE IF EXISTS `tbl_alumno`;
CREATE TABLE IF NOT EXISTS `tbl_alumno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `dni` int(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_alumno`
--

INSERT INTO `tbl_alumno` (`id`, `nombre`, `apellido`, `dni`) VALUES
(1, 'Federico', 'Moran', 42809162),
(2, 'Jorge', 'Aguero', 40111222),
(3, 'Facundo', 'Simeoni', 40221321),
(4, 'Julieta', 'Moran', 47046914),
(7, 'Juan', 'Sosa', 42345321);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_inscripciones`
--

DROP TABLE IF EXISTS `tbl_inscripciones`;
CREATE TABLE IF NOT EXISTS `tbl_inscripciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alumno` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `mesa` int(11) DEFAULT NULL,
  `tipo_mesa` varchar(25) DEFAULT NULL,
  `asistencia` varchar(25) DEFAULT NULL,
  `nota` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_01` (`alumno`),
  KEY `fk_02` (`mesa`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_inscripciones`
--

INSERT INTO `tbl_inscripciones` (`id`, `alumno`, `fecha`, `mesa`, `tipo_mesa`, `asistencia`, `nota`) VALUES
(5, 1, '2023-03-20', 2, 'Regular', 'Ausente', 0),
(4, 1, '2023-03-20', 4, 'Regular', 'Presente', 8),
(3, 2, '2023-03-20', 4, 'Regular', 'Presente', 10),
(6, 1, '2023-03-20', 8, 'Regular', 'Presente', 9),
(7, 3, '2023-03-20', 8, 'Regular', 'Presente', 10),
(8, 2, '2023-03-20', 8, 'Regular', 'Presente', 10),
(9, 4, '2023-03-20', 8, 'Regular', 'Presente', 10),
(10, 4, '2023-03-21', 4, 'Regular', 'Presente', 8),
(11, 2, '2023-03-21', 1, 'Regular', 'Presente', 10),
(13, 1, '2023-03-23', 16, 'Regular', 'Presente', 8),
(14, 7, '2023-03-23', 4, 'Regular', 'Presente', 9),
(15, 1, '2023-04-23', 19, 'Regular', 'Presente', 10),
(16, 0, '2023-11-27', 0, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_mesas`
--

DROP TABLE IF EXISTS `tbl_mesas`;
CREATE TABLE IF NOT EXISTS `tbl_mesas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `materia` varchar(70) NOT NULL,
  `profesor` varchar(50) NOT NULL,
  `suplente` varchar(50) NOT NULL,
  `vocal` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_mesas`
--

INSERT INTO `tbl_mesas` (`id`, `materia`, `profesor`, `suplente`, `vocal`, `fecha`) VALUES
(1, 'Programacion', 'Sepulveda', 'Aballay', 'Reus', '2023-03-21'),
(2, 'Matematica', 'Mercado', 'Rios', 'Leiva', '2023-03-20'),
(3, 'Ambiente Empresarial', 'Gamboa', 'Moll', 'Maldonado', '2023-03-19'),
(4, 'Desarrollo de Software', 'Morrone', 'Luna', 'Reus', '2023-03-27'),
(5, 'Programacion II', 'Sepulveda', 'Aballay', 'Reus', '2023-03-28'),
(6, 'Matematica III', 'Gomez', 'Mercado', 'Reus', '2023-03-19'),
(7, 'Practica I', 'Reus', 'Yanzon', 'Luna', '2023-03-19'),
(8, 'Base de Datos', 'Beron', 'Morrone', 'Luna', '2023-03-21'),
(9, 'Ingles Tecnico', 'Marquez', 'Beron', 'Mercado', '2023-03-19'),
(12, 'Sistema Op y Redes', 'Moll', 'Luna', 'Morrone', '2023-03-27'),
(10, 'Sistema de Informacion ', 'Reus', 'Beron', 'Morrone', '2023-03-19'),
(11, 'Base de Datos II', 'Beron', 'Luna', 'Morrone', '2023-03-19'),
(15, 'Procesamiento de Datos', 'Zogbe', 'Luna', 'Morrone', '2023-03-27'),
(16, 'Marco Juridico', 'Moll', 'Gamboa', 'Maldonado', '2023-04-02'),
(17, 'Ingles Tecnico II', 'Marquez', 'Videla', 'Reus', '2023-04-23'),
(18, 'Comprension de Texto', 'Maldonado', 'Gamboa', 'Zogbe', '2023-03-26'),
(19, 'Estadistica I', 'Victor', 'Roberto', 'Mariano', '2023-05-21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario`
--

DROP TABLE IF EXISTS `tbl_usuario`;
CREATE TABLE IF NOT EXISTS `tbl_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `tipo_us` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`id`, `usuario`, `clave`, `nombre`, `tipo_us`) VALUES
(1, 'fede', 'moran', 'federico moran', 'Administrador'),
(2, 'jorge', 'aguero', 'jorge aguero', 'Operador'),
(3, 'facu', 'simeoni', 'facundo simeoni', 'Operador'),
(4, 'juan', 'sosa', 'juan sosa', 'Operador'),
(5, 'mariano', '123', 'mariano quiroga', 'Administrador'),
(6, 'federico', 'fede', 'federico moran', 'Administrador'),
(7, 'moran', 'federico', 'fede', 'Administrador');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
