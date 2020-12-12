CREATE DATABASE  IF NOT EXISTS `elances` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `elances`;
-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: elances
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
-- Table structure for table `anuncios`
--

DROP TABLE IF EXISTS `anuncios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anuncios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `tipo` enum('Produto','Serviço') CHARACTER SET utf8 NOT NULL DEFAULT 'Produto',
  `titulo` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `descricao` varchar(450) COLLATE utf8_bin DEFAULT NULL,
  `valor_minimo` decimal(22,2) NOT NULL,
  `situacao` enum('Ativo','Vendido','Excluído') CHARACTER SET utf8 NOT NULL DEFAULT 'Ativo',
  `data_criacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_tipo` (`tipo`),
  KEY `idx_situacao` (`situacao`),
  KEY `fk_anuncios_usuario_idx` (`usuario_id`),
  CONSTRAINT `fk_anuncios_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anuncios`
--

LOCK TABLES `anuncios` WRITE;
/*!40000 ALTER TABLE `anuncios` DISABLE KEYS */;
INSERT INTO `anuncios` VALUES (3,1,'Serviço','Programação WEB','Websites utilizando CMs WP',3500.00,'Ativo','2020-12-09 23:52:42'),(5,3,'Serviço','Jardinagem','Poda de arboredos e gramaticias',199.90,'Ativo','2020-10-04 00:01:14'),(6,8,'Produto','Portas','Porta padrão em aluminio',950.50,'Ativo','2020-12-09 00:02:35'),(7,11,'Produto','Video Game','PS5 hight full complete',5500.50,'Ativo','2020-11-10 00:03:07'),(8,2,'Produto','Carro','Captiva 2014, preta, completa',78000.50,'Ativo','2020-12-10 00:04:37'),(9,2,'Produto','Carro','BMW i320 2012',65000.00,'Ativo','2020-10-01 00:04:59'),(10,5,'Produto','Camisa','Camisa, nova, tamanho 3, cor azul',70.00,'Ativo','2020-09-19 00:05:46'),(11,5,'Produto','Moto','BMW S1000R',90000.00,'Ativo','2020-12-10 00:06:24'),(12,7,'Produto','Moto','Daytone 675R - 2018',45000.00,'Ativo','2020-12-10 00:06:49'),(13,10,'Serviço','Reforço','Reforço escolar da disciplina de Matemática',80.00,'Ativo','2020-02-04 00:07:24'),(14,10,'Produto','Celular','Iphone 6 - 32G Prata',650.00,'Vendido','2020-12-10 00:21:16'),(15,1,'Produto','Computador','intel core 2 duol preto',650.00,'Ativo','2020-06-10 00:21:16'),(16,2,'Produto','Mesa','MEsa de jantar 4 lugares',250.00,'Ativo','2020-08-10 00:21:16'),(17,4,'Produto','Cadeira','gammer blx 129',1490.00,'Ativo','2020-09-09 00:21:16'),(18,5,'Serviço','Pedreiro','pedreiro geral',300.00,'Ativo','2020-12-11 12:15:12'),(19,6,'Serviço','Acompanhante','Acompanhante em evento de luxo',900.00,'Ativo','2020-12-08 02:15:12'),(20,7,'Produto','Bola','Bola oficial da copa',8900.00,'Ativo','2020-01-10 17:15:12'),(21,12,'Serviço','Limpeza','Serviço de limpeza',180.00,'Ativo','2020-07-19 02:10:12'),(28,11,'Produto','TV','TV de tubo 42 polegadas',900.00,'Vendido','2020-08-11 22:17:54'),(29,10,'Produto','Video Game','Xbox360',600.00,'Vendido','2020-10-11 22:17:54'),(30,5,'Produto','Skate','skateboard nunca usado novo',280.00,'Ativo','2020-02-11 22:17:54'),(31,5,'Produto','Janela','janela de madeira 4 folhas',170.00,'Vendido','2020-05-11 22:17:54'),(32,6,'Produto','Cama','cama box conjulgado de casal',290.00,'Ativo','2020-06-04 22:17:54'),(33,6,'Produto','Sofa','Sofa 6 lugares marrom',450.00,'Vendido','2020-03-23 03:17:54'),(34,8,'Serviço','Formatar','Formatar celulares',120.00,'Ativo','2020-12-11 22:21:24');
/*!40000 ALTER TABLE `anuncios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `anuncios_usuarios`
--

