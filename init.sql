/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.9-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: mere
-- ------------------------------------------------------
-- Server version	11.6.2-MariaDB-ubu2404

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
-- Table structure for table `Assignations`
--

DROP TABLE IF EXISTS `Assignations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Assignations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `livreur_id` int(11) NOT NULL,
  `entreprise_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `livreur_id` (`livreur_id`),
  KEY `entreprise_id` (`entreprise_id`),
  CONSTRAINT `Assignations_ibfk_1` FOREIGN KEY (`livreur_id`) REFERENCES `Livreurs` (`id`),
  CONSTRAINT `Assignations_ibfk_2` FOREIGN KEY (`entreprise_id`) REFERENCES `Entreprises` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assignations`
--

LOCK TABLES `Assignations` WRITE;
/*!40000 ALTER TABLE `Assignations` DISABLE KEYS */;
INSERT INTO `Assignations` VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,6),
(7,7,7),
(8,8,8),
(9,9,9),
(10,10,10);
/*!40000 ALTER TABLE `Assignations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entreprises`
--

DROP TABLE IF EXISTS `Entreprises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Entreprises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entreprises`
--

LOCK TABLES `Entreprises` WRITE;
/*!40000 ALTER TABLE `Entreprises` DISABLE KEYS */;
INSERT INTO `Entreprises` VALUES
(1,'Entreprise1','Adresse1'),
(2,'Entreprise2','Adresse2'),
(3,'Entreprise3','Adresse3'),
(4,'Entreprise4','Adresse4'),
(5,'Entreprise5','Adresse5'),
(6,'Entreprise6','Adresse6'),
(7,'Entreprise7','Adresse7'),
(8,'Entreprise8','Adresse8'),
(9,'Entreprise9','Adresse9'),
(10,'Entreprise10','Adresse10'),
(11,'Entreprise1','Adresse1'),
(12,'Entreprise2','Adresse2'),
(13,'Entreprise3','Adresse3'),
(14,'Entreprise4','Adresse4'),
(15,'Entreprise5','Adresse5'),
(16,'Entreprise6','Adresse6'),
(17,'Entreprise7','Adresse7'),
(18,'Entreprise8','Adresse8'),
(19,'Entreprise9','Adresse9'),
(20,'Entreprise10','Adresse10');
/*!40000 ALTER TABLE `Entreprises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Livraisons`
--

DROP TABLE IF EXISTS `Livraisons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Livraisons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `panier_id` int(11) NOT NULL,
  `livreur_id` int(11) NOT NULL,
  `date_livraison` date NOT NULL,
  `statut` varchar(255) DEFAULT 'En attente',
  `commentaire` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `panier_id` (`panier_id`),
  KEY `livreur_id` (`livreur_id`),
  CONSTRAINT `Livraisons_ibfk_1` FOREIGN KEY (`panier_id`) REFERENCES `Paniers` (`id`),
  CONSTRAINT `Livraisons_ibfk_2` FOREIGN KEY (`livreur_id`) REFERENCES `Livreurs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Livraisons`
--

