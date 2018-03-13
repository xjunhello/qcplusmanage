-- MySQL dump 10.10
--
-- Host: localhost    Database: qcplus
-- ------------------------------------------------------
-- Server version	5.0.22-community

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
-- Table structure for table `carousel`
--

DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel` (
  `id` int(11) NOT NULL,
  `descInfo` varchar(100) collate utf8_unicode_ci default NULL,
  `imagePath` varchar(100) collate utf8_unicode_ci default NULL,
  `createDate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `orderNo` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='首页的轮播图';

--
-- Dumping data for table `carousel`
--


/*!40000 ALTER TABLE `carousel` DISABLE KEYS */;
LOCK TABLES `carousel` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `carousel` ENABLE KEYS */;

--
-- Table structure for table `commentinfo`
--

DROP TABLE IF EXISTS `commentinfo`;
CREATE TABLE `commentinfo` (
  `id` int(11) NOT NULL,
  `orderId` int(11) default NULL,
  `userId` int(11) default NULL,
  `content` varchar(200) collate utf8_unicode_ci default NULL,
  `descDate` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='对于订单的评论';

--
-- Dumping data for table `commentinfo`
--


/*!40000 ALTER TABLE `commentinfo` DISABLE KEYS */;
LOCK TABLES `commentinfo` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `commentinfo` ENABLE KEYS */;

--
-- Table structure for table `configuraton`
--

DROP TABLE IF EXISTS `configuraton`;
CREATE TABLE `configuraton` (
  `id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='资源配置表';

--
-- Dumping data for table `configuraton`
--


/*!40000 ALTER TABLE `configuraton` DISABLE KEYS */;
LOCK TABLES `configuraton` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `configuraton` ENABLE KEYS */;

--
-- Table structure for table `dicattreducation`
--

DROP TABLE IF EXISTS `dicattreducation`;
CREATE TABLE `dicattreducation` (
  `ID` int(11) NOT NULL,
  `name` varchar(32) collate utf8_unicode_ci default NULL COMMENT '语言类型名称',
  `orderNo` int(11) default NULL COMMENT '显示顺序，有小到大显示',
  `isDelete` int(11) default NULL COMMENT '是否可用，1为可用 0为不可用',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='记录受教育程度';

--
-- Dumping data for table `dicattreducation`
--


/*!40000 ALTER TABLE `dicattreducation` DISABLE KEYS */;
LOCK TABLES `dicattreducation` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `dicattreducation` ENABLE KEYS */;

--
-- Table structure for table `dicattrgender`
--

DROP TABLE IF EXISTS `dicattrgender`;
CREATE TABLE `dicattrgender` (
  `ID` int(11) NOT NULL,
  `name` varchar(32) collate utf8_unicode_ci default NULL COMMENT '语言类型名称',
  `orderNo` int(11) default NULL COMMENT '显示顺序，有小到大显示',
  `isDelete` int(11) default NULL COMMENT '是否可用，1为可用 0为不可用',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='性别，男女';

--
-- Dumping data for table `dicattrgender`
--


/*!40000 ALTER TABLE `dicattrgender` DISABLE KEYS */;
LOCK TABLES `dicattrgender` WRITE;
INSERT INTO `dicattrgender` VALUES (1,'男',1,1),(2,'女',2,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `dicattrgender` ENABLE KEYS */;

--
-- Table structure for table `diccompanynature`
--

DROP TABLE IF EXISTS `diccompanynature`;
CREATE TABLE `diccompanynature` (
  `ID` int(11) NOT NULL,
  `name` varchar(32) collate utf8_unicode_ci default NULL COMMENT '类型名称',
  `orderNo` int(11) default NULL COMMENT '显示顺序，有小到大显示',
  `isDelete` int(11) default NULL COMMENT '是否可用，1为可用 0为不可用',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='公司性质';

--
-- Dumping data for table `diccompanynature`
--


/*!40000 ALTER TABLE `diccompanynature` DISABLE KEYS */;
LOCK TABLES `diccompanynature` WRITE;
INSERT INTO `diccompanynature` VALUES (1,'批发商',1,1),(2,'贸易商',2,1),(3,'连锁超市',3,1),(4,'百货公司',4,1),(5,'品牌进口商',5,1),(6,'零售商',6,1),(7,'第三方验货公司',7,1),(8,'个人或其他',8,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `diccompanynature` ENABLE KEYS */;

--
-- Table structure for table `diccompanysize`
--

DROP TABLE IF EXISTS `diccompanysize`;
CREATE TABLE `diccompanysize` (
  `ID` int(11) NOT NULL,
  `name` varchar(32) collate utf8_unicode_ci default NULL COMMENT '类型名称',
  `orderNo` int(11) default NULL COMMENT '显示顺序，有小到大显示',
  `isDelete` int(11) default NULL COMMENT '是否可用，1为可用 0为不可用',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='公司规模 ，目前分为五个等级';

--
-- Dumping data for table `diccompanysize`
--


/*!40000 ALTER TABLE `diccompanysize` DISABLE KEYS */;
LOCK TABLES `diccompanysize` WRITE;
INSERT INTO `diccompanysize` VALUES (1,'0-10',1,1),(2,'11-30',2,1),(3,'31-50',3,1),(4,'51-100',4,1),(5,'100以上',5,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `diccompanysize` ENABLE KEYS */;

--
-- Table structure for table `diccountry`
--

DROP TABLE IF EXISTS `diccountry`;
CREATE TABLE `diccountry` (
  `id` int(11) NOT NULL,
  `name` varchar(32) collate utf8_unicode_ci default NULL,
  `orderNo` int(11) default NULL COMMENT '有小到大显示',
  `country` int(11) default NULL COMMENT '是否是国家，1为国家，0为非国家',
  `code` varchar(32) collate utf8_unicode_ci default NULL COMMENT '用于获取省份信息',
  `isDelete` int(11) default NULL COMMENT '1为可以，0为不可用',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='记录国家和地区的基本信息';

--
-- Dumping data for table `diccountry`
--


/*!40000 ALTER TABLE `diccountry` DISABLE KEYS */;
LOCK TABLES `diccountry` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `diccountry` ENABLE KEYS */;

--
-- Table structure for table `diclanguages`
--

DROP TABLE IF EXISTS `diclanguages`;
CREATE TABLE `diclanguages` (
  `ID` int(11) NOT NULL,
  `name` varchar(32) collate utf8_unicode_ci default NULL COMMENT '语言类型名称',
  `orderNo` int(11) default NULL COMMENT '显示顺序，有小到大显示',
  `isDelete` int(11) default NULL COMMENT '是否可用，1为可用 0为不可用',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='基于语言技能，共计四种';

--
-- Dumping data for table `diclanguages`
--


/*!40000 ALTER TABLE `diclanguages` DISABLE KEYS */;
LOCK TABLES `diclanguages` WRITE;
INSERT INTO `diclanguages` VALUES (1,'熟练书写验收报告',1,1),(2,'熟练阅读英文资料',2,1),(3,'面对面简单交流',3,1),(4,'面对面深入交流',4,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `diclanguages` ENABLE KEYS */;

--
-- Table structure for table `dicorderstatus`
--

DROP TABLE IF EXISTS `dicorderstatus`;
CREATE TABLE `dicorderstatus` (
  `id` int(11) NOT NULL,
  `name` varchar(32) collate utf8_unicode_ci default NULL,
  `orderNo` int(11) default NULL COMMENT '由小到大显示',
  `isDelete` int(11) default NULL COMMENT '1 为可用 0为不可用',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='共计4个状态';

--
-- Dumping data for table `dicorderstatus`
--


/*!40000 ALTER TABLE `dicorderstatus` DISABLE KEYS */;
LOCK TABLES `dicorderstatus` WRITE;
INSERT INTO `dicorderstatus` VALUES (1,'待接单',1,1),(2,'待验货',2,1),(3,'待付款',3,1),(4,'交易完成',4,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `dicorderstatus` ENABLE KEYS */;

--
-- Table structure for table `dicproducttype`
--

DROP TABLE IF EXISTS `dicproducttype`;
CREATE TABLE `dicproducttype` (
  `id` int(11) NOT NULL,
  `name` varchar(32) collate utf8_unicode_ci default NULL,
  `orderNo` int(11) default NULL COMMENT '由小到大显示',
  `isDelete` int(11) default NULL COMMENT '1 为可用 0为不可用',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dicproducttype`
--


/*!40000 ALTER TABLE `dicproducttype` DISABLE KEYS */;
LOCK TABLES `dicproducttype` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `dicproducttype` ENABLE KEYS */;

--
-- Table structure for table `dicreceivelevel`
--

DROP TABLE IF EXISTS `dicreceivelevel`;
CREATE TABLE `dicreceivelevel` (
  `ID` int(11) NOT NULL,
  `name` varchar(32) collate utf8_unicode_ci default NULL COMMENT '类型名称',
  `orderNo` int(11) default NULL COMMENT '显示顺序，有小到大显示',
  `isDelete` int(11) default NULL COMMENT '是否可用，1为可用 0为不可用',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='业务员设定的积分等级';

--
-- Dumping data for table `dicreceivelevel`
--


/*!40000 ALTER TABLE `dicreceivelevel` DISABLE KEYS */;
LOCK TABLES `dicreceivelevel` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `dicreceivelevel` ENABLE KEYS */;

--
-- Table structure for table `dicscorelevel`
--

DROP TABLE IF EXISTS `dicscorelevel`;
CREATE TABLE `dicscorelevel` (
  `id` int(11) NOT NULL,
  `min` int(11) default NULL COMMENT '本级别的积分下限',
  `max` int(11) default NULL COMMENT '本级别的积分上限',
  `name` varchar(32) collate utf8_unicode_ci default NULL,
  `orderNo` int(11) default NULL COMMENT '由小到大显示',
  `isDelete` int(11) default NULL COMMENT '1 为可用 0为不可用',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户自定义积分的等级';

--
-- Dumping data for table `dicscorelevel`
--


/*!40000 ALTER TABLE `dicscorelevel` DISABLE KEYS */;
LOCK TABLES `dicscorelevel` WRITE;
INSERT INTO `dicscorelevel` VALUES (1,0,0,'初始等级',1,1),(2,1,200,'一级',2,1),(3,201,400,'二级',3,1),(4,401,800,'三级',4,1),(5,801,1400,'四级',5,1),(6,1401,2000,'五级',6,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `dicscorelevel` ENABLE KEYS */;

--
-- Table structure for table `dicservicetype`
--

DROP TABLE IF EXISTS `dicservicetype`;
CREATE TABLE `dicservicetype` (
  `id` int(11) NOT NULL,
  `name` varchar(32) collate utf8_unicode_ci default NULL,
  `orderNo` int(11) default NULL COMMENT '由小到大显示',
  `isDelete` int(11) default NULL COMMENT '1 为可用 0为不可用',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='服务类型字典表';

--
-- Dumping data for table `dicservicetype`
--


/*!40000 ALTER TABLE `dicservicetype` DISABLE KEYS */;
LOCK TABLES `dicservicetype` WRITE;
INSERT INTO `dicservicetype` VALUES (1,'DPI',1,1),(2,'FRI',2,1),(3,'FUI',3,1),(4,'FRI+CLS',4,1),(5,'CLS',5,1),(6,'FAT',6,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `dicservicetype` ENABLE KEYS */;

--
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum` (
  `id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='记录论坛的热点信息';

--
-- Dumping data for table `forum`
--


/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
LOCK TABLES `forum` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;

--
-- Table structure for table `hot`
--

DROP TABLE IF EXISTS `hot`;
CREATE TABLE `hot` (
  `id` int(11) NOT NULL,
  `title` varchar(100) collate utf8_unicode_ci default NULL,
  `ContentDesc` varchar(100) collate utf8_unicode_ci default NULL,
  `createDate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `orderNo` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hot`
--


/*!40000 ALTER TABLE `hot` DISABLE KEYS */;
LOCK TABLES `hot` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `hot` ENABLE KEYS */;

--
-- Table structure for table `messagecenter`
--

DROP TABLE IF EXISTS `messagecenter`;
CREATE TABLE `messagecenter` (
  `id` int(11) NOT NULL,
  `formUser` int(11) default NULL,
  `toUser` int(11) default NULL,
  `content` varchar(500) collate utf8_unicode_ci default NULL,
  `infoType` int(11) default NULL COMMENT '两种类型，1 交易提醒 2 系统通知',
  `sendTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='消息中心包括站内信/订单提醒消息\r\n';

--
-- Dumping data for table `messagecenter`
--


/*!40000 ALTER TABLE `messagecenter` DISABLE KEYS */;
LOCK TABLES `messagecenter` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `messagecenter` ENABLE KEYS */;

--
-- Table structure for table `moneychange`
--

DROP TABLE IF EXISTS `moneychange`;
CREATE TABLE `moneychange` (
  `id` int(11) NOT NULL,
  `value` int(11) default NULL,
  `orderId` int(11) default NULL,
  `userid` int(11) default NULL,
  `changeDate` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='金额的变更表';

--
-- Dumping data for table `moneychange`
--


/*!40000 ALTER TABLE `moneychange` DISABLE KEYS */;
LOCK TABLES `moneychange` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `moneychange` ENABLE KEYS */;

--
-- Table structure for table `orderdesc`
--

DROP TABLE IF EXISTS `orderdesc`;
CREATE TABLE `orderdesc` (
  `id` int(11) NOT NULL,
  `orderCode` varchar(50) collate utf8_unicode_ci default NULL COMMENT '业务编号',
  `serviceType` int(11) default NULL COMMENT '关联字典表',
  `receiveId` int(11) default NULL,
  `senderId` int(11) default NULL,
  `validateDate` date default NULL,
  `supplyAddr` varchar(100) collate utf8_unicode_ci default NULL,
  `suppyCity` int(11) default NULL,
  `suppyAddrLatitude` varchar(100) collate utf8_unicode_ci default NULL,
  `productType` int(11) default NULL COMMENT '关联字典表',
  `goodsCity` int(11) default NULL,
  `goodsAddr` varchar(100) collate utf8_unicode_ci default NULL,
  `goodsAddrLatitude` varchar(100) collate utf8_unicode_ci default NULL,
  `serviceProviderType` int(11) default NULL COMMENT '1 第三方验货公司，2 个人验货员',
  `suppyContact` varchar(100) collate utf8_unicode_ci default NULL,
  `suppyTelephone` varchar(100) collate utf8_unicode_ci default NULL,
  `productDatum` varchar(100) collate utf8_unicode_ci default NULL COMMENT '存储地址',
  `status` int(11) default NULL COMMENT '关联字典表',
  `remarks` varchar(500) collate utf8_unicode_ci default NULL,
  `createDate` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='订单的记录信息';

--
-- Dumping data for table `orderdesc`
--


/*!40000 ALTER TABLE `orderdesc` DISABLE KEYS */;
LOCK TABLES `orderdesc` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `orderdesc` ENABLE KEYS */;

--
-- Table structure for table `orderreports`
--

DROP TABLE IF EXISTS `orderreports`;
CREATE TABLE `orderreports` (
  `id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='订单验收报告表';

--
-- Dumping data for table `orderreports`
--


/*!40000 ALTER TABLE `orderreports` DISABLE KEYS */;
LOCK TABLES `orderreports` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `orderreports` ENABLE KEYS */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `orderId` int(11) default NULL,
  `girard` varchar(40) collate utf8_unicode_ci default NULL,
  `name` varchar(40) collate utf8_unicode_ci default NULL,
  `number` double default NULL,
  `orderNo` int(11) default NULL,
  `remarks` varchar(100) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='订单的多个产品';

--
-- Dumping data for table `product`
--


/*!40000 ALTER TABLE `product` DISABLE KEYS */;
LOCK TABLES `product` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

--
-- Table structure for table `receiveorder`
--

DROP TABLE IF EXISTS `receiveorder`;
CREATE TABLE `receiveorder` (
  `id` int(11) NOT NULL,
  `userid` int(11) default NULL COMMENT '关联的基本账户的主键',
  `name` varchar(32) collate utf8_unicode_ci default NULL,
  `nickname` varchar(32) collate utf8_unicode_ci default NULL,
  `gender` int(11) default NULL COMMENT '关联字典表',
  `birth` date default NULL,
  `idcard` varchar(32) collate utf8_unicode_ci default NULL,
  `phone` int(11) default NULL,
  `email` varchar(32) collate utf8_unicode_ci default NULL,
  `city` int(11) default NULL COMMENT '关联字典表',
  `address` varchar(32) collate utf8_unicode_ci default NULL,
  `addrLatitude` varchar(32) collate utf8_unicode_ci default NULL,
  `ServiceCity` varchar(50) collate utf8_unicode_ci default NULL COMMENT '关联字典表',
  `serviceAddr` varchar(32) collate utf8_unicode_ci default NULL,
  `serviceAddrLatitude` varchar(32) collate utf8_unicode_ci default NULL,
  `servceType` int(11) default NULL COMMENT '关联字典表',
  `prodectType` int(11) default NULL COMMENT '关联字典表',
  `education` int(11) default NULL COMMENT '关联字典表',
  `language` int(11) default NULL COMMENT '关联字典表',
  `resume` varchar(100) collate utf8_unicode_ci default NULL COMMENT '存放位置',
  `photo` varchar(100) collate utf8_unicode_ci default NULL COMMENT '存放位置，生活照',
  `cardPhoto` varchar(100) collate utf8_unicode_ci default NULL COMMENT '存放位置',
  `emergencyContact` varchar(100) collate utf8_unicode_ci default NULL,
  `level` int(11) default NULL COMMENT '个人接单方的级别，关联字典表',
  `craeteDate` date default NULL,
  `restDate` varchar(100) collate utf8_unicode_ci default NULL COMMENT '休息时间，不参与接单；使用，形式分割多个日期，默认为可以接单',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='接单表分为个人';

--
-- Dumping data for table `receiveorder`
--


/*!40000 ALTER TABLE `receiveorder` DISABLE KEYS */;
LOCK TABLES `receiveorder` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `receiveorder` ENABLE KEYS */;

--
-- Table structure for table `receiveordercompany`
--

DROP TABLE IF EXISTS `receiveordercompany`;
CREATE TABLE `receiveordercompany` (
  `id` int(11) NOT NULL,
  `userid` int(11) default NULL COMMENT '关联用户基础表',
  `name` varchar(50) collate utf8_unicode_ci default NULL COMMENT 'name',
  `nikename` varchar(50) collate utf8_unicode_ci default NULL COMMENT 'nickname',
  `companySize` int(11) default NULL COMMENT 'companySize 关联字典表',
  `telephone` varchar(20) collate utf8_unicode_ci default NULL,
  `city` int(11) default NULL COMMENT '关联字典表',
  `email` varchar(50) collate utf8_unicode_ci default NULL,
  `address` varchar(50) collate utf8_unicode_ci default NULL,
  `addrLatitude` varchar(50) collate utf8_unicode_ci default NULL,
  `ServiceCity` varchar(50) collate utf8_unicode_ci default NULL COMMENT '关联字典表',
  `serviceAddr` varchar(500) collate utf8_unicode_ci default NULL COMMENT '地址不限个数',
  `serviceAddrLatitude` varchar(500) collate utf8_unicode_ci default NULL,
  `serviceType` int(11) default NULL,
  `prodectType` int(11) default NULL,
  `contact` varchar(50) collate utf8_unicode_ci default NULL,
  `cardphoto` varchar(50) collate utf8_unicode_ci default NULL COMMENT '存储地址',
  `website` varchar(50) collate utf8_unicode_ci default NULL,
  `logo` varchar(50) collate utf8_unicode_ci default NULL COMMENT '存储地址',
  `craeteDate` date default NULL,
  `restDate` varchar(100) collate utf8_unicode_ci default NULL COMMENT '休息时间，不参与接单；使用，形式分割多个日期，默认为可以接单',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='接单表分为第三方公司';

--
-- Dumping data for table `receiveordercompany`
--


/*!40000 ALTER TABLE `receiveordercompany` DISABLE KEYS */;
LOCK TABLES `receiveordercompany` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `receiveordercompany` ENABLE KEYS */;

--
-- Table structure for table `reportinfo`
--

DROP TABLE IF EXISTS `reportinfo`;
CREATE TABLE `reportinfo` (
  `id` int(11) NOT NULL,
  `orderId` int(11) default NULL,
  `userId` int(11) default NULL,
  `content` varchar(200) collate utf8_unicode_ci default NULL,
  `descDate` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='对于订单的举报';

--
-- Dumping data for table `reportinfo`
--


/*!40000 ALTER TABLE `reportinfo` DISABLE KEYS */;
LOCK TABLES `reportinfo` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `reportinfo` ENABLE KEYS */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) default NULL,
  `name` varchar(32) collate utf8_unicode_ci default NULL COMMENT '角色的名称',
  `isdelete` int(11) default NULL COMMENT '角色是否可用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='分为 普通用户，管理员，财务角色';

--
-- Dumping data for table `role`
--


/*!40000 ALTER TABLE `role` DISABLE KEYS */;
LOCK TABLES `role` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `id` int(11) default NULL,
  `name` varchar(20) collate utf8_unicode_ci default NULL,
  `content` varchar(400) collate utf8_unicode_ci default NULL,
  `createDate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `type` int(11) default NULL COMMENT '1,专业讲师培训 2 培训计划公告 3 培训报名通道 4 培训展示'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='学堂信息的设置';

--
-- Dumping data for table `school`
--


/*!40000 ALTER TABLE `school` DISABLE KEYS */;
LOCK TABLES `school` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `school` ENABLE KEYS */;

--
-- Table structure for table `scorechange`
--

DROP TABLE IF EXISTS `scorechange`;
CREATE TABLE `scorechange` (
  `id` int(11) NOT NULL,
  `userid` int(11) default NULL,
  `content` int(11) default NULL COMMENT '变化的内容目前只有四项 ：1 为签到；2为分享；3为邀请好友；4，评价',
  `value` int(11) default NULL,
  `changeDate` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='积分的变化';

--
-- Dumping data for table `scorechange`
--


/*!40000 ALTER TABLE `scorechange` DISABLE KEYS */;
LOCK TABLES `scorechange` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `scorechange` ENABLE KEYS */;

--
-- Table structure for table `sendorder`
--

DROP TABLE IF EXISTS `sendorder`;
CREATE TABLE `sendorder` (
  `id` int(11) NOT NULL,
  `userid` int(11) default NULL,
  `name` varchar(50) collate utf8_unicode_ci default NULL,
  `nikename` varchar(50) collate utf8_unicode_ci default NULL,
  `nature` int(11) default NULL COMMENT '关联字典表',
  `email` varchar(50) collate utf8_unicode_ci default NULL,
  `telephone` varchar(50) collate utf8_unicode_ci default NULL,
  `contact` varchar(50) collate utf8_unicode_ci default NULL,
  `city` int(11) default NULL COMMENT '关联字典表',
  `address` varchar(50) collate utf8_unicode_ci default NULL,
  `addrlatitude` varchar(50) collate utf8_unicode_ci default NULL,
  `cardphoto` varchar(50) collate utf8_unicode_ci default NULL COMMENT '存储地址',
  `craeteDate` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='发送订单的详细信息';

--
-- Dumping data for table `sendorder`
--


/*!40000 ALTER TABLE `sendorder` DISABLE KEYS */;
LOCK TABLES `sendorder` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `sendorder` ENABLE KEYS */;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) collate utf8_unicode_ci NOT NULL,
  `psw` varchar(45) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student`
--


/*!40000 ALTER TABLE `student` DISABLE KEYS */;
LOCK TABLES `student` WRITE;
INSERT INTO `student` VALUES (1,'1','1问问');
UNLOCK TABLES;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

--
-- Table structure for table `user_login`
--

DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login` (
  `id` int(11) NOT NULL,
  `loginname` varchar(20) collate utf8_unicode_ci default NULL COMMENT '登录用户名，邮箱 全网唯一',
  `password` varchar(32) collate utf8_unicode_ci default NULL COMMENT 'sha加密',
  `logtype` varchar(32) collate utf8_unicode_ci default NULL COMMENT '分为三个类型，发单方 接单方 发单方+接单方',
  `qq` varchar(32) collate utf8_unicode_ci default NULL COMMENT '登录方式',
  `weixin` varchar(32) collate utf8_unicode_ci default NULL,
  `inInfo` varchar(32) collate utf8_unicode_ci default NULL,
  `facebook` varchar(32) collate utf8_unicode_ci default NULL,
  `twitter` varchar(32) collate utf8_unicode_ci default NULL,
  `skype` varchar(32) collate utf8_unicode_ci default NULL,
  `score` int(11) default NULL COMMENT '用户积分',
  `money` int(11) default NULL COMMENT '用户额度',
  `roleid` int(11) default NULL COMMENT '角色id',
  `invitationId` int(11) default NULL COMMENT '邀请的用户id',
  `status` int(11) default NULL COMMENT '用户状态 1 为可用 0为不可用',
  `craeteDate` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='平台账户的登录信息';

--
-- Dumping data for table `user_login`
--


/*!40000 ALTER TABLE `user_login` DISABLE KEYS */;
LOCK TABLES `user_login` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_login` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

