-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.8.5-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para dt
CREATE DATABASE IF NOT EXISTS `dt` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `dt`;

-- Volcando estructura para tabla dt.actividadeconomica
CREATE TABLE IF NOT EXISTS `actividadeconomica` (
  `ID_ACTIVIDAD` int(11) NOT NULL,
  `ID_EMPRESARIO` int(11) DEFAULT NULL,
  `ID_EMPLEADO` int(11) DEFAULT NULL,
  `CAPACIDADPAGO` decimal(10,0) NOT NULL,
  `EMPLEADO` tinyint(1) NOT NULL,
  `EMPRESARIO` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_ACTIVIDAD`),
  KEY `FK_EJECUTA` (`ID_EMPLEADO`),
  KEY `FK_ES_REALIZADA` (`ID_EMPRESARIO`),
  CONSTRAINT `FK_EJECUTA` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `empleado` (`ID_EMPLEADO`),
  CONSTRAINT `FK_ES_REALIZADA` FOREIGN KEY (`ID_EMPRESARIO`) REFERENCES `empresario` (`ID_EMPRESARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dt.actividadeconomica: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `actividadeconomica` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividadeconomica` ENABLE KEYS */;

-- Volcando estructura para tabla dt.beneficiario
CREATE TABLE IF NOT EXISTS `beneficiario` (
  `ID_BENEFICIARIO` int(11) NOT NULL,
  `ID_CLIENTE` int(11) DEFAULT NULL,
  `NOMBREBENEFIARIO` varchar(30) NOT NULL,
  `EDAD` smallint(6) NOT NULL,
  `PARENTESCO` varchar(20) NOT NULL,
  `PORCENTAJE` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ID_BENEFICIARIO`),
  KEY `FK_INGRESA` (`ID_CLIENTE`),
  CONSTRAINT `FK_INGRESA` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dt.beneficiario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `beneficiario` DISABLE KEYS */;
/*!40000 ALTER TABLE `beneficiario` ENABLE KEYS */;

