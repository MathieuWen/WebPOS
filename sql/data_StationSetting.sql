/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.253
Source Server Version : 50154
Source Host           : 192.168.2.253:3306
Source Database       : conductor

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2012-01-11 08:59:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `data_StationSetting`
-- ----------------------------
DROP TABLE IF EXISTS `data_StationSetting`;
CREATE TABLE `data_StationSetting` (
  `setting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `station_id` int(20) unsigned NOT NULL,
  `default_loading_Group` int(11) DEFAULT '0',
  `default_database` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'server',
  `item_default_price` int(3) DEFAULT '1' COMMENT '商品預設售價',
  `item_default_discountable` tinyint(1) DEFAULT '0' COMMENT '商品自動折扣',
  `item_default_discount` float DEFAULT '0.15' COMMENT '商品折扣',
  `purchase_default_allowable_allowance` tinyint(1) DEFAULT '1',
  `table_autoStart` tinyint(1) DEFAULT '1',
  `sales_taxrate` float DEFAULT '0.05' COMMENT '稅率',
  `curid` int(11) DEFAULT '1' COMMENT '錢幣索引',
  `rate_id` int(11) DEFAULT '1' COMMENT '匯率索引',
  `tip` float DEFAULT '0.1' COMMENT '服務費率',
  `point_gain_rate` float DEFAULT '0.3' COMMENT '金額換取點數',
  `point_rate` float DEFAULT '0.33' COMMENT '點數換取金額',
  `sales_max` int(11) DEFAULT '99999999' COMMENT '單筆輸入上限',
  `isalelength` int(11) DEFAULT '10' COMMENT '品名長度限制',
  `calculation` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'round',
  `quantity_round_off_to_the_n_decimal_place` int(11) DEFAULT '0' COMMENT '數量取小數第幾位',
  `amount_round_off_to_the_n_decimal_place` int(11) DEFAULT '0' COMMENT '總額取小數第幾位',
  `customer_birth_status` int(11) DEFAULT '0' COMMENT '顧客生日狀態',
  `prowill_title` varchar(60) COLLATE utf8_unicode_ci DEFAULT 'ZDPOS門市管理系統',
  PRIMARY KEY (`setting_id`),
  KEY `station_id` (`station_id`),
  CONSTRAINT `data_StationSetting_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `data_station` (`station_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of data_StationSetting
-- ----------------------------
INSERT INTO `data_StationSetting` VALUES ('1', '12', '0', 'server', '1', '0', '0.85', '1', '1', '0.05', '1', '1', '0.1', '0.3', '0.33', '99999999', '10', 'round', '0', '0', '0', 'ZDPOS門市管理系統');
INSERT INTO `data_StationSetting` VALUES ('2', '13', '0', 'server', '1', '0', '0.85', '1', '1', '0.05', '1', '1', '0.1', '0.3', '0.33', '99999999', '10', 'round', '0', '0', '0', 'ZDPOS門市管理系統');
INSERT INTO `data_StationSetting` VALUES ('3', '14', '0', 'server', '1', '0', '0.85', '1', '1', '0.05', '1', '1', '0.1', '0.3', '0.33', '99999999', '10', 'round', '0', '0', '0', 'ZDPOS門市管理系統');
INSERT INTO `data_StationSetting` VALUES ('4', '15', '0', 'server', '1', '0', '0.85', '1', '1', '0.05', '1', '1', '0.1', '0.3', '0.33', '99999999', '10', 'round', '0', '0', '0', 'ZDPOS門市管理系統');
