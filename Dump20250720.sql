-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: vendasblusablusas1
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrador` (
  `id_administrador` int NOT NULL AUTO_INCREMENT,
  `matricula` varchar(20) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `salario` decimal(5,2) DEFAULT NULL,
  `situacao` varchar(50) NOT NULL DEFAULT 'Ativo',
  `id_pessoa` int NOT NULL,
  PRIMARY KEY (`id_administrador`),
  KEY `id_pessoa` (`id_pessoa`),
  CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'ADM001','Gerente Financeiro',350.00,'A',1),(2,'ADM002','Desenvolvedor de Sistemas',NULL,'A',2),(3,'ADM110','Técnico em sistemas Físicos ',NULL,'A',15),(4,'ADM200','Administradora De Sistemas',NULL,'A',16),(6,'ADM345','Administrador de Sistemas',NULL,'Ativo',19),(7,'AS900','Administrador de Suporte',NULL,'Ativo',20),(8,'AE300','Administrador de Estoque',NULL,'Ativo',21),(9,'AHR300','Administrador de hardware',NULL,'Ativo',22);
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `criar_login_padrao_adm` AFTER INSERT ON `administrador` FOR EACH ROW BEGIN
DECLARE emailt VARCHAR(30);
SELECT email INTO emailt  FROM pessoa WHERE id_pessoa = NEW.id_pessoa;
INSERT INTO login(usuario,senha_hash,alterar_senha,id_pessoa)VALUES(emailt,UPPER(MD5('blusablusas123')),'S',NEW.id_pessoa);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `descricao`
--

DROP TABLE IF EXISTS `descricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descricao` (
  `id_descricao` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `cor` varchar(10) NOT NULL,
  `tecido` varchar(15) NOT NULL,
  `tamanho` enum('PP','P','M','G','GG') NOT NULL DEFAULT 'P',
  `categoria` varchar(20) NOT NULL,
  `imagem_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descricao`
--

LOCK TABLES `descricao` WRITE;
/*!40000 ALTER TABLE `descricao` DISABLE KEYS */;
INSERT INTO `descricao` VALUES (1,'Camiseta básica','Preto','Algodão','M','Vestuario','https://imagem.com/camisa.jpg'),(2,'Camiseta branca clássica','Branco','Algodão','G','Vestuário','https://imagem.com/camisa2.jpg'),(3,'Camiseta azul slim','Azul','Poliéster','P','Vestuário','https://imagem.com/camisa3.jpg'),(4,'Camiseta verde escura','Verde','Algodão','GG','Vestuário','https://imagem.com/camisa4.jpg'),(5,'Camiseta amarela viva','Amarelo','Viscose','M','Vestuário','https://imagem.com/camisa5.jpg'),(6,'Camiseta listrada casual','Listrado','Algodão','G','Vestuário','https://imagem.com/camisa6.jpg'),(7,'Camiseta cinza básica','Cinza','Algodão','M','Vestuário','https://imagem.com/camisa7.jpg'),(8,'Camiseta vermelha escura','Vermelho','Poliéster','P','Vestuário','https://imagem.com/camisa8.jpg'),(9,'Camiseta polo preta','Preto','Piquet','M','Vestuário','https://imagem.com/camisa9.jpg'),(10,'Camisa social branca','Branco','Tricoline','G','Vestuário','https://imagem.com/camisa10.jpg');
/*!40000 ALTER TABLE `descricao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `id_endereco` int NOT NULL AUTO_INCREMENT,
  `rua` varchar(30) NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `uf` char(2) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `complemento` varchar(20) DEFAULT NULL,
  `numero` varchar(10) NOT NULL,
  `tipo_endereco` enum('residencial','comercial') NOT NULL DEFAULT 'residencial',
  `situacao` char(1) NOT NULL DEFAULT 'A',
  `id_pessoa` int NOT NULL,
  PRIMARY KEY (`id_endereco`),
  KEY `id_pessoa` (`id_pessoa`),
  CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'Rua A','São Paulo','Centro','SP','01000-000',NULL,'123','residencial','A',1),(2,'Rua A','São Paulo','Centro','SP','01000-000',NULL,'123','residencial','A',1),(3,'Rua B','São Paulo','Vila Mariana','SP','01111-000','Apto 10','456','comercial','A',1),(4,'Rua C','Rio de Janeiro','Copacabana','RJ','22000-000',NULL,'78','residencial','A',2),(5,'Av. Atlântica','Rio de Janeiro','Copacabana','RJ','22010-000','Bloco B','80','comercial','A',2),(6,'Rua D','Belo Horizonte','Savassi','MG','30140-000',NULL,'101','residencial','A',3),(7,'Av. Brasil','Belo Horizonte','Funcionários','MG','30150-000',NULL,'202','comercial','A',3),(8,'Rua E','Curitiba','Centro','PR','80010-000','Casa','15','residencial','A',4),(9,'Rua F','Curitiba','Batel','PR','80420-000',NULL,'30','comercial','A',4),(10,'Rua G','Porto Alegre','Moinhos de Vento','RS','90560-000','Fundos','50','residencial','A',5),(11,'Av. Ipiranga','Porto Alegre','Partenon','RS','90619-900',NULL,'2000','comercial','A',5);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_preco`
--

DROP TABLE IF EXISTS `historico_preco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_preco` (
  `id_historico_preco` int NOT NULL AUTO_INCREMENT,
  `data_alteracao` datetime DEFAULT CURRENT_TIMESTAMP,
  `preco_antigo` decimal(5,2) NOT NULL,
  `preco_novo` decimal(5,2) NOT NULL,
  `id_produto` int NOT NULL,
  PRIMARY KEY (`id_historico_preco`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `historico_preco_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_preco`
--

LOCK TABLES `historico_preco` WRITE;
/*!40000 ALTER TABLE `historico_preco` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_preco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_venda`
--