-- Volcando estructura para tabla dt.catalogogenero
CREATE TABLE IF NOT EXISTS `catalogogenero` (
  `ID_GENERO` int(11) NOT NULL,
  `ID_CLIENTE` int(11) DEFAULT NULL,
  `GENERO` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_GENERO`),
  KEY `FK_POSEE2` (`ID_CLIENTE`),
  CONSTRAINT `FK_POSEE2` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dt.catalogogenero: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `catalogogenero` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogogenero` ENABLE KEYS */;

-- Volcando estructura para tabla dt.catalogopaises
CREATE TABLE IF NOT EXISTS `catalogopaises` (
  `CODIGO_PAISES` char(10) NOT NULL,
  `ID_DOMICILIO` int(11) DEFAULT NULL,
  `NOMBRE_PAISES` varchar(60) NOT NULL,
  PRIMARY KEY (`CODIGO_PAISES`),
  KEY `FK_TIENE_UN2` (`ID_DOMICILIO`),
  CONSTRAINT `FK_TIENE_UN2` FOREIGN KEY (`ID_DOMICILIO`) REFERENCES `domicilio` (`ID_DOMICILIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dt.catalogopaises: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `catalogopaises` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogopaises` ENABLE KEYS */;

-- Volcando estructura para tabla dt.catalogoprofesiones
CREATE TABLE IF NOT EXISTS `catalogoprofesiones` (
  `ID_PROFESION` int(11) NOT NULL,
  `ID_EMPRESARIO` int(11) DEFAULT NULL,
  `ID_EMPLEADO` int(11) DEFAULT NULL,
  `PROFESION` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_PROFESION`),
  KEY `FK_ACCEDE2` (`ID_EMPRESARIO`),
  KEY `FK_USA2` (`ID_EMPLEADO`),
  CONSTRAINT `FK_ACCEDE2` FOREIGN KEY (`ID_EMPRESARIO`) REFERENCES `empresario` (`ID_EMPRESARIO`),
  CONSTRAINT `FK_USA2` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `empleado` (`ID_EMPLEADO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dt.catalogoprofesiones: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `catalogoprofesiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogoprofesiones` ENABLE KEYS */;

-- Volcando estructura para tabla dt.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `ID_CLIENTE` int(11) NOT NULL,
  `ID_DOMICILIO` int(11) DEFAULT NULL,
  `ID_ACTIVIDAD` int(11) NOT NULL,
  `ID_SOLICITUD` int(11) DEFAULT NULL,
  `ID_GENERO` int(11) DEFAULT NULL,
  `CODIGORECIBO` int(11) DEFAULT NULL,
  `NOMBRECLIENTE` varchar(30) NOT NULL,
  `APELLIDO` varchar(30) NOT NULL,
  `ESTADOFAMILIAR` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_CLIENTE`),
  KEY `FK_CANCELA` (`CODIGORECIBO`),
  KEY `FK_PIDE` (`ID_SOLICITUD`),
  KEY `FK_POSEE` (`ID_GENERO`),
  KEY `FK_REALIZA` (`ID_ACTIVIDAD`),
  KEY `FK_TIENE_` (`ID_DOMICILIO`),
  CONSTRAINT `FK_CANCELA` FOREIGN KEY (`CODIGORECIBO`) REFERENCES `recibo` (`CODIGORECIBO`),
  CONSTRAINT `FK_PIDE` FOREIGN KEY (`ID_SOLICITUD`) REFERENCES `solicitud` (`ID_SOLICITUD`),
  CONSTRAINT `FK_POSEE` FOREIGN KEY (`ID_GENERO`) REFERENCES `catalogogenero` (`ID_GENERO`),
  CONSTRAINT `FK_REALIZA` FOREIGN KEY (`ID_ACTIVIDAD`) REFERENCES `actividadeconomica` (`ID_ACTIVIDAD`),
  CONSTRAINT `FK_TIENE_` FOREIGN KEY (`ID_DOMICILIO`) REFERENCES `domicilio` (`ID_DOMICILIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dt.cliente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla dt.cuenta
CREATE TABLE IF NOT EXISTS `cuenta` (
  `ID_CUENTA` int(11) NOT NULL,
  `CODIGORECIBO` int(11) DEFAULT NULL,
  `TIPO` varchar(20) NOT NULL,
  `NUMERO` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_CUENTA`),
  KEY `FK_APERTURA2` (`CODIGORECIBO`),
  CONSTRAINT `FK_APERTURA2` FOREIGN KEY (`CODIGORECIBO`) REFERENCES `recibo` (`CODIGORECIBO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dt.cuenta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;

-- Volcando estructura para tabla dt.departamento
CREATE TABLE IF NOT EXISTS `departamento` (
  `CODIGODEPARTAMENTO` char(10) NOT NULL,
  `CODIGO_PAIS` varchar(10) DEFAULT NULL,
  `NOMBREDEPARTAMENTO` varchar(50) NOT NULL,
  PRIMARY KEY (`CODIGODEPARTAMENTO`),
  KEY `FK_CONTIENE` (`CODIGO_PAIS`),
  CONSTRAINT `FK_CONTIENE` FOREIGN KEY (`CODIGO_PAIS`) REFERENCES `pais` (`CODIGO_PAIS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dt.departamento: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;

-- Volcando estructura para tabla dt.documento
CREATE TABLE IF NOT EXISTS `documento` (
  `NUMERODOCUMENTO` varchar(30) NOT NULL,
  `ID_CLIENTE` int(11) DEFAULT NULL,
  `TIPODOCUMENTO` varchar(40) NOT NULL,
  PRIMARY KEY (`NUMERODOCUMENTO`),
  KEY `FK_PRESENTA` (`ID_CLIENTE`),
  CONSTRAINT `FK_PRESENTA` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dt.documento: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;

-- Volcando estructura para tabla dt.domicilio
CREATE TABLE IF NOT EXISTS `domicilio` (
  `ID_DOMICILIO` int(11) NOT NULL,
  `CODIGO_PAISES` char(10) DEFAULT NULL,
  `DIRECCION` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_DOMICILIO`),
  KEY `FK_TIENE_UN` (`CODIGO_PAISES`),
  CONSTRAINT `FK_TIENE_UN` FOREIGN KEY (`CODIGO_PAISES`) REFERENCES `catalogopaises` (`CODIGO_PAISES`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dt.domicilio: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `domicilio` DISABLE KEYS */;
/*!40000 ALTER TABLE `domicilio` ENABLE KEYS */;

-- Volcando estructura para tabla dt.empleado
CREATE TABLE IF NOT EXISTS `empleado` (
  `ID_EMPLEADO` int(11) NOT NULL,
  `ID_ACTIVIDAD` int(11) DEFAULT NULL,
  `ID_PROFESION` int(11) DEFAULT NULL,
  `COMPANIA_TRABAJA` varchar(50) NOT NULL,
  `CARGO` varchar(50) NOT NULL,
  `SALARIO` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ID_EMPLEADO`),
  KEY `FK_EJECUTA2` (`ID_ACTIVIDAD`),
  KEY `FK_USA` (`ID_PROFESION`),
  CONSTRAINT `FK_EJECUTA2` FOREIGN KEY (`ID_ACTIVIDAD`) REFERENCES `actividadeconomica` (`ID_ACTIVIDAD`),
  CONSTRAINT `FK_USA` FOREIGN KEY (`ID_PROFESION`) REFERENCES `catalogoprofesiones` (`ID_PROFESION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dt.empleado: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;

-- Volcando estructura para tabla dt.empresario
CREATE TABLE IF NOT EXISTS `empresario` (
  `ID_EMPRESARIO` int(11) NOT NULL,
  `ID_ACTIVIDAD` int(11) DEFAULT NULL,
  `ID_PROFESION` int(11) DEFAULT NULL,
  `NOMBREEMPRESA` varchar(100) NOT NULL,
  `INGRESOS` decimal(10,0) NOT NULL,
  `NUMEROTARJETAIVA` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_EMPRESARIO`),
  KEY `FK_ACCEDE` (`ID_PROFESION`),
  KEY `FK_ES_REALIZADA2` (`ID_ACTIVIDAD`),
  CONSTRAINT `FK_ACCEDE` FOREIGN KEY (`ID_PROFESION`) REFERENCES `catalogoprofesiones` (`ID_PROFESION`),
  CONSTRAINT `FK_ES_REALIZADA2` FOREIGN KEY (`ID_ACTIVIDAD`) REFERENCES `actividadeconomica` (`ID_ACTIVIDAD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dt.empresario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `empresario` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresario` ENABLE KEYS */;

-- Volcando estructura para tabla dt.ingresoasociado
CREATE TABLE IF NOT EXISTS `ingresoasociado` (
  `ID_COOPERATIVA` int(11) NOT NULL,
  `ID_REGISTRO` int(11) DEFAULT NULL,
  `NOMBREASOCIADO` varchar(100) NOT NULL,
  `CODIGOFORMULARIO` varchar(20) NOT NULL,
  `CODIGOASOCIADO` varchar(20) NOT NULL,
  `SITUACION` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_COOPERATIVA`),
  KEY `FK_ADMITE2` (`ID_REGISTRO`),
  CONSTRAINT `FK_ADMITE2` FOREIGN KEY (`ID_REGISTRO`) REFERENCES `registro` (`ID_REGISTRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dt.ingresoasociado: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ingresoasociado` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingresoasociado` ENABLE KEYS */;

-- Volcando estructura para tabla dt.iniciarsesion
CREATE TABLE IF NOT EXISTS `iniciarsesion` (
  `ID_SESION` int(11) NOT NULL,
  `ID_REGISTRO` int(11) DEFAULT NULL,
  `NOMBREUSUARIO` varchar(50) NOT NULL,
  `CONTRASENA` varchar(128) NOT NULL,
  PRIMARY KEY (`ID_SESION`),
  KEY `FK_PERMITE_2` (`ID_REGISTRO`),
  CONSTRAINT `FK_PERMITE_2` FOREIGN KEY (`ID_REGISTRO`) REFERENCES `registro` (`ID_REGISTRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dt.iniciarsesion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `iniciarsesion` DISABLE KEYS */;
/*!40000 ALTER TABLE `iniciarsesion` ENABLE KEYS */;

-- Volcando estructura para tabla dt.municipio
CREATE TABLE IF NOT EXISTS `municipio` (
  `CODIGOMUNICIPIO` char(10) NOT NULL,
  `CODIGODEPARTAMENTO` char(10) DEFAULT NULL,
  `NOMBREMUNICIPIO` varchar(50) NOT NULL,
  PRIMARY KEY (`CODIGOMUNICIPIO`),
  KEY `FK_COMPUESTO_2` (`CODIGODEPARTAMENTO`),
  CONSTRAINT `FK_COMPUESTO_2` FOREIGN KEY (`CODIGODEPARTAMENTO`) REFERENCES `departamento` (`CODIGODEPARTAMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dt.municipio: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;

-- Volcando estructura para tabla dt.pais
CREATE TABLE IF NOT EXISTS `pais` (
  `CODIGO_PAIS` varchar(10) NOT NULL,
  `CODIGO_PAISES` char(10) DEFAULT NULL,
  `NOMBRE_PAIS` varchar(50) NOT NULL,
  PRIMARY KEY (`CODIGO_PAIS`),
  KEY `FK_FORMADO_POR` (`CODIGO_PAISES`),
  CONSTRAINT `FK_FORMADO_POR` FOREIGN KEY (`CODIGO_PAISES`) REFERENCES `catalogopaises` (`CODIGO_PAISES`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dt.pais: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;

-- Volcando estructura para tabla dt.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '0',
  `apellido` varchar(50) NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '0',
  `telefono` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dt.persona: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` (`id_persona`, `nombre`, `apellido`, `email`, `telefono`) VALUES
	(7, 'carlos', 'antonio', 'CA@gmail.com', '788787878'),
	(12, 'Luis', 'Moran', 'LM@gmail.com', '13123123123');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;

-- Volcando estructura para tabla dt.recibo
CREATE TABLE IF NOT EXISTS `recibo` (
  `CODIGORECIBO` int(11) NOT NULL,
  `ID_CLIENTE` int(11) DEFAULT NULL,
  `ID_CUENTA` int(11) DEFAULT NULL,
  `MONTO` decimal(10,0) NOT NULL,
  `TIPOPAGO` varchar(25) NOT NULL,
  PRIMARY KEY (`CODIGORECIBO`),
  KEY `FK_APERTURA` (`ID_CUENTA`),
  KEY `FK_CANCELA2` (`ID_CLIENTE`),
  CONSTRAINT `FK_APERTURA` FOREIGN KEY (`ID_CUENTA`) REFERENCES `cuenta` (`ID_CUENTA`),
  CONSTRAINT `FK_CANCELA2` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dt.recibo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `recibo` DISABLE KEYS */;
/*!40000 ALTER TABLE `recibo` ENABLE KEYS */;

-- Volcando estructura para tabla dt.referenciaspersonales
CREATE TABLE IF NOT EXISTS `referenciaspersonales` (
  `ID_REFERENCIA` int(11) NOT NULL,
  `ID_CLIENTE` int(11) DEFAULT NULL,
  `NOMBRE_REFERENCIA` varchar(100) NOT NULL,
  `TELEFONO` varchar(20) NOT NULL,
  `CORREO` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_REFERENCIA`),
  KEY `FK_INGRESA_` (`ID_CLIENTE`),
  CONSTRAINT `FK_INGRESA_` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dt.referenciaspersonales: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `referenciaspersonales` DISABLE KEYS */;
/*!40000 ALTER TABLE `referenciaspersonales` ENABLE KEYS */;

-- Volcando estructura para tabla dt.registro
CREATE TABLE IF NOT EXISTS `registro` (
  `ID_REGISTRO` int(11) NOT NULL,
  `ID_SOLICITUD` int(11) DEFAULT NULL,
  `ID_COOPERATIVA` int(11) DEFAULT NULL,
  `ID_SESION` int(11) DEFAULT NULL,
  `NOMBREREGISTRO` varchar(30) NOT NULL,
  `APELLIDOREGISTRO` varchar(30) NOT NULL,
  `FECHANACIMIENTO` date NOT NULL,
  `CORREOREGISTRO` varchar(50) NOT NULL,
  `DATOS` text NOT NULL,
  `DOCUMENTO` text NOT NULL,
  `NOMBREUSUARIOREGISTRO` varchar(20) NOT NULL,
  `CONTASENAREGISTRO` varchar(40) NOT NULL,
  PRIMARY KEY (`ID_REGISTRO`),
  KEY `FK_ADMITE` (`ID_COOPERATIVA`),
  KEY `FK_PERMITE2` (`ID_SOLICITUD`),
  KEY `FK_PERMITE_` (`ID_SESION`),
  CONSTRAINT `FK_ADMITE` FOREIGN KEY (`ID_COOPERATIVA`) REFERENCES `ingresoasociado` (`ID_COOPERATIVA`),
  CONSTRAINT `FK_PERMITE2` FOREIGN KEY (`ID_SOLICITUD`) REFERENCES `solicitud` (`ID_SOLICITUD`),
  CONSTRAINT `FK_PERMITE_` FOREIGN KEY (`ID_SESION`) REFERENCES `iniciarsesion` (`ID_SESION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dt.registro: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `registro` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro` ENABLE KEYS */;

-- Volcando estructura para tabla dt.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `ID_ROL` int(11) NOT NULL,
  `ID_REGISTRO` int(11) DEFAULT NULL,
  `NOMBREROL` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_ROL`),
  KEY `FK_ASIGNA` (`ID_REGISTRO`),
  CONSTRAINT `FK_ASIGNA` FOREIGN KEY (`ID_REGISTRO`) REFERENCES `registro` (`ID_REGISTRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dt.rol: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;

-- Volcando estructura para tabla dt.solicitud
CREATE TABLE IF NOT EXISTS `solicitud` (
  `ID_SOLICITUD` int(11) NOT NULL,
  `ID_REGISTRO` int(11) DEFAULT NULL,
  `FECHA` date NOT NULL,
  `ESTADOSOLICITUD` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_SOLICITUD`),
  KEY `FK_PERMITE` (`ID_REGISTRO`),
  CONSTRAINT `FK_PERMITE` FOREIGN KEY (`ID_REGISTRO`) REFERENCES `registro` (`ID_REGISTRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dt.solicitud: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;

-- Volcando estructura para tabla dt.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dt.usuario: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id_usuario`, `username`, `password`) VALUES
	(1, 'admin', '$2a$10$M.EvTWDYhxGsDg.3dXGT.u81guXlMDGeAZWp.P.YyBM.aZPFb5kVy'),
	(2, 'user', '$2a$10$CHxSSLMj/iuibSCbGi08Uu7iROZ59Ik1Xf9qGEdniLszowwsNZ2du');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
