-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: workshop6
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

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
-- Table structure for table `Comment`
--

DROP TABLE IF EXISTS `Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` date DEFAULT NULL,
  `text` varchar(60) COLLATE utf8_polish_ci DEFAULT NULL,
  `tweet_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcc5n08r8pndrkekxtc05q69e4` (`tweet_id`),
  KEY `FKhlbnnmiua9xpvfq8y1u1a15ie` (`user_id`),
  CONSTRAINT `FKcc5n08r8pndrkekxtc05q69e4` FOREIGN KEY (`tweet_id`) REFERENCES `Tweet` (`id`),
  CONSTRAINT `FKhlbnnmiua9xpvfq8y1u1a15ie` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment`
--

LOCK TABLES `Comment` WRITE;
/*!40000 ALTER TABLE `Comment` DISABLE KEYS */;
INSERT INTO `Comment` VALUES (1,'2019-01-26','aaaaaaa',1,1),(2,'2019-01-24','ssssssssssss',1,1),(3,'2019-01-25','sddddddddddddd',1,2),(4,'2019-01-24','ffffffffffff',1,3),(5,'2019-01-25','ggggggggggggg',2,2),(6,'2019-01-26','hhghghg',1,1),(7,'2019-01-26','hhghghg',1,1),(8,'2019-01-26','uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu',1,1),(9,'2019-01-26','uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu',1,1),(10,'2019-01-26','gggggggggggg',1,1),(11,'2019-01-26','333333333333333',1,1),(12,'2019-01-26','gfhfhdfhrg',1,1),(13,'2019-01-26','nnnnnnnnnnnnnnn',1,1),(14,'2019-01-26','dfgdfgdfg',2,1),(15,'2019-01-26','fgshsfhgh',2,2),(16,'2019-01-26','tttttttttttttttttttttt',1,3),(17,'2019-01-26','asdfadsfsdaf',3,1),(18,'2019-01-26','dfdfdfddfddf',3,1),(19,'2019-01-26','dfsfasdfsadfsadfsadfsadf',3,1),(20,'2019-01-26','aaaaa',3,1),(21,'2019-01-26','asdsaddaadsdsadasds',3,1),(22,'2019-01-26','hhhhhhhhhhhhhhhhhhhhhhh',3,1),(23,'2019-01-26','hhhhhhhhhhhhhhhhhhhhhhh',3,1),(24,'2019-01-26','hhhhhhhhhhhhhhhhhhhhhhh',3,1),(25,'2019-01-26','kkkkkkkkkkkkkkkkkkkkkk',3,1),(26,'2019-01-26','kkkkkkkkkkkkkk',3,1),(27,'2019-01-26','asdfsadfsdfsaf',1,1),(28,'2019-01-26','gfhfhdfhrg',4,2),(29,'2019-01-26','ggggggggggg',4,2),(30,'2019-01-26','bbbbbbbbbbbb',5,2),(31,'2019-01-26','bbbbbbbbbbbbb',5,2),(32,'2019-01-26','gfhjkln;mkjhg',4,1),(33,'2019-01-26','ggggggg',3,1),(34,'2019-01-26','ggggggggggg',2,1),(35,'2019-01-26','sdfgdgdsfgdfgd',2,1),(36,'2019-01-26','sfdgsdfgfdgdfg',2,1);
/*!40000 ALTER TABLE `Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Message`
--

DROP TABLE IF EXISTS `Message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `receiver_id` bigint(20) DEFAULT NULL,
  `sender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2hnqtmi68j7g8y1bwhxq4apd5` (`receiver_id`),
  KEY `FKcrnfc5k5lxdfurq3b97o52dnv` (`sender_id`),
  CONSTRAINT `FK2hnqtmi68j7g8y1bwhxq4apd5` FOREIGN KEY (`receiver_id`) REFERENCES `User` (`id`),
  CONSTRAINT `FKcrnfc5k5lxdfurq3b97o52dnv` FOREIGN KEY (`sender_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Message`
--

LOCK TABLES `Message` WRITE;
/*!40000 ALTER TABLE `Message` DISABLE KEYS */;
INSERT INTO `Message` VALUES (1,'sdasdfasdf',1,2),(2,'asdfsadfasfd',1,2),(3,'asdfsdafsdaf',2,1),(4,'adsfasdfaf',2,1),(5,'adfasdfsadf',1,2),(6,'asfdsadfsadfsaf',2,1);
/*!40000 ALTER TABLE `Message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tweet`
--

DROP TABLE IF EXISTS `Tweet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tweet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` date DEFAULT NULL,
  `title` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `tweetText` varchar(160) COLLATE utf8_polish_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtjo83phj1ffkewrkbxqmfvw36` (`user_id`),
  CONSTRAINT `FKtjo83phj1ffkewrkbxqmfvw36` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tweet`
--

LOCK TABLES `Tweet` WRITE;
/*!40000 ALTER TABLE `Tweet` DISABLE KEYS */;
INSERT INTO `Tweet` VALUES (1,'2019-01-26','aaaaa','aaaaa',1),(2,'2019-01-26','bbbbb','bbbbbb',1),(3,'2019-01-26','ccccccccc','cccccccccccc',1),(4,'2019-01-26','dddddddddd','ddddddddddddd',1),(5,'2019-01-26','aaaaaaaaaaa','aaaaaaaaaaaaaa',2),(6,'2019-01-26','bbbbbbbbbbbbb','bbbbbbbbbbbbbbbbbbb',2),(7,'2019-01-26','fffffffffffff','fffffffffffffffffff',2);
/*!40000 ALTER TABLE `Tweet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jreodf78a7pl5qidfh43axdfb` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'martin@lazy.com',_binary '','$2a$10$Uw4zuQJSi6Q4PgizRimmJ.xjF5V65gHZ9sIezsEQQLzU6xJa9nY3.','a'),(2,'martin@lazy.com',_binary '','$2a$10$uwiTKWFx8XKChXOGap2t1ug2NzqLLoMOQyf4AyaEuVhQW/TX.ru4u','b'),(3,'martin@lazy.com',_binary '','$2a$10$4aYKYmUvxFGyH4CgOYgsau9aUFQ7LXnC3.Fw9ynQsQDPdBpPRiN8m','c'),(4,'dfg@e',_binary '','$2a$10$qY/n15LSkGSZbTZFIsghY.wv77fCMHDCKY..49JYX/YEGmq1d3m16','d');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Comment`
--

DROP TABLE IF EXISTS `User_Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Comment` (
  `User_id` bigint(20) NOT NULL,
  `comments_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_ah9x95me6onvo198wl0s87lji` (`comments_id`),
  KEY `FKjhm6lfj7c3j3nfuqmflfogiki` (`User_id`),
  CONSTRAINT `FKjhm6lfj7c3j3nfuqmflfogiki` FOREIGN KEY (`User_id`) REFERENCES `User` (`id`),
  CONSTRAINT `FKrxs5nkgg2aaov9407wh1ifglp` FOREIGN KEY (`comments_id`) REFERENCES `Comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Comment`
--

LOCK TABLES `User_Comment` WRITE;
/*!40000 ALTER TABLE `User_Comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Message`
--

DROP TABLE IF EXISTS `User_Message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Message` (
  `User_id` bigint(20) NOT NULL,
  `messages_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_ejgxlcceqp9fm3xflshksil0` (`messages_id`),
  KEY `FKevixh4x7y5n4lc9pah5ndnqp9` (`User_id`),
  CONSTRAINT `FK7tk7piasp6qnpx5fmttbc7p7g` FOREIGN KEY (`messages_id`) REFERENCES `Message` (`id`),
  CONSTRAINT `FKevixh4x7y5n4lc9pah5ndnqp9` FOREIGN KEY (`User_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Message`
--

LOCK TABLES `User_Message` WRITE;
/*!40000 ALTER TABLE `User_Message` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_Message` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-27 13:48:14