DROP TABLE IF EXISTS `itens_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_venda` (
  `id_itens_venda` int NOT NULL AUTO_INCREMENT,
  `desconto` decimal(5,2) DEFAULT NULL,
  `acrescimo` decimal(5,2) DEFAULT NULL,
  `quantidade_venda` int NOT NULL,
  `preco` decimal(5,2) NOT NULL,
  `valor_total` decimal(5,2) DEFAULT NULL,
  `cancelado` tinyint(1) DEFAULT '0',
  `id_produto` int NOT NULL,
  `id_venda` int NOT NULL,
  PRIMARY KEY (`id_itens_venda`),
  KEY `id_produto` (`id_produto`),
  KEY `id_venda` (`id_venda`),
  CONSTRAINT `itens_venda_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`),
  CONSTRAINT `itens_venda_ibfk_2` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_venda`
--

LOCK TABLES `itens_venda` WRITE;
/*!40000 ALTER TABLE `itens_venda` DISABLE KEYS */;
INSERT INTO `itens_venda` VALUES (1,0.00,0.00,1,59.90,59.90,0,1,1),(2,0.00,0.00,1,64.90,64.90,0,2,2),(3,0.00,0.00,1,49.90,49.90,0,3,3),(4,0.00,0.00,1,55.00,55.00,0,4,4),(5,0.00,0.00,2,60.00,120.00,0,5,4),(6,0.00,0.00,1,69.90,69.90,0,6,5),(7,0.00,0.00,3,58.00,174.00,0,7,5),(8,0.00,0.00,2,62.50,125.00,0,8,6),(9,0.00,0.00,1,75.00,75.00,0,9,6),(10,0.00,0.00,2,99.90,199.80,0,10,6),(11,0.00,0.00,1,59.90,59.90,0,1,2),(12,0.00,0.00,1,64.90,64.90,0,2,3),(13,0.00,0.00,2,49.90,99.80,0,3,4),(14,0.00,0.00,2,55.00,110.00,0,4,5),(15,0.00,0.00,1,60.00,60.00,0,5,6),(16,0.00,0.00,1,69.90,69.90,0,6,1),(17,0.00,0.00,1,58.00,58.00,0,7,2),(18,0.00,0.00,2,62.50,125.00,0,8,3),(19,0.00,0.00,1,75.00,75.00,0,9,4),(20,0.00,0.00,2,99.90,199.80,0,10,5),(21,0.00,0.00,1,59.90,59.90,0,1,6),(22,0.00,0.00,3,89.90,269.70,0,10,7),(23,5.00,2.00,1,59.90,56.90,0,1,7),(24,0.00,0.00,3,64.90,194.70,0,2,7),(26,0.00,0.00,3,59.90,179.70,0,1,7);
/*!40000 ALTER TABLE `itens_venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `atualiza_itens_venda` BEFORE INSERT ON `itens_venda` FOR EACH ROW BEGIN
SET NEW.preco = (SELECT preco FROM produto WHERE id_produto = NEW.id_produto) ,
NEW.valor_total = ((NEW.preco * NEW.quantidade_venda)-NEW.desconto+NEW.acrescimo);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `atualizar_valor_total_venda` AFTER INSERT ON `itens_venda` FOR EACH ROW BEGIN
UPDATE venda SET valor_total = (SELECT SUM(valor_total) FROM itens_venda WHERE id_venda = NEW.id_venda AND cancelado = 0)
WHERE id_venda = NEW.id_venda;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `atualizar_estoque` AFTER INSERT ON `itens_venda` FOR EACH ROW BEGIN
  UPDATE produto
  SET quantidade_estoque = quantidade_estoque - NEW.quantidade_venda
  WHERE id_produto = NEW.id_produto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `id_login` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(20) NOT NULL,
  `senha_hash` varchar(255) NOT NULL,
  `tentativas_login` int NOT NULL DEFAULT '0',
  `alterar_senha` char(1) NOT NULL DEFAULT 'N',
  `tipo_usuario` enum('Admin','Normal') NOT NULL DEFAULT 'Normal',
  `data_acesso` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_saida` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `situacao` enum('Ativo','Inativo','Bloqueado') NOT NULL DEFAULT 'Ativo',
  `id_pessoa` int NOT NULL,
  PRIMARY KEY (`id_login`),
  UNIQUE KEY `usuario` (`usuario`),
  KEY `id_pessoa` (`id_pessoa`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'ana.silva','HASH123456',0,'N','Normal','2025-07-18 16:45:58','2025-07-18 16:45:58','Ativo',1),(2,'ronaldinho@gmail.com','4B43B0AEE35624CD95B910189B3DC231',0,'N','Normal','2025-07-19 21:36:34','2025-07-19 21:36:34','Ativo',19),(3,'messi@gmail.com','DEA56E47F1C62C30B83B70EB281A6C39',0,'N','Admin','2025-07-19 23:33:14','2025-07-19 23:33:14','Ativo',20),(4,'CR7@gmail.com','4BCA24304861ACDE5770FDBE3CC2503B',0,'N','Admin','2025-07-20 11:44:26','2025-07-20 11:44:26','Ativo',21);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimentacao_caixa`
