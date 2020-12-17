CREATE DATABASE  IF NOT EXISTS `labrecho` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `labrecho`;
-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: labrecho
-- ------------------------------------------------------
-- Server version	5.6.44

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
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_bin NOT NULL,
  `senha` varchar(250) COLLATE utf8_bin NOT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uf` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Victor Luis','victorluissantos@live.com','123456','2020-12-08 23:18:01','SP'),(2,'Heitor Cordeiro','heitor.cordeiro@clansoftware.com.br','978321','2020-12-08 23:18:01','PR'),(3,'Dayane Cordeiro','dayane.kociolek@clansoftware.com.br','08051978','2020-12-08 23:18:01','PR'),(4,'Cecilia dos Santos Cordeiro','cecilia.cordeiro@clansoftware.com.br','897585','2020-12-08 23:18:01','SC'),(5,'Ana Emilia lourenço','ana.cordeiro@clansoftware.com.br','456789','2020-12-08 23:26:44','SC'),(6,'Roberto Carlos','roberto.carlos@clansoftware.com.br','456789','2020-12-08 23:30:14','RS'),(7,'Ana Emilia lourenço','ana.kociolek@clansoftware.com.br','456789','2020-12-08 23:34:08','PR'),(8,'Ana Emilia lourenço','ana.santos@clansoftware.com.br','456789','2020-12-08 23:34:09','DF');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'labrecho'
--

--
-- Dumping routines for database 'labrecho'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-17 20:21:40
