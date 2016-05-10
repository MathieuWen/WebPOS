/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.253
Source Server Version : 50154
Source Host           : 192.168.2.253:3306
Source Database       : conductor

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2012-01-11 08:59:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `data_paydesc`
-- ----------------------------
DROP TABLE IF EXISTS `data_paydesc`;
CREATE TABLE `data_paydesc` (
  `paytype` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `paydescription` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `payname` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `returnable` tinyint(1) DEFAULT '0',
  `upable` tinyint(1) DEFAULT '0',
  `udate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uby` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show` tinyint(1) unsigned DEFAULT NULL,
  `sign` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'plus',
  `paytypeGroup` int(2) DEFAULT NULL,
  PRIMARY KEY (`paytype`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of data_paydesc
-- ----------------------------
INSERT INTO `data_paydesc` VALUES ('1', '現金', 'TYPECASH', '1', '1', '2012-01-05 11:35:12', 'ZDN', '1', '{1}+{2}', '1');
INSERT INTO `data_paydesc` VALUES ('2', '信用卡', 'TYPECREDITCARD', '0', '1', '2012-01-05 11:16:06', 'ZDN', '0', '{1}+{2}', null);
INSERT INTO `data_paydesc` VALUES ('3', '支票', 'TYPECHEQUE', '0', '1', '2012-01-05 11:16:42', 'ZDN', '0', '{1}+{2}', null);
INSERT INTO `data_paydesc` VALUES ('4', '線上刷卡', 'TYPEONLINECHEQUE', '0', '1', '2012-01-05 11:17:12', 'ZDN', '0', '{1}+{2}', null);
INSERT INTO `data_paydesc` VALUES ('5', '匯款', 'TYPEREMITTANCE', '0', '1', '2012-01-05 11:25:36', 'ZDN', '0', '{1}+{2}', null);
INSERT INTO `data_paydesc` VALUES ('6', '商品禮卷', 'TYPEITEMVOUCHER', '0', '0', '2012-01-05 11:28:46', 'ZDN', '0', '{1}+{2}', null);
INSERT INTO `data_paydesc` VALUES ('7', '扣值', 'TYPEDEPOSIT', '1', '1', '2012-01-05 11:36:22', 'ZDN', '1', '{1}+{2}', '2');
INSERT INTO `data_paydesc` VALUES ('8', '簽帳', 'TYPECHARGE', '0', '1', '2012-01-05 11:31:53', 'ZDN', '0', '{1}+{2}', null);
INSERT INTO `data_paydesc` VALUES ('9', '消費劵', 'TYPESALESVOUCHER', '0', '0', '2012-01-05 11:34:56', 'ZDN', '0', '{1}+{2}', null);
INSERT INTO `data_paydesc` VALUES ('10', '折扣', 'TYPEDISCOUNT', '1', '1', '2012-01-05 11:32:59', 'ZDN', '1', '{1}-0.01*{2}', null);
INSERT INTO `data_paydesc` VALUES ('11', '折讓', 'TYPEALLOWANCE', '0', '0', '2012-01-05 11:33:08', 'ZDN', '0', '{1}-{2}', null);
INSERT INTO `data_paydesc` VALUES ('12', '折價劵', 'TYPEDISCOUNTCOUPON', '0', '0', '2012-01-05 11:33:44', 'ZDN', '0', '{1}-0.01*{2}', null);
INSERT INTO `data_paydesc` VALUES ('13', '扣點', 'TYPEPOINT', '0', '1', '2012-01-05 11:34:10', 'ZDN', '1', '{1}+{Config}[\'point_rate\']*{2}', null);
INSERT INTO `data_paydesc` VALUES ('14', '現金禮卷', 'TYPEMONEYVOUCHER', '1', '0', '2012-01-05 11:34:46', 'ZDN', '1', '{1}+{2}', null);
INSERT INTO `data_paydesc` VALUES ('15', '現金找零', 'TYPECASHRETURN', '0', '1', '2012-01-05 11:35:25', 'ZDN', '1', '{1}-{2}', '1');
INSERT INTO `data_paydesc` VALUES ('16', '儲值回存', 'TYPEDEPOSITRETURN', '0', '1', '2012-01-05 11:36:35', 'ZDN', '1', '{1}-{2}', '2');
