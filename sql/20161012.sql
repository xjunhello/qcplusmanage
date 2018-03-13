/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50173
Source Host           : 192.166.30.190:3306
Source Database       : qcplus

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-10-12 17:59:41
*/

SET FOREIGN_KEY_CHECKS=0;

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

/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50173
Source Host           : 192.166.30.190:3306
Source Database       : qcplus

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-10-12 17:59:54
*/

SET FOREIGN_KEY_CHECKS=0;

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
