DROP DATABASE IF EXISTS PORTA_MARC_INFO1D_DICTIONNAIRE_ALTERNATIVE_164;
CREATE DATABASE IF NOT EXISTS PORTA_MARC_INFO1D_DICTIONNAIRE_ALTERNATIVE_164;
USE PORTA_MARC_INFO1D_DICTIONNAIRE_ALTERNATIVE_164;

-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: PORTA_MARC_INFO1D_DICTIONNAIRE_ALTERNATIVE_164
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_adresse`
--


DROP TABLE IF EXISTS `t_adresse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_adresse` (
  `id_adresse` int NOT NULL AUTO_INCREMENT,
  `ville_adre` varchar(50) DEFAULT NULL,
  `NPA_adre` int DEFAULT NULL,
  `rue_adre` varchar(50) DEFAULT NULL,
  `numero_adre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_adresse`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_adresse`
--

LOCK TABLES `t_adresse` WRITE;
/*!40000 ALTER TABLE `t_adresse` DISABLE KEYS */;
INSERT INTO `t_adresse` VALUES (1,'Lausanne',1000,'Chemin de la vi','22'),(2,'Ohio',350418,'Lectus Rd','8122'),(3,'Araucanía',602252,'Eu Ave','247-9173 '),(4,'Ancash',852345,'Eget Street','722-1624'),(5,'Connacht',35772,'P.O. Box 785, Est. St.','7909'),(6,'Nordrhein-Westphalen',770320,'Congue, Rd.','653-9109 ');
/*!40000 ALTER TABLE `t_adresse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_arti_avoir_genr`
--

DROP TABLE IF EXISTS `t_arti_avoir_genr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_arti_avoir_genr` (
  `id_arti_avoir_genr` int NOT NULL AUTO_INCREMENT,
  `fk_article` int DEFAULT NULL,
  `fk_genre` int DEFAULT NULL,
  PRIMARY KEY (`id_arti_avoir_genr`),
  KEY `fk_article` (`fk_article`),
  KEY `fk_genre` (`fk_genre`),
  CONSTRAINT `t_arti_avoir_genr_ibfk_1` FOREIGN KEY (`fk_article`) REFERENCES `t_article` (`id_article`),
  CONSTRAINT `t_arti_avoir_genr_ibfk_2` FOREIGN KEY (`fk_genre`) REFERENCES `t_genre` (`id_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_arti_avoir_genr`
--

LOCK TABLES `t_arti_avoir_genr` WRITE;
/*!40000 ALTER TABLE `t_arti_avoir_genr` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_arti_avoir_genr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_arti_avoir_grap`
--

DROP TABLE IF EXISTS `t_arti_avoir_grap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_arti_avoir_grap` (
  `id_arti_avoir_grap` int NOT NULL AUTO_INCREMENT,
  `fk_article` int DEFAULT NULL,
  `fk_grap` int DEFAULT NULL,
  `date_grap` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_arti_avoir_grap`),
  KEY `fk_article` (`fk_article`),
  KEY `fk_grap` (`fk_grap`),
  CONSTRAINT `t_arti_avoir_grap_ibfk_1` FOREIGN KEY (`fk_article`) REFERENCES `t_article` (`id_article`),
  CONSTRAINT `t_arti_avoir_grap_ibfk_2` FOREIGN KEY (`fk_grap`) REFERENCES `t_graphie` (`id_graphie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_arti_avoir_grap`
--

LOCK TABLES `t_arti_avoir_grap` WRITE;
/*!40000 ALTER TABLE `t_arti_avoir_grap` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_arti_avoir_grap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_arti_avoir_imag`
--

DROP TABLE IF EXISTS `t_arti_avoir_imag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_arti_avoir_imag` (
  `id_arti_avoir_imag` int NOT NULL AUTO_INCREMENT,
  `fk_article` int DEFAULT NULL,
  `fk_image` int DEFAULT NULL,
  PRIMARY KEY (`id_arti_avoir_imag`),
  KEY `fk_article` (`fk_article`),
  KEY `fk_image` (`fk_image`),
  CONSTRAINT `t_arti_avoir_imag_ibfk_1` FOREIGN KEY (`fk_article`) REFERENCES `t_article` (`id_article`),
  CONSTRAINT `t_arti_avoir_imag_ibfk_2` FOREIGN KEY (`fk_image`) REFERENCES `t_image` (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_arti_avoir_imag`
--

LOCK TABLES `t_arti_avoir_imag` WRITE;
/*!40000 ALTER TABLE `t_arti_avoir_imag` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_arti_avoir_imag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_article`
--

DROP TABLE IF EXISTS `t_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_article` (
  `id_article` int NOT NULL AUTO_INCREMENT,
  `fk_classe_gramaticale` int DEFAULT NULL,
  PRIMARY KEY (`id_article`),
  KEY `fk_classe_gramaticale` (`fk_classe_gramaticale`),
  CONSTRAINT `t_article_ibfk_1` FOREIGN KEY (`fk_classe_gramaticale`) REFERENCES `t_classe_gramaticale` (`id_classe_gramaticale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_article`
--

LOCK TABLES `t_article` WRITE;
/*!40000 ALTER TABLE `t_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_classe_gramaticale`
--

DROP TABLE IF EXISTS `t_classe_gramaticale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_classe_gramaticale` (
  `id_classe_gramaticale` int NOT NULL AUTO_INCREMENT,
  `nom_clas` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_classe_gramaticale`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_classe_gramaticale`
--

LOCK TABLES `t_classe_gramaticale` WRITE;
/*!40000 ALTER TABLE `t_classe_gramaticale` DISABLE KEYS */;
INSERT INTO `t_classe_gramaticale` VALUES (1,'vèrb'),(2,'nõ komũ'),(3,'préposisyõ'),(4,'adjèktif'),(5,'advèrb'),(6,'artikl');
/*!40000 ALTER TABLE `t_classe_gramaticale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_exemple`
--

DROP TABLE IF EXISTS `t_exemple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_exemple` (
  `id_exemple` int NOT NULL AUTO_INCREMENT,
  `texte_exem` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_exemple`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_exemple`
--

LOCK TABLES `t_exemple` WRITE;
/*!40000 ALTER TABLE `t_exemple` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_exemple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_genre`
--

DROP TABLE IF EXISTS `t_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_genre` (
  `id_genre` int NOT NULL AUTO_INCREMENT,
  `nom_genr` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_genre`
--

LOCK TABLES `t_genre` WRITE;
/*!40000 ALTER TABLE `t_genre` DISABLE KEYS */;
INSERT INTO `t_genre` VALUES (1,'maskulĩ'),(2,'féminĩ');
/*!40000 ALTER TABLE `t_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_graphie`
--

DROP TABLE IF EXISTS `t_graphie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_graphie` (
  `id_graphie` int NOT NULL AUTO_INCREMENT,
  `graphie_grap` varchar(255) DEFAULT NULL,
  `phonetique_grap` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_graphie`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_graphie`
--

LOCK TABLES `t_graphie` WRITE;
/*!40000 ALTER TABLE `t_graphie` DISABLE KEYS */;
INSERT INTO `t_graphie` VALUES (1,'mèzõ','\\mɛ.zɔ̃\\'),(2,'ané','\\a.ne\\'),(3,'vwar','\\vwar\\'),(4,'arbr','\\aʁbʁ\\'),(5,'ardër','\\aʁ.dœʁ\\'),(6,'arm','\\aʁm\\');
/*!40000 ALTER TABLE `t_graphie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_image`
--

DROP TABLE IF EXISTS `t_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_image` (
  `id_image` int NOT NULL AUTO_INCREMENT,
  `description_imag` varchar(255) DEFAULT NULL,
  `url_imag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_image`
--

LOCK TABLES `t_image` WRITE;
/*!40000 ALTER TABLE `t_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_mail`
--

DROP TABLE IF EXISTS `t_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_mail` (
  `id_mail` int NOT NULL AUTO_INCREMENT,
  `nom_mail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_mail`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_mail`
--

LOCK TABLES `t_mail` WRITE;
/*!40000 ALTER TABLE `t_mail` DISABLE KEYS */;
INSERT INTO `t_mail` VALUES (1,'a@a.a'),(2,'b@b.b'),(3,'c@c.c'),(4,'d@d.d'),(5,'sed.nec.metus@google.edu'),(6,'vitae.nibh@protonmail.ca'),(7,'nunc.ac@aol.com'),(8,'semper@yahoo.couk'),(9,'sed.diam@google.net'),(10,'sodales.at@protonmail.org');
/*!40000 ALTER TABLE `t_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_pays`
--

DROP TABLE IF EXISTS `t_pays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_pays` (
  `id_pays` int NOT NULL AUTO_INCREMENT,
  `nom_pays` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pays`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pays`
--

LOCK TABLES `t_pays` WRITE;
/*!40000 ALTER TABLE `t_pays` DISABLE KEYS */;
INSERT INTO `t_pays` VALUES (1,'Suisse'),(2,'France'),(3,'Norvège'),(4,'Brésil'),(5,'Belgique'),(6,'Canada'),(7,'Royaume-Uni');
/*!40000 ALTER TABLE `t_pays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_pers_autoriser_imag`
--

DROP TABLE IF EXISTS `t_pers_autoriser_imag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_pers_autoriser_imag` (
  `id_pers_autoriser_imag` int NOT NULL AUTO_INCREMENT,
  `fk_personne` int DEFAULT NULL,
  `fk_image` int DEFAULT NULL,
  PRIMARY KEY (`id_pers_autoriser_imag`),
  KEY `fk_personne` (`fk_personne`),
  KEY `fk_image` (`fk_image`),
  CONSTRAINT `t_pers_autoriser_imag_ibfk_1` FOREIGN KEY (`fk_personne`) REFERENCES `t_personne` (`id_personne`),
  CONSTRAINT `t_pers_autoriser_imag_ibfk_2` FOREIGN KEY (`fk_image`) REFERENCES `t_image` (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pers_autoriser_imag`
--

LOCK TABLES `t_pers_autoriser_imag` WRITE;
/*!40000 ALTER TABLE `t_pers_autoriser_imag` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_pers_autoriser_imag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_pers_avoir_imag`
--

DROP TABLE IF EXISTS `t_pers_avoir_imag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_pers_avoir_imag` (
  `id_pers_avoir_imag` int NOT NULL AUTO_INCREMENT,
  `fk_personne` int DEFAULT NULL,
  `fk_image` int DEFAULT NULL,
  PRIMARY KEY (`id_pers_avoir_imag`),
  KEY `fk_personne` (`fk_personne`),
  KEY `fk_image` (`fk_image`),
  CONSTRAINT `t_pers_avoir_imag_ibfk_1` FOREIGN KEY (`fk_personne`) REFERENCES `t_personne` (`id_personne`),
  CONSTRAINT `t_pers_avoir_imag_ibfk_2` FOREIGN KEY (`fk_image`) REFERENCES `t_image` (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pers_avoir_imag`
--

LOCK TABLES `t_pers_avoir_imag` WRITE;
/*!40000 ALTER TABLE `t_pers_avoir_imag` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_pers_avoir_imag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_pers_avoir_mail`
--

DROP TABLE IF EXISTS `t_pers_avoir_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_pers_avoir_mail` (
  `id_pers_avoir_mail` int NOT NULL AUTO_INCREMENT,
  `fk_personne` int DEFAULT NULL,
  `fk_mail` int DEFAULT NULL,
  `date_mail` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pers_avoir_mail`),
  KEY `fk_personne` (`fk_personne`),
  KEY `fk_mail` (`fk_mail`),
  CONSTRAINT `t_pers_avoir_mail_ibfk_1` FOREIGN KEY (`fk_personne`) REFERENCES `t_personne` (`id_personne`),
  CONSTRAINT `t_pers_avoir_mail_ibfk_2` FOREIGN KEY (`fk_mail`) REFERENCES `t_mail` (`id_mail`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pers_avoir_mail`
--

LOCK TABLES `t_pers_avoir_mail` WRITE;
/*!40000 ALTER TABLE `t_pers_avoir_mail` DISABLE KEYS */;
INSERT INTO `t_pers_avoir_mail` VALUES (1,5,2,'2022-11-24 06:55:35'),(2,5,1,'2022-11-24 06:57:41'),(3,5,9,'2022-12-12 08:33:04'),(4,4,8,'2022-12-12 08:33:04'),(5,3,7,'2022-12-12 08:33:04'),(6,2,6,'2022-12-12 08:33:04'),(7,1,5,'2022-12-12 08:33:04');
/*!40000 ALTER TABLE `t_pers_avoir_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_pers_avoir_prof`
--

DROP TABLE IF EXISTS `t_pers_avoir_prof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_pers_avoir_prof` (
  `id_pers_avoir_prof` int NOT NULL AUTO_INCREMENT,
  `fk_personne` int DEFAULT NULL,
  `fk_profession` int DEFAULT NULL,
  `date_prof` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pers_avoir_prof`),
  KEY `fk_personne` (`fk_personne`),
  KEY `fk_profession` (`fk_profession`),
  CONSTRAINT `t_pers_avoir_prof_ibfk_1` FOREIGN KEY (`fk_personne`) REFERENCES `t_personne` (`id_personne`),
  CONSTRAINT `t_pers_avoir_prof_ibfk_2` FOREIGN KEY (`fk_profession`) REFERENCES `t_profession` (`id_profession`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pers_avoir_prof`
--

LOCK TABLES `t_pers_avoir_prof` WRITE;
/*!40000 ALTER TABLE `t_pers_avoir_prof` DISABLE KEYS */;
INSERT INTO `t_pers_avoir_prof` VALUES (1,1,1,'2022-12-07 07:45:28'),(2,5,7,'2022-12-12 08:34:35'),(3,4,6,'2022-12-12 08:34:35'),(4,3,5,'2022-12-12 08:34:35'),(5,2,4,'2022-12-12 08:34:35'),(6,1,3,'2022-12-12 08:34:35');
/*!40000 ALTER TABLE `t_pers_avoir_prof` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_pers_avoir_tele`
--

DROP TABLE IF EXISTS `t_pers_avoir_tele`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_pers_avoir_tele` (
  `id_pers_avoir_tele` int NOT NULL AUTO_INCREMENT,
  `fk_personne` int DEFAULT NULL,
  `fk_telephone` int DEFAULT NULL,
  `date_tele` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pers_avoir_tele`),
  KEY `fk_personne` (`fk_personne`),
  KEY `fk_telephone` (`fk_telephone`),
  CONSTRAINT `t_pers_avoir_tele_ibfk_1` FOREIGN KEY (`fk_personne`) REFERENCES `t_personne` (`id_personne`),
  CONSTRAINT `t_pers_avoir_tele_ibfk_2` FOREIGN KEY (`fk_telephone`) REFERENCES `t_telephone` (`id_telephone`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pers_avoir_tele`
--

LOCK TABLES `t_pers_avoir_tele` WRITE;
/*!40000 ALTER TABLE `t_pers_avoir_tele` DISABLE KEYS */;
INSERT INTO `t_pers_avoir_tele` VALUES (1,1,1,'2022-11-30 20:24:17'),(2,5,7,'2022-12-12 08:35:54'),(3,4,6,'2022-12-12 08:35:54'),(4,3,5,'2022-12-12 08:35:54'),(5,2,4,'2022-12-12 08:35:54'),(6,1,3,'2022-12-12 08:35:54');
/*!40000 ALTER TABLE `t_pers_avoir_tele` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_pers_habiter_adre`
--

DROP TABLE IF EXISTS `t_pers_habiter_adre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_pers_habiter_adre` (
  `id_pers_habiter_adre` int NOT NULL AUTO_INCREMENT,
  `fk_personne` int DEFAULT NULL,
  `fk_adresse` int DEFAULT NULL,
  `date_adre` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pers_habiter_adre`),
  KEY `fk_personne` (`fk_personne`),
  KEY `fk_adresse` (`fk_adresse`),
  CONSTRAINT `t_pers_habiter_adre_ibfk_1` FOREIGN KEY (`fk_personne`) REFERENCES `t_personne` (`id_personne`),
  CONSTRAINT `t_pers_habiter_adre_ibfk_2` FOREIGN KEY (`fk_adresse`) REFERENCES `t_adresse` (`id_adresse`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pers_habiter_adre`
--

LOCK TABLES `t_pers_habiter_adre` WRITE;
/*!40000 ALTER TABLE `t_pers_habiter_adre` DISABLE KEYS */;
INSERT INTO `t_pers_habiter_adre` VALUES (1,1,1,'2022-11-30 20:24:29'),(2,5,6,'2022-12-12 08:37:03'),(3,4,5,'2022-12-12 08:37:03'),(4,3,4,'2022-12-12 08:37:03'),(5,2,3,'2022-12-12 08:37:03'),(6,1,2,'2022-12-12 08:37:03');
/*!40000 ALTER TABLE `t_pers_habiter_adre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_pers_ressortir_pays`
--

DROP TABLE IF EXISTS `t_pers_ressortir_pays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_pers_ressortir_pays` (
  `id_pers_ressortir_pays` int NOT NULL AUTO_INCREMENT,
  `fk_personne` int DEFAULT NULL,
  `fk_pays` int DEFAULT NULL,
  `date_pays` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pers_ressortir_pays`),
  KEY `fk_personne` (`fk_personne`),
  KEY `fk_pays` (`fk_pays`),
  CONSTRAINT `t_pers_ressortir_pays_ibfk_1` FOREIGN KEY (`fk_personne`) REFERENCES `t_personne` (`id_personne`),
  CONSTRAINT `t_pers_ressortir_pays_ibfk_2` FOREIGN KEY (`fk_pays`) REFERENCES `t_pays` (`id_pays`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pers_ressortir_pays`
--

LOCK TABLES `t_pers_ressortir_pays` WRITE;
/*!40000 ALTER TABLE `t_pers_ressortir_pays` DISABLE KEYS */;
INSERT INTO `t_pers_ressortir_pays` VALUES (1,1,1,'2022-11-30 20:24:45'),(2,5,7,'2022-12-12 08:38:18'),(3,4,6,'2022-12-12 08:38:18'),(4,3,5,'2022-12-12 08:38:18'),(5,2,4,'2022-12-12 08:38:18'),(6,1,3,'2022-12-12 08:38:18');
/*!40000 ALTER TABLE `t_pers_ressortir_pays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_personne`
--

DROP TABLE IF EXISTS `t_personne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_personne` (
  `id_personne` int NOT NULL AUTO_INCREMENT,
  `nom_pers` varchar(50) DEFAULT NULL,
  `prenom_pers` varchar(50) DEFAULT NULL,
  `date_naissance_pers` date DEFAULT NULL,
  `taille_pers` int DEFAULT NULL,
  `masse_pers` int DEFAULT NULL,
  `sexe_pers` varchar(50) DEFAULT NULL,
  `lieu_naissance_pers` varchar(50) DEFAULT NULL,
  `groupe_sanguin_pers` varchar(50) DEFAULT NULL,
  `chromosomes_pers` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_personne`
--

LOCK TABLES `t_personne` WRITE;
/*!40000 ALTER TABLE `t_personne` DISABLE KEYS */;
INSERT INTO `t_personne` VALUES (1,'Cadman','Doyle','2012-08-01',180,60,'f','ici','c++','xx'),(2,'Valenzuela','Cassandra','2000-08-03',170,80,'f','non','a-','xx'),(3,'Brooks','Ferris','1989-11-01',163,90,'m','là-bas','o','xx'),(4,'Monroe','Jarrod','1989-11-11',183,83,'m',NULL,'a+','xy'),(5,'Alford','Sasha','1980-01-11',166,120,'f','là','o','xx'),(6,' ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_personne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_profession`
--

DROP TABLE IF EXISTS `t_profession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_profession` (
  `id_profession` int NOT NULL AUTO_INCREMENT,
  `nom_prof` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_profession`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_profession`
--

LOCK TABLES `t_profession` WRITE;
/*!40000 ALTER TABLE `t_profession` DISABLE KEYS */;
INSERT INTO `t_profession` VALUES (1,'boulanger'),(2,'professeur'),(3,'médecin'),(4,'mineur'),(5,'directeur'),(6,'fermier'),(7,'auteur');
/*!40000 ALTER TABLE `t_profession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sens`
--

DROP TABLE IF EXISTS `t_sens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sens` (
  `id_sens` int NOT NULL AUTO_INCREMENT,
  `definition_sens` varchar(255) DEFAULT NULL,
  `fk_article` int DEFAULT NULL,
  PRIMARY KEY (`id_sens`),
  KEY `fk_article` (`fk_article`),
  CONSTRAINT `t_sens_ibfk_1` FOREIGN KEY (`fk_article`) REFERENCES `t_article` (`id_article`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sens`
--

LOCK TABLES `t_sens` WRITE;
/*!40000 ALTER TABLE `t_sens` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_sens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sens_citer_exem`
--

DROP TABLE IF EXISTS `t_sens_citer_exem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sens_citer_exem` (
  `id_sens_citer_exem` int NOT NULL AUTO_INCREMENT,
  `fk_sens` int DEFAULT NULL,
  `fk_exemple` int DEFAULT NULL,
  `date_exem` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_sens_citer_exem`),
  KEY `fk_sens` (`fk_sens`),
  KEY `fk_exemple` (`fk_exemple`),
  CONSTRAINT `t_sens_citer_exem_ibfk_1` FOREIGN KEY (`fk_sens`) REFERENCES `t_sens` (`id_sens`),
  CONSTRAINT `t_sens_citer_exem_ibfk_2` FOREIGN KEY (`fk_exemple`) REFERENCES `t_exemple` (`id_exemple`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sens_citer_exem`
--

LOCK TABLES `t_sens_citer_exem` WRITE;
/*!40000 ALTER TABLE `t_sens_citer_exem` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_sens_citer_exem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_telephone`
--

DROP TABLE IF EXISTS `t_telephone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_telephone` (
  `id_telephone` int NOT NULL AUTO_INCREMENT,
  `num_tele` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_telephone`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_telephone`
--

LOCK TABLES `t_telephone` WRITE;
/*!40000 ALTER TABLE `t_telephone` DISABLE KEYS */;
INSERT INTO `t_telephone` VALUES (1,'0000000'),(2,'1111111'),(3,'(492) 534-8744'),(4,'(922) 450-6630'),(5,'1-660-648-1952'),(6,'(724) 860-0319'),(7,'(277) 863-6707');
/*!40000 ALTER TABLE `t_telephone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-11 23:37:50