DROP TABLE IF EXISTS `anuncios_usuarios`;
/*!50001 DROP VIEW IF EXISTS `anuncios_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `anuncios_usuarios` AS SELECT 
 1 AS `id`,
 1 AS `nome`,
 1 AS `titulo`,
 1 AS `tipo`,
 1 AS `descricao`,
 1 AS `valor_minimo`,
 1 AS `situacao`,
 1 AS `data_criacao`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `lances`
--

DROP TABLE IF EXISTS `lances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `anuncio_id` int(11) NOT NULL,
  `valor` decimal(22,2) NOT NULL,
  `stiuacao` enum('Iniciado','Recusado','Aceito') COLLATE utf8_bin NOT NULL DEFAULT 'Iniciado',
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_lances_usuario_idx` (`usuario_id`),
  KEY `fk_lances_anuncio_idx` (`anuncio_id`),
  KEY `idx_situacao` (`stiuacao`),
  CONSTRAINT `fk_lances_anuncio` FOREIGN KEY (`anuncio_id`) REFERENCES `anuncios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lances_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lances`
--

LOCK TABLES `lances` WRITE;
/*!40000 ALTER TABLE `lances` DISABLE KEYS */;
INSERT INTO `lances` VALUES (69,1,3,220.00,'Iniciado','2020-12-12 00:31:32'),(70,2,5,220.00,'Iniciado','2020-12-12 00:31:32'),(71,2,6,290.00,'Iniciado','2020-12-12 00:31:32'),(72,3,7,340.00,'Iniciado','2020-12-12 00:31:32'),(73,5,8,2300.00,'Iniciado','2020-12-12 00:31:32'),(74,6,8,1927.00,'Iniciado','2020-12-12 00:31:32'),(75,7,9,1991.00,'Iniciado','2020-12-12 00:31:32'),(76,8,9,290.00,'Iniciado','2020-12-12 00:31:32'),(77,11,9,120.00,'Iniciado','2020-12-12 00:31:32'),(78,12,10,90.00,'Iniciado','2020-12-12 00:31:32'),(79,11,11,45.00,'Iniciado','2020-12-12 00:31:32'),(80,5,20,90.00,'Iniciado','2020-12-12 00:31:32'),(81,6,21,2300.00,'Iniciado','2020-12-12 00:31:32'),(82,8,33,1900.00,'Iniciado','2020-12-12 00:31:32'),(83,7,32,450.00,'Iniciado','2020-12-12 00:31:32'),(84,4,31,390.00,'Iniciado','2020-12-12 00:31:32'),(85,3,31,299.00,'Iniciado','2020-12-12 00:31:32'),(86,11,17,290.00,'Iniciado','2020-12-12 00:31:32'),(87,12,17,360.00,'Iniciado','2020-12-12 00:31:32'),(88,12,18,450.00,'Iniciado','2020-12-12 00:31:32'),(89,10,20,700.00,'Iniciado','2020-12-12 00:31:32'),(90,8,28,900.00,'Iniciado','2020-12-12 00:31:32'),(91,7,21,89000.00,'Iniciado','2020-12-12 00:31:32'),(92,6,20,23000.00,'Iniciado','2020-12-12 00:31:32'),(93,6,21,2350.00,'Iniciado','2020-12-12 00:31:32'),(94,7,30,3900.00,'Iniciado','2020-12-12 00:31:32'),(95,8,29,12560.00,'Iniciado','2020-12-12 00:31:32'),(96,10,9,10982.00,'Iniciado','2020-12-12 00:31:32'),(97,12,5,4590.00,'Iniciado','2020-12-12 00:31:32'),(98,1,3,5500.00,'Iniciado','2020-12-12 00:31:32'),(99,3,30,790.00,'Iniciado','2020-12-12 00:31:32'),(100,3,19,670.00,'Iniciado','2020-12-12 00:31:32'),(101,3,17,450.00,'Iniciado','2020-12-12 00:31:32'),(102,5,15,290.00,'Iniciado','2020-12-12 00:31:32');
/*!40000 ALTER TABLE `lances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8_bin NOT NULL,
  `uf` enum('AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO') CHARACTER SET utf8 NOT NULL,
  `cidade` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `situacao` enum('Ativo','Inativo','Excluído','Suspenso') CHARACTER SET utf8 NOT NULL DEFAULT 'Ativo',
  PRIMARY KEY (`id`),
  KEY `idx_situacao` (`situacao`),
  KEY `idx_uf` (`uf`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Helio','SP','Ourinhos','Ativo'),(2,'Victor','SP','Bauru','Ativo'),(3,'Mikaele','SP','Jau','Ativo'),(4,'Bianca','SP','Sao Jose dos Campos','Inativo'),(5,'Carlos','SP','Sao Paulo','Inativo'),(6,'Victor','SP','Bauru','Ativo'),(7,'Fabio','SP','Marilia','Ativo'),(8,'Ricardo','SP','Marilia','Ativo'),(10,'Marcelo','SP','Osasco','Ativo'),(11,'Debora','RS',NULL,'Ativo'),(12,'usuario 12','PR','Curitiba','Ativo');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'elances'
--

--
-- Dumping routines for database 'elances'
--

--
-- Final view structure for view `anuncios_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `anuncios_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `anuncios_usuarios` AS (select `a`.`id` AS `id`,`u`.`nome` AS `nome`,`a`.`titulo` AS `titulo`,`a`.`tipo` AS `tipo`,`a`.`descricao` AS `descricao`,`a`.`valor_minimo` AS `valor_minimo`,`a`.`situacao` AS `situacao`,date_format(`a`.`data_criacao`,'%d/%m/%Y') AS `data_criacao` from (`anuncios` `a` join `usuarios` `u` on((`a`.`usuario_id` = `u`.`id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-11 21:45:36
