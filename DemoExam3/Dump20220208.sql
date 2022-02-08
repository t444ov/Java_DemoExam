CREATE DATABASE  IF NOT EXISTS `naumenko_db_1` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `naumenko_db_1`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: naumenko_db_1
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `attachedproduct`
--

DROP TABLE IF EXISTS `attachedproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachedproduct` (
  `MainProductID` int NOT NULL,
  `AttachedProductID` int NOT NULL,
  PRIMARY KEY (`MainProductID`,`AttachedProductID`),
  KEY `FK_AttachedProduct_Product1` (`AttachedProductID`),
  CONSTRAINT `FK_AttachedProduct_Product` FOREIGN KEY (`MainProductID`) REFERENCES `product` (`ID`),
  CONSTRAINT `FK_AttachedProduct_Product1` FOREIGN KEY (`AttachedProductID`) REFERENCES `product` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachedproduct`
--

LOCK TABLES `attachedproduct` WRITE;
/*!40000 ALTER TABLE `attachedproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachedproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LastName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Patronymic` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `RegistrationDate` datetime(6) NOT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `GenderCode` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PhotoPath` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Client_Gender` (`GenderCode`),
  CONSTRAINT `FK_Client_Gender` FOREIGN KEY (`GenderCode`) REFERENCES `gender` (`Code`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Оскар','Васильев','Богданович','1971-01-30','2017-05-28 00:00:00.000000','miturria@verizon.net','7(585)801-94-29','м',NULL),(2,'Алексей','Лазарев','Богданович','1977-03-10','2017-01-02 00:00:00.000000','claesjac@me.com','7(0055)737-37-48','м',NULL),(3,'Дмитрий','Казаков','Русланович','1978-12-15','2016-05-21 00:00:00.000000','ozawa@verizon.net','7(51)682-19-40','м',NULL),(4,'Харита','Попова','Якуновна','1997-12-16','2016-07-05 00:00:00.000000','firstpr@verizon.net','7(335)386-81-06','ж',NULL),(5,'Георгина','Турова','Семёновна','1974-05-28','2018-02-22 00:00:00.000000','yruan@optonline.net','7(555)321-42-99','ж',NULL),(6,'Станислав','Андреев','Максович','1975-10-10','2017-12-26 00:00:00.000000','budinger@mac.com','7(02)993-91-28','м',NULL),(7,'Влада','Орлова','Мартыновна','1990-06-26','2016-03-21 00:00:00.000000','rnelson@yahoo.ca','7(2506)433-38-35','ж',NULL),(8,'Любава','Костина','Авксентьевна','1972-07-13','2016-02-26 00:00:00.000000','gordonjcp@hotmail.com','7(6419)959-21-87','ж',NULL),(9,'Станислав','Александров','Эдуардович','1981-07-04','2018-11-08 00:00:00.000000','bigmauler@aol.com','7(18)164-05-12','м',NULL),(10,'Анэля','Корнилова','Михайловна','1973-04-02','2016-05-22 00:00:00.000000','jonathan@aol.com','7(20)980-01-60','ж',NULL),(11,'Наум','Морозов','Валерьянович','1985-07-04','2016-05-02 00:00:00.000000','salesgeek@mac.com','7(636)050-96-13','м',NULL),(12,'Эльмира','Баранова','Дмитриевна','1977-01-15','2016-07-08 00:00:00.000000','jgmyers@comcast.net','7(9240)643-15-50','ж',NULL),(13,'Амелия','Степанова','Робертовна','1970-06-06','2017-09-27 00:00:00.000000','rasca@hotmail.com','7(1217)441-28-42','ж',NULL),(14,'Давид','Горбачёв','Тимурович','1983-05-22','2018-12-17 00:00:00.000000','hedwig@att.net','7(53)602-85-41','м',NULL),(15,'Людвиг','Волков','Витальевич','1977-12-27','2016-04-27 00:00:00.000000','jrkorson@msn.com','7(8459)592-05-58','м',NULL),(16,'Амалия','Комиссарова','Робертовна','1971-08-18','2017-08-04 00:00:00.000000','jorgb@msn.com','7(22)647-46-32','ж',NULL),(17,'Вадим','Большаков','Данилович','1970-05-15','2018-08-04 00:00:00.000000','uncle@gmail.com','7(386)641-13-37','м',NULL),(18,'Станислав','Абрамов','Филатович','1989-05-18','2016-12-08 00:00:00.000000','solomon@att.net','7(6545)478-87-79','м',NULL),(19,'Леонтий','Журавлёв','Яковлевич','2000-03-02','2018-01-15 00:00:00.000000','cmdrgravy@me.com','7(4403)308-56-96','м',NULL),(20,'Глеб','Селиверстов','Максимович','1999-06-20','2016-01-07 00:00:00.000000','jigsaw@sbcglobal.net','7(20)554-28-68','м',NULL),(21,'Устин','Киселёв','Яковлевич','1985-01-08','2018-06-21 00:00:00.000000','dalamb@verizon.net','7(83)334-52-76','м',NULL),(22,'Матвей','Зуев','Иванович','1981-03-28','2018-12-18 00:00:00.000000','brickbat@verizon.net','7(5383)893-04-66','м',NULL),(23,'Глеб','Ершов','Федорович','1970-06-14','2016-09-14 00:00:00.000000','sjava@aol.com','7(2608)298-40-82','м',NULL),(24,'Георгий','Бобылёв','Витальевич','1983-12-19','2018-04-06 00:00:00.000000','csilvers@mac.com','7(88)685-13-51','м',NULL),(25,'Витольд','Ефремов','Авксентьевич','1975-12-02','2018-04-09 00:00:00.000000','kwilliams@yahoo.ca','7(93)922-14-03','м',NULL),(26,'Патрисия','Андреева','Валерьевна','1993-11-18','2016-07-17 00:00:00.000000','jigsaw@aol.com','7(9648)953-81-26','ж',NULL),(27,'Магда','Ефимова','Платоновна','1995-08-16','2017-08-01 00:00:00.000000','rbarreira@me.com','7(9261)386-15-92','ж',NULL),(28,'Иосиф','Голубев','Тимофеевич','1982-05-06','2018-08-18 00:00:00.000000','smcnabb@att.net','7(78)972-73-11','м',NULL),(29,'Макар','Евсеев','Васильевич','1977-09-13','2018-12-05 00:00:00.000000','parsimony@sbcglobal.net','7(2141)077-85-70','м',NULL),(30,'Агафон','Бобров','Лаврентьевич','1995-07-29','2017-05-09 00:00:00.000000','petersen@comcast.net','7(2159)507-39-57','м',NULL),(31,'Захар','Игнатов','Павлович','1998-10-07','2017-11-10 00:00:00.000000','dieman@icloud.com','7(578)574-73-36','м',NULL),(32,'Янита','Гущина','Федоровна','1999-03-02','2018-02-01 00:00:00.000000','lishoy@att.net','7(4544)716-68-96','ж',NULL),(33,'Артур','Калашников','Юрьевич','1972-12-13','2017-08-20 00:00:00.000000','oevans@aol.com','7(147)947-47-21','м',NULL),(34,'Элина','Дмитриева','Даниловна','1988-12-10','2017-02-11 00:00:00.000000','vmalik@live.com','7(787)140-48-84','ж',NULL),(35,'Сандра','Федотова','Владленовна','1985-03-29','2016-11-08 00:00:00.000000','penna@verizon.net','7(126)195-25-86','ж',NULL),(36,'Дэнна','Кузьмина','Витальевна','1993-08-24','2016-03-27 00:00:00.000000','nichoj@mac.com','7(9940)977-45-73','ж',NULL),(37,'Злата','Колобова','Романовна','1994-08-25','2016-12-03 00:00:00.000000','sinkou@aol.com','7(50)884-07-35','ж',NULL),(38,'Варлам','Некрасов','Михайлович','2000-11-12','2017-12-03 00:00:00.000000','dogdude@verizon.net','7(019)258-06-35','м',NULL),(39,'Орест','Колобов','Юлианович','2001-07-14','2017-01-01 00:00:00.000000','parkes@verizon.net','7(1680)508-58-26','м',NULL),(40,'Пантелеймон','Блохин','Феликсович','1978-03-06','2018-02-14 00:00:00.000000','balchen@comcast.net','7(9524)556-48-98','м',NULL),(41,'Петр','Калинин','Иванович','1993-09-08','2016-05-26 00:00:00.000000','aschmitz@hotmail.com','7(90)316-07-17','м',NULL),(42,'Сабрина','Беляева','Федосеевна','1972-07-26','2017-06-14 00:00:00.000000','agapow@gmail.com','7(6580)534-32-58','ж',NULL),(43,'Юстиниан','Агафонов','Олегович','1997-02-02','2016-06-08 00:00:00.000000','staffelb@sbcglobal.net','7(303)810-28-78','м',NULL),(44,'Марфа','Мамонтова','Мироновна','1984-10-19','2018-02-27 00:00:00.000000','rfoley@verizon.net','7(38)095-64-18','ж',NULL),(45,'Евгений','Блинов','Мэлсович','1994-01-05','2017-05-07 00:00:00.000000','moxfulder@outlook.com','7(0852)321-82-64','м',NULL),(46,'Изабелла','Воронова','Вячеславовна','1999-09-24','2017-12-21 00:00:00.000000','kildjean@sbcglobal.net','7(17)433-44-98','ж',NULL),(47,'Святослав','Медведев','Юлианович','1972-10-04','2018-10-13 00:00:00.000000','hllam@comcast.net','7(3520)435-21-20','м',NULL),(48,'Эвелина','Куликова','Вячеславовна','1997-11-14','2018-02-01 00:00:00.000000','ilikered@hotmail.com','7(0236)682-42-78','ж',NULL),(49,'Божена','Суворова','Анатольевна','1981-03-09','2016-01-28 00:00:00.000000','attwood@aol.com','7(347)895-86-57','ж',NULL),(50,'Амалия','Егорова','Дамировна','1999-09-28','2016-06-30 00:00:00.000000','drezet@yahoo.com','7(7486)408-12-26','ж',NULL);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientservice`
--

DROP TABLE IF EXISTS `clientservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientservice` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ClientID` int NOT NULL,
  `ServiceID` int NOT NULL,
  `StartTime` datetime(6) NOT NULL,
  `Comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`ID`),
  KEY `FK_ClientService_Client` (`ClientID`),
  KEY `FK_ClientService_Service` (`ServiceID`),
  CONSTRAINT `FK_ClientService_Client` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ID`),
  CONSTRAINT `FK_ClientService_Service` FOREIGN KEY (`ServiceID`) REFERENCES `service` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientservice`
