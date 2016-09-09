-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: mava
-- ------------------------------------------------------
-- Server version	5.6.32

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
-- Table structure for table `classification__category`
--

DROP TABLE IF EXISTS `classification__category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classification__category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_43629B36727ACA70` (`parent_id`),
  KEY `IDX_43629B36E25D857E` (`context`),
  KEY `IDX_43629B36EA9FDD75` (`media_id`),
  CONSTRAINT `FK_43629B36727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `classification__category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_43629B36E25D857E` FOREIGN KEY (`context`) REFERENCES `classification__context` (`id`),
  CONSTRAINT `FK_43629B36EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media__media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classification__category`
--

LOCK TABLES `classification__category` WRITE;
/*!40000 ALTER TABLE `classification__category` DISABLE KEYS */;
INSERT INTO `classification__category` VALUES (1,NULL,'default',NULL,'default',1,'default','default',NULL,'2016-09-08 11:29:04','2016-09-08 11:29:04');
/*!40000 ALTER TABLE `classification__category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classification__collection`
--

DROP TABLE IF EXISTS `classification__collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classification__collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_collection` (`slug`,`context`),
  KEY `IDX_A406B56AE25D857E` (`context`),
  KEY `IDX_A406B56AEA9FDD75` (`media_id`),
  CONSTRAINT `FK_A406B56AE25D857E` FOREIGN KEY (`context`) REFERENCES `classification__context` (`id`),
  CONSTRAINT `FK_A406B56AEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media__media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classification__collection`
--

LOCK TABLES `classification__collection` WRITE;
/*!40000 ALTER TABLE `classification__collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `classification__collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classification__context`
--

DROP TABLE IF EXISTS `classification__context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classification__context` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classification__context`
--

LOCK TABLES `classification__context` WRITE;
/*!40000 ALTER TABLE `classification__context` DISABLE KEYS */;
INSERT INTO `classification__context` VALUES ('default','default',1,'2016-09-08 11:29:04','2016-09-08 11:29:04');
/*!40000 ALTER TABLE `classification__context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classification__tag`
--

DROP TABLE IF EXISTS `classification__tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classification__tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_context` (`slug`,`context`),
  KEY `IDX_CA57A1C7E25D857E` (`context`),
  CONSTRAINT `FK_CA57A1C7E25D857E` FOREIGN KEY (`context`) REFERENCES `classification__context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classification__tag`
--

LOCK TABLES `classification__tag` WRITE;
/*!40000 ALTER TABLE `classification__tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `classification__tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media__gallery`
--

DROP TABLE IF EXISTS `media__gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media__gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `default_format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media__gallery`
--

LOCK TABLES `media__gallery` WRITE;
/*!40000 ALTER TABLE `media__gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `media__gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media__gallery_media`
--

DROP TABLE IF EXISTS `media__gallery_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media__gallery_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_80D4C5414E7AF8F` (`gallery_id`),
  KEY `IDX_80D4C541EA9FDD75` (`media_id`),
  CONSTRAINT `FK_80D4C5414E7AF8F` FOREIGN KEY (`gallery_id`) REFERENCES `media__gallery` (`id`),
  CONSTRAINT `FK_80D4C541EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media__media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media__gallery_media`
--

