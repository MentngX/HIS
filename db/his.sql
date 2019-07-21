-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: his
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '挂号编号',
  `u_id` int(10) DEFAULT NULL COMMENT '病人id',
  `d_id` int(10) DEFAULT NULL COMMENT '医生id',
  `u_name` varchar(10) DEFAULT NULL,
  `time` time DEFAULT NULL COMMENT '时间',
  `linenumber` int(10) DEFAULT NULL COMMENT '排队序号',
  `department` varchar(255) DEFAULT NULL,
  `expenses` decimal(10,2) DEFAULT NULL COMMENT '挂号诊疗费',
  PRIMARY KEY (`id`),
  KEY `u_id_idx` (`u_id`),
  KEY `doctor_idx` (`d_id`),
  CONSTRAINT `doctor` FOREIGN KEY (`d_id`) REFERENCES `doctor` (`d_id`),
  CONSTRAINT `patient` FOREIGN KEY (`u_id`) REFERENCES `patient` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='挂号单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casehistory`
--

DROP TABLE IF EXISTS `casehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `casehistory` (
  `c_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '病历号',
  `u_id` int(10) DEFAULT NULL COMMENT '病人编号',
  `u_name` varchar(10) DEFAULT NULL COMMENT '病人姓名',
  `u_age` int(5) DEFAULT NULL COMMENT '病人年龄',
  `u_sex` varchar(2) DEFAULT NULL COMMENT '病人性别',
  `d_id` int(10) DEFAULT NULL COMMENT '医生id',
  `d_name` varchar(10) DEFAULT NULL COMMENT '医生姓名',
  `text` varchar(255) DEFAULT NULL COMMENT '病历内容',
  `time` time DEFAULT NULL COMMENT '就诊时间',
  `casehistorycol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='病历';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casehistory`
--

LOCK TABLES `casehistory` WRITE;
/*!40000 ALTER TABLE `casehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `casehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkup`
--

DROP TABLE IF EXISTS `checkup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `checkup` (
  `id` int(11) NOT NULL COMMENT '通知编号',
  `name` varchar(45) DEFAULT NULL COMMENT '检查项目',
  `department` varchar(45) DEFAULT NULL COMMENT '检查科室',
  `price` decimal(10,2) DEFAULT NULL COMMENT '检查费用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检查身体单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkup`
--

LOCK TABLES `checkup` WRITE;
/*!40000 ALTER TABLE `checkup` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `doctor` (
  `d_id` int(10) NOT NULL COMMENT '主键',
  `d_name` varchar(10) DEFAULT NULL COMMENT '医生姓名',
  `d_sex` varchar(2) DEFAULT NULL COMMENT '医生性别',
  `department` varchar(255) DEFAULT NULL COMMENT '部门',
  `d_username` varchar(45) DEFAULT NULL COMMENT '医生用户名',
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug`
--

DROP TABLE IF EXISTS `drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `drug` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '药品编号',
  `name` varchar(45) DEFAULT NULL COMMENT '药品名称\n',
  `inventory` int(5) DEFAULT NULL COMMENT '库存',
  `singleprice` decimal(10,2) DEFAULT NULL COMMENT '单价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='药品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug`
--

LOCK TABLES `drug` WRITE;
/*!40000 ALTER TABLE `drug` DISABLE KEYS */;
/*!40000 ALTER TABLE `drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospitalization`
--

DROP TABLE IF EXISTS `hospitalization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hospitalization` (
  `id` int(11) NOT NULL COMMENT '住院通知单号',
  `u_name` varchar(10) DEFAULT NULL COMMENT '病人姓名',
  `hospitalizationcol` varchar(45) DEFAULT NULL,
  `illness` varchar(45) DEFAULT NULL COMMENT '病情',
  `floor` varchar(45) DEFAULT NULL COMMENT '楼层',
  `door` varchar(45) DEFAULT NULL COMMENT '房间号',
  `bed` varchar(45) DEFAULT NULL COMMENT '床号',
  `price` decimal(10,2) DEFAULT NULL COMMENT '预交费用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='住院通知';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospitalization`
--

LOCK TABLES `hospitalization` WRITE;
/*!40000 ALTER TABLE `hospitalization` DISABLE KEYS */;
/*!40000 ALTER TABLE `hospitalization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `illness`
--

DROP TABLE IF EXISTS `illness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `illness` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(45) DEFAULT NULL COMMENT '名字\n',
  `text` varchar(255) DEFAULT NULL COMMENT '详细介绍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='病种';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `illness`
--

LOCK TABLES `illness` WRITE;
/*!40000 ALTER TABLE `illness` DISABLE KEYS */;
/*!40000 ALTER TABLE `illness` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL COMMENT '用户名/账号',
  `password` varchar(45) DEFAULT NULL COMMENT '密码',
  `role` int(255) DEFAULT NULL COMMENT '权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登陆';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `patient` (
  `u_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `u_name` varchar(10) DEFAULT NULL COMMENT '病人姓名',
  `u_sex` varchar(2) DEFAULT NULL COMMENT '病人性别',
  `u_username` varchar(10) DEFAULT NULL COMMENT '病人用户名',
  `u_phone` varchar(11) DEFAULT NULL COMMENT '病人电话',
  `u_age` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='病人';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay`
--

DROP TABLE IF EXISTS `pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收费单号',
  `type` varchar(45) DEFAULT NULL COMMENT '收费项目\n',
  `date` date DEFAULT NULL COMMENT '日期',
  `price` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `form` varchar(45) DEFAULT NULL COMMENT '收费方式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收费单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay`
--

LOCK TABLES `pay` WRITE;
/*!40000 ALTER TABLE `pay` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `prescription` (
  `p_id` int(11) NOT NULL COMMENT '处方号',
  `u_id` int(10) DEFAULT NULL COMMENT '主键',
  `u_name` varchar(10) DEFAULT NULL COMMENT '病人姓名',
  `u_sex` int(5) DEFAULT NULL COMMENT '病人年龄',
  `text` varchar(255) DEFAULT NULL COMMENT '处方内容',
  `time` time DEFAULT NULL COMMENT '处方时间',
  `d_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='处方';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'his'
--

--
-- Dumping routines for database 'his'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-21 12:51:14
