CREATE DATABASE  IF NOT EXISTS `mava_test` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mava_test`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: mava_test
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
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workspace_id` int(11) DEFAULT NULL,
  `title` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `due_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_project_idx` (`workspace_id`),
  CONSTRAINT `FK_2FB3D0EE82D40A1F` FOREIGN KEY (`workspace_id`) REFERENCES `workspace` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,1,'saepe','Magni rerum consequatur laudantium nisi quo earum. Esse eveniet debitis omnis voluptatem voluptatem et. Praesentium et praesentium est. Molestiae porro consequuntur quos hic.','2016-08-17 05:11:01'),(2,3,'doloremque','Dignissimos et dolorem doloremque quam quia. Quibusdam ad in maiores nisi eius. Sapiente quia recusandae aut numquam laboriosam sint enim. Quod ullam at ut non eos sed amet sunt.','2016-08-17 04:31:25'),(3,3,'beatae','Quae sit veniam vel eos officiis et est nisi. Amet neque deleniti totam aut nisi. Omnis voluptatem velit nesciunt eligendi eos sint. Voluptates quo incidunt omnis aut enim nihil.','2016-08-16 05:00:09'),(4,1,'minus','Porro voluptatibus enim quia reprehenderit magni fugiat. Officiis velit alias et et quis. Distinctio ratione quis voluptates. Totam eos omnis inventore perferendis voluptatem nisi quis.','2016-08-16 11:00:11'),(5,2,'asperiores','Omnis inventore mollitia unde id in id. Molestiae in maxime sint doloremque similique aut est. Consectetur odio facere odio modi. Dicta ipsa temporibus sit facere cupiditate doloremque odio.','2016-08-15 12:12:58'),(6,2,'quos','Accusantium quidem ut eius a corrupti totam placeat delectus. Earum officiis sed autem ut voluptatem. Quod alias iste similique aut tempore pariatur et.','2016-08-12 15:33:36'),(7,2,'accusantium','Ad est et et cum eius voluptas numquam. Occaecati culpa aut in laudantium omnis. Aut laborum cupiditate corporis aliquid aut cumque consequuntur. Qui est maiores aliquid rerum autem qui.','2016-08-12 23:31:10');
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
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `due_date` datetime NOT NULL,
  `attachment` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_task_1_idx` (`project_id`),
  KEY `fk_task_2_idx` (`user_id`),
  CONSTRAINT `FK_527EDB25166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_527EDB25A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,1,6,'modi','Voluptatem at qui eaque nihil. Eos fugit natus quaerat quibusdam alias. Accusamus aut dolores perspiciatis itaque doloribus qui. Eligendi quae recusandae facere quo.','2016-09-16 20:26:13',1),(2,7,9,'ex','Nisi fuga dolores aut velit illo. Sint voluptas a aperiam voluptas aut qui neque. Eos fugit nostrum non et et et fugit. Excepturi enim velit qui nam nesciunt non dolore quis.','2016-09-11 09:16:33',1),(3,7,6,'dolorem','Similique tenetur aut sit aliquam provident et. Eveniet consequatur sit impedit sint nam. Sit est magnam ut.','2016-08-23 05:57:22',0),(4,7,2,'quas','In reprehenderit reiciendis accusamus facilis quia et. Deleniti qui nostrum doloremque minima aut molestiae. Est consequatur numquam tempore similique ut debitis consequatur facere.','2016-09-19 23:57:00',0),(5,7,9,'rerum','Nulla voluptatem aperiam ipsa eius repellat. Reiciendis voluptas doloremque esse dolor. Illo placeat harum voluptatem at enim. Voluptas ut dolorem voluptates deserunt.','2016-11-05 15:23:36',0),(6,6,9,'delectus','Cupiditate aut consequatur aut ullam qui. Voluptatem aut cum vitae nostrum non. Non omnis aut quos ut ad est quidem eum. Voluptates laboriosam ea porro blanditiis eos enim non aut.','2016-11-11 13:17:14',0),(7,5,5,'nisi','Magni nihil voluptatem magnam. Impedit recusandae omnis consequatur ut repellendus. Nihil reprehenderit non ut rem esse magnam iure.','2016-08-21 04:21:33',0),(8,2,10,'et','Voluptas et aut sunt reiciendis. Voluptas molestiae eum et eos fugiat.\nConsequuntur nostrum culpa in quod. Quae dignissimos sunt atque aut unde. Accusamus sint hic ut atque expedita ratione minima.','2016-10-14 22:33:37',0),(9,6,4,'ratione','Ullam tempore autem sapiente id consequuntur. Dolore qui in et quasi incidunt rerum ex. Aut itaque nesciunt sit quidem fugit sapiente ullam.','2016-10-29 16:55:07',0),(10,2,5,'dolores','Et necessitatibus quasi qui sit rem consequatur. Incidunt et sunt tempora sunt aliquam mollitia id repudiandae. Doloremque placeat ut esse. Aut ratione cumque commodi.','2016-10-20 15:49:01',1),(11,6,1,'quia','Sed aut quia culpa vero tenetur vel quasi. Rerum quo ut accusantium omnis quibusdam.','2016-09-27 18:11:04',0),(12,7,10,'laborum','Ut odio et id consequatur. Quia porro minus voluptates. Est officiis est repudiandae est atque. Inventore sed ipsum omnis maiores esse.','2016-09-06 22:22:09',1),(13,6,6,'quasi','Repudiandae laborum dolor quasi totam qui ipsam iusto. Inventore molestias amet aut qui nihil. Fuga velit iure consequuntur qui provident et accusamus.','2016-09-25 05:37:44',1),(14,7,4,'ducimus','Ad labore quos saepe quia quia unde quos error. Saepe eos et ab velit.','2016-10-08 10:27:38',0),(15,4,1,'ut','Vero voluptates fugit officiis explicabo. Libero sit ducimus minima. Suscipit id tempore voluptatibus recusandae et deleniti tenetur.','2016-08-13 05:25:55',0);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D64992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_8D93D649A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'morissette.erna','morissette.erna','wkohler@johnson.com','wkohler@johnson.com',0,'p2otge9knq8gs0w00k0ow4g40o0kwk0','R4Usi|L@vH',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL),(2,'kaley86','kaley86','ffadel@hotmail.com','ffadel@hotmail.com',0,'efqd7rgul6o0o8s0wgsg4wc80g88cko','3a)bQsrunw0{:0&,`vGW',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL),(3,'letha.koepp','letha.koepp','marquis.conroy@gmail.com','marquis.conroy@gmail.com',0,'2sc82f5ds44koocgcokkcsk4w4wgwg4','0G|$7[}Ag',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL),(4,'jackeline78','jackeline78','obins@ledner.com','obins@ledner.com',0,'hwyoupfhhjk8oo08c44wg04cco4kk80','<*d,-R\"(?w4v9bOW&VH',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL),(5,'verna58','verna58','spencer.lemke@yahoo.com','spencer.lemke@yahoo.com',0,'mgsfjjmwtaoc840gwk8884gsoc8sw00','bOWS%hSz_rQk&|X+*KrK',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL),(6,'braun.larue','braun.larue','ethelyn92@yahoo.com','ethelyn92@yahoo.com',0,'qxfk00v0w8gow8kc0oc8c4cws08o484','V7\\ert=[]g]',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL),(7,'dorthy.hermann','dorthy.hermann','dmarvin@hotmail.com','dmarvin@hotmail.com',0,'aexurdm2cjcwgk00cwgwwkg0kg48c8k','_OD\'+j',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL),(8,'bergnaum.franz','bergnaum.franz','jaskolski.odell@ruecker.com','jaskolski.odell@ruecker.com',0,'fkmegb5x54gso4c8wckkso0kswg8kkw','Vb~6E/`WM',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL),(9,'torphy.louie','torphy.louie','runolfsdottir.jayne@wuckert.info','runolfsdottir.jayne@wuckert.info',0,'dwmskh2ip0gg08gw4wkg8wso4go4wsk','o=T!xnR',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL),(10,'roberts.reagan','roberts.reagan','coralie24@yahoo.com','coralie24@yahoo.com',0,'661bc4ldrkgscokcsc80os8s8sog444','kw%cM,1}Z',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL);
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
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` tinytext COLLATE utf8_unicode_ci NOT NULL,
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
-- Dumping events for database 'mava_test'
--

--
-- Dumping routines for database 'mava_test'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-11 15:52:11