LOCK TABLES `media__gallery_media` WRITE;
/*!40000 ALTER TABLE `media__gallery_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media__gallery_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media__media`
--

DROP TABLE IF EXISTS `media__media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media__media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL,
  `provider_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_status` int(11) NOT NULL,
  `provider_reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_metadata` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `length` decimal(10,0) DEFAULT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_size` int(11) DEFAULT NULL,
  `copyright` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cdn_is_flushable` tinyint(1) DEFAULT NULL,
  `cdn_flush_identifier` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cdn_flush_at` datetime DEFAULT NULL,
  `cdn_status` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5C6DD74E12469DE2` (`category_id`),
  CONSTRAINT `FK_5C6DD74E12469DE2` FOREIGN KEY (`category_id`) REFERENCES `classification__category` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media__media`
--

LOCK TABLES `media__media` WRITE;
/*!40000 ALTER TABLE `media__media` DISABLE KEYS */;
INSERT INTO `media__media` VALUES (3,1,'zombie-nerd-bunny-lovely.jpg',NULL,0,'sonata.media.provider.file',1,'d7a79248899b976e7ce4cdf2e191815d9321b21b.jpeg','{\"filename\":\"zombie-nerd-bunny-lovely.jpg\"}',NULL,NULL,NULL,'image/jpeg',264458,'2016',NULL,'default',0,NULL,NULL,NULL,'2016-09-08 12:54:52','2016-09-08 12:08:31');
/*!40000 ALTER TABLE `media__media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `subject` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BF5476CAA76ED395` (`user_id`),
  CONSTRAINT `FK_BF5476CAA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (115,35,'asas','updates for task: asas','2016-09-08 17:30:56','2016-09-08 17:30:56'),(116,35,'Task Dummy','updates for task: Task Dummy','2016-09-09 08:44:30','2016-09-09 08:44:30'),(117,35,'Task Dummy','updates for task: Task Dummy','2016-09-09 08:46:28','2016-09-09 08:46:28');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET latin1 NOT NULL,
  `description` tinytext CHARACTER SET latin1 NOT NULL,
  `due_date` datetime NOT NULL,
  `workspace_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_project_idx` (`workspace_id`),
  CONSTRAINT `fk_project` FOREIGN KEY (`workspace_id`) REFERENCES `workspace` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'saepe','Magni rerum consequatur laudantium nisi quo earum. Esse eveniet debitis omnis voluptatem voluptatem et. Praesentium et praesentium est. Molestiae porro consequuntur quos hic.','2016-08-17 05:04:32',1),(2,'doloremque','Dignissimos et dolorem doloremque quam quia. Quibusdam ad in maiores nisi eius. Sapiente quia recusandae aut numquam laboriosam sint enim. Quod ullam at ut non eos sed amet sunt.','2016-08-17 04:24:56',3),(3,'beatae','Quae sit veniam vel eos officiis et est nisi. Amet neque deleniti totam aut nisi. Omnis voluptatem velit nesciunt eligendi eos sint. Voluptates quo incidunt omnis aut enim nihil.','2016-08-16 04:53:40',3),(4,'minus','Porro voluptatibus enim quia reprehenderit magni fugiat. Officiis velit alias et et quis. Distinctio ratione quis voluptates. Totam eos omnis inventore perferendis voluptatem nisi quis.','2016-08-16 10:53:42',1),(5,'asperiores','Omnis inventore mollitia unde id in id. Molestiae in maxime sint doloremque similique aut est. Consectetur odio facere odio modi. Dicta ipsa temporibus sit facere cupiditate doloremque odio.','2016-08-15 12:06:29',2),(6,'quos','Accusantium quidem ut eius a corrupti totam placeat delectus. Earum officiis sed autem ut voluptatem. Quod alias iste similique aut tempore pariatur et.','2016-08-12 15:27:07',2),(7,'accusantium','Ad est et et cum eius voluptas numquam. Occaecati culpa aut in laudantium omnis. Aut laborum cupiditate corporis aliquid aut cumque consequuntur. Qui est maiores aliquid rerum autem qui.','2016-08-12 23:24:41',2);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET latin1 NOT NULL,
  `description` tinytext CHARACTER SET latin1 NOT NULL,
  `due_date` datetime NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_527EDB25464E68B` (`attachment_id`),
  KEY `fk_task_1_idx` (`project_id`),
  KEY `fk_task_2_idx` (`user_id`),
  CONSTRAINT `FK_527EDB25464E68B` FOREIGN KEY (`attachment_id`) REFERENCES `media__media` (`id`),
  CONSTRAINT `fk_task_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `fk_task_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'modi','Voluptatem at qui eaque nihil. Eos fugit natus quaerat quibusdam alias. Accusamus aut dolores perspiciatis itaque doloribus qui. Eligendi quae recusandae facere quo.','2016-09-16 00:00:00',1,39,'completed',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'ex','Nisi fuga dolores aut velit illo. Sint voluptas a aperiam voluptas aut qui neque. Eos fugit nostrum non et et et fugit. Excepturi enim velit qui nam nesciunt non dolore quis.','2016-09-11 09:10:04',7,42,'',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'dolorem','Similique tenetur aut sit aliquam provident et. Eveniet consequatur sit impedit sint nam. Sit est magnam ut.','2016-08-23 05:50:53',7,39,'',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'quas','In reprehenderit reiciendis accusamus facilis quia et. Deleniti qui nostrum doloremque minima aut molestiae. Est consequatur numquam tempore similique ut debitis consequatur facere.','2016-09-19 23:50:31',7,35,'',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'rerum','Nulla voluptatem aperiam ipsa eius repellat. Reiciendis voluptas doloremque esse dolor. Illo placeat harum voluptatem at enim. Voluptas ut dolorem voluptates deserunt.','2016-11-05 15:17:07',7,42,'',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,'delectus','Cupiditate aut consequatur aut ullam qui. Voluptatem aut cum vitae nostrum non. Non omnis aut quos ut ad est quidem eum. Voluptates laboriosam ea porro blanditiis eos enim non aut.','2016-11-11 13:10:45',6,42,'',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'nisi','Magni nihil voluptatem magnam. Impedit recusandae omnis consequatur ut repellendus. Nihil reprehenderit non ut rem esse magnam iure.','2016-08-21 04:15:04',5,38,'',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,'et','Voluptas et aut sunt reiciendis. Voluptas molestiae eum et eos fugiat.\nConsequuntur nostrum culpa in quod. Quae dignissimos sunt atque aut unde. Accusamus sint hic ut atque expedita ratione minima.','2016-10-14 22:27:08',2,43,'',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,'ratione','Ullam tempore autem sapiente id consequuntur. Dolore qui in et quasi incidunt rerum ex. Aut itaque nesciunt sit quidem fugit sapiente ullam.','2016-10-29 16:48:38',6,37,'',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,'dolores','Et necessitatibus quasi qui sit rem consequatur. Incidunt et sunt tempora sunt aliquam mollitia id repudiandae. Doloremque placeat ut esse. Aut ratione cumque commodi.','2016-10-20 15:42:32',2,38,'',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,'quia','Sed aut quia culpa vero tenetur vel quasi. Rerum quo ut accusantium omnis quibusdam.','2016-09-27 18:04:35',6,34,'',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,'laborum','Ut odio et id consequatur. Quia porro minus voluptates. Est officiis est repudiandae est atque. Inventore sed ipsum omnis maiores esse.','2016-09-06 22:15:40',7,43,'',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,'quasi','Repudiandae laborum dolor quasi totam qui ipsam iusto. Inventore molestias amet aut qui nihil. Fuga velit iure consequuntur qui provident et accusamus.','2016-09-25 05:31:15',6,39,'',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,'ducimus','Ad labore quos saepe quia quia unde quos error. Saepe eos et ab velit.','2016-10-08 10:21:09',7,37,'',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,'ut','Vero voluptates fugit officiis explicabo. Libero sit ducimus minima. Suscipit id tempore voluptatibus recusandae et deleniti tenetur.','2016-08-13 05:19:26',4,34,'',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(16,'Lorem','ipsum','2016-03-01 00:00:00',1,44,'new',NULL,'2016-09-08 16:00:04','2016-09-08 16:00:04'),(25,'Task Dummy','Integer convallis purus et mi sollicitudin, quis semper quam vestibulum. Sed laoreet ipsum risus, ut semper lorem sollicitudin eu. Aenean sed felis venenatis risus vestibulum rhoncus vel sed ipsum. Donec leo mauris, tempor et mi sit amet, consectetur temp','2016-10-01 00:00:00',1,35,'in progress',NULL,'2016-09-08 17:30:56','2016-09-09 08:46:28');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C4E0A61F166D1F9C` (`project_id`),
  CONSTRAINT `FK_C4E0A61F166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D64992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_8D93D649A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_8D93D649C05FB297` (`confirmation_token`),
  UNIQUE KEY `UNIQ_8D93D649296CD8AE` (`team_id`),
  CONSTRAINT `FK_8D93D649296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (34,'morissette.erna','morissette.erna','wkohler@johnson.com','wkohler@johnson.com',0,'fh723nqmdk0kc00g4kcg8k44sogkww0','R4Usi|L@vH',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(35,'kaley86','kaley86','ffadel@hotmail.com','ffadel@hotmail.com',0,'8ntmviynysg0800osg4woko484g40wg','3a)bQsrunw0{:0&,`vGW',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(36,'letha.koepp','letha.koepp','marquis.conroy@gmail.com','marquis.conroy@gmail.com',0,'ae53zjyajio8gwwo8w4cs8ocsc0sg80','0G|$7[}Ag',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(37,'jackeline78','jackeline78','obins@ledner.com','obins@ledner.com',0,'3vk0znv9frs4co4gsk8wogckwkcs8g8','<*d,-R\"(?w4v9bOW&VH',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(38,'verna58','verna58','spencer.lemke@yahoo.com','spencer.lemke@yahoo.com',0,'p8rbt6kthpckkkw0owocgo0ggs0gw88','bOWS%hSz_rQk&|X+*KrK',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(39,'braun.larue','braun.larue','ethelyn92@yahoo.com','ethelyn92@yahoo.com',0,'dtxu1416noggcg84k0004sco0sk880o','V7\\ert=[]g]',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(40,'dorthy.hermann','dorthy.hermann','dmarvin@hotmail.com','dmarvin@hotmail.com',0,'jwebh2687m88sk88o4w4g4kkgc4ow00','_OD\'+j',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(41,'bergnaum.franz','bergnaum.franz','jaskolski.odell@ruecker.com','jaskolski.odell@ruecker.com',0,'gllie5r6utc04wccgookc0088w4koc8','Vb~6E/`WM',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(42,'torphy.louie','torphy.louie','runolfsdottir.jayne@wuckert.info','runolfsdottir.jayne@wuckert.info',0,'scmt528qhqsoc4o4408g4ss48kcgo0','o=T!xnR',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(43,'roberts.reagan','roberts.reagan','coralie24@yahoo.com','coralie24@yahoo.com',0,'48ggytkif6yog4wckwogkcwsow08c8o','kw%cM,1}Z',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,NULL),(44,'Mava','mava','info@mava.info','info@mava.info',1,'dfszxrza33sw888844cs0wck8ckkg4s','$2y$13$a.HoumC99WjpW3O0GXx4ruIHelXKbL5D5c6EjCMVIyMsJu7uCZo6O','2016-09-07 11:33:37',0,0,NULL,NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}',0,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workspace`
--

DROP TABLE IF EXISTS `workspace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workspace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET latin1 NOT NULL,
  `description` tinytext CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workspace`
--

LOCK TABLES `workspace` WRITE;
/*!40000 ALTER TABLE `workspace` DISABLE KEYS */;
INSERT INTO `workspace` VALUES (1,'accusantium','Atque possimus aut dolores quis totam incidunt ducimus aperiam. Est quia assumenda minima sunt. Similique ut culpa natus consequatur reiciendis sit. Nihil ut porro amet laborum iure molestiae et.'),(2,'ea','Voluptatem laudantium perferendis eveniet quam vero fuga. Omnis temporibus maxime sint suscipit laudantium. Magni non voluptas fuga non autem non non. Et neque itaque ex quaerat.'),(3,'sed','Ex beatae reprehenderit exercitationem corrupti dolorem reprehenderit ut ducimus. Molestiae consequatur sint consequatur est qui doloremque.');
/*!40000 ALTER TABLE `workspace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mava'
--

--
-- Dumping routines for database 'mava'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-09  8:49:10
