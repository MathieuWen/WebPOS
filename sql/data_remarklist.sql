/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.253
Source Server Version : 50154
Source Host           : 192.168.2.253:3306
Source Database       : conductor

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2012-01-11 08:59:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `data_remarklist`
-- ----------------------------
DROP TABLE IF EXISTS `data_remarklist`;
CREATE TABLE `data_remarklist` (
  `remarklist_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `remark_id` int(20) unsigned NOT NULL,
  `remarklist_no` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `remarklist_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remarklist_price` float(8,2) NOT NULL DEFAULT '0.00',
  `remarklist_style` text COLLATE utf8_unicode_ci,
  `udate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`remarklist_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of data_remarklist
-- ----------------------------
INSERT INTO `data_remarklist` VALUES ('16', '8', '001', '大甜', '8.00', null, '2011-12-14 14:00:44');
INSERT INTO `data_remarklist` VALUES ('2', '8', '002', '甜度正常', '5.00', null, '2011-08-12 11:11:09');
INSERT INTO `data_remarklist` VALUES ('3', '8', '003', '微糖', '3.00', null, '2011-12-14 14:00:48');
INSERT INTO `data_remarklist` VALUES ('4', '8', '004', '半糖', '0.00', null, '2011-12-14 14:03:31');
INSERT INTO `data_remarklist` VALUES ('5', '8', '005', '無糖', '0.00', null, '2011-12-14 14:03:28');
INSERT INTO `data_remarklist` VALUES ('6', '19', '006', '大杯', '10.00', null, '0000-00-00 00:00:00');
INSERT INTO `data_remarklist` VALUES ('7', '19', '007', '中杯', '5.00', null, '0000-00-00 00:00:00');
INSERT INTO `data_remarklist` VALUES ('8', '19', '008', '小杯', '0.00', null, '0000-00-00 00:00:00');
INSERT INTO `data_remarklist` VALUES ('9', '15', '010', '粉圓', '5.00', null, '0000-00-00 00:00:00');
INSERT INTO `data_remarklist` VALUES ('10', '15', '011', '粉條', '5.00', null, '0000-00-00 00:00:00');
INSERT INTO `data_remarklist` VALUES ('11', '20', '012', '書套', '10.00', null, '0000-00-00 00:00:00');
INSERT INTO `data_remarklist` VALUES ('12', '20', '013', '藏書卷', '10.00', null, '0000-00-00 00:00:00');
INSERT INTO `data_remarklist` VALUES ('13', '20', '014', '書籤', '5.00', null, '0000-00-00 00:00:00');
INSERT INTO `data_remarklist` VALUES ('15', '21', '015', '123', '0.00', null, '2011-11-04 17:36:29');
INSERT INTO `data_remarklist` VALUES ('17', '11', '0012', '熱', '3.00', null, '2011-12-14 13:58:09');
INSERT INTO `data_remarklist` VALUES ('18', '11', '0013', '溫', '1.00', null, '2011-12-14 13:58:18');
INSERT INTO `data_remarklist` VALUES ('19', '11', '0014', '冷', '1.00', null, '2011-12-14 13:58:23');
