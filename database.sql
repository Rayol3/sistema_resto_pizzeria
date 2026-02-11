-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: food_sale
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `arching_cashes`
--

DROP TABLE IF EXISTS `arching_cashes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arching_cashes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idcaja` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `monto_inicial` decimal(10,2) NOT NULL,
  `monto_final` decimal(10,2) DEFAULT NULL,
  `total_ventas` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arching_cashes`
--

LOCK TABLES `arching_cashes` WRITE;
/*!40000 ALTER TABLE `arching_cashes` DISABLE KEYS */;
INSERT INTO `arching_cashes` VALUES (1,1,1,'2026-02-10','2026-02-10',100.00,100.00,200,1,'2026-02-11 04:01:16','2026-02-11 04:01:16');
/*!40000 ALTER TABLE `arching_cashes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billings`
--

DROP TABLE IF EXISTS `billings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idtipo_comprobante` int(11) NOT NULL,
  `serie` varchar(255) NOT NULL,
  `correlativo` varchar(255) NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `hora` time NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idmoneda` int(11) NOT NULL,
  `idpago` int(11) NOT NULL,
  `modo_pago` int(11) NOT NULL,
  `exonerada` decimal(18,2) NOT NULL,
  `inafecta` decimal(18,2) NOT NULL,
  `gravada` decimal(18,2) NOT NULL,
  `anticipo` decimal(18,2) NOT NULL,
  `igv` decimal(18,2) NOT NULL,
  `gratuita` decimal(18,2) NOT NULL,
  `otros_cargos` decimal(18,2) NOT NULL,
  `total` decimal(18,2) NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `cdr` int(11) DEFAULT NULL,
  `anulado` int(11) DEFAULT NULL,
  `id_tipo_nota_credito` int(11) DEFAULT NULL,
  `idfactura_anular` int(11) DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `estado_cpe` int(11) DEFAULT NULL,
  `errores` blob DEFAULT NULL,
  `nticket` varchar(255) DEFAULT NULL,
  `idusuario` int(11) NOT NULL,
  `idcaja` int(11) NOT NULL,
  `vuelto` decimal(18,2) DEFAULT NULL,
  `qr` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billings`
--

LOCK TABLES `billings` WRITE;
/*!40000 ALTER TABLE `billings` DISABLE KEYS */;
/*!40000 ALTER TABLE `billings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bills` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fecha_emision` date NOT NULL,
  `idpurchase_description` int(11) NOT NULL,
  `cuenta` varchar(255) NOT NULL DEFAULT 'Cuenta General',
  `monto` decimal(18,2) NOT NULL,
  `detalle` varchar(255) DEFAULT NULL,
  `idusuario` int(11) NOT NULL,
  `idcaja` int(11) NOT NULL,
  `idarqueocaja` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `businesses`
--

