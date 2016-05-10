/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.253
Source Server Version : 50154
Source Host           : 192.168.2.253:3306
Source Database       : conductor

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2012-01-11 08:59:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `data_payment`
-- ----------------------------
DROP TABLE IF EXISTS `data_payment`;
CREATE TABLE `data_payment` (
  `pay_index` int(20) NOT NULL AUTO_INCREMENT,
  `store_id` int(20) unsigned DEFAULT NULL,
  `station_id` int(20) DEFAULT NULL,
  `payno` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT 'md5(paytype) //系統用的話',
  `payment_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `paytype` int(20) unsigned NOT NULL,
  `targetItem` text COLLATE utf8_unicode_ci,
  `payamount` float(8,2) DEFAULT '0.00',
  `returntype` int(20) DEFAULT NULL,
  `paygroup` int(20) DEFAULT NULL,
  `userestrictions` int(20) DEFAULT '0' COMMENT '單次銷售無使用限制(m=0:無使用限制, m>0:限制使用m次)',
  `totalrestrictions` int(20) DEFAULT '0' COMMENT '總使用限制(遞減) (m=0:無限制, m>0 || m<n: 最多使用n次',
  `period` text COLLATE utf8_unicode_ci COMMENT '使用期間 (yyyy-mm-dd|yyyy-mm-dd[,yyyy-mm-dd|yyyy-mm-dd,...])',
  `uby` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `udate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `system` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`pay_index`),
  KEY `paytype` (`paytype`),
  CONSTRAINT `paytype` FOREIGN KEY (`paytype`) REFERENCES `data_paydesc` (`paytype`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of data_payment
-- ----------------------------
INSERT INTO `data_payment` VALUES ('2', '0', '0', '8f14e45fceea167a5a36dedd4bea2543', 'paybywithdraw', '扣值', '7', null, '0.00', '16', '-1', '0', '0', null, 'ZDN', '2012-01-04 22:26:02', '1');
INSERT INTO `data_payment` VALUES ('3', '0', '0', 'c4ca4238a0b923820dcc509a6f75849b', 'paybycash', '現金', '1', null, '0.00', '15', '-1', '0', '0', null, 'ZDN', '2012-01-04 22:26:04', '1');
INSERT INTO `data_payment` VALUES ('4', '0', '0', '9bf31c7ff062936a96d3c8bd1f8f2ff3', 'returncash', '現金找零', '15', null, '0.00', '0', '-1', '0', '0', null, 'ZDN', '2012-01-04 22:26:27', '1');
INSERT INTO `data_payment` VALUES ('5', '0', '0', 'c74d97b01eae257e44aa9d5bade97baf', 'returndeposit', '儲值回存', '16', null, '0.00', '0', '-1', '0', '0', null, 'ZDN', '2012-01-04 22:26:49', '1');