LOCK TABLES `Livraisons` WRITE;
/*!40000 ALTER TABLE `Livraisons` DISABLE KEYS */;
INSERT INTO `Livraisons` VALUES
(11,1,1,'2025-01-15','En attente','Commentaire1'),
(12,2,2,'2025-01-16','Livré','Commentaire2'),
(13,3,3,'2025-01-17','En attente','Commentaire3'),
(14,4,4,'2025-01-18','En attente','Commentaire4'),
(15,5,5,'2025-01-19','Livré','Commentaire5'),
(16,6,6,'2025-01-20','En attente','Commentaire6'),
(17,7,7,'2025-01-21','Livré','Commentaire7'),
(18,8,8,'2025-01-22','En attente','Commentaire8'),
(19,9,9,'2025-01-23','Livré','Commentaire9'),
(20,10,10,'2025-01-24','En attente','Commentaire10');
/*!40000 ALTER TABLE `Livraisons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Livreurs`
--

DROP TABLE IF EXISTS `Livreurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Livreurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Livreurs`
--

LOCK TABLES `Livreurs` WRITE;
/*!40000 ALTER TABLE `Livreurs` DISABLE KEYS */;
INSERT INTO `Livreurs` VALUES
(1,'livreur1@mail.com','password1','Nom1','Prenom1','0601010101'),
(2,'livreur2@mail.com','password2','Nom2','Prenom2','0602020202'),
(3,'livreur3@mail.com','password3','Nom3','Prenom3','0603030303'),
(4,'livreur4@mail.com','password4','Nom4','Prenom4','0604040404'),
(5,'livreur5@mail.com','password5','Nom5','Prenom5','0605050505'),
(6,'livreur6@mail.com','password6','Nom6','Prenom6','0606060606'),
(7,'livreur7@mail.com','password7','Nom7','Prenom7','0607070707'),
(8,'livreur8@mail.com','password8','Nom8','Prenom8','0608080808'),
(9,'livreur9@mail.com','password9','Nom9','Prenom9','0609090909'),
(10,'livreur10@mail.com','password10','Nom10','Prenom10','0610101010');
/*!40000 ALTER TABLE `Livreurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Panier_Produits`
--

DROP TABLE IF EXISTS `Panier_Produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Panier_Produits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `panier_id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `statut` varchar(255) DEFAULT 'En stock',
  PRIMARY KEY (`id`),
  KEY `panier_id` (`panier_id`),
  KEY `produit_id` (`produit_id`),
  CONSTRAINT `Panier_Produits_ibfk_1` FOREIGN KEY (`panier_id`) REFERENCES `Paniers` (`id`),
  CONSTRAINT `Panier_Produits_ibfk_2` FOREIGN KEY (`produit_id`) REFERENCES `Produits` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Panier_Produits`
--

LOCK TABLES `Panier_Produits` WRITE;
/*!40000 ALTER TABLE `Panier_Produits` DISABLE KEYS */;
INSERT INTO `Panier_Produits` VALUES
(1,1,1,5,'En stock'),
(2,2,2,10,'En stock'),
(3,3,3,2,'En stock'),
(4,4,4,8,'En stock'),
(5,5,5,15,'En stock'),
(6,6,6,7,'En stock'),
(7,7,7,4,'En stock'),
(8,8,8,9,'En stock'),
(9,9,9,6,'En stock'),
(10,10,10,3,'En stock');
/*!40000 ALTER TABLE `Panier_Produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paniers`
--

DROP TABLE IF EXISTS `Paniers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Paniers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entreprise_id` int(11) NOT NULL,
  `date_creation` date NOT NULL,
  `montant_total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entreprise_id` (`entreprise_id`),
  CONSTRAINT `Paniers_ibfk_1` FOREIGN KEY (`entreprise_id`) REFERENCES `Entreprises` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paniers`
--

LOCK TABLES `Paniers` WRITE;
/*!40000 ALTER TABLE `Paniers` DISABLE KEYS */;
INSERT INTO `Paniers` VALUES
(1,1,'2025-01-01',100.50),
(2,2,'2025-01-02',200.75),
(3,3,'2025-01-03',150.25),
(4,4,'2025-01-04',175.60),
(5,5,'2025-01-05',80.20),
(6,6,'2025-01-06',120.30),
(7,7,'2025-01-07',99.99),
(8,8,'2025-01-08',50.50),
(9,9,'2025-01-09',140.00),
(10,10,'2025-01-10',300.80);
/*!40000 ALTER TABLE `Paniers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Produits`
--

DROP TABLE IF EXISTS `Produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Produits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produits`
--

LOCK TABLES `Produits` WRITE;
/*!40000 ALTER TABLE `Produits` DISABLE KEYS */;
INSERT INTO `Produits` VALUES
(1,'Produit1'),
(2,'Produit2'),
(3,'Produit3'),
(4,'Produit4'),
(5,'Produit5'),
(6,'Produit6'),
(7,'Produit7'),
(8,'Produit8'),
(9,'Produit9'),
(10,'Produit10');
/*!40000 ALTER TABLE `Produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'0001_01_01_000000_create_users_table',1),
(2,'0001_01_01_000001_create_cache_table',1),
(3,'0001_01_01_000002_create_jobs_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES
('6fump4rkjnacIDfazB7cQrOYWhrNi4hr5LbX15sm',1,'172.24.0.1','Mozilla/5.0 (X11; Linux x86_64; rv:132.0) Gecko/20100101 Firefox/132.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZ0N6enpiOGlNc1V1M0NvYlg5eUNGSUtIb1VrbXFhSE93c1EzcklDWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwNS9kYXNoYm9hcmQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=',1737129760);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Jessim','jessgh69@gmail.com',NULL,'$2y$12$y/za.4kK5qQTBru57INGa.yQo0PBApixbOIoFLSJz5gennGn7yU92',NULL,'2025-01-17 14:44:47','2025-01-17 14:44:47');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mere'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-22 13:29:11