DROP TABLE IF EXISTS `businesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businesses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ruc` varchar(255) DEFAULT NULL,
  `razon_social` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `codigo_pais` varchar(255) DEFAULT NULL,
  `ubigeo` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `url_api` varchar(255) DEFAULT NULL,
  `email_accounting` varchar(255) DEFAULT NULL,
  `urbanizacion` varchar(255) DEFAULT NULL,
  `local` varchar(255) DEFAULT NULL,
  `nombre_comercial` varchar(255) DEFAULT NULL,
  `usuario_sunat` varchar(255) DEFAULT NULL,
  `clave_sunat` varchar(255) DEFAULT NULL,
  `clave_certificado` varchar(255) DEFAULT NULL,
  `certificado` varchar(255) DEFAULT NULL,
  `servidor_sunat` varchar(255) DEFAULT NULL,
  `pago` varchar(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `businesses`
--

LOCK TABLES `businesses` WRITE;
/*!40000 ALTER TABLE `businesses` DISABLE KEYS */;
INSERT INTO `businesses` VALUES (1,'20610316884','PIZZERIA ADRIANA','Av. Nuñez 113','PE','220501','083-000000','','','','','PIZZERIA ADRIANA','','','','','3','1','2026-02-11 04:01:16','2026-02-11 04:01:16');
/*!40000 ALTER TABLE `businesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buys`
--

DROP TABLE IF EXISTS `buys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buys` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idtipo_comprobante` int(11) NOT NULL,
  `serie` varchar(255) NOT NULL,
  `correlativo` varchar(255) NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `hora` time NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `idmoneda` int(11) NOT NULL,
  `idpago` int(11) NOT NULL,
  `modo_pago` int(11) NOT NULL,
  `exonerada` decimal(18,2) NOT NULL,
  `inafecta` decimal(18,2) NOT NULL,
  `gravada` decimal(18,2) NOT NULL,
  `anticipo` decimal(18,2) NOT NULL,
  `igv` decimal(18,2) NOT NULL,
  `gratuita` decimal(18,2) NOT NULL,
  `otros_cargos` decimal(18,2) NOT NULL,
  `total` decimal(18,2) NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `idusuario` int(11) NOT NULL,
  `idcaja` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buys`
--

LOCK TABLES `buys` WRITE;
/*!40000 ALTER TABLE `buys` DISABLE KEYS */;
/*!40000 ALTER TABLE `buys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashes`
--

DROP TABLE IF EXISTS `cashes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashes`
--

LOCK TABLES `cashes` WRITE;
/*!40000 ALTER TABLE `cashes` DISABLE KEYS */;
INSERT INTO `cashes` VALUES (1,'CAJA 1','2026-02-11 04:01:16','2026-02-11 04:01:16');
/*!40000 ALTER TABLE `cashes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'PIZZAS','2026-02-11 04:01:16','2026-02-11 04:01:16'),(2,'HAMBURGUESAS','2026-02-11 04:01:16','2026-02-11 04:01:16'),(3,'BATIDOS','2026-02-11 04:01:16','2026-02-11 04:01:16'),(4,'BEBIDAS','2026-02-11 04:01:16','2026-02-11 04:01:16'),(5,'POLLOS','2026-02-11 04:01:16','2026-02-11 04:01:16');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `iddoc` int(11) NOT NULL,
  `dni_ruc` varchar(15) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `codigo_pais` varchar(2) NOT NULL,
  `ubigeo` varchar(6) NOT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,1,'00000000','CLIENTES VARIOS','-','PE','220901','','2026-02-11 04:01:16','2026-02-11 04:01:16');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `comentario` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'2026-02-10','EXCELENTE COMIDA, MUY RIQUISIMA','2026-02-11 04:01:16','2026-02-11 04:01:16'),(2,'2026-02-09','ME ENCANTAN SUS ALITAS A LA BBQ!!!','2026-02-11 04:01:16','2026-02-11 04:01:16'),(3,'2026-02-08','LA COMIDA ES BUENISIMA, LO RECOMIENDO MUCHISIMO','2026-02-11 04:01:16','2026-02-11 04:01:16'),(4,'2026-02-07','LOS VISITO CADA FIN DE SEMANA, BENDICIONES','2026-02-11 04:01:16','2026-02-11 04:01:16');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `prefijo` varchar(6) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `codigo_telefono` varchar(255) NOT NULL,
  `estado` int(11) NOT NULL,
  `signo` varchar(255) NOT NULL,
  `moneda` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'AR','ARGENTINA','+54',1,'$','PESOS','2026-02-11 04:01:11','2026-02-11 04:01:11'),(2,'CH','CHILE','+56',1,'$','PESOS','2026-02-11 04:01:11','2026-02-11 04:01:11'),(3,'COL','COLOMBIA','+57',1,'$','PESOS','2026-02-11 04:01:11','2026-02-11 04:01:11'),(4,'PE','PERU','+51',1,'S/','SOLES','2026-02-11 04:01:11','2026-02-11 04:01:11'),(5,'VEN','VENEZUELA','+58',1,'BS','BOLIVARES','2026-02-11 04:01:11','2026-02-11 04:01:11'),(6,'BOL','BOLIVIA','+591',1,'$b','PESOS','2026-02-11 04:01:11','2026-02-11 04:01:11'),(7,'MEX','MEXICO','+52',1,'$','MX','2026-02-11 04:01:11','2026-02-11 04:01:11'),(8,'PAR','PARAGUAY','+595',1,'₲','GUARANIES','2026-02-11 04:01:11','2026-02-11 04:01:11'),(9,'RD','REPUBLICA DOMINICANA','+1-809',1,'RD$','PESOS','2026-02-11 04:01:11','2026-02-11 04:01:11'),(10,'CU','CUBA','+53',1,'$','PESOS','2026-02-11 04:01:11','2026-02-11 04:01:11'),(11,'GT','GUATEMALA','+502',1,'Q','QUETZALES','2026-02-11 04:01:11','2026-02-11 04:01:11');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_note_types`
--

DROP TABLE IF EXISTS `credit_note_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_note_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(2) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `estado` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_note_types`
--

LOCK TABLES `credit_note_types` WRITE;
/*!40000 ALTER TABLE `credit_note_types` DISABLE KEYS */;
INSERT INTO `credit_note_types` VALUES (1,'01','ANULACIÓN DE LA OPERACIÓN',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(2,'02','ANULACIÓN POR ERROR EN EL RUC',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(3,'03','CORRECCIÓN POR ERROR EN LA DESCRIPCIÓN',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(4,'04','DESCUENTO GLOBAL',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(5,'05','DESCUENTO POR ÍTEM',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(6,'06','DEVOLUCIÓN TOTAL',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(7,'07','DEVOLUCIÓN POR ÍTEM',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(8,'08','BONIFICACIÓN',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(9,'09','DISMINUCIÓN EN EL VALOR',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(10,'10','OTROS CONCEPTOS',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(11,'11','AJUSTES DE OPERACIONES DE EXPORTACIÓN',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(12,'12','AJUSTES AFECTOS AL IVAP',1,'2026-02-11 04:01:11','2026-02-11 04:01:11');
/*!40000 ALTER TABLE `credit_note_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(3) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `pais` varchar(255) NOT NULL,
  `simbolo` varchar(3) NOT NULL,
  `estado` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'PEN','NUEVO SOL','PERÚ','S/',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(2,'USD','US DOLLAR','ESTADOS UNIDOS (EEUU)','$',1,'2026-02-11 04:01:11','2026-02-11 04:01:11');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debit_note_types`
--

DROP TABLE IF EXISTS `debit_note_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `debit_note_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(2) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `estado` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debit_note_types`
--

LOCK TABLES `debit_note_types` WRITE;
/*!40000 ALTER TABLE `debit_note_types` DISABLE KEYS */;
INSERT INTO `debit_note_types` VALUES (1,'01','INTERESES POR MORA',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(2,'02','AUMENTO EN EL VALOR',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(3,'03','PENALIDADES/ OTROS CONCEPTOS',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(4,'11','AJUSTES DE OPERACIONES DE EXPORTACIÓN',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(5,'12','AJUSTES AFECTOS AL IVAP',1,'2026-02-11 04:01:11','2026-02-11 04:01:11');
/*!40000 ALTER TABLE `debit_note_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'01','Amazonas','2026-02-11 04:01:11','2026-02-11 04:01:11'),(2,'02','Áncash','2026-02-11 04:01:11','2026-02-11 04:01:11'),(3,'03','Apurímac','2026-02-11 04:01:11','2026-02-11 04:01:11'),(4,'04','Arequipa','2026-02-11 04:01:11','2026-02-11 04:01:11'),(5,'05','Ayacucho','2026-02-11 04:01:11','2026-02-11 04:01:11'),(6,'06','Cajamarca','2026-02-11 04:01:11','2026-02-11 04:01:11'),(7,'07','Callao','2026-02-11 04:01:11','2026-02-11 04:01:11'),(8,'08','Cusco','2026-02-11 04:01:11','2026-02-11 04:01:11'),(9,'09','Huancavelica','2026-02-11 04:01:11','2026-02-11 04:01:11'),(10,'10','Huánuco','2026-02-11 04:01:11','2026-02-11 04:01:11'),(11,'11','Ica','2026-02-11 04:01:11','2026-02-11 04:01:11'),(12,'12','Junín','2026-02-11 04:01:11','2026-02-11 04:01:11'),(13,'13','La Libertad','2026-02-11 04:01:11','2026-02-11 04:01:11'),(14,'14','Lambayeque','2026-02-11 04:01:11','2026-02-11 04:01:11'),(15,'15','Lima','2026-02-11 04:01:11','2026-02-11 04:01:11'),(16,'16','Loreto','2026-02-11 04:01:11','2026-02-11 04:01:11'),(17,'17','Madre de Dios','2026-02-11 04:01:11','2026-02-11 04:01:11'),(18,'18','Moquegua','2026-02-11 04:01:11','2026-02-11 04:01:11'),(19,'19','Pasco','2026-02-11 04:01:11','2026-02-11 04:01:11'),(20,'20','Piura','2026-02-11 04:01:11','2026-02-11 04:01:11'),(21,'21','Puno','2026-02-11 04:01:11','2026-02-11 04:01:11'),(22,'22','San Martin','2026-02-11 04:01:11','2026-02-11 04:01:11'),(23,'23','Tacna','2026-02-11 04:01:11','2026-02-11 04:01:11'),(24,'24','Tumbes','2026-02-11 04:01:11','2026-02-11 04:01:11'),(25,'25','Ucayali','2026-02-11 04:01:11','2026-02-11 04:01:11');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_billings`
--

DROP TABLE IF EXISTS `detail_billings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_billings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idfacturacion` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` decimal(18,2) NOT NULL,
  `descuento` decimal(18,2) NOT NULL,
  `igv` decimal(18,2) NOT NULL,
  `id_afectacion_igv` int(11) NOT NULL,
  `precio_unitario` decimal(18,2) NOT NULL,
  `precio_total` decimal(18,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_billings`
--

LOCK TABLES `detail_billings` WRITE;
/*!40000 ALTER TABLE `detail_billings` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_billings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_buys`
--

DROP TABLE IF EXISTS `detail_buys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_buys` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idcompra` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` decimal(18,2) NOT NULL,
  `descuento` decimal(18,2) NOT NULL,
  `igv` decimal(18,2) NOT NULL,
  `id_afectacion_igv` int(11) NOT NULL,
  `precio_unitario` decimal(18,2) NOT NULL,
  `precio_total` decimal(18,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_buys`
--

LOCK TABLES `detail_buys` WRITE;
/*!40000 ALTER TABLE `detail_buys` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_buys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_orders`
--

DROP TABLE IF EXISTS `detail_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idorden` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` decimal(18,2) NOT NULL,
  `descuento` decimal(18,2) NOT NULL,
  `igv` decimal(18,2) NOT NULL,
  `id_afectacion_igv` int(11) NOT NULL,
  `precio_unitario` decimal(18,2) NOT NULL,
  `precio_total` decimal(18,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_orders`
--

LOCK TABLES `detail_orders` WRITE;
/*!40000 ALTER TABLE `detail_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_payments`
--

DROP TABLE IF EXISTS `detail_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idtipo_comprobante` int(11) NOT NULL,
  `idfactura` int(11) NOT NULL,
  `idpago` int(11) NOT NULL,
  `monto` decimal(16,2) DEFAULT NULL,
  `idcaja` int(11) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_payments`
--

LOCK TABLES `detail_payments` WRITE;
/*!40000 ALTER TABLE `detail_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_publicities`
--

DROP TABLE IF EXISTS `detail_publicities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_publicities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `imagen` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_publicities`
--

LOCK TABLES `detail_publicities` WRITE;
/*!40000 ALTER TABLE `detail_publicities` DISABLE KEYS */;
INSERT INTO `detail_publicities` VALUES (1,'publicity-1.jpg','2026-02-11 04:01:16','2026-02-11 04:01:16'),(2,'publicity-2.png','2026-02-11 04:01:16','2026-02-11 04:01:16'),(3,'publicity-3.png','2026-02-11 04:01:16','2026-02-11 04:01:16');
/*!40000 ALTER TABLE `detail_publicities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_quotes`
--

DROP TABLE IF EXISTS `detail_quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_quotes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idcotizacion` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` decimal(18,2) NOT NULL,
  `precio_unitario` decimal(18,2) NOT NULL,
  `precio_total` decimal(18,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_quotes`
--

LOCK TABLES `detail_quotes` WRITE;
/*!40000 ALTER TABLE `detail_quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_sale_notes`
--

DROP TABLE IF EXISTS `detail_sale_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_sale_notes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idnotaventa` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` decimal(18,2) NOT NULL,
  `descuento` decimal(18,2) NOT NULL,
  `igv` decimal(18,2) NOT NULL,
  `id_afectacion_igv` int(11) NOT NULL,
  `precio_unitario` decimal(18,2) NOT NULL,
  `precio_total` decimal(18,2) NOT NULL,
  `opcion` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_sale_notes`
--

LOCK TABLES `detail_sale_notes` WRITE;
/*!40000 ALTER TABLE `detail_sale_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_sale_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `districts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `provincia_codigo` varchar(255) NOT NULL,
  `departamento_codigo` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1875 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'010101','Chachapoyas','0101','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(2,'010102','Asunción','0101','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(3,'010103','Balsas','0101','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(4,'010104','Cheto','0101','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(5,'010105','Chiliquin','0101','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(6,'010106','Chuquibamba','0101','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(7,'010107','Granada','0101','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(8,'010108','Huancas','0101','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(9,'010109','La Jalca','0101','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(10,'010110','Leimebamba','0101','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(11,'010111','Levanto','0101','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(12,'010112','Magdalena','0101','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(13,'010113','Mariscal Castilla','0101','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(14,'010114','Molinopampa','0101','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(15,'010115','Montevideo','0101','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(16,'010116','Olleros','0101','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(17,'010117','Quinjalca','0101','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(18,'010118','San Francisco de Daguas','0101','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(19,'010119','San Isidro de Maino','0101','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(20,'010120','Soloco','0101','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(21,'010121','Sonche','0101','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(22,'010201','Bagua','0102','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(23,'010202','Aramango','0102','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(24,'010203','Copallin','0102','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(25,'010204','El Parco','0102','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(26,'010205','Imaza','0102','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(27,'010206','La Peca','0102','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(28,'010301','Jumbilla','0103','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(29,'010302','Chisquilla','0103','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(30,'010303','Churuja','0103','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(31,'010304','Corosha','0103','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(32,'010305','Cuispes','0103','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(33,'010306','Florida','0103','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(34,'010307','Jazan','0103','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(35,'010308','Recta','0103','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(36,'010309','San Carlos','0103','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(37,'010310','Shipasbamba','0103','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(38,'010311','Valera','0103','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(39,'010312','Yambrasbamba','0103','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(40,'010401','Nieva','0104','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(41,'010402','El Cenepa','0104','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(42,'010403','Río Santiago','0104','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(43,'010501','Lamud','0105','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(44,'010502','Camporredondo','0105','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(45,'010503','Cocabamba','0105','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(46,'010504','Colcamar','0105','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(47,'010505','Conila','0105','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(48,'010506','Inguilpata','0105','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(49,'010507','Longuita','0105','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(50,'010508','Lonya Chico','0105','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(51,'010509','Luya','0105','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(52,'010510','Luya Viejo','0105','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(53,'010511','María','0105','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(54,'010512','Ocalli','0105','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(55,'010513','Ocumal','0105','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(56,'010514','Pisuquia','0105','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(57,'010515','Providencia','0105','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(58,'010516','San Cristóbal','0105','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(59,'010517','San Francisco de Yeso','0105','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(60,'010518','San Jerónimo','0105','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(61,'010519','San Juan de Lopecancha','0105','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(62,'010520','Santa Catalina','0105','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(63,'010521','Santo Tomas','0105','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(64,'010522','Tingo','0105','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(65,'010523','Trita','0105','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(66,'010601','San Nicolás','0106','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(67,'010602','Chirimoto','0106','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(68,'010603','Cochamal','0106','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(69,'010604','Huambo','0106','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(70,'010605','Limabamba','0106','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(71,'010606','Longar','0106','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(72,'010607','Mariscal Benavides','0106','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(73,'010608','Milpuc','0106','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(74,'010609','Omia','0106','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(75,'010610','Santa Rosa','0106','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(76,'010611','Totora','0106','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(77,'010612','Vista Alegre','0106','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(78,'010701','Bagua Grande','0107','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(79,'010702','Cajaruro','0107','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(80,'010703','Cumba','0107','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(81,'010704','El Milagro','0107','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(82,'010705','Jamalca','0107','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(83,'010706','Lonya Grande','0107','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(84,'010707','Yamon','0107','01','2026-02-11 04:01:12','2026-02-11 04:01:12'),(85,'020101','Huaraz','0201','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(86,'020102','Cochabamba','0201','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(87,'020103','Colcabamba','0201','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(88,'020104','Huanchay','0201','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(89,'020105','Independencia','0201','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(90,'020106','Jangas','0201','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(91,'020107','La Libertad','0201','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(92,'020108','Olleros','0201','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(93,'020109','Pampas Grande','0201','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(94,'020110','Pariacoto','0201','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(95,'020111','Pira','0201','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(96,'020112','Tarica','0201','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(97,'020201','Aija','0202','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(98,'020202','Coris','0202','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(99,'020203','Huacllan','0202','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(100,'020204','La Merced','0202','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(101,'020205','Succha','0202','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(102,'020301','Llamellin','0203','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(103,'020302','Aczo','0203','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(104,'020303','Chaccho','0203','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(105,'020304','Chingas','0203','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(106,'020305','Mirgas','0203','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(107,'020306','San Juan de Rontoy','0203','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(108,'020401','Chacas','0204','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(109,'020402','Acochaca','0204','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(110,'020501','Chiquian','0205','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(111,'020502','Abelardo Pardo Lezameta','0205','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(112,'020503','Antonio Raymondi','0205','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(113,'020504','Aquia','0205','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(114,'020505','Cajacay','0205','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(115,'020506','Canis','0205','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(116,'020507','Colquioc','0205','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(117,'020508','Huallanca','0205','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(118,'020509','Huasta','0205','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(119,'020510','Huayllacayan','0205','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(120,'020511','La Primavera','0205','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(121,'020512','Mangas','0205','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(122,'020513','Pacllon','0205','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(123,'020514','San Miguel de Corpanqui','0205','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(124,'020515','Ticllos','0205','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(125,'020601','Carhuaz','0206','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(126,'020602','Acopampa','0206','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(127,'020603','Amashca','0206','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(128,'020604','Anta','0206','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(129,'020605','Ataquero','0206','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(130,'020606','Marcara','0206','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(131,'020607','Pariahuanca','0206','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(132,'020608','San Miguel de Aco','0206','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(133,'020609','Shilla','0206','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(134,'020610','Tinco','0206','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(135,'020611','Yungar','0206','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(136,'020701','San Luis','0207','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(137,'020702','San Nicolás','0207','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(138,'020703','Yauya','0207','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(139,'020801','Casma','0208','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(140,'020802','Buena Vista Alta','0208','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(141,'020803','Comandante Noel','0208','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(142,'020804','Yautan','0208','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(143,'020901','Corongo','0209','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(144,'020902','Aco','0209','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(145,'020903','Bambas','0209','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(146,'020904','Cusca','0209','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(147,'020905','La Pampa','0209','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(148,'020906','Yanac','0209','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(149,'020907','Yupan','0209','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(150,'021001','Huari','0210','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(151,'021002','Anra','0210','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(152,'021003','Cajay','0210','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(153,'021004','Chavin de Huantar','0210','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(154,'021005','Huacachi','0210','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(155,'021006','Huacchis','0210','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(156,'021007','Huachis','0210','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(157,'021008','Huantar','0210','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(158,'021009','Masin','0210','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(159,'021010','Paucas','0210','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(160,'021011','Ponto','0210','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(161,'021012','Rahuapampa','0210','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(162,'021013','Rapayan','0210','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(163,'021014','San Marcos','0210','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(164,'021015','San Pedro de Chana','0210','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(165,'021016','Uco','0210','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(166,'021101','Huarmey','0211','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(167,'021102','Cochapeti','0211','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(168,'021103','Culebras','0211','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(169,'021104','Huayan','0211','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(170,'021105','Malvas','0211','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(171,'021201','Caraz','0212','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(172,'021202','Huallanca','0212','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(173,'021203','Huata','0212','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(174,'021204','Huaylas','0212','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(175,'021205','Mato','0212','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(176,'021206','Pamparomas','0212','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(177,'021207','Pueblo Libre','0212','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(178,'021208','Santa Cruz','0212','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(179,'021209','Santo Toribio','0212','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(180,'021210','Yuracmarca','0212','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(181,'021301','Piscobamba','0213','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(182,'021302','Casca','0213','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(183,'021303','Eleazar Guzmán Barron','0213','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(184,'021304','Fidel Olivas Escudero','0213','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(185,'021305','Llama','0213','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(186,'021306','Llumpa','0213','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(187,'021307','Lucma','0213','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(188,'021308','Musga','0213','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(189,'021401','Ocros','0214','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(190,'021402','Acas','0214','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(191,'021403','Cajamarquilla','0214','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(192,'021404','Carhuapampa','0214','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(193,'021405','Cochas','0214','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(194,'021406','Congas','0214','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(195,'021407','Llipa','0214','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(196,'021408','San Cristóbal de Rajan','0214','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(197,'021409','San Pedro','0214','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(198,'021410','Santiago de Chilcas','0214','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(199,'021501','Cabana','0215','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(200,'021502','Bolognesi','0215','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(201,'021503','Conchucos','0215','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(202,'021504','Huacaschuque','0215','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(203,'021505','Huandoval','0215','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(204,'021506','Lacabamba','0215','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(205,'021507','Llapo','0215','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(206,'021508','Pallasca','0215','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(207,'021509','Pampas','0215','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(208,'021510','Santa Rosa','0215','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(209,'021511','Tauca','0215','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(210,'021601','Pomabamba','0216','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(211,'021602','Huayllan','0216','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(212,'021603','Parobamba','0216','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(213,'021604','Quinuabamba','0216','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(214,'021701','Recuay','0217','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(215,'021702','Catac','0217','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(216,'021703','Cotaparaco','0217','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(217,'021704','Huayllapampa','0217','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(218,'021705','Llacllin','0217','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(219,'021706','Marca','0217','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(220,'021707','Pampas Chico','0217','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(221,'021708','Pararin','0217','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(222,'021709','Tapacocha','0217','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(223,'021710','Ticapampa','0217','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(224,'021801','Chimbote','0218','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(225,'021802','Cáceres del Perú','0218','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(226,'021803','Coishco','0218','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(227,'021804','Macate','0218','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(228,'021805','Moro','0218','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(229,'021806','Nepeña','0218','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(230,'021807','Samanco','0218','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(231,'021808','Santa','0218','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(232,'021809','Nuevo Chimbote','0218','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(233,'021901','Sihuas','0219','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(234,'021902','Acobamba','0219','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(235,'021903','Alfonso Ugarte','0219','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(236,'021904','Cashapampa','0219','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(237,'021905','Chingalpo','0219','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(238,'021906','Huayllabamba','0219','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(239,'021907','Quiches','0219','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(240,'021908','Ragash','0219','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(241,'021909','San Juan','0219','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(242,'021910','Sicsibamba','0219','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(243,'022001','Yungay','0220','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(244,'022002','Cascapara','0220','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(245,'022003','Mancos','0220','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(246,'022004','Matacoto','0220','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(247,'022005','Quillo','0220','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(248,'022006','Ranrahirca','0220','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(249,'022007','Shupluy','0220','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(250,'022008','Yanama','0220','02','2026-02-11 04:01:12','2026-02-11 04:01:12'),(251,'030101','Abancay','0301','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(252,'030102','Chacoche','0301','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(253,'030103','Circa','0301','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(254,'030104','Curahuasi','0301','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(255,'030105','Huanipaca','0301','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(256,'030106','Lambrama','0301','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(257,'030107','Pichirhua','0301','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(258,'030108','San Pedro de Cachora','0301','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(259,'030109','Tamburco','0301','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(260,'030201','Andahuaylas','0302','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(261,'030202','Andarapa','0302','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(262,'030203','Chiara','0302','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(263,'030204','Huancarama','0302','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(264,'030205','Huancaray','0302','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(265,'030206','Huayana','0302','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(266,'030207','Kishuara','0302','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(267,'030208','Pacobamba','0302','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(268,'030209','Pacucha','0302','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(269,'030210','Pampachiri','0302','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(270,'030211','Pomacocha','0302','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(271,'030212','San Antonio de Cachi','0302','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(272,'030213','San Jerónimo','0302','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(273,'030214','San Miguel de Chaccrampa','0302','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(274,'030215','Santa María de Chicmo','0302','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(275,'030216','Talavera','0302','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(276,'030217','Tumay Huaraca','0302','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(277,'030218','Turpo','0302','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(278,'030219','Kaquiabamba','0302','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(279,'030220','José María Arguedas','0302','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(280,'030301','Antabamba','0303','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(281,'030302','El Oro','0303','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(282,'030303','Huaquirca','0303','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(283,'030304','Juan Espinoza Medrano','0303','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(284,'030305','Oropesa','0303','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(285,'030306','Pachaconas','0303','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(286,'030307','Sabaino','0303','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(287,'030401','Chalhuanca','0304','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(288,'030402','Capaya','0304','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(289,'030403','Caraybamba','0304','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(290,'030404','Chapimarca','0304','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(291,'030405','Colcabamba','0304','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(292,'030406','Cotaruse','0304','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(293,'030407','Ihuayllo','0304','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(294,'030408','Justo Apu Sahuaraura','0304','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(295,'030409','Lucre','0304','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(296,'030410','Pocohuanca','0304','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(297,'030411','San Juan de Chacña','0304','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(298,'030412','Sañayca','0304','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(299,'030413','Soraya','0304','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(300,'030414','Tapairihua','0304','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(301,'030415','Tintay','0304','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(302,'030416','Toraya','0304','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(303,'030417','Yanaca','0304','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(304,'030501','Tambobamba','0305','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(305,'030502','Cotabambas','0305','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(306,'030503','Coyllurqui','0305','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(307,'030504','Haquira','0305','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(308,'030505','Mara','0305','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(309,'030506','Challhuahuacho','0305','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(310,'030601','Chincheros','0306','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(311,'030602','Anco_Huallo','0306','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(312,'030603','Cocharcas','0306','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(313,'030604','Huaccana','0306','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(314,'030605','Ocobamba','0306','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(315,'030606','Ongoy','0306','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(316,'030607','Uranmarca','0306','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(317,'030608','Ranracancha','0306','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(318,'030609','Rocchacc','0306','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(319,'030610','El Porvenir','0306','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(320,'030611','Los Chankas','0306','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(321,'030701','Chuquibambilla','0307','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(322,'030702','Curpahuasi','0307','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(323,'030703','Gamarra','0307','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(324,'030704','Huayllati','0307','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(325,'030705','Mamara','0307','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(326,'030706','Micaela Bastidas','0307','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(327,'030707','Pataypampa','0307','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(328,'030708','Progreso','0307','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(329,'030709','San Antonio','0307','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(330,'030710','Santa Rosa','0307','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(331,'030711','Turpay','0307','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(332,'030712','Vilcabamba','0307','03','2026-02-11 04:01:12','2026-02-11 04:01:12'),(333,'030713','Virundo','0307','03','2026-02-11 04:01:13','2026-02-11 04:01:13'),(334,'030714','Curasco','0307','03','2026-02-11 04:01:13','2026-02-11 04:01:13'),(335,'040101','Arequipa','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(336,'040102','Alto Selva Alegre','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(337,'040103','Cayma','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(338,'040104','Cerro Colorado','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(339,'040105','Characato','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(340,'040106','Chiguata','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(341,'040107','Jacobo Hunter','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(342,'040108','La Joya','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(343,'040109','Mariano Melgar','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(344,'040110','Miraflores','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(345,'040111','Mollebaya','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(346,'040112','Paucarpata','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(347,'040113','Pocsi','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(348,'040114','Polobaya','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(349,'040115','Quequeña','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(350,'040116','Sabandia','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(351,'040117','Sachaca','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(352,'040118','San Juan de Siguas','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(353,'040119','San Juan de Tarucani','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(354,'040120','Santa Isabel de Siguas','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(355,'040121','Santa Rita de Siguas','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(356,'040122','Socabaya','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(357,'040123','Tiabaya','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(358,'040124','Uchumayo','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(359,'040125','Vitor','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(360,'040126','Yanahuara','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(361,'040127','Yarabamba','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(362,'040128','Yura','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(363,'040129','José Luis Bustamante Y Rivero','0401','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(364,'040201','Camaná','0402','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(365,'040202','José María Quimper','0402','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(366,'040203','Mariano Nicolás Valcárcel','0402','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(367,'040204','Mariscal Cáceres','0402','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(368,'040205','Nicolás de Pierola','0402','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(369,'040206','Ocoña','0402','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(370,'040207','Quilca','0402','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(371,'040208','Samuel Pastor','0402','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(372,'040301','Caravelí','0403','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(373,'040302','Acarí','0403','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(374,'040303','Atico','0403','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(375,'040304','Atiquipa','0403','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(376,'040305','Bella Unión','0403','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(377,'040306','Cahuacho','0403','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(378,'040307','Chala','0403','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(379,'040308','Chaparra','0403','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(380,'040309','Huanuhuanu','0403','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(381,'040310','Jaqui','0403','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(382,'040311','Lomas','0403','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(383,'040312','Quicacha','0403','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(384,'040313','Yauca','0403','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(385,'040401','Aplao','0404','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(386,'040402','Andagua','0404','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(387,'040403','Ayo','0404','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(388,'040404','Chachas','0404','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(389,'040405','Chilcaymarca','0404','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(390,'040406','Choco','0404','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(391,'040407','Huancarqui','0404','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(392,'040408','Machaguay','0404','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(393,'040409','Orcopampa','0404','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(394,'040410','Pampacolca','0404','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(395,'040411','Tipan','0404','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(396,'040412','Uñon','0404','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(397,'040413','Uraca','0404','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(398,'040414','Viraco','0404','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(399,'040501','Chivay','0405','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(400,'040502','Achoma','0405','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(401,'040503','Cabanaconde','0405','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(402,'040504','Callalli','0405','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(403,'040505','Caylloma','0405','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(404,'040506','Coporaque','0405','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(405,'040507','Huambo','0405','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(406,'040508','Huanca','0405','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(407,'040509','Ichupampa','0405','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(408,'040510','Lari','0405','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(409,'040511','Lluta','0405','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(410,'040512','Maca','0405','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(411,'040513','Madrigal','0405','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(412,'040514','San Antonio de Chuca','0405','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(413,'040515','Sibayo','0405','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(414,'040516','Tapay','0405','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(415,'040517','Tisco','0405','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(416,'040518','Tuti','0405','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(417,'040519','Yanque','0405','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(418,'040520','Majes','0405','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(419,'040601','Chuquibamba','0406','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(420,'040602','Andaray','0406','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(421,'040603','Cayarani','0406','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(422,'040604','Chichas','0406','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(423,'040605','Iray','0406','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(424,'040606','Río Grande','0406','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(425,'040607','Salamanca','0406','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(426,'040608','Yanaquihua','0406','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(427,'040701','Mollendo','0407','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(428,'040702','Cocachacra','0407','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(429,'040703','Dean Valdivia','0407','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(430,'040704','Islay','0407','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(431,'040705','Mejia','0407','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(432,'040706','Punta de Bombón','0407','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(433,'040801','Cotahuasi','0408','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(434,'040802','Alca','0408','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(435,'040803','Charcana','0408','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(436,'040804','Huaynacotas','0408','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(437,'040805','Pampamarca','0408','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(438,'040806','Puyca','0408','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(439,'040807','Quechualla','0408','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(440,'040808','Sayla','0408','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(441,'040809','Tauria','0408','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(442,'040810','Tomepampa','0408','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(443,'040811','Toro','0408','04','2026-02-11 04:01:13','2026-02-11 04:01:13'),(444,'050101','Ayacucho','0501','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(445,'050102','Acocro','0501','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(446,'050103','Acos Vinchos','0501','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(447,'050104','Carmen Alto','0501','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(448,'050105','Chiara','0501','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(449,'050106','Ocros','0501','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(450,'050107','Pacaycasa','0501','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(451,'050108','Quinua','0501','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(452,'050109','San José de Ticllas','0501','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(453,'050110','San Juan Bautista','0501','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(454,'050111','Santiago de Pischa','0501','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(455,'050112','Socos','0501','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(456,'050113','Tambillo','0501','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(457,'050114','Vinchos','0501','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(458,'050115','Jesús Nazareno','0501','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(459,'050116','Andrés Avelino Cáceres Dorregaray','0501','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(460,'050201','Cangallo','0502','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(461,'050202','Chuschi','0502','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(462,'050203','Los Morochucos','0502','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(463,'050204','María Parado de Bellido','0502','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(464,'050205','Paras','0502','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(465,'050206','Totos','0502','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(466,'050301','Sancos','0503','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(467,'050302','Carapo','0503','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(468,'050303','Sacsamarca','0503','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(469,'050304','Santiago de Lucanamarca','0503','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(470,'050401','Huanta','0504','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(471,'050402','Ayahuanco','0504','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(472,'050403','Huamanguilla','0504','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(473,'050404','Iguain','0504','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(474,'050405','Luricocha','0504','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(475,'050406','Santillana','0504','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(476,'050407','Sivia','0504','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(477,'050408','Llochegua','0504','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(478,'050409','Canayre','0504','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(479,'050410','Uchuraccay','0504','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(480,'050411','Pucacolpa','0504','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(481,'050412','Chaca','0504','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(482,'050501','San Miguel','0505','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(483,'050502','Anco','0505','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(484,'050503','Ayna','0505','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(485,'050504','Chilcas','0505','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(486,'050505','Chungui','0505','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(487,'050506','Luis Carranza','0505','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(488,'050507','Santa Rosa','0505','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(489,'050508','Tambo','0505','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(490,'050509','Samugari','0505','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(491,'050510','Anchihuay','0505','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(492,'050511','Oronccoy','0505','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(493,'050601','Puquio','0506','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(494,'050602','Aucara','0506','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(495,'050603','Cabana','0506','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(496,'050604','Carmen Salcedo','0506','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(497,'050605','Chaviña','0506','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(498,'050606','Chipao','0506','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(499,'050607','Huac-Huas','0506','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(500,'050608','Laramate','0506','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(501,'050609','Leoncio Prado','0506','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(502,'050610','Llauta','0506','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(503,'050611','Lucanas','0506','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(504,'050612','Ocaña','0506','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(505,'050613','Otoca','0506','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(506,'050614','Saisa','0506','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(507,'050615','San Cristóbal','0506','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(508,'050616','San Juan','0506','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(509,'050617','San Pedro','0506','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(510,'050618','San Pedro de Palco','0506','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(511,'050619','Sancos','0506','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(512,'050620','Santa Ana de Huaycahuacho','0506','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(513,'050621','Santa Lucia','0506','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(514,'050701','Coracora','0507','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(515,'050702','Chumpi','0507','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(516,'050703','Coronel Castañeda','0507','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(517,'050704','Pacapausa','0507','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(518,'050705','Pullo','0507','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(519,'050706','Puyusca','0507','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(520,'050707','San Francisco de Ravacayco','0507','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(521,'050708','Upahuacho','0507','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(522,'050801','Pausa','0508','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(523,'050802','Colta','0508','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(524,'050803','Corculla','0508','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(525,'050804','Lampa','0508','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(526,'050805','Marcabamba','0508','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(527,'050806','Oyolo','0508','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(528,'050807','Pararca','0508','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(529,'050808','San Javier de Alpabamba','0508','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(530,'050809','San José de Ushua','0508','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(531,'050810','Sara Sara','0508','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(532,'050901','Querobamba','0509','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(533,'050902','Belén','0509','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(534,'050903','Chalcos','0509','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(535,'050904','Chilcayoc','0509','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(536,'050905','Huacaña','0509','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(537,'050906','Morcolla','0509','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(538,'050907','Paico','0509','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(539,'050908','San Pedro de Larcay','0509','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(540,'050909','San Salvador de Quije','0509','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(541,'050910','Santiago de Paucaray','0509','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(542,'050911','Soras','0509','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(543,'051001','Huancapi','0510','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(544,'051002','Alcamenca','0510','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(545,'051003','Apongo','0510','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(546,'051004','Asquipata','0510','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(547,'051005','Canaria','0510','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(548,'051006','Cayara','0510','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(549,'051007','Colca','0510','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(550,'051008','Huamanquiquia','0510','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(551,'051009','Huancaraylla','0510','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(552,'051010','Hualla','0510','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(553,'051011','Sarhua','0510','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(554,'051012','Vilcanchos','0510','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(555,'051101','Vilcas Huaman','0511','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(556,'051102','Accomarca','0511','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(557,'051103','Carhuanca','0511','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(558,'051104','Concepción','0511','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(559,'051105','Huambalpa','0511','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(560,'051106','Independencia','0511','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(561,'051107','Saurama','0511','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(562,'051108','Vischongo','0511','05','2026-02-11 04:01:13','2026-02-11 04:01:13'),(563,'060101','Cajamarca','0601','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(564,'060102','Asunción','0601','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(565,'060103','Chetilla','0601','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(566,'060104','Cospan','0601','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(567,'060105','Encañada','0601','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(568,'060106','Jesús','0601','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(569,'060107','Llacanora','0601','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(570,'060108','Los Baños del Inca','0601','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(571,'060109','Magdalena','0601','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(572,'060110','Matara','0601','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(573,'060111','Namora','0601','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(574,'060112','San Juan','0601','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(575,'060201','Cajabamba','0602','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(576,'060202','Cachachi','0602','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(577,'060203','Condebamba','0602','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(578,'060204','Sitacocha','0602','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(579,'060301','Celendín','0603','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(580,'060302','Chumuch','0603','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(581,'060303','Cortegana','0603','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(582,'060304','Huasmin','0603','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(583,'060305','Jorge Chávez','0603','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(584,'060306','José Gálvez','0603','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(585,'060307','Miguel Iglesias','0603','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(586,'060308','Oxamarca','0603','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(587,'060309','Sorochuco','0603','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(588,'060310','Sucre','0603','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(589,'060311','Utco','0603','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(590,'060312','La Libertad de Pallan','0603','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(591,'060401','Chota','0604','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(592,'060402','Anguia','0604','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(593,'060403','Chadin','0604','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(594,'060404','Chiguirip','0604','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(595,'060405','Chimban','0604','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(596,'060406','Choropampa','0604','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(597,'060407','Cochabamba','0604','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(598,'060408','Conchan','0604','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(599,'060409','Huambos','0604','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(600,'060410','Lajas','0604','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(601,'060411','Llama','0604','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(602,'060412','Miracosta','0604','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(603,'060413','Paccha','0604','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(604,'060414','Pion','0604','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(605,'060415','Querocoto','0604','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(606,'060416','San Juan de Licupis','0604','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(607,'060417','Tacabamba','0604','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(608,'060418','Tocmoche','0604','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(609,'060419','Chalamarca','0604','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(610,'060501','Contumaza','0605','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(611,'060502','Chilete','0605','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(612,'060503','Cupisnique','0605','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(613,'060504','Guzmango','0605','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(614,'060505','San Benito','0605','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(615,'060506','Santa Cruz de Toledo','0605','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(616,'060507','Tantarica','0605','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(617,'060508','Yonan','0605','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(618,'060601','Cutervo','0606','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(619,'060602','Callayuc','0606','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(620,'060603','Choros','0606','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(621,'060604','Cujillo','0606','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(622,'060605','La Ramada','0606','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(623,'060606','Pimpingos','0606','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(624,'060607','Querocotillo','0606','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(625,'060608','San Andrés de Cutervo','0606','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(626,'060609','San Juan de Cutervo','0606','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(627,'060610','San Luis de Lucma','0606','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(628,'060611','Santa Cruz','0606','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(629,'060612','Santo Domingo de la Capilla','0606','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(630,'060613','Santo Tomas','0606','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(631,'060614','Socota','0606','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(632,'060615','Toribio Casanova','0606','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(633,'060701','Bambamarca','0607','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(634,'060702','Chugur','0607','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(635,'060703','Hualgayoc','0607','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(636,'060801','Jaén','0608','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(637,'060802','Bellavista','0608','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(638,'060803','Chontali','0608','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(639,'060804','Colasay','0608','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(640,'060805','Huabal','0608','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(641,'060806','Las Pirias','0608','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(642,'060807','Pomahuaca','0608','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(643,'060808','Pucara','0608','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(644,'060809','Sallique','0608','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(645,'060810','San Felipe','0608','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(646,'060811','San José del Alto','0608','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(647,'060812','Santa Rosa','0608','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(648,'060901','San Ignacio','0609','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(649,'060902','Chirinos','0609','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(650,'060903','Huarango','0609','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(651,'060904','La Coipa','0609','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(652,'060905','Namballe','0609','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(653,'060906','San José de Lourdes','0609','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(654,'060907','Tabaconas','0609','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(655,'061001','Pedro Gálvez','0610','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(656,'061002','Chancay','0610','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(657,'061003','Eduardo Villanueva','0610','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(658,'061004','Gregorio Pita','0610','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(659,'061005','Ichocan','0610','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(660,'061006','José Manuel Quiroz','0610','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(661,'061007','José Sabogal','0610','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(662,'061101','San Miguel','0611','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(663,'061102','Bolívar','0611','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(664,'061103','Calquis','0611','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(665,'061104','Catilluc','0611','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(666,'061105','El Prado','0611','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(667,'061106','La Florida','0611','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(668,'061107','Llapa','0611','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(669,'061108','Nanchoc','0611','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(670,'061109','Niepos','0611','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(671,'061110','San Gregorio','0611','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(672,'061111','San Silvestre de Cochan','0611','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(673,'061112','Tongod','0611','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(674,'061113','Unión Agua Blanca','0611','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(675,'061201','San Pablo','0612','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(676,'061202','San Bernardino','0612','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(677,'061203','San Luis','0612','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(678,'061204','Tumbaden','0612','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(679,'061301','Santa Cruz','0613','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(680,'061302','Andabamba','0613','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(681,'061303','Catache','0613','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(682,'061304','Chancaybaños','0613','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(683,'061305','La Esperanza','0613','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(684,'061306','Ninabamba','0613','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(685,'061307','Pulan','0613','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(686,'061308','Saucepampa','0613','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(687,'061309','Sexi','0613','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(688,'061310','Uticyacu','0613','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(689,'061311','Yauyucan','0613','06','2026-02-11 04:01:13','2026-02-11 04:01:13'),(690,'070101','Callao','0701','07','2026-02-11 04:01:13','2026-02-11 04:01:13'),(691,'070102','Bellavista','0701','07','2026-02-11 04:01:13','2026-02-11 04:01:13'),(692,'070103','Carmen de la Legua Reynoso','0701','07','2026-02-11 04:01:13','2026-02-11 04:01:13'),(693,'070104','La Perla','0701','07','2026-02-11 04:01:13','2026-02-11 04:01:13'),(694,'070105','La Punta','0701','07','2026-02-11 04:01:13','2026-02-11 04:01:13'),(695,'070106','Ventanilla','0701','07','2026-02-11 04:01:13','2026-02-11 04:01:13'),(696,'070107','Mi Perú','0701','07','2026-02-11 04:01:13','2026-02-11 04:01:13'),(697,'080101','Cusco','0801','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(698,'080102','Ccorca','0801','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(699,'080103','Poroy','0801','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(700,'080104','San Jerónimo','0801','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(701,'080105','San Sebastian','0801','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(702,'080106','Santiago','0801','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(703,'080107','Saylla','0801','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(704,'080108','Wanchaq','0801','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(705,'080201','Acomayo','0802','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(706,'080202','Acopia','0802','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(707,'080203','Acos','0802','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(708,'080204','Mosoc Llacta','0802','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(709,'080205','Pomacanchi','0802','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(710,'080206','Rondocan','0802','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(711,'080207','Sangarara','0802','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(712,'080301','Anta','0803','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(713,'080302','Ancahuasi','0803','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(714,'080303','Cachimayo','0803','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(715,'080304','Chinchaypujio','0803','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(716,'080305','Huarocondo','0803','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(717,'080306','Limatambo','0803','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(718,'080307','Mollepata','0803','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(719,'080308','Pucyura','0803','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(720,'080309','Zurite','0803','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(721,'080401','Calca','0804','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(722,'080402','Coya','0804','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(723,'080403','Lamay','0804','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(724,'080404','Lares','0804','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(725,'080405','Pisac','0804','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(726,'080406','San Salvador','0804','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(727,'080407','Taray','0804','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(728,'080408','Yanatile','0804','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(729,'080501','Yanaoca','0805','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(730,'080502','Checca','0805','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(731,'080503','Kunturkanki','0805','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(732,'080504','Langui','0805','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(733,'080505','Layo','0805','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(734,'080506','Pampamarca','0805','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(735,'080507','Quehue','0805','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(736,'080508','Tupac Amaru','0805','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(737,'080601','Sicuani','0806','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(738,'080602','Checacupe','0806','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(739,'080603','Combapata','0806','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(740,'080604','Marangani','0806','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(741,'080605','Pitumarca','0806','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(742,'080606','San Pablo','0806','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(743,'080607','San Pedro','0806','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(744,'080608','Tinta','0806','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(745,'080701','Santo Tomas','0807','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(746,'080702','Capacmarca','0807','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(747,'080703','Chamaca','0807','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(748,'080704','Colquemarca','0807','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(749,'080705','Livitaca','0807','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(750,'080706','Llusco','0807','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(751,'080707','Quiñota','0807','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(752,'080708','Velille','0807','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(753,'080801','Espinar','0808','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(754,'080802','Condoroma','0808','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(755,'080803','Coporaque','0808','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(756,'080804','Ocoruro','0808','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(757,'080805','Pallpata','0808','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(758,'080806','Pichigua','0808','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(759,'080807','Suyckutambo','0808','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(760,'080808','Alto Pichigua','0808','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(761,'080901','Santa Ana','0809','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(762,'080902','Echarate','0809','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(763,'080903','Huayopata','0809','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(764,'080904','Maranura','0809','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(765,'080905','Ocobamba','0809','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(766,'080906','Quellouno','0809','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(767,'080907','Kimbiri','0809','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(768,'080908','Santa Teresa','0809','08','2026-02-11 04:01:13','2026-02-11 04:01:13'),(769,'080909','Vilcabamba','0809','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(770,'080910','Pichari','0809','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(771,'080911','Inkawasi','0809','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(772,'080912','Villa Virgen','0809','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(773,'080913','Villa Kintiarina','0809','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(774,'080914','Megantoni','0809','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(775,'081001','Paruro','0810','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(776,'081002','Accha','0810','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(777,'081003','Ccapi','0810','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(778,'081004','Colcha','0810','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(779,'081005','Huanoquite','0810','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(780,'081006','Omachaç','0810','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(781,'081007','Paccaritambo','0810','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(782,'081008','Pillpinto','0810','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(783,'081009','Yaurisque','0810','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(784,'081101','Paucartambo','0811','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(785,'081102','Caicay','0811','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(786,'081103','Challabamba','0811','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(787,'081104','Colquepata','0811','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(788,'081105','Huancarani','0811','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(789,'081106','Kosñipata','0811','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(790,'081201','Urcos','0812','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(791,'081202','Andahuaylillas','0812','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(792,'081203','Camanti','0812','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(793,'081204','Ccarhuayo','0812','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(794,'081205','Ccatca','0812','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(795,'081206','Cusipata','0812','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(796,'081207','Huaro','0812','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(797,'081208','Lucre','0812','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(798,'081209','Marcapata','0812','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(799,'081210','Ocongate','0812','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(800,'081211','Oropesa','0812','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(801,'081212','Quiquijana','0812','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(802,'081301','Urubamba','0813','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(803,'081302','Chinchero','0813','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(804,'081303','Huayllabamba','0813','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(805,'081304','Machupicchu','0813','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(806,'081305','Maras','0813','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(807,'081306','Ollantaytambo','0813','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(808,'081307','Yucay','0813','08','2026-02-11 04:01:14','2026-02-11 04:01:14'),(809,'090101','Huancavelica','0901','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(810,'090102','Acobambilla','0901','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(811,'090103','Acoria','0901','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(812,'090104','Conayca','0901','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(813,'090105','Cuenca','0901','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(814,'090106','Huachocolpa','0901','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(815,'090107','Huayllahuara','0901','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(816,'090108','Izcuchaca','0901','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(817,'090109','Laria','0901','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(818,'090110','Manta','0901','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(819,'090111','Mariscal Cáceres','0901','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(820,'090112','Moya','0901','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(821,'090113','Nuevo Occoro','0901','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(822,'090114','Palca','0901','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(823,'090115','Pilchaca','0901','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(824,'090116','Vilca','0901','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(825,'090117','Yauli','0901','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(826,'090118','Ascensión','0901','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(827,'090119','Huando','0901','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(828,'090201','Acobamba','0902','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(829,'090202','Andabamba','0902','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(830,'090203','Anta','0902','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(831,'090204','Caja','0902','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(832,'090205','Marcas','0902','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(833,'090206','Paucara','0902','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(834,'090207','Pomacocha','0902','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(835,'090208','Rosario','0902','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(836,'090301','Lircay','0903','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(837,'090302','Anchonga','0903','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(838,'090303','Callanmarca','0903','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(839,'090304','Ccochaccasa','0903','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(840,'090305','Chincho','0903','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(841,'090306','Congalla','0903','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(842,'090307','Huanca-Huanca','0903','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(843,'090308','Huayllay Grande','0903','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(844,'090309','Julcamarca','0903','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(845,'090310','San Antonio de Antaparco','0903','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(846,'090311','Santo Tomas de Pata','0903','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(847,'090312','Secclla','0903','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(848,'090401','Castrovirreyna','0904','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(849,'090402','Arma','0904','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(850,'090403','Aurahua','0904','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(851,'090404','Capillas','0904','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(852,'090405','Chupamarca','0904','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(853,'090406','Cocas','0904','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(854,'090407','Huachos','0904','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(855,'090408','Huamatambo','0904','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(856,'090409','Mollepampa','0904','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(857,'090410','San Juan','0904','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(858,'090411','Santa Ana','0904','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(859,'090412','Tantara','0904','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(860,'090413','Ticrapo','0904','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(861,'090501','Churcampa','0905','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(862,'090502','Anco','0905','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(863,'090503','Chinchihuasi','0905','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(864,'090504','El Carmen','0905','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(865,'090505','La Merced','0905','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(866,'090506','Locroja','0905','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(867,'090507','Paucarbamba','0905','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(868,'090508','San Miguel de Mayocc','0905','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(869,'090509','San Pedro de Coris','0905','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(870,'090510','Pachamarca','0905','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(871,'090511','Cosme','0905','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(872,'090601','Huaytara','0906','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(873,'090602','Ayavi','0906','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(874,'090603','Córdova','0906','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(875,'090604','Huayacundo Arma','0906','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(876,'090605','Laramarca','0906','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(877,'090606','Ocoyo','0906','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(878,'090607','Pilpichaca','0906','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(879,'090608','Querco','0906','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(880,'090609','Quito-Arma','0906','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(881,'090610','San Antonio de Cusicancha','0906','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(882,'090611','San Francisco de Sangayaico','0906','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(883,'090612','San Isidro','0906','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(884,'090613','Santiago de Chocorvos','0906','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(885,'090614','Santiago de Quirahuara','0906','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(886,'090615','Santo Domingo de Capillas','0906','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(887,'090616','Tambo','0906','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(888,'090701','Pampas','0907','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(889,'090702','Acostambo','0907','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(890,'090703','Acraquia','0907','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(891,'090704','Ahuaycha','0907','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(892,'090705','Colcabamba','0907','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(893,'090706','Daniel Hernández','0907','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(894,'090707','Huachocolpa','0907','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(895,'090709','Huaribamba','0907','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(896,'090710','Ñahuimpuquio','0907','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(897,'090711','Pazos','0907','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(898,'090713','Quishuar','0907','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(899,'090714','Salcabamba','0907','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(900,'090715','Salcahuasi','0907','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(901,'090716','San Marcos de Rocchac','0907','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(902,'090717','Surcubamba','0907','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(903,'090718','Tintay Puncu','0907','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(904,'090719','Quichuas','0907','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(905,'090720','Andaymarca','0907','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(906,'090721','Roble','0907','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(907,'090722','Pichos','0907','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(908,'090723','Santiago de Tucuma','0907','09','2026-02-11 04:01:14','2026-02-11 04:01:14'),(909,'100101','Huanuco','1001','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(910,'100102','Amarilis','1001','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(911,'100103','Chinchao','1001','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(912,'100104','Churubamba','1001','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(913,'100105','Margos','1001','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(914,'100106','Quisqui (Kichki)','1001','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(915,'100107','San Francisco de Cayran','1001','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(916,'100108','San Pedro de Chaulan','1001','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(917,'100109','Santa María del Valle','1001','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(918,'100110','Yarumayo','1001','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(919,'100111','Pillco Marca','1001','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(920,'100112','Yacus','1001','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(921,'100113','San Pablo de Pillao','1001','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(922,'100201','Ambo','1002','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(923,'100202','Cayna','1002','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(924,'100203','Colpas','1002','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(925,'100204','Conchamarca','1002','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(926,'100205','Huacar','1002','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(927,'100206','San Francisco','1002','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(928,'100207','San Rafael','1002','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(929,'100208','Tomay Kichwa','1002','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(930,'100301','La Unión','1003','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(931,'100307','Chuquis','1003','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(932,'100311','Marías','1003','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(933,'100313','Pachas','1003','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(934,'100316','Quivilla','1003','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(935,'100317','Ripan','1003','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(936,'100321','Shunqui','1003','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(937,'100322','Sillapata','1003','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(938,'100323','Yanas','1003','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(939,'100401','Huacaybamba','1004','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(940,'100402','Canchabamba','1004','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(941,'100403','Cochabamba','1004','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(942,'100404','Pinra','1004','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(943,'100501','Llata','1005','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(944,'100502','Arancay','1005','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(945,'100503','Chavín de Pariarca','1005','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(946,'100504','Jacas Grande','1005','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(947,'100505','Jircan','1005','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(948,'100506','Miraflores','1005','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(949,'100507','Monzón','1005','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(950,'100508','Punchao','1005','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(951,'100509','Puños','1005','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(952,'100510','Singa','1005','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(953,'100511','Tantamayo','1005','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(954,'100601','Rupa-Rupa','1006','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(955,'100602','Daniel Alomía Robles','1006','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(956,'100603','Hermílio Valdizan','1006','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(957,'100604','José Crespo y Castillo','1006','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(958,'100605','Luyando','1006','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(959,'100606','Mariano Damaso Beraun','1006','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(960,'100607','Pucayacu','1006','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(961,'100608','Castillo Grande','1006','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(962,'100609','Pueblo Nuevo','1006','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(963,'100610','Santo Domingo de Anda','1006','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(964,'100701','Huacrachuco','1007','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(965,'100702','Cholon','1007','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(966,'100703','San Buenaventura','1007','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(967,'100704','La Morada','1007','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(968,'100705','Santa Rosa de Alto Yanajanca','1007','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(969,'100801','Panao','1008','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(970,'100802','Chaglla','1008','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(971,'100803','Molino','1008','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(972,'100804','Umari','1008','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(973,'100901','Puerto Inca','1009','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(974,'100902','Codo del Pozuzo','1009','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(975,'100903','Honoria','1009','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(976,'100904','Tournavista','1009','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(977,'100905','Yuyapichis','1009','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(978,'101001','Jesús','1010','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(979,'101002','Baños','1010','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(980,'101003','Jivia','1010','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(981,'101004','Queropalca','1010','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(982,'101005','Rondos','1010','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(983,'101006','San Francisco de Asís','1010','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(984,'101007','San Miguel de Cauri','1010','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(985,'101101','Chavinillo','1011','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(986,'101102','Cahuac','1011','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(987,'101103','Chacabamba','1011','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(988,'101104','Aparicio Pomares','1011','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(989,'101105','Jacas Chico','1011','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(990,'101106','Obas','1011','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(991,'101107','Pampamarca','1011','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(992,'101108','Choras','1011','10','2026-02-11 04:01:14','2026-02-11 04:01:14'),(993,'110101','Ica','1101','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(994,'110102','La Tinguiña','1101','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(995,'110103','Los Aquijes','1101','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(996,'110104','Ocucaje','1101','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(997,'110105','Pachacutec','1101','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(998,'110106','Parcona','1101','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(999,'110107','Pueblo Nuevo','1101','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1000,'110108','Salas','1101','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1001,'110109','San José de Los Molinos','1101','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1002,'110110','San Juan Bautista','1101','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1003,'110111','Santiago','1101','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1004,'110112','Subtanjalla','1101','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1005,'110113','Tate','1101','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1006,'110114','Yauca del Rosario','1101','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1007,'110201','Chincha Alta','1102','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1008,'110202','Alto Laran','1102','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1009,'110203','Chavin','1102','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1010,'110204','Chincha Baja','1102','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1011,'110205','El Carmen','1102','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1012,'110206','Grocio Prado','1102','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1013,'110207','Pueblo Nuevo','1102','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1014,'110208','San Juan de Yanac','1102','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1015,'110209','San Pedro de Huacarpana','1102','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1016,'110210','Sunampe','1102','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1017,'110211','Tambo de Mora','1102','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1018,'110301','Nasca','1103','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1019,'110302','Changuillo','1103','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1020,'110303','El Ingenio','1103','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1021,'110304','Marcona','1103','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1022,'110305','Vista Alegre','1103','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1023,'110401','Palpa','1104','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1024,'110402','Llipata','1104','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1025,'110403','Río Grande','1104','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1026,'110404','Santa Cruz','1104','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1027,'110405','Tibillo','1104','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1028,'110501','Pisco','1105','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1029,'110502','Huancano','1105','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1030,'110503','Humay','1105','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1031,'110504','Independencia','1105','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1032,'110505','Paracas','1105','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1033,'110506','San Andrés','1105','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1034,'110507','San Clemente','1105','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1035,'110508','Tupac Amaru Inca','1105','11','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1036,'120101','Huancayo','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1037,'120104','Carhuacallanga','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1038,'120105','Chacapampa','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1039,'120106','Chicche','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1040,'120107','Chilca','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1041,'120108','Chongos Alto','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1042,'120111','Chupuro','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1043,'120112','Colca','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1044,'120113','Cullhuas','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1045,'120114','El Tambo','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1046,'120116','Huacrapuquio','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1047,'120117','Hualhuas','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1048,'120119','Huancan','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1049,'120120','Huasicancha','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1050,'120121','Huayucachi','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1051,'120122','Ingenio','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1052,'120124','Pariahuanca','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1053,'120125','Pilcomayo','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1054,'120126','Pucara','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1055,'120127','Quichuay','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1056,'120128','Quilcas','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1057,'120129','San Agustín','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1058,'120130','San Jerónimo de Tunan','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1059,'120132','Saño','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1060,'120133','Sapallanga','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1061,'120134','Sicaya','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1062,'120135','Santo Domingo de Acobamba','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1063,'120136','Viques','1201','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1064,'120201','Concepción','1202','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1065,'120202','Aco','1202','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1066,'120203','Andamarca','1202','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1067,'120204','Chambara','1202','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1068,'120205','Cochas','1202','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1069,'120206','Comas','1202','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1070,'120207','Heroínas Toledo','1202','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1071,'120208','Manzanares','1202','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1072,'120209','Mariscal Castilla','1202','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1073,'120210','Matahuasi','1202','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1074,'120211','Mito','1202','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1075,'120212','Nueve de Julio','1202','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1076,'120213','Orcotuna','1202','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1077,'120214','San José de Quero','1202','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1078,'120215','Santa Rosa de Ocopa','1202','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1079,'120301','Chanchamayo','1203','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1080,'120302','Perene','1203','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1081,'120303','Pichanaqui','1203','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1082,'120304','San Luis de Shuaro','1203','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1083,'120305','San Ramón','1203','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1084,'120306','Vitoc','1203','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1085,'120401','Jauja','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1086,'120402','Acolla','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1087,'120403','Apata','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1088,'120404','Ataura','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1089,'120405','Canchayllo','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1090,'120406','Curicaca','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1091,'120407','El Mantaro','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1092,'120408','Huamali','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1093,'120409','Huaripampa','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1094,'120410','Huertas','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1095,'120411','Janjaillo','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1096,'120412','Julcán','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1097,'120413','Leonor Ordóñez','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1098,'120414','Llocllapampa','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1099,'120415','Marco','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1100,'120416','Masma','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1101,'120417','Masma Chicche','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1102,'120418','Molinos','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1103,'120419','Monobamba','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1104,'120420','Muqui','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1105,'120421','Muquiyauyo','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1106,'120422','Paca','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1107,'120423','Paccha','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1108,'120424','Pancan','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1109,'120425','Parco','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1110,'120426','Pomacancha','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1111,'120427','Ricran','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1112,'120428','San Lorenzo','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1113,'120429','San Pedro de Chunan','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1114,'120430','Sausa','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1115,'120431','Sincos','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1116,'120432','Tunan Marca','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1117,'120433','Yauli','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1118,'120434','Yauyos','1204','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1119,'120501','Junin','1205','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1120,'120502','Carhuamayo','1205','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1121,'120503','Ondores','1205','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1122,'120504','Ulcumayo','1205','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1123,'120601','Satipo','1206','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1124,'120602','Coviriali','1206','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1125,'120603','Llaylla','1206','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1126,'120604','Mazamari','1206','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1127,'120605','Pampa Hermosa','1206','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1128,'120606','Pangoa','1206','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1129,'120607','Río Negro','1206','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1130,'120608','Río Tambo','1206','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1131,'120609','Vizcatan del Ene','1206','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1132,'120701','Tarma','1207','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1133,'120702','Acobamba','1207','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1134,'120703','Huaricolca','1207','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1135,'120704','Huasahuasi','1207','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1136,'120705','La Unión','1207','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1137,'120706','Palca','1207','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1138,'120707','Palcamayo','1207','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1139,'120708','San Pedro de Cajas','1207','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1140,'120709','Tapo','1207','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1141,'120801','La Oroya','1208','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1142,'120802','Chacapalpa','1208','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1143,'120803','Huay-Huay','1208','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1144,'120804','Marcapomacocha','1208','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1145,'120805','Morococha','1208','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1146,'120806','Paccha','1208','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1147,'120807','Santa Bárbara de Carhuacayan','1208','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1148,'120808','Santa Rosa de Sacco','1208','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1149,'120809','Suitucancha','1208','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1150,'120810','Yauli','1208','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1151,'120901','Chupaca','1209','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1152,'120902','Ahuac','1209','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1153,'120903','Chongos Bajo','1209','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1154,'120904','Huachac','1209','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1155,'120905','Huamancaca Chico','1209','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1156,'120906','San Juan de Iscos','1209','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1157,'120907','San Juan de Jarpa','1209','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1158,'120908','Tres de Diciembre','1209','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1159,'120909','Yanacancha','1209','12','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1160,'130101','Trujillo','1301','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1161,'130102','El Porvenir','1301','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1162,'130103','Florencia de Mora','1301','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1163,'130104','Huanchaco','1301','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1164,'130105','La Esperanza','1301','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1165,'130106','Laredo','1301','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1166,'130107','Moche','1301','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1167,'130108','Poroto','1301','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1168,'130109','Salaverry','1301','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1169,'130110','Simbal','1301','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1170,'130111','Victor Larco Herrera','1301','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1171,'130201','Ascope','1302','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1172,'130202','Chicama','1302','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1173,'130203','Chocope','1302','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1174,'130204','Magdalena de Cao','1302','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1175,'130205','Paijan','1302','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1176,'130206','Rázuri','1302','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1177,'130207','Santiago de Cao','1302','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1178,'130208','Casa Grande','1302','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1179,'130301','Bolívar','1303','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1180,'130302','Bambamarca','1303','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1181,'130303','Condormarca','1303','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1182,'130304','Longotea','1303','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1183,'130305','Uchumarca','1303','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1184,'130306','Ucuncha','1303','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1185,'130401','Chepen','1304','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1186,'130402','Pacanga','1304','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1187,'130403','Pueblo Nuevo','1304','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1188,'130501','Julcan','1305','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1189,'130502','Calamarca','1305','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1190,'130503','Carabamba','1305','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1191,'130504','Huaso','1305','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1192,'130601','Otuzco','1306','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1193,'130602','Agallpampa','1306','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1194,'130604','Charat','1306','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1195,'130605','Huaranchal','1306','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1196,'130606','La Cuesta','1306','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1197,'130608','Mache','1306','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1198,'130610','Paranday','1306','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1199,'130611','Salpo','1306','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1200,'130613','Sinsicap','1306','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1201,'130614','Usquil','1306','13','2026-02-11 04:01:14','2026-02-11 04:01:14'),(1202,'130701','San Pedro de Lloc','1307','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1203,'130702','Guadalupe','1307','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1204,'130703','Jequetepeque','1307','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1205,'130704','Pacasmayo','1307','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1206,'130705','San José','1307','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1207,'130801','Tayabamba','1308','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1208,'130802','Buldibuyo','1308','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1209,'130803','Chillia','1308','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1210,'130804','Huancaspata','1308','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1211,'130805','Huaylillas','1308','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1212,'130806','Huayo','1308','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1213,'130807','Ongon','1308','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1214,'130808','Parcoy','1308','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1215,'130809','Pataz','1308','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1216,'130810','Pias','1308','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1217,'130811','Santiago de Challas','1308','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1218,'130812','Taurija','1308','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1219,'130813','Urpay','1308','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1220,'130901','Huamachuco','1309','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1221,'130902','Chugay','1309','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1222,'130903','Cochorco','1309','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1223,'130904','Curgos','1309','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1224,'130905','Marcabal','1309','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1225,'130906','Sanagoran','1309','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1226,'130907','Sarin','1309','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1227,'130908','Sartimbamba','1309','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1228,'131001','Santiago de Chuco','1310','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1229,'131002','Angasmarca','1310','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1230,'131003','Cachicadan','1310','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1231,'131004','Mollebamba','1310','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1232,'131005','Mollepata','1310','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1233,'131006','Quiruvilca','1310','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1234,'131007','Santa Cruz de Chuca','1310','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1235,'131008','Sitabamba','1310','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1236,'131101','Cascas','1311','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1237,'131102','Lucma','1311','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1238,'131103','Marmot','1311','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1239,'131104','Sayapullo','1311','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1240,'131201','Viru','1312','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1241,'131202','Chao','1312','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1242,'131203','Guadalupito','1312','13','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1243,'140101','Chiclayo','1401','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1244,'140102','Chongoyape','1401','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1245,'140103','Eten','1401','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1246,'140104','Eten Puerto','1401','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1247,'140105','José Leonardo Ortiz','1401','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1248,'140106','La Victoria','1401','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1249,'140107','Lagunas','1401','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1250,'140108','Monsefu','1401','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1251,'140109','Nueva Arica','1401','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1252,'140110','Oyotun','1401','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1253,'140111','Picsi','1401','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1254,'140112','Pimentel','1401','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1255,'140113','Reque','1401','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1256,'140114','Santa Rosa','1401','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1257,'140115','Saña','1401','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1258,'140116','Cayalti','1401','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1259,'140117','Patapo','1401','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1260,'140118','Pomalca','1401','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1261,'140119','Pucala','1401','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1262,'140120','Tuman','1401','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1263,'140201','Ferreñafe','1402','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1264,'140202','Cañaris','1402','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1265,'140203','Incahuasi','1402','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1266,'140204','Manuel Antonio Mesones Muro','1402','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1267,'140205','Pitipo','1402','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1268,'140206','Pueblo Nuevo','1402','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1269,'140301','Lambayeque','1403','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1270,'140302','Chochope','1403','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1271,'140303','Illimo','1403','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1272,'140304','Jayanca','1403','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1273,'140305','Mochumi','1403','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1274,'140306','Morrope','1403','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1275,'140307','Motupe','1403','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1276,'140308','Olmos','1403','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1277,'140309','Pacora','1403','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1278,'140310','Salas','1403','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1279,'140311','San José','1403','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1280,'140312','Tucume','1403','14','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1281,'150101','Lima','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1282,'150102','Ancón','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1283,'150103','Ate','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1284,'150104','Barranco','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1285,'150105','Breña','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1286,'150106','Carabayllo','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1287,'150107','Chaclacayo','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1288,'150108','Chorrillos','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1289,'150109','Cieneguilla','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1290,'150110','Comas','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1291,'150111','El Agustino','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1292,'150112','Independencia','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1293,'150113','Jesús María','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1294,'150114','La Molina','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1295,'150115','La Victoria','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1296,'150116','Lince','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1297,'150117','Los Olivos','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1298,'150118','Lurigancho','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1299,'150119','Lurin','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1300,'150120','Magdalena del Mar','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1301,'150121','Pueblo Libre','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1302,'150122','Miraflores','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1303,'150123','Pachacamac','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1304,'150124','Pucusana','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1305,'150125','Puente Piedra','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1306,'150126','Punta Hermosa','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1307,'150127','Punta Negra','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1308,'150128','Rímac','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1309,'150129','San Bartolo','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1310,'150130','San Borja','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1311,'150131','San Isidro','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1312,'150132','San Juan de Lurigancho','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1313,'150133','San Juan de Miraflores','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1314,'150134','San Luis','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1315,'150135','San Martín de Porres','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1316,'150136','San Miguel','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1317,'150137','Santa Anita','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1318,'150138','Santa María del Mar','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1319,'150139','Santa Rosa','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1320,'150140','Santiago de Surco','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1321,'150141','Surquillo','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1322,'150142','Villa El Salvador','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1323,'150143','Villa María del Triunfo','1501','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1324,'150201','Barranca','1502','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1325,'150202','Paramonga','1502','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1326,'150203','Pativilca','1502','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1327,'150204','Supe','1502','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1328,'150205','Supe Puerto','1502','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1329,'150301','Cajatambo','1503','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1330,'150302','Copa','1503','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1331,'150303','Gorgor','1503','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1332,'150304','Huancapon','1503','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1333,'150305','Manas','1503','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1334,'150401','Canta','1504','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1335,'150402','Arahuay','1504','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1336,'150403','Huamantanga','1504','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1337,'150404','Huaros','1504','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1338,'150405','Lachaqui','1504','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1339,'150406','San Buenaventura','1504','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1340,'150407','Santa Rosa de Quives','1504','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1341,'150501','San Vicente de Cañete','1505','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1342,'150502','Asia','1505','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1343,'150503','Calango','1505','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1344,'150504','Cerro Azul','1505','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1345,'150505','Chilca','1505','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1346,'150506','Coayllo','1505','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1347,'150507','Imperial','1505','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1348,'150508','Lunahuana','1505','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1349,'150509','Mala','1505','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1350,'150510','Nuevo Imperial','1505','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1351,'150511','Pacaran','1505','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1352,'150512','Quilmana','1505','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1353,'150513','San Antonio','1505','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1354,'150514','San Luis','1505','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1355,'150515','Santa Cruz de Flores','1505','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1356,'150516','Zúñiga','1505','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1357,'150601','Huaral','1506','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1358,'150602','Atavillos Alto','1506','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1359,'150603','Atavillos Bajo','1506','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1360,'150604','Aucallama','1506','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1361,'150605','Chancay','1506','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1362,'150606','Ihuari','1506','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1363,'150607','Lampian','1506','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1364,'150608','Pacaraos','1506','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1365,'150609','San Miguel de Acos','1506','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1366,'150610','Santa Cruz de Andamarca','1506','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1367,'150611','Sumbilca','1506','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1368,'150612','Veintisiete de Noviembre','1506','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1369,'150701','Matucana','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1370,'150702','Antioquia','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1371,'150703','Callahuanca','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1372,'150704','Carampoma','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1373,'150705','Chicla','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1374,'150706','Cuenca','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1375,'150707','Huachupampa','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1376,'150708','Huanza','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1377,'150709','Huarochiri','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1378,'150710','Lahuaytambo','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1379,'150711','Langa','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1380,'150712','Laraos','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1381,'150713','Mariatana','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1382,'150714','Ricardo Palma','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1383,'150715','San Andrés de Tupicocha','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1384,'150716','San Antonio','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1385,'150717','San Bartolomé','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1386,'150718','San Damian','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1387,'150719','San Juan de Iris','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1388,'150720','San Juan de Tantaranche','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1389,'150721','San Lorenzo de Quinti','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1390,'150722','San Mateo','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1391,'150723','San Mateo de Otao','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1392,'150724','San Pedro de Casta','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1393,'150725','San Pedro de Huancayre','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1394,'150726','Sangallaya','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1395,'150727','Santa Cruz de Cocachacra','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1396,'150728','Santa Eulalia','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1397,'150729','Santiago de Anchucaya','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1398,'150730','Santiago de Tuna','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1399,'150731','Santo Domingo de Los Olleros','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1400,'150732','Surco','1507','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1401,'150801','Huacho','1508','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1402,'150802','Ambar','1508','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1403,'150803','Caleta de Carquin','1508','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1404,'150804','Checras','1508','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1405,'150805','Hualmay','1508','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1406,'150806','Huaura','1508','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1407,'150807','Leoncio Prado','1508','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1408,'150808','Paccho','1508','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1409,'150809','Santa Leonor','1508','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1410,'150810','Santa María','1508','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1411,'150811','Sayan','1508','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1412,'150812','Vegueta','1508','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1413,'150901','Oyon','1509','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1414,'150902','Andajes','1509','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1415,'150903','Caujul','1509','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1416,'150904','Cochamarca','1509','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1417,'150905','Navan','1509','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1418,'150906','Pachangara','1509','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1419,'151001','Yauyos','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1420,'151002','Alis','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1421,'151003','Allauca','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1422,'151004','Ayaviri','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1423,'151005','Azángaro','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1424,'151006','Cacra','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1425,'151007','Carania','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1426,'151008','Catahuasi','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1427,'151009','Chocos','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1428,'151010','Cochas','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1429,'151011','Colonia','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1430,'151012','Hongos','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1431,'151013','Huampara','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1432,'151014','Huancaya','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1433,'151015','Huangascar','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1434,'151016','Huantan','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1435,'151017','Huañec','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1436,'151018','Laraos','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1437,'151019','Lincha','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1438,'151020','Madean','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1439,'151021','Miraflores','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1440,'151022','Omas','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1441,'151023','Putinza','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1442,'151024','Quinches','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1443,'151025','Quinocay','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1444,'151026','San Joaquín','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1445,'151027','San Pedro de Pilas','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1446,'151028','Tanta','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1447,'151029','Tauripampa','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1448,'151030','Tomas','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1449,'151031','Tupe','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1450,'151032','Viñac','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1451,'151033','Vitis','1510','15','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1452,'160101','Iquitos','1601','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1453,'160102','Alto Nanay','1601','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1454,'160103','Fernando Lores','1601','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1455,'160104','Indiana','1601','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1456,'160105','Las Amazonas','1601','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1457,'160106','Mazan','1601','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1458,'160107','Napo','1601','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1459,'160108','Punchana','1601','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1460,'160110','Torres Causana','1601','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1461,'160112','Belén','1601','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1462,'160113','San Juan Bautista','1601','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1463,'160201','Yurimaguas','1602','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1464,'160202','Balsapuerto','1602','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1465,'160205','Jeberos','1602','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1466,'160206','Lagunas','1602','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1467,'160210','Santa Cruz','1602','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1468,'160211','Teniente Cesar López Rojas','1602','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1469,'160301','Nauta','1603','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1470,'160302','Parinari','1603','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1471,'160303','Tigre','1603','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1472,'160304','Trompeteros','1603','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1473,'160305','Urarinas','1603','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1474,'160401','Ramón Castilla','1604','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1475,'160402','Pebas','1604','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1476,'160403','Yavari','1604','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1477,'160404','San Pablo','1604','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1478,'160501','Requena','1605','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1479,'160502','Alto Tapiche','1605','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1480,'160503','Capelo','1605','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1481,'160504','Emilio San Martín','1605','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1482,'160505','Maquia','1605','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1483,'160506','Puinahua','1605','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1484,'160507','Saquena','1605','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1485,'160508','Soplin','1605','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1486,'160509','Tapiche','1605','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1487,'160510','Jenaro Herrera','1605','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1488,'160511','Yaquerana','1605','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1489,'160601','Contamana','1606','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1490,'160602','Inahuaya','1606','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1491,'160603','Padre Márquez','1606','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1492,'160604','Pampa Hermosa','1606','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1493,'160605','Sarayacu','1606','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1494,'160606','Vargas Guerra','1606','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1495,'160701','Barranca','1607','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1496,'160702','Cahuapanas','1607','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1497,'160703','Manseriche','1607','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1498,'160704','Morona','1607','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1499,'160705','Pastaza','1607','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1500,'160706','Andoas','1607','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1501,'160801','Putumayo','1608','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1502,'160802','Rosa Panduro','1608','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1503,'160803','Teniente Manuel Clavero','1608','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1504,'160804','Yaguas','1608','16','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1505,'170101','Tambopata','1701','17','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1506,'170102','Inambari','1701','17','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1507,'170103','Las Piedras','1701','17','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1508,'170104','Laberinto','1701','17','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1509,'170201','Manu','1702','17','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1510,'170202','Fitzcarrald','1702','17','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1511,'170203','Madre de Dios','1702','17','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1512,'170204','Huepetuhe','1702','17','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1513,'170301','Iñapari','1703','17','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1514,'170302','Iberia','1703','17','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1515,'170303','Tahuamanu','1703','17','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1516,'180101','Moquegua','1801','18','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1517,'180102','Carumas','1801','18','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1518,'180103','Cuchumbaya','1801','18','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1519,'180104','Samegua','1801','18','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1520,'180105','San Cristóbal','1801','18','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1521,'180106','Torata','1801','18','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1522,'180201','Omate','1802','18','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1523,'180202','Chojata','1802','18','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1524,'180203','Coalaque','1802','18','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1525,'180204','Ichuña','1802','18','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1526,'180205','La Capilla','1802','18','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1527,'180206','Lloque','1802','18','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1528,'180207','Matalaque','1802','18','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1529,'180208','Puquina','1802','18','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1530,'180209','Quinistaquillas','1802','18','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1531,'180210','Ubinas','1802','18','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1532,'180211','Yunga','1802','18','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1533,'180301','Ilo','1803','18','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1534,'180302','El Algarrobal','1803','18','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1535,'180303','Pacocha','1803','18','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1536,'190101','Chaupimarca','1901','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1537,'190102','Huachon','1901','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1538,'190103','Huariaca','1901','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1539,'190104','Huayllay','1901','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1540,'190105','Ninacaca','1901','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1541,'190106','Pallanchacra','1901','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1542,'190107','Paucartambo','1901','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1543,'190108','San Francisco de Asís de Yarusyacan','1901','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1544,'190109','Simon Bolívar','1901','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1545,'190110','Ticlacayan','1901','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1546,'190111','Tinyahuarco','1901','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1547,'190112','Vicco','1901','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1548,'190113','Yanacancha','1901','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1549,'190201','Yanahuanca','1902','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1550,'190202','Chacayan','1902','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1551,'190203','Goyllarisquizga','1902','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1552,'190204','Paucar','1902','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1553,'190205','San Pedro de Pillao','1902','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1554,'190206','Santa Ana de Tusi','1902','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1555,'190207','Tapuc','1902','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1556,'190208','Vilcabamba','1902','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1557,'190301','Oxapampa','1903','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1558,'190302','Chontabamba','1903','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1559,'190303','Huancabamba','1903','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1560,'190304','Palcazu','1903','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1561,'190305','Pozuzo','1903','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1562,'190306','Puerto Bermúdez','1903','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1563,'190307','Villa Rica','1903','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1564,'190308','Constitución','1903','19','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1565,'200101','Piura','2001','20','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1566,'200104','Castilla','2001','20','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1567,'200105','Catacaos','2001','20','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1568,'200107','Cura Mori','2001','20','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1569,'200108','El Tallan','2001','20','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1570,'200109','La Arena','2001','20','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1571,'200110','La Unión','2001','20','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1572,'200111','Las Lomas','2001','20','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1573,'200114','Tambo Grande','2001','20','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1574,'200115','Veintiseis de Octubre','2001','20','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1575,'200201','Ayabaca','2002','20','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1576,'200202','Frias','2002','20','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1577,'200203','Jilili','2002','20','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1578,'200204','Lagunas','2002','20','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1579,'200205','Montero','2002','20','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1580,'200206','Pacaipampa','2002','20','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1581,'200207','Paimas','2002','20','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1582,'200208','Sapillica','2002','20','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1583,'200209','Sicchez','2002','20','2026-02-11 04:01:15','2026-02-11 04:01:15'),(1584,'200210','Suyo','2002','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1585,'200301','Huancabamba','2003','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1586,'200302','Canchaque','2003','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1587,'200303','El Carmen de la Frontera','2003','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1588,'200304','Huarmaca','2003','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1589,'200305','Lalaquiz','2003','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1590,'200306','San Miguel de El Faique','2003','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1591,'200307','Sondor','2003','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1592,'200308','Sondorillo','2003','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1593,'200401','Chulucanas','2004','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1594,'200402','Buenos Aires','2004','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1595,'200403','Chalaco','2004','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1596,'200404','La Matanza','2004','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1597,'200405','Morropon','2004','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1598,'200406','Salitral','2004','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1599,'200407','San Juan de Bigote','2004','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1600,'200408','Santa Catalina de Mossa','2004','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1601,'200409','Santo Domingo','2004','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1602,'200410','Yamango','2004','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1603,'200501','Paita','2005','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1604,'200502','Amotape','2005','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1605,'200503','Arenal','2005','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1606,'200504','Colan','2005','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1607,'200505','La Huaca','2005','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1608,'200506','Tamarindo','2005','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1609,'200507','Vichayal','2005','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1610,'200601','Sullana','2006','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1611,'200602','Bellavista','2006','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1612,'200603','Ignacio Escudero','2006','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1613,'200604','Lancones','2006','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1614,'200605','Marcavelica','2006','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1615,'200606','Miguel Checa','2006','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1616,'200607','Querecotillo','2006','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1617,'200608','Salitral','2006','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1618,'200701','Pariñas','2007','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1619,'200702','El Alto','2007','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1620,'200703','La Brea','2007','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1621,'200704','Lobitos','2007','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1622,'200705','Los Organos','2007','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1623,'200706','Mancora','2007','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1624,'200801','Sechura','2008','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1625,'200802','Bellavista de la Unión','2008','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1626,'200803','Bernal','2008','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1627,'200804','Cristo Nos Valga','2008','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1628,'200805','Vice','2008','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1629,'200806','Rinconada Llicuar','2008','20','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1630,'210101','Puno','2101','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1631,'210102','Acora','2101','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1632,'210103','Amantani','2101','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1633,'210104','Atuncolla','2101','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1634,'210105','Capachica','2101','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1635,'210106','Chucuito','2101','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1636,'210107','Coata','2101','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1637,'210108','Huata','2101','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1638,'210109','Mañazo','2101','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1639,'210110','Paucarcolla','2101','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1640,'210111','Pichacani','2101','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1641,'210112','Plateria','2101','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1642,'210113','San Antonio','2101','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1643,'210114','Tiquillaca','2101','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1644,'210115','Vilque','2101','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1645,'210201','Azángaro','2102','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1646,'210202','Achaya','2102','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1647,'210203','Arapa','2102','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1648,'210204','Asillo','2102','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1649,'210205','Caminaca','2102','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1650,'210206','Chupa','2102','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1651,'210207','José Domingo Choquehuanca','2102','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1652,'210208','Muñani','2102','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1653,'210209','Potoni','2102','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1654,'210210','Saman','2102','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1655,'210211','San Anton','2102','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1656,'210212','San José','2102','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1657,'210213','San Juan de Salinas','2102','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1658,'210214','Santiago de Pupuja','2102','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1659,'210215','Tirapata','2102','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1660,'210301','Macusani','2103','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1661,'210302','Ajoyani','2103','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1662,'210303','Ayapata','2103','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1663,'210304','Coasa','2103','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1664,'210305','Corani','2103','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1665,'210306','Crucero','2103','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1666,'210307','Ituata','2103','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1667,'210308','Ollachea','2103','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1668,'210309','San Gaban','2103','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1669,'210310','Usicayos','2103','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1670,'210401','Juli','2104','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1671,'210402','Desaguadero','2104','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1672,'210403','Huacullani','2104','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1673,'210404','Kelluyo','2104','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1674,'210405','Pisacoma','2104','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1675,'210406','Pomata','2104','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1676,'210407','Zepita','2104','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1677,'210501','Ilave','2105','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1678,'210502','Capazo','2105','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1679,'210503','Pilcuyo','2105','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1680,'210504','Santa Rosa','2105','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1681,'210505','Conduriri','2105','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1682,'210601','Huancane','2106','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1683,'210602','Cojata','2106','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1684,'210603','Huatasani','2106','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1685,'210604','Inchupalla','2106','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1686,'210605','Pusi','2106','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1687,'210606','Rosaspata','2106','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1688,'210607','Taraco','2106','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1689,'210608','Vilque Chico','2106','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1690,'210701','Lampa','2107','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1691,'210702','Cabanilla','2107','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1692,'210703','Calapuja','2107','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1693,'210704','Nicasio','2107','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1694,'210705','Ocuviri','2107','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1695,'210706','Palca','2107','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1696,'210707','Paratia','2107','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1697,'210708','Pucara','2107','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1698,'210709','Santa Lucia','2107','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1699,'210710','Vilavila','2107','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1700,'210801','Ayaviri','2108','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1701,'210802','Antauta','2108','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1702,'210803','Cupi','2108','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1703,'210804','Llalli','2108','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1704,'210805','Macari','2108','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1705,'210806','Nuñoa','2108','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1706,'210807','Orurillo','2108','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1707,'210808','Santa Rosa','2108','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1708,'210809','Umachiri','2108','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1709,'210901','Moho','2109','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1710,'210902','Conima','2109','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1711,'210903','Huayrapata','2109','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1712,'210904','Tilali','2109','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1713,'211001','Putina','2110','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1714,'211002','Ananea','2110','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1715,'211003','Pedro Vilca Apaza','2110','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1716,'211004','Quilcapuncu','2110','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1717,'211005','Sina','2110','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1718,'211101','Juliaca','2111','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1719,'211102','Cabana','2111','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1720,'211103','Cabanillas','2111','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1721,'211104','Caracoto','2111','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1722,'211105','San Miguel','2111','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1723,'211201','Sandia','2112','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1724,'211202','Cuyocuyo','2112','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1725,'211203','Limbani','2112','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1726,'211204','Patambuco','2112','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1727,'211205','Phara','2112','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1728,'211206','Quiaca','2112','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1729,'211207','San Juan del Oro','2112','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1730,'211208','Yanahuaya','2112','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1731,'211209','Alto Inambari','2112','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1732,'211210','San Pedro de Putina Punco','2112','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1733,'211301','Yunguyo','2113','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1734,'211302','Anapia','2113','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1735,'211303','Copani','2113','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1736,'211304','Cuturapi','2113','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1737,'211305','Ollaraya','2113','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1738,'211306','Tinicachi','2113','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1739,'211307','Unicachi','2113','21','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1740,'220101','Moyobamba','2201','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1741,'220102','Calzada','2201','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1742,'220103','Habana','2201','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1743,'220104','Jepelacio','2201','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1744,'220105','Soritor','2201','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1745,'220106','Yantalo','2201','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1746,'220201','Bellavista','2202','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1747,'220202','Alto Biavo','2202','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1748,'220203','Bajo Biavo','2202','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1749,'220204','Huallaga','2202','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1750,'220205','San Pablo','2202','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1751,'220206','San Rafael','2202','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1752,'220301','San José de Sisa','2203','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1753,'220302','Agua Blanca','2203','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1754,'220303','San Martín','2203','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1755,'220304','Santa Rosa','2203','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1756,'220305','Shatoja','2203','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1757,'220401','Saposoa','2204','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1758,'220402','Alto Saposoa','2204','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1759,'220403','El Eslabón','2204','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1760,'220404','Piscoyacu','2204','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1761,'220405','Sacanche','2204','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1762,'220406','Tingo de Saposoa','2204','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1763,'220501','Lamas','2205','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1764,'220502','Alonso de Alvarado','2205','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1765,'220503','Barranquita','2205','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1766,'220504','Caynarachi','2205','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1767,'220505','Cuñumbuqui','2205','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1768,'220506','Pinto Recodo','2205','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1769,'220507','Rumisapa','2205','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1770,'220508','San Roque de Cumbaza','2205','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1771,'220509','Shanao','2205','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1772,'220510','Tabalosos','2205','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1773,'220511','Zapatero','2205','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1774,'220601','Juanjuí','2206','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1775,'220602','Campanilla','2206','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1776,'220603','Huicungo','2206','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1777,'220604','Pachiza','2206','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1778,'220605','Pajarillo','2206','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1779,'220701','Picota','2207','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1780,'220702','Buenos Aires','2207','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1781,'220703','Caspisapa','2207','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1782,'220704','Pilluana','2207','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1783,'220705','Pucacaca','2207','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1784,'220706','San Cristóbal','2207','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1785,'220707','San Hilarión','2207','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1786,'220708','Shamboyacu','2207','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1787,'220709','Tingo de Ponasa','2207','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1788,'220710','Tres Unidos','2207','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1789,'220801','Rioja','2208','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1790,'220802','Awajun','2208','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1791,'220803','Elías Soplin Vargas','2208','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1792,'220804','Nueva Cajamarca','2208','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1793,'220805','Pardo Miguel','2208','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1794,'220806','Posic','2208','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1795,'220807','San Fernando','2208','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1796,'220808','Yorongos','2208','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1797,'220809','Yuracyacu','2208','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1798,'220901','Tarapoto','2209','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1799,'220902','Alberto Leveau','2209','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1800,'220903','Cacatachi','2209','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1801,'220904','Chazuta','2209','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1802,'220905','Chipurana','2209','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1803,'220906','El Porvenir','2209','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1804,'220907','Huimbayoc','2209','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1805,'220908','Juan Guerra','2209','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1806,'220909','La Banda de Shilcayo','2209','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1807,'220910','Morales','2209','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1808,'220911','Papaplaya','2209','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1809,'220912','San Antonio','2209','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1810,'220913','Sauce','2209','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1811,'220914','Shapaja','2209','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1812,'221001','Tocache','2210','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1813,'221002','Nuevo Progreso','2210','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1814,'221003','Polvora','2210','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1815,'221004','Shunte','2210','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1816,'221005','Uchiza','2210','22','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1817,'230101','Tacna','2301','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1818,'230102','Alto de la Alianza','2301','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1819,'230103','Calana','2301','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1820,'230104','Ciudad Nueva','2301','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1821,'230105','Inclan','2301','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1822,'230106','Pachia','2301','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1823,'230107','Palca','2301','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1824,'230108','Pocollay','2301','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1825,'230109','Sama','2301','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1826,'230110','Coronel Gregorio Albarracín Lanchipa','2301','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1827,'230111','La Yarada los Palos','2301','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1828,'230201','Candarave','2302','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1829,'230202','Cairani','2302','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1830,'230203','Camilaca','2302','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1831,'230204','Curibaya','2302','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1832,'230205','Huanuara','2302','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1833,'230206','Quilahuani','2302','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1834,'230301','Locumba','2303','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1835,'230302','Ilabaya','2303','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1836,'230303','Ite','2303','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1837,'230401','Tarata','2304','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1838,'230402','Héroes Albarracín','2304','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1839,'230403','Estique','2304','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1840,'230404','Estique-Pampa','2304','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1841,'230405','Sitajara','2304','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1842,'230406','Susapaya','2304','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1843,'230407','Tarucachi','2304','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1844,'230408','Ticaco','2304','23','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1845,'240101','Tumbes','2401','24','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1846,'240102','Corrales','2401','24','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1847,'240103','La Cruz','2401','24','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1848,'240104','Pampas de Hospital','2401','24','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1849,'240105','San Jacinto','2401','24','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1850,'240106','San Juan de la Virgen','2401','24','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1851,'240201','Zorritos','2402','24','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1852,'240202','Casitas','2402','24','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1853,'240203','Canoas de Punta Sal','2402','24','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1854,'240301','Zarumilla','2403','24','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1855,'240302','Aguas Verdes','2403','24','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1856,'240303','Matapalo','2403','24','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1857,'240304','Papayal','2403','24','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1858,'250101','Calleria','2501','25','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1859,'250102','Campoverde','2501','25','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1860,'250103','Iparia','2501','25','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1861,'250104','Masisea','2501','25','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1862,'250105','Yarinacocha','2501','25','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1863,'250106','Nueva Requena','2501','25','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1864,'250107','Manantay','2501','25','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1865,'250201','Raymondi','2502','25','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1866,'250202','Sepahua','2502','25','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1867,'250203','Tahuania','2502','25','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1868,'250204','Yurua','2502','25','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1869,'250301','Padre Abad','2503','25','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1870,'250302','Irazola','2503','25','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1871,'250303','Curimana','2503','25','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1872,'250304','Neshuya','2503','25','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1873,'250305','Alexander Von Humboldt','2503','25','2026-02-11 04:01:16','2026-02-11 04:01:16'),(1874,'250401','Purus','2504','25','2026-02-11 04:01:16','2026-02-11 04:01:16');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
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
-- Table structure for table `identity_document_types`
--

DROP TABLE IF EXISTS `identity_document_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identity_document_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(1) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `descripcion_documento` varchar(255) NOT NULL,
  `estado` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identity_document_types`
--

LOCK TABLES `identity_document_types` WRITE;
/*!40000 ALTER TABLE `identity_document_types` DISABLE KEYS */;
INSERT INTO `identity_document_types` VALUES (1,'0','OTRO TIPO DE DOCUMENTO','OTROS',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(2,'1','DOCUMENTO NACIONAL DE IDENTIDAD (DNI)','DNI',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(3,'4','CARNET DE EXTRANJERIA','CARNET DE EXTRANJERIA',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(4,'6','REGISTRO ÚNICO DE CONTRIBUYENTES (RUC)','RUC',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(5,'7','PASAPORTE','PASAPORTE',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(6,'A','CÉDULA DIPLOMÁTICA DE IDENTIDAD','CÉDULA DIPLOMÁTICA DE IDENTIDAD',1,'2026-02-11 04:01:11','2026-02-11 04:01:11');
/*!40000 ALTER TABLE `identity_document_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `igv_type_affections`
--

DROP TABLE IF EXISTS `igv_type_affections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `igv_type_affections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(2) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `tipo` varchar(5) NOT NULL,
  `estado` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `igv_type_affections`
--

LOCK TABLES `igv_type_affections` WRITE;
/*!40000 ALTER TABLE `igv_type_affections` DISABLE KEYS */;
INSERT INTO `igv_type_affections` VALUES (1,'10','Gravado - Operación Onerosa','GRAV',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(2,'11','Gravado - Retiro por premio','GRAV',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(3,'12','Gravado - Retiro por donación','GRAV',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(4,'13','Gravado - Retiro','GRAV',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(5,'14','Gravado - Retiro por publicidad','GRAV',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(6,'15','Gravado - Bonificaciones','GRAV',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(7,'16','Gravado - Retiro por entrega a trabajadores','GRAV',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(8,'16','Gravado - Retiro por entrega a trabajadores','GRAV',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(9,'17','Gravado - IVAP','GRAV',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(10,'20','Exonerado - Operación Onerosa','EXO',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(11,'21','Exonerado - Transferencia Gratuita','EXO',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(12,'30','Inafecto - Operación Onerosa','INA',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(13,'31','Inafecto - Retiro por Bonificación','INA',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(14,'32','Inafecto - Retiro','INA',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(15,'33','Inafecto - Retiro por Muestras Médica','INA',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(16,'34','Inafecto -  Retiro por Convenio Colectivo','INA',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(17,'35','Inafecto - Retiro por premio','INA',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(18,'36','Inafecto -  Retiro por publicidad','INA',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(19,'40','Exportación','EXP',0,'2026-02-11 04:01:11','2026-02-11 04:01:11');
/*!40000 ALTER TABLE `igv_type_affections` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2021_10_22_195703_create_profiles_table',1),(6,'2022_10_07_154726_create_type_documents_table',1),(7,'2022_10_07_160522_create_currencies_table',1),(8,'2022_10_07_161225_create_units_table',1),(9,'2022_10_07_164447_create_countries_table',1),(10,'2022_10_07_170540_create_identity_document_types_table',1),(11,'2022_10_07_172856_create_igv_type_affections_table',1),(12,'2022_10_07_174344_create_credit_note_types_table',1),(13,'2022_10_07_175006_create_debit_note_types_table',1),(14,'2022_10_08_153104_create_departments_table',1),(15,'2022_10_08_153802_create_provinces_table',1),(16,'2022_10_08_154950_create_districts_table',1),(17,'2022_10_08_190738_create_sunat_users_table',1),(18,'2022_10_08_191503_create_businesses_table',1),(19,'2022_10_10_162132_create_clients_table',1),(20,'2022_10_12_184835_create_products_table',1),(21,'2022_10_13_173447_create_billings_table',1),(22,'2022_10_14_124701_create_series_table',1),(23,'2022_12_05_192023_create_pay_modes_table',1),(24,'2022_12_12_093151_create_cashes_table',1),(25,'2022_12_12_112839_create_arching_cashes_table',1),(26,'2023_01_16_121809_create_quotes_table',1),(27,'2023_03_09_161659_create_providers_table',1),(28,'2023_03_10_093059_create_bills_table',1),(29,'2023_03_10_093843_create_purchase_descriptions_table',1),(30,'2023_03_11_201342_create_buys_table',1),(31,'2023_03_13_113214_create_detail_buys_table',1),(32,'2023_04_28_183054_create_sale_notes_table',1),(33,'2023_04_28_183853_create_detail_sale_notes_table',1),(34,'2023_05_19_123626_create_services_table',1),(35,'2023_11_18_222509_create_detail_billings_table',1),(36,'2023_12_07_124858_create_detail_quotes_table',1),(37,'2023_12_21_201323_create_detail_payments_table',1),(38,'2023_12_22_105015_create_get_bf_stored_procedures',1),(39,'2023_12_22_112438_create_get_detail_bf_stored_procedures',1),(40,'2023_12_22_151030_create_get_list_billings_stored_procedures',1),(41,'2023_12_22_152339_create_get_list_products_stored_procedures',1),(42,'2023_12_24_001615_create_get_list_credit_notes_stored_procedures',1),(43,'2023_12_24_181450_create_get_list_sale_notes_stored_procedures',1),(44,'2023_12_24_202355_create_get_list_sale_notes_cash_stored_procedures',1),(45,'2023_12_24_202653_create_get_list_billings_cash_stored_procedures',1),(46,'2023_12_28_081743_create_get_list_products_data_stored_procedures',1),(47,'2024_01_03_173517_create_permission_tables',1),(48,'2024_04_17_183553_create_categories_table',1),(49,'2024_04_18_085045_create_restaurants_table',1),(50,'2024_04_18_101440_create_detail_publicities_table',1),(51,'2024_04_22_172244_create_comments_table',1),(52,'2024_04_24_174720_create_orders_table',1),(53,'2024_04_24_175603_create_detail_orders_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1),(2,'App\\Models\\User',2),(3,'App\\Models\\User',3);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_envio` int(11) DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time DEFAULT NULL,
  `exonerada` decimal(18,2) NOT NULL,
  `inafecta` decimal(18,2) NOT NULL,
  `gravada` decimal(18,2) NOT NULL,
  `anticipo` decimal(18,2) NOT NULL,
  `igv` decimal(18,2) NOT NULL,
  `gratuita` decimal(18,2) NOT NULL,
  `otros_cargos` decimal(18,2) NOT NULL,
  `total` decimal(18,2) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `idpago` int(11) DEFAULT NULL,
  `comentarios` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_modes`
--

DROP TABLE IF EXISTS `pay_modes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_modes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_modes`
--

LOCK TABLES `pay_modes` WRITE;
/*!40000 ALTER TABLE `pay_modes` DISABLE KEYS */;
INSERT INTO `pay_modes` VALUES (1,'Efectivo','2026-02-11 04:01:16','2026-02-11 04:01:16'),(2,'Yape','2026-02-11 04:01:16','2026-02-11 04:01:16'),(3,'Plin','2026-02-11 04:01:16','2026-02-11 04:01:16'),(4,'Tunki','2026-02-11 04:01:16','2026-02-11 04:01:16'),(5,'Tarjeta de crédito','2026-02-11 04:01:16','2026-02-11 04:01:16'),(6,'Tarjeta de débito','2026-02-11 04:01:16','2026-02-11 04:01:16'),(7,'Transferencia','2026-02-11 04:01:16','2026-02-11 04:01:16'),(8,'Cheque','2026-02-11 04:01:16','2026-02-11 04:01:16');
/*!40000 ALTER TABLE `pay_modes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'admin.business','Ver información de empresa','web','2026-02-11 04:01:16','2026-02-11 04:01:16'),(2,'admin.buys','Ver compras','web','2026-02-11 04:01:16','2026-02-11 04:01:16'),(3,'admin.create_buy','Registrar nueva compra','web','2026-02-11 04:01:16','2026-02-11 04:01:16'),(4,'admin.bills','Ver gastos','web','2026-02-11 04:01:16','2026-02-11 04:01:16'),(5,'admin.products','Ver productos','web','2026-02-11 04:01:16','2026-02-11 04:01:16'),(6,'admin.users','Ver usuarios','web','2026-02-11 04:01:16','2026-02-11 04:01:16'),(7,'admin.roles','Ver roles','web','2026-02-11 04:01:16','2026-02-11 04:01:16'),(8,'admin.prices','Ver precios','web','2026-02-11 04:01:16','2026-02-11 04:01:16'),(9,'admin.faq','Ver preguntas frecuentes','web','2026-02-11 04:01:16','2026-02-11 04:01:16');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo_interno` varchar(255) DEFAULT NULL,
  `codigo_barras` varchar(255) DEFAULT NULL,
  `codigo_sunat` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `presentacion` varchar(255) DEFAULT NULL,
  `idcategoria` int(11) DEFAULT NULL,
  `idunidad` int(11) NOT NULL,
  `idcodigo_igv` varchar(255) NOT NULL,
  `igv` double(8,2) NOT NULL,
  `precio_compra` decimal(18,2) NOT NULL,
  `precio_venta` decimal(18,2) NOT NULL,
  `impuesto` int(11) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `opcion` int(11) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'000001',NULL,'00000000','CHEESE',NULL,NULL,2,61,'10',0.00,0.00,12.00,0,NULL,NULL,1,'hamburguesa-cheese-royal.png','2026-02-11 04:01:16','2026-02-11 04:01:16'),(2,'000002',NULL,'00000000','COCA COLA',NULL,NULL,4,61,'10',0.00,0.00,4.00,0,NULL,NULL,1,'coca-cola.png','2026-02-11 04:01:16','2026-02-11 04:01:16'),(3,'000003',NULL,'00000000','ROYAL',NULL,NULL,2,61,'10',0.00,0.00,10.00,0,NULL,NULL,1,'hamburguesa-royal.png','2026-02-11 04:01:16','2026-02-11 04:01:16'),(4,'000004',NULL,'00000000','AMERICANA',NULL,NULL,1,61,'10',0.00,0.00,30.00,0,NULL,NULL,1,'pizza-americana.png','2026-02-11 04:01:16','2026-02-11 04:01:16'),(5,'000006',NULL,'00000000','BBQ',NULL,NULL,5,61,'10',0.00,0.00,20.00,0,NULL,NULL,1,'alitas-bbq.png','2026-02-11 04:01:16','2026-02-11 04:01:16'),(6,'000007',NULL,'00000000','INCA KOLA',NULL,NULL,4,61,'10',0.00,0.00,4.00,0,NULL,NULL,1,'inka-cola.png','2026-02-11 04:01:16','2026-02-11 04:01:16'),(7,'000008',NULL,'00000000','1/4 POLLO',NULL,NULL,5,61,'10',0.00,0.00,18.00,0,NULL,NULL,1,'pollo-1-4.png','2026-02-11 04:01:16','2026-02-11 04:01:16'),(8,'000009',NULL,'00000000','FRESA',NULL,NULL,3,61,'10',0.00,0.00,10.00,0,NULL,NULL,1,'batido-fresa.png','2026-02-11 04:01:16','2026-02-11 04:01:16'),(9,'000010',NULL,'00000000','CROCANTES',NULL,NULL,5,61,'10',0.00,0.00,20.00,0,NULL,NULL,1,'alitas-crocantes.png','2026-02-11 04:01:16','2026-02-11 04:01:16');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `estado` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'SUPER ADMIN',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(2,'ADMINISTRADOR',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(3,'USUARIO',1,'2026-02-11 04:01:11','2026-02-11 04:01:11');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `iddoc` int(11) NOT NULL,
  `dni_ruc` varchar(15) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `codigo_pais` varchar(2) NOT NULL,
  `ubigeo` varchar(6) NOT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers`
--

LOCK TABLES `providers` WRITE;
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
INSERT INTO `providers` VALUES (1,4,'20610316884','MYTEMS E.I.R.L.','JR MANCO CAPAC 451','PE','220501','','2026-02-11 04:01:12','2026-02-11 04:01:12'),(2,2,'71433073','KROWED NAJAR LOZANO','JR MANCO CAPAC 451','PE','220501','','2026-02-11 04:01:12','2026-02-11 04:01:12');
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provinces` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `departamento_codigo` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinces`
--

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
INSERT INTO `provinces` VALUES (1,'0101','Chachapoyas','01','2026-02-11 04:01:11','2026-02-11 04:01:11'),(2,'0102','Bagua','01','2026-02-11 04:01:11','2026-02-11 04:01:11'),(3,'0103','Bongará','01','2026-02-11 04:01:11','2026-02-11 04:01:11'),(4,'0104','Condorcanqui','01','2026-02-11 04:01:11','2026-02-11 04:01:11'),(5,'0105','Luya','01','2026-02-11 04:01:11','2026-02-11 04:01:11'),(6,'0106','Rodríguez de Mendoza','01','2026-02-11 04:01:11','2026-02-11 04:01:11'),(7,'0107','Utcubamba','01','2026-02-11 04:01:11','2026-02-11 04:01:11'),(8,'0201','Huaraz','02','2026-02-11 04:01:11','2026-02-11 04:01:11'),(9,'0202','Aija','02','2026-02-11 04:01:11','2026-02-11 04:01:11'),(10,'0203','Antonio Raymondi','02','2026-02-11 04:01:11','2026-02-11 04:01:11'),(11,'0204','Asunción','02','2026-02-11 04:01:11','2026-02-11 04:01:11'),(12,'0205','Bolognesi','02','2026-02-11 04:01:11','2026-02-11 04:01:11'),(13,'0206','Carhuaz','02','2026-02-11 04:01:11','2026-02-11 04:01:11'),(14,'0207','Carlos Fermín Fitzcarrald','02','2026-02-11 04:01:11','2026-02-11 04:01:11'),(15,'0208','Casma','02','2026-02-11 04:01:11','2026-02-11 04:01:11'),(16,'0209','Corongo','02','2026-02-11 04:01:11','2026-02-11 04:01:11'),(17,'0210','Huari','02','2026-02-11 04:01:11','2026-02-11 04:01:11'),(18,'0211','Huarmey','02','2026-02-11 04:01:11','2026-02-11 04:01:11'),(19,'0212','Huaylas','02','2026-02-11 04:01:11','2026-02-11 04:01:11'),(20,'0213','Mariscal Luzuriaga','02','2026-02-11 04:01:11','2026-02-11 04:01:11'),(21,'0214','Ocros','02','2026-02-11 04:01:11','2026-02-11 04:01:11'),(22,'0215','Pallasca','02','2026-02-11 04:01:11','2026-02-11 04:01:11'),(23,'0216','Pomabamba','02','2026-02-11 04:01:11','2026-02-11 04:01:11'),(24,'0217','Recuay','02','2026-02-11 04:01:11','2026-02-11 04:01:11'),(25,'0218','Santa','02','2026-02-11 04:01:11','2026-02-11 04:01:11'),(26,'0219','Sihuas','02','2026-02-11 04:01:11','2026-02-11 04:01:11'),(27,'0220','Yungay','02','2026-02-11 04:01:11','2026-02-11 04:01:11'),(28,'0301','Abancay','03','2026-02-11 04:01:11','2026-02-11 04:01:11'),(29,'0302','Andahuaylas','03','2026-02-11 04:01:11','2026-02-11 04:01:11'),(30,'0303','Antabamba','03','2026-02-11 04:01:11','2026-02-11 04:01:11'),(31,'0304','Aymaraes','03','2026-02-11 04:01:11','2026-02-11 04:01:11'),(32,'0305','Cotabambas','03','2026-02-11 04:01:11','2026-02-11 04:01:11'),(33,'0306','Chincheros','03','2026-02-11 04:01:11','2026-02-11 04:01:11'),(34,'0307','Grau','03','2026-02-11 04:01:11','2026-02-11 04:01:11'),(35,'0401','Arequipa','04','2026-02-11 04:01:11','2026-02-11 04:01:11'),(36,'0402','Camaná','04','2026-02-11 04:01:11','2026-02-11 04:01:11'),(37,'0403','Caravelí','04','2026-02-11 04:01:11','2026-02-11 04:01:11'),(38,'0404','Castilla','04','2026-02-11 04:01:11','2026-02-11 04:01:11'),(39,'0405','Caylloma','04','2026-02-11 04:01:11','2026-02-11 04:01:11'),(40,'0406','Condesuyos','04','2026-02-11 04:01:11','2026-02-11 04:01:11'),(41,'0407','Islay','04','2026-02-11 04:01:11','2026-02-11 04:01:11'),(42,'0408','La Uniòn','04','2026-02-11 04:01:11','2026-02-11 04:01:11'),(43,'0501','Huamanga','05','2026-02-11 04:01:11','2026-02-11 04:01:11'),(44,'0502','Cangallo','05','2026-02-11 04:01:11','2026-02-11 04:01:11'),(45,'0503','Huanca Sancos','05','2026-02-11 04:01:11','2026-02-11 04:01:11'),(46,'0504','Huanta','05','2026-02-11 04:01:11','2026-02-11 04:01:11'),(47,'0505','La Mar','05','2026-02-11 04:01:11','2026-02-11 04:01:11'),(48,'0506','Lucanas','05','2026-02-11 04:01:11','2026-02-11 04:01:11'),(49,'0507','Parinacochas','05','2026-02-11 04:01:11','2026-02-11 04:01:11'),(50,'0508','Pàucar del Sara Sara','05','2026-02-11 04:01:11','2026-02-11 04:01:11'),(51,'0509','Sucre','05','2026-02-11 04:01:11','2026-02-11 04:01:11'),(52,'0510','Víctor Fajardo','05','2026-02-11 04:01:11','2026-02-11 04:01:11'),(53,'0511','Vilcas Huamán','05','2026-02-11 04:01:11','2026-02-11 04:01:11'),(54,'0601','Cajamarca','06','2026-02-11 04:01:11','2026-02-11 04:01:11'),(55,'0602','Cajabamba','06','2026-02-11 04:01:11','2026-02-11 04:01:11'),(56,'0603','Celendín','06','2026-02-11 04:01:11','2026-02-11 04:01:11'),(57,'0604','Chota','06','2026-02-11 04:01:11','2026-02-11 04:01:11'),(58,'0605','Contumazá','06','2026-02-11 04:01:11','2026-02-11 04:01:11'),(59,'0606','Cutervo','06','2026-02-11 04:01:11','2026-02-11 04:01:11'),(60,'0607','Hualgayoc','06','2026-02-11 04:01:11','2026-02-11 04:01:11'),(61,'0608','Jaén','06','2026-02-11 04:01:11','2026-02-11 04:01:11'),(62,'0609','San Ignacio','06','2026-02-11 04:01:11','2026-02-11 04:01:11'),(63,'0610','San Marcos','06','2026-02-11 04:01:11','2026-02-11 04:01:11'),(64,'0611','San Miguel','06','2026-02-11 04:01:11','2026-02-11 04:01:11'),(65,'0612','San Pablo','06','2026-02-11 04:01:11','2026-02-11 04:01:11'),(66,'0613','Santa Cruz','06','2026-02-11 04:01:11','2026-02-11 04:01:11'),(67,'0701','Prov. Const. del Callao','07','2026-02-11 04:01:11','2026-02-11 04:01:11'),(68,'0801','Cusco','08','2026-02-11 04:01:11','2026-02-11 04:01:11'),(69,'0802','Acomayo','08','2026-02-11 04:01:11','2026-02-11 04:01:11'),(70,'0803','Anta','08','2026-02-11 04:01:11','2026-02-11 04:01:11'),(71,'0804','Calca','08','2026-02-11 04:01:11','2026-02-11 04:01:11'),(72,'0805','Canas','08','2026-02-11 04:01:11','2026-02-11 04:01:11'),(73,'0806','Canchis','08','2026-02-11 04:01:11','2026-02-11 04:01:11'),(74,'0807','Chumbivilcas','08','2026-02-11 04:01:11','2026-02-11 04:01:11'),(75,'0808','Espinar','08','2026-02-11 04:01:11','2026-02-11 04:01:11'),(76,'0809','La Convención','08','2026-02-11 04:01:11','2026-02-11 04:01:11'),(77,'0810','Paruro','08','2026-02-11 04:01:11','2026-02-11 04:01:11'),(78,'0811','Paucartambo','08','2026-02-11 04:01:11','2026-02-11 04:01:11'),(79,'0812','Quispicanchi','08','2026-02-11 04:01:11','2026-02-11 04:01:11'),(80,'0813','Urubamba','08','2026-02-11 04:01:11','2026-02-11 04:01:11'),(81,'0901','Huancavelica','09','2026-02-11 04:01:11','2026-02-11 04:01:11'),(82,'0902','Acobamba','09','2026-02-11 04:01:11','2026-02-11 04:01:11'),(83,'0903','Angaraes','09','2026-02-11 04:01:11','2026-02-11 04:01:11'),(84,'0904','Castrovirreyna','09','2026-02-11 04:01:11','2026-02-11 04:01:11'),(85,'0905','Churcampa','09','2026-02-11 04:01:11','2026-02-11 04:01:11'),(86,'0906','Huaytará','09','2026-02-11 04:01:11','2026-02-11 04:01:11'),(87,'0907','Tayacaja','09','2026-02-11 04:01:11','2026-02-11 04:01:11'),(88,'1001','Huánuco','10','2026-02-11 04:01:11','2026-02-11 04:01:11'),(89,'1002','Ambo','10','2026-02-11 04:01:11','2026-02-11 04:01:11'),(90,'1003','Dos de Mayo','10','2026-02-11 04:01:11','2026-02-11 04:01:11'),(91,'1004','Huacaybamba','10','2026-02-11 04:01:11','2026-02-11 04:01:11'),(92,'1005','Huamalíes','10','2026-02-11 04:01:11','2026-02-11 04:01:11'),(93,'1006','Leoncio Prado','10','2026-02-11 04:01:11','2026-02-11 04:01:11'),(94,'1007','Marañón','10','2026-02-11 04:01:11','2026-02-11 04:01:11'),(95,'1008','Pachitea','10','2026-02-11 04:01:11','2026-02-11 04:01:11'),(96,'1009','Puerto Inca','10','2026-02-11 04:01:11','2026-02-11 04:01:11'),(97,'1010','Lauricocha ','10','2026-02-11 04:01:11','2026-02-11 04:01:11'),(98,'1011','Yarowilca ','10','2026-02-11 04:01:11','2026-02-11 04:01:11'),(99,'1101','Ica ','11','2026-02-11 04:01:11','2026-02-11 04:01:11'),(100,'1102','Chincha ','11','2026-02-11 04:01:11','2026-02-11 04:01:11'),(101,'1103','Nasca ','11','2026-02-11 04:01:11','2026-02-11 04:01:11'),(102,'1104','Palpa ','11','2026-02-11 04:01:11','2026-02-11 04:01:11'),(103,'1105','Pisco ','11','2026-02-11 04:01:11','2026-02-11 04:01:11'),(104,'1201','Huancayo ','12','2026-02-11 04:01:11','2026-02-11 04:01:11'),(105,'1202','Concepción ','12','2026-02-11 04:01:11','2026-02-11 04:01:11'),(106,'1203','Chanchamayo ','12','2026-02-11 04:01:11','2026-02-11 04:01:11'),(107,'1204','Jauja ','12','2026-02-11 04:01:11','2026-02-11 04:01:11'),(108,'1205','Junín ','12','2026-02-11 04:01:11','2026-02-11 04:01:11'),(109,'1206','Satipo ','12','2026-02-11 04:01:11','2026-02-11 04:01:11'),(110,'1207','Tarma ','12','2026-02-11 04:01:11','2026-02-11 04:01:11'),(111,'1208','Yauli ','12','2026-02-11 04:01:11','2026-02-11 04:01:11'),(112,'1209','Chupaca ','12','2026-02-11 04:01:11','2026-02-11 04:01:11'),(113,'1301','Trujillo ','13','2026-02-11 04:01:11','2026-02-11 04:01:11'),(114,'1302','Ascope ','13','2026-02-11 04:01:11','2026-02-11 04:01:11'),(115,'1303','Bolívar ','13','2026-02-11 04:01:11','2026-02-11 04:01:11'),(116,'1304','Chepén ','13','2026-02-11 04:01:11','2026-02-11 04:01:11'),(117,'1305','Julcán ','13','2026-02-11 04:01:11','2026-02-11 04:01:11'),(118,'1306','Otuzco ','13','2026-02-11 04:01:11','2026-02-11 04:01:11'),(119,'1307','Pacasmayo ','13','2026-02-11 04:01:11','2026-02-11 04:01:11'),(120,'1308','Pataz ','13','2026-02-11 04:01:11','2026-02-11 04:01:11'),(121,'1309','Sánchez Carrión ','13','2026-02-11 04:01:11','2026-02-11 04:01:11'),(122,'1310','Santiago de Chuco ','13','2026-02-11 04:01:11','2026-02-11 04:01:11'),(123,'1311','Gran Chimú ','13','2026-02-11 04:01:11','2026-02-11 04:01:11'),(124,'1312','Virú ','13','2026-02-11 04:01:11','2026-02-11 04:01:11'),(125,'1401','Chiclayo ','14','2026-02-11 04:01:11','2026-02-11 04:01:11'),(126,'1402','Ferreñafe ','14','2026-02-11 04:01:11','2026-02-11 04:01:11'),(127,'1403','Lambayeque ','14','2026-02-11 04:01:11','2026-02-11 04:01:11'),(128,'1501','Lima ','15','2026-02-11 04:01:11','2026-02-11 04:01:11'),(129,'1502','Barranca ','15','2026-02-11 04:01:11','2026-02-11 04:01:11'),(130,'1503','Cajatambo ','15','2026-02-11 04:01:11','2026-02-11 04:01:11'),(131,'1504','Canta ','15','2026-02-11 04:01:11','2026-02-11 04:01:11'),(132,'1505','Cañete ','15','2026-02-11 04:01:11','2026-02-11 04:01:11'),(133,'1506','Huaral ','15','2026-02-11 04:01:11','2026-02-11 04:01:11'),(134,'1507','Huarochirí ','15','2026-02-11 04:01:11','2026-02-11 04:01:11'),(135,'1508','Huaura ','15','2026-02-11 04:01:11','2026-02-11 04:01:11'),(136,'1509','Oyón ','15','2026-02-11 04:01:11','2026-02-11 04:01:11'),(137,'1510','Yauyos ','15','2026-02-11 04:01:11','2026-02-11 04:01:11'),(138,'1601','Maynas ','16','2026-02-11 04:01:11','2026-02-11 04:01:11'),(139,'1602','Alto Amazonas ','16','2026-02-11 04:01:11','2026-02-11 04:01:11'),(140,'1603','Loreto ','16','2026-02-11 04:01:11','2026-02-11 04:01:11'),(141,'1604','Mariscal Ramón Castilla ','16','2026-02-11 04:01:11','2026-02-11 04:01:11'),(142,'1605','Requena ','16','2026-02-11 04:01:11','2026-02-11 04:01:11'),(143,'1606','Ucayali ','16','2026-02-11 04:01:11','2026-02-11 04:01:11'),(144,'1607','Datem del Marañón ','16','2026-02-11 04:01:11','2026-02-11 04:01:11'),(145,'1608','Putumayo','16','2026-02-11 04:01:11','2026-02-11 04:01:11'),(146,'1701','Tambopata ','17','2026-02-11 04:01:11','2026-02-11 04:01:11'),(147,'1702','Manu ','17','2026-02-11 04:01:11','2026-02-11 04:01:11'),(148,'1703','Tahuamanu ','17','2026-02-11 04:01:11','2026-02-11 04:01:11'),(149,'1801','Mariscal Nieto ','18','2026-02-11 04:01:11','2026-02-11 04:01:11'),(150,'1802','General Sánchez Cerro ','18','2026-02-11 04:01:11','2026-02-11 04:01:11'),(151,'1803','Ilo ','18','2026-02-11 04:01:11','2026-02-11 04:01:11'),(152,'1901','Pasco ','19','2026-02-11 04:01:11','2026-02-11 04:01:11'),(153,'1902','Daniel Alccodigoes Carrión ','19','2026-02-11 04:01:11','2026-02-11 04:01:11'),(154,'1903','Oxapampa ','19','2026-02-11 04:01:11','2026-02-11 04:01:11'),(155,'2001','Piura ','20','2026-02-11 04:01:11','2026-02-11 04:01:11'),(156,'2002','Ayabaca ','20','2026-02-11 04:01:11','2026-02-11 04:01:11'),(157,'2003','Huancabamba ','20','2026-02-11 04:01:11','2026-02-11 04:01:11'),(158,'2004','Morropón ','20','2026-02-11 04:01:11','2026-02-11 04:01:11'),(159,'2005','Paita ','20','2026-02-11 04:01:11','2026-02-11 04:01:11'),(160,'2006','Sullana ','20','2026-02-11 04:01:11','2026-02-11 04:01:11'),(161,'2007','Talara ','20','2026-02-11 04:01:11','2026-02-11 04:01:11'),(162,'2008','Sechura ','20','2026-02-11 04:01:11','2026-02-11 04:01:11'),(163,'2101','Puno ','21','2026-02-11 04:01:11','2026-02-11 04:01:11'),(164,'2102','Azángaro ','21','2026-02-11 04:01:11','2026-02-11 04:01:11'),(165,'2103','Carabaya ','21','2026-02-11 04:01:11','2026-02-11 04:01:11'),(166,'2104','Chucuito ','21','2026-02-11 04:01:11','2026-02-11 04:01:11'),(167,'2105','El Collao ','21','2026-02-11 04:01:12','2026-02-11 04:01:12'),(168,'2106','Huancané ','21','2026-02-11 04:01:12','2026-02-11 04:01:12'),(169,'2107','Lampa ','21','2026-02-11 04:01:12','2026-02-11 04:01:12'),(170,'2108','Melgar ','21','2026-02-11 04:01:12','2026-02-11 04:01:12'),(171,'2109','Moho ','21','2026-02-11 04:01:12','2026-02-11 04:01:12'),(172,'2110','San Antonio de Putina ','21','2026-02-11 04:01:12','2026-02-11 04:01:12'),(173,'2111','San Román ','21','2026-02-11 04:01:12','2026-02-11 04:01:12'),(174,'2112','Sandia ','21','2026-02-11 04:01:12','2026-02-11 04:01:12'),(175,'2113','Yunguyo ','21','2026-02-11 04:01:12','2026-02-11 04:01:12'),(176,'2201','Moyobamba ','22','2026-02-11 04:01:12','2026-02-11 04:01:12'),(177,'2202','Bellavista ','22','2026-02-11 04:01:12','2026-02-11 04:01:12'),(178,'2203','El Dorado ','22','2026-02-11 04:01:12','2026-02-11 04:01:12'),(179,'2204','Huallaga ','22','2026-02-11 04:01:12','2026-02-11 04:01:12'),(180,'2205','Lamas ','22','2026-02-11 04:01:12','2026-02-11 04:01:12'),(181,'2206','Mariscal Cáceres ','22','2026-02-11 04:01:12','2026-02-11 04:01:12'),(182,'2207','Picota ','22','2026-02-11 04:01:12','2026-02-11 04:01:12'),(183,'2208','Rioja ','22','2026-02-11 04:01:12','2026-02-11 04:01:12'),(184,'2209','San Martin ','22','2026-02-11 04:01:12','2026-02-11 04:01:12'),(185,'2210','Tocache ','22','2026-02-11 04:01:12','2026-02-11 04:01:12'),(186,'2301','Tacna ','23','2026-02-11 04:01:12','2026-02-11 04:01:12'),(187,'2302','Candarave ','23','2026-02-11 04:01:12','2026-02-11 04:01:12'),(188,'2303','Jorge Basadre ','23','2026-02-11 04:01:12','2026-02-11 04:01:12'),(189,'2304','Tarata ','23','2026-02-11 04:01:12','2026-02-11 04:01:12'),(190,'2401','Tumbes ','24','2026-02-11 04:01:12','2026-02-11 04:01:12'),(191,'2402','Contralmirante Villar ','24','2026-02-11 04:01:12','2026-02-11 04:01:12'),(192,'2403','Zarumilla ','24','2026-02-11 04:01:12','2026-02-11 04:01:12'),(193,'2501','Coronel Portillo ','25','2026-02-11 04:01:12','2026-02-11 04:01:12'),(194,'2502','Atalaya ','25','2026-02-11 04:01:12','2026-02-11 04:01:12'),(195,'2503','Padre Abad ','25','2026-02-11 04:01:12','2026-02-11 04:01:12'),(196,'2504','Purús','25','2026-02-11 04:01:12','2026-02-11 04:01:12');
/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_descriptions`
--

DROP TABLE IF EXISTS `purchase_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_descriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_descriptions`
--

LOCK TABLES `purchase_descriptions` WRITE;
/*!40000 ALTER TABLE `purchase_descriptions` DISABLE KEYS */;
INSERT INTO `purchase_descriptions` VALUES (1,'TRANSPORTE DE CARGA','2026-02-11 04:01:12','2026-02-11 04:01:12'),(2,'PASAJES TERRESTRES','2026-02-11 04:01:12','2026-02-11 04:01:12'),(3,'PASAJES AEREOS','2026-02-11 04:01:12','2026-02-11 04:01:12'),(4,'ALOJAMIENTO','2026-02-11 04:01:12','2026-02-11 04:01:12'),(5,'ALIMENTACION','2026-02-11 04:01:12','2026-02-11 04:01:12'),(6,'OTROS GASTOS DE VIAJE','2026-02-11 04:01:12','2026-02-11 04:01:12'),(7,'LEGAL Y TRIBUTARIA','2026-02-11 04:01:12','2026-02-11 04:01:12'),(8,'NOTARIA','2026-02-11 04:01:12','2026-02-11 04:01:12'),(9,'ASESORIA CONTABLE','2026-02-11 04:01:12','2026-02-11 04:01:12'),(10,'MERCADOTECNIA','2026-02-11 04:01:12','2026-02-11 04:01:12'),(11,'MEDIOAMBIENTAL','2026-02-11 04:01:12','2026-02-11 04:01:12'),(12,'INVESTIGACION Y DESARROLLO','2026-02-11 04:01:12','2026-02-11 04:01:12'),(13,'PRODUCCION','2026-02-11 04:01:12','2026-02-11 04:01:12'),(14,'PRODUCCION ENCARGADA A TERCEROS','2026-02-11 04:01:12','2026-02-11 04:01:12'),(15,'MANTENIMIENTO Y REPARACIONES','2026-02-11 04:01:12','2026-02-11 04:01:12'),(16,'INVERSION INMOBILIARIA','2026-02-11 04:01:12','2026-02-11 04:01:12'),(17,'ACTIVOS ADQUIRIDOS EN ARRENDAMIENTO FINANCIERO','2026-02-11 04:01:12','2026-02-11 04:01:12'),(18,'INTANGIBLES','2026-02-11 04:01:12','2026-02-11 04:01:12'),(19,'ACTIVOS BIOLOGICOS','2026-02-11 04:01:12','2026-02-11 04:01:12'),(20,'ALQUILERES EDIFICACIONES','2026-02-11 04:01:12','2026-02-11 04:01:12'),(21,'ALQUILERES MAQUINARIAS Y EQUIPOS DE EXPLOTACION','2026-02-11 04:01:12','2026-02-11 04:01:12'),(22,'ACTIVOS ADQUIRIDOS EN ARRENDAMIENTO FINANCIERO','2026-02-11 04:01:12','2026-02-11 04:01:12'),(23,'ALQUILERES EQUIPO DE TRANSPORTE','2026-02-11 04:01:12','2026-02-11 04:01:12'),(24,'ALQUILERES EQUIPOS DIVERSOS','2026-02-11 04:01:12','2026-02-11 04:01:12'),(25,'ENERGIA ELECTRICA','2026-02-11 04:01:12','2026-02-11 04:01:12'),(26,'GAS','2026-02-11 04:01:12','2026-02-11 04:01:12'),(27,'AGUA','2026-02-11 04:01:12','2026-02-11 04:01:12'),(28,'TELEFONO','2026-02-11 04:01:12','2026-02-11 04:01:12'),(29,'INTERNET','2026-02-11 04:01:12','2026-02-11 04:01:12'),(30,'RADIO','2026-02-11 04:01:12','2026-02-11 04:01:12'),(31,'CABLE','2026-02-11 04:01:12','2026-02-11 04:01:12'),(32,'PUBLICIDAD','2026-02-11 04:01:12','2026-02-11 04:01:12'),(33,'RELACIONES PUBLICAS','2026-02-11 04:01:12','2026-02-11 04:01:12'),(34,'SERVICIOS DE CONTRATISTAS','2026-02-11 04:01:12','2026-02-11 04:01:12'),(35,'GASTOS BANCARIOS','2026-02-11 04:01:12','2026-02-11 04:01:12'),(36,'GASTOS DE LABORATORIO','2026-02-11 04:01:12','2026-02-11 04:01:12'),(37,'OTROS SERVICIOS','2026-02-11 04:01:12','2026-02-11 04:01:12'),(38,'SERVICIO DE TRAMITES ANTE LA ADUANA','2026-02-11 04:01:12','2026-02-11 04:01:12'),(39,'SERVICIO DE ALMACENAMIENTO','2026-02-11 04:01:12','2026-02-11 04:01:12'),(40,'GASTOS POR TRIBUTOS','2026-02-11 04:01:12','2026-02-11 04:01:12'),(41,'IMPUESTO PREDIAL','2026-02-11 04:01:12','2026-02-11 04:01:12'),(42,'ARBITRIOS MUNICIPALES Y SEGURIDAD CIUDADANA','2026-02-11 04:01:12','2026-02-11 04:01:12'),(43,'IMPUESTO AL PATRIMONIO VEHICULAR','2026-02-11 04:01:12','2026-02-11 04:01:12'),(44,'LICENCIA DE FUNCIONAMIENTO','2026-02-11 04:01:12','2026-02-11 04:01:12'),(45,'SEGURO DE VIDA','2026-02-11 04:01:12','2026-02-11 04:01:12'),(46,'SEGURO SOAT','2026-02-11 04:01:12','2026-02-11 04:01:12'),(47,'REGALIAS','2026-02-11 04:01:12','2026-02-11 04:01:12'),(48,'SUSCRIPCIONES Y COTIZACIONES','2026-02-11 04:01:12','2026-02-11 04:01:12'),(49,'UTILES DE OFICINA','2026-02-11 04:01:12','2026-02-11 04:01:12'),(50,'COMBUSTIBLE','2026-02-11 04:01:12','2026-02-11 04:01:12'),(51,'SUMINISTROS MEDICAMENTOS','2026-02-11 04:01:12','2026-02-11 04:01:12'),(52,'IMPRESIONES','2026-02-11 04:01:12','2026-02-11 04:01:12'),(53,'DONACIONES','2026-02-11 04:01:12','2026-02-11 04:01:12'),(54,'SANCIONES ADMINISTRATIVAS','2026-02-11 04:01:12','2026-02-11 04:01:12'),(55,'MULTAS','2026-02-11 04:01:12','2026-02-11 04:01:12'),(56,'GASTOS VARIOS','2026-02-11 04:01:12','2026-02-11 04:01:12'),(57,'INTERESES Y GASTOS DE PAGARES','2026-02-11 04:01:12','2026-02-11 04:01:12'),(58,'IMPUESTO A LOS CREDITOS','2026-02-11 04:01:12','2026-02-11 04:01:12'),(59,'COMISIONES VARIAS','2026-02-11 04:01:12','2026-02-11 04:01:12'),(60,'TALONARIO DE CHEQUES','2026-02-11 04:01:12','2026-02-11 04:01:12'),(61,'COMISION DE MATENIMIENTO DE CUENTA','2026-02-11 04:01:12','2026-02-11 04:01:12');
/*!40000 ALTER TABLE `purchase_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotes`
--

DROP TABLE IF EXISTS `quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idtipo_comprobante` int(11) NOT NULL,
  `serie` varchar(255) NOT NULL DEFAULT 'C001',
  `correlativo` varchar(8) NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `hora` time NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idmoneda` int(11) NOT NULL,
  `idpago` int(11) NOT NULL,
  `modo_pago` int(11) NOT NULL,
  `exonerada` decimal(18,2) NOT NULL,
  `inafecta` decimal(18,2) NOT NULL,
  `gravada` decimal(18,2) NOT NULL,
  `anticipo` decimal(18,2) NOT NULL,
  `igv` decimal(18,2) NOT NULL,
  `gratuita` decimal(18,2) NOT NULL,
  `otros_cargos` decimal(18,2) NOT NULL,
  `total` decimal(18,2) NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `idusuario` int(11) NOT NULL,
  `idcaja` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes`
--

LOCK TABLES `quotes` WRITE;
/*!40000 ALTER TABLE `quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `entrega` varchar(255) DEFAULT NULL,
  `logo_principal` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `idpais` int(11) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'MYTEMS RESTOBAR','PASAJE SUCRE #333','25-30','1.jpg','banner.png',4,'950772205',1,'2026-02-11 04:01:16','2026-02-11 04:01:16');
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(2,2),(3,1),(3,2),(4,1),(4,2),(5,1),(5,2),(6,1),(6,2),(7,1),(7,2),(8,1),(8,2),(9,1),(9,2);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'SUPERADMIN','web','2026-02-11 04:01:16','2026-02-11 04:01:16'),(2,'ADMIN','web','2026-02-11 04:01:16','2026-02-11 04:01:16'),(3,'VENDEDOR','web','2026-02-11 04:01:16','2026-02-11 04:01:16');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_notes`
--

DROP TABLE IF EXISTS `sale_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_notes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idtipo_comprobante` int(11) NOT NULL,
  `serie` varchar(255) NOT NULL,
  `correlativo` varchar(255) NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `hora` time NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idmoneda` int(11) NOT NULL,
  `idpago` int(11) NOT NULL,
  `modo_pago` int(11) NOT NULL,
  `exonerada` decimal(18,2) NOT NULL,
  `inafecta` decimal(18,2) NOT NULL,
  `gravada` decimal(18,2) NOT NULL,
  `anticipo` decimal(18,2) NOT NULL,
  `igv` decimal(18,2) NOT NULL,
  `gratuita` decimal(18,2) NOT NULL,
  `otros_cargos` decimal(18,2) NOT NULL,
  `total` decimal(18,2) NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `anulado` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `idusuario` int(11) NOT NULL,
  `idcaja` int(11) NOT NULL,
  `idfactura_anular` int(11) DEFAULT NULL,
  `vuelto` decimal(18,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_notes`
--

LOCK TABLES `sale_notes` WRITE;
/*!40000 ALTER TABLE `sale_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `serie` varchar(4) NOT NULL,
  `correlativo` varchar(8) NOT NULL,
  `idtipo_documento` int(11) NOT NULL,
  `idtipo_documento_relacionado` int(11) DEFAULT NULL,
  `idcaja` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES (1,'F001','00000001',1,NULL,1,'2026-02-11 04:01:16','2026-02-11 04:01:16'),(2,'B001','00000001',2,NULL,1,'2026-02-11 04:01:16','2026-02-11 04:01:16'),(3,'BC01','00000001',6,2,1,'2026-02-11 04:01:16','2026-02-11 04:01:16'),(4,'FC01','00000001',6,1,1,'2026-02-11 04:01:16','2026-02-11 04:01:16'),(5,'NV01','00000001',7,NULL,1,'2026-02-11 04:01:16','2026-02-11 04:01:16'),(6,'F002','00000001',1,NULL,2,'2026-02-11 04:01:16','2026-02-11 04:01:16'),(7,'B002','00000001',2,NULL,2,'2026-02-11 04:01:16','2026-02-11 04:01:16'),(8,'BC02','00000001',6,2,2,'2026-02-11 04:01:16','2026-02-11 04:01:16'),(9,'FC02','00000001',6,1,2,'2026-02-11 04:01:16','2026-02-11 04:01:16'),(10,'NV02','00000001',7,NULL,2,'2026-02-11 04:01:16','2026-02-11 04:01:16');
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo_interno` varchar(255) DEFAULT NULL,
  `codigo_barras` varchar(255) DEFAULT NULL,
  `codigo_sunat` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `presentacion` varchar(255) DEFAULT NULL,
  `idunidad` int(11) NOT NULL,
  `idcodigo_igv` varchar(255) NOT NULL,
  `igv` int(11) NOT NULL,
  `precio_compra` decimal(18,2) NOT NULL,
  `precio_venta` decimal(18,2) NOT NULL,
  `impuesto` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sunat_users`
--

DROP TABLE IF EXISTS `sunat_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sunat_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_comercial` varchar(255) NOT NULL,
  `nombre_usuario` varchar(255) NOT NULL,
  `clave_usuario` varchar(255) NOT NULL,
  `clave_certificado` varchar(255) NOT NULL,
  `ruc` varchar(255) NOT NULL,
  `nombre_certificado` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sunat_users`
--

LOCK TABLES `sunat_users` WRITE;
/*!40000 ALTER TABLE `sunat_users` DISABLE KEYS */;
INSERT INTO `sunat_users` VALUES (1,'DSIG','admin','YWRtaW4=','YWRtaW4=','20601733022','202020601733022.pfx','2026-02-11 04:01:16','2026-02-11 04:01:16');
/*!40000 ALTER TABLE `sunat_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_documents`
--

DROP TABLE IF EXISTS `type_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(2) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `estado` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_documents`
--

LOCK TABLES `type_documents` WRITE;
/*!40000 ALTER TABLE `type_documents` DISABLE KEYS */;
INSERT INTO `type_documents` VALUES (1,'01','FACTURA ELECTRÓNICA',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(2,'03','BOLETA DE VENTA ELECTRÓNICA',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(3,'04','LIQUIDACIÓN DE COMPRA',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(4,'05','BOLETOS DE TRANSPORTE AÉREO QUE EMITEN LAS COMPAÑÍAS DE AVIACIÓN COMERCIAL POR EL SERVICIO DE TRANSPORTE AÉREO REGULAR DE PASAJEROS, EMITIDO DE MANERA MANUAL, MECANIZADA O POR MEDIOS ELECTRÓNICOS (BME)',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(5,'06','CARTA DE PORTE AÉREO',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(6,'07','NOTA DE CRÉDITO ELECTRÓNICA',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(7,'02','NOTA DE VENTA',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(8,'08','NOTA DE DÉBITO ELECTRÓNICA',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(9,'09','GUÍA DE REMISIÓN REMITENTE',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(10,'11','PÓLIZA EMITIDA POR LAS BOLSAS DE VALORES',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(11,'12','TICKET DE MÁQUINA REGISTRADORA',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(12,'13','DOCUMENTO EMITIDO POR BANCOS, INSTITUCIONES FINANCIERAS, CREDITICIAS Y DE SEGUROS QUE SE ENCUENTREN BAJO EL CONTROL DE LA SUPERINTENDENCIA DE BANCA Y SEGUROS',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(13,'14','RECIBO SERVICIOS PÚBLICOS',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(14,'15','BOLETOS EMITIDOS POR EL SERVICIO DE TRANSPORTE TERRESTRE REGULAR URBANO DE PASAJEROS Y EL FERROVIARIO PÚBLICO DE PASAJEROS PRESTADO EN VÍA FÉRREA LOCAL',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(15,'16','BOLETO DE VIAJE EMITIDO POR LAS EMPRESAS DE TRANSPORTE PÚBLICO INTERPROVINCIAL DE PASAJEROS',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(16,'18','DOCUMENTOS EMITIDOS POR LAS AFP',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(17,'19','BOLETO POR ATRACCIONES Y ESPECTÁCULOS PÚBLICOS',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(18,'20','COMPROBANTE DE RETENCIÓN',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(19,'21','CONOCIMIENTO DE EMBARQUE POR EL SERVICIO DE TRANSPORTE DE CARGA MARÍTIMA',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(20,'23','PÓLIZAS DE ADJUDICACIÓN POR REMATE O ADJUDICACIÓN DE BIENES',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(21,'24','CERTIFICADO DE PAGO DE REGALÍAS EMITIDAS POR PERUPETRO S.A.',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(22,'28','ETIQUETAS POR EL PAGO DE LA TARIFA UNIFICADA DE USO DE AEROPUERTO – TUUA',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(23,'29','DOCUMENTOS EMITIDOS POR LA COFOPRI',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(24,'30','DOCUMENTOS EMITIDOS POR LAS EMPRESAS QUE DESEMPEÑAN EL ROL ADQUIRENTE EN LOS SISTEMAS DE PAGO MEDIANTE TARJETAS DE CRÉDITO Y DÉBITO, EMITIDAS POR BANCOS E INSTITUCIONES FINANCIERAS O CREDITICIAS, DOMICILIADOS O NO EN EL PAÍS.',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(25,'31','GUÍA DE REMISIÓN TRANSPORTISTA',0,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(26,'31','DOCUMENTOS EMITIDOS POR RECAUDADORAS DE LA GARANTÍA DE RED PRINCIPAL',0,'2026-02-11 04:01:11','2026-02-11 04:01:11');
/*!40000 ALTER TABLE `type_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(3) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `estado` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,'4A','BOBINAS',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(2,'BE','FARDO',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(3,'BG','BOLSA',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(4,'BJ','BALDE',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(5,'BLL','BARRILES',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(6,'BO','BOTELLAS',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(7,'BX','CAJA',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(8,'C62','PIEZAS',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(9,'CA','LATAS',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(10,'CEN','CIENTOS DE UNIDADES',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(11,'CJ','CONOS',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(12,'CMK','CENTIMETRO CUADRADO',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(13,'CMQ','CENTIMETRO CUBICO',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(14,'CMT','CENTIMETRO LINEAL',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(15,'CT','CARTONES',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(16,'CY','CILINDRO',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(17,'DR','TAMBOR',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(18,'DZN','DOCENA',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(19,'DZP','DOCENA POR 10**6',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(20,'FOT','PIES',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(21,'FTK','PIES CUADRADOS',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(22,'GLI','GALON INGLES (4,545956L)',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(23,'GLL','US GALON (3,7843 L)',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(24,'GRM','GRAMO',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(25,'GRO','GRUESA',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(26,'HLT','HECTOLITRO',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(27,'INH','PULGADAS',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(28,'KGM','KILOGRAMO',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(29,'KT','KIT',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(30,'KTM','KILOMETRO',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(31,'KWH','KILOVATIO HORA',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(32,'LBR','LIBRAS',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(33,'LEF','HOJA',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(34,'LTN','TONELADA LARGA',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(35,'LTR','LITRO',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(36,'MGM','MILIGRAMOS',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(37,'MLL','MILLARES',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(38,'MLT','MILILITRO',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(39,'MMK','MILIMETRO CUADRADO',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(40,'MMQ','MILIMETRO CUBICO',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(41,'MMT','MILIMETRO',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(42,'MTK','METRO CUADRADO',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(43,'MTQ','METRO CUBICO',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(44,'MTR','METRO',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(45,'MWH','MEGAWATT HORA',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(46,'NIU','UNIDAD (BIENES)',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(47,'ONZ','ONZAS',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(48,'PF','PALETAS',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(49,'PG','PLACAS',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(50,'PK','PAQUETE',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(51,'PR','PAR',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(52,'RM','RESMA',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(53,'SET','JUEGO',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(54,'ST','PLIEGO',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(55,'STN','TONELADA CORTA',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(56,'TNE','TONELADAS',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(57,'TU','TUBOS',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(58,'UM','MILLON DE UNIDADES',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(59,'YDK','YARDA CUADRADA',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(60,'YRD','YARDA',1,'2026-02-11 04:01:11','2026-02-11 04:01:11'),(61,'ZZ','UNIDAD (SERVICIOS)',1,'2026-02-11 04:01:11','2026-02-11 04:01:11');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `estado` int(11) NOT NULL,
  `idcaja` int(11) NOT NULL,
  `logo_encabezado` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_unique` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Administrador','admin',NULL,'$2y$10$GouIMxY9k19VzqGSyKg2L.i8lYTHj5SrsLYNCecWoN4k1zQ4ZFffi',1,1,'logo.png',NULL,'2026-02-11 04:01:17','2026-02-11 04:01:17'),(2,'Caja 1','caja1',NULL,'$2y$10$sOI3x200gSYJaCrgppS7W.VYbfZCdEI.jiOVVDdlXNTZIDYsCtu/q',1,1,NULL,NULL,'2026-02-11 04:01:17','2026-02-11 04:01:17'),(3,'Vendedor','vendedor',NULL,'$2y$10$2GLJJ8dZjW3Yr8niODVYX.wHIwF/hLym2j7atQMcFbYv5kvn6thxi',1,1,NULL,NULL,'2026-02-11 04:01:17','2026-02-11 04:01:17');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-10 23:01:27
