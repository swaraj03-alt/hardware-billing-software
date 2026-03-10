-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hardware_billing_software
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `accounts_ledger`
--

DROP TABLE IF EXISTS `accounts_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_ledger` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account` varchar(100) DEFAULT NULL,
  `debit` decimal(10,2) DEFAULT NULL,
  `credit` decimal(10,2) DEFAULT NULL,
  `description` text,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_ledger`
--

LOCK TABLES `accounts_ledger` WRITE;
/*!40000 ALTER TABLE `accounts_ledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advance_booking_items`
--

DROP TABLE IF EXISTS `advance_booking_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advance_booking_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `qty` decimal(10,2) DEFAULT '0.00',
  `rate` decimal(10,2) DEFAULT '0.00',
  `total` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advance_booking_items`
--

LOCK TABLES `advance_booking_items` WRITE;
/*!40000 ALTER TABLE `advance_booking_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `advance_booking_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advance_bookings`
--

DROP TABLE IF EXISTS `advance_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advance_bookings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `advance_amount` decimal(10,2) DEFAULT '0.00',
  `locked_rate` decimal(10,2) DEFAULT '0.00',
  `delivery_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT 'ACTIVE',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `payment_mode` varchar(20) DEFAULT NULL,
  `upi_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advance_bookings`
--

LOCK TABLES `advance_bookings` WRITE;
/*!40000 ALTER TABLE `advance_bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `advance_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_items`
--

DROP TABLE IF EXISTS `bill_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bill_id` int DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `purchase_price` decimal(10,2) DEFAULT NULL,
  `hamali` decimal(10,2) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_bill_items_bill_id` (`bill_id`),
  CONSTRAINT `bill_items_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_items`
--

LOCK TABLES `bill_items` WRITE;
/*!40000 ALTER TABLE `bill_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(150) DEFAULT NULL,
  `customer_gst` varchar(15) DEFAULT NULL,
  `customer_mobile` varchar(15) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT NULL,
  `bhada_amount` decimal(10,2) DEFAULT '0.00',
  `paid_amount` decimal(12,2) DEFAULT '0.00',
  `balance_amount` decimal(12,2) DEFAULT '0.00',
  `payment_mode` varchar(20) DEFAULT NULL,
  `upi_transaction_id` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `bank_account_name` varchar(100) DEFAULT NULL,
  `is_gst_bill` tinyint(1) DEFAULT '0',
  `gst_number` varchar(15) DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT '0.00',
  `bill_type` varchar(10) DEFAULT 'Regular',
  `gst_rate` decimal(5,2) DEFAULT '0.00',
  `gst_amount` decimal(10,2) DEFAULT '0.00',
  `taxable_value` decimal(10,2) DEFAULT '0.00',
  `upi_account` varchar(50) DEFAULT NULL,
  `upi_id` varchar(100) DEFAULT NULL,
  `upi_staff_id` int DEFAULT NULL,
  `advance_id` int DEFAULT NULL,
  `buyer_gstin` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_bill_date` (`created_at`),
  KEY `idx_bill_created_at` (`created_at`),
  KEY `idx_customer_mobile` (`customer_mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chillar_entries`
--

DROP TABLE IF EXISTS `chillar_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chillar_entries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(120) DEFAULT NULL,
  `customer_mobile` varchar(20) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `type` enum('BIKRI','BAKI') DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('BAKI','PAID') DEFAULT 'BAKI',
  `received_at` datetime DEFAULT NULL,
  `payment_mode` varchar(20) DEFAULT NULL,
  `upi_account` varchar(20) DEFAULT NULL,
  `upi_staff_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chillar_entries`
--

LOCK TABLES `chillar_entries` WRITE;
/*!40000 ALTER TABLE `chillar_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `chillar_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chillar_items`
--

DROP TABLE IF EXISTS `chillar_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chillar_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `chillar_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `qty` decimal(10,2) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chillar_id` (`chillar_id`),
  CONSTRAINT `chillar_items_ibfk_1` FOREIGN KEY (`chillar_id`) REFERENCES `chillar_entries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chillar_items`
--

LOCK TABLES `chillar_items` WRITE;
/*!40000 ALTER TABLE `chillar_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `chillar_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_ledger`
--

DROP TABLE IF EXISTS `customer_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_ledger` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(150) DEFAULT NULL,
  `bill_id` int DEFAULT NULL,
  `debit` decimal(12,2) DEFAULT NULL,
  `credit` decimal(12,2) DEFAULT NULL,
  `balance` decimal(12,2) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_customer_ledger_bill` (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_ledger`
--

LOCK TABLES `customer_ledger` WRITE;
/*!40000 ALTER TABLE `customer_ledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text,
  `current_balance` decimal(10,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_closing`
--

DROP TABLE IF EXISTS `daily_closing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_closing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `closing_date` date DEFAULT NULL,
  `total_sale` decimal(12,2) DEFAULT NULL,
  `cash_collection` decimal(12,2) DEFAULT NULL,
  `upi_collection` decimal(12,2) DEFAULT NULL,
  `total_collection` decimal(12,2) DEFAULT NULL,
  `total_expenses` decimal(12,2) DEFAULT NULL,
  `cash_in_galla` decimal(12,2) DEFAULT NULL,
  `total_profit` decimal(12,2) DEFAULT NULL,
  `market_pending` decimal(12,2) DEFAULT NULL,
  `closed_by` int DEFAULT NULL,
  `closed_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `closing_date` (`closing_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_closing`
--

LOCK TABLES `daily_closing` WRITE;
/*!40000 ALTER TABLE `daily_closing` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_closing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estimate_items`
--

DROP TABLE IF EXISTS `estimate_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estimate_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estimate_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estimate_items`
--

LOCK TABLES `estimate_items` WRITE;
/*!40000 ALTER TABLE `estimate_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `estimate_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estimates`
--

DROP TABLE IF EXISTS `estimates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estimates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(150) DEFAULT NULL,
  `customer_mobile` varchar(20) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estimates`
--

LOCK TABLES `estimates` WRITE;
/*!40000 ALTER TABLE `estimates` DISABLE KEYS */;
/*!40000 ALTER TABLE `estimates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `category` varchar(50) DEFAULT NULL,
  `payment_method` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_expense_date` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gst_inventory`
--

DROP TABLE IF EXISTS `gst_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gst_inventory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `purchase_price` decimal(10,2) DEFAULT NULL,
  `selling_price` decimal(10,2) DEFAULT NULL,
  `gst_rate` decimal(5,2) DEFAULT NULL,
  `stock_quantity` decimal(10,2) DEFAULT NULL,
  `min_stock_level` decimal(10,2) DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_gst_inventory_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gst_inventory`
--

LOCK TABLES `gst_inventory` WRITE;
/*!40000 ALTER TABLE `gst_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `gst_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gst_purchases`
--

DROP TABLE IF EXISTS `gst_purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gst_purchases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(150) DEFAULT NULL,
  `invoice_no` varchar(100) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `gst_amount` decimal(10,2) DEFAULT NULL,
  `gst_type` enum('CGST_SGST','IGST') DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `cgst` decimal(10,2) DEFAULT '0.00',
  `sgst` decimal(10,2) DEFAULT '0.00',
  `igst` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gst_purchases`
--

LOCK TABLES `gst_purchases` WRITE;
/*!40000 ALTER TABLE `gst_purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `gst_purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gst_sale_items`
--

DROP TABLE IF EXISTS `gst_sale_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gst_sale_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sale_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `gst_rate` decimal(5,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gst_sale_items`
--

LOCK TABLES `gst_sale_items` WRITE;
/*!40000 ALTER TABLE `gst_sale_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `gst_sale_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gst_sales`
--

DROP TABLE IF EXISTS `gst_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gst_sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(150) DEFAULT NULL,
  `gst_no` varchar(50) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `gst_amount` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gst_sales`
--

LOCK TABLES `gst_sales` WRITE;
/*!40000 ALTER TABLE `gst_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `gst_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hamal_accounts`
--

DROP TABLE IF EXISTS `hamal_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hamal_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hamal_id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT '0.00',
  `credit_amount` decimal(10,2) DEFAULT '0.00',
  `debit_amount` decimal(10,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `hamal_id` (`hamal_id`),
  CONSTRAINT `hamal_accounts_ibfk_1` FOREIGN KEY (`hamal_id`) REFERENCES `hamals` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hamal_accounts`
--

LOCK TABLES `hamal_accounts` WRITE;
/*!40000 ALTER TABLE `hamal_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `hamal_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hamal_ledger`
--

DROP TABLE IF EXISTS `hamal_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hamal_ledger` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hamal_id` int DEFAULT NULL,
  `bill_id` int DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `credit_amount` decimal(10,2) DEFAULT '0.00',
  `debit_amount` decimal(10,2) DEFAULT '0.00',
  `balance_amount` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `hamal_id` (`hamal_id`),
  CONSTRAINT `hamal_ledger_ibfk_1` FOREIGN KEY (`hamal_id`) REFERENCES `hamals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hamal_ledger`
--

LOCK TABLES `hamal_ledger` WRITE;
/*!40000 ALTER TABLE `hamal_ledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `hamal_ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hamals`
--

DROP TABLE IF EXISTS `hamals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hamals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `total_due` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hamals`
--

LOCK TABLES `hamals` WRITE;
/*!40000 ALTER TABLE `hamals` DISABLE KEYS */;
INSERT INTO `hamals` VALUES (15,'Gajni','9156441461',0.00),(16,'Aejaz Bhai','9156441461',0.00),(17,'Bannu Bhai','9156441461',0.00);
/*!40000 ALTER TABLE `hamals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `purchase_price` decimal(10,2) NOT NULL,
  `profit_margin` decimal(5,2) DEFAULT '0.00',
  `selling_price` decimal(10,2) NOT NULL,
  `stock_quantity` decimal(10,2) DEFAULT '0.00',
  `min_stock_level` decimal(10,2) DEFAULT '5.00',
  `rate_updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `unit` varchar(20) DEFAULT NULL,
  `stock_type` enum('REGULAR','GST') DEFAULT 'REGULAR',
  `supplier_id` int DEFAULT NULL,
  `is_active` tinyint DEFAULT '1',
  `gst_rate` decimal(5,2) DEFAULT NULL,
  `taxable_value` decimal(12,2) DEFAULT '0.00',
  `cgst` decimal(12,2) DEFAULT '0.00',
  `sgst` decimal(12,2) DEFAULT '0.00',
  `total_amount` decimal(12,2) DEFAULT '0.00',
  `purchase_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_inventory_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `payments_view`
--

DROP TABLE IF EXISTS `payments_view`;
/*!50001 DROP VIEW IF EXISTS `payments_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `payments_view` AS SELECT 
 1 AS `bill_id`,
 1 AS `customer_name`,
 1 AS `amount`,
 1 AS `payment_mode`,
 1 AS `created_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `purchase_bills`
--

DROP TABLE IF EXISTS `purchase_bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_bills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int DEFAULT NULL,
  `bill_no` varchar(100) DEFAULT NULL,
  `bill_date` date DEFAULT NULL,
  `gst_no` varchar(30) DEFAULT NULL,
  `taxable_value` decimal(12,2) DEFAULT NULL,
  `cgst` decimal(12,2) DEFAULT NULL,
  `sgst` decimal(12,2) DEFAULT NULL,
  `igst` decimal(12,2) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_bills`
--

LOCK TABLES `purchase_bills` WRITE;
/*!40000 ALTER TABLE `purchase_bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_items`
--

DROP TABLE IF EXISTS `purchase_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bill_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `qty` decimal(10,2) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_items`
--

LOCK TABLES `purchase_items` WRITE;
/*!40000 ALTER TABLE `purchase_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate_edit_log`
--

DROP TABLE IF EXISTS `rate_edit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rate_edit_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `old_price` decimal(10,2) DEFAULT NULL,
  `new_price` decimal(10,2) DEFAULT NULL,
  `edited_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `changed_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate_edit_log`
--

LOCK TABLES `rate_edit_log` WRITE;
/*!40000 ALTER TABLE `rate_edit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `rate_edit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate_history`
--

DROP TABLE IF EXISTS `rate_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rate_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `old_purchase_price` decimal(10,2) DEFAULT NULL,
  `old_selling_price` decimal(10,2) DEFAULT NULL,
  `new_purchase_price` decimal(10,2) DEFAULT NULL,
  `new_selling_price` decimal(10,2) DEFAULT NULL,
  `changed_by` int DEFAULT NULL,
  `changed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `changed_by` (`changed_by`),
  CONSTRAINT `rate_history_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `inventory` (`id`),
  CONSTRAINT `rate_history_ibfk_2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate_history`
--

LOCK TABLES `rate_history` WRITE;
/*!40000 ALTER TABLE `rate_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `rate_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_advances`
--

DROP TABLE IF EXISTS `staff_advances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_advances` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `reason` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Pending','Deducted') DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `staff_advances_ibfk_1` (`user_id`),
  CONSTRAINT `staff_advances_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_advances`
--

LOCK TABLES `staff_advances` WRITE;
/*!40000 ALTER TABLE `staff_advances` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_advances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_payouts`
--

DROP TABLE IF EXISTS `staff_payouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_payouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `month_year` varchar(20) DEFAULT NULL,
  `base_salary` decimal(10,2) DEFAULT NULL,
  `advance_deducted` decimal(10,2) DEFAULT '0.00',
  `net_paid` decimal(10,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payout_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `deductions` decimal(10,2) DEFAULT '0.00',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `payment_mode` varchar(20) DEFAULT 'Cash',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `staff_payouts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_payouts`
--

LOCK TABLES `staff_payouts` WRITE;
/*!40000 ALTER TABLE `staff_payouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_payouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_ledger`
--

DROP TABLE IF EXISTS `supplier_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_ledger` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int DEFAULT NULL,
  `bill_no` varchar(50) DEFAULT NULL,
  `credit_amount` decimal(10,2) DEFAULT NULL,
  `balance_amount` decimal(10,2) DEFAULT NULL,
  `transaction_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `debit_amount` decimal(12,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `supplier_ledger_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_ledger`
--

LOCK TABLES `supplier_ledger` WRITE;
/*!40000 ALTER TABLE `supplier_ledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_payments`
--

DROP TABLE IF EXISTS `supplier_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `staff_name` varchar(100) DEFAULT NULL,
  `notes` text,
  `payment_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `idx_supplier_payment_date` (`payment_date`),
  CONSTRAINT `supplier_payments_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_payments`
--

LOCK TABLES `supplier_payments` WRITE;
/*!40000 ALTER TABLE `supplier_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `address` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `opening_balance` decimal(10,2) DEFAULT '0.00',
  `status` varchar(20) DEFAULT 'active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (36,'kamlesh steel nagpur ',NULL,NULL,'2026-03-09 08:57:42',0.00,'active'),(37,'RK STEEL',NULL,NULL,'2026-03-09 20:15:55',0.00,'active');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('owner','staff','accountant') DEFAULT 'staff',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '1',
  `upi_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'Owner','owner','+91 70200 05481','scrypt:32768:8:1$Q4JpaNTSJ4RvbdEK$cb43360fd20fe3aac1155b9b46f19042cf8780b600d98055259991dce2a743c7b9268e00da02d5c3fb23d23bd274c261a7a127f81ea239eae23f187a7d8f983a','owner','2026-02-17 11:03:55',1,'imranmohd06443@oksbi'),(7,'Tanveer ahmad','Tanveer','+91 70200 05481','scrypt:32768:8:1$pwKhTjOMUx3MmkuQ$de3990cc26a3c210b60ed990ed4b8301d1ae9e55642feba16b356f25eaf3033872ef1015bc96d020d017ad5ea02e9e6923bf1b9eb4357f142e9ec933fe7ffa32','staff','2026-03-05 09:17:48',1,NULL),(8,'Zakir chacha','Zakir','+91 70200 05481','scrypt:32768:8:1$E3x4bEfdLUYXiymR$2e1b15eddfbd8c358747eeca96419248c60d249d8686672ccf953d6e487a71049ff2ad882dc781adc8c09b7b6930638a8fbf9a4cd41e0f72dc679b670abea2bb','staff','2026-03-05 09:19:10',1,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets`
--

LOCK TABLES `wallets` WRITE;
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `payments_view`
--

/*!50001 DROP VIEW IF EXISTS `payments_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `payments_view` AS select `bills`.`id` AS `bill_id`,`bills`.`customer_name` AS `customer_name`,`bills`.`paid_amount` AS `amount`,`bills`.`payment_mode` AS `payment_mode`,`bills`.`created_at` AS `created_at` from `bills` where (`bills`.`status` <> 'ESTIMATE') union all select NULL AS `bill_id`,`chillar_entries`.`customer_name` AS `customer_name`,`chillar_entries`.`amount` AS `amount`,`chillar_entries`.`payment_mode` AS `payment_mode`,`chillar_entries`.`created_at` AS `created_at` from `chillar_entries` where (`chillar_entries`.`type` in ('BIKRI','RECEIPT')) */;
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

-- Dump completed on 2026-03-10  2:51:32
