/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.253
Source Server Version : 50154
Source Host           : 192.168.2.253:3306
Source Database       : conductor

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2012-01-11 09:01:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `data_device`
-- ----------------------------
DROP TABLE IF EXISTS `data_device`;
CREATE TABLE `data_device` (
  `device_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(20) unsigned NOT NULL,
  `station_id` int(20) unsigned NOT NULL,
  `device_label` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_location` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ip位置',
  `device_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'ip/comport',
  `print_template` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag_PrintOnReceived` tinyint(1) unsigned DEFAULT '0' COMMENT '收單印',
  `flag_PrintOnCheckOut` tinyint(1) unsigned DEFAULT '0' COMMENT '結帳印',
  `flag_PrintOnPrinted` tinyint(1) unsigned DEFAULT '0' COMMENT '印已經印過的',
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`device_id`),
  KEY `store_id` (`store_id`),
  KEY `station_id` (`station_id`),
  CONSTRAINT `station_id` FOREIGN KEY (`station_id`) REFERENCES `data_station` (`station_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `store_id` FOREIGN KEY (`store_id`) REFERENCES `data_store` (`store_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of data_device
-- ----------------------------
INSERT INTO `data_device` VALUES ('1', '1', '12', '1', 'COM3', '127.0.0.1', 'invoicing', 'receipt', '0', '0', '0', '0');
INSERT INTO `data_device` VALUES ('2', '1', '12', '2', 'COM4', '127.0.0.1', 'printer', 'listprowill', '0', '0', '0', '0');
INSERT INTO `data_device` VALUES ('3', '1', '13', null, 'COM5', '127.0.0.1', 'printer', 'prowill', '0', '0', '0', '1');
INSERT INTO `data_device` VALUES ('4', '1', '13', null, 'COM4', '127.0.0.1', 'invoicing', 'receipt', '0', '0', '0', '1');
INSERT INTO `data_device` VALUES ('5', '1', '12', '3', 'COM5', '192.168.2.9', 'printer', 'prowill', '0', '0', '0', '0');
INSERT INTO `data_device` VALUES ('6', '1', '12', null, 'COM4', '192.168.2.9', 'invoicing', 'receipt', '0', '0', '0', '0');
