/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.253
Source Server Version : 50154
Source Host           : 192.168.2.253:3306
Source Database       : conductor

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2012-01-11 09:00:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `SpecialSales_rulelist`
-- ----------------------------
DROP TABLE IF EXISTS `SpecialSales_rulelist`;
CREATE TABLE `SpecialSales_rulelist` (
  `special_rulelist_index` int(20) NOT NULL AUTO_INCREMENT,
  `special_rule_index` int(20) NOT NULL,
  `item_id` int(20) NOT NULL,
  `require_min_quantity` float(8,2) DEFAULT '1.00',
  `require_max_quantity` float(8,2) DEFAULT '1.00',
  `timeout` int(20) unsigned DEFAULT NULL,
  `item_price_flag` int(3) DEFAULT '0',
  `alterDiscount` int(2) DEFAULT NULL,
  `alterPrice` float(8,2) DEFAULT NULL,
  `udate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`special_rulelist_index`),
  KEY `special_rule_index` (`special_rule_index`),
  CONSTRAINT `special_rule_index` FOREIGN KEY (`special_rule_index`) REFERENCES `SpecialSales_rule` (`special_rule_index`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of SpecialSales_rulelist
-- ----------------------------
INSERT INTO `SpecialSales_rulelist` VALUES ('1', '1', '236', '1.00', '1.00', null, '0', null, '23.00', '2011-12-27 13:19:50');
INSERT INTO `SpecialSales_rulelist` VALUES ('2', '1', '237', '1.00', '1.00', null, '0', null, '23.00', '2011-12-27 13:19:51');
INSERT INTO `SpecialSales_rulelist` VALUES ('3', '2', '259', '1.00', '1.00', null, '2', null, null, '2011-12-29 00:41:14');
INSERT INTO `SpecialSales_rulelist` VALUES ('4', '3', '241', '1.00', '1.00', null, '0', null, null, '2011-12-29 20:44:07');
INSERT INTO `SpecialSales_rulelist` VALUES ('5', '3', '266', '1.00', '1.00', null, '0', null, null, '2011-12-29 20:44:21');
