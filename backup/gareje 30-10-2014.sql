/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : garaje

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2014-10-24 12:54:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tamortizacion`
-- ----------------------------
DROP TABLE IF EXISTS `tamortizacion`;
CREATE TABLE `tamortizacion` (
  `IdAmortizacion` int(11) NOT NULL,
  `Monto` decimal(10,0) NOT NULL,
  PRIMARY KEY (`IdAmortizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of tamortizacion
-- ----------------------------

-- ----------------------------
-- Table structure for `tespacio`
-- ----------------------------
DROP TABLE IF EXISTS `tespacio`;
CREATE TABLE `tespacio` (
  `idEspacio` int(11) NOT NULL,
  `EspacioOcupado` int(11) NOT NULL,
  `IdZona` int(11) NOT NULL,
  PRIMARY KEY (`idEspacio`),
  KEY `fk_tEspacio_tZona1_idx` (`IdZona`),
  CONSTRAINT `fk_tEspacio_tZona1` FOREIGN KEY (`IdZona`) REFERENCES `tzona` (`Idzona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of tespacio
-- ----------------------------

-- ----------------------------
-- Table structure for `testacionamiento`
-- ----------------------------
DROP TABLE IF EXISTS `testacionamiento`;
CREATE TABLE `testacionamiento` (
  `IdEstacionamiento` int(11) NOT NULL,
  `FechayHoraIngreso` datetime DEFAULT NULL,
  `FechayHoraSalida` datetime DEFAULT NULL,
  `IdZona` int(11) NOT NULL,
  `IdVehiculo` int(11) NOT NULL,
  `IdTarifa` int(11) NOT NULL,
  `IdPersona` int(11) NOT NULL,
  PRIMARY KEY (`IdEstacionamiento`),
  KEY `fk_tEstacionamiento_tZona_idx` (`IdZona`),
  KEY `fk_tEstacionamiento_tVehiculo1_idx` (`IdVehiculo`),
  KEY `fk_tEstacionamiento_tTarifa1_idx` (`IdTarifa`),
  KEY `fk_tEstacionamiento_tPersona1_idx` (`IdPersona`),
  CONSTRAINT `fk_tEstacionamiento_tPersona1` FOREIGN KEY (`IdPersona`) REFERENCES `tpersona` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tEstacionamiento_tTarifa1` FOREIGN KEY (`IdTarifa`) REFERENCES `ttarifa` (`IdTarifa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tEstacionamiento_tVehiculo1` FOREIGN KEY (`IdVehiculo`) REFERENCES `tvehiculo` (`IdVehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tEstacionamiento_tZona` FOREIGN KEY (`IdZona`) REFERENCES `tzona` (`Idzona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of testacionamiento
-- ----------------------------

-- ----------------------------
-- Table structure for `testado`
-- ----------------------------
DROP TABLE IF EXISTS `testado`;
CREATE TABLE `testado` (
  `idEstado` int(11) NOT NULL,
  `EstadoDisponibilidad` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `IdEspacio` int(11) NOT NULL,
  PRIMARY KEY (`idEstado`),
  KEY `fk_tEstado_tEspacio1_idx` (`IdEspacio`),
  CONSTRAINT `fk_tEstado_tEspacio1` FOREIGN KEY (`IdEspacio`) REFERENCES `tespacio` (`idEspacio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of testado
-- ----------------------------

-- ----------------------------
-- Table structure for `tpago`
-- ----------------------------
DROP TABLE IF EXISTS `tpago`;
CREATE TABLE `tpago` (
  `IdPago` int(11) NOT NULL,
  `Monto` decimal(10,0) DEFAULT NULL,
  `IdEstacionamiento` int(11) NOT NULL,
  `IdAmortizacion` int(11) DEFAULT NULL,
  `IdUsuario` int(11) NOT NULL,
  PRIMARY KEY (`IdPago`),
  KEY `fk_tPago_tEstacionamiento1_idx` (`IdEstacionamiento`),
  KEY `fk_tPago_tAmortizacion1_idx` (`IdAmortizacion`),
  KEY `fk_tPago_tUsuario1_idx` (`IdUsuario`),
  CONSTRAINT `fk_tPago_tAmortizacion1` FOREIGN KEY (`IdAmortizacion`) REFERENCES `tamortizacion` (`IdAmortizacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tPago_tEstacionamiento1` FOREIGN KEY (`IdEstacionamiento`) REFERENCES `testacionamiento` (`IdEstacionamiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tPago_tUsuario1` FOREIGN KEY (`IdUsuario`) REFERENCES `tusuario` (`IdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of tpago
-- ----------------------------

-- ----------------------------
-- Table structure for `tpersona`
-- ----------------------------
DROP TABLE IF EXISTS `tpersona`;
CREATE TABLE `tpersona` (
  `IdPersona` int(11) NOT NULL,
  `Dni` int(11) NOT NULL,
  `Nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Apellidos` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`IdPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of tpersona
-- ----------------------------

-- ----------------------------
-- Table structure for `ttarifa`
-- ----------------------------
DROP TABLE IF EXISTS `ttarifa`;
CREATE TABLE `ttarifa` (
  `IdTarifa` int(11) NOT NULL,
  `NombreTarifa` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `CostoTarifa` decimal(10,0) NOT NULL,
  `DescripcionTarifa` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`IdTarifa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of ttarifa
-- ----------------------------

-- ----------------------------
-- Table structure for `ttipovehiculo`
-- ----------------------------
DROP TABLE IF EXISTS `ttipovehiculo`;
CREATE TABLE `ttipovehiculo` (
  `IdTipoVehiculo` int(11) NOT NULL,
  `TipoVehiculo` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`IdTipoVehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of ttipovehiculo
-- ----------------------------

-- ----------------------------
-- Table structure for `tusuario`
-- ----------------------------
DROP TABLE IF EXISTS `tusuario`;
CREATE TABLE `tusuario` (
  `IdUsuario` int(11) NOT NULL,
  `Nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Apellidos` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Contraseña` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`IdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of tusuario
-- ----------------------------

-- ----------------------------
-- Table structure for `tvehiculo`
-- ----------------------------
DROP TABLE IF EXISTS `tvehiculo`;
CREATE TABLE `tvehiculo` (
  `IdVehiculo` int(11) NOT NULL,
  `Placa` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Marca` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Modelo` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Color` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `IdTipoVehiculo` int(11) NOT NULL,
  PRIMARY KEY (`IdVehiculo`),
  KEY `fk_tVehiculo_tTipoVehiculo1_idx` (`IdTipoVehiculo`),
  CONSTRAINT `fk_tVehiculo_tTipoVehiculo1` FOREIGN KEY (`IdTipoVehiculo`) REFERENCES `ttipovehiculo` (`IdTipoVehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of tvehiculo
-- ----------------------------

-- ----------------------------
-- Table structure for `tzona`
-- ----------------------------
DROP TABLE IF EXISTS `tzona`;
CREATE TABLE `tzona` (
  `Idzona` int(11) NOT NULL,
  `NombreZona` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `DesripcionZona` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NumeroLugares` int(11) NOT NULL,
  PRIMARY KEY (`Idzona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of tzona
-- ----------------------------