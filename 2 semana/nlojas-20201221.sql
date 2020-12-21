CREATE DATABASE  IF NOT EXISTS `nlojas` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `nlojas`;
-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: nlojas
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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(14) COLLATE utf8_bin NOT NULL,
  `nome` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `cep` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `cidade` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `estado` enum('PR','RS','SC') COLLATE utf8_bin DEFAULT NULL,
  `rua` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `numero` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `complemento` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `telefone` varchar(14) COLLATE utf8_bin DEFAULT NULL,
  `celular` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `data_aniversario` date DEFAULT NULL,
  `data_cadastro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'713.919.340-16','MARIA ESTELA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'(41) 3335-2271',NULL,'2020-12-15 23:51:53'),(2,'662.894.600-21','JOÃO ALMIR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'(11) 9840-9821',NULL,'2020-12-15 23:51:53'),(3,'077.020.630-17','CLAUDIA HELENA MARIA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'(88) 4567-9870',NULL,'2020-12-15 23:51:53'),(4,'516.255.880-03','ROBERTO ALBERTO','19.911-200','Curitiba','PR',NULL,NULL,NULL,NULL,'(49) 8765-3213',NULL,'2020-12-15 23:51:53'),(5,'684.175.030-64','ZEZÉ DE CAMARGO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'(14) 99850-0123',NULL,'2020-12-15 23:51:53'),(6,'642.980.030-00','VALDIR VALDERA VERSALL','82.598-002','Pinhais',NULL,NULL,NULL,NULL,NULL,'(41) 99850-0112',NULL,'2020-12-15 23:51:53'),(7,'456.789.598-20','MARIA ESTELA AVIAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'(41) 9865-0932',NULL,'2020-12-17 23:05:57'),(8,'789.568.568-89','MARIA ESTELA AVIAR GOM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'(13) 8932-8932',NULL,'2020-12-17 23:05:57'),(9,'159.951.357-89','MARIA ESTELA AVIAR BOR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'(11) 6732-9032',NULL,'2020-12-17 23:05:57'),(10,'456.789.130-98','Estela Maria de Almeida',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'(18) 97832-6213',NULL,'2020-12-17 23:07:56'),(11,'465.789.159-89','VICTOR LUIS DOS SANTOS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-18 22:25:21'),(12,'789.458.895-89','jOãO pAULO aLGUSTO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-18 22:25:21'),(13,'789.951.753-89','CAMILLA MARIANA DOS SANTOS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-18 22:27:32'),(14,'456.987.159-89','MARCELO NEVES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-18 22:31:59');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `nlojas`.`clientes_BEFORE_INSERT` BEFORE INSERT ON `clientes` FOR EACH ROW
BEGIN
	-- aplicando a função de letra maiuscula no novo nome que sera(before) inserido
	SET NEW.nome = UPPER(NEW.nome); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `nlojas`.`clientes_BEFORE_UPDATE` BEFORE UPDATE ON `clientes` FOR EACH ROW
BEGIN
	SET NEW.nome = UPPER(NEW.nome);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `cpf_venda`
--

DROP TABLE IF EXISTS `cpf_venda`;
/*!50001 DROP VIEW IF EXISTS `cpf_venda`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `cpf_venda` AS SELECT 
 1 AS `cpf`,
 1 AS `id`,
 1 AS `estoque_id`,
 1 AS `cliente_id`,
 1 AS `quantidade`,
 1 AS `valor`,
 1 AS `data_compra`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `estoques`
--

DROP TABLE IF EXISTS `estoques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estoques` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_id` int(11) NOT NULL,
  `fornecedor_id` int(11) NOT NULL,
  `lucro` int(11) NOT NULL,
  `quantidade` decimal(10,2) NOT NULL,
  `unidade` enum('Pacote','Caixa','Unidade','Quilograma') COLLATE utf8_bin NOT NULL DEFAULT 'Caixa',
  `data_entrada` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_estoques_produto_idx` (`produto_id`),
  KEY `fk_estoques_fornecedor_idx` (`fornecedor_id`),
  CONSTRAINT `fk_estoques_fornecedor` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_estoques_produto` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoques`
--

LOCK TABLES `estoques` WRITE;
/*!40000 ALTER TABLE `estoques` DISABLE KEYS */;
INSERT INTO `estoques` VALUES (1,1,2,60,50.00,'Pacote','2020-12-16 00:13:14'),(2,1,3,8,25.00,'Caixa','2020-12-16 00:13:14'),(3,1,4,60,10.00,'Pacote','2020-12-16 00:13:14'),(4,2,4,60,50.00,'Caixa','2020-12-16 00:13:14'),(5,3,5,23,10.00,'Unidade','2020-12-16 00:13:14'),(6,3,2,60,50.00,'Caixa','2020-12-16 00:13:14'),(7,4,3,50,50.00,'Pacote','2020-12-16 00:13:14'),(8,1,1,90,10.00,'Pacote','2020-12-16 00:13:14'),(9,2,8,60,10.00,'Pacote','2020-12-16 00:13:14'),(10,6,6,35,50.00,'Unidade','2020-12-16 00:13:14'),(11,8,6,23,25.00,'Quilograma','2020-12-16 00:13:14'),(12,9,6,60,50.00,'Quilograma','2020-12-16 00:13:14'),(13,11,5,70,50.00,'Unidade','2020-12-16 00:13:14'),(14,8,8,70,25.00,'Unidade','2020-12-16 00:13:14'),(15,9,2,60,50.00,'Unidade','2020-12-16 00:13:14'),(16,5,1,23,4.00,'Pacote','2020-12-16 00:13:14'),(17,5,4,90,1.00,'Caixa','2020-12-16 00:13:14'),(18,1,3,60,25.00,'Pacote','2020-12-16 00:13:14'),(19,3,2,40,25.00,'Unidade','2020-12-16 00:13:14');
/*!40000 ALTER TABLE `estoques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor_produtos`
--

DROP TABLE IF EXISTS `fornecedor_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedor_produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fornecedor_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `valor` decimal(20,2) NOT NULL,
  `situacao` enum('Disponível','Em estoque','Indisponível','Excluído','Atualizado') COLLATE utf8_bin NOT NULL DEFAULT 'Disponível',
  `data_cadastro` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fornecedor_produtos_fornecedor_idx` (`fornecedor_id`),
  KEY `fk_fornecedor_produtos_produto_idx` (`produto_id`),
  CONSTRAINT `fk_fornecedor_produtos_fornecedor` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_fornecedor_produtos_produto` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor_produtos`
--

LOCK TABLES `fornecedor_produtos` WRITE;
/*!40000 ALTER TABLE `fornecedor_produtos` DISABLE KEYS */;
INSERT INTO `fornecedor_produtos` VALUES (1,1,1,23.00,'Indisponível','2020-05-08'),(2,2,2,25.00,'Em estoque','2020-05-08'),(3,4,1,35.00,'Em estoque','2020-05-08'),(4,5,3,45.00,'Em estoque','2020-05-18'),(5,6,4,60.00,'Em estoque','2020-12-08'),(6,6,4,80.00,'Disponível','2020-12-10'),(7,3,3,80.00,'Em estoque','2020-12-10'),(8,3,6,60.00,'Em estoque','2020-12-05'),(9,4,7,70.00,'Em estoque','2019-09-10'),(10,7,10,90.00,'Em estoque','2019-09-20'),(11,5,11,56.00,'Em estoque','2019-09-30'),(12,1,8,15.00,'Em estoque','2019-09-25'),(13,6,7,10.00,'Disponível','2018-02-15'),(14,2,1,5.00,'Indisponível','2018-06-10'),(15,5,2,2.00,'Em estoque','2018-06-10'),(16,3,8,1.00,'Em estoque','2018-10-19'),(17,3,10,10.00,'Em estoque','2018-06-18'),(18,2,11,15.00,'Excluído','2016-11-11');
/*!40000 ALTER TABLE `fornecedor_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedores`
--

DROP TABLE IF EXISTS `fornecedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cnpj` varchar(18) COLLATE utf8_bin NOT NULL,
  `razao_social` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `cep` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `estado` enum('PR','SC','RS') COLLATE utf8_bin NOT NULL DEFAULT 'PR',
  `rua` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `bairro` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `numero` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `complemento` varchar(90) COLLATE utf8_bin DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedores`
