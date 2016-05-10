/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.253
Source Server Version : 50154
Source Host           : 192.168.2.253:3306
Source Database       : conductor

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2012-01-11 08:59:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `data_store`
-- ----------------------------
DROP TABLE IF EXISTS `data_store`;
CREATE TABLE `data_store` (
  `store_id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引',
  `store_no` varchar(6) COLLATE utf8_unicode_ci NOT NULL COMMENT '編號',
  `store_name` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '名稱',
  `store_taxid` int(8) NOT NULL COMMENT '統編',
  `store_tel` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '電話',
  `store_address` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '地址',
  `store_remark` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `udate` datetime NOT NULL COMMENT '修改時間',
  `uby` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='店別資料表';

-- ----------------------------
-- Records of data_store
-- ----------------------------
INSERT INTO `data_store` VALUES ('1', 'A0001', '台中文心店', '4201452', '24-2201505', '台中市文心路三段269號一樓', '文心路三段旁', '2011-03-14 13:58:45', '');
INSERT INTO `data_store` VALUES ('2', 'A0002', '台北復興店', '2201452', '0220145202', '台北市復興路一段23號一樓', '靠忠孝復興捷運站', '2011-03-15 13:58:45', '');
INSERT INTO `data_store` VALUES ('4', 'A0004', '台南府城店', '42140150', '0561518182', '台南市府城路三段5號一樓', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_store` VALUES ('5', 'A0005', '123456', '27292493', '(04)220150', '1234567891234567', '132456789', '2011-11-11 09:35:07', '社區經理');
