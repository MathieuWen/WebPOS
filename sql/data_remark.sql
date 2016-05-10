/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.253
Source Server Version : 50154
Source Host           : 192.168.2.253:3306
Source Database       : conductor

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2012-01-11 08:59:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `data_remark`
-- ----------------------------
DROP TABLE IF EXISTS `data_remark`;
CREATE TABLE `data_remark` (
  `remark_id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引',
  `remark_no` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `remark_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '備註名稱',
  `remark_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '多選/單選 (0/1)',
  `remark_style` text COLLATE utf8_unicode_ci COMMENT '顯示css設定',
  `udate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  `uby` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`remark_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='備註資料';

-- ----------------------------
-- Records of data_remark
-- ----------------------------
INSERT INTO `data_remark` VALUES ('8', '001', '甜度', '0', null, '2011-08-11 17:58:01', '社區經理');
INSERT INTO `data_remark` VALUES ('9', '002', '辣度', '0', null, '2011-12-14 13:53:29', '社區經理');
INSERT INTO `data_remark` VALUES ('11', '003', '熱度', '0', null, '2011-05-04 14:11:17', '社區經理');
INSERT INTO `data_remark` VALUES ('12', '004', '糖度', '1', null, '2011-05-04 14:11:42', '社區經理');
INSERT INTO `data_remark` VALUES ('13', '005', '甜度', '1', null, '2011-05-04 14:14:37', '社區經理');
INSERT INTO `data_remark` VALUES ('14', '007', '小菜', '1', null, '2011-05-04 14:16:41', '社區經理');
INSERT INTO `data_remark` VALUES ('15', '008', '其他', '1', null, '2011-05-04 14:20:10', '社區經理');
INSERT INTO `data_remark` VALUES ('18', '009', '冰品', '0', null, '2011-05-04 16:08:46', '社區經理');
INSERT INTO `data_remark` VALUES ('19', '010', '杯量', '0', null, '2011-05-04 16:09:10', '社區經理');
INSERT INTO `data_remark` VALUES ('20', '011', '書籍', '1', null, '2011-05-13 15:25:59', '社區經理');
INSERT INTO `data_remark` VALUES ('22', '1001', 'pos', '1', null, '2011-11-11 09:56:38', '社區經理');