--

LOCK TABLES `fornecedores` WRITE;
/*!40000 ALTER TABLE `fornecedores` DISABLE KEYS */;
INSERT INTO `fornecedores` VALUES (1,'64.101.438/0001-49','MAGNUS',NULL,'PR',NULL,NULL,NULL,NULL,'2018-10-23'),(2,'85.260.190/0001-39','ROYAL CANIN',NULL,'RS',NULL,NULL,NULL,NULL,'2020-08-05'),(3,'96.312.052/0001-72','DOG CHOW',NULL,'PR',NULL,NULL,NULL,NULL,'2020-01-20'),(4,'22.825.587/0001-00','PREMIER LOOKS',NULL,'PR',NULL,NULL,NULL,NULL,'2018-09-20'),(5,'97.228.957/0001-21','CIBAU PUPPY',NULL,'SC',NULL,NULL,NULL,NULL,'2019-05-20'),(6,'70.856.323/0001-67','FOSTER',NULL,'PR',NULL,NULL,NULL,NULL,'2019-05-19'),(7,'98.757.939/0001-08','GOLDEN PREMIUM',NULL,'SC',NULL,NULL,NULL,NULL,'2019-05-18'),(8,'87.472.529/0001-96','BOWGUY',NULL,'PR',NULL,NULL,NULL,NULL,'2019-07-05'),(9,'56.400.529/0001-96','PET PAWN STAR',NULL,'RS',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `fornecedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `nlojas`.`fornecedores_BEFORE_INSERT` BEFORE INSERT ON `fornecedores` FOR EACH ROW
BEGIN
	SET NEW.razao_social = UPPER(NEW.razao_social);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `nlojas`.`fornecedores_BEFORE_UPDATE` BEFORE UPDATE ON `fornecedores` FOR EACH ROW
BEGIN
	SET NEW.razao_social = UPPER(NEW.razao_social);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foto` varchar(450) COLLATE utf8_bin DEFAULT NULL,
  `nome` varchar(22) COLLATE utf8_bin NOT NULL,
  `descricao` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'https://www.furacaopet.com.br/imagens/informacoes/fornecedores-produtos-pet-shop-01.jpg','CASINHA','Casinha para Cachorro','2019-05-12'),(2,'https://www.furacaopet.com.br/imagens/informacoes/fabricas-produtos-pet-shop-01.jpg','GRAMA','Grama ant-stress','2019-05-10'),(3,'https://32226.cdn.simplo7.net/static/32226/sku/banho-e-tosa-shampoo-e-condicionadores-shampoo-coco-700-ml-1562965691569.jpg','SHAPOO','shapoo sem alcool','2019-05-12'),(4,'https://www.rbpet.com.br/imagens/informacoes/produtos-pet-shop-revenda-06.jpg','BEBEDOURO','Bebedouro para cachorro médio e pequeno porte','2019-12-20'),(5,'https://www.rbpet.com.br/imagens/informacoes/produtos-pet-shop-revenda-08.jpg','OSSO','osso para cachorro de pequeno porte','2019-12-03'),(6,'https://cobasi.vteximg.com.br/arquivos/ids/215520/Racao-Optimum-Gatos-Filhotes-Frango.jpg?v=636927533549200000','RAÇÃO PARA GATO','ração para gatos filhotes','2019-10-30'),(7,'https://api.tendaatacado.com.br/fotos/10073_mini.jpg','RAÇÃO PARA GATOS','Ração de carne para gatos adultos','2019-10-03'),(8,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3i_gv5cWs-1huYJli1aQnxXu_A65PwLftig&usqp=CAU','RAÇÃO PARA CACHORRO','Ração para cachorro meédio e grande porte','2020-10-28'),(9,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS21o6dV-ILXuY8oULVUXjmUMnQpnh_jiSKrw&usqp=CAU','RAÇÃO','Ração paraa cachorro filhote','2019-07-07'),(10,'https://capil.coop.br/wp-content/uploads/2018/02/enxada-larga-goivada-25-1.jpg','PETISCO','Ração petisco para cachorro de grande porte','2019-09-15'),(11,'https://cdn.lojazmart.com/media/catalog/product/cache/1/image/650x/040ec09b1e35df139433887a97daa66f/m/o/monello_frango_e_vegetais_zmart.jpg','RAÇÃO','Rção para cachorros médio e grande porte carne','2019-07-15');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estoque_id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` decimal(22,2) NOT NULL,
  `data_compra` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_vendas_estoque_idx` (`estoque_id`),
  KEY `fk_vendas_cliente_idx` (`cliente_id`),
  CONSTRAINT `fk_vendas_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vendas_estoque` FOREIGN KEY (`estoque_id`) REFERENCES `estoques` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` VALUES (1,5,1,2,100.00,'2020-12-16 00:24:34'),(2,10,2,1,38.00,'2020-12-16 00:24:34'),(3,1,2,4,75.00,'2020-12-16 00:24:34'),(4,2,3,2,100.00,'2020-12-16 00:24:34'),(5,5,4,1,43.00,'2020-12-16 00:24:34'),(6,6,3,4,45.00,'2020-12-16 00:24:34'),(7,9,4,5,27.00,'2020-12-16 00:24:34'),(8,19,4,12,15.00,'2020-12-16 00:24:34'),(9,18,6,12,29.00,'2020-12-16 00:24:34'),(10,18,3,9,25.00,'2020-12-16 00:24:34'),(11,19,2,2,120.00,'2020-12-16 00:24:34'),(12,17,1,4,35.00,'2020-12-16 00:24:34'),(13,15,2,2,140.00,'2020-12-16 00:24:34'),(14,13,3,1,37.00,'2020-12-16 00:24:34'),(15,15,4,3,60.00,'2020-12-16 00:24:34'),(16,11,6,6,50.00,'2020-12-16 00:24:34'),(17,13,3,4,160.00,'2020-12-16 00:24:34'),(18,10,1,16,470.00,'2020-12-16 00:24:34'),(19,9,1,16,280.00,'2020-12-16 00:24:34'),(20,11,4,8,38.00,'2020-12-16 00:24:34'),(21,12,3,4,90.00,'2020-12-16 00:24:34'),(22,3,2,2,120.00,'2020-12-16 00:24:34'),(23,2,2,1,140.00,'2020-12-16 00:24:34'),(24,1,1,12,280.00,'2020-12-16 00:24:34');
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'nlojas'
--

--
-- Dumping routines for database 'nlojas'
--
/*!50003 DROP FUNCTION IF EXISTS `getValorVenda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `getValorVenda`(pvalor DECIMAL(22,2), plucro INT(11)) RETURNS decimal(22,2)
BEGIN
	
    DECLARE valor DECIMAL(22,2) default 0.00;
    
    SET valor = ROUND((pvalor + ((pvalor / 100) * plucro)),2);

