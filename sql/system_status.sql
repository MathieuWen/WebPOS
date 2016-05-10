/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.253
Source Server Version : 50154
Source Host           : 192.168.2.253:3306
Source Database       : conductor

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2012-01-11 09:00:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `system_status`
-- ----------------------------
DROP TABLE IF EXISTS `system_status`;
CREATE TABLE `system_status` (
  `status_no` tinyint(2) NOT NULL,
  `status_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_value` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `isTableActive` tinyint(1) DEFAULT '0',
  `isGlobalChange` tinyint(1) DEFAULT '0',
  `isInStock` tinyint(1) unsigned DEFAULT '0' COMMENT '是否入庫存',
  `ordering` int(2) DEFAULT '1',
  PRIMARY KEY (`status_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_status
-- ----------------------------
INSERT INTO `system_status` VALUES ('-7', 'STATUSDISANNUL', '作廢', '0', '0', '0', '6');
INSERT INTO `system_status` VALUES ('7', 'STATUSDISANNULSTUB', '作廢存根', '0', '0', '1', '7');
INSERT INTO `system_status` VALUES ('8', 'STATUSCHECKOUT', '已結帳', '0', '1', '1', '3');
INSERT INTO `system_status` VALUES ('14', 'STATUSCHECKING', '結帳', '0', '0', '0', '8');
INSERT INTO `system_status` VALUES ('12', 'STATUSSETTLEMENT', '清帳', '0', '0', '0', '5');
INSERT INTO `system_status` VALUES ('10', 'STATUSRECEIVEDORDER', '收單', '1', '1', '0', '2');
INSERT INTO `system_status` VALUES ('9', 'STATUSRETURNED', '退貨', '0', '0', '1', '4');
INSERT INTO `system_status` VALUES ('0', 'STATUSNONE', '預設', '0', '1', '0', '1');
INSERT INTO `system_status` VALUES ('1', null, '廠商進貨', '0', '0', '1', '19');
INSERT INTO `system_status` VALUES ('2', null, '廠商退貨', '0', '0', '1', '20');
INSERT INTO `system_status` VALUES ('3', null, '調貨', '0', '0', '1', '21');
INSERT INTO `system_status` VALUES ('4', null, '盤點', '0', '0', '1', '22');
INSERT INTO `system_status` VALUES ('5', null, '銷售', '0', '0', '0', '23');
INSERT INTO `system_status` VALUES ('6', null, '清倉', '0', '0', '1', '24');
INSERT INTO `system_status` VALUES ('15', 'STATUSDISABLEMERGE', '併桌失效', '0', '0', '1', '9');
INSERT INTO `system_status` VALUES ('16', 'STATUSDISABLERECEIVED', '收單失效', '0', '0', '1', '10');
