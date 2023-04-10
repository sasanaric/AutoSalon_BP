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
-- Dumping data for table `adresa`
--

LOCK TABLES `adresa` WRITE;
/*!40000 ALTER TABLE `adresa` DISABLE KEYS */;
INSERT INTO `adresa` VALUES (1,'Nikola Tesla','bb','Kotor Varos');
/*!40000 ALTER TABLE `adresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `automobil`
--

LOCK TABLES `automobil` WRITE;
/*!40000 ALTER TABLE `automobil` DISABLE KEYS */;
INSERT INTO `automobil` VALUES (13,1,2,1,3,1,87000),(14,2,2,2,3,1,108750),(15,11,2,1,2,1,84000),(16,6,1,1,1,4,35000),(17,9,5,2,2,3,66000),(18,7,1,3,3,6,36250),(19,4,4,2,2,2,78000),(20,4,4,2,2,5,78000),(21,10,3,1,1,3,70000);
/*!40000 ALTER TABLE `automobil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bojaauta`
--

LOCK TABLES `bojaauta` WRITE;
/*!40000 ALTER TABLE `bojaauta` DISABLE KEYS */;
INSERT INTO `bojaauta` VALUES (1,'Crna'),(2,'Bijela'),(3,'Crvena'),(4,'Plava'),(5,'Siva'),(6,'Zuta');
/*!40000 ALTER TABLE `bojaauta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `garancija`
--

LOCK TABLES `garancija` WRITE;
/*!40000 ALTER TABLE `garancija` DISABLE KEYS */;
INSERT INTO `garancija` VALUES (1,3),(2,5);
/*!40000 ALTER TABLE `garancija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `kupac`
--

LOCK TABLES `kupac` WRITE;
/*!40000 ALTER TABLE `kupac` DISABLE KEYS */;
INSERT INTO `kupac` VALUES (1,'KupacIme','KupacPrezime','010101'),(2,'Kupac2','Kupac2Pre','1234');
/*!40000 ALTER TABLE `kupac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES (1,1,'A4',60000),(2,1,'A5',75000),(3,1,'Q8',150000),(4,2,'3series',65000),(5,2,'X5',125000),(6,3,'308',35000),(7,3,'208',25000),(8,3,'508',60000),(9,4,'Octavia',55000),(10,4,'Kodiaq',70000),(11,5,'S60',70000),(12,5,'S90',90000),(13,5,'XC90',95000);
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `motor`
--

LOCK TABLES `motor` WRITE;
/*!40000 ALTER TABLE `motor` DISABLE KEYS */;
INSERT INTO `motor` VALUES (1,'Dizel'),(2,'Benzin'),(3,'Elektricni');
/*!40000 ALTER TABLE `motor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `motorimodela`
--

LOCK TABLES `motorimodela` WRITE;
/*!40000 ALTER TABLE `motorimodela` DISABLE KEYS */;
INSERT INTO `motorimodela` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(1,2),(2,2),(3,2),(4,2),(7,2),(9,2),(12,2),(1,3),(6,3),(7,3),(8,3);
/*!40000 ALTER TABLE `motorimodela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `nacinplacanja`
--

LOCK TABLES `nacinplacanja` WRITE;
/*!40000 ALTER TABLE `nacinplacanja` DISABLE KEYS */;
INSERT INTO `nacinplacanja` VALUES (1,'Gotovina'),(2,'Kartica'),(3,'Kriptovaluta');
/*!40000 ALTER TABLE `nacinplacanja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `narudzba`
--

LOCK TABLES `narudzba` WRITE;
/*!40000 ALTER TABLE `narudzba` DISABLE KEYS */;
INSERT INTO `narudzba` VALUES (7,13,1,1,1,1,'2022-09-15','2022-12-15',87000),(8,14,1,1,1,1,'2022-09-15','2022-12-15',108750),(9,15,1,1,1,1,'2022-09-15','2022-12-15',84000),(10,16,1,1,1,1,'2022-09-15','2022-12-15',35000),(11,17,1,1,1,1,'2022-09-15','2022-12-15',66000),(12,18,1,1,1,1,'2022-09-15','2022-12-15',36250),(13,20,1,1,1,1,'2022-09-15','2022-12-15',78000),(14,21,1,1,1,1,'2022-09-15','2022-12-15',70000);
/*!40000 ALTER TABLE `narudzba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `oprema`
--

LOCK TABLES `oprema` WRITE;
/*!40000 ALTER TABLE `oprema` DISABLE KEYS */;
INSERT INTO `oprema` VALUES (1,'Standard','Radio,Klima,Alarm',0.00),(2,'Luxury','Standard + Navigacija,Parking Senzori',0.20),(3,'Full','Luxury + Grijanje Sjedista,Kamera',0.45);
/*!40000 ALTER TABLE `oprema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `osiguranje`
--

LOCK TABLES `osiguranje` WRITE;
/*!40000 ALTER TABLE `osiguranje` DISABLE KEYS */;
INSERT INTO `osiguranje` VALUES (1,'Kasko');
/*!40000 ALTER TABLE `osiguranje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `prodavac`
--

LOCK TABLES `prodavac` WRITE;
/*!40000 ALTER TABLE `prodavac` DISABLE KEYS */;
INSERT INTO `prodavac` VALUES (1,'ProdavacIme','ProdavacPrezime');
/*!40000 ALTER TABLE `prodavac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `proizvodjac`
--

LOCK TABLES `proizvodjac` WRITE;
/*!40000 ALTER TABLE `proizvodjac` DISABLE KEYS */;
INSERT INTO `proizvodjac` VALUES (1,'Audi',2),(2,'BMW',2),(3,'Peugeot',1),(4,'Skoda',1),(5,'Volvo',2);
/*!40000 ALTER TABLE `proizvodjac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `racun`
--

LOCK TABLES `racun` WRITE;
/*!40000 ALTER TABLE `racun` DISABLE KEYS */;
/*!40000 ALTER TABLE `racun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `registracija`
--

LOCK TABLES `registracija` WRITE;
/*!40000 ALTER TABLE `registracija` DISABLE KEYS */;
/*!40000 ALTER TABLE `registracija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `salon`
--

LOCK TABLES `salon` WRITE;
/*!40000 ALTER TABLE `salon` DISABLE KEYS */;
INSERT INTO `salon` VALUES (1,'AutoSalon','root',1,1),(2,'AutoKuca','root',1,1);
/*!40000 ALTER TABLE `salon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `telefon`
--

LOCK TABLES `telefon` WRITE;
/*!40000 ALTER TABLE `telefon` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tip`
--

LOCK TABLES `tip` WRITE;
/*!40000 ALTER TABLE `tip` DISABLE KEYS */;
INSERT INTO `tip` VALUES (1,'Hatchback'),(2,'Sedan'),(3,'SUV'),(4,'Coupe'),(5,'StationWagon');
/*!40000 ALTER TABLE `tip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipovimodela`
--

LOCK TABLES `tipovimodela` WRITE;
/*!40000 ALTER TABLE `tipovimodela` DISABLE KEYS */;
INSERT INTO `tipovimodela` VALUES (6,1),(7,1),(1,2),(2,2),(4,2),(8,2),(9,2),(11,2),(12,2),(3,3),(5,3),(10,3),(13,3),(1,4),(2,4),(3,4),(4,4),(1,5),(6,5),(8,5),(9,5),(11,5);
/*!40000 ALTER TABLE `tipovimodela` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-05 18:04:44