RETURN valor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `upFirst` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `upFirst`(palavra VARCHAR(250)) RETURNS varchar(250) CHARSET utf8 COLLATE utf8_bin
BEGIN
	DECLARE primeira_letra VARCHAR(250) DEFAULT NULL;
    DECLARE restante_palavra VARCHAR(250) DEFAULT NULL;
    DECLARE palavra_formatada VARCHAR(250) DEFAULT NULL;
    DECLARE qtd_caracter INT(11) DEFAULT 0;
    
    SET primeira_letra = SUBSTR(palavra, 1, 1); -- pegando a primeira letra
    SET qtd_caracter = LENGTH(palavra); -- Contando a quantidade de caracteres
    SET restante_palavra = SUBSTR(palavra, 2, qtd_caracter); -- Setando o restante da palavra
    
    SET primeira_letra = UPPER(primeira_letra); -- Deixando a primeira letra em maiusculo
    SET restante_palavra = LOWER(restante_palavra); -- Deixando o restante em minusculo
    
    SET palavra_formatada = CONCAT(primeira_letra, restante_palavra); -- concatenando para formar a palavra original formatada
    
RETURN palavra_formatada;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `upperNameProdutos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `upperNameProdutos`()
BEGIN
	-- Declarando todas as variáveis que usaremos
	DECLARE qtdProdutos INT(11) DEFAULT 0;
    DECLARE qtdClientes INT(11) DEFAULT 0;
    DECLARE qtdFornecedores INT(11) DEFAULT 0;
    DECLARE indice INT(11) DEFAULT 0;
    DECLARE idUpdate INT(11) Default 0;
    DECLARE nNome VARCHAR(22) Default 0;
    DECLARE nClienteNome VARCHAR(22) Default 0;
    DECLARE nRazaoSocial VARCHAR(22) Default 0;
    
    -- informa a quantidade de Produtos que tenho na tabela produtos
    SET qtdProdutos = (SELECT COUNT(p.id) FROm produtos p);
    SET qtdClientes = (SELECT COUNT(c.id) FROm clientes c);
    SET qtdFornecedores = (SELECT COUNT(f.id) FROm fornecedores f);

	WHILE indice < qtdProdutos DO
    
		SET idUpdate = (select p.id from produtos p LIMIT indice, 1);
        SET nNome = (select p.nome from produtos p LIMIT indice, 1);
        
        UPDATE `produtos` SET `nome`=UPPER(nNome) WHERE `id`=idUpdate;

		SET indice = indice+1;
    
    END WHILE;
    
    SET indice = 0;
    -- clientes
	WHILE indice < qtdFornecedores DO
    
		SET idUpdate = (select c.id from clientes c LIMIT indice, 1);
        SET nClienteNome = (select c.nome from clientes c LIMIT indice, 1);
        
        UPDATE `clientes` SET `nome`=UPPER(nClienteNome) WHERE `id`=idUpdate;

		SET indice = indice+1;
    
    END WHILE;

    
    SET indice = 0;
    -- fornecedores
	WHILE indice < qtdProdutos DO
    
		SET idUpdate = (select f.id from fornecedores f LIMIT indice, 1);
        SET nRazaoSocial = (select f.razao_social from fornecedores f LIMIT indice, 1);
        
        UPDATE `fornecedores` SET `razao_social`=UPPER(nRazaoSocial) WHERE `id`=idUpdate;

		SET indice = indice+1;
    
    END WHILE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `cpf_venda`
--

/*!50001 DROP VIEW IF EXISTS `cpf_venda`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `cpf_venda` AS (select `c`.`cpf` AS `cpf`,`v`.`id` AS `id`,`v`.`estoque_id` AS `estoque_id`,`v`.`cliente_id` AS `cliente_id`,`v`.`quantidade` AS `quantidade`,`v`.`valor` AS `valor`,`v`.`data_compra` AS `data_compra` from (`clientes` `c` join `vendas` `v` on((`c`.`id` = `v`.`cliente_id`)))) */;
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

-- Dump completed on 2020-12-21 19:19:07
