/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.253
Source Server Version : 50154
Source Host           : 192.168.2.253:3306
Source Database       : conductor

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2012-01-11 09:00:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `SpecialSales_rule`
-- ----------------------------
DROP TABLE IF EXISTS `SpecialSales_rule`;
CREATE TABLE `SpecialSales_rule` (
  `special_rule_index` int(20) NOT NULL AUTO_INCREMENT,
  `special_no` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `special_type` int(3) DEFAULT '0',
  `require_amount` float(8,2) DEFAULT NULL,
  `require_total` float(8,2) DEFAULT NULL,
  `require_customer_level` tinyint(1) DEFAULT NULL,
  `period` text COLLATE utf8_unicode_ci COMMENT '使用期間 (yyyy-mm-dd|yyyy-mm-dd[,yyyy-mm-dd|yyyy-mm-dd,...])',
  `time_start` time DEFAULT NULL,
  `time_end` int(13) DEFAULT '0',
  `userestrictions` int(20) DEFAULT '0' COMMENT '單次銷售無使用限制(m=0:無使用限制, m>0:限制使用m次)',
  `totalrestrictions` int(20) DEFAULT '0' COMMENT '總使用限制(遞減) (m=0:無限制, m>0 || m<n: 最多使用n次',
  `establishdate` datetime DEFAULT NULL,
  `allowance` float(8,2) DEFAULT NULL,
  `individual` tinyint(1) DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `uby` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `udate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `system` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`special_rule_index`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of SpecialSales_rule
-- ----------------------------
INSERT INTO `SpecialSales_rule` VALUES ('1', 'a00000001', '1', null, null, null, null, '01:00:00', '3600', '0', '0', null, null, '1', '1', 'ZDN', '2011-12-29 21:36:55', '1');
INSERT INTO `SpecialSales_rule` VALUES ('2', 'a00000002', '2', null, null, null, null, '00:00:00', '3600', '0', '0', null, null, '1', '1', 'ZDN', '2011-12-29 21:36:57', '1');
INSERT INTO `SpecialSales_rule` VALUES ('3', 'a00000003', '3', null, null, null, null, null, '0', '0', '0', null, '14.00', '0', '1', 'ZDN', '2011-12-29 20:43:34', '0');
