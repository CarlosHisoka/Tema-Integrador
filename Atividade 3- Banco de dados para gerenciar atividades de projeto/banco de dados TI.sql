-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: tema_integrador
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `cronogramas`
--

DROP TABLE IF EXISTS `cronogramas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cronogramas` (
  `tarefa_id` int NOT NULL AUTO_INCREMENT,
  `projeto_id` int DEFAULT NULL,
  `descricao` text,
  `data_inicio` date DEFAULT NULL,
  `data_termino` date DEFAULT NULL,
  `responsavel_id` int DEFAULT NULL,
  PRIMARY KEY (`tarefa_id`),
  KEY `projeto_id` (`projeto_id`),
  KEY `responsavel_id` (`responsavel_id`),
  CONSTRAINT `cronogramas_ibfk_1` FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`projeto_id`),
  CONSTRAINT `cronogramas_ibfk_2` FOREIGN KEY (`responsavel_id`) REFERENCES `responsaveis` (`responsavel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cronogramas`
--

LOCK TABLES `cronogramas` WRITE;
/*!40000 ALTER TABLE `cronogramas` DISABLE KEYS */;
INSERT INTO `cronogramas` VALUES (1,1,'Planejamento inicial','2024-01-01','2024-01-15',1),(2,1,'Implementação de medidas','2024-02-01','2024-05-31',2);
/*!40000 ALTER TABLE `cronogramas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metas`
--

DROP TABLE IF EXISTS `metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metas` (
  `meta_id` int NOT NULL AUTO_INCREMENT,
  `projeto_id` int DEFAULT NULL,
  `descricao` text,
  `data_prevista` date DEFAULT NULL,
  `indicador_sucesso` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `projeto_id` (`projeto_id`),
  CONSTRAINT `metas_ibfk_1` FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`projeto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metas`
--

LOCK TABLES `metas` WRITE;
/*!40000 ALTER TABLE `metas` DISABLE KEYS */;
INSERT INTO `metas` VALUES (1,1,'Reduzir emissões de CO2 em 10%','2024-06-30','Emissões reduzidas em 10%'),(2,1,'Aumentar uso de energia renovável','2024-12-31','Uso de energia renovável aumentado em 15%');
/*!40000 ALTER TABLE `metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projetos`
--

DROP TABLE IF EXISTS `projetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projetos` (
  `projeto_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` text,
  `data_inicio` date DEFAULT NULL,
  `data_termino` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`projeto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projetos`
--

LOCK TABLES `projetos` WRITE;
/*!40000 ALTER TABLE `projetos` DISABLE KEYS */;
INSERT INTO `projetos` VALUES (1,'Projeto A','Descrição do Projeto A','2024-01-01','2024-12-31','Em andamento'),(2,'Projeto B','Descrição do Projeto B','2023-05-01','2023-10-31','Concluído');
/*!40000 ALTER TABLE `projetos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsaveis`
--

DROP TABLE IF EXISTS `responsaveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsaveis` (
  `responsavel_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `contato` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`responsavel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsaveis`
--

LOCK TABLES `responsaveis` WRITE;
/*!40000 ALTER TABLE `responsaveis` DISABLE KEYS */;
INSERT INTO `responsaveis` VALUES (1,'João Silva','Gerente de Projeto','joao@empresa.com'),(2,'Maria Oliveira','Coordenadora de Sustentabilidade','maria@empresa.com');
/*!40000 ALTER TABLE `responsaveis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultados`
--

DROP TABLE IF EXISTS `resultados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultados` (
  `resultado_id` int NOT NULL AUTO_INCREMENT,
  `projeto_id` int DEFAULT NULL,
  `descricao` text,
  `indicador_desempenho` varchar(255) DEFAULT NULL,
  `comentarios` text,
  PRIMARY KEY (`resultado_id`),
  KEY `projeto_id` (`projeto_id`),
  CONSTRAINT `resultados_ibfk_1` FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`projeto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultados`
--

LOCK TABLES `resultados` WRITE;
/*!40000 ALTER TABLE `resultados` DISABLE KEYS */;
INSERT INTO `resultados` VALUES (1,1,'Emissões reduzidas em 8%','Redução de CO2','Bom progresso, continuar esforços'),(2,2,'Uso de energia renovável aumentou em 12%','Aumento de energia renovável','Resultados positivos, excederam expectativas');
/*!40000 ALTER TABLE `resultados` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-20 19:58:21
