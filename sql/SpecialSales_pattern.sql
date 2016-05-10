/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.253
Source Server Version : 50154
Source Host           : 192.168.2.253:3306
Source Database       : conductor

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2012-01-11 09:00:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `SpecialSales_pattern`
-- ----------------------------
DROP TABLE IF EXISTS `SpecialSales_pattern`;
CREATE TABLE `SpecialSales_pattern` (
  `special_type` int(3) NOT NULL DEFAULT '0',
  `special_description` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag_integrated` tinyint(1) DEFAULT '0',
  `flag_integratedAmount` tinyint(1) DEFAULT '0',
  `flag_integratedTotal` tinyint(1) DEFAULT '0',
  `flag_integratedCustomerLevel` tinyint(1) DEFAULT '0',
  `flag_integratedTime` tinyint(1) DEFAULT '0',
  `flag_integratedUserestrictions` tinyint(1) DEFAULT '0',
  `flag_integratedTotalrestrictions` tinyint(1) DEFAULT '0',
  `flag_integratedGift` tinyint(1) DEFAULT '0',
  `flag_integratedAllowance` tinyint(1) DEFAULT '0',
  `flag_individual_min_quantity` tinyint(1) DEFAULT '0',
  `flag_individualTimeout` tinyint(1) DEFAULT '0',
  `flag_individual_max_quantity` tinyint(1) DEFAULT '0',
  `flag_individual_item_price_flag` tinyint(1) DEFAULT '0',
  `flag_individual_alterDiscount` tinyint(1) DEFAULT '0',
  `flag_individual_alterPrice` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`special_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of SpecialSales_pattern
-- ----------------------------
INSERT INTO `SpecialSales_pattern` VALUES ('0', '搭配商品-依時間改價', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '1');
INSERT INTO `SpecialSales_pattern` VALUES ('1', '依時間做改價-價格自訂', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `SpecialSales_pattern` VALUES ('2', '依時間做改價-價格索引', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0');
INSERT INTO `SpecialSales_pattern` VALUES ('3', '搭配商品-價錢折讓', '1', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0');
