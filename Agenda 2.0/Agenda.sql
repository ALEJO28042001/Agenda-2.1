-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: agenda
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citas` (
  `cit_id` int(11) NOT NULL AUTO_INCREMENT,
  `con_id` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Sitio` varchar(150) NOT NULL,
  `Motivo` varchar(150) NOT NULL,
  PRIMARY KEY (`cit_id`),
  KEY `FK_CITA_CONTACTO` (`con_id`),
  CONSTRAINT `FK_CITA_CONTACTO` FOREIGN KEY (`con_id`) REFERENCES `contactos` (`con_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
INSERT INTO `citas` VALUES (1,10,'2018-10-10','09:30:10','Muro Escalar','Inicio Paro'),(2,15,'2018-10-20','09:30:10','Biblioteca UD','tarea calculo'),(3,20,'2018-10-12','15:30:00','SOFA','Torneo LOL'),(4,16,'2018-10-31','19:00:00','Simon Bolivar','Fiesta Integracion'),(5,21,'2018-10-13','21:01:00','Salitre Magico ','Festival del Terror'),(6,11,'2018-10-11','06:00:00','502 Sabio Caldas','La POO');
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactos`
--

DROP TABLE IF EXISTS `contactos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactos` (
  `con_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador del contacto',
  `con_nombre` varchar(30) NOT NULL COMMENT 'nombre del contacto',
  `con_apellido` varchar(30) NOT NULL COMMENT 'apellido del contacto',
  `con_telefono_domicilio` varchar(15) NOT NULL COMMENT 'telefono de la casa',
  `con_telefono_oficina` varchar(15) NOT NULL COMMENT 'telefono trabajo',
  `con_celular` varchar(20) NOT NULL COMMENT 'celular personal',
  `con_correo` varchar(150) NOT NULL COMMENT 'email personal',
  `con_direccion_residencia` varchar(150) NOT NULL COMMENT 'direccion de residencia',
  `con_direccion_trabajo` varchar(150) NOT NULL COMMENT 'direccion de trabajo',
  PRIMARY KEY (`con_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='tabla con los nombres de conocidos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactos`
--

LOCK TABLES `contactos` WRITE;
/*!40000 ALTER TABLE `contactos` DISABLE KEYS */;
INSERT INTO `contactos` VALUES (10,'Alex H','Rodriguez R','7156701','0','3138040642','alexh.2401@hotmail.com','cll sun # 11c este','0'),(11,'Camilo ','Caiman','4610589','0','305931246','caimanc08@gmail.com','cll 64c #123 35','0'),(12,'Alejandro ','Bermudez','7033212','0','3173881033','diegobermu1003@gmail.com','kr 96a 65a 17','0'),(13,'Nicolas','Gutierrez','4974320','0','3106010259','ndgutierrezm@udistrital.edu.co','cra 22 # 30 -98','trans 23 # 45 -7'),(14,'Jose','Diaz','6410710','0','3143364257','nikozbotve@hotmail.com','cra 22 # 30 -98','trans 23 # 45 -7'),(15,'Johan','Rincon','8932066','0','3007879469','johonrmena@hotmail.com','cra 22 # 30 -98','trans 23 # 45 -7'),(16,'Cristian','Yara','5701252','0','3204231096','cmyara@correo.udistrital.edu.co','cra 22 # 30 -98','trans 23 # 45 -7'),(17,'Juan','Herrera','8285065','0','3188419339','jfherrerap@correo.udistrital.edu.co','cra 22 # 30 -98','trans 23 # 45 -7'),(18,'Fabian','Leon','4516130','0','3207619016','feleon@correo.udistrital.edu.co','cra 22 # 30 -98','trans 23 # 45 -7'),(19,'Esteban','Norato','2517624','0','3193398040','jenoratot@udistrital.edu.co','cra 22 # 30 -98','trans 23 # 45 -7'),(20,'Ivan','Chauta','3528102','0','3506632164','santiagochauta@gmail.com','cra 22 # 30 -98','trans 23 # 45 -7'),(21,'Kevin','Garcia','2287315','0','3103048275','kevingarcia.cuellar94@gmail.com','cra 22 # 30 -98','trans 23 # 45 -7'),(22,'Kevin','Guaitero','4178898','0','3204178898','kevinandresforero@hotmail.com','cra 22 # 30 -98','trans 23 # 45 -7'),(23,'Vivian','Peña','7427353','0','3114612307','pavipehu1@gmail.com','cra 22 # 30 -98','trans 23 # 45 -7'),(24,'Nicolas','Valderrama','4022153','0','3143155135','expectopatrom@gmail.com','cra 22 # 30 -98','trans 23 # 45 -7'),(27,'Joider','Correa','7367012','0','3205366740','xxxxxx@gmail.com','cra 22 # 30 -98','trans 23 # 45 -7'),(28,'Jaime','Bojaca','1981148','0','3204333497','manuel.bojaco@outlook.com','cra 22 # 30 -98','trans 23 # 45 -7'),(29,'Juan','Hernandez','231231321','54687231','213546879','dasio@hjhsd.com','cra325654','dgh5676542');
/*!40000 ALTER TABLE `contactos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'agenda'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-11  6:47:26