--

LOCK TABLES `clientservice` WRITE;
/*!40000 ALTER TABLE `clientservice` DISABLE KEYS */;
INSERT INTO `clientservice` VALUES (1,49,10,'2019-11-16 11:20:00.000000',NULL),(2,37,41,'2019-01-11 18:10:00.000000',NULL),(3,37,19,'2019-12-01 14:40:00.000000',NULL),(4,37,28,'2019-02-11 13:30:00.000000',NULL),(5,20,30,'2019-09-10 18:20:00.000000',NULL),(6,48,26,'2019-02-12 19:40:00.000000',NULL),(7,24,92,'2019-04-04 09:10:00.000000',NULL),(8,21,20,'2019-05-15 09:20:00.000000',NULL),(9,16,52,'2019-01-16 14:20:00.000000',NULL),(10,30,34,'2019-01-16 09:00:00.000000',NULL),(11,3,52,'2019-03-15 10:50:00.000000',NULL),(12,26,41,'2019-01-31 12:00:00.000000',NULL),(13,6,64,'2019-11-19 15:50:00.000000',NULL),(14,33,32,'2019-01-10 08:30:00.000000',NULL),(15,35,52,'2019-04-29 15:00:00.000000',NULL),(16,43,80,'2019-10-12 08:50:00.000000',NULL),(17,48,48,'2019-02-13 18:00:00.000000',NULL),(18,33,64,'2019-02-01 18:00:00.000000',NULL),(19,30,63,'2019-11-12 18:50:00.000000',NULL),(20,17,83,'2019-01-11 12:50:00.000000',NULL),(21,9,50,'2019-03-23 19:50:00.000000',NULL),(22,43,13,'2019-06-23 08:00:00.000000',NULL),(23,38,18,'2019-05-25 17:10:00.000000',NULL),(24,17,67,'2019-02-18 18:20:00.000000',NULL),(25,35,13,'2019-07-17 08:20:00.000000',NULL),(26,35,92,'2019-08-06 16:50:00.000000',NULL),(27,1,77,'2019-12-14 08:40:00.000000',NULL),(28,22,76,'2019-06-28 14:20:00.000000',NULL),(29,48,97,'2019-06-06 19:20:00.000000',NULL),(30,24,50,'2019-06-07 17:20:00.000000',NULL),(31,46,23,'2019-04-30 18:10:00.000000',NULL),(32,6,83,'2019-08-30 11:40:00.000000',NULL),(33,25,20,'2019-05-08 14:10:00.000000',NULL),(34,42,66,'2019-10-27 16:20:00.000000',NULL),(35,30,13,'2019-01-05 08:40:00.000000',NULL),(36,22,27,'2019-03-04 17:20:00.000000',NULL),(37,50,69,'2019-09-29 13:40:00.000000',NULL),(38,27,3,'2019-01-22 10:50:00.000000',NULL),(39,30,64,'2019-12-19 19:30:00.000000',NULL),(40,32,29,'2019-11-15 17:50:00.000000',NULL),(41,12,9,'2019-07-04 17:10:00.000000',NULL),(42,21,41,'2019-08-06 11:50:00.000000',NULL),(43,35,80,'2019-11-09 13:00:00.000000',NULL),(44,24,62,'2019-02-16 18:50:00.000000',NULL),(45,23,69,'2019-03-03 17:20:00.000000',NULL),(46,13,23,'2019-05-22 16:10:00.000000',NULL),(47,36,10,'2019-07-31 18:10:00.000000',NULL),(48,16,27,'2019-08-29 19:00:00.000000',NULL),(49,21,13,'2019-10-02 10:10:00.000000',NULL),(50,8,41,'2019-03-16 11:30:00.000000',NULL),(51,43,29,'2019-08-27 11:40:00.000000',NULL),(52,18,66,'2019-06-13 11:30:00.000000',NULL),(53,4,80,'2019-08-18 16:00:00.000000',NULL),(54,14,34,'2019-12-26 16:30:00.000000',NULL),(55,11,7,'2019-11-27 18:50:00.000000',NULL),(56,47,13,'2019-09-06 19:20:00.000000',NULL),(57,46,98,'2019-09-24 13:40:00.000000',NULL),(58,32,89,'2019-03-01 11:50:00.000000',NULL),(59,5,7,'2019-09-28 10:00:00.000000',NULL),(60,15,92,'2019-03-20 10:40:00.000000',NULL),(61,10,80,'2019-11-27 11:30:00.000000',NULL),(62,3,60,'2019-01-23 18:30:00.000000',NULL),(63,27,27,'2019-10-21 10:20:00.000000',NULL),(64,28,92,'2019-08-11 12:50:00.000000',NULL),(65,7,13,'2019-01-03 14:40:00.000000',NULL),(66,33,64,'2019-12-31 08:30:00.000000',NULL),(67,41,20,'2019-08-29 10:10:00.000000',NULL),(68,13,19,'2019-01-03 18:50:00.000000',NULL),(69,14,30,'2019-04-09 11:10:00.000000',NULL),(70,27,13,'2019-12-31 19:10:00.000000',NULL),(71,2,19,'2019-10-17 13:30:00.000000',NULL),(72,46,69,'2019-05-17 13:30:00.000000',NULL),(73,11,14,'2019-11-23 18:40:00.000000',NULL),(74,10,83,'2019-07-10 15:30:00.000000',NULL),(75,37,40,'2019-06-09 13:40:00.000000',NULL),(76,23,69,'2019-01-09 10:20:00.000000',NULL),(77,2,60,'2019-08-15 18:30:00.000000',NULL),(78,29,83,'2019-07-15 14:10:00.000000',NULL),(79,21,14,'2019-12-31 18:00:00.000000',NULL),(80,32,7,'2019-12-22 09:20:00.000000',NULL),(81,14,51,'2019-12-28 16:00:00.000000',NULL),(82,33,69,'2019-06-26 10:10:00.000000',NULL),(83,10,10,'2019-04-29 12:40:00.000000',NULL),(84,48,10,'2019-04-13 09:00:00.000000',NULL),(85,23,48,'2019-01-05 16:00:00.000000',NULL),(86,5,40,'2019-03-25 18:20:00.000000',NULL),(87,29,18,'2019-11-09 18:50:00.000000',NULL),(88,31,41,'2019-04-07 10:40:00.000000',NULL),(89,49,67,'2019-11-11 18:50:00.000000',NULL),(90,34,13,'2019-01-06 15:00:00.000000',NULL),(91,4,48,'2019-08-20 19:10:00.000000',NULL),(92,45,48,'2019-04-16 13:20:00.000000',NULL),(93,27,52,'2019-12-22 15:10:00.000000',NULL),(94,40,83,'2019-01-22 16:50:00.000000',NULL),(95,8,18,'2019-09-04 08:10:00.000000',NULL),(96,41,77,'2019-01-01 14:50:00.000000',NULL),(97,35,14,'2019-01-29 16:30:00.000000',NULL),(98,40,49,'2019-07-06 11:30:00.000000',NULL),(99,28,98,'2019-12-05 10:20:00.000000',NULL),(100,20,48,'2019-04-05 13:20:00.000000',NULL);
/*!40000 ALTER TABLE `clientservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentbyservice`
--

DROP TABLE IF EXISTS `documentbyservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentbyservice` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ClientServiceID` int NOT NULL,
  `DocumentPath` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_DocumentByService_ClientService` (`ClientServiceID`),
  CONSTRAINT `FK_DocumentByService_ClientService` FOREIGN KEY (`ClientServiceID`) REFERENCES `clientservice` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentbyservice`
--

LOCK TABLES `documentbyservice` WRITE;
/*!40000 ALTER TABLE `documentbyservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentbyservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `Code` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES ('ж','женский'),('м','мужской');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `StartDate` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Cost` decimal(19,4) NOT NULL,
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `MainImagePath` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `ManufacturerID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Product_Manufacturer` (`ManufacturerID`),
  CONSTRAINT `FK_Product_Manufacturer` FOREIGN KEY (`ManufacturerID`) REFERENCES `manufacturer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productphoto`
--

DROP TABLE IF EXISTS `productphoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productphoto` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ProductID` int NOT NULL,
  `PhotoPath` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ProductPhoto_Product` (`ProductID`),
  CONSTRAINT `FK_ProductPhoto_Product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productphoto`
--

LOCK TABLES `productphoto` WRITE;
/*!40000 ALTER TABLE `productphoto` DISABLE KEYS */;
/*!40000 ALTER TABLE `productphoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productsale`
--

DROP TABLE IF EXISTS `productsale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productsale` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SaleDate` datetime(6) NOT NULL,
  `ProductID` int NOT NULL,
  `Quantity` int NOT NULL,
  `ClientServiceID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ProductSale_Product` (`ProductID`),
  KEY `FK_ProductSale_ClientService` (`ClientServiceID`),
  CONSTRAINT `FK_ProductSale_ClientService` FOREIGN KEY (`ClientServiceID`) REFERENCES `clientservice` (`ID`),
  CONSTRAINT `FK_ProductSale_Product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productsale`
--

LOCK TABLES `productsale` WRITE;
/*!40000 ALTER TABLE `productsale` DISABLE KEYS */;
/*!40000 ALTER TABLE `productsale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Cost` decimal(19,4) NOT NULL,
  `DurationInSeconds` int NOT NULL,
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Discount` double DEFAULT NULL,
  `MainImagePath` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'Занятие с репетитором-носителем китайского языка',1950.0000,120,NULL,0,'Услуги школы\\Китайский язык.jpg'),(2,'Индивидуальный урок немецкого языка с преподавателем-носителем языка',1340.0000,110,NULL,0,'Услуги школы\\Немецкий язык.png'),(3,'Киноклуб китайского языка для студентов',1990.0000,100,NULL,0,'Услуги школы\\киноклуб.jpg'),(4,'Индивидуальный онлайн-урок японского языка по Skype',1000.0000,4800,NULL,20,'Услуги школы\\online lessons.jpg'),(5,'Киноклуб испанского языка для студентов',1050.0000,40,NULL,10,'Услуги школы\\киноклуб.jpg'),(6,'Занятие с русскоязычным репетитором испанского языка',1450.0000,50,NULL,15,'Услуги школы\\Испанский язык.jpg'),(7,'Урок в группе итальянского языка для взрослых',1290.0000,40,NULL,0,'Услуги школы\\Итальянский язык.jpg'),(8,'Интенсивный онлайн-курс французского языка для компаний по Skype',1180.0000,2400,NULL,10,'Услуги школы\\online lessons.jpg'),(9,'Индивидуальный урок французского языка с преподавателем-носителем языка',1410.0000,2400,NULL,20,'Услуги школы\\Французский язык.jpg'),(10,'Урок в группе французского языка для школьников',1970.0000,6000,NULL,0,'Услуги школы\\Французский язык.jpg'),(11,'Занятие с репетитором-носителем английского языка',910.0000,6600,NULL,0,'Услуги школы\\Английский язык.jpg'),(12,'Киноклуб французского языка для взрослых',1770.0000,5400,NULL,10,'Услуги школы\\киноклуб.jpg'),(13,'Киноклуб немецкого языка для взрослых',1560.0000,100,NULL,10,'Услуги школы\\киноклуб.jpg'),(14,'Урок в группе японского языка для школьников',1300.0000,80,NULL,5,'Услуги школы\\Японский язык.jpg'),(15,'Индивидуальный урок испанского языка с русскоязычным преподавателем',1790.0000,60,NULL,15,'Услуги школы\\Испанский язык.jpg'),(16,'Интенсивный онлайн-курс итальянского языка для компаний по Skype',1230.0000,4200,NULL,10,'Услуги школы\\online lessons.jpg'),(17,'Урок в группе японского языка для студентов',1860.0000,3000,NULL,0,'Услуги школы\\Японский язык.jpg'),(18,'Интенсивный курс с преподавателем-носителем английского языка для компаний',1670.0000,110,NULL,10,'Услуги школы\\for company.jpg'),(19,'Киноклуб итальянского языка для студентов',1760.0000,30,NULL,0,'Услуги школы\\киноклуб.jpg'),(20,'Урок в группе испанского языка для взрослых',1730.0000,1800,NULL,5,'Услуги школы\\Испанский язык.jpg'),(21,'Урок в группе испанского языка для студентов',1310.0000,100,NULL,20,'Услуги школы\\Испанский язык.jpg'),(22,'Интенсивный онлайн-курс испанского языка для компаний по Skype',1510.0000,120,NULL,0,'Услуги школы\\online lessons.jpg'),(23,'Урок в группе английского языка для школьников',900.0000,6600,NULL,0,'Услуги школы\\Английский язык.jpg'),(24,'Занятие с репетитором-носителем испанского языка',1090.0000,3000,NULL,5,'Услуги школы\\Испанский язык.jpg'),(25,'Интенсивный курс с преподавателем-носителем итальянского языка для компаний',1190.0000,2400,NULL,20,'Услуги школы\\for company.jpg'),(26,'Урок в группе китайского языка для студентов',2000.0000,2400,NULL,20,'Услуги школы\\Китайский язык.jpg'),(27,'Индивидуальный урок испанского языка с преподавателем-носителем языка',1200.0000,90,NULL,10,'Услуги школы\\Испанский язык.jpg'),(28,'Интенсивный онлайн-курс португальского языка для компаний по Skype',1610.0000,70,NULL,5,'Услуги школы\\online lessons.jpg'),(29,'Подготовка к экзамену ACT',1440.0000,50,NULL,0,'Услуги школы\\Подготовка к экзамену ACT.png'),(30,'Урок в группе китайского языка для взрослых',1730.0000,4200,NULL,25,'Услуги школы\\Китайский язык.jpg'),(31,'Интенсивный онлайн-курс английского языка для компаний по Skype',1160.0000,3000,NULL,0,'Услуги школы\\online lessons.jpg'),(32,'Подготовка к экзамену TOEFL',1070.0000,6000,NULL,5,'Услуги школы\\Подготовка к экзамену TOEFL.jpg'),(33,'Занятие с репетитором-носителем итальянского языка',1370.0000,7200,NULL,5,'Услуги школы\\Итальянский язык.jpg'),(34,'Урок в группе английского языка для взрослых',1010.0000,3000,NULL,25,'Услуги школы\\Английский язык.jpg'),(35,'Киноклуб английского языка для взрослых',1250.0000,70,NULL,5,'Услуги школы\\киноклуб.jpg'),(36,'Интенсивный курс с преподавателем-носителем французского языка для компаний',1630.0000,70,NULL,15,'Услуги школы\\for company.jpg'),(37,'Урок в группе испанского языка для школьников',1910.0000,7200,NULL,0,'Услуги школы\\Испанский язык.jpg'),(38,'Подготовка к экзамену GRE',1300.0000,80,NULL,20,'Услуги школы\\Подготовка к экзамену GRE.jpeg'),(39,'Урок в группе английского языка для студентов',960.0000,4800,NULL,25,'Услуги школы\\Английский язык.jpg'),(40,'Занятие с русскоязычным репетитором японского языка',1260.0000,2400,NULL,10,'Услуги школы\\Японский язык.jpg'),(41,'Индивидуальный онлайн-урок немецкого языка по Skype',970.0000,90,NULL,0,'Услуги школы\\online lessons.jpg'),(42,'Интенсивный курс японского языка с русскоязычным преподавателем для компаний',1500.0000,80,NULL,0,'Услуги школы\\for company.jpg'),(43,'Киноклуб китайского языка для взрослых',1800.0000,70,NULL,25,'Услуги школы\\киноклуб.jpg'),(44,'Индивидуальный урок китайского языка с русскоязычным преподавателем',1860.0000,120,NULL,10,'Услуги школы\\Китайский язык.jpg'),(45,'Подготовка к экзамену GMAT',1150.0000,70,NULL,5,'Услуги школы\\Подготовка к экзамену GMAT.png'),(46,'Подготовка к экзамену IELTS',1730.0000,7200,NULL,0,'Услуги школы\\Подготовка к экзамену IELTS.jpg'),(47,'Подготовка к экзамену SAT',1560.0000,40,NULL,0,'Услуги школы\\Подготовка к экзамену SAT.png'),(48,'Урок в группе китайского языка для школьников',1180.0000,3000,NULL,15,'Услуги школы\\Китайский язык.jpg'),(49,'Киноклуб английского языка для студентов',980.0000,4800,NULL,0,'Услуги школы\\киноклуб.jpg'),(50,'Киноклуб португальского языка для студентов',1170.0000,1800,NULL,15,'Услуги школы\\киноклуб.jpg'),(51,'Киноклуб китайского языка для детей',1120.0000,100,NULL,10,'Услуги школы\\киноклуб.jpg'),(52,'Урок в группе немецкого языка для школьников',1570.0000,1800,NULL,15,'Услуги школы\\Немецкий язык.png'),(53,'Индивидуальный онлайн-урок испанского языка по Skype',1780.0000,4200,NULL,5,'Услуги школы\\online lessons.jpg'),(54,'Урок в группе немецкого языка для взрослых',930.0000,60,NULL,5,'Услуги школы\\Немецкий язык.png'),(55,'Индивидуальный урок китайского языка с преподавателем-носителем языка',1480.0000,90,NULL,20,'Услуги школы\\Китайский язык.jpg'),(56,'Занятие с русскоязычным репетитором португальского языка',1970.0000,3000,NULL,10,'Услуги школы\\Португальский язык.jpg'),(57,'Интенсивный курс китайского языка с русскоязычным преподавателем для компаний',1470.0000,6600,NULL,0,'Услуги школы\\for company.jpg'),(58,'Занятие с русскоязычным репетитором немецкого языка',1420.0000,1800,NULL,0,'Услуги школы\\Немецкий язык.png'),(59,'Киноклуб английского языка для детей',1280.0000,2400,NULL,5,'Услуги школы\\киноклуб.jpg'),(60,'Занятие с репетитором-носителем немецкого языка',1120.0000,7200,NULL,0,'Услуги школы\\Немецкий язык.png'),(61,'Индивидуальный онлайн-урок китайского языка по Skype',1410.0000,4200,NULL,0,'Услуги школы\\online lessons.jpg'),(62,'Индивидуальный урок английского языка с преподавателем-носителем языка',1300.0000,7200,NULL,0,'Услуги школы\\Английский язык.jpg'),(63,'Интенсивный курс с преподавателем-носителем немецкого языка для компаний',1180.0000,120,NULL,20,'Услуги школы\\for company.jpg'),(64,'Интенсивный онлайн-курс немецкого языка для компаний по Skype',1840.0000,4200,NULL,10,'Услуги школы\\online lessons.jpg'),(65,'Урок в группе итальянского языка для школьников',1410.0000,6000,NULL,15,'Услуги школы\\Итальянский язык.jpg'),(66,'Индивидуальный урок итальянского языка с русскоязычным преподавателем',1330.0000,30,NULL,20,'Услуги школы\\Итальянский язык.jpg'),(67,'Интенсивный онлайн-курс китайского языка для компаний по Skype',1760.0000,120,NULL,15,'Услуги школы\\online lessons.jpg'),(68,'Занятие с русскоязычным репетитором французского языка',1870.0000,6000,NULL,20,'Услуги школы\\Французский язык.jpg'),(69,'Индивидуальный урок немецкого языка с русскоязычным преподавателем',990.0000,1800,NULL,5,'Услуги школы\\Немецкий язык.png'),(70,'Индивидуальный онлайн-урок английского языка по Skype',1880.0000,6000,NULL,0,'Услуги школы\\online lessons.jpg'),(71,'Индивидуальный урок французского языка с русскоязычным преподавателем',1390.0000,4200,NULL,0,'Услуги школы\\Французский язык.jpg'),(72,'Интенсивный курс португальского языка с русскоязычным преподавателем для компаний',2010.0000,60,NULL,25,'Услуги школы\\for company.jpg'),(73,'Индивидуальный онлайн-урок французского языка по Skype',2010.0000,7200,NULL,0,'Услуги школы\\online lessons.jpg'),(74,'Интенсивный курс английского языка с русскоязычным преподавателем для компаний',1210.0000,4800,NULL,0,'Услуги школы\\for company.jpg'),(75,'Урок в группе французского языка для взрослых',960.0000,120,NULL,15,'Услуги школы\\Французский язык.jpg'),(76,'Подготовка к экзамену IELTS Speaking Club',1430.0000,90,NULL,20,'Услуги школы\\Подготовка к экзамену IELTS.jpg'),(77,'Киноклуб итальянского языка для детей',1480.0000,70,NULL,0,'Услуги школы\\киноклуб.jpg'),(78,'Урок в группе итальянского языка для студентов',1020.0000,110,NULL,0,'Услуги школы\\Итальянский язык.jpg'),(79,'Индивидуальный урок итальянского языка с преподавателем-носителем языка',1690.0000,80,NULL,0,'Услуги школы\\Итальянский язык.jpg'),(80,'Киноклуб немецкого языка для детей',1670.0000,120,NULL,5,'Услуги школы\\киноклуб.jpg'),(81,'Киноклуб итальянского языка для взрослых',1760.0000,110,NULL,0,'Услуги школы\\киноклуб.jpg'),(82,'Киноклуб португальского языка для взрослых',950.0000,1800,NULL,5,'Услуги школы\\киноклуб.jpg'),(83,'Киноклуб португальского языка для детей',1710.0000,90,NULL,15,'Услуги школы\\киноклуб.jpg'),(84,'Киноклуб французского языка для детей',1600.0000,90,NULL,10,'Услуги школы\\киноклуб.jpg'),(85,'Урок в группе японского языка для взрослых',1420.0000,80,NULL,5,'Услуги школы\\Японский язык.jpg'),(86,'Интенсивный курс французского языка с русскоязычным преподавателем для компаний',1940.0000,40,NULL,0,'Услуги школы\\for company.jpg'),(87,'Занятие с русскоязычным репетитором итальянского языка',1620.0000,4200,NULL,20,'Услуги школы\\Итальянский язык.jpg'),(88,'Индивидуальный урок английского языка с русскоязычным преподавателем',1910.0000,30,NULL,10,'Услуги школы\\Английский язык.jpg'),(89,'Интенсивный курс с преподавателем-носителем португальского языка для компаний',1580.0000,30,NULL,0,'Услуги школы\\for company.jpg'),(90,'Интенсивный курс испанского языка с русскоязычным преподавателем для компаний',1000.0000,5400,NULL,25,'Услуги школы\\for company.jpg'),(91,'Киноклуб немецкого языка для студентов',1140.0000,50,NULL,15,'Услуги школы\\киноклуб.jpg'),(92,'Занятие с репетитором-носителем французского языка',2040.0000,50,NULL,0,'Услуги школы\\Французский язык.jpg'),(93,'Урок в группе немецкого языка для студентов',1240.0000,4200,NULL,0,'Услуги школы\\Немецкий язык.png'),(94,'Занятие с русскоязычным репетитором китайского языка',940.0000,6600,NULL,15,'Услуги школы\\Китайский язык.jpg'),(95,'Занятие с репетитором-носителем японского языка',1100.0000,3000,NULL,25,'Услуги школы\\Японский язык.jpg'),(96,'Урок в группе французского языка для студентов',1910.0000,1800,NULL,0,'Услуги школы\\Французский язык.jpg'),(97,'Интенсивный курс итальянского языка с русскоязычным преподавателем для компаний',900.0000,110,NULL,0,'Услуги школы\\for company.jpg'),(98,'Занятие с русскоязычным репетитором английского языка',1950.0000,90,NULL,15,'Услуги школы\\Английский язык.jpg'),(99,'Интенсивный курс с преподавателем-носителем испанского языка для компаний',1660.0000,90,NULL,0,'Услуги школы\\for company.jpg'),(100,'Интенсивный курс с преподавателем-носителем японского языка для компаний',1380.0000,4200,NULL,20,'Услуги школы\\for company.jpg');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicephoto`
--

DROP TABLE IF EXISTS `servicephoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicephoto` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ServiceID` int NOT NULL,
  `PhotoPath` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ServicePhoto_Service` (`ServiceID`),
  CONSTRAINT `FK_ServicePhoto_Service` FOREIGN KEY (`ServiceID`) REFERENCES `service` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicephoto`
--

LOCK TABLES `servicephoto` WRITE;
/*!40000 ALTER TABLE `servicephoto` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicephoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Color` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagofclient`
--

DROP TABLE IF EXISTS `tagofclient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tagofclient` (
  `ClientID` int NOT NULL,
  `TagID` int NOT NULL,
  PRIMARY KEY (`ClientID`,`TagID`),
  KEY `FK_TagOfClient_Tag` (`TagID`),
  CONSTRAINT `FK_TagOfClient_Client` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ID`),
  CONSTRAINT `FK_TagOfClient_Tag` FOREIGN KEY (`TagID`) REFERENCES `tag` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagofclient`
--

LOCK TABLES `tagofclient` WRITE;
/*!40000 ALTER TABLE `tagofclient` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagofclient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-08 12:27:32
