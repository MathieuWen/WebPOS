/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.253
Source Server Version : 50154
Source Host           : 192.168.2.253:3306
Source Database       : conductor

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2012-01-11 08:59:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `data_station`
-- ----------------------------
DROP TABLE IF EXISTS `data_station`;
CREATE TABLE `data_station` (
  `station_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(20) unsigned NOT NULL,
  `station_no` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `station_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT '127.0.0.1',
  `udate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uby` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of data_station
-- ----------------------------
INSERT INTO `data_station` VALUES ('12', '1', '01', '127.0.0.1', '2011-12-12 17:33:12', '社區經理');
INSERT INTO `data_station` VALUES ('13', '1', '02', '127.0.0.1', '2011-12-10 01:22:53', 'ZDN');
INSERT INTO `data_station` VALUES ('14', '1', '03', '127.0.0.1', '2011-12-10 01:22:54', 'ZDN');
INSERT INTO `data_station` VALUES ('15', '1', '04', '127.0.0.1', '2011-12-10 01:22:56', 'ZDN');
