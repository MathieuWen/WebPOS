/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.253
Source Server Version : 50154
Source Host           : 192.168.2.253:3306
Source Database       : conductor

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2012-01-11 09:00:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `program_definition`
-- ----------------------------
DROP TABLE IF EXISTS `program_definition`;
CREATE TABLE `program_definition` (
  `program_id` int(20) NOT NULL AUTO_INCREMENT,
  `program_no` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `program_label` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'DefaultName' COMMENT '顯示名稱',
  `program_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'empty' COMMENT '程式名稱',
  `program_content` text COLLATE utf8_unicode_ci,
  `associateKey` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `program_active` tinyint(1) DEFAULT '1' COMMENT '啟動',
  `udate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`program_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of program_definition
-- ----------------------------
INSERT INTO `program_definition` VALUES ('1', null, '統一編號', 'alterTaxid', null, 'F2', '1', '2011-12-14 18:18:55');
INSERT INTO `program_definition` VALUES ('2', null, '折扣', 'alterDiscount', null, 'F3', '1', '2011-12-14 18:20:32');
INSERT INTO `program_definition` VALUES ('3', null, '改價', 'alterPrice', null, null, '1', '2011-12-13 10:53:55');
INSERT INTO `program_definition` VALUES ('4', null, '顧客查詢', 'searchCustomer', null, 'F1', '1', '2011-12-14 17:15:16');
INSERT INTO `program_definition` VALUES ('5', null, '數量', 'alterQuantity', null, null, '1', '2011-12-13 10:54:02');
INSERT INTO `program_definition` VALUES ('6', null, '折讓', 'alterAllowance', null, 'F4', '1', '2011-12-14 18:22:25');
INSERT INTO `program_definition` VALUES ('7', null, '儲值', 'toDeposit', null, null, '1', '2011-12-16 00:39:37');
INSERT INTO `program_definition` VALUES ('8', null, '扣值', 'toWithDraw', null, null, '1', '2011-12-27 01:18:20');
INSERT INTO `program_definition` VALUES ('9', null, '退貨', 'toReturn', null, null, '1', '2011-12-20 10:04:06');
INSERT INTO `program_definition` VALUES ('10', null, '清除', 'clearDisplayTitle', null, 'F5', '1', '2012-01-10 23:30:46');
INSERT INTO `program_definition` VALUES ('11', null, '贈品', 'alterGratis', null, null, '1', '2011-12-13 16:57:48');
INSERT INTO `program_definition` VALUES ('12', null, '收單', 'toReceivedOrder', null, null, '1', '2011-12-20 10:21:53');
INSERT INTO `program_definition` VALUES ('13', null, '更正', 'removeSalesList', null, 'Delete', '1', '2012-01-10 23:38:24');
INSERT INTO `program_definition` VALUES ('14', null, '續單', 'toRenewalOrder', null, null, '1', '2011-12-20 10:24:03');
INSERT INTO `program_definition` VALUES ('15', null, '登出', 'logoutSystem', null, null, '1', '2011-12-13 12:25:51');
INSERT INTO `program_definition` VALUES ('16', null, '錢櫃開啟', 'empty', null, null, '1', '2011-12-15 14:22:51');
INSERT INTO `program_definition` VALUES ('17', null, '取消', 'reversalContract', null, null, '1', '2011-12-13 12:01:15');
INSERT INTO `program_definition` VALUES ('18', null, '小計', 'toSubtotal', null, null, '1', '2011-12-15 18:13:32');
INSERT INTO `program_definition` VALUES ('19', null, '現金', 'toCash', null, '', '1', '2012-01-10 23:30:19');
INSERT INTO `program_definition` VALUES ('20', null, '', 'empty', null, null, '1', '2011-12-13 16:30:46');
INSERT INTO `program_definition` VALUES ('21', null, '備註', 'alterRemark', null, null, '1', '2011-12-13 17:49:16');
INSERT INTO `program_definition` VALUES ('22', null, '前筆商品', 'toPrev', null, 'UpArrow', '1', '2011-12-14 22:15:09');
INSERT INTO `program_definition` VALUES ('23', null, '後筆商品', 'toNext', null, 'DownArrow', '1', '2011-12-14 22:15:18');
INSERT INTO `program_definition` VALUES ('24', null, '商品查詢', 'searchItem', null, 'Enter', '1', '2011-12-15 01:16:01');
INSERT INTO `program_definition` VALUES ('25', null, '作廢', 'toDisannulOrder', null, null, '1', '2011-12-20 10:54:04');
