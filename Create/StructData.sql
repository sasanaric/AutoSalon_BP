CREATE DATABASE  IF NOT EXISTS `autosalon` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `autosalon`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: autosalon
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `adresa`
--

DROP TABLE IF EXISTS `adresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adresa` (
  `idAdresa` int NOT NULL AUTO_INCREMENT,
  `nazivUlice` varchar(45) NOT NULL,
  `brojUlice` varchar(45) NOT NULL,
  `nazivGrada` varchar(45) NOT NULL,
  PRIMARY KEY (`idAdresa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresa`
--

LOCK TABLES `adresa` WRITE;
/*!40000 ALTER TABLE `adresa` DISABLE KEYS */;
INSERT INTO `adresa` VALUES (1,'Nikola Tesla','bb','Kotor Varos');
/*!40000 ALTER TABLE `adresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automobil`
--

DROP TABLE IF EXISTS `automobil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `automobil` (
  `idAutomobil` int NOT NULL AUTO_INCREMENT,
  `idModel` int NOT NULL,
  `idTip` int NOT NULL,
  `idMotor` int NOT NULL,
  `idOprema` int NOT NULL,
  `idBojaAuta` int NOT NULL,
  `cijenaAutomobila` decimal(10,0) NOT NULL,
  PRIMARY KEY (`idAutomobil`),
  KEY `fk_automobil_oprema1_idx` (`idOprema`),
  KEY `fk_automobil_motor1_idx` (`idMotor`),
  KEY `fk_automobil_model1_idx` (`idModel`),
  KEY `fk_automobil_bojaAuta1_idx` (`idBojaAuta`),
  KEY `fk_automobil_tip1_idx` (`idTip`),
  CONSTRAINT `fk_automobil_bojaAuta1` FOREIGN KEY (`idBojaAuta`) REFERENCES `bojaauta` (`idBojaAuta`),
  CONSTRAINT `fk_automobil_model1` FOREIGN KEY (`idModel`) REFERENCES `model` (`idModel`),
  CONSTRAINT `fk_automobil_motor1` FOREIGN KEY (`idMotor`) REFERENCES `motor` (`idMotor`),
  CONSTRAINT `fk_automobil_oprema1` FOREIGN KEY (`idOprema`) REFERENCES `oprema` (`idOprema`),
  CONSTRAINT `fk_automobil_tip1` FOREIGN KEY (`idTip`) REFERENCES `tip` (`idTip`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automobil`
--

LOCK TABLES `automobil` WRITE;
/*!40000 ALTER TABLE `automobil` DISABLE KEYS */;
INSERT INTO `automobil` VALUES (13,1,2,1,3,1,87000),(14,2,2,2,3,1,108750),(15,11,2,1,2,1,84000),(16,6,1,1,1,4,35000),(17,9,5,2,2,3,66000),(18,7,1,3,3,6,36250),(19,4,4,2,2,2,78000),(20,4,4,2,2,5,78000),(21,10,3,1,1,3,70000),(22,11,5,1,2,3,84000);
/*!40000 ALTER TABLE `automobil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `automobil_info`
--

DROP TABLE IF EXISTS `automobil_info`;
/*!50001 DROP VIEW IF EXISTS `automobil_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `automobil_info` AS SELECT 
 1 AS `idAutomobil`,
 1 AS `nazivProizvodjaca`,
 1 AS `nazivModela`,
 1 AS `tipAutomobila`,
 1 AS `tipMotora`,
 1 AS `nivoOpreme`,
 1 AS `bojaAuta`,
 1 AS `cijenaAutomobila`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bojaauta`
--

DROP TABLE IF EXISTS `bojaauta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bojaauta` (
  `idBojaAuta` int NOT NULL AUTO_INCREMENT,
  `bojaAuta` varchar(45) NOT NULL,
  PRIMARY KEY (`idBojaAuta`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bojaauta`
--

LOCK TABLES `bojaauta` WRITE;
/*!40000 ALTER TABLE `bojaauta` DISABLE KEYS */;
INSERT INTO `bojaauta` VALUES (1,'Crna'),(2,'Bijela'),(3,'Crvena'),(4,'Plava'),(5,'Siva'),(6,'Zuta');
/*!40000 ALTER TABLE `bojaauta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `broj_prodanih_po_proizvodjacu`
--

DROP TABLE IF EXISTS `broj_prodanih_po_proizvodjacu`;
/*!50001 DROP VIEW IF EXISTS `broj_prodanih_po_proizvodjacu`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `broj_prodanih_po_proizvodjacu` AS SELECT 
 1 AS `nazivProizvodjaca`,
 1 AS `brojProdanih`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `garancija`
--

DROP TABLE IF EXISTS `garancija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garancija` (
  `idGarancija` int NOT NULL AUTO_INCREMENT,
  `godina` int NOT NULL,
  PRIMARY KEY (`idGarancija`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garancija`
--

LOCK TABLES `garancija` WRITE;
/*!40000 ALTER TABLE `garancija` DISABLE KEYS */;
INSERT INTO `garancija` VALUES (1,3),(2,5);
/*!40000 ALTER TABLE `garancija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kupac`
--

DROP TABLE IF EXISTS `kupac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kupac` (
  `idKupac` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `brojTelefona` varchar(45) NOT NULL,
  PRIMARY KEY (`idKupac`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kupac`
--

LOCK TABLES `kupac` WRITE;
/*!40000 ALTER TABLE `kupac` DISABLE KEYS */;
INSERT INTO `kupac` VALUES (1,'KupacIme','KupacPrezime','010101'),(2,'Kupac2','Kupac2Pre','1234');
/*!40000 ALTER TABLE `kupac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model` (
  `idModel` int NOT NULL AUTO_INCREMENT,
  `idProizvodjac` int NOT NULL,
  `nazivModela` varchar(45) NOT NULL,
  `cijenaModela` decimal(10,0) NOT NULL,
  PRIMARY KEY (`idModel`),
  KEY `fk_model_proizvodjac1_idx` (`idProizvodjac`),
  CONSTRAINT `fk_model_proizvodjac1` FOREIGN KEY (`idProizvodjac`) REFERENCES `proizvodjac` (`idProizvodjac`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES (1,1,'A4',60000),(2,1,'A5',75000),(3,1,'Q8',150000),(4,2,'3series',65000),(5,2,'X5',125000),(6,3,'308',35000),(7,3,'208',25000),(8,3,'508',60000),(9,4,'Octavia',55000),(10,4,'Kodiaq',70000),(11,5,'S60',70000),(12,5,'S90',90000),(13,5,'XC90',95000);
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motor`
--

DROP TABLE IF EXISTS `motor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motor` (
  `idMotor` int NOT NULL AUTO_INCREMENT,
  `tipMotora` varchar(45) NOT NULL,
  PRIMARY KEY (`idMotor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motor`
--

LOCK TABLES `motor` WRITE;
/*!40000 ALTER TABLE `motor` DISABLE KEYS */;
INSERT INTO `motor` VALUES (1,'Dizel'),(2,'Benzin'),(3,'Elektricni');
/*!40000 ALTER TABLE `motor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motorimodela`
--

DROP TABLE IF EXISTS `motorimodela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motorimodela` (
  `idModel` int NOT NULL,
  `idMotor` int NOT NULL,
  PRIMARY KEY (`idModel`,`idMotor`),
  KEY `fk_model_has_motor_motor1_idx` (`idMotor`),
  KEY `fk_model_has_motor_model1_idx` (`idModel`),
  CONSTRAINT `fk_model_has_motor_model1` FOREIGN KEY (`idModel`) REFERENCES `model` (`idModel`),
  CONSTRAINT `fk_model_has_motor_motor1` FOREIGN KEY (`idMotor`) REFERENCES `motor` (`idMotor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motorimodela`
--

LOCK TABLES `motorimodela` WRITE;
/*!40000 ALTER TABLE `motorimodela` DISABLE KEYS */;
INSERT INTO `motorimodela` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(1,2),(2,2),(3,2),(4,2),(7,2),(9,2),(12,2),(1,3),(6,3),(7,3),(8,3);
/*!40000 ALTER TABLE `motorimodela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nacinplacanja`
--

DROP TABLE IF EXISTS `nacinplacanja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nacinplacanja` (
  `idNacinPlacanja` int NOT NULL AUTO_INCREMENT,
  `nacinPlacanja` varchar(45) NOT NULL,
  PRIMARY KEY (`idNacinPlacanja`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nacinplacanja`
--

LOCK TABLES `nacinplacanja` WRITE;
/*!40000 ALTER TABLE `nacinplacanja` DISABLE KEYS */;
INSERT INTO `nacinplacanja` VALUES (1,'Gotovina'),(2,'Kartica'),(3,'Kriptovaluta');
/*!40000 ALTER TABLE `nacinplacanja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `narudzba`
--

DROP TABLE IF EXISTS `narudzba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `narudzba` (
  `idNarudzba` int NOT NULL AUTO_INCREMENT,
  `idAutomobil` int NOT NULL,
  `idKupac` int NOT NULL DEFAULT '1',
  `idSalon` int NOT NULL DEFAULT '1',
  `idProdavac` int NOT NULL DEFAULT '1',
  `idNacinPlacanja` int NOT NULL DEFAULT '1',
  `datumNarudzbe` date NOT NULL DEFAULT '2022-09-15',
  `datumDolaska` date NOT NULL DEFAULT '2022-12-15',
  `cijena` decimal(10,0) NOT NULL,
  PRIMARY KEY (`idNarudzba`),
  KEY `fk_narudzba_kupac1_idx` (`idKupac`),
  KEY `fk_narudzba_automobil1_idx` (`idAutomobil`),
  KEY `fk_narudzba_salon1_idx` (`idSalon`),
  KEY `fk_narudzba_prodavac1_idx` (`idProdavac`),
  KEY `fk_narudzba_nacinPlacanja1_idx` (`idNacinPlacanja`),
  CONSTRAINT `fk_narudzba_automobil1` FOREIGN KEY (`idAutomobil`) REFERENCES `automobil` (`idAutomobil`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `narudzba`
--

LOCK TABLES `narudzba` WRITE;
/*!40000 ALTER TABLE `narudzba` DISABLE KEYS */;
INSERT INTO `narudzba` VALUES (7,13,1,1,1,1,'2022-09-15','2022-12-15',87000),(8,14,1,1,1,1,'2022-09-15','2022-12-15',108750),(9,15,1,1,1,1,'2022-09-15','2022-12-15',84000),(10,16,1,1,1,1,'2022-09-15','2022-12-15',35000),(11,17,1,1,1,1,'2022-09-15','2022-12-15',66000),(12,18,1,1,1,1,'2022-09-15','2022-12-15',36250),(13,20,1,1,1,1,'2022-09-15','2022-12-15',78000),(14,21,1,1,1,1,'2022-09-15','2022-12-15',70000),(15,22,1,1,1,1,'2022-09-15','2022-12-15',84000);
/*!40000 ALTER TABLE `narudzba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `narudzba_automobil`
--

DROP TABLE IF EXISTS `narudzba_automobil`;
/*!50001 DROP VIEW IF EXISTS `narudzba_automobil`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `narudzba_automobil` AS SELECT 
 1 AS `idAutomobil`,
 1 AS `idNarudzba`,
 1 AS `datumNarudzbe`,
 1 AS `datumDolaska`,
 1 AS `nazivProizvodjaca`,
 1 AS `nazivModela`,
 1 AS `tipAutomobila`,
 1 AS `tipMotora`,
 1 AS `nivoOpreme`,
 1 AS `bojaAuta`,
 1 AS `cijenaAutomobila`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `narudzba_info`
--

DROP TABLE IF EXISTS `narudzba_info`;
/*!50001 DROP VIEW IF EXISTS `narudzba_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `narudzba_info` AS SELECT 
 1 AS `idNarudzba`,
 1 AS `idAutomobil`,
 1 AS `datumNarudzbe`,
 1 AS `datumDolaska`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `narudzbe_sortirane_cijena`
--

DROP TABLE IF EXISTS `narudzbe_sortirane_cijena`;
/*!50001 DROP VIEW IF EXISTS `narudzbe_sortirane_cijena`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `narudzbe_sortirane_cijena` AS SELECT 
 1 AS `idAutomobil`,
 1 AS `idNarudzba`,
 1 AS `datumNarudzbe`,
 1 AS `datumDolaska`,
 1 AS `nazivProizvodjaca`,
 1 AS `nazivModela`,
 1 AS `tipAutomobila`,
 1 AS `tipMotora`,
 1 AS `nivoOpreme`,
 1 AS `bojaAuta`,
 1 AS `cijenaAutomobila`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `oprema`
--

DROP TABLE IF EXISTS `oprema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oprema` (
  `idOprema` int NOT NULL AUTO_INCREMENT,
  `nivoOpreme` varchar(45) NOT NULL,
  `opis` text NOT NULL,
  `procenat` decimal(2,2) NOT NULL,
  PRIMARY KEY (`idOprema`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oprema`
--

LOCK TABLES `oprema` WRITE;
/*!40000 ALTER TABLE `oprema` DISABLE KEYS */;
INSERT INTO `oprema` VALUES (1,'Standard','Radio,Klima,Alarm',0.00),(2,'Luxury','Standard + Navigacija,Parking Senzori',0.20),(3,'Full','Luxury + Grijanje Sjedista,Kamera',0.45);
/*!40000 ALTER TABLE `oprema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osiguranje`
--

DROP TABLE IF EXISTS `osiguranje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `osiguranje` (
  `idOsiguranje` int NOT NULL AUTO_INCREMENT,
  `nazivOsiguranja` varchar(45) NOT NULL,
  PRIMARY KEY (`idOsiguranje`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osiguranje`
--

LOCK TABLES `osiguranje` WRITE;
/*!40000 ALTER TABLE `osiguranje` DISABLE KEYS */;
INSERT INTO `osiguranje` VALUES (1,'Kasko');
/*!40000 ALTER TABLE `osiguranje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodavac`
--

DROP TABLE IF EXISTS `prodavac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodavac` (
  `idProdavac` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  PRIMARY KEY (`idProdavac`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodavac`
--

LOCK TABLES `prodavac` WRITE;
/*!40000 ALTER TABLE `prodavac` DISABLE KEYS */;
INSERT INTO `prodavac` VALUES (1,'ProdavacIme','ProdavacPrezime');
/*!40000 ALTER TABLE `prodavac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proizvodjac`
--

DROP TABLE IF EXISTS `proizvodjac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proizvodjac` (
  `idProizvodjac` int NOT NULL AUTO_INCREMENT,
  `nazivProizvodjaca` varchar(45) NOT NULL,
  `idGarancija` int NOT NULL,
  PRIMARY KEY (`idProizvodjac`),
  KEY `fk_proizvodjac_garancija_idx` (`idGarancija`),
  CONSTRAINT `fk_proizvodjac_garancija` FOREIGN KEY (`idGarancija`) REFERENCES `garancija` (`idGarancija`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proizvodjac`
--

LOCK TABLES `proizvodjac` WRITE;
/*!40000 ALTER TABLE `proizvodjac` DISABLE KEYS */;
INSERT INTO `proizvodjac` VALUES (1,'Audi',2),(2,'BMW',2),(3,'Peugeot',1),(4,'Skoda',1),(5,'Volvo',2);
/*!40000 ALTER TABLE `proizvodjac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `racun`
--

DROP TABLE IF EXISTS `racun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `racun` (
  `idRacun` int NOT NULL AUTO_INCREMENT,
  `idNarudzba` int NOT NULL,
  `datumPreuzimanja` date NOT NULL,
  PRIMARY KEY (`idRacun`),
  KEY `fk_racun_narudzba1_idx` (`idNarudzba`),
  CONSTRAINT `fk_racun_narudzba1` FOREIGN KEY (`idNarudzba`) REFERENCES `narudzba` (`idNarudzba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `racun`
--

LOCK TABLES `racun` WRITE;
/*!40000 ALTER TABLE `racun` DISABLE KEYS */;
/*!40000 ALTER TABLE `racun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registracija`
--

DROP TABLE IF EXISTS `registracija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registracija` (
  `idRegistracija` int NOT NULL AUTO_INCREMENT,
  `registacijskaOznaka` varchar(45) NOT NULL,
  `datumRegistacije` date NOT NULL,
  `datumIstekaRegistracije` date NOT NULL,
  `idOsiguranje` int NOT NULL,
  `idNarudzba` int NOT NULL,
  PRIMARY KEY (`idRegistracija`),
  KEY `fk_registracija_osiguranje1_idx` (`idOsiguranje`),
  KEY `fk_registracija_narudzba1_idx` (`idNarudzba`),
  CONSTRAINT `fk_registracija_narudzba1` FOREIGN KEY (`idNarudzba`) REFERENCES `narudzba` (`idNarudzba`),
  CONSTRAINT `fk_registracija_osiguranje1` FOREIGN KEY (`idOsiguranje`) REFERENCES `osiguranje` (`idOsiguranje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registracija`
--

LOCK TABLES `registracija` WRITE;
/*!40000 ALTER TABLE `registracija` DISABLE KEYS */;
/*!40000 ALTER TABLE `registracija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salon`
--

DROP TABLE IF EXISTS `salon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salon` (
  `idSalon` int NOT NULL AUTO_INCREMENT,
  `nazivSalona` varchar(45) NOT NULL,
  `lozinka` varchar(45) NOT NULL,
  `idAdresa` int NOT NULL,
  `idOsiguranje` int NOT NULL,
  PRIMARY KEY (`idSalon`),
  KEY `fk_salon_adresa1_idx` (`idAdresa`),
  KEY `fk_salon_osiguranje1_idx` (`idOsiguranje`),
  CONSTRAINT `fk_salon_adresa1` FOREIGN KEY (`idAdresa`) REFERENCES `adresa` (`idAdresa`),
  CONSTRAINT `fk_salon_osiguranje1` FOREIGN KEY (`idOsiguranje`) REFERENCES `osiguranje` (`idOsiguranje`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salon`
--

LOCK TABLES `salon` WRITE;
/*!40000 ALTER TABLE `salon` DISABLE KEYS */;
INSERT INTO `salon` VALUES (1,'AutoSalon','root',1,1),(2,'AutoKuca','root',1,1);
/*!40000 ALTER TABLE `salon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefon`
--

DROP TABLE IF EXISTS `telefon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefon` (
  `idtelefon` int NOT NULL AUTO_INCREMENT,
  `brojTelefona` varchar(45) NOT NULL,
  `idSalon` int NOT NULL,
  PRIMARY KEY (`idtelefon`),
  KEY `fk_telefon_salon1_idx` (`idSalon`),
  CONSTRAINT `fk_telefon_salon1` FOREIGN KEY (`idSalon`) REFERENCES `salon` (`idSalon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefon`
--

LOCK TABLES `telefon` WRITE;
/*!40000 ALTER TABLE `telefon` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tip`
--

DROP TABLE IF EXISTS `tip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tip` (
  `idTip` int NOT NULL AUTO_INCREMENT,
  `tipAutomobila` varchar(45) NOT NULL,
  PRIMARY KEY (`idTip`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tip`
--

LOCK TABLES `tip` WRITE;
/*!40000 ALTER TABLE `tip` DISABLE KEYS */;
INSERT INTO `tip` VALUES (1,'Hatchback'),(2,'Sedan'),(3,'SUV'),(4,'Coupe'),(5,'StationWagon');
/*!40000 ALTER TABLE `tip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipovimodela`
--

DROP TABLE IF EXISTS `tipovimodela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipovimodela` (
  `idModel` int NOT NULL,
  `idTip` int NOT NULL,
  PRIMARY KEY (`idModel`,`idTip`),
  KEY `fk_model_has_tip_tip1_idx` (`idTip`),
  KEY `fk_model_has_tip_model1_idx` (`idModel`),
  CONSTRAINT `fk_model_has_tip_model1` FOREIGN KEY (`idModel`) REFERENCES `model` (`idModel`),
  CONSTRAINT `fk_model_has_tip_tip1` FOREIGN KEY (`idTip`) REFERENCES `tip` (`idTip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipovimodela`
--

LOCK TABLES `tipovimodela` WRITE;
/*!40000 ALTER TABLE `tipovimodela` DISABLE KEYS */;
INSERT INTO `tipovimodela` VALUES (6,1),(7,1),(1,2),(2,2),(4,2),(8,2),(9,2),(11,2),(12,2),(3,3),(5,3),(10,3),(13,3),(1,4),(2,4),(3,4),(4,4),(1,5),(6,5),(8,5),(9,5),(11,5);
/*!40000 ALTER TABLE `tipovimodela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'autosalon'
--
/*!50003 DROP PROCEDURE IF EXISTS `narudzbe_po_proizvodjacu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `narudzbe_po_proizvodjacu`(in proizvodjac varchar(20))
BEGIN
	select * from narudzba_automobil where nazivProizvodjaca = proizvodjac;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `narudzbe_po_tipu_motora` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `narudzbe_po_tipu_motora`(in motor varchar(20))
BEGIN
	select * from narudzba_automobil where tipMotora = motor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `automobil_info`
--

/*!50001 DROP VIEW IF EXISTS `automobil_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `automobil_info` AS select `automobil`.`idAutomobil` AS `idAutomobil`,`proizvodjac`.`nazivProizvodjaca` AS `nazivProizvodjaca`,`model`.`nazivModela` AS `nazivModela`,`tip`.`tipAutomobila` AS `tipAutomobila`,`motor`.`tipMotora` AS `tipMotora`,`oprema`.`nivoOpreme` AS `nivoOpreme`,`bojaauta`.`bojaAuta` AS `bojaAuta`,`automobil`.`cijenaAutomobila` AS `cijenaAutomobila` from ((((((`automobil` join `model` on((`automobil`.`idModel` = `model`.`idModel`))) join `proizvodjac` on((`model`.`idProizvodjac` = `proizvodjac`.`idProizvodjac`))) join `tip` on((`automobil`.`idTip` = `tip`.`idTip`))) join `motor` on((`automobil`.`idMotor` = `motor`.`idMotor`))) join `oprema` on((`automobil`.`idOprema` = `oprema`.`idOprema`))) join `bojaauta` on((`automobil`.`idBojaAuta` = `bojaauta`.`idBojaAuta`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `broj_prodanih_po_proizvodjacu`
--

/*!50001 DROP VIEW IF EXISTS `broj_prodanih_po_proizvodjacu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `broj_prodanih_po_proizvodjacu` AS select `narudzba_automobil`.`nazivProizvodjaca` AS `nazivProizvodjaca`,count(0) AS `brojProdanih` from `narudzba_automobil` group by `narudzba_automobil`.`nazivProizvodjaca` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `narudzba_automobil`
--

/*!50001 DROP VIEW IF EXISTS `narudzba_automobil`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `narudzba_automobil` AS select `narudzba_info`.`idAutomobil` AS `idAutomobil`,`narudzba_info`.`idNarudzba` AS `idNarudzba`,`narudzba_info`.`datumNarudzbe` AS `datumNarudzbe`,`narudzba_info`.`datumDolaska` AS `datumDolaska`,`automobil_info`.`nazivProizvodjaca` AS `nazivProizvodjaca`,`automobil_info`.`nazivModela` AS `nazivModela`,`automobil_info`.`tipAutomobila` AS `tipAutomobila`,`automobil_info`.`tipMotora` AS `tipMotora`,`automobil_info`.`nivoOpreme` AS `nivoOpreme`,`automobil_info`.`bojaAuta` AS `bojaAuta`,`automobil_info`.`cijenaAutomobila` AS `cijenaAutomobila` from (`narudzba_info` join `automobil_info` on((`narudzba_info`.`idAutomobil` = `automobil_info`.`idAutomobil`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `narudzba_info`
--

/*!50001 DROP VIEW IF EXISTS `narudzba_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `narudzba_info` AS select `narudzba`.`idNarudzba` AS `idNarudzba`,`narudzba`.`idAutomobil` AS `idAutomobil`,`narudzba`.`datumNarudzbe` AS `datumNarudzbe`,`narudzba`.`datumDolaska` AS `datumDolaska` from `narudzba` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `narudzbe_sortirane_cijena`
--

/*!50001 DROP VIEW IF EXISTS `narudzbe_sortirane_cijena`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `narudzbe_sortirane_cijena` AS select `narudzba_automobil`.`idAutomobil` AS `idAutomobil`,`narudzba_automobil`.`idNarudzba` AS `idNarudzba`,`narudzba_automobil`.`datumNarudzbe` AS `datumNarudzbe`,`narudzba_automobil`.`datumDolaska` AS `datumDolaska`,`narudzba_automobil`.`nazivProizvodjaca` AS `nazivProizvodjaca`,`narudzba_automobil`.`nazivModela` AS `nazivModela`,`narudzba_automobil`.`tipAutomobila` AS `tipAutomobila`,`narudzba_automobil`.`tipMotora` AS `tipMotora`,`narudzba_automobil`.`nivoOpreme` AS `nivoOpreme`,`narudzba_automobil`.`bojaAuta` AS `bojaAuta`,`narudzba_automobil`.`cijenaAutomobila` AS `cijenaAutomobila` from `narudzba_automobil` order by `narudzba_automobil`.`cijenaAutomobila` desc */;
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

-- Dump completed on 2022-09-06 10:29:10
