-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: paytm
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
-- Table structure for table `admin_tools_dashboard_preferences`
--

DROP TABLE IF EXISTS `admin_tools_dashboard_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_tools_dashboard_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  `dashboard_id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_tools_dashboard_preferences_user_id_74da8e56_uniq` (`user_id`,`dashboard_id`),
  CONSTRAINT `admin_tools_dashboard_preferenc_user_id_8f768e6c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_tools_dashboard_preferences`
--

LOCK TABLES `admin_tools_dashboard_preferences` WRITE;
/*!40000 ALTER TABLE `admin_tools_dashboard_preferences` DISABLE KEYS */;
INSERT INTO `admin_tools_dashboard_preferences` VALUES (1,'{\"positions\":[\"module_2\",\"module_3\",\"module_5\",\"module_6\",\"module_4\"],\"columns\":[3,3],\"disabled\":{\"module_5\":true,\"module_6\":true,\"module_2\":false,\"module_3\":true,\"module_4\":true},\"collapsed\":{}}','dashboard',1),(2,'{\"positions\":{},\"columns\":{},\"disabled\":{\"module_1\":false},\"collapsed\":{}}','product-dashboard',1),(3,'{\"positions\":{},\"columns\":{},\"disabled\":{\"module_5\":true,\"module_6\":false},\"collapsed\":{}}','dashboard',2);
/*!40000 ALTER TABLE `admin_tools_dashboard_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_tools_menu_bookmark`
--

DROP TABLE IF EXISTS `admin_tools_menu_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_tools_menu_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_tools_menu_bookmark_user_id_0382e410_fk_auth_user_id` (`user_id`),
  CONSTRAINT `admin_tools_menu_bookmark_user_id_0382e410_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_tools_menu_bookmark`
--

LOCK TABLES `admin_tools_menu_bookmark` WRITE;
/*!40000 ALTER TABLE `admin_tools_menu_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_tools_menu_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add product',7,'add_product'),(20,'Can change product',7,'change_product'),(21,'Can delete product',7,'delete_product'),(22,'Can add bookmark',8,'add_bookmark'),(23,'Can change bookmark',8,'change_bookmark'),(24,'Can delete bookmark',8,'delete_bookmark'),(25,'Can add dashboard preferences',9,'add_dashboardpreferences'),(26,'Can change dashboard preferences',9,'change_dashboardpreferences'),(27,'Can delete dashboard preferences',9,'delete_dashboardpreferences'),(28,'Can add category',10,'add_category'),(29,'Can change category',10,'change_category'),(30,'Can delete category',10,'delete_category'),(31,'Can add brand',11,'add_brand'),(32,'Can change brand',11,'change_brand'),(33,'Can delete brand',11,'delete_brand'),(34,'Can add size',12,'add_size'),(35,'Can change size',12,'change_size'),(36,'Can delete size',12,'delete_size'),(37,'Can add color',13,'add_color'),(38,'Can change color',13,'change_color'),(39,'Can delete color',13,'delete_color'),(40,'Can add properties',14,'add_properties'),(41,'Can change properties',14,'change_properties'),(42,'Can delete properties',14,'delete_properties');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$gIRu2Q6TvV2D$+y80ws1WU4Z5Ih8Y+2ueHC/nJGnOrG4/L0U7mpMLd+Y=','2018-12-25 12:57:28.893106',1,'paytm123','paytm','paytm','paytm@paytm.com',1,1,'2018-12-24 11:42:09.000000'),(2,'pbkdf2_sha256$24000$gIRu2Q6TvV2D$+y80ws1WU4Z5Ih8Y+2ueHC/nJGnOrG4/L0U7mpMLd+Y=','2018-12-25 10:36:16.863218',1,'paytm456','paytm 2nd','paytm 2nd user','paytm2@paytm.com',1,1,'2018-12-25 09:35:08.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-12-24 20:25:36.959159','1','Category object',1,'Added.',10,1),(2,'2018-12-24 20:27:29.731016','1','Category object',2,'Changed description.',10,1),(3,'2018-12-24 20:50:42.701986','1','T-shirts',2,'Changed parent and related_categories.',10,1),(4,'2018-12-24 20:52:29.576059','2','BABY',1,'Added.',10,1),(5,'2018-12-24 20:53:30.290916','3','MEN',1,'Added.',10,1),(6,'2018-12-24 20:54:31.448967','4','WOMEN',1,'Added.',10,1),(7,'2018-12-24 21:05:35.112917','2','BABY',2,'Changed related_categories.',10,1),(8,'2018-12-24 21:05:58.350674','2','BABY',2,'Changed related_categories.',10,1),(9,'2018-12-24 21:21:06.203670','1','T-shirts',2,'Changed related_categories.',10,1),(10,'2018-12-24 21:21:47.775190','1','T-shirts',2,'Changed related_categories.',10,1),(11,'2018-12-24 21:34:51.476483','4','Sports Tshirt',2,'Changed name and description.',10,1),(12,'2018-12-24 21:35:54.557706','2','Half Sleeves Tshirt',2,'Changed name and description.',10,1),(13,'2018-12-24 21:36:39.507705','3','MEN Round NecK T shirt',2,'Changed name and description.',10,1),(14,'2018-12-24 21:37:30.539635','5','Men Polo Tshirt',1,'Added.',10,1),(15,'2018-12-24 21:38:21.580918','6','Men Tshirt',1,'Added.',10,1),(16,'2018-12-24 21:39:07.305691','7','Women Tshirt',1,'Added.',10,1),(17,'2018-12-24 21:40:14.860338','2','Sleeves Tshirt',2,'Changed name and related_categories.',10,1),(18,'2018-12-24 21:40:36.405196','4','Sports Tshirt',2,'Changed related_categories.',10,1),(19,'2018-12-24 21:41:24.926196','5','Polo Tshirt',2,'Changed name, description and related_categories.',10,1),(20,'2018-12-24 21:41:55.151361','3','Round NecK T shirt',2,'Changed name, description and related_categories.',10,1),(21,'2018-12-24 21:44:17.493138','1','Brand object',1,'Added.',11,1),(22,'2018-12-24 21:45:33.718146','2','Brand object',1,'Added.',11,1),(23,'2018-12-24 21:47:56.288727','3','Brand object',1,'Added.',11,1),(24,'2018-12-24 21:48:32.799669','4','Brand object',1,'Added.',11,1),(25,'2018-12-24 21:49:31.797888','5','Brand object',1,'Added.',11,1),(26,'2018-12-24 22:23:17.651492','6','Men Tshirt',2,'Changed related_categories.',10,1),(27,'2018-12-24 22:23:39.626617','7','Women Tshirt',2,'No fields changed.',10,1),(28,'2018-12-24 22:23:55.974562','7','Women Tshirt',2,'Changed related_categories.',10,1),(29,'2018-12-25 09:00:40.524494','1','XS',1,'Added.',12,1),(30,'2018-12-25 09:00:44.115900','2','S',1,'Added.',12,1),(31,'2018-12-25 09:00:50.755744','3','M',1,'Added.',12,1),(32,'2018-12-25 09:00:54.892650','4','L',1,'Added.',12,1),(33,'2018-12-25 09:00:59.208648','5','XL',1,'Added.',12,1),(34,'2018-12-25 09:01:04.787464','6','XXL',1,'Added.',12,1),(35,'2018-12-25 09:01:12.346967','7','Free Size',1,'Added.',12,1),(36,'2018-12-25 09:02:05.788290','1','White',1,'Added.',13,1),(37,'2018-12-25 09:02:19.913896','2','Black',1,'Added.',13,1),(38,'2018-12-25 09:02:32.689447','3','Green',1,'Added.',13,1),(39,'2018-12-25 09:02:42.968875','4','Blue',1,'Added.',13,1),(40,'2018-12-25 09:02:55.906765','5','Pink',1,'Added.',13,1),(41,'2018-12-25 09:03:09.345546','6','Yellow',1,'Added.',13,1),(42,'2018-12-25 09:03:20.616463','7','Maroon',1,'Added.',13,1),(43,'2018-12-25 09:04:43.837641','1','Fashion',1,'Added.',14,1),(44,'2018-12-25 09:05:01.930356','2','Fashion / FS',1,'Added.',14,1),(45,'2018-12-25 09:05:12.567647','3','Basic',1,'Added.',14,1),(46,'2018-12-25 09:05:25.988429','4','Basic / FS',1,'Added.',14,1),(47,'2018-12-25 09:05:58.491915','5','Cotton',1,'Added.',14,1),(48,'2018-12-25 09:06:04.228070','6','Fabric',1,'Added.',14,1),(49,'2018-12-25 09:06:14.983878','7','Printed',1,'Added.',14,1),(50,'2018-12-25 09:06:22.467723','8','Check',1,'Added.',14,1),(51,'2018-12-25 09:29:19.490380','1','Product object',1,'Added.',7,1),(52,'2018-12-25 09:31:50.250520','1','Product object',2,'Changed properties.',7,1),(53,'2018-12-25 09:32:05.920961','1','Product object',2,'Changed properties.',7,1),(54,'2018-12-25 09:35:08.738872','2','paytm456',1,'Added.',4,1),(55,'2018-12-25 09:36:21.477294','2','paytm456',2,'Changed first_name, last_name, email and is_staff.',4,1),(56,'2018-12-25 10:25:13.743171','2','Product object',1,'Added.',7,1),(57,'2018-12-25 10:27:31.128284','3','Product object',1,'Added.',7,1),(58,'2018-12-25 10:29:25.552187','4','Product object',1,'Added.',7,1),(59,'2018-12-25 10:36:08.776306','2','paytm456',2,'Changed is_superuser.',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'dashboard','dashboardpreferences'),(8,'menu','bookmark'),(11,'product','brand'),(10,'product','category'),(13,'product','color'),(7,'product','product'),(14,'product','properties'),(12,'product','size'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-12-24 11:36:45.053391'),(2,'auth','0001_initial','2018-12-24 11:37:03.291222'),(3,'admin','0001_initial','2018-12-24 11:37:06.853924'),(4,'admin','0002_logentry_remove_auto_add','2018-12-24 11:37:07.146830'),(5,'contenttypes','0002_remove_content_type_name','2018-12-24 11:37:10.005164'),(6,'auth','0002_alter_permission_name_max_length','2018-12-24 11:37:10.139108'),(7,'auth','0003_alter_user_email_max_length','2018-12-24 11:37:10.292612'),(8,'auth','0004_alter_user_username_opts','2018-12-24 11:37:10.345945'),(9,'auth','0005_alter_user_last_login_null','2018-12-24 11:37:10.932199'),(10,'auth','0006_require_contenttypes_0002','2018-12-24 11:37:10.973470'),(11,'auth','0007_alter_validators_add_error_messages','2018-12-24 11:37:11.067129'),(12,'sessions','0001_initial','2018-12-24 11:37:12.238280'),(13,'product','0001_initial','2018-12-24 12:55:47.889014'),(14,'dashboard','0001_initial','2018-12-24 13:35:51.395965'),(15,'menu','0001_initial','2018-12-24 13:35:52.997210'),(16,'product','0002_auto_20181224_1752','2018-12-24 17:52:31.314719'),(17,'product','0003_auto_20181224_2254','2018-12-24 22:55:05.721644'),(18,'product','0004_auto_20181224_2355','2018-12-24 23:55:53.513287'),(19,'product','0005_auto_20181225_0856','2018-12-25 08:56:37.997627'),(20,'product','0006_auto_20181225_1021','2018-12-25 10:22:03.266783');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('7cf94r8jj5exv0vjyx9ql7yi5b0ze36s','OGM1NjkwMTZmYWQ0NzBmNzZmNjczMmJlZjgwMTBiMzViMGZhMmJkYjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg4NDBmZmFlMDlmYzgyZDNlNjU5ZDQ1YjYxMWYxM2NmMzE5MzdkZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-01-07 13:45:16.830558'),('7v9w3shp0dsl8qgx4z2dd8nrseyt3toc','OGM1NjkwMTZmYWQ0NzBmNzZmNjczMmJlZjgwMTBiMzViMGZhMmJkYjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg4NDBmZmFlMDlmYzgyZDNlNjU5ZDQ1YjYxMWYxM2NmMzE5MzdkZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-01-07 12:08:33.070786'),('arfy7c601ls7nx2k5yk85z7e8u8kfcmn','OGM1NjkwMTZmYWQ0NzBmNzZmNjczMmJlZjgwMTBiMzViMGZhMmJkYjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg4NDBmZmFlMDlmYzgyZDNlNjU5ZDQ1YjYxMWYxM2NmMzE5MzdkZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-01-07 17:53:09.231841'),('foyunusqf0g8nmx758fqrqd1xkbl6wxh','OGM1NjkwMTZmYWQ0NzBmNzZmNjczMmJlZjgwMTBiMzViMGZhMmJkYjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg4NDBmZmFlMDlmYzgyZDNlNjU5ZDQ1YjYxMWYxM2NmMzE5MzdkZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-01-07 22:19:08.495441'),('fqs19i9uvxac1oqrhxr6j2ngne5c1hsj','OGM1NjkwMTZmYWQ0NzBmNzZmNjczMmJlZjgwMTBiMzViMGZhMmJkYjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg4NDBmZmFlMDlmYzgyZDNlNjU5ZDQ1YjYxMWYxM2NmMzE5MzdkZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-01-07 11:44:40.397388'),('gux3dawo5f82za1vbsecdfdlgljdq3x1','OGM1NjkwMTZmYWQ0NzBmNzZmNjczMmJlZjgwMTBiMzViMGZhMmJkYjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg4NDBmZmFlMDlmYzgyZDNlNjU5ZDQ1YjYxMWYxM2NmMzE5MzdkZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-01-08 12:36:44.965970'),('htgzms4vezncapopfp5w0zigrvzdfsb7','OGM1NjkwMTZmYWQ0NzBmNzZmNjczMmJlZjgwMTBiMzViMGZhMmJkYjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg4NDBmZmFlMDlmYzgyZDNlNjU5ZDQ1YjYxMWYxM2NmMzE5MzdkZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-01-07 20:24:24.264377'),('jec50sj9cvon5mxczi3unoizak3dkf2h','OGM1NjkwMTZmYWQ0NzBmNzZmNjczMmJlZjgwMTBiMzViMGZhMmJkYjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg4NDBmZmFlMDlmYzgyZDNlNjU5ZDQ1YjYxMWYxM2NmMzE5MzdkZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-01-07 17:17:53.551357'),('mmuw0c823as30we3ks2trayvnsgawuq8','OGM1NjkwMTZmYWQ0NzBmNzZmNjczMmJlZjgwMTBiMzViMGZhMmJkYjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg4NDBmZmFlMDlmYzgyZDNlNjU5ZDQ1YjYxMWYxM2NmMzE5MzdkZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-01-08 12:57:29.299320'),('rf3msv05fz0csf4z6dvxs2k1ms1lz5u8','OGM1NjkwMTZmYWQ0NzBmNzZmNjczMmJlZjgwMTBiMzViMGZhMmJkYjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg4NDBmZmFlMDlmYzgyZDNlNjU5ZDQ1YjYxMWYxM2NmMzE5MzdkZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-01-07 15:00:58.554446'),('s14o12x2svd012faeou5o3liy3hwzb6o','OGM1NjkwMTZmYWQ0NzBmNzZmNjczMmJlZjgwMTBiMzViMGZhMmJkYjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg4NDBmZmFlMDlmYzgyZDNlNjU5ZDQ1YjYxMWYxM2NmMzE5MzdkZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-01-07 18:03:10.072682'),('wy0xn901gqsunoa7ocaoqtdyusqw4psd','OGM1NjkwMTZmYWQ0NzBmNzZmNjczMmJlZjgwMTBiMzViMGZhMmJkYjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg4NDBmZmFlMDlmYzgyZDNlNjU5ZDQ1YjYxMWYxM2NmMzE5MzdkZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-01-07 17:06:14.112032'),('yf6v79a6r1wzqd8mvfclaae4u3h36521','OGM1NjkwMTZmYWQ0NzBmNzZmNjczMmJlZjgwMTBiMzViMGZhMmJkYjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg4NDBmZmFlMDlmYzgyZDNlNjU5ZDQ1YjYxMWYxM2NmMzE5MzdkZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-01-07 12:56:03.747691'),('zgj8v73989cnvstcrazhphzu97nge70y','OGM1NjkwMTZmYWQ0NzBmNzZmNjczMmJlZjgwMTBiMzViMGZhMmJkYjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg4NDBmZmFlMDlmYzgyZDNlNjU5ZDQ1YjYxMWYxM2NmMzE5MzdkZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-01-07 22:55:14.879885');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_brand`
--

DROP TABLE IF EXISTS `product_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `contact` varchar(400) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `address` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_brand`
--

LOCK TABLES `product_brand` WRITE;
/*!40000 ALTER TABLE `product_brand` DISABLE KEYS */;
INSERT INTO `product_brand` VALUES (1,'reebok','paytm reebok',1,'reebok office'),(2,'HRX','paytm hrx',1,'hrx office'),(3,'gucci','paytm gucci',1,'gucci office'),(4,'Puma','paytm puma',1,'puma office'),(5,'Levis','paytm levis',1,'levis office');
/*!40000 ALTER TABLE `product_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_category_name_905278b8_uniq` (`name`),
  KEY `product_category_parent_id_f6860923_fk_product_category_id` (`parent_id`),
  CONSTRAINT `product_category_parent_id_f6860923_fk_product_category_id` FOREIGN KEY (`parent_id`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'T-shirts','Tshirt Category',1,1),(2,'Sleeves Tshirt','Half Tshirt',1,1),(3,'Round NecK T shirt','Round Neck',1,1),(4,'Sports Tshirt','Tshirt for sports',1,1),(5,'Polo Tshirt','Polo Tshirt',1,1),(6,'Men Tshirt','T shirt For men',1,1),(7,'Women Tshirt','T shirt For Women',1,1);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category_related_categories`
--

DROP TABLE IF EXISTS `product_category_related_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category_related_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_category_id` int(11) NOT NULL,
  `to_category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_category_related_categori_from_category_id_f4a0bca8_uniq` (`from_category_id`,`to_category_id`),
  KEY `product_category__to_category_id_04070cd9_fk_product_category_id` (`to_category_id`),
  CONSTRAINT `product_categor_from_category_id_e12bb2d1_fk_product_category_id` FOREIGN KEY (`from_category_id`) REFERENCES `product_category` (`id`),
  CONSTRAINT `product_category__to_category_id_04070cd9_fk_product_category_id` FOREIGN KEY (`to_category_id`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category_related_categories`
--

LOCK TABLES `product_category_related_categories` WRITE;
/*!40000 ALTER TABLE `product_category_related_categories` DISABLE KEYS */;
INSERT INTO `product_category_related_categories` VALUES (1,1,1),(13,1,2),(14,1,3),(15,1,4),(20,1,5),(22,1,6),(42,1,7),(16,2,1),(23,2,6),(24,2,7),(17,3,1),(35,3,6),(36,3,7),(18,4,1),(27,4,6),(28,4,7),(19,5,1),(31,5,6),(32,5,7),(21,6,1),(25,6,2),(37,6,3),(29,6,4),(33,6,5),(39,6,6),(40,7,1),(26,7,2),(38,7,3),(30,7,4),(34,7,5),(41,7,7);
/*!40000 ALTER TABLE `product_category_related_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_color`
--

DROP TABLE IF EXISTS `product_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_color`
--

LOCK TABLES `product_color` WRITE;
/*!40000 ALTER TABLE `product_color` DISABLE KEYS */;
INSERT INTO `product_color` VALUES (1,'White'),(2,'Black'),(3,'Green'),(4,'Blue'),(5,'Pink'),(6,'Yellow'),(7,'Maroon');
/*!40000 ALTER TABLE `product_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_product`
--

DROP TABLE IF EXISTS `product_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `paytmsyas` varchar(2000) NOT NULL,
  `date_added` date DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `sku_code` varchar(255),
  `brand_id` int(11) NOT NULL,
  `freesize` tinyint(1) NOT NULL,
  `guide` longtext NOT NULL,
  `newarrivals` tinyint(1) NOT NULL,
  `nonreturnable` tinyint(1) NOT NULL,
  `cost_price` decimal(14,6),
  `discount_price` decimal(14,6),
  `quantity` int(11) NOT NULL,
  `sell_price` decimal(14,6),
  PRIMARY KEY (`id`),
  KEY `product_product_2dbcba41` (`slug`),
  KEY `product_product_521b20f5` (`brand_id`),
  CONSTRAINT `product_product_brand_id_fcf1b3f3_fk_product_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `product_brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_product`
--

LOCK TABLES `product_product` WRITE;
/*!40000 ALTER TABLE `product_product` DISABLE KEYS */;
INSERT INTO `product_product` VALUES (1,'POLO  TSHIRTS','BR0790P05','POLO TSHIRTS','good product on market',NULL,1,'BR0790P05',1,0,'HANDLE WiTH CARE',1,0,450.000000,100.000000,20,699.000000),(2,'Round NecK T shirt','BR0790R05','Round Neck Tshirts','Fashionable Product',NULL,1,'BR0790R05',2,0,'Donot wash in Hot Water',1,0,599.000000,100.000000,30,799.000000),(3,'Sleeve T shirts','BR0790S05','Sleeves T shirts','Fashionable',NULL,1,'BR0790S05',3,0,'Dont Wash In Hot Water',1,0,799.000000,100.000000,10,1299.000000),(4,'Sports Tshirt','BR0790SR05','Sports T shirts','Trending Tshirts',NULL,1,'BR0790SR05',4,0,'Dont Wash in Hot Water',1,0,300.000000,100.000000,70,500.000000);
/*!40000 ALTER TABLE `product_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_product_category`
--

DROP TABLE IF EXISTS `product_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_product_category_product_id_5e811dc1_uniq` (`product_id`,`category_id`),
  KEY `product_product_cate_category_id_c14e57fb_fk_product_category_id` (`category_id`),
  CONSTRAINT `product_product_cate_category_id_c14e57fb_fk_product_category_id` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`),
  CONSTRAINT `product_product_catego_product_id_dd5b89f7_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_product_category`
--

LOCK TABLES `product_product_category` WRITE;
/*!40000 ALTER TABLE `product_product_category` DISABLE KEYS */;
INSERT INTO `product_product_category` VALUES (1,1,5),(2,2,1),(3,2,3),(4,2,6),(5,3,1),(6,3,2),(7,4,1),(8,4,4);
/*!40000 ALTER TABLE `product_product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_product_more_colors`
--

DROP TABLE IF EXISTS `product_product_more_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_product_more_colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_product_more_colors_product_id_6f87f404_uniq` (`product_id`,`color_id`),
  KEY `product_product_more_color_color_id_1de44773_fk_product_color_id` (`color_id`),
  CONSTRAINT `product_product_more_c_product_id_d21ef14a_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`),
  CONSTRAINT `product_product_more_color_color_id_1de44773_fk_product_color_id` FOREIGN KEY (`color_id`) REFERENCES `product_color` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_product_more_colors`
--

LOCK TABLES `product_product_more_colors` WRITE;
/*!40000 ALTER TABLE `product_product_more_colors` DISABLE KEYS */;
INSERT INTO `product_product_more_colors` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,1),(5,2,2),(6,2,3),(7,2,4),(8,2,5),(9,2,6),(10,2,7),(11,3,1),(12,3,2),(13,3,3),(14,3,4),(15,3,5),(16,3,6),(17,3,7),(18,4,1),(19,4,2),(20,4,3),(21,4,4),(22,4,5),(23,4,6),(24,4,7);
/*!40000 ALTER TABLE `product_product_more_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_product_more_sizes`
--

DROP TABLE IF EXISTS `product_product_more_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_product_more_sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_product_more_sizes_product_id_4e7a50f3_uniq` (`product_id`,`size_id`),
  KEY `product_product_more_sizes_size_id_7c1a6187_fk_product_size_id` (`size_id`),
  CONSTRAINT `product_product_more_s_product_id_77d73bc0_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`),
  CONSTRAINT `product_product_more_sizes_size_id_7c1a6187_fk_product_size_id` FOREIGN KEY (`size_id`) REFERENCES `product_size` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_product_more_sizes`
--

LOCK TABLES `product_product_more_sizes` WRITE;
/*!40000 ALTER TABLE `product_product_more_sizes` DISABLE KEYS */;
INSERT INTO `product_product_more_sizes` VALUES (1,1,2),(2,1,3),(3,1,4),(4,2,1),(5,2,2),(6,2,3),(7,2,4),(8,2,5),(9,2,6),(10,2,7),(11,3,1),(12,3,2),(13,3,3),(14,3,4),(15,3,5),(16,3,6),(17,3,7),(18,4,1),(19,4,2),(20,4,3),(21,4,4),(22,4,5),(23,4,6),(24,4,7);
/*!40000 ALTER TABLE `product_product_more_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_product_properties`
--

DROP TABLE IF EXISTS `product_product_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_product_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `properties_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_product_properties_product_id_8902841d_uniq` (`product_id`,`properties_id`),
  KEY `product_product__properties_id_9711b108_fk_product_properties_id` (`properties_id`),
  CONSTRAINT `product_product__properties_id_9711b108_fk_product_properties_id` FOREIGN KEY (`properties_id`) REFERENCES `product_properties` (`id`),
  CONSTRAINT `product_product_proper_product_id_473a374f_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_product_properties`
--

LOCK TABLES `product_product_properties` WRITE;
/*!40000 ALTER TABLE `product_product_properties` DISABLE KEYS */;
INSERT INTO `product_product_properties` VALUES (3,2,1),(4,2,5),(5,2,7),(2,2,8),(7,3,1),(8,3,6),(6,3,8),(9,4,1),(10,4,2),(11,4,3),(12,4,4),(13,4,5),(14,4,6),(15,4,7),(16,4,8);
/*!40000 ALTER TABLE `product_product_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_properties`
--

DROP TABLE IF EXISTS `product_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_properties`
--

LOCK TABLES `product_properties` WRITE;
/*!40000 ALTER TABLE `product_properties` DISABLE KEYS */;
INSERT INTO `product_properties` VALUES (1,'Fashion'),(2,'Fashion / FS'),(3,'Basic'),(4,'Basic / FS'),(5,'Cotton'),(6,'Fabric'),(7,'Printed'),(8,'Check');
/*!40000 ALTER TABLE `product_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_size`
--

DROP TABLE IF EXISTS `product_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_size`
--

LOCK TABLES `product_size` WRITE;
/*!40000 ALTER TABLE `product_size` DISABLE KEYS */;
INSERT INTO `product_size` VALUES (1,'XS'),(2,'S'),(3,'M'),(4,'L'),(5,'XL'),(6,'XXL'),(7,'Free Size');
/*!40000 ALTER TABLE `product_size` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-25 19:20:11
