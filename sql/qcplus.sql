/*
Navicat MySQL Data Transfer

Source Server         : localhost_qcplus
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : qcplus

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2018-03-14 00:21:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel` (
  `id` int(11) NOT NULL,
  `descInfo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imagePath` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `orderNo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='首页的轮播图';

-- ----------------------------
-- Records of carousel
-- ----------------------------

-- ----------------------------
-- Table structure for commentinfo
-- ----------------------------
DROP TABLE IF EXISTS `commentinfo`;
CREATE TABLE `commentinfo` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `content` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='对于订单的评论';

-- ----------------------------
-- Records of commentinfo
-- ----------------------------

-- ----------------------------
-- Table structure for configuraton
-- ----------------------------
DROP TABLE IF EXISTS `configuraton`;
CREATE TABLE `configuraton` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='资源配置表';

-- ----------------------------
-- Records of configuraton
-- ----------------------------

-- ----------------------------
-- Table structure for dicattreducation
-- ----------------------------
DROP TABLE IF EXISTS `dicattreducation`;
CREATE TABLE `dicattreducation` (
  `ID` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '语言类型名称',
  `orderNo` int(11) DEFAULT NULL COMMENT '显示顺序，有小到大显示',
  `isDelete` int(11) DEFAULT NULL COMMENT '是否可用，1为可用 0为不可用',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='记录受教育程度';

-- ----------------------------
-- Records of dicattreducation
-- ----------------------------

-- ----------------------------
-- Table structure for dicattrgender
-- ----------------------------
DROP TABLE IF EXISTS `dicattrgender`;
CREATE TABLE `dicattrgender` (
  `ID` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '语言类型名称',
  `orderNo` int(11) DEFAULT NULL COMMENT '显示顺序，有小到大显示',
  `isDelete` int(11) DEFAULT NULL COMMENT '是否可用，1为可用 0为不可用',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='性别，男女';

-- ----------------------------
-- Records of dicattrgender
-- ----------------------------
INSERT INTO `dicattrgender` VALUES ('1', '男', '1', '1');
INSERT INTO `dicattrgender` VALUES ('2', '女', '2', '1');

-- ----------------------------
-- Table structure for diccompanynature
-- ----------------------------
DROP TABLE IF EXISTS `diccompanynature`;
CREATE TABLE `diccompanynature` (
  `ID` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型名称',
  `orderNo` int(11) DEFAULT NULL COMMENT '显示顺序，有小到大显示',
  `isDelete` int(11) DEFAULT NULL COMMENT '是否可用，1为可用 0为不可用',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='公司性质';

-- ----------------------------
-- Records of diccompanynature
-- ----------------------------
INSERT INTO `diccompanynature` VALUES ('1', '批发商', '1', '1');
INSERT INTO `diccompanynature` VALUES ('2', '贸易商', '2', '1');
INSERT INTO `diccompanynature` VALUES ('3', '连锁超市', '3', '1');
INSERT INTO `diccompanynature` VALUES ('4', '百货公司', '4', '1');
INSERT INTO `diccompanynature` VALUES ('5', '品牌进口商', '5', '1');
INSERT INTO `diccompanynature` VALUES ('6', '零售商', '6', '1');
INSERT INTO `diccompanynature` VALUES ('7', '第三方验货公司', '7', '1');
INSERT INTO `diccompanynature` VALUES ('8', '个人或其他', '8', '1');

-- ----------------------------
-- Table structure for diccompanysize
-- ----------------------------
DROP TABLE IF EXISTS `diccompanysize`;
CREATE TABLE `diccompanysize` (
  `ID` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型名称',
  `orderNo` int(11) DEFAULT NULL COMMENT '显示顺序，有小到大显示',
  `isDelete` int(11) DEFAULT NULL COMMENT '是否可用，1为可用 0为不可用',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='公司规模 ，目前分为五个等级';

-- ----------------------------
-- Records of diccompanysize
-- ----------------------------
INSERT INTO `diccompanysize` VALUES ('1', '0-10', '1', '1');
INSERT INTO `diccompanysize` VALUES ('2', '11-30', '2', '1');
INSERT INTO `diccompanysize` VALUES ('3', '31-50', '3', '1');
INSERT INTO `diccompanysize` VALUES ('4', '51-100', '4', '1');
INSERT INTO `diccompanysize` VALUES ('5', '100以上', '5', '1');

-- ----------------------------
-- Table structure for diccountry
-- ----------------------------
DROP TABLE IF EXISTS `diccountry`;
CREATE TABLE `diccountry` (
  `id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orderNo` int(11) DEFAULT NULL COMMENT '有小到大显示',
  `country` int(11) DEFAULT NULL COMMENT '是否是国家，1为国家，0为非国家',
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用于获取省份信息',
  `isDelete` int(11) DEFAULT NULL COMMENT '1为可以，0为不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='记录国家和地区的基本信息';

-- ----------------------------
-- Records of diccountry
-- ----------------------------

-- ----------------------------
-- Table structure for diclanguages
-- ----------------------------
DROP TABLE IF EXISTS `diclanguages`;
CREATE TABLE `diclanguages` (
  `ID` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '语言类型名称',
  `orderNo` int(11) DEFAULT NULL COMMENT '显示顺序，有小到大显示',
  `isDelete` int(11) DEFAULT NULL COMMENT '是否可用，1为可用 0为不可用',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='基于语言技能，共计四种';

-- ----------------------------
-- Records of diclanguages
-- ----------------------------
INSERT INTO `diclanguages` VALUES ('1', '熟练书写验收报告', '1', '1');
INSERT INTO `diclanguages` VALUES ('2', '熟练阅读英文资料', '2', '1');
INSERT INTO `diclanguages` VALUES ('3', '面对面简单交流', '3', '1');
INSERT INTO `diclanguages` VALUES ('4', '面对面深入交流', '4', '1');

-- ----------------------------
-- Table structure for dicorderstatus
-- ----------------------------
DROP TABLE IF EXISTS `dicorderstatus`;
CREATE TABLE `dicorderstatus` (
  `id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orderNo` int(11) DEFAULT NULL COMMENT '由小到大显示',
  `isDelete` int(11) DEFAULT NULL COMMENT '1 为可用 0为不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='共计4个状态';

-- ----------------------------
-- Records of dicorderstatus
-- ----------------------------
INSERT INTO `dicorderstatus` VALUES ('1', '待接单', '1', '1');
INSERT INTO `dicorderstatus` VALUES ('2', '待验货', '2', '1');
INSERT INTO `dicorderstatus` VALUES ('3', '待付款', '3', '1');
INSERT INTO `dicorderstatus` VALUES ('4', '交易完成', '4', '1');

-- ----------------------------
-- Table structure for dicproducttype
-- ----------------------------
DROP TABLE IF EXISTS `dicproducttype`;
CREATE TABLE `dicproducttype` (
  `id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orderNo` int(11) DEFAULT NULL COMMENT '由小到大显示',
  `isDelete` int(11) DEFAULT NULL COMMENT '1 为可用 0为不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of dicproducttype
-- ----------------------------

-- ----------------------------
-- Table structure for dicreceivelevel
-- ----------------------------
DROP TABLE IF EXISTS `dicreceivelevel`;
CREATE TABLE `dicreceivelevel` (
  `ID` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型名称',
  `orderNo` int(11) DEFAULT NULL COMMENT '显示顺序，有小到大显示',
  `isDelete` int(11) DEFAULT NULL COMMENT '是否可用，1为可用 0为不可用',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='业务员设定的积分等级';

-- ----------------------------
-- Records of dicreceivelevel
-- ----------------------------

-- ----------------------------
-- Table structure for dicscorelevel
-- ----------------------------
DROP TABLE IF EXISTS `dicscorelevel`;
CREATE TABLE `dicscorelevel` (
  `id` int(11) NOT NULL,
  `min` int(11) DEFAULT NULL COMMENT '本级别的积分下限',
  `max` int(11) DEFAULT NULL COMMENT '本级别的积分上限',
  `name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orderNo` int(11) DEFAULT NULL COMMENT '由小到大显示',
  `isDelete` int(11) DEFAULT NULL COMMENT '1 为可用 0为不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户自定义积分的等级';

-- ----------------------------
-- Records of dicscorelevel
-- ----------------------------
INSERT INTO `dicscorelevel` VALUES ('1', '0', '0', '初始等级', '1', '1');
INSERT INTO `dicscorelevel` VALUES ('2', '1', '200', '一级', '2', '1');
INSERT INTO `dicscorelevel` VALUES ('3', '201', '400', '二级', '3', '1');
INSERT INTO `dicscorelevel` VALUES ('4', '401', '800', '三级', '4', '1');
INSERT INTO `dicscorelevel` VALUES ('5', '801', '1400', '四级', '5', '1');
INSERT INTO `dicscorelevel` VALUES ('6', '1401', '2000', '五级', '6', '1');

-- ----------------------------
-- Table structure for dicservicetype
-- ----------------------------
DROP TABLE IF EXISTS `dicservicetype`;
CREATE TABLE `dicservicetype` (
  `id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orderNo` int(11) DEFAULT NULL COMMENT '由小到大显示',
  `isDelete` int(11) DEFAULT NULL COMMENT '1 为可用 0为不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='服务类型字典表';

-- ----------------------------
-- Records of dicservicetype
-- ----------------------------
INSERT INTO `dicservicetype` VALUES ('1', 'DPI', '1', '1');
INSERT INTO `dicservicetype` VALUES ('2', 'FRI', '2', '1');
INSERT INTO `dicservicetype` VALUES ('3', 'FUI', '3', '1');
INSERT INTO `dicservicetype` VALUES ('4', 'FRI+CLS', '4', '1');
INSERT INTO `dicservicetype` VALUES ('5', 'CLS', '5', '1');
INSERT INTO `dicservicetype` VALUES ('6', 'FAT', '6', '1');

-- ----------------------------
-- Table structure for forum
-- ----------------------------
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='记录论坛的热点信息';

-- ----------------------------
-- Records of forum
-- ----------------------------

-- ----------------------------
-- Table structure for hot
-- ----------------------------
DROP TABLE IF EXISTS `hot`;
CREATE TABLE `hot` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ContentDesc` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `orderNo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of hot
-- ----------------------------

-- ----------------------------
-- Table structure for messagecenter
-- ----------------------------
DROP TABLE IF EXISTS `messagecenter`;
CREATE TABLE `messagecenter` (
  `id` int(11) NOT NULL,
  `formUser` int(11) DEFAULT NULL,
  `toUser` int(11) DEFAULT NULL,
  `content` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `infoType` int(11) DEFAULT NULL COMMENT '两种类型，1 交易提醒 2 系统通知',
  `sendTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='消息中心包括站内信/订单提醒消息\r\n';

-- ----------------------------
-- Records of messagecenter
-- ----------------------------

-- ----------------------------
-- Table structure for moneychange
-- ----------------------------
DROP TABLE IF EXISTS `moneychange`;
CREATE TABLE `moneychange` (
  `id` int(11) NOT NULL,
  `value` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `changeDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='金额的变更表';

-- ----------------------------
-- Records of moneychange
-- ----------------------------

-- ----------------------------
-- Table structure for orderdesc
-- ----------------------------
DROP TABLE IF EXISTS `orderdesc`;
CREATE TABLE `orderdesc` (
  `id` int(11) NOT NULL,
  `orderCode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业务编号',
  `serviceType` int(11) DEFAULT NULL COMMENT '关联字典表',
  `receiveId` int(11) DEFAULT NULL,
  `senderId` int(11) DEFAULT NULL,
  `validateDate` date DEFAULT NULL,
  `supplyAddr` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suppyCity` int(11) DEFAULT NULL,
  `suppyAddrLatitude` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productType` int(11) DEFAULT NULL COMMENT '关联字典表',
  `goodsCity` int(11) DEFAULT NULL,
  `goodsAddr` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goodsAddrLatitude` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serviceProviderType` int(11) DEFAULT NULL COMMENT '1 第三方验货公司，2 个人验货员',
  `suppyContact` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suppyTelephone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productDatum` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '存储地址',
  `status` int(11) DEFAULT NULL COMMENT '关联字典表',
  `remarks` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='订单的记录信息';

-- ----------------------------
-- Records of orderdesc
-- ----------------------------

-- ----------------------------
-- Table structure for orderreports
-- ----------------------------
DROP TABLE IF EXISTS `orderreports`;
CREATE TABLE `orderreports` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='订单验收报告表';

-- ----------------------------
-- Records of orderreports
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `girard` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` double DEFAULT NULL,
  `orderNo` int(11) DEFAULT NULL,
  `remarks` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='订单的多个产品';

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for receiveorder
-- ----------------------------
DROP TABLE IF EXISTS `receiveorder`;
CREATE TABLE `receiveorder` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL COMMENT '关联的基本账户的主键',
  `name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nickname` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` int(11) DEFAULT NULL COMMENT '关联字典表',
  `birth` date DEFAULT NULL,
  `idcard` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` int(11) DEFAULT NULL COMMENT '关联字典表',
  `address` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addrLatitude` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ServiceCity` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联字典表',
  `serviceAddr` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serviceAddrLatitude` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `servceType` int(11) DEFAULT NULL COMMENT '关联字典表',
  `prodectType` int(11) DEFAULT NULL COMMENT '关联字典表',
  `education` int(11) DEFAULT NULL COMMENT '关联字典表',
  `language` int(11) DEFAULT NULL COMMENT '关联字典表',
  `resume` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '存放位置',
  `photo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '存放位置，生活照',
  `cardPhoto` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '存放位置',
  `emergencyContact` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(11) DEFAULT NULL COMMENT '个人接单方的级别，关联字典表',
  `craeteDate` date DEFAULT NULL,
  `restDate` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '休息时间，不参与接单；使用，形式分割多个日期，默认为可以接单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='接单表分为个人';

-- ----------------------------
-- Records of receiveorder
-- ----------------------------

-- ----------------------------
-- Table structure for receiveordercompany
-- ----------------------------
DROP TABLE IF EXISTS `receiveordercompany`;
CREATE TABLE `receiveordercompany` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL COMMENT '关联用户基础表',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'name',
  `nikename` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'nickname',
  `companySize` int(11) DEFAULT NULL COMMENT 'companySize 关联字典表',
  `telephone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` int(11) DEFAULT NULL COMMENT '关联字典表',
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addrLatitude` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ServiceCity` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联字典表',
  `serviceAddr` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址不限个数',
  `serviceAddrLatitude` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serviceType` int(11) DEFAULT NULL,
  `prodectType` int(11) DEFAULT NULL,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cardphoto` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '存储地址',
  `website` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '存储地址',
  `craeteDate` date DEFAULT NULL,
  `restDate` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '休息时间，不参与接单；使用，形式分割多个日期，默认为可以接单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='接单表分为第三方公司';

-- ----------------------------
-- Records of receiveordercompany
-- ----------------------------

-- ----------------------------
-- Table structure for reportinfo
-- ----------------------------
DROP TABLE IF EXISTS `reportinfo`;
CREATE TABLE `reportinfo` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `content` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='对于订单的举报';

-- ----------------------------
-- Records of reportinfo
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色的名称',
  `isdelete` int(11) DEFAULT '0' COMMENT '角色是否可用',
  `descrtion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name_unique` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='分为 普通用户，管理员，财务角色';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'Admin', '0', '管理员');
INSERT INTO `role` VALUES ('2', 'user', '0', '普通用户');
INSERT INTO `role` VALUES ('3', 'Accountant', '0', '财务人员');

-- ----------------------------
-- Table structure for user_login
-- ----------------------------
DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login` (
  `id` int(11) NOT NULL,
  `loginname` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '登录用户名，邮箱 全网唯一',
  `password` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'sha加密',
  `logtype` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分为三个类型，发单方 接单方 发单方+接单方',
  `qq` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登录方式',
  `weixin` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inInfo` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skype` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `score` int(11) DEFAULT NULL COMMENT '用户积分',
  `money` int(11) DEFAULT NULL COMMENT '用户额度',
  `roleid` int(11) DEFAULT NULL COMMENT '角色id',
  `invitationId` int(11) DEFAULT NULL COMMENT '邀请的用户id',
  `status` int(11) DEFAULT NULL COMMENT '用户状态 1 为可用 0为不可用',
  `createDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_loginname_unique` (`loginname`) USING BTREE,
  KEY `user_role_id` (`roleid`),
  CONSTRAINT `user_role_id` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='平台账户的登录信息';

-- ----------------------------
-- Records of user_login
-- ----------------------------