--

DROP TABLE IF EXISTS `movimentacao_caixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimentacao_caixa` (
  `id_movimentacao_caixa` int NOT NULL AUTO_INCREMENT,
  `tipo` enum('Saida','Entrada') NOT NULL DEFAULT 'Entrada',
  `origem` varchar(50) NOT NULL,
  `valor` decimal(5,2) NOT NULL,
  `data_movimentacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descricao` text,
  `id_venda` int NOT NULL,
  PRIMARY KEY (`id_movimentacao_caixa`),
  KEY `id_venda` (`id_venda`),
  CONSTRAINT `movimentacao_caixa_ibfk_1` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentacao_caixa`
--

LOCK TABLES `movimentacao_caixa` WRITE;
/*!40000 ALTER TABLE `movimentacao_caixa` DISABLE KEYS */;
INSERT INTO `movimentacao_caixa` VALUES (1,'Entrada','Venda Camiseta',59.90,'2025-07-18 16:45:58','Venda do produto Camisa Preta M',1);
/*!40000 ALTER TABLE `movimentacao_caixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_fiscal`
--

DROP TABLE IF EXISTS `nota_fiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nota_fiscal` (
  `id_nota_fiscal` int NOT NULL AUTO_INCREMENT,
  `numero_nota` varchar(50) NOT NULL,
  `data_emissao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor_total` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_nota_fiscal`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_fiscal`
--

LOCK TABLES `nota_fiscal` WRITE;
/*!40000 ALTER TABLE `nota_fiscal` DISABLE KEYS */;
INSERT INTO `nota_fiscal` VALUES (1,'NF123','2025-07-18 16:45:58',59.90),(2,'NF124','2025-07-18 17:00:00',70.00),(3,'NF125','2025-07-18 17:10:00',100.00),(4,'NF126','2025-07-18 17:20:00',150.00),(5,'NF127','2025-07-18 17:30:00',200.00),(6,'NF128','2025-07-18 17:40:00',300.00);
/*!40000 ALTER TABLE `nota_fiscal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `id_pagamento` int NOT NULL AUTO_INCREMENT,
  `parcela` int NOT NULL,
  `valor` decimal(5,2) NOT NULL,
  `data_pagamento` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `forma_pagamento` enum('Debito','Credito','boleto','pix') NOT NULL DEFAULT 'pix',
  `situacao` enum('pendente','pago','cancelado') NOT NULL DEFAULT 'pendente',
  PRIMARY KEY (`id_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,1,59.90,'2025-07-18 16:45:58','pix','pendente'),(2,2,59.90,'2025-07-19 10:00:00','Credito','pendente'),(3,3,59.90,'2025-07-20 10:00:00','Debito','pendente'),(4,4,59.90,'2025-07-21 10:00:00','boleto','pendente'),(5,5,59.90,'2025-07-22 10:00:00','pix','pendente'),(6,6,59.90,'2025-07-23 10:00:00','pix','pendente'),(8,1,701.10,'2025-07-19 20:27:01','Debito','pendente');
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `id_pessoa` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `genero` enum('Masculino','Feminino','Outro') NOT NULL DEFAULT 'Outro',
  `data_nascimento` date NOT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `situacao` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id_pessoa`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'Ana Silva','ana@email.com','12345678900','Feminino','1990-05-15','2025-07-18 16:45:58','A'),(2,'Vitor Pessoa Silva','vitorsilvapessoa97@gmail.com','073.166.211-33','Masculino','2002-08-02','2025-07-18 17:40:36','A'),(3,'Carlos Mendes','carlos.mendes@email.com','321.456.789-00','Masculino','1988-03-22','2025-07-18 18:43:18','A'),(4,'Juliana Costa','juliana.costa@email.com','987.654.321-00','Feminino','1995-11-10','2025-07-18 18:43:18','A'),(5,'Marcos Lima','marcos.lima@email.com','654.321.987-00','Masculino','1982-07-08','2025-07-18 18:43:18','A'),(6,'Patrícia Rocha','patricia.rocha@email.com','789.123.456-00','Feminino','1991-04-18','2025-07-18 18:43:18','A'),(7,'Eduardo Nunes','eduardo.nunes@email.com','456.789.123-00','Masculino','1993-09-26','2025-07-18 18:43:18','A'),(8,'Larissa Alves','larissa.alves@email.com','159.357.486-00','Feminino','1998-01-05','2025-07-18 18:43:18','A'),(9,'Fernando Reis','fernando.reis@email.com','951.753.852-00','Masculino','1990-06-12','2025-07-18 18:43:18','A'),(10,'Camila Moreira','camila.moreira@email.com','753.159.456-00','Feminino','2000-12-20','2025-07-18 18:43:18','A'),(15,'Gustavo Lima','GustavoLima@gmail.com.br','111.222.444-77','Masculino','2001-07-12','2025-07-19 20:40:30','A'),(16,'Susy Teixeira','Susy@456.com.br','000.333.455-78','Feminino','1997-12-01','2025-07-19 20:43:51','A'),(17,'Ronaldinho Arantes','Ronaldinho@345.com.br','098.765.456-22','Masculino','1971-09-12','2025-07-19 21:34:37','A'),(19,'Ronaldinho','ronaldinho@gmail.com','111.222.333-77','Masculino','2000-09-12','2025-07-19 21:36:34','A'),(20,'Lionel Messi','messi@gmail.com','444.222.111-33','Masculino','1984-06-07','2025-07-19 23:33:14','A'),(21,'Cristiano Ronaldo','CR7@gmail.com','111.222.333-08','Masculino','1986-10-12','2025-07-20 11:44:26','A'),(22,'Neymar JR','ney@gmail.com','074.122.334-00','Masculino','1990-08-07','2025-07-20 13:40:17','A');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoas_deletadas`
--

DROP TABLE IF EXISTS `pessoas_deletadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoas_deletadas` (
  `id_pessoa` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `genero` enum('Masculino','Feminino','Outro') NOT NULL DEFAULT 'Outro',
  `data_nascimento` date NOT NULL,
  `data_cadastro` datetime DEFAULT CURRENT_TIMESTAMP,
  `situacao` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id_pessoa`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoas_deletadas`
--

LOCK TABLES `pessoas_deletadas` WRITE;
/*!40000 ALTER TABLE `pessoas_deletadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoas_deletadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `denominacao` varchar(30) NOT NULL,
  `quantidade_estoque` int NOT NULL,
  `preco` decimal(5,2) NOT NULL,
  `situacao` enum('Ativo','Esgotado','Descontinuado') NOT NULL DEFAULT 'Ativo',
  `id_descricao` int NOT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `id_descricao` (`id_descricao`),
  CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`id_descricao`) REFERENCES `descricao` (`id_descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Camisa Preta M',97,59.90,'Ativo',1),(2,'Camisa Branca G',8,64.90,'Ativo',2),(3,'Camisa Azul P',5,49.90,'Ativo',3),(4,'Camisa Verde GG',4,55.00,'Ativo',4),(5,'Camisa Amarela M',2,60.00,'Ativo',5),(6,'Camisa Listrada G',50,69.90,'Ativo',6),(7,'Camisa Cinza M',80,58.00,'Ativo',7),(8,'Camisa Vermelha P',45,62.50,'Ativo',8),(9,'Camisa Polo Preta',30,75.00,'Ativo',9),(10,'Camisa Social Branca',90,89.90,'Ativo',10);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos_deletados`
--

DROP TABLE IF EXISTS `produtos_deletados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos_deletados` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `denominacao` varchar(30) NOT NULL,
  `quantidade_estoque` int NOT NULL,
  `preco` decimal(5,2) NOT NULL,
  `situacao` enum('Ativo','Esgotado','Descontinuado') NOT NULL DEFAULT 'Ativo',
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos_deletados`
--

LOCK TABLES `produtos_deletados` WRITE;
/*!40000 ALTER TABLE `produtos_deletados` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos_deletados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone` (
  `id_telefone` int NOT NULL AUTO_INCREMENT,
  `ddd` char(2) NOT NULL,
  `numero` varchar(9) NOT NULL,
  `tipo` enum('residencial','celular','comercial') NOT NULL DEFAULT 'celular',
  `situacao` char(1) NOT NULL DEFAULT 'A',
  `id_pessoa` int NOT NULL,
  PRIMARY KEY (`id_telefone`),
  KEY `id_pessoa` (`id_pessoa`),
  CONSTRAINT `telefone_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone`
--

LOCK TABLES `telefone` WRITE;
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
INSERT INTO `telefone` VALUES (1,'11','912345678','celular','A',1),(2,'11','31234567','residencial','A',1);
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `desconto` decimal(5,2) DEFAULT NULL,
  `fidelidade` varchar(20) DEFAULT NULL,
  `situacao` char(1) NOT NULL DEFAULT 'A',
  `id_pessoa` int NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_pessoa` (`id_pessoa`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'2024-01-01','2025-01-01',5.00,NULL,'A',1),(2,'2024-01-01','2025-01-01',5.00,NULL,'A',2),(3,'2024-01-01','2025-01-01',5.00,NULL,'A',3),(4,'2024-01-01','2025-01-01',5.00,NULL,'A',4),(5,'2024-01-01','2025-01-01',5.00,NULL,'A',5),(6,'2024-01-01','2025-01-01',5.00,NULL,'A',6),(7,'2024-01-01','2025-01-01',5.00,NULL,'A',7),(8,'2024-01-01','2025-01-01',5.00,NULL,'A',8),(9,'2024-01-01','2025-01-01',5.00,NULL,'A',9),(10,'2024-01-01','2025-01-01',5.00,NULL,'A',10);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda` (
  `id_venda` int NOT NULL AUTO_INCREMENT,
  `desconto` decimal(5,2) DEFAULT NULL,
  `acrescimo` decimal(5,2) DEFAULT NULL,
  `cupom` varchar(10) DEFAULT NULL,
  `data_compra` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor_total` decimal(5,2) NOT NULL,
  `situacao` enum('Confirmada','Em andamento','Cancelada') NOT NULL DEFAULT 'Em andamento',
  `id_usuario` int NOT NULL,
  `id_pagamento` int NOT NULL,
  `id_nota_fiscal` int NOT NULL,
  PRIMARY KEY (`id_venda`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_pagamento` (`id_pagamento`),
  KEY `id_nota_fiscal` (`id_nota_fiscal`),
  CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `venda_ibfk_2` FOREIGN KEY (`id_pagamento`) REFERENCES `pagamento` (`id_pagamento`),
  CONSTRAINT `venda_ibfk_3` FOREIGN KEY (`id_nota_fiscal`) REFERENCES `nota_fiscal` (`id_nota_fiscal`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (1,0.00,0.00,'PROMO10','2025-07-18 16:45:58',59.90,'Confirmada',1,1,1),(2,NULL,NULL,NULL,'2025-07-18 19:02:05',70.00,'Confirmada',2,1,2),(3,NULL,NULL,NULL,'2025-07-18 19:02:19',100.00,'Confirmada',3,2,3),(4,NULL,NULL,NULL,'2025-07-18 19:02:31',150.00,'Confirmada',4,4,4),(5,NULL,NULL,NULL,'2025-07-18 19:02:45',200.00,'Confirmada',2,4,5),(6,NULL,NULL,NULL,'2025-07-18 19:03:06',300.00,'Confirmada',5,6,6),(7,0.00,0.00,'PROMO11','2025-07-19 19:14:57',701.00,'Em andamento',10,1,1);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas_deletadas`
--

DROP TABLE IF EXISTS `vendas_deletadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas_deletadas` (
  `id_venda` int NOT NULL AUTO_INCREMENT,
  `desconto` decimal(5,2) DEFAULT NULL,
  `acrescimo` decimal(5,2) DEFAULT NULL,
  `cupom` varchar(10) DEFAULT NULL,
  `data_compra` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor_total` decimal(5,2) NOT NULL,
  `situacao` enum('Confirmada','Em andamento','Cancelada') NOT NULL DEFAULT 'Em andamento',
  PRIMARY KEY (`id_venda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas_deletadas`
--

LOCK TABLES `vendas_deletadas` WRITE;
/*!40000 ALTER TABLE `vendas_deletadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendas_deletadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'vendasblusablusas1'
--

--
-- Dumping routines for database 'vendasblusablusas1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-20 23:29:32
