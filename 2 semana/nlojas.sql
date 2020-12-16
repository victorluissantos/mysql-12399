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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'713.919.340-16','Maria Estela',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-15 23:51:53'),(2,'662.894.600-21','João Almir',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-15 23:51:53'),(3,'077.020.630-17','Claudia Helena Maria',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-15 23:51:53'),(4,'516.255.880-03','Roberto Alberto','19.911-200','Curitiba','PR',NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-15 23:51:53'),(5,'684.175.030-64','Zezé de Camargo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-15 23:51:53'),(6,'642.980.030-00','Valdir Valdera Versalles','82.598-002','Pinhais',NULL,NULL,NULL,NULL,NULL,'(41) 99850-0112',NULL,'2020-12-15 23:51:53');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedores`
--

LOCK TABLES `fornecedores` WRITE;
/*!40000 ALTER TABLE `fornecedores` DISABLE KEYS */;
INSERT INTO `fornecedores` VALUES (1,'64.101.438/0001-49','Magnus',NULL,'PR',NULL,NULL,NULL,NULL,'2018-10-23'),(2,'85.260.190/0001-39','Royal Canin',NULL,'RS',NULL,NULL,NULL,NULL,'2020-08-05'),(3,'96.312.052/0001-72','Dog Chow',NULL,'PR',NULL,NULL,NULL,NULL,'2020-01-20'),(4,'22.825.587/0001-00','PremieR',NULL,'PR',NULL,NULL,NULL,NULL,'2018-09-20'),(5,'97.228.957/0001-21','Cibau Puppy',NULL,'SC',NULL,NULL,NULL,NULL,'2019-05-20'),(6,'70.856.323/0001-67','Foster',NULL,'PR',NULL,NULL,NULL,NULL,'2019-05-19'),(7,'98.757.939/0001-08','Golden',NULL,'SC',NULL,NULL,NULL,NULL,'2019-05-18'),(8,'87.472.529/0001-96','BowGuy',NULL,'PR',NULL,NULL,NULL,NULL,'2019-07-05');
/*!40000 ALTER TABLE `fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `produtos` VALUES (1,'https://www.furacaopet.com.br/imagens/informacoes/fornecedores-produtos-pet-shop-01.jpg','Casinha','Casinha para Cachorro','2019-05-12'),(2,'https://www.furacaopet.com.br/imagens/informacoes/fabricas-produtos-pet-shop-01.jpg','Grama','Grama ant-stress','2019-05-10'),(3,'https://32226.cdn.simplo7.net/static/32226/sku/banho-e-tosa-shampoo-e-condicionadores-shampoo-coco-700-ml-1562965691569.jpg','Shapoo','Shapoo sem alcool','2019-05-12'),(4,'https://www.rbpet.com.br/imagens/informacoes/produtos-pet-shop-revenda-06.jpg','Bebedouro','Bebedouro para cachorro médio e pequeno porte','2019-12-20'),(5,'https://www.rbpet.com.br/imagens/informacoes/produtos-pet-shop-revenda-08.jpg','Osso','Osso para cachorro de pequeno porte','2019-12-03'),(6,'https://cobasi.vteximg.com.br/arquivos/ids/215520/Racao-Optimum-Gatos-Filhotes-Frango.jpg?v=636927533549200000','Ração para gato','Ração para gatos filhotes','2019-10-30'),(7,'https://api.tendaatacado.com.br/fotos/10073_mini.jpg','Ração para gatos','Ração de carne para gatos adultos','2019-10-03'),(8,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3i_gv5cWs-1huYJli1aQnxXu_A65PwLftig&usqp=CAU','Ração para cachorro','Ração para cachorro meédio e grande porte','2020-10-28'),(9,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS21o6dV-ILXuY8oULVUXjmUMnQpnh_jiSKrw&usqp=CAU','Ração','Ração paraa cachorro filhote','2019-07-07'),(10,'https://capil.coop.br/wp-content/uploads/2018/02/enxada-larga-goivada-25-1.jpg','Petisco','Ração petisco para cachorro de grande porte','2019-09-15'),(11,'https://cdn.lojazmart.com/media/catalog/product/cache/1/image/650x/040ec09b1e35df139433887a97daa66f/m/o/monello_frango_e_vegetais_zmart.jpg','Ração','Rção para cachorros médio e grande porte carne','2019-07-15');
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-16 19:04:58
