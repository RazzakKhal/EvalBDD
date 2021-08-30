-- MariaDB dump 10.19  Distrib 10.4.19-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: Evalbdd
-- ------------------------------------------------------
-- Server version	10.4.19-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `Evalbdd`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `evalbdd` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `Evalbdd`;

--
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `manager` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manager` (`manager`),
  CONSTRAINT `cinema_ibfk_1` FOREIGN KEY (`manager`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
INSERT INTO `cinema` (`id`, `name`, `manager`) VALUES (1,'Gaumont',4),(2,'Pathe',1);
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` (`id`, `name`) VALUES (1,'Indestrucibles'),(2,'HarryPotter'),(3,'FastAndFurious'),(4,'Conjuring');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` (`id`, `time`) VALUES (1,'2021-08-31 22:00:00'),(2,'2021-08-31 14:00:00'),(3,'2021-08-31 17:00:00');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screeningroom`
--

DROP TABLE IF EXISTS `screeningroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screeningroom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `seatNumber` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screeningroom`
--

LOCK TABLES `screeningroom` WRITE;
/*!40000 ALTER TABLE `screeningroom` DISABLE KEYS */;
INSERT INTO `screeningroom` (`id`, `name`, `seatNumber`) VALUES (1,'GIGA',1000),(2,'MEGA',750),(3,'MAX3D',600);
/*!40000 ALTER TABLE `screeningroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seance`
--

DROP TABLE IF EXISTS `seance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seance` (
  `id_cine` int(11) NOT NULL,
  `id_movie` int(11) NOT NULL,
  `id_screeningroom` int(11) NOT NULL,
  `id_price` float DEFAULT NULL,
  `id_schedule` int(11) NOT NULL,
  PRIMARY KEY (`id_schedule`,`id_cine`,`id_movie`,`id_screeningroom`),
  KEY `id_price` (`id_price`),
  KEY `id_cine` (`id_cine`),
  KEY `id_movie` (`id_movie`),
  KEY `id_screeningroom` (`id_screeningroom`),
  CONSTRAINT `seance_ibfk_1` FOREIGN KEY (`id_cine`) REFERENCES `cinema` (`id`),
  CONSTRAINT `seance_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id`),
  CONSTRAINT `seance_ibfk_3` FOREIGN KEY (`id_screeningroom`) REFERENCES `screeningroom` (`id`),
  CONSTRAINT `seance_ibfk_4` FOREIGN KEY (`id_schedule`) REFERENCES `schedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seance`
--

LOCK TABLES `seance` WRITE;
/*!40000 ALTER TABLE `seance` DISABLE KEYS */;
INSERT INTO `seance` (`id_cine`, `id_movie`, `id_screeningroom`, `id_price`, `id_schedule`) VALUES (2,4,2,5.9,2),(1,2,1,7.6,1);
/*!40000 ALTER TABLE `seance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) NOT NULL,
  `mail` varchar(86) NOT NULL,
  `password` varchar(60) NOT NULL,
  `pseudo` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `birthday` date NOT NULL,
  `job` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `role`, `mail`, `password`, `pseudo`, `name`, `birthday`, `job`) VALUES (1,'Admin','momodu77@gmail.com','$2y$10$oIqB6ba1L/CHifTX1epnYuLyFHL1l3rpzDkoHSpWRZn8mnuykU3oi','Razmo','Khalfallah','1995-07-25','Administrateur'),(2,'Invited','marjodu77@gmail.com','$2y$10$sIyKwMrL02ubBGdJB47.S.aQOd2YfAtdnIuLhAfq10bj1rOw2FWae','Marjo77','Centeio','2000-09-13','Student'),(3,'Invited','sosodu77@gmail.com','$2y$10$aJWjINLdNnHNZGJ.prXZi.AYfasbyPljuU05SmDTwu4Nj1Dz1Qro.','Soso77','Frutel','2009-05-23','Schoolboy'),(4,'Admin','abdeldu77@gmail.com','$2y$10$/6yuhtZPqXqDolTw92nsdepXvS8FQUMsEPeWL5lok4RB5yGcOtx/u','Abdel77','Calmels','1997-09-06','Administrateur');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-29 22:25:40
