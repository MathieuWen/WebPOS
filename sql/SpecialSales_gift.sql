/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.253
Source Server Version : 50154
Source Host           : 192.168.2.253:3306
Source Database       : conductor

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2012-01-11 09:00:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `SpecialSales_gift`
-- ----------------------------
DROP TABLE IF EXISTS `SpecialSales_gift`;
CREATE TABLE `SpecialSales_gift` (
  `special_rulegift_index` int(20) NOT NULL AUTO_INCREMENT,
  `special_rule_index` int(20) NOT NULL,
  `item_id` int(20) NOT NULL,
  `present_total` int(3) DEFAULT '1',
  `udate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`special_rulegift_index`),
  KEY `special_rule_gift` (`special_rule_index`),
  CONSTRAINT `special_rule_gift` FOREIGN KEY (`special_rule_index`) REFERENCES `SpecialSales_rule` (`special_rule_index`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of SpecialSales_gift
-- ----------------------------
