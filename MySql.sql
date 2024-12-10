-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ebook-app
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phno` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_dtls`
--

DROP TABLE IF EXISTS `book_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_dtls` (
  `bookId` int NOT NULL AUTO_INCREMENT,
  `bookname` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `bookCategory` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_dtls`
--

LOCK TABLES `book_dtls` WRITE;
/*!40000 ALTER TABLE `book_dtls` DISABLE KEYS */;
INSERT INTO `book_dtls` VALUES (1,'Java Programming','Balugru','299','New','Active','java.jpg','admin'),(2,'SQL','Micheal','199','New','Active','sql.jpg','admin'),(4,'Conan','Gosho Aoyama','200','New','Active','conan.jpg','admin'),(5,'Linux','Michael Tom','100','New','Active','linux.jpg','admin'),(6,'Harry','J. K. Rowling','150','New','Active','harypt.jpg','admin'),(8,'Naruto','Kashashi Kamito','149','New','Active','naruto.jpg','admin'),(9,'Harry Potter','Michael Tom','1150','New','Active','harypt.jpg','admin'),(11,'Doraemon','Fujiko','80','New','Active','doremon.jpg','admin'),(13,'Economics Book','Steven Medema','200','Old','Active','ecnm.jpg','truonglinh@gmail.com'),(15,'Chemistry','Buffon','150','New','Active','chemistry.jpg','admin'),(16,'Dac Nhan Tam','Dale Carnegie','200','New','Active','dnt.jpg','admin'),(17,'English','Filip Lamp','145','New','Active','english.jpg','admin'),(18,'History','Maignan','160','New','Active','history.jpg','admin'),(19,'Horror','W.Saliba','195','New','Active','horror.jpg','admin'),(20,'Love Story','L.Upamecano','155','New','Active','love.jpg','admin'),(21,'Math Hardly','N.Kante','133','New','Active','math.jpg','admin'),(22,'Smart','B.Barcola','178','New','Active','smart.jpg','admin'),(23,'Story','A.Rabiot','180','Old','Active','story.jpg','trandat@gmail.com'),(24,'Social ','Junger','159','Old','Active','social1.jpg','trandat@gmail.com'),(25,'Think and Grow Rich','Napoleon Hill','169','Old','Active','lamgiau.jpg','trandat@gmail.com'),(26,'Social Studies','J.Moder','215','Old','Active','social.jpg','truonglinh@gmail.com'),(27,'Politics ','O.Dembele','187','Old','Active','politics.jpg','truonglinh@gmail.com'),(28,'Python Programming','J.Kounde','238','Old','Active','python.jpg','truonglinh@gmail.com'),(29,'Physics','J.Neves','105','Old','Active','physics.jpg','vanb@gmail.com'),(30,'Wisdom Books','A.Silva','153','Old','Active','wisdm.jpg','vanb@gmail.com');
/*!40000 ALTER TABLE `book_dtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_order`
--

DROP TABLE IF EXISTS `book_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(45) DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `phno` varchar(45) DEFAULT NULL,
  `book_name` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `payment` varchar(45) DEFAULT NULL,
  `approval_status` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_order`
--

LOCK TABLES `book_order` WRITE;
/*!40000 ALTER TABLE `book_order` DISABLE KEYS */;
INSERT INTO `book_order` VALUES (19,'BOOK-ORD-00162','Tran Dat','trandat@gmail.com','To 5,Tam Dao,Phuc Yen,Vinh Phuc,110','0339365768','Harry Potter','Michael Tom','1150.0','CODE','1','Order Success',NULL),(20,'BOOK-ORD-00676','Tran Dat','trandat@gmail.com','To 5,Tam Dao,Phuc Yen,Vinh Phuc,110','0339365768','Linux','Michael Tom','100.0','CODE','1','Order Success',NULL),(21,'BOOK-ORD-00706','Tran Dat','trandat@gmail.com','To 5,Tam Dao,Phuc Yen,Vinh Phuc,110','0339365768','Naruto','Kashashi Kamito','149.0','CODE',NULL,NULL,NULL),(22,'BOOK-ORD-00927','VanB','vanb@gmail.com','To 9,Chua Huong,Ha Tay,Ha Noi,111','0123123123','Linux','Michael Tom','100.0','CODE','1','Order Success',NULL),(23,'BOOK-ORD-0019','VanB','vanb@gmail.com','To 9,Chua Huong,Ha Tay,Ha Noi,111','0123123123','SQL','Micheal','199.0','CODE','1','Order Success',NULL),(24,'BOOK-ORD-00337','VanB','vanb@gmail.com','To 9,Chua Huong,Ha Tay,Ha Noi,111','0123123123','Harry Potter','Michael Tom','1150.0','CODE',NULL,NULL,NULL),(25,'BOOK-ORD-00692','ThiNo','thino@gmail.com','So 30,To 12,Sun World,Ha Long,Quang Ninh,114','033567678','English','Filip Lamp','145.0','CODE',NULL,NULL,NULL),(26,'BOOK-ORD-0065','ThiNo','thino@gmail.com','So 30,To 12,Sun World,Ha Long,Quang Ninh,114','033567678','Horror','W.Saliba','195.0','CODE','1','Order Success',NULL),(27,'BOOK-ORD-00564','ThiNo','thino@gmail.com','So 30,To 12,Sun World,Ha Long,Quang Ninh,114','033567678','Math Hardly','N.Kante','133.0','CODE',NULL,NULL,NULL),(28,'BOOK-ORD-0085','ThiNo','thino@gmail.com','So 30,To 12,Sun World,Ha Long,Quang Ninh,114','033567678','Smart','B.Barcola','178.0','CODE','1','Order Success',NULL),(29,'BOOK-ORD-00287','TruongLinh','truonglinh@gmail.com','HongQuang,Dao Co,ThanhMien,HaiDuong,115','0903448003','Harry','J. K. Rowling','150.0','CODE',NULL,NULL,NULL),(30,'BOOK-ORD-00158','TruongLinh','truonglinh@gmail.com','HongQuang,Dao Co,ThanhMien,HaiDuong,115','0903448003','Linux','Michael Tom','100.0','CODE','1','Order Success',NULL),(31,'BOOK-ORD-00176','TruongLinh','truonglinh@gmail.com','HongQuang,Dao Co,ThanhMien,HaiDuong,115','0903448003','English','Filip Lamp','145.0','CODE','1','Order Success',NULL),(32,'BOOK-ORD-00553','TruongLinh','truonglinh@gmail.com','HongQuang,Dao Co,ThanhMien,HaiDuong,115','0903448003','Conan','Gosho Aoyama','200.0','CODE',NULL,NULL,NULL),(33,'BOOK-ORD-00530','VanB','vanb@gmail.com','To 9,Chua Huong,Ha Tay,Ha Noi,116','0123123123','Dac Nhan Tam','Dale Carnegie','200.0','CODE',NULL,NULL,NULL),(34,'BOOK-ORD-00608','VanB','vanb@gmail.com','To 9,Chua Huong,Ha Tay,Ha Noi,116','0123123123','History','Maignan','160.0','CODE','1','Order Success',NULL),(35,'BOOK-ORD-00977','VanB','vanb@gmail.com','To 9,Chua Huong,Ha Tay,Ha Noi,116','0123123123','Love Story','L.Upamecano','155.0','CODE',NULL,NULL,NULL),(36,'BOOK-ORD-00458','Tran Dat','trandat@gmail.com','To 5,Tam Dao,Phuc Yen,Vinh Phuc,116','0339365768','English','Filip Lamp','145.0','CODE','1','Order Success',NULL),(37,'BOOK-ORD-00324','Tran Dat','trandat@gmail.com','To 5,Tam Dao,Phuc Yen,Vinh Phuc,116','0339365768','Doraemon','Fujiko','80.0','CODE','1','Order Success',NULL),(38,'BOOK-ORD-00118','Tran Dat','trandat@gmail.com','To 5,Tam Dao,Phuc Yen,Vinh Phuc,116','0339365768','Smart','B.Barcola','178.0','CODE',NULL,NULL,NULL),(39,'BOOK-ORD-00958','Tran Dat','trandat@gmail.com','To 5,Tam Dao,Phuc Yen,Vinh Phuc,118','0339365768','English','Filip Lamp','145.0','CODE',NULL,NULL,NULL),(40,'BOOK-ORD-00837','Tran Dat','trandat@gmail.com','To 5,Tam Dao,Phuc Yen,Vinh Phuc,118','0339365768','Doraemon','Fujiko','80.0','CODE',NULL,NULL,NULL),(41,'BOOK-ORD-00144','Tran Dat','trandat@gmail.com','To 5,Tam Dao,Phuc Yen,Vinh Phuc,118','0339365768','Smart','B.Barcola','178.0','CODE','1','Order Success',NULL),(42,'BOOK-ORD-006','Tran Dat','trandat@gmail.com','To 5,Tam Dao,Phuc Yen,Vinh Phuc,118','0339365768','Math Hardly','N.Kante','133.0','CODE',NULL,NULL,NULL),(43,'BOOK-ORD-00966','Tran Dat','trandat@gmail.com','To 5,Tam Dao,Phuc Yen,Vinh Phuc,118','0339365768','Love Story','L.Upamecano','155.0','CODE',NULL,NULL,NULL);
/*!40000 ALTER TABLE `book_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `bid` int DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `bookName` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (3,6,2,'Harry','J. K. Rowling',150,150),(9,5,2,'Linux','Michael Tom',100,100),(19,17,5,'English','Filip Lamp',145,145),(20,19,5,'Horror','W.Saliba',195,195),(21,21,5,'Math Hardly','N.Kante',133,133),(22,22,5,'Smart','B.Barcola',178,178),(23,18,5,'History','Maignan',160,160),(26,17,2,'English','Filip Lamp',145,145),(27,4,2,'Conan','Gosho Aoyama',200,200),(28,16,4,'Dac Nhan Tam','Dale Carnegie',200,200),(29,18,4,'History','Maignan',160,160),(30,20,4,'Love Story','L.Upamecano',155,155),(31,17,1,'English','Filip Lamp',145,145),(32,11,1,'Doraemon','Fujiko',80,80),(33,22,1,'Smart','B.Barcola',178,178),(34,21,1,'Math Hardly','N.Kante',133,133),(35,20,1,'Love Story','L.Upamecano',155,155);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `uid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'trandat@gmail.com','12345',NULL);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `dID` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `bookname` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `total` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sell`
--

DROP TABLE IF EXISTS `sell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sell` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookId` int DEFAULT NULL,
  `bookname` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `bookCategory` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `uid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sell`
--

LOCK TABLES `sell` WRITE;
/*!40000 ALTER TABLE `sell` DISABLE KEYS */;
/*!40000 ALTER TABLE `sell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phno` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `adress` varchar(45) DEFAULT NULL,
  `landmark` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `pincode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Tran Dat','trandat@gmail.com','0339365768','12345',NULL,NULL,NULL,NULL,NULL),(2,'TruongLinh','truonglinh@gmail.com','0903448003','12345',NULL,NULL,NULL,NULL,NULL),(4,'VanB','vanb@gmail.com','0123123123','12345',NULL,NULL,NULL,NULL,NULL),(5,'ThiNo','thino@gmail.com','033567678','12345',NULL,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2024-12-10 15:22:50
