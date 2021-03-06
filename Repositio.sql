-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: repositio
-- ------------------------------------------------------
-- Server version	5.5.54-0ubuntu0.14.04.1

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
-- Table structure for table `administrador_areaconocimiento`
--

DROP TABLE IF EXISTS `administrador_areaconocimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_areaconocimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `fecha` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_areaconocimiento`
--

LOCK TABLES `administrador_areaconocimiento` WRITE;
/*!40000 ALTER TABLE `administrador_areaconocimiento` DISABLE KEYS */;
INSERT INTO `administrador_areaconocimiento` VALUES (1,'Administración',1,'2017-02-20 01:57:14','2017-02-20 01:57:14'),(2,'Ciencias sociales',1,'2017-02-20 01:57:41','2017-02-20 01:57:41'),(3,'Derecho',1,'2017-02-20 01:57:49','2017-02-20 01:57:49'),(4,'Economía',1,'2017-02-20 01:58:09','2017-02-20 01:58:09'),(5,'Finanzas',1,'2017-02-20 01:58:18','2017-02-20 01:58:34'),(6,'Legislación fiscal',1,'2017-02-20 01:59:03','2017-02-20 01:59:03'),(7,'Informatica',1,'2017-02-20 01:59:12','2017-02-20 01:59:12'),(8,'Matematica',1,'2017-02-20 01:59:26','2017-02-20 01:59:26');
/*!40000 ALTER TABLE `administrador_areaconocimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_audio`
--

DROP TABLE IF EXISTS `administrador_audio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_audio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` longtext NOT NULL,
  `ruta` varchar(100) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `eliminado` tinyint(1) NOT NULL,
  `fecha` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  `carrera_id` int(11) NOT NULL,
  `clase_id` int(11) NOT NULL,
  `evento_id` int(11),
  `propietario_id` int(11) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `administrador_audio_15b82638` (`carrera_id`),
  KEY `administrador_audio_2aa3c485` (`clase_id`),
  KEY `administrador_audio_afb29da0` (`evento_id`),
  KEY `administrador_audio_e24036a9` (`propietario_id`),
  KEY `administrador_audio_d3c0c18a` (`tipo_id`),
  CONSTRAINT `administrador_audio_clase_id_aad0d37b_fk_administrador_clase_id` FOREIGN KEY (`clase_id`) REFERENCES `administrador_clase` (`id`),
  CONSTRAINT `administrador_audio_propietario_id_44840b38_fk_auth_user_id` FOREIGN KEY (`propietario_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `administrador_audio_tipo_id_e224ba27_fk_administrador_tipo_id` FOREIGN KEY (`tipo_id`) REFERENCES `administrador_tipo` (`id`),
  CONSTRAINT `administrador_audi_evento_id_baa55fcc_fk_administrador_evento_id` FOREIGN KEY (`evento_id`) REFERENCES `administrador_evento` (`id`),
  CONSTRAINT `administrador_au_carrera_id_c6319b8f_fk_administrador_carrera_id` FOREIGN KEY (`carrera_id`) REFERENCES `administrador_carrera` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_audio`
--

LOCK TABLES `administrador_audio` WRITE;
/*!40000 ALTER TABLE `administrador_audio` DISABLE KEYS */;
INSERT INTO `administrador_audio` VALUES (1,'<p>Este audio permite avanzar en la preubas de la aplicacion</p>','edwar-amaya/audios/ping_1.mp3',1,0,'2017-02-20 06:06:57','2017-02-24 20:20:34',1,2,NULL,10,1,'Prueba'),(2,'<p>Esta es una prueba ;)</p>','lmape22/audios/Recording_6.m4a',1,0,'2017-02-23 01:38:23','2017-02-23 01:40:17',1,2,2,13,2,'Prueba'),(3,'<p>Audio con algo menos de 5M</p>','edwar-amaya/audios/linda_estrella_letra.mp3',1,0,'2017-02-23 01:53:31','2017-02-23 02:14:49',1,1,NULL,10,2,'Prueba'),(4,'<p>Prueba 2</p>','lmape22/audios/Musica_alegre_de_fondo_para_tus_videos_sin_Copyright.mp3',1,0,'2017-02-24 02:28:24','2017-02-24 02:28:40',1,3,NULL,13,2,'Prueba'),(5,'<p>prueba propietario</p>','edwar-amaya/audios/linda_estrella_letra_z5DvF0m.mp3',1,0,'2017-03-08 06:09:50','2017-03-08 17:25:44',1,2,NULL,10,1,'prueba propietario'),(6,'<p>Validaci&oacute;n de titulo repetido</p>','lmape22/audios/Andres_cepeda_-_embrujo.mp3',1,0,'2017-03-08 17:25:19','2017-03-08 17:25:50',1,1,NULL,13,1,'Prueba');
/*!40000 ALTER TABLE `administrador_audio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_audio_autor`
--

DROP TABLE IF EXISTS `administrador_audio_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_audio_autor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `audio_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `administrador_audio_autor_audio_id_0d05765b_uniq` (`audio_id`,`user_id`),
  KEY `administrador_audio_autor_user_id_5670da90_fk_auth_user_id` (`user_id`),
  CONSTRAINT `administrador_audio_autor_user_id_5670da90_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `administrador_audio__audio_id_7c98ad26_fk_administrador_audio_id` FOREIGN KEY (`audio_id`) REFERENCES `administrador_audio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_audio_autor`
--

LOCK TABLES `administrador_audio_autor` WRITE;
/*!40000 ALTER TABLE `administrador_audio_autor` DISABLE KEYS */;
INSERT INTO `administrador_audio_autor` VALUES (1,2,10),(2,3,13),(3,4,10),(4,5,13),(5,5,15),(6,6,10);
/*!40000 ALTER TABLE `administrador_audio_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_audio_clave`
--

DROP TABLE IF EXISTS `administrador_audio_clave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_audio_clave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `audio_id` int(11) NOT NULL,
  `clave_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `administrador_audio_clave_audio_id_a5702a1d_uniq` (`audio_id`,`clave_id`),
  KEY `administrador_audio__clave_id_d9ab1e5f_fk_administrador_clave_id` (`clave_id`),
  CONSTRAINT `administrador_audio__audio_id_54e91baf_fk_administrador_audio_id` FOREIGN KEY (`audio_id`) REFERENCES `administrador_audio` (`id`),
  CONSTRAINT `administrador_audio__clave_id_d9ab1e5f_fk_administrador_clave_id` FOREIGN KEY (`clave_id`) REFERENCES `administrador_clave` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_audio_clave`
--

LOCK TABLES `administrador_audio_clave` WRITE;
/*!40000 ALTER TABLE `administrador_audio_clave` DISABLE KEYS */;
INSERT INTO `administrador_audio_clave` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,2),(5,3,1),(6,3,2),(7,4,3),(8,5,1),(9,5,2),(10,6,3);
/*!40000 ALTER TABLE `administrador_audio_clave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_audio_tematica`
--

DROP TABLE IF EXISTS `administrador_audio_tematica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_audio_tematica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `audio_id` int(11) NOT NULL,
  `tematica_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `administrador_audio_tematica_audio_id_7572fdc5_uniq` (`audio_id`,`tematica_id`),
  KEY `administrador__tematica_id_37b64a93_fk_administrador_tematica_id` (`tematica_id`),
  CONSTRAINT `administrador_audio__audio_id_5e093403_fk_administrador_audio_id` FOREIGN KEY (`audio_id`) REFERENCES `administrador_audio` (`id`),
  CONSTRAINT `administrador__tematica_id_37b64a93_fk_administrador_tematica_id` FOREIGN KEY (`tematica_id`) REFERENCES `administrador_tematica` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_audio_tematica`
--

LOCK TABLES `administrador_audio_tematica` WRITE;
/*!40000 ALTER TABLE `administrador_audio_tematica` DISABLE KEYS */;
INSERT INTO `administrador_audio_tematica` VALUES (1,1,1),(2,1,5),(3,1,6),(4,2,1),(5,2,5),(6,2,6),(7,3,4),(8,3,5),(9,4,1),(10,4,2),(11,4,5),(12,5,2),(13,5,3),(14,5,4),(15,5,5),(16,5,6),(17,6,1),(18,6,6);
/*!40000 ALTER TABLE `administrador_audio_tematica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_audiovisto`
--

DROP TABLE IF EXISTS `administrador_audiovisto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_audiovisto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contador` int(11) NOT NULL,
  `audio_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `administrador_audiov_audio_id_a0917cdb_fk_administrador_audio_id` (`audio_id`),
  CONSTRAINT `administrador_audiov_audio_id_a0917cdb_fk_administrador_audio_id` FOREIGN KEY (`audio_id`) REFERENCES `administrador_audio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_audiovisto`
--

LOCK TABLES `administrador_audiovisto` WRITE;
/*!40000 ALTER TABLE `administrador_audiovisto` DISABLE KEYS */;
INSERT INTO `administrador_audiovisto` VALUES (1,3,1),(2,10,2),(3,3,3),(4,4,4);
/*!40000 ALTER TABLE `administrador_audiovisto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_audiovisualizacion`
--

DROP TABLE IF EXISTS `administrador_audiovisualizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_audiovisualizacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_audiovisualizacion`
--

LOCK TABLES `administrador_audiovisualizacion` WRITE;
/*!40000 ALTER TABLE `administrador_audiovisualizacion` DISABLE KEYS */;
INSERT INTO `administrador_audiovisualizacion` VALUES (1,'2017-02-20'),(2,'2017-02-20'),(3,'2017-02-22'),(4,'2017-02-22'),(5,'2017-02-23'),(6,'2017-02-23'),(7,'2017-02-23'),(8,'2017-02-23'),(9,'2017-02-24'),(10,'2017-02-24'),(11,'2017-02-24'),(12,'2017-02-24'),(13,'2017-02-25'),(14,'2017-02-25'),(15,'2017-02-25'),(16,'2017-03-01'),(17,'2017-03-01'),(18,'2017-03-01'),(19,'2017-03-01'),(20,'2017-03-05');
/*!40000 ALTER TABLE `administrador_audiovisualizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_carrera`
--

DROP TABLE IF EXISTS `administrador_carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_carrera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `fecha` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  `facultad_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `administrador_carrera_00e3be6f` (`facultad_id`),
  CONSTRAINT `administrador__facultad_id_dd74f3e9_fk_administrador_facultad_id` FOREIGN KEY (`facultad_id`) REFERENCES `administrador_facultad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_carrera`
--

LOCK TABLES `administrador_carrera` WRITE;
/*!40000 ALTER TABLE `administrador_carrera` DISABLE KEYS */;
INSERT INTO `administrador_carrera` VALUES (1,'Contaduria pública',1,'2017-02-20 02:31:41','2017-02-20 02:31:41',2),(2,'Sistemas',1,'2017-02-20 02:42:49','2017-02-20 02:42:49',1);
/*!40000 ALTER TABLE `administrador_carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_clase`
--

DROP TABLE IF EXISTS `administrador_clase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_clase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `fecha` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_clase`
--

LOCK TABLES `administrador_clase` WRITE;
/*!40000 ALTER TABLE `administrador_clase` DISABLE KEYS */;
INSERT INTO `administrador_clase` VALUES (1,'Docencia',1,'2017-02-20 02:32:57','2017-02-20 02:32:57'),(2,'Investigación',1,'2017-02-20 02:33:05','2017-02-20 02:33:05'),(3,'Proyección social',1,'2017-02-20 02:33:11','2017-02-20 02:33:11');
/*!40000 ALTER TABLE `administrador_clase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_clave`
--

DROP TABLE IF EXISTS `administrador_clave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_clave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `fecha` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_clave`
--

LOCK TABLES `administrador_clave` WRITE;
/*!40000 ALTER TABLE `administrador_clave` DISABLE KEYS */;
INSERT INTO `administrador_clave` VALUES (1,'Contabilidad',1,'2017-02-20 02:33:30','2017-02-20 02:33:30'),(2,'Finanzas',1,'2017-02-20 02:33:37','2017-02-20 02:33:37'),(3,'Laboral',1,'2017-02-20 02:33:43','2017-02-20 02:33:43');
/*!40000 ALTER TABLE `administrador_clave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_dominio`
--

DROP TABLE IF EXISTS `administrador_dominio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_dominio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(35) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `fecha` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_dominio`
--

LOCK TABLES `administrador_dominio` WRITE;
/*!40000 ALTER TABLE `administrador_dominio` DISABLE KEYS */;
INSERT INTO `administrador_dominio` VALUES (1,'@unipiloto.edu.co',1,'2017-02-20 01:53:13','2017-02-20 04:07:38'),(2,'@upc.edu.co',1,'2017-02-20 01:53:44','2017-02-20 04:07:38');
/*!40000 ALTER TABLE `administrador_dominio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_evento`
--

DROP TABLE IF EXISTS `administrador_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `cronograma` varchar(100) NOT NULL,
  `inicio` date NOT NULL,
  `fin` date NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `fecha` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  `encargado_id` int(11) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `administrador_evento_encargado_id_9f92aeca_fk_auth_user_id` (`encargado_id`),
  KEY `administrador_evento_d3c0c18a` (`tipo_id`),
  CONSTRAINT `administrador_evento_encargado_id_9f92aeca_fk_auth_user_id` FOREIGN KEY (`encargado_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `administrador_ev_tipo_id_e2aecc35_fk_administrador_tipoevento_id` FOREIGN KEY (`tipo_id`) REFERENCES `administrador_tipoevento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_evento`
--

LOCK TABLES `administrador_evento` WRITE;
/*!40000 ALTER TABLE `administrador_evento` DISABLE KEYS */;
INSERT INTO `administrador_evento` VALUES (2,'Foro de emprendedores','Foro de emprendedores/None/cronograma/CertificadoLaboral_06012017.pdf','2017-02-06','2017-02-27',0,'2017-02-20 20:26:48','2017-02-24 20:16:36',13,1),(3,'FORO INTERNACIONAL DE CONTADURIA','FORO INTERNACIONAL DE CONTADURIA/None/cronograma/Edwar_Amaya.docx','2017-02-09','2017-02-08',1,'2017-02-24 16:18:29','2017-02-24 16:19:36',1,1),(4,'Foro nacional','Foro nacional/None/cronograma/REFERENCIA_PERSONAL_N1.pdf','2017-02-28','2017-02-28',0,'2017-03-09 03:59:40','2017-03-09 03:59:40',1,6),(5,'Andamio','Andamio/None/cronograma/REFERENCIA_PERSONAL_N1.pdf','2017-03-01','2017-03-06',1,'2017-03-09 04:04:44','2017-03-11 14:32:36',1,5),(6,'Prueba 001','Prueba 001/None/cronograma/REFERENCIA_PERSONAL_N1.pdf','2017-03-01','2017-03-31',1,'2017-03-09 04:27:09','2017-03-09 04:28:09',1,2),(7,'Ingenieria','Ingenieria/None/cronograma/REFERENCIA_PERSONAL_N2.pdf','2017-03-01','2017-03-31',0,'2017-03-09 04:29:05','2017-03-09 04:29:05',1,2),(8,'Prueba 002','Prueba 002/None/cronograma/REFERENCIA_PERSONAL_N2.pdf','2017-03-01','2017-03-31',0,'2017-03-09 04:32:20','2017-03-09 04:32:20',1,1),(9,'Prueba 003','Prueba 003/None/cronograma/REFERENCIA_PERSONAL_N1.pdf','2017-03-01','2017-03-31',0,'2017-03-09 04:35:11','2017-03-09 04:35:11',1,5),(10,'Prueba 4','Prueba 4/None/cronograma/REFERENCIA_PERSONAL_N1.pdf','2017-03-01','2017-03-31',0,'2017-03-09 04:43:15','2017-03-09 04:43:15',1,5),(11,'Prueba 005','Prueba 005/None/cronograma/REFERENCIA_PERSONAL_N2.pdf','2017-03-01','2017-03-31',0,'2017-03-09 04:46:10','2017-03-09 04:46:10',1,5),(12,'Prueba 006','Prueba 006/None/cronograma/REFERENCIA_PERSONAL_N2.pdf','2017-03-01','2017-03-31',0,'2017-03-09 04:53:49','2017-03-09 04:53:49',1,6),(13,'Prueba 007','Prueba 007/None/cronograma/REFERENCIA_PERSONAL_N2.pdf','2017-03-01','2017-03-31',0,'2017-03-09 04:58:38','2017-03-09 04:58:38',1,2),(14,'Prueba 008','Prueba 008/None/cronograma/REFERENCIA_PERSONAL_N1.pdf','2017-03-01','2017-03-31',0,'2017-03-09 05:31:54','2017-03-09 05:31:54',1,4),(15,'Prueba 009','Prueba 009/None/cronograma/REFERENCIA_PERSONAL_N1.pdf','2017-03-01','2017-03-31',0,'2017-03-09 05:37:55','2017-03-09 05:37:55',1,3),(16,'Prueba 010','Prueba 010/None/cronograma/REFERENCIA_PERSONAL_N1.pdf','2017-03-01','2017-03-31',0,'2017-03-09 05:39:29','2017-03-09 05:39:29',1,3),(17,'foro 4','foro 4/None/cronograma/Hoja_de_Vida_2017.pdf','2017-03-09','2017-04-01',0,'2017-03-11 14:29:46','2017-03-11 14:29:46',10,5);
/*!40000 ALTER TABLE `administrador_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_evento_colaboradores`
--

DROP TABLE IF EXISTS `administrador_evento_colaboradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_evento_colaboradores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `administrador_evento_colaboradores_evento_id_b300d301_uniq` (`evento_id`,`user_id`),
  KEY `administrador_evento_colaborado_user_id_0ebd5454_fk_auth_user_id` (`user_id`),
  CONSTRAINT `administrador_evento_colaborado_user_id_0ebd5454_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `administrador_even_evento_id_48bf8b47_fk_administrador_evento_id` FOREIGN KEY (`evento_id`) REFERENCES `administrador_evento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_evento_colaboradores`
--

LOCK TABLES `administrador_evento_colaboradores` WRITE;
/*!40000 ALTER TABLE `administrador_evento_colaboradores` DISABLE KEYS */;
INSERT INTO `administrador_evento_colaboradores` VALUES (3,2,1),(4,2,10),(5,3,10),(6,3,13),(8,4,10),(7,4,17),(10,5,11),(11,5,12),(9,5,17),(12,5,20),(14,6,12),(15,6,15),(13,6,17),(17,7,11),(18,7,12),(16,7,17),(19,8,12),(20,8,13),(21,8,15),(22,9,13),(23,9,15),(24,10,13),(25,10,15),(26,11,13),(27,11,15),(30,12,13),(28,12,17),(29,12,20),(31,13,17),(32,13,20),(33,14,17),(34,14,20),(35,15,17),(36,15,20),(37,16,17),(38,16,20),(39,17,10),(40,17,11),(41,17,12);
/*!40000 ALTER TABLE `administrador_evento_colaboradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_facultad`
--

DROP TABLE IF EXISTS `administrador_facultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_facultad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `fecha` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_facultad`
--

LOCK TABLES `administrador_facultad` WRITE;
/*!40000 ALTER TABLE `administrador_facultad` DISABLE KEYS */;
INSERT INTO `administrador_facultad` VALUES (1,'Ingenieria',1,'2017-02-20 01:54:31','2017-02-20 01:54:31'),(2,'Ciencias sociales y empresariales',1,'2017-02-20 02:30:52','2017-02-20 02:30:52');
/*!40000 ALTER TABLE `administrador_facultad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_foto`
--

DROP TABLE IF EXISTS `administrador_foto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_foto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruta` varchar(100) NOT NULL,
  `contenedor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `administrador_foto_b5b2cb6f` (`contenedor_id`),
  CONSTRAINT `administrador__contenedor_id_d9f1b197_fk_administrador_imagen_id` FOREIGN KEY (`contenedor_id`) REFERENCES `administrador_imagen` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_foto`
--

LOCK TABLES `administrador_foto` WRITE;
/*!40000 ALTER TABLE `administrador_foto` DISABLE KEYS */;
INSERT INTO `administrador_foto` VALUES (1,'edwar-amaya/imagenes/1962798_10152068408229398_1086857019_n.jpg',12),(2,'edwar-amaya/imagenes/13438858_697514127082836_792390390426189256_n.jpg',12),(3,'edwar-amaya/imagenes/13900173_574392132762474_5847904047563821793_n_RYMZnJa.jpg',12),(4,'edwar-amaya/imagenes/13935018_1304328316259162_3098341554181511736_n.jpg',12),(5,'lmape22/imagenes/4.jpg',13),(6,'lmape22/imagenes/6a00d8341bfb1653ef0191046f0140970c.jpg',13),(7,'lmape22/imagenes/11116197_10204010703169105_822587297_n.jpg',13),(8,'lmape22/imagenes/ar_ARTHC694_B.jpg',13),(9,'lmape22/imagenes/3D.png',14),(10,'lmape22/imagenes/3D1.png',14),(11,'lmape22/imagenes/4_zPqi6pY.jpg',14),(12,'lmape22/imagenes/6a00d8341bfb1653ef0191046f0140970c_tS3oxZF.jpg',14);
/*!40000 ALTER TABLE `administrador_foto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_imagen`
--

DROP TABLE IF EXISTS `administrador_imagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_imagen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `descripcion` longtext NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `eliminado` tinyint(1) NOT NULL,
  `fecha` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  `carrera_id` int(11) NOT NULL,
  `clase_id` int(11) NOT NULL,
  `evento_id` int(11) DEFAULT NULL,
  `propietario_id` int(11) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `administrador_im_carrera_id_af0dddb1_fk_administrador_carrera_id` (`carrera_id`),
  KEY `administrador_imagen_clase_id_9923c90d_fk_administrador_clase_id` (`clase_id`),
  KEY `administrador_imag_evento_id_081bb7ef_fk_administrador_evento_id` (`evento_id`),
  KEY `administrador_imagen_propietario_id_ecc3f756_fk_auth_user_id` (`propietario_id`),
  KEY `administrador_imagen_d3c0c18a` (`tipo_id`),
  CONSTRAINT `administrador_imagen_clase_id_9923c90d_fk_administrador_clase_id` FOREIGN KEY (`clase_id`) REFERENCES `administrador_clase` (`id`),
  CONSTRAINT `administrador_imagen_propietario_id_ecc3f756_fk_auth_user_id` FOREIGN KEY (`propietario_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `administrador_imagen_tipo_id_3fc5c706_fk_administrador_tipo_id` FOREIGN KEY (`tipo_id`) REFERENCES `administrador_tipo` (`id`),
  CONSTRAINT `administrador_imag_evento_id_081bb7ef_fk_administrador_evento_id` FOREIGN KEY (`evento_id`) REFERENCES `administrador_evento` (`id`),
  CONSTRAINT `administrador_im_carrera_id_af0dddb1_fk_administrador_carrera_id` FOREIGN KEY (`carrera_id`) REFERENCES `administrador_carrera` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_imagen`
--

LOCK TABLES `administrador_imagen` WRITE;
/*!40000 ALTER TABLE `administrador_imagen` DISABLE KEYS */;
INSERT INTO `administrador_imagen` VALUES (1,'Un gato','<p>Este gato si funciono caasi no!</p>',1,0,'2017-02-20 07:06:32','2017-02-24 20:15:33',1,2,NULL,10,1),(2,'curso 2017','<p>Prueba</p>',1,0,'2017-02-23 02:08:13','2017-02-24 20:15:39',1,2,2,13,2),(3,'Documento de prueba','<p>Descripci&oacute;n breve de la imagen&nbsp;</p>',1,0,'2017-02-24 16:09:28','2017-02-24 20:16:24',1,1,2,13,1),(4,'prueba multiple','<p>Una prueba multiple</p>',1,0,'2017-03-06 04:37:26','2017-03-08 17:26:03',1,2,NULL,1,1),(5,'Prueba','<p>Una prueba</p>',1,0,'2017-03-07 02:34:57','2017-03-08 17:31:52',1,1,NULL,10,1),(6,'Prueba','<p>Una prueba</p>',0,0,'2017-03-07 02:37:46','2017-03-08 17:47:14',1,1,NULL,10,1),(7,'Prueba','<p>Prueba</p>',0,0,'2017-03-07 02:38:42','2017-03-07 02:38:42',1,1,NULL,10,1),(8,'Prueba','<p>Prueba</p>',0,0,'2017-03-07 02:52:05','2017-03-07 02:52:05',1,1,NULL,10,1),(9,'Prueba','<p>Prueba</p>',0,0,'2017-03-07 02:53:30','2017-03-07 02:53:30',1,1,NULL,10,1),(10,'Prueba','<p>Prueba</p>',1,0,'2017-03-07 03:02:11','2017-03-11 14:21:51',1,1,NULL,10,1),(11,'Prueba','<p>Prueba</p>',1,0,'2017-03-07 03:18:49','2017-03-07 18:32:41',1,1,NULL,10,1),(12,'Prueba','<p>Prueba</p>',1,0,'2017-03-07 03:20:15','2017-03-07 18:31:22',1,1,NULL,10,1),(13,'Variedades','<p>Carga de imagenes multiples</p>',1,0,'2017-03-08 03:44:02','2017-03-08 17:32:00',2,2,3,13,2),(14,'Taller investigación 45','<p>Este contiene imagenes que evidencian el trabajo hecho en el taller el pasado 27 de febrero.</p>',1,0,'2017-03-08 17:31:41','2017-03-08 17:31:56',1,2,NULL,13,2);
/*!40000 ALTER TABLE `administrador_imagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_imagen_autor`
--

DROP TABLE IF EXISTS `administrador_imagen_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_imagen_autor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagen_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `administrador_imagen_autor_imagen_id_dcfba6d1_uniq` (`imagen_id`,`user_id`),
  KEY `administrador_imagen_autor_user_id_7e5916f2_fk_auth_user_id` (`user_id`),
  CONSTRAINT `administrador_imagen_autor_user_id_7e5916f2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `administrador_imag_imagen_id_2548e6a2_fk_administrador_imagen_id` FOREIGN KEY (`imagen_id`) REFERENCES `administrador_imagen` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_imagen_autor`
--

LOCK TABLES `administrador_imagen_autor` WRITE;
/*!40000 ALTER TABLE `administrador_imagen_autor` DISABLE KEYS */;
INSERT INTO `administrador_imagen_autor` VALUES (1,2,10),(2,3,10),(3,4,10),(4,5,13),(5,5,15),(6,6,13),(7,6,15),(8,7,13),(9,7,15),(10,8,13),(11,8,15),(12,9,13),(13,9,15),(14,10,13),(15,10,15),(16,11,13),(17,11,15),(18,12,13),(19,12,15),(20,13,1),(21,13,10),(22,14,1),(23,14,10);
/*!40000 ALTER TABLE `administrador_imagen_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_imagen_clave`
--

DROP TABLE IF EXISTS `administrador_imagen_clave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_imagen_clave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagen_id` int(11) NOT NULL,
  `clave_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `administrador_imagen_clave_imagen_id_b1970c78_uniq` (`imagen_id`,`clave_id`),
  KEY `administrador_imagen_clave_id_b11ceef0_fk_administrador_clave_id` (`clave_id`),
  CONSTRAINT `administrador_imagen_clave_id_b11ceef0_fk_administrador_clave_id` FOREIGN KEY (`clave_id`) REFERENCES `administrador_clave` (`id`),
  CONSTRAINT `administrador_imag_imagen_id_3da90a2e_fk_administrador_imagen_id` FOREIGN KEY (`imagen_id`) REFERENCES `administrador_imagen` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_imagen_clave`
--

LOCK TABLES `administrador_imagen_clave` WRITE;
/*!40000 ALTER TABLE `administrador_imagen_clave` DISABLE KEYS */;
INSERT INTO `administrador_imagen_clave` VALUES (1,1,1),(2,1,2),(3,2,2),(4,2,3),(5,3,2),(6,4,2),(7,4,3),(8,5,1),(9,5,2),(10,6,1),(11,6,2),(12,7,1),(13,7,2),(14,8,1),(15,8,2),(16,9,1),(17,9,2),(18,10,1),(19,10,2),(20,11,1),(21,11,2),(22,12,1),(23,12,2),(24,13,2),(25,14,3);
/*!40000 ALTER TABLE `administrador_imagen_clave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_imagen_tematica`
--

DROP TABLE IF EXISTS `administrador_imagen_tematica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_imagen_tematica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagen_id` int(11) NOT NULL,
  `tematica_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `administrador_imagen_tematica_imagen_id_56c9818b_uniq` (`imagen_id`,`tematica_id`),
  KEY `administrador__tematica_id_a971c12e_fk_administrador_tematica_id` (`tematica_id`),
  CONSTRAINT `administrador_imag_imagen_id_4d56ee8f_fk_administrador_imagen_id` FOREIGN KEY (`imagen_id`) REFERENCES `administrador_imagen` (`id`),
  CONSTRAINT `administrador__tematica_id_a971c12e_fk_administrador_tematica_id` FOREIGN KEY (`tematica_id`) REFERENCES `administrador_tematica` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_imagen_tematica`
--

LOCK TABLES `administrador_imagen_tematica` WRITE;
/*!40000 ALTER TABLE `administrador_imagen_tematica` DISABLE KEYS */;
INSERT INTO `administrador_imagen_tematica` VALUES (1,1,2),(2,1,6),(3,2,4),(4,2,5),(5,2,6),(6,3,1),(7,4,1),(8,4,5),(9,4,6),(10,5,1),(11,5,6),(12,6,1),(13,6,6),(14,7,1),(15,7,3),(16,7,6),(17,8,1),(18,8,3),(19,8,6),(20,9,1),(21,9,3),(22,9,6),(23,10,1),(24,10,3),(25,10,6),(26,11,1),(27,11,3),(28,11,6),(29,12,1),(30,12,3),(31,12,6),(32,13,2),(33,13,4),(34,13,5),(35,13,6),(36,14,4),(37,14,5),(38,14,6);
/*!40000 ALTER TABLE `administrador_imagen_tematica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_orador`
--

DROP TABLE IF EXISTS `administrador_orador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_orador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `documento` varchar(100) NOT NULL,
  `hv` varchar(100) NOT NULL,
  `llegada` date NOT NULL,
  `despedida` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_orador`
--

LOCK TABLES `administrador_orador` WRITE;
/*!40000 ALTER TABLE `administrador_orador` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrador_orador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_orador_conocimiento`
--

DROP TABLE IF EXISTS `administrador_orador_conocimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_orador_conocimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orador_id` int(11) NOT NULL,
  `areaconocimiento_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `administrador_orador_conocimiento_orador_id_7616eef5_uniq` (`orador_id`,`areaconocimiento_id`),
  KEY `D7914e35b2ceb4b1def9d3899157428c` (`areaconocimiento_id`),
  CONSTRAINT `administrador_orad_orador_id_4748f167_fk_administrador_orador_id` FOREIGN KEY (`orador_id`) REFERENCES `administrador_orador` (`id`),
  CONSTRAINT `D7914e35b2ceb4b1def9d3899157428c` FOREIGN KEY (`areaconocimiento_id`) REFERENCES `administrador_areaconocimiento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_orador_conocimiento`
--

LOCK TABLES `administrador_orador_conocimiento` WRITE;
/*!40000 ALTER TABLE `administrador_orador_conocimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrador_orador_conocimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_pdf`
--

DROP TABLE IF EXISTS `administrador_pdf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_pdf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` longtext NOT NULL,
  `ruta` varchar(100) NOT NULL,
  `descargable` tinyint(1) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `eliminado` tinyint(1) NOT NULL,
  `fecha` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  `carrera_id` int(11) NOT NULL,
  `clase_id` int(11) NOT NULL,
  `evento_id` int(11),
  `propietario_id` int(11) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `administrador_pdf_15b82638` (`carrera_id`),
  KEY `administrador_pdf_2aa3c485` (`clase_id`),
  KEY `administrador_pdf_afb29da0` (`evento_id`),
  KEY `administrador_pdf_e24036a9` (`propietario_id`),
  KEY `administrador_pdf_d3c0c18a` (`tipo_id`),
  CONSTRAINT `administrador_pdf_clase_id_f71c97c9_fk_administrador_clase_id` FOREIGN KEY (`clase_id`) REFERENCES `administrador_clase` (`id`),
  CONSTRAINT `administrador_pdf_evento_id_2e4fd18f_fk_administrador_evento_id` FOREIGN KEY (`evento_id`) REFERENCES `administrador_evento` (`id`),
  CONSTRAINT `administrador_pdf_propietario_id_7939800f_fk_auth_user_id` FOREIGN KEY (`propietario_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `administrador_pdf_tipo_id_56045295_fk_administrador_tipo_id` FOREIGN KEY (`tipo_id`) REFERENCES `administrador_tipo` (`id`),
  CONSTRAINT `administrador_pd_carrera_id_a5ed1eb8_fk_administrador_carrera_id` FOREIGN KEY (`carrera_id`) REFERENCES `administrador_carrera` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_pdf`
--

LOCK TABLES `administrador_pdf` WRITE;
/*!40000 ALTER TABLE `administrador_pdf` DISABLE KEYS */;
INSERT INTO `administrador_pdf` VALUES (2,'Prueba','<p>Este documento es una avance en el desarrollo educativo.</p>','edwar-amaya/pdf/cedula.pdf',1,1,0,'2017-02-20 05:57:54','2017-02-24 20:16:53',1,2,NULL,13,1),(3,'investigación tesis','<p>Este es un ejemplo de subida de archivos</p>','lmape22/pdf/CO7104458644_g7H7v2I.pdf',0,1,0,'2017-02-20 21:41:20','2017-02-20 21:44:33',2,1,2,13,2),(4,'Documento de presentación','<p>Este documento contiene informaci&oacute;n confidencial</p>','lmape22/pdf/volante31-12-2016.pdf',1,1,0,'2017-02-24 20:23:31','2017-02-24 20:25:07',1,2,3,13,2),(5,'Prueba 01','<p>Elemento de prueba para validar la lista.</p>','edwar-amaya/pdf/REFERENCIA_PERSONAL_N1.pdf',1,1,0,'2017-03-02 03:40:41','2017-03-02 03:41:06',1,2,NULL,10,2),(6,'Propietario','<p>Propietario</p>','edwar-amaya/pdf/cedula_yqZJqjl.pdf',0,1,0,'2017-03-08 05:42:21','2017-03-08 17:22:24',1,2,NULL,10,1),(7,'prueba propietario','<p>prueba propietario</p>','edwar-amaya/pdf/cedula_3PpV8qr.pdf',0,1,0,'2017-03-08 06:07:12','2017-03-08 17:22:26',1,1,NULL,10,1),(8,'Prueba 001','<p>Esto es una prueba</p>','edwar-amaya/pdf/ParcialFinal.pdf',1,1,0,'2017-03-11 14:25:23','2017-03-11 14:26:19',1,3,3,10,2);
/*!40000 ALTER TABLE `administrador_pdf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_pdf_autor`
--

DROP TABLE IF EXISTS `administrador_pdf_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_pdf_autor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pdf_id` int(11) NOT NULL,
  `perfil_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `administrador_pdf_autor_pdf_id_3c7e5649_uniq` (`pdf_id`,`perfil_id`),
  KEY `administrador_pdf__perfil_id_819ace98_fk_administrador_perfil_id` (`perfil_id`),
  CONSTRAINT `administrador_pdf_autor_pdf_id_a861d476_fk_administrador_pdf_id` FOREIGN KEY (`pdf_id`) REFERENCES `administrador_pdf` (`id`),
  CONSTRAINT `administrador_pdf__perfil_id_819ace98_fk_administrador_perfil_id` FOREIGN KEY (`perfil_id`) REFERENCES `administrador_perfil` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_pdf_autor`
--

LOCK TABLES `administrador_pdf_autor` WRITE;
/*!40000 ALTER TABLE `administrador_pdf_autor` DISABLE KEYS */;
INSERT INTO `administrador_pdf_autor` VALUES (3,3,5),(4,4,5),(6,5,1),(5,5,8),(8,6,5),(7,6,8),(10,7,7),(9,7,8),(11,8,8);
/*!40000 ALTER TABLE `administrador_pdf_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_pdf_clave`
--

DROP TABLE IF EXISTS `administrador_pdf_clave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_pdf_clave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pdf_id` int(11) NOT NULL,
  `clave_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `administrador_pdf_clave_pdf_id_d72c201b_uniq` (`pdf_id`,`clave_id`),
  KEY `administrador_pdf_cl_clave_id_0de656e6_fk_administrador_clave_id` (`clave_id`),
  CONSTRAINT `administrador_pdf_clave_pdf_id_80114ba9_fk_administrador_pdf_id` FOREIGN KEY (`pdf_id`) REFERENCES `administrador_pdf` (`id`),
  CONSTRAINT `administrador_pdf_cl_clave_id_0de656e6_fk_administrador_clave_id` FOREIGN KEY (`clave_id`) REFERENCES `administrador_clave` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_pdf_clave`
--

LOCK TABLES `administrador_pdf_clave` WRITE;
/*!40000 ALTER TABLE `administrador_pdf_clave` DISABLE KEYS */;
INSERT INTO `administrador_pdf_clave` VALUES (2,2,1),(3,2,2),(4,3,3),(5,4,1),(6,4,3),(7,5,1),(8,5,2),(9,6,1),(10,6,2),(11,7,1),(12,7,2),(13,8,1);
/*!40000 ALTER TABLE `administrador_pdf_clave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_pdf_tematica`
--

DROP TABLE IF EXISTS `administrador_pdf_tematica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_pdf_tematica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pdf_id` int(11) NOT NULL,
  `tematica_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `administrador_pdf_tematica_pdf_id_bfe02538_uniq` (`pdf_id`,`tematica_id`),
  KEY `administrador__tematica_id_f4288cb0_fk_administrador_tematica_id` (`tematica_id`),
  CONSTRAINT `administrador_pdf_temati_pdf_id_ca123537_fk_administrador_pdf_id` FOREIGN KEY (`pdf_id`) REFERENCES `administrador_pdf` (`id`),
  CONSTRAINT `administrador__tematica_id_f4288cb0_fk_administrador_tematica_id` FOREIGN KEY (`tematica_id`) REFERENCES `administrador_tematica` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_pdf_tematica`
--

LOCK TABLES `administrador_pdf_tematica` WRITE;
/*!40000 ALTER TABLE `administrador_pdf_tematica` DISABLE KEYS */;
INSERT INTO `administrador_pdf_tematica` VALUES (2,2,1),(3,2,2),(4,2,5),(5,3,5),(6,4,2),(7,4,4),(8,4,5),(9,5,2),(10,5,3),(11,5,5),(12,5,6),(13,6,2),(14,6,5),(15,6,6),(16,7,2),(17,7,4),(18,7,5),(19,8,5),(20,8,6);
/*!40000 ALTER TABLE `administrador_pdf_tematica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_pdfvisto`
--

DROP TABLE IF EXISTS `administrador_pdfvisto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_pdfvisto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contador` int(11) NOT NULL,
  `pdf_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `administrador_pdfvisto_pdf_id_b1e1f26f_fk_administrador_pdf_id` (`pdf_id`),
  CONSTRAINT `administrador_pdfvisto_pdf_id_b1e1f26f_fk_administrador_pdf_id` FOREIGN KEY (`pdf_id`) REFERENCES `administrador_pdf` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_pdfvisto`
--

LOCK TABLES `administrador_pdfvisto` WRITE;
/*!40000 ALTER TABLE `administrador_pdfvisto` DISABLE KEYS */;
INSERT INTO `administrador_pdfvisto` VALUES (2,57,2),(3,50,3),(4,4,4),(5,1,6),(6,1,8);
/*!40000 ALTER TABLE `administrador_pdfvisto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_pdfvisualizacion`
--

DROP TABLE IF EXISTS `administrador_pdfvisualizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_pdfvisualizacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_pdfvisualizacion`
--

LOCK TABLES `administrador_pdfvisualizacion` WRITE;
/*!40000 ALTER TABLE `administrador_pdfvisualizacion` DISABLE KEYS */;
INSERT INTO `administrador_pdfvisualizacion` VALUES (1,'2017-02-19'),(2,'2017-02-19'),(3,'2017-02-20'),(4,'2017-02-20'),(5,'2017-02-20'),(6,'2017-02-20'),(7,'2017-02-20'),(8,'2017-02-20'),(9,'2017-02-20'),(10,'2017-02-21'),(11,'2017-02-21'),(12,'2017-02-21'),(13,'2017-02-21'),(14,'2017-02-21'),(15,'2017-02-21'),(16,'2017-02-21'),(17,'2017-02-21'),(18,'2017-02-21'),(19,'2017-02-21'),(20,'2017-02-21'),(21,'2017-02-22'),(22,'2017-02-22'),(23,'2017-02-22'),(24,'2017-02-22'),(25,'2017-02-22'),(26,'2017-02-22'),(27,'2017-02-22'),(28,'2017-02-22'),(29,'2017-02-22'),(30,'2017-02-23'),(31,'2017-02-23'),(32,'2017-02-23'),(33,'2017-02-23'),(34,'2017-02-23'),(35,'2017-02-23'),(36,'2017-02-23'),(37,'2017-02-23'),(38,'2017-02-23'),(39,'2017-02-23'),(40,'2017-02-23'),(41,'2017-02-23'),(42,'2017-02-23'),(43,'2017-02-23'),(44,'2017-02-23'),(45,'2017-02-23'),(46,'2017-02-23'),(47,'2017-02-23'),(48,'2017-02-23'),(49,'2017-02-23'),(50,'2017-02-23'),(51,'2017-02-23'),(52,'2017-02-23'),(53,'2017-02-23'),(54,'2017-02-23'),(55,'2017-02-23'),(56,'2017-02-23'),(57,'2017-02-23'),(58,'2017-02-23'),(59,'2017-02-23'),(60,'2017-02-23'),(61,'2017-02-23'),(62,'2017-02-23'),(63,'2017-02-23'),(64,'2017-02-23'),(65,'2017-02-23'),(66,'2017-02-23'),(67,'2017-02-23'),(68,'2017-02-23'),(69,'2017-02-23'),(70,'2017-02-23'),(71,'2017-02-23'),(72,'2017-02-23'),(73,'2017-02-23'),(74,'2017-02-23'),(75,'2017-02-23'),(76,'2017-02-24'),(77,'2017-02-24'),(78,'2017-02-24'),(79,'2017-02-24'),(80,'2017-02-24'),(81,'2017-02-24'),(82,'2017-02-24'),(83,'2017-02-24'),(84,'2017-02-25'),(85,'2017-02-25'),(86,'2017-02-25'),(87,'2017-02-27'),(88,'2017-03-01'),(89,'2017-03-01'),(90,'2017-03-01'),(91,'2017-03-01'),(92,'2017-03-01'),(93,'2017-03-05'),(94,'2017-03-06'),(95,'2017-03-06'),(96,'2017-03-07'),(97,'2017-03-08'),(98,'2017-03-08'),(99,'2017-03-08'),(100,'2017-03-08'),(101,'2017-03-10'),(102,'2017-03-11'),(103,'2017-03-11'),(104,'2017-03-11'),(105,'2017-03-11'),(106,'2017-03-11'),(107,'2017-03-11'),(108,'2017-03-11'),(109,'2017-03-11'),(110,'2017-03-11'),(111,'2017-03-11'),(112,'2017-03-11'),(113,'2017-03-11'),(114,'2017-03-11'),(115,'2017-03-11'),(116,'2017-03-11'),(117,'2017-03-11'),(118,'2017-03-11');
/*!40000 ALTER TABLE `administrador_pdfvisualizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_perfil`
--

DROP TABLE IF EXISTS `administrador_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(100) DEFAULT NULL,
  `codigo` varchar(15) DEFAULT NULL,
  `activation_key` varchar(40) NOT NULL,
  `key_expires` datetime NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `fecha` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  `sede_id` int(11),
  `usuario_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id` (`usuario_id`),
  KEY `administrador_perfil_0687f864` (`sede_id`),
  CONSTRAINT `administrador_perfil_sede_id_6597aafd_fk_administrador_sede_id` FOREIGN KEY (`sede_id`) REFERENCES `administrador_sede` (`id`),
  CONSTRAINT `administrador_perfil_usuario_id_55306578_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_perfil`
--

LOCK TABLES `administrador_perfil` WRITE;
/*!40000 ALTER TABLE `administrador_perfil` DISABLE KEYS */;
INSERT INTO `administrador_perfil` VALUES (1,'admin/avatar/edwar_1.jpg','21120115','ergwerg','2017-03-01 02:40:00',1,'2017-02-20 02:43:17','2017-02-23 20:20:15',1,1),(5,'edwar-amaya/avatar/edwar.jpg','21120115','83bbb5c6be0d2ff4db201379ca6660d087414375','2017-02-22 05:09:56',1,'2017-02-20 05:09:56','2017-02-20 05:12:10',1,10),(6,'jurado1/avatar/jurado1.png','','erger','2017-02-22 13:40:00',1,'2017-02-20 13:38:45','2017-02-20 13:45:45',1,11),(7,'jurado2/avatar/jurado2.png','','e5wehet','2017-02-21 13:40:00',1,'2017-02-20 13:39:08','2017-02-20 13:45:54',1,12),(8,'lmape22/avatar/perfil_q9V6z4J.jpg','21120045','cb2b2458e6cace735dbd9938e8d5ff27296c2b16','2017-02-22 20:24:54',1,'2017-02-20 20:24:54','2017-02-20 20:34:12',1,13),(9,'',NULL,'dd352afd194a166887af828508aba52733113ef9','2017-03-11 00:04:39',1,'2017-03-09 00:04:39','2017-03-09 00:04:39',NULL,20);
/*!40000 ALTER TABLE `administrador_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_perfil_carrera`
--

DROP TABLE IF EXISTS `administrador_perfil_carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_perfil_carrera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perfil_id` int(11) NOT NULL,
  `carrera_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `administrador_perfil_carrera_perfil_id_7ddedb46_uniq` (`perfil_id`,`carrera_id`),
  KEY `administrador_pe_carrera_id_e2441aed_fk_administrador_carrera_id` (`carrera_id`),
  CONSTRAINT `administrador_perf_perfil_id_3b270306_fk_administrador_perfil_id` FOREIGN KEY (`perfil_id`) REFERENCES `administrador_perfil` (`id`),
  CONSTRAINT `administrador_pe_carrera_id_e2441aed_fk_administrador_carrera_id` FOREIGN KEY (`carrera_id`) REFERENCES `administrador_carrera` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_perfil_carrera`
--

LOCK TABLES `administrador_perfil_carrera` WRITE;
/*!40000 ALTER TABLE `administrador_perfil_carrera` DISABLE KEYS */;
INSERT INTO `administrador_perfil_carrera` VALUES (1,1,2),(5,5,2),(6,8,2);
/*!40000 ALTER TABLE `administrador_perfil_carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_sede`
--

DROP TABLE IF EXISTS `administrador_sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_sede` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `pais` varchar(35) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `fecha` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_sede`
--

LOCK TABLES `administrador_sede` WRITE;
/*!40000 ALTER TABLE `administrador_sede` DISABLE KEYS */;
INSERT INTO `administrador_sede` VALUES (1,'Universidad piloto de Colombia (SAM)','Colombia','Girardot','Carrera 19 # 17-33',1,'2017-02-20 02:34:27','2017-02-20 02:34:27');
/*!40000 ALTER TABLE `administrador_sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_tarea`
--

DROP TABLE IF EXISTS `administrador_tarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_tarea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `fecha` datetime NOT NULL,
  `prioridad` int(11) NOT NULL,
  `hecho` tinyint(1) NOT NULL,
  `evento_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `administrador_tare_evento_id_1609b5b1_fk_administrador_evento_id` (`evento_id`),
  CONSTRAINT `administrador_tare_evento_id_1609b5b1_fk_administrador_evento_id` FOREIGN KEY (`evento_id`) REFERENCES `administrador_evento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_tarea`
--

LOCK TABLES `administrador_tarea` WRITE;
/*!40000 ALTER TABLE `administrador_tarea` DISABLE KEYS */;
INSERT INTO `administrador_tarea` VALUES (2,'Conseguri patrocinio','2017-02-20 20:27:28',3,1,2),(3,'Mirar costos de hospedaje','2017-02-24 16:20:30',3,0,3),(4,'Tarea 1','2017-03-11 14:33:41',2,1,5),(5,'Tarea 2','2017-03-11 14:33:57',1,0,5);
/*!40000 ALTER TABLE `administrador_tarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_tematica`
--

DROP TABLE IF EXISTS `administrador_tematica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_tematica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `fecha` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_tematica`
--

LOCK TABLES `administrador_tematica` WRITE;
/*!40000 ALTER TABLE `administrador_tematica` DISABLE KEYS */;
INSERT INTO `administrador_tematica` VALUES (1,'Contable y financiera',1,'2017-02-20 02:35:19','2017-02-20 02:35:19'),(2,'Económico y administrativo',1,'2017-02-20 02:35:33','2017-02-20 02:35:33'),(3,'Jurídico',1,'2017-02-20 02:35:47','2017-02-20 02:35:47'),(4,'Área de humanidades',1,'2017-02-20 02:36:01','2017-02-20 02:36:01'),(5,'Área de informatica',1,'2017-02-20 02:36:17','2017-02-20 02:36:17'),(6,'Área de matematicas',1,'2017-02-20 02:36:28','2017-02-20 02:36:28');
/*!40000 ALTER TABLE `administrador_tematica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_texto`
--

DROP TABLE IF EXISTS `administrador_texto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_texto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `texto` longtext NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `eliminado` tinyint(1) NOT NULL,
  `fecha` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  `carrera_id` int(11) NOT NULL,
  `clase_id` int(11) NOT NULL,
  `evento_id` int(11) DEFAULT NULL,
  `propietario_id` int(11) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `administrador_te_carrera_id_7b59c369_fk_administrador_carrera_id` (`carrera_id`),
  KEY `administrador_texto_clase_id_afa3908c_fk_administrador_clase_id` (`clase_id`),
  KEY `administrador_text_evento_id_109222fa_fk_administrador_evento_id` (`evento_id`),
  KEY `administrador_texto_propietario_id_a01b7339_fk_auth_user_id` (`propietario_id`),
  KEY `administrador_texto_d3c0c18a` (`tipo_id`),
  CONSTRAINT `administrador_texto_clase_id_afa3908c_fk_administrador_clase_id` FOREIGN KEY (`clase_id`) REFERENCES `administrador_clase` (`id`),
  CONSTRAINT `administrador_texto_propietario_id_a01b7339_fk_auth_user_id` FOREIGN KEY (`propietario_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `administrador_texto_tipo_id_627fedd1_fk_administrador_tipo_id` FOREIGN KEY (`tipo_id`) REFERENCES `administrador_tipo` (`id`),
  CONSTRAINT `administrador_text_evento_id_109222fa_fk_administrador_evento_id` FOREIGN KEY (`evento_id`) REFERENCES `administrador_evento` (`id`),
  CONSTRAINT `administrador_te_carrera_id_7b59c369_fk_administrador_carrera_id` FOREIGN KEY (`carrera_id`) REFERENCES `administrador_carrera` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_texto`
--

LOCK TABLES `administrador_texto` WRITE;
/*!40000 ALTER TABLE `administrador_texto` DISABLE KEYS */;
INSERT INTO `administrador_texto` VALUES (1,'Ya casi nos graduamos','<p>Este texto al cargar correctamente es un paso mas en el camino a exito.</p>',1,0,'2017-02-20 05:59:09','2017-02-24 20:17:29',1,2,NULL,10,2),(2,'Planes','<p>Los planes que hay para este 2017</p>',1,0,'2017-02-23 01:17:44','2017-02-23 01:18:05',1,1,NULL,10,2),(3,'Plan de contingencia','<p>Esto no es real ;)</p>',1,0,'2017-02-23 02:07:04','2017-02-23 02:14:45',1,1,2,13,2),(4,'Prueba 1','<p>Prueba</p>',1,0,'2017-02-24 02:24:06','2017-02-24 02:24:49',1,2,NULL,13,2),(5,'Documento de las pruebas de carga','<p>Este documento contiene informaci&oacute;n confidencial</p>',1,0,'2017-02-24 20:24:16','2017-02-24 20:25:10',1,1,3,13,2),(6,'prueba propietario','<p>prueba propietario</p>',1,0,'2017-03-08 06:07:53','2017-03-08 17:25:41',1,2,NULL,10,1);
/*!40000 ALTER TABLE `administrador_texto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_texto_clave`
--

DROP TABLE IF EXISTS `administrador_texto_clave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_texto_clave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `texto_id` int(11) NOT NULL,
  `clave_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `administrador_texto_clave_texto_id_db61b9fc_uniq` (`texto_id`,`clave_id`),
  KEY `administrador_texto__clave_id_31c79f2b_fk_administrador_clave_id` (`clave_id`),
  CONSTRAINT `administrador_texto__clave_id_31c79f2b_fk_administrador_clave_id` FOREIGN KEY (`clave_id`) REFERENCES `administrador_clave` (`id`),
  CONSTRAINT `administrador_texto__texto_id_4808f4be_fk_administrador_texto_id` FOREIGN KEY (`texto_id`) REFERENCES `administrador_texto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_texto_clave`
--

LOCK TABLES `administrador_texto_clave` WRITE;
/*!40000 ALTER TABLE `administrador_texto_clave` DISABLE KEYS */;
INSERT INTO `administrador_texto_clave` VALUES (1,1,2),(2,2,1),(3,2,2),(4,3,2),(5,3,3),(6,4,3),(7,5,1),(8,5,2),(9,5,3),(10,6,2),(11,6,3);
/*!40000 ALTER TABLE `administrador_texto_clave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_texto_colaborador`
--

DROP TABLE IF EXISTS `administrador_texto_colaborador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_texto_colaborador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `texto_id` int(11) NOT NULL,
  `perfil_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `administrador_texto_colaborador_texto_id_cf462b6c_uniq` (`texto_id`,`perfil_id`),
  KEY `administrador_text_perfil_id_91f8d83c_fk_administrador_perfil_id` (`perfil_id`),
  CONSTRAINT `administrador_texto__texto_id_1ad3b1ba_fk_administrador_texto_id` FOREIGN KEY (`texto_id`) REFERENCES `administrador_texto` (`id`),
  CONSTRAINT `administrador_text_perfil_id_91f8d83c_fk_administrador_perfil_id` FOREIGN KEY (`perfil_id`) REFERENCES `administrador_perfil` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_texto_colaborador`
--

LOCK TABLES `administrador_texto_colaborador` WRITE;
/*!40000 ALTER TABLE `administrador_texto_colaborador` DISABLE KEYS */;
INSERT INTO `administrador_texto_colaborador` VALUES (2,2,1),(1,2,8),(3,3,5),(4,4,5),(5,5,5),(6,6,8);
/*!40000 ALTER TABLE `administrador_texto_colaborador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_texto_tematica`
--

DROP TABLE IF EXISTS `administrador_texto_tematica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_texto_tematica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `texto_id` int(11) NOT NULL,
  `tematica_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `administrador_texto_tematica_texto_id_94b23eb0_uniq` (`texto_id`,`tematica_id`),
  KEY `administrador__tematica_id_68663594_fk_administrador_tematica_id` (`tematica_id`),
  CONSTRAINT `administrador_texto__texto_id_9f71710d_fk_administrador_texto_id` FOREIGN KEY (`texto_id`) REFERENCES `administrador_texto` (`id`),
  CONSTRAINT `administrador__tematica_id_68663594_fk_administrador_tematica_id` FOREIGN KEY (`tematica_id`) REFERENCES `administrador_tematica` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_texto_tematica`
--

LOCK TABLES `administrador_texto_tematica` WRITE;
/*!40000 ALTER TABLE `administrador_texto_tematica` DISABLE KEYS */;
INSERT INTO `administrador_texto_tematica` VALUES (1,1,1),(2,1,3),(3,1,4),(4,1,5),(5,2,2),(6,2,6),(7,3,4),(8,3,5),(9,3,6),(10,4,4),(11,4,5),(12,4,6),(13,5,4),(14,5,5),(15,6,1),(16,6,2),(17,6,3),(18,6,5),(19,6,6);
/*!40000 ALTER TABLE `administrador_texto_tematica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_textovisto`
--

DROP TABLE IF EXISTS `administrador_textovisto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_textovisto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contador` int(11) NOT NULL,
  `texto_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `administrador_textov_texto_id_181624d6_fk_administrador_texto_id` (`texto_id`),
  CONSTRAINT `administrador_textov_texto_id_181624d6_fk_administrador_texto_id` FOREIGN KEY (`texto_id`) REFERENCES `administrador_texto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_textovisto`
--

LOCK TABLES `administrador_textovisto` WRITE;
/*!40000 ALTER TABLE `administrador_textovisto` DISABLE KEYS */;
INSERT INTO `administrador_textovisto` VALUES (1,20,1),(2,5,2),(3,13,3),(4,3,4),(5,2,5);
/*!40000 ALTER TABLE `administrador_textovisto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_textovisualizacion`
--

DROP TABLE IF EXISTS `administrador_textovisualizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_textovisualizacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_textovisualizacion`
--

LOCK TABLES `administrador_textovisualizacion` WRITE;
/*!40000 ALTER TABLE `administrador_textovisualizacion` DISABLE KEYS */;
INSERT INTO `administrador_textovisualizacion` VALUES (1,'2017-02-20'),(2,'2017-02-20'),(3,'2017-02-20'),(4,'2017-02-22'),(5,'2017-02-22'),(6,'2017-02-22'),(7,'2017-02-22'),(8,'2017-02-22'),(9,'2017-02-22'),(10,'2017-02-22'),(11,'2017-02-23'),(12,'2017-02-23'),(13,'2017-02-23'),(14,'2017-02-23'),(15,'2017-02-23'),(16,'2017-02-23'),(17,'2017-02-23'),(18,'2017-02-23'),(19,'2017-02-24'),(20,'2017-02-24'),(21,'2017-02-24'),(22,'2017-02-24'),(23,'2017-02-24'),(24,'2017-02-24'),(25,'2017-02-24'),(26,'2017-02-27'),(27,'2017-03-01'),(28,'2017-03-01'),(29,'2017-03-01'),(30,'2017-03-01'),(31,'2017-03-01'),(32,'2017-03-01'),(33,'2017-03-01'),(34,'2017-03-01'),(35,'2017-03-01'),(36,'2017-03-01'),(37,'2017-03-07'),(38,'2017-03-07'),(39,'2017-03-08'),(40,'2017-03-08'),(41,'2017-03-09'),(42,'2017-03-09'),(43,'2017-03-09');
/*!40000 ALTER TABLE `administrador_textovisualizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_tipo`
--

DROP TABLE IF EXISTS `administrador_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `fecha` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_tipo`
--

LOCK TABLES `administrador_tipo` WRITE;
/*!40000 ALTER TABLE `administrador_tipo` DISABLE KEYS */;
INSERT INTO `administrador_tipo` VALUES (1,'Privado',1,'2017-02-20 02:37:23','2017-02-20 02:37:23'),(2,'Público',1,'2017-02-20 02:37:34','2017-02-20 02:37:34');
/*!40000 ALTER TABLE `administrador_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_tipoevento`
--

DROP TABLE IF EXISTS `administrador_tipoevento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_tipoevento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `fecha` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_tipoevento`
--

LOCK TABLES `administrador_tipoevento` WRITE;
/*!40000 ALTER TABLE `administrador_tipoevento` DISABLE KEYS */;
INSERT INTO `administrador_tipoevento` VALUES (1,'Foros',1,'2017-02-20 02:37:57','2017-02-20 02:37:57'),(2,'Taller',1,'2017-02-20 02:38:06','2017-02-20 02:38:06'),(3,'Working paper',1,'2017-02-20 02:38:38','2017-02-20 02:39:34'),(4,'Conferencia',1,'2017-02-20 02:38:53','2017-02-20 02:38:53'),(5,'Diplomado',1,'2017-02-20 02:39:10','2017-02-20 02:39:25'),(6,'Curso',1,'2017-02-20 02:40:22','2017-02-20 02:40:22');
/*!40000 ALTER TABLE `administrador_tipoevento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_tipoorador`
--

DROP TABLE IF EXISTS `administrador_tipoorador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_tipoorador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `fecha` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_tipoorador`
--

LOCK TABLES `administrador_tipoorador` WRITE;
/*!40000 ALTER TABLE `administrador_tipoorador` DISABLE KEYS */;
INSERT INTO `administrador_tipoorador` VALUES (1,'Externo',1,'2017-02-20 02:40:43','2017-02-20 02:40:43'),(2,'Estudiante',1,'2017-02-20 02:40:52','2017-02-20 02:40:52'),(3,'Docente',1,'2017-02-20 02:41:05','2017-02-20 02:41:05');
/*!40000 ALTER TABLE `administrador_tipoorador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_video`
--

DROP TABLE IF EXISTS `administrador_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` longtext NOT NULL,
  `ruta` varchar(100) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `eliminado` tinyint(1) NOT NULL,
  `fecha` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  `carrera_id` int(11) NOT NULL,
  `clase_id` int(11) NOT NULL,
  `evento_id` int(11) DEFAULT NULL,
  `propietario_id` int(11) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `administrador_vi_carrera_id_dfbb9a70_fk_administrador_carrera_id` (`carrera_id`),
  KEY `administrador_video_clase_id_0bdf9bd2_fk_administrador_clase_id` (`clase_id`),
  KEY `administrador_vide_evento_id_46086a81_fk_administrador_evento_id` (`evento_id`),
  KEY `administrador_video_propietario_id_39918635_fk_auth_user_id` (`propietario_id`),
  KEY `administrador_video_tipo_id_487300ef_fk_administrador_tipo_id` (`tipo_id`),
  CONSTRAINT `administrador_video_clase_id_0bdf9bd2_fk_administrador_clase_id` FOREIGN KEY (`clase_id`) REFERENCES `administrador_clase` (`id`),
  CONSTRAINT `administrador_video_propietario_id_39918635_fk_auth_user_id` FOREIGN KEY (`propietario_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `administrador_video_tipo_id_487300ef_fk_administrador_tipo_id` FOREIGN KEY (`tipo_id`) REFERENCES `administrador_tipo` (`id`),
  CONSTRAINT `administrador_vide_evento_id_46086a81_fk_administrador_evento_id` FOREIGN KEY (`evento_id`) REFERENCES `administrador_evento` (`id`),
  CONSTRAINT `administrador_vi_carrera_id_dfbb9a70_fk_administrador_carrera_id` FOREIGN KEY (`carrera_id`) REFERENCES `administrador_carrera` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_video`
--

LOCK TABLES `administrador_video` WRITE;
/*!40000 ALTER TABLE `administrador_video` DISABLE KEYS */;
INSERT INTO `administrador_video` VALUES (1,'<p>Un video vergonzoso en el cual canto muy mal.</p>','edwar-amaya/videos/FDS_muy_divertido_con_Miguel_Mape_y_Kate_Campo..._-_Edwar_Amaya_Diaz.MP4',1,0,'2017-02-20 06:10:08','2017-02-24 20:19:08',1,2,NULL,10,1,'Prueba'),(2,'<p>Video prueba de carga</p>','lmape22/videos/Proyecto_SAP_Navidaddescargaryoutube.com.mp4',1,0,'2017-02-23 17:06:23','2017-02-23 17:08:20',1,1,2,13,2,'Prueba');
/*!40000 ALTER TABLE `administrador_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_video_autor`
--

DROP TABLE IF EXISTS `administrador_video_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_video_autor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `perfil_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `administrador_video_autor_video_id_4d2cce9d_uniq` (`video_id`,`perfil_id`),
  KEY `administrador_vide_perfil_id_409d7376_fk_administrador_perfil_id` (`perfil_id`),
  CONSTRAINT `administrador_video__video_id_e7205264_fk_administrador_video_id` FOREIGN KEY (`video_id`) REFERENCES `administrador_video` (`id`),
  CONSTRAINT `administrador_vide_perfil_id_409d7376_fk_administrador_perfil_id` FOREIGN KEY (`perfil_id`) REFERENCES `administrador_perfil` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_video_autor`
--

LOCK TABLES `administrador_video_autor` WRITE;
/*!40000 ALTER TABLE `administrador_video_autor` DISABLE KEYS */;
INSERT INTO `administrador_video_autor` VALUES (1,2,5);
/*!40000 ALTER TABLE `administrador_video_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_video_clave`
--

DROP TABLE IF EXISTS `administrador_video_clave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_video_clave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `clave_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `administrador_video_clave_video_id_f7c820b2_uniq` (`video_id`,`clave_id`),
  KEY `administrador_video__clave_id_994feda6_fk_administrador_clave_id` (`clave_id`),
  CONSTRAINT `administrador_video__clave_id_994feda6_fk_administrador_clave_id` FOREIGN KEY (`clave_id`) REFERENCES `administrador_clave` (`id`),
  CONSTRAINT `administrador_video__video_id_3932014f_fk_administrador_video_id` FOREIGN KEY (`video_id`) REFERENCES `administrador_video` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_video_clave`
--

LOCK TABLES `administrador_video_clave` WRITE;
/*!40000 ALTER TABLE `administrador_video_clave` DISABLE KEYS */;
INSERT INTO `administrador_video_clave` VALUES (1,1,1),(2,1,2),(3,2,1);
/*!40000 ALTER TABLE `administrador_video_clave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_video_tematica`
--

DROP TABLE IF EXISTS `administrador_video_tematica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_video_tematica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `tematica_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `administrador_video_tematica_video_id_b08f96d8_uniq` (`video_id`,`tematica_id`),
  KEY `administrador__tematica_id_2498c991_fk_administrador_tematica_id` (`tematica_id`),
  CONSTRAINT `administrador_video__video_id_22bd0d31_fk_administrador_video_id` FOREIGN KEY (`video_id`) REFERENCES `administrador_video` (`id`),
  CONSTRAINT `administrador__tematica_id_2498c991_fk_administrador_tematica_id` FOREIGN KEY (`tematica_id`) REFERENCES `administrador_tematica` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_video_tematica`
--

LOCK TABLES `administrador_video_tematica` WRITE;
/*!40000 ALTER TABLE `administrador_video_tematica` DISABLE KEYS */;
INSERT INTO `administrador_video_tematica` VALUES (1,1,2),(2,1,5),(3,1,6),(4,2,5);
/*!40000 ALTER TABLE `administrador_video_tematica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_videovisto`
--

DROP TABLE IF EXISTS `administrador_videovisto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_videovisto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contador` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `administrador_videov_video_id_e77c3111_fk_administrador_video_id` (`video_id`),
  CONSTRAINT `administrador_videov_video_id_e77c3111_fk_administrador_video_id` FOREIGN KEY (`video_id`) REFERENCES `administrador_video` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_videovisto`
--

LOCK TABLES `administrador_videovisto` WRITE;
/*!40000 ALTER TABLE `administrador_videovisto` DISABLE KEYS */;
INSERT INTO `administrador_videovisto` VALUES (1,46,1),(2,24,2);
/*!40000 ALTER TABLE `administrador_videovisto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador_videovisualizacion`
--

DROP TABLE IF EXISTS `administrador_videovisualizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador_videovisualizacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_videovisualizacion`
--

LOCK TABLES `administrador_videovisualizacion` WRITE;
/*!40000 ALTER TABLE `administrador_videovisualizacion` DISABLE KEYS */;
INSERT INTO `administrador_videovisualizacion` VALUES (1,'2017-02-20'),(2,'2017-02-20'),(3,'2017-02-21'),(4,'2017-02-21'),(5,'2017-02-21'),(6,'2017-02-21'),(7,'2017-02-21'),(8,'2017-02-21'),(9,'2017-02-21'),(10,'2017-02-21'),(11,'2017-02-22'),(12,'2017-02-22'),(13,'2017-02-23'),(14,'2017-02-23'),(15,'2017-02-23'),(16,'2017-02-23'),(17,'2017-02-23'),(18,'2017-02-24'),(19,'2017-02-24'),(20,'2017-02-24'),(21,'2017-02-24'),(22,'2017-02-24'),(23,'2017-02-28'),(24,'2017-02-28'),(25,'2017-02-28'),(26,'2017-02-28'),(27,'2017-02-28'),(28,'2017-02-28'),(29,'2017-02-28'),(30,'2017-02-28'),(31,'2017-02-28'),(32,'2017-02-28'),(33,'2017-02-28'),(34,'2017-02-28'),(35,'2017-02-28'),(36,'2017-02-28'),(37,'2017-02-28'),(38,'2017-02-28'),(39,'2017-02-28'),(40,'2017-02-28'),(41,'2017-02-28'),(42,'2017-02-28'),(43,'2017-02-28'),(44,'2017-02-28'),(45,'2017-02-28'),(46,'2017-02-28'),(47,'2017-02-28'),(48,'2017-02-28'),(49,'2017-02-28'),(50,'2017-02-28'),(51,'2017-02-28'),(52,'2017-02-28'),(53,'2017-02-28'),(54,'2017-02-28'),(55,'2017-02-28'),(56,'2017-02-28'),(57,'2017-02-28'),(58,'2017-02-28'),(59,'2017-02-28'),(60,'2017-02-28'),(61,'2017-02-28'),(62,'2017-02-28'),(63,'2017-03-01'),(64,'2017-03-01'),(65,'2017-03-01'),(66,'2017-03-05'),(67,'2017-03-07'),(68,'2017-03-08'),(69,'2017-03-08'),(70,'2017-03-10');
/*!40000 ALTER TABLE `administrador_videovisualizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add user dashboard module',1,'add_userdashboardmodule'),(2,'Can change user dashboard module',1,'change_userdashboardmodule'),(3,'Can delete user dashboard module',1,'delete_userdashboardmodule'),(4,'Can add bookmark',2,'add_bookmark'),(5,'Can change bookmark',2,'change_bookmark'),(6,'Can delete bookmark',2,'delete_bookmark'),(7,'Can add pinned application',3,'add_pinnedapplication'),(8,'Can change pinned application',3,'change_pinnedapplication'),(9,'Can delete pinned application',3,'delete_pinnedapplication'),(10,'Can add log entry',4,'add_logentry'),(11,'Can change log entry',4,'change_logentry'),(12,'Can delete log entry',4,'delete_logentry'),(13,'Can add group',5,'add_group'),(14,'Can change group',5,'change_group'),(15,'Can delete group',5,'delete_group'),(16,'Can add permission',6,'add_permission'),(17,'Can change permission',6,'change_permission'),(18,'Can delete permission',6,'delete_permission'),(19,'Can add user',7,'add_user'),(20,'Can change user',7,'change_user'),(21,'Can delete user',7,'delete_user'),(22,'Can add content type',8,'add_contenttype'),(23,'Can change content type',8,'change_contenttype'),(24,'Can delete content type',8,'delete_contenttype'),(25,'Can add session',9,'add_session'),(26,'Can change session',9,'change_session'),(27,'Can delete session',9,'delete_session'),(28,'Can add audio visualizacion',10,'add_audiovisualizacion'),(29,'Can change audio visualizacion',10,'change_audiovisualizacion'),(30,'Can delete audio visualizacion',10,'delete_audiovisualizacion'),(31,'Can add Dominio',11,'add_dominio'),(32,'Can change Dominio',11,'change_dominio'),(33,'Can delete Dominio',11,'delete_dominio'),(34,'Can add Area de conocimiento',12,'add_areaconocimiento'),(35,'Can change Area de conocimiento',12,'change_areaconocimiento'),(36,'Can delete Area de conocimiento',12,'delete_areaconocimiento'),(37,'Can add Orador',13,'add_orador'),(38,'Can change Orador',13,'change_orador'),(39,'Can delete Orador',13,'delete_orador'),(40,'Can add pdf visualizacion',14,'add_pdfvisualizacion'),(41,'Can change pdf visualizacion',14,'change_pdfvisualizacion'),(42,'Can delete pdf visualizacion',14,'delete_pdfvisualizacion'),(43,'Can add texto visualizacion',15,'add_textovisualizacion'),(44,'Can change texto visualizacion',15,'change_textovisualizacion'),(45,'Can delete texto visualizacion',15,'delete_textovisualizacion'),(46,'Can add Tipo de orador',16,'add_tipoorador'),(47,'Can change Tipo de orador',16,'change_tipoorador'),(48,'Can delete Tipo de orador',16,'delete_tipoorador'),(49,'Can add video visualizacion',17,'add_videovisualizacion'),(50,'Can change video visualizacion',17,'change_videovisualizacion'),(51,'Can delete video visualizacion',17,'delete_videovisualizacion'),(52,'Can add video visto',18,'add_videovisto'),(53,'Can change video visto',18,'change_videovisto'),(54,'Can delete video visto',18,'delete_videovisto'),(55,'Can add Pdf',19,'add_pdf'),(56,'Can change Pdf',19,'change_pdf'),(57,'Can delete Pdf',19,'delete_pdf'),(58,'Can add texto visto',20,'add_textovisto'),(59,'Can change texto visto',20,'change_textovisto'),(60,'Can delete texto visto',20,'delete_textovisto'),(61,'Can add Sede',21,'add_sede'),(62,'Can change Sede',21,'change_sede'),(63,'Can delete Sede',21,'delete_sede'),(64,'Can add Tarea',22,'add_tarea'),(65,'Can change Tarea',22,'change_tarea'),(66,'Can delete Tarea',22,'delete_tarea'),(67,'Can add audio visto',23,'add_audiovisto'),(68,'Can change audio visto',23,'change_audiovisto'),(69,'Can delete audio visto',23,'delete_audiovisto'),(70,'Can add pdf visto',24,'add_pdfvisto'),(71,'Can change pdf visto',24,'change_pdfvisto'),(72,'Can delete pdf visto',24,'delete_pdfvisto'),(73,'Can add Imagen',25,'add_imagen'),(74,'Can change Imagen',25,'change_imagen'),(75,'Can delete Imagen',25,'delete_imagen'),(76,'Can add Facultad',26,'add_facultad'),(77,'Can change Facultad',26,'change_facultad'),(78,'Can delete Facultad',26,'delete_facultad'),(79,'Can add Tipo',27,'add_tipo'),(80,'Can change Tipo',27,'change_tipo'),(81,'Can delete Tipo',27,'delete_tipo'),(82,'Can add Tematica',28,'add_tematica'),(83,'Can change Tematica',28,'change_tematica'),(84,'Can delete Tematica',28,'delete_tematica'),(85,'Can add Carrera',29,'add_carrera'),(86,'Can change Carrera',29,'change_carrera'),(87,'Can delete Carrera',29,'delete_carrera'),(88,'Can add Clase',30,'add_clase'),(89,'Can change Clase',30,'change_clase'),(90,'Can delete Clase',30,'delete_clase'),(91,'Can add Video',31,'add_video'),(92,'Can change Video',31,'change_video'),(93,'Can delete Video',31,'delete_video'),(94,'Can add Tipo de evento',32,'add_tipoevento'),(95,'Can change Tipo de evento',32,'change_tipoevento'),(96,'Can delete Tipo de evento',32,'delete_tipoevento'),(97,'Can add Texto',33,'add_texto'),(98,'Can change Texto',33,'change_texto'),(99,'Can delete Texto',33,'delete_texto'),(100,'Can add Audio',34,'add_audio'),(101,'Can change Audio',34,'change_audio'),(102,'Can delete Audio',34,'delete_audio'),(103,'Can add Perfil',35,'add_perfil'),(104,'Can change Perfil',35,'change_perfil'),(105,'Can delete Perfil',35,'delete_perfil'),(106,'Can add Clave',36,'add_clave'),(107,'Can change Clave',36,'change_clave'),(108,'Can delete Clave',36,'delete_clave'),(109,'Can add Evento',37,'add_evento'),(110,'Can change Evento',37,'change_evento'),(111,'Can delete Evento',37,'delete_evento'),(112,'Can add Publicacion',38,'add_publicacion'),(113,'Can change Publicacion',38,'change_publicacion'),(114,'Can delete Publicacion',38,'delete_publicacion'),(115,'Can add foto',39,'add_foto'),(116,'Can change foto',39,'change_foto'),(117,'Can delete foto',39,'delete_foto');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$o2D6VhTE1aBi$wZIvxBK3Tao9L7eFJHk8VMbwdPxCxavn34DB80D2TEo=','2017-03-11 14:32:57',1,'admin','Edwar Orlando','Amaya Diaz','admin@upc.edu.co',1,1,'2017-02-19 21:20:15'),(10,'pbkdf2_sha256$30000$AZbn577CjaM5$NeQdU1hUhhF95rLrYZpBinok2ZmHYG8QUXwLFIbF1uo=','2017-03-11 14:20:40',0,'edwar-amaya','Edwar Orlando','Amaya Diaz','edwar-amaya@upc.edu.co',1,1,'2017-02-20 05:09:55'),(11,'pbkdf2_sha256$30000$z3PgbxCeshAq$7u2uohar3ihALE3qd2ZPI3jrQmbk9j3H5+U7nMbwr08=','2017-03-11 13:10:47',1,'jurado1','','','jurado1@unipiloto.edu.co',1,1,'2017-02-20 13:34:52'),(12,'pbkdf2_sha256$30000$QrEBsCYCTDbs$Ijj9WMc9zSCJDTNa1EufWo6lETIzACK65C9Vw7OvRIY=',NULL,1,'jurado2','','','jurado2@unipiloto.edu.co',1,1,'2017-02-20 13:36:09'),(13,'pbkdf2_sha256$30000$wkw0KT11ILSP$DqHC0DQ0SojtHeUQln5RUnqu/LwFTmthiDd2r7DssJo=','2017-03-11 13:14:22',0,'lmape22','Miguel','Mape','lmape22@upc.edu.co',0,1,'2017-02-20 20:24:53'),(15,'',NULL,0,'lmape22asa','','','lmape22asa',0,1,'2017-02-24 20:46:23'),(16,'pbkdf2_sha256$30000$nf4P4pAOvCDG$/kk/LJmMRc9Ps4I7saloPLSLLMMCjqjZRn9nJZBcd18=',NULL,0,'','','','@upc.edu.co',0,1,'2017-02-24 20:47:46'),(17,'',NULL,0,'lmape240','','','lmape240',0,1,'2017-03-08 17:52:44'),(20,'',NULL,0,'g-educativo','','','g-educativo@unipiloto.edu.co',0,1,'2017-03-09 00:04:37');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_publicacion`
--

DROP TABLE IF EXISTS `blog_publicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_publicacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `contenido` longtext NOT NULL,
  `publicado` date NOT NULL,
  `slug` varchar(50) NOT NULL,
  `autor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_publicacion_autor_id_f8debae9_fk_auth_user_id` (`autor_id`),
  KEY `blog_publicacion_2dbcba41` (`slug`),
  CONSTRAINT `blog_publicacion_autor_id_f8debae9_fk_auth_user_id` FOREIGN KEY (`autor_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_publicacion`
--

LOCK TABLES `blog_publicacion` WRITE;
/*!40000 ALTER TABLE `blog_publicacion` DISABLE KEYS */;
INSERT INTO `blog_publicacion` VALUES (1,'GO LIVE Repositio','<h1><big><strong><em>&iexcl;Despu&eacute;s de un largo y arduo trabajo...salimos en VIVO!!!</em></strong></big></h1>\r\n\r\n<h2>Si le&iacute;ste bien&hellip; el repositorio institucional REPOSITIO ya est&aacute; disponible para todos.</h2>\r\n\r\n<p>No te preocupes si no haces parte actualmente de la UPC (Universidad Piloto de Colombia), hay un espacio de b&uacute;squeda para TODOS aquellos amantes a la investigaci&oacute;n, pero si de lo contrario ya posees un correo institucional&hellip;emoci&oacute;nate porque tendr&aacute;s disponible todo lo que la carrera de contadur&iacute;a tiene para ti, solo debes registrarte.</p>\r\n\r\n<p>&iquest;Qu&eacute; esperas para ser parte de este MEGAPROYECTO?</p>\r\n\r\n<p>&iexcl;Ingresa ya!&nbsp;<img alt=\"yes\" src=\"http://www.repositio.com/static/ckeditor/ckeditor/plugins/smiley/images/thumbs_up.png\" style=\"height:23px; width:23px\" title=\"yes\" /></p>\r\n\r\n<p>Att: El equipo <strong><span style=\"color:blue\">REPOSITO</span></strong>&nbsp;<img alt=\"laugh\" src=\"http://www.repositio.com/static/ckeditor/ckeditor/plugins/smiley/images/teeth_smile.png\" style=\"height:23px; width:23px\" title=\"laugh\" /></p>\r\n\r\n<p>&nbsp;</p>','2017-02-21','go-live-repositio',1);
/*!40000 ALTER TABLE `blog_publicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_userdashboardmodule`
--

DROP TABLE IF EXISTS `dashboard_userdashboardmodule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_userdashboardmodule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  `app_label` varchar(255) DEFAULT NULL,
  `user` int(10) unsigned NOT NULL,
  `column` int(10) unsigned NOT NULL,
  `order` int(11) NOT NULL,
  `settings` longtext NOT NULL,
  `children` longtext NOT NULL,
  `collapsed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_userdashboardmodule`
--

LOCK TABLES `dashboard_userdashboardmodule` WRITE;
/*!40000 ALTER TABLE `dashboard_userdashboardmodule` DISABLE KEYS */;
INSERT INTO `dashboard_userdashboardmodule` VALUES (1,'Enlaces Rápidos','jet.dashboard.modules.LinkList',NULL,1,0,0,'{\"draggable\": false, \"collapsible\": false, \"layout\": \"inline\", \"deletable\": false}','[{\"url\": \"/\", \"title\": \"Volver al sitio\"}, {\"url\": \"/admin/repositio/password_change/\", \"title\": \"Cambiar contrase\\u00f1a\"}, {\"url\": \"/admin/repositio/logout/\", \"title\": \"Cerrar sesi\\u00f3n\"}]',0),(2,'Aplicaciones','jet.dashboard.modules.AppList',NULL,1,0,1,'{\"models\": null, \"exclude\": [\"auth.*\"]}','',0),(3,'Administración','jet.dashboard.modules.AppList',NULL,1,2,0,'{\"models\": [\"auth.*\"], \"exclude\": null}','',0),(4,'Acciones recientes','jet.dashboard.modules.RecentActions',NULL,1,0,2,'{\"exclude_list\": null, \"include_list\": null, \"limit\": 10, \"user\": null}','',0),(5,'Últimas Noticias de Django','jet.dashboard.modules.Feed',NULL,1,1,0,'{\"limit\": 5, \"feed_url\": \"http://www.djangoproject.com/rss/weblog/\"}','',0),(6,'Soporte','jet.dashboard.modules.LinkList',NULL,1,2,1,'{\"draggable\": true, \"collapsible\": true, \"layout\": \"stacked\", \"deletable\": true}','[{\"url\": \"http://docs.djangoproject.com/\", \"external\": true, \"title\": \"Documentaci\\u00f3n Django\"}, {\"url\": \"http://groups.google.com/group/django-users\", \"external\": true, \"title\": \"Lista de correos Django \\\"django-users\\\"\"}, {\"url\": \"irc://irc.freenode.net/django\", \"external\": true, \"title\": \"Canal IRC de Django\"}]',0),(7,'Modelos de la aplicación','jet.dashboard.modules.ModelList','auth',1,0,0,'{\"models\": [\"auth.*\"], \"exclude\": null}','',0),(8,'Acciones recientes','jet.dashboard.modules.RecentActions','auth',1,1,0,'{\"exclude_list\": null, \"include_list\": [\"auth.*\"], \"limit\": 10, \"user\": null}','',0),(9,'Enlaces Rápidos','jet.dashboard.modules.LinkList',NULL,11,0,0,'{\"draggable\": false, \"collapsible\": false, \"layout\": \"inline\", \"deletable\": false}','[{\"url\": \"/\", \"title\": \"Volver al sitio\"}, {\"url\": \"/admin/repositio/password_change/\", \"title\": \"Cambiar contrase\\u00f1a\"}, {\"url\": \"/admin/repositio/logout/\", \"title\": \"Cerrar sesi\\u00f3n\"}]',0),(10,'Aplicaciones','jet.dashboard.modules.AppList',NULL,11,1,0,'{\"models\": null, \"exclude\": [\"auth.*\"]}','',0),(11,'Administración','jet.dashboard.modules.AppList',NULL,11,2,0,'{\"models\": [\"auth.*\"], \"exclude\": null}','',0),(12,'Acciones recientes','jet.dashboard.modules.RecentActions',NULL,11,0,1,'{\"exclude_list\": null, \"include_list\": null, \"limit\": 10, \"user\": null}','',0),(13,'Últimas Noticias de Django','jet.dashboard.modules.Feed',NULL,11,1,1,'{\"limit\": 5, \"feed_url\": \"http://www.djangoproject.com/rss/weblog/\"}','',0),(14,'Soporte','jet.dashboard.modules.LinkList',NULL,11,2,1,'{\"draggable\": true, \"collapsible\": true, \"layout\": \"stacked\", \"deletable\": true}','[{\"url\": \"http://docs.djangoproject.com/\", \"external\": true, \"title\": \"Documentaci\\u00f3n Django\"}, {\"url\": \"http://groups.google.com/group/django-users\", \"external\": true, \"title\": \"Lista de correos Django \\\"django-users\\\"\"}, {\"url\": \"irc://irc.freenode.net/django\", \"external\": true, \"title\": \"Canal IRC de Django\"}]',0),(15,'Modelos de la aplicación','jet.dashboard.modules.ModelList','administrador',1,0,0,'{\"models\": [\"administrador.*\"], \"exclude\": null}','',0),(16,'Acciones recientes','jet.dashboard.modules.RecentActions','administrador',1,1,0,'{\"exclude_list\": null, \"include_list\": [\"administrador.*\"], \"limit\": 10, \"user\": null}','',0),(17,'Modelos de la aplicación','jet.dashboard.modules.ModelList','blog',1,0,0,'{\"models\": [\"blog.*\"], \"exclude\": null}','',0),(18,'Acciones recientes','jet.dashboard.modules.RecentActions','blog',1,1,0,'{\"exclude_list\": null, \"include_list\": [\"blog.*\"], \"limit\": 10, \"user\": null}','',0);
/*!40000 ALTER TABLE `dashboard_userdashboardmodule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-02-20 01:53:13','1','@unipiloto.edu.co',1,'[{\"added\": {}}]',11,1),(2,'2017-02-20 01:53:19','1','@unipiloto.edu.co',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',11,1),(3,'2017-02-20 01:53:44','2','@upc.edu.co',1,'[{\"added\": {}}]',11,1),(4,'2017-02-20 01:54:31','1','Ingenieria',1,'[{\"added\": {}}]',26,1),(5,'2017-02-20 01:57:14','1','Administración',1,'[{\"added\": {}}]',12,1),(6,'2017-02-20 01:57:41','2','Ciencias sociales',1,'[{\"added\": {}}]',12,1),(7,'2017-02-20 01:57:49','3','Derecho',1,'[{\"added\": {}}]',12,1),(8,'2017-02-20 01:58:09','4','Economía',1,'[{\"added\": {}}]',12,1),(9,'2017-02-20 01:58:18','5','Finan',1,'[{\"added\": {}}]',12,1),(10,'2017-02-20 01:58:34','5','Finanzas',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',12,1),(11,'2017-02-20 01:59:03','6','Legislación fiscal',1,'[{\"added\": {}}]',12,1),(12,'2017-02-20 01:59:12','7','Informatica',1,'[{\"added\": {}}]',12,1),(13,'2017-02-20 01:59:26','8','Matematica',1,'[{\"added\": {}}]',12,1),(14,'2017-02-20 02:30:52','2','Ciencias sociales y empresariales',1,'[{\"added\": {}}]',26,1),(15,'2017-02-20 02:31:41','1','Contaduria pública',1,'[{\"added\": {}}]',29,1),(16,'2017-02-20 02:32:57','1','Docencia',1,'[{\"added\": {}}]',30,1),(17,'2017-02-20 02:33:05','2','Investigación',1,'[{\"added\": {}}]',30,1),(18,'2017-02-20 02:33:11','3','Proyección social',1,'[{\"added\": {}}]',30,1),(19,'2017-02-20 02:33:30','1','Contabilidad',1,'[{\"added\": {}}]',36,1),(20,'2017-02-20 02:33:37','2','Finanzas',1,'[{\"added\": {}}]',36,1),(21,'2017-02-20 02:33:43','3','Laboral',1,'[{\"added\": {}}]',36,1),(22,'2017-02-20 02:34:27','1','Universidad piloto de Colombia (SAM)',1,'[{\"added\": {}}]',21,1),(23,'2017-02-20 02:35:19','1','Contable y financiera',1,'[{\"added\": {}}]',28,1),(24,'2017-02-20 02:35:33','2','Económico y administrativo',1,'[{\"added\": {}}]',28,1),(25,'2017-02-20 02:35:47','3','Jurídico',1,'[{\"added\": {}}]',28,1),(26,'2017-02-20 02:36:01','4','Área de humanidades',1,'[{\"added\": {}}]',28,1),(27,'2017-02-20 02:36:17','5','Área de informatica',1,'[{\"added\": {}}]',28,1),(28,'2017-02-20 02:36:28','6','Área de matematicas',1,'[{\"added\": {}}]',28,1),(29,'2017-02-20 02:37:23','1','Privado',1,'[{\"added\": {}}]',27,1),(30,'2017-02-20 02:37:34','2','Público',1,'[{\"added\": {}}]',27,1),(31,'2017-02-20 02:37:57','1','Foros',1,'[{\"added\": {}}]',32,1),(32,'2017-02-20 02:38:06','2','Taller',1,'[{\"added\": {}}]',32,1),(33,'2017-02-20 02:38:38','3','Working papers',1,'[{\"added\": {}}]',32,1),(34,'2017-02-20 02:38:53','4','Conferencia',1,'[{\"added\": {}}]',32,1),(35,'2017-02-20 02:39:10','5','Diplomados',1,'[{\"added\": {}}]',32,1),(36,'2017-02-20 02:39:25','5','Diplomado',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',32,1),(37,'2017-02-20 02:39:34','3','Working paper',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',32,1),(38,'2017-02-20 02:40:22','6','Curso',1,'[{\"added\": {}}]',32,1),(39,'2017-02-20 02:40:43','1','Externo',1,'[{\"added\": {}}]',16,1),(40,'2017-02-20 02:40:52','2','Estudiante',1,'[{\"added\": {}}]',16,1),(41,'2017-02-20 02:41:05','3','Docente',1,'[{\"added\": {}}]',16,1),(42,'2017-02-20 02:42:49','2','Sistemas',1,'[{\"added\": {}}]',29,1),(43,'2017-02-20 02:43:17','1','admin',1,'[{\"added\": {}}]',35,1),(44,'2017-02-20 03:14:13','1','admin',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\"]}}]',7,1),(45,'2017-02-20 03:15:08','1','admin',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',7,1),(46,'2017-02-20 03:45:04','1','@unipiloto.edu.co',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',11,1),(47,'2017-02-20 03:45:04','2','@upc.edu.co',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',11,1),(48,'2017-02-20 04:07:38','1','@unipiloto.edu.co',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',11,1),(49,'2017-02-20 04:07:38','2','@upc.edu.co',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',11,1),(50,'2017-02-20 04:21:17','2','lmape22',3,'',7,1),(51,'2017-02-20 04:24:20','5','lmape22',3,'',7,1),(52,'2017-02-20 04:38:28','2','lmape22',3,'',35,1),(53,'2017-02-20 04:38:41','7','lmape22',3,'',7,1),(54,'2017-02-20 04:44:36','8','lmape22',3,'',7,1),(55,'2017-02-20 05:09:21','1','admin',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',7,1),(56,'2017-02-20 13:34:52','11','jurado1',1,'[{\"added\": {}}]',7,1),(57,'2017-02-20 13:35:23','11','jurado1',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',7,1),(58,'2017-02-20 13:35:46','11','jurado1',2,'[{\"changed\": {\"fields\": [\"is_staff\", \"is_superuser\"]}}]',7,1),(59,'2017-02-20 13:36:09','12','jurado2',1,'[{\"added\": {}}]',7,1),(60,'2017-02-20 13:36:29','12','jurado2',2,'[{\"changed\": {\"fields\": [\"email\", \"is_staff\", \"is_superuser\"]}}]',7,1),(61,'2017-02-20 13:38:45','6','jurado1',1,'[{\"added\": {}}]',35,1),(62,'2017-02-20 13:39:08','7','jurado2',1,'[{\"added\": {}}]',35,1),(63,'2017-02-20 13:45:45','6','jurado1',2,'[{\"changed\": {\"fields\": [\"avatar\"]}}]',35,11),(64,'2017-02-20 13:45:54','7','jurado2',2,'[{\"changed\": {\"fields\": [\"avatar\"]}}]',35,11),(65,'2017-02-20 19:52:24','1','Foro de emprendimiento',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',37,1),(66,'2017-02-20 20:23:36','9','lmape22',2,'[{\"changed\": {\"fields\": [\"is_active\"]}}]',7,1),(67,'2017-02-20 20:24:27','9','lmape22',3,'',7,1),(68,'2017-02-20 20:27:02','2','Foro de emprendedores',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',37,1),(69,'2017-02-20 21:42:29','3','investigación tesis',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',19,1),(70,'2017-02-20 21:43:02','3','investigación tesis',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',19,1),(71,'2017-02-20 21:43:13','3','investigación tesis',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',19,1),(72,'2017-02-20 21:43:28','2','Prueba',2,'[{\"changed\": {\"fields\": [\"propietario\"]}}]',19,1),(73,'2017-02-20 21:43:34','2','Prueba',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',19,1),(74,'2017-02-20 21:43:59','2','Prueba',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',19,1),(75,'2017-02-21 19:24:22','1','GO LIVE Repositio',1,'[{\"added\": {}}]',38,1),(76,'2017-02-21 19:25:08','1','GO LIVE Repositio',2,'[{\"changed\": {\"fields\": [\"contenido\"]}}]',38,1),(77,'2017-02-21 19:25:33','1','GO LIVE Repositio',2,'[{\"changed\": {\"fields\": [\"contenido\"]}}]',38,1),(78,'2017-02-23 18:34:09','1','edwar-amaya',2,'[{\"changed\": {\"fields\": [\"tipo\"]}}]',33,1),(79,'2017-02-23 20:20:15','1','admin',2,'[{\"changed\": {\"fields\": [\"avatar\"]}}]',35,1),(80,'2017-02-24 16:19:36','3','FORO INTERNACIONAL DE CONTADURIA',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',37,1),(81,'2017-02-24 20:14:57','1','edwar-amaya',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',34,1),(82,'2017-02-24 20:15:16','1','Un gato',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',25,1),(83,'2017-02-24 20:15:26','1','Un gato',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',25,1),(84,'2017-02-24 20:15:33','1','Un gato',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',25,1),(85,'2017-02-24 20:15:39','2','curso 2017',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',25,1),(86,'2017-02-24 20:16:24','3','Documento de prueba',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',25,1),(87,'2017-02-24 20:16:36','2','Foro de emprendedores',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',37,1),(88,'2017-02-24 20:16:53','2','Prueba',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',19,1),(89,'2017-02-24 20:17:29','1','edwar-amaya',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',33,1),(90,'2017-02-24 20:19:08','1','edwar-amaya',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',31,1),(91,'2017-02-24 20:20:34','1','edwar-amaya',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',34,1),(92,'2017-03-08 17:21:01','1','admin',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',7,11),(93,'2017-03-08 17:47:06','6','Prueba',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',25,1),(94,'2017-03-08 17:47:14','6','Prueba',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',25,1),(95,'2017-03-08 20:41:10','1','admin',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',7,11),(96,'2017-03-09 03:50:54','1','admin',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',7,11),(97,'2017-03-09 03:52:22','10','edwar-amaya',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',7,11),(98,'2017-03-09 04:08:03','5','Andamio',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',37,1),(99,'2017-03-09 04:28:09','6','Prueba 001',2,'[{\"changed\": {\"fields\": [\"activo\"]}}]',37,1),(100,'2017-03-11 13:12:33','1','admin',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',7,11),(101,'2017-03-11 13:43:15','10','edwar-amaya',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',7,1),(102,'2017-03-11 14:32:36','5','Andamio',2,'[]',37,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (4,'admin','logentry'),(12,'administrador','areaconocimiento'),(34,'administrador','audio'),(23,'administrador','audiovisto'),(10,'administrador','audiovisualizacion'),(29,'administrador','carrera'),(30,'administrador','clase'),(36,'administrador','clave'),(11,'administrador','dominio'),(37,'administrador','evento'),(26,'administrador','facultad'),(39,'administrador','foto'),(25,'administrador','imagen'),(13,'administrador','orador'),(19,'administrador','pdf'),(24,'administrador','pdfvisto'),(14,'administrador','pdfvisualizacion'),(35,'administrador','perfil'),(21,'administrador','sede'),(22,'administrador','tarea'),(28,'administrador','tematica'),(33,'administrador','texto'),(20,'administrador','textovisto'),(15,'administrador','textovisualizacion'),(27,'administrador','tipo'),(32,'administrador','tipoevento'),(16,'administrador','tipoorador'),(31,'administrador','video'),(18,'administrador','videovisto'),(17,'administrador','videovisualizacion'),(5,'auth','group'),(6,'auth','permission'),(7,'auth','user'),(38,'blog','publicacion'),(8,'contenttypes','contenttype'),(1,'dashboard','userdashboardmodule'),(2,'jet','bookmark'),(3,'jet','pinnedapplication'),(9,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-02-19 21:19:32'),(2,'auth','0001_initial','2017-02-19 21:19:32'),(3,'admin','0001_initial','2017-02-19 21:19:33'),(4,'admin','0002_logentry_remove_auto_add','2017-02-19 21:19:33'),(5,'administrador','0001_initial','2017-02-19 21:19:38'),(6,'contenttypes','0002_remove_content_type_name','2017-02-19 21:19:38'),(7,'auth','0002_alter_permission_name_max_length','2017-02-19 21:19:38'),(8,'auth','0003_alter_user_email_max_length','2017-02-19 21:19:38'),(9,'auth','0004_alter_user_username_opts','2017-02-19 21:19:38'),(10,'auth','0005_alter_user_last_login_null','2017-02-19 21:19:39'),(11,'auth','0006_require_contenttypes_0002','2017-02-19 21:19:39'),(12,'auth','0007_alter_validators_add_error_messages','2017-02-19 21:19:39'),(13,'auth','0008_alter_user_username_max_length','2017-02-19 21:19:39'),(14,'blog','0001_initial','2017-02-19 21:19:39'),(15,'dashboard','0001_initial','2017-02-19 21:19:39'),(16,'jet','0001_initial','2017-02-19 21:19:39'),(17,'jet','0002_delete_userdashboardmodule','2017-02-19 21:19:39'),(18,'sessions','0001_initial','2017-02-19 21:19:39'),(19,'administrador','0002_auto_20170219_2125','2017-02-20 02:26:01'),(20,'administrador','0003_auto_20170220_0145','2017-02-20 06:45:58'),(21,'administrador','0004_auto_20170306_2131','2017-03-07 02:31:48'),(22,'administrador','0005_auto_20170307_2002','2017-03-08 01:02:47'),(23,'administrador','0006_video_titulo','2017-03-08 01:04:22');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1l6hej2g4z2wt2aqq74tr58fd0ql07e9','MDgzMmIxYmY0NWJmNjFhMGQ4MDc5NzFmOWQyZjU0Y2UwMTM0ZTZhYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjYyMzRjOWRlZGQ4ZmM4ODhjNjgxOTk1ZGVhN2FkNDM3NzBkMTE1ZGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI5In0=','2017-03-06 04:59:36'),('2bahlhvzjf4rv9brzmqnkf7tr67h3trs','MDk5NTEwNjNlOTJmNjZjODZkYTUzYjAzODllNzJjZjU0MWU0NmIxNTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ2ZjVlYjUyZTMzMmIyMjJkODI5YjUxYzAwZDFkYjcyMDIxODUwNGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMyJ9','2017-03-22 20:30:39'),('2x21j9yvmyjovove133pevaokj2eq85z','Y2E1MzE3YjlkNGEzYTVkZWNlOGM0YzFjM2UwNDQwNjA1ZjNhYzU4ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4MzhmYTE2MjM2OGY3NjNjYmQ4NjIzNTY2YjFlYzMzNzhiMDVkMzAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-03-06 06:01:32'),('4axaej4p97tjrc11wdwmo4esmspbkhir','Y2E1MzE3YjlkNGEzYTVkZWNlOGM0YzFjM2UwNDQwNjA1ZjNhYzU4ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4MzhmYTE2MjM2OGY3NjNjYmQ4NjIzNTY2YjFlYzMzNzhiMDVkMzAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-03-06 21:42:09'),('4o7yf3542t7jdsh9jxkix4gsn5sdyho5','MjFkOTdiNGZhYzE1MjIyMTEzZjM0YjhmNjFhYjBkMTQzN2ZhNTA1OTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ4YWExYWYzNDhiY2RhOTdjNmI2NWE3MDU1NzU3YTg2NzRkNmNhOTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMSJ9','2017-03-25 13:10:47'),('8pazbh4ltffp88lz490eadazdm1k3p0l','M2Y4ZjY4MmM4MWI4ZmQzMmZiZTg5YjAwZDk0ODFlMjFjNDFlODg0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjEzMWY2M2FjYThlYTJhYjBjZDQ2OTM0ZmVjMWZhYTZlYzU0OTYwNWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-03-05 23:46:06'),('9akbeafmruhqt0y8hfm5n1b3nlcukj5r','ZjUxYWJkZTRmNmUwNTc1OThkYTYyODdjMmRlYWI1ZjAwM2FmNDFhYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgxNzQxMjk4Zjk4MmEwOGVhY2Y1ZTdkODQyNDFlYjgyZjEzOTMyMDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMCJ9','2017-03-14 20:49:58'),('agk3ghuahnfz1oa57ybretmnune4rslh','NGViYThmZGE2NzMxMWM5MWMzZGZjMzFiOTI5YTRkZTkxNTgzOWE3YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjA0YzRmOWVjM2NiMjM5ZDM5ZTIzMGNmYjJmYWFhOWE1MGVjMWI3NWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-03-23 06:05:39'),('bkhiy77k6lmbf9xol60r4nlw9dc7ov76','NDY5Mzg0OWQyNTdmMTIzOTk5MTFkYzJhZDc4ZmE1MDc2OWIwZTZkOTp7Il9hdXRoX3VzZXJfaGFzaCI6ImMwMTNiZTA5YzYxZTlmYzdiNzI0N2Y1NWRkMmZjOWViOWMzN2VlNTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-03-23 00:11:07'),('cffj6kp1cohjirl2j0117cyw4d81xy1v','Y2E1MzE3YjlkNGEzYTVkZWNlOGM0YzFjM2UwNDQwNjA1ZjNhYzU4ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4MzhmYTE2MjM2OGY3NjNjYmQ4NjIzNTY2YjFlYzMzNzhiMDVkMzAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-03-06 04:34:21'),('dak5rximoherncpf63tyn5v4bm6r9vrf','NGViYThmZGE2NzMxMWM5MWMzZGZjMzFiOTI5YTRkZTkxNTgzOWE3YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjA0YzRmOWVjM2NiMjM5ZDM5ZTIzMGNmYjJmYWFhOWE1MGVjMWI3NWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-03-23 04:02:18'),('dc17x0tntanprmkhn4kspqyr5f2zjvh7','NDY5Mzg0OWQyNTdmMTIzOTk5MTFkYzJhZDc4ZmE1MDc2OWIwZTZkOTp7Il9hdXRoX3VzZXJfaGFzaCI6ImMwMTNiZTA5YzYxZTlmYzdiNzI0N2Y1NWRkMmZjOWViOWMzN2VlNTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-03-22 20:43:01'),('ezt6zezw26e41sd9oltuvc8a8ykakez4','ODI0MGI5ZmE4YTY4ZjhkNDVhYWQ3ZjI3OGQ4ZGQ1OGFjNWRhY2MyNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ5NTYxMmQzODNmYmZiMWEwMDQ2NDUzOWRlNzBjYTI0ODM2YmRjNWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-03-25 14:32:57'),('fn7juon8j3mms3wb66vnzizy0gg5c2hs','MDk5NTEwNjNlOTJmNjZjODZkYTUzYjAzODllNzJjZjU0MWU0NmIxNTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ2ZjVlYjUyZTMzMmIyMjJkODI5YjUxYzAwZDFkYjcyMDIxODUwNGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMyJ9','2017-03-15 16:14:38'),('fv9ebfjz51l73alw78gx1kypwuq0qe46','MDY0ZWVjMDJkNjk2NGY5Yzg4ODgyMWQwYzA0OGY4YWM1MjAxN2EzODp7Il9hdXRoX3VzZXJfaGFzaCI6IjU3NWMxYjZlZDJmNWMxNTZkOWFiMTE4ZDRkNjE2NzE3OTQxMjU0NDYiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-03-10 20:38:03'),('hjzlqfyaa1f1y8212p63rfxlgewf08bh','Y2E1MzE3YjlkNGEzYTVkZWNlOGM0YzFjM2UwNDQwNjA1ZjNhYzU4ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4MzhmYTE2MjM2OGY3NjNjYmQ4NjIzNTY2YjFlYzMzNzhiMDVkMzAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-03-09 02:14:08'),('ivlod0fj279ljlmw1op5pa2ftpr344tr','Y2E1MzE3YjlkNGEzYTVkZWNlOGM0YzFjM2UwNDQwNjA1ZjNhYzU4ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4MzhmYTE2MjM2OGY3NjNjYmQ4NjIzNTY2YjFlYzMzNzhiMDVkMzAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-03-07 18:39:06'),('lh57onpmtmztn2xa5rd6kwrpglak916j','ZjUxYWJkZTRmNmUwNTc1OThkYTYyODdjMmRlYWI1ZjAwM2FmNDFhYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgxNzQxMjk4Zjk4MmEwOGVhY2Y1ZTdkODQyNDFlYjgyZjEzOTMyMDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMCJ9','2017-03-10 18:49:28'),('mnjr3t7xn0z99rwhkrxj8jrdmyxiia7o','Y2E1MzE3YjlkNGEzYTVkZWNlOGM0YzFjM2UwNDQwNjA1ZjNhYzU4ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4MzhmYTE2MjM2OGY3NjNjYmQ4NjIzNTY2YjFlYzMzNzhiMDVkMzAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-03-10 02:24:31'),('rsryt4xw1nznq1339xfadbvgdbdbcnlw','Y2E1MzE3YjlkNGEzYTVkZWNlOGM0YzFjM2UwNDQwNjA1ZjNhYzU4ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4MzhmYTE2MjM2OGY3NjNjYmQ4NjIzNTY2YjFlYzMzNzhiMDVkMzAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-03-09 17:06:58'),('tcff77y4ufmxlihg1fh9sg48znbwnhmz','MjFkOTdiNGZhYzE1MjIyMTEzZjM0YjhmNjFhYjBkMTQzN2ZhNTA1OTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ4YWExYWYzNDhiY2RhOTdjNmI2NWE3MDU1NzU3YTg2NzRkNmNhOTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMSJ9','2017-03-22 09:56:50'),('tcgva5d5nlappeb7hzvvy808vtezh3ve','MDk5NTEwNjNlOTJmNjZjODZkYTUzYjAzODllNzJjZjU0MWU0NmIxNTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ2ZjVlYjUyZTMzMmIyMjJkODI5YjUxYzAwZDFkYjcyMDIxODUwNGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMyJ9','2017-03-23 00:06:57'),('utgo471tb8zmr4y133m0yxc088bcjuev','Y2E1MzE3YjlkNGEzYTVkZWNlOGM0YzFjM2UwNDQwNjA1ZjNhYzU4ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4MzhmYTE2MjM2OGY3NjNjYmQ4NjIzNTY2YjFlYzMzNzhiMDVkMzAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-03-10 16:07:02'),('v4sr130zm55sght0hsm8adwkrefjvjaw','ODI0MGI5ZmE4YTY4ZjhkNDVhYWQ3ZjI3OGQ4ZGQ1OGFjNWRhY2MyNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ5NTYxMmQzODNmYmZiMWEwMDQ2NDUzOWRlNzBjYTI0ODM2YmRjNWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-03-25 14:31:50');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jet_bookmark`
--

DROP TABLE IF EXISTS `jet_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jet_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  `title` varchar(255) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jet_bookmark`
--

LOCK TABLES `jet_bookmark` WRITE;
/*!40000 ALTER TABLE `jet_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `jet_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jet_pinnedapplication`
--

DROP TABLE IF EXISTS `jet_pinnedapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jet_pinnedapplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(255) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jet_pinnedapplication`
--

LOCK TABLES `jet_pinnedapplication` WRITE;
/*!40000 ALTER TABLE `jet_pinnedapplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `jet_pinnedapplication` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-12  0:11:43
