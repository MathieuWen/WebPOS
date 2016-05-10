/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.253
Source Server Version : 50154
Source Host           : 192.168.2.253:3306
Source Database       : conductor

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2012-01-11 08:59:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `data_table`
-- ----------------------------
DROP TABLE IF EXISTS `data_table`;
CREATE TABLE `data_table` (
  `table_id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引',
  `store_id` int(20) unsigned NOT NULL COMMENT '店名',
  `no` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '編號',
  `name` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '名稱',
  `location` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '位置',
  `remark` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '備註',
  `udate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `uby` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  `active` tinyint(1) unsigned NOT NULL COMMENT '狀態',
  `lock` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '鎖住的機號',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=466 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='桌位資料表';

-- ----------------------------
-- Records of data_table
-- ----------------------------
INSERT INTO `data_table` VALUES ('73', '1', 'A01', '男湯手環1', '男湯', 'test', '2012-01-11 00:45:25', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('74', '1', 'A02', '男湯手環2', '男湯', 'test', '2012-01-11 00:39:33', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('75', '1', 'A03', '男湯手環3', '男湯', 'test', '2012-01-10 23:52:57', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('76', '1', 'A04', '男湯手環4', '男湯', 'test', '2012-01-11 00:33:58', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('77', '1', 'A05', '男湯手環5', '男湯', 'test', '2012-01-10 12:15:39', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('78', '1', 'A06', '男湯手環6', '男湯', 'test', '2012-01-07 17:51:29', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('79', '1', 'A07', '男湯手環7', '男湯', 'test', '2012-01-05 12:56:22', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('80', '1', 'A08', '男湯手環8', '男湯', 'test', '2012-01-02 11:57:14', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('81', '1', 'A09', '男湯手環9', '男湯', 'test', '2012-01-11 00:45:43', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('82', '1', 'A010', '男湯手環10', '男湯', 'test', '2012-01-06 18:05:44', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('83', '1', 'A011', '男湯手環11', '男湯', 'test', '2012-01-02 11:47:38', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('84', '1', 'A012', '男湯手環12', '男湯', 'test', '2011-12-23 17:33:52', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('85', '1', 'A013', '男湯手環13', '男湯', 'test', '2012-01-06 16:18:36', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('86', '1', 'A014', '男湯手環14', '男湯', 'test', '2012-01-06 16:06:59', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('87', '1', 'A015', '男湯手環15', '男湯', 'test', '2011-12-28 17:01:13', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('88', '1', 'A016', '男湯手環16', '男湯', 'test', '2011-12-07 21:14:00', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('89', '1', 'A017', '男湯手環17', '男湯', 'test', '2012-01-04 11:15:35', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('90', '1', 'A018', '男湯手環18', '男湯', 'test', '2011-12-07 12:17:39', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('91', '1', 'A019', '男湯手環19', '男湯', 'test', '2011-12-05 13:15:24', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('92', '1', 'A020', '男湯手環20', '男湯', 'test', '2011-12-08 10:21:07', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('93', '1', 'A021', '男湯手環21', '男湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('94', '1', 'A022', '男湯手環22', '男湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('95', '1', 'A023', '男湯手環23', '男湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('96', '1', 'A024', '男湯手環24', '男湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('97', '1', 'A025', '男湯手環25', '男湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('98', '1', 'A026', '男湯手環26', '男湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('99', '1', 'A027', '男湯手環27', '男湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('100', '1', 'A028', '男湯手環28', '男湯', 'test', '2011-12-24 00:29:59', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('101', '1', 'A029', '男湯手環29', '男湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('102', '1', 'A030', '男湯手環30', '男湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('103', '1', 'B01', '女湯手環1', '女湯', 'test', '2012-01-09 16:34:24', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('104', '1', 'B02', '女湯手環2', '女湯', 'test', '2012-01-09 16:34:28', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('105', '1', 'B03', '女湯手環3', '女湯', 'test', '2011-12-08 10:12:21', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('106', '1', 'B04', '女湯手環4', '女湯', 'test', '2011-12-25 15:16:50', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('107', '1', 'B05', '女湯手環5', '女湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('108', '1', 'B06', '女湯手環6', '女湯', 'test', '2011-12-08 09:50:58', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('109', '1', 'B07', '女湯手環7', '女湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('110', '1', 'B08', '女湯手環8', '女湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('111', '1', 'B09', '女湯手環9', '女湯', 'test', '2011-12-07 21:14:13', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('112', '1', 'B010', '女湯手環10', '女湯', 'test', '2011-12-08 10:18:19', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('113', '1', 'B011', '女湯手環11', '女湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('114', '1', 'B012', '女湯手環12', '女湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('115', '1', 'B013', '女湯手環13', '女湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('116', '1', 'B014', '女湯手環14', '女湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('117', '1', 'B015', '女湯手環15', '女湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('118', '1', 'B016', '女湯手環16', '女湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('119', '1', 'B017', '女湯手環17', '女湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('120', '1', 'B018', '女湯手環18', '女湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('121', '1', 'B019', '女湯手環19', '女湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('122', '1', 'B020', '女湯手環20', '女湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('123', '1', 'B021', '女湯手環21', '女湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('124', '1', 'B022', '女湯手環22', '女湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('125', '1', 'B023', '女湯手環23', '女湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('126', '1', 'B024', '女湯手環24', '女湯', 'test', '2011-12-05 17:09:02', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('127', '1', 'B025', '女湯手環25', '女湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('128', '1', 'B026', '女湯手環26', '女湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('129', '1', 'B027', '女湯手環27', '女湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('130', '1', 'B028', '女湯手環28', '女湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('131', '1', 'B029', '女湯手環29', '女湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('132', '1', 'B030', '女湯手環30', '女湯', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('133', '1', 'C01', '男宿手環1', '男宿', 'test', '2011-12-25 15:16:39', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('134', '1', 'C02', '男宿手環2', '男宿', 'test', '2011-12-08 10:18:30', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('135', '1', 'C03', '男宿手環3', '男宿', 'test', '2011-12-08 09:22:29', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('136', '1', 'C04', '男宿手環4', '男宿', 'test', '2011-12-08 09:28:44', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('137', '1', 'C05', '男宿手環5', '男宿', 'test', '2011-12-08 09:22:18', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('138', '1', 'C06', '男宿手環6', '男宿', 'test', '2011-12-08 09:22:16', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('139', '1', 'C07', '男宿手環7', '男宿', 'test', '2011-12-08 09:22:14', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('140', '1', 'C08', '男宿手環8', '男宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('141', '1', 'C09', '男宿手環9', '男宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('142', '1', 'C010', '男宿手環10', '男宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('143', '1', 'C011', '男宿手環11', '男宿', 'test', '2011-12-08 09:50:21', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('144', '1', 'C012', '男宿手環12', '男宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('145', '1', 'C013', '男宿手環13', '男宿', 'test', '2011-12-05 15:53:27', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('146', '1', 'C014', '男宿手環14', '男宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('147', '1', 'C015', '男宿手環15', '男宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('148', '1', 'C016', '男宿手環16', '男宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('149', '1', 'C017', '男宿手環17', '男宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('150', '1', 'C018', '男宿手環18', '男宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('151', '1', 'C019', '男宿手環19', '男宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('152', '1', 'C020', '男宿手環20', '男宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('153', '1', 'C021', '男宿手環21', '男宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('154', '1', 'C022', '男宿手環22', '男宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('155', '1', 'C023', '男宿手環23', '男宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('156', '1', 'C024', '男宿手環24', '男宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('157', '1', 'C025', '男宿手環25', '男宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('158', '1', 'C026', '男宿手環26', '男宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('159', '1', 'C027', '男宿手環27', '男宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('160', '1', 'C028', '男宿手環28', '男宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('161', '1', 'C029', '男宿手環29', '男宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('162', '1', 'C030', '男宿手環30', '男宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('163', '1', 'D01', '女宿手環1', '女宿', 'test', '2011-12-25 15:16:30', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('164', '1', 'D02', '女宿手環2', '女宿', 'test', '2011-12-08 10:15:24', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('165', '1', 'D03', '女宿手環3', '女宿', 'test', '2011-12-08 10:18:42', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('166', '1', 'D04', '女宿手環4', '女宿', 'test', '2011-12-08 09:21:40', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('167', '1', 'D05', '女宿手環5', '女宿', 'test', '2011-12-08 10:15:31', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('168', '1', 'D06', '女宿手環6', '女宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('169', '1', 'D07', '女宿手環7', '女宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('170', '1', 'D08', '女宿手環8', '女宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('171', '1', 'D09', '女宿手環9', '女宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('172', '1', 'D010', '女宿手環10', '女宿', 'test', '2011-12-08 09:58:59', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('173', '1', 'D011', '女宿手環11', '女宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('174', '1', 'D012', '女宿手環12', '女宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('175', '1', 'D013', '女宿手環13', '女宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('176', '1', 'D014', '女宿手環14', '女宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('177', '1', 'D015', '女宿手環15', '女宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('178', '1', 'D016', '女宿手環16', '女宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('179', '1', 'D017', '女宿手環17', '女宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('180', '1', 'D018', '女宿手環18', '女宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('181', '1', 'D019', '女宿手環19', '女宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('182', '1', 'D020', '女宿手環20', '女宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('183', '1', 'D021', '女宿手環21', '女宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('184', '1', 'D022', '女宿手環22', '女宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('185', '1', 'D023', '女宿手環23', '女宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('186', '1', 'D024', '女宿手環24', '女宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('187', '1', 'D025', '女宿手環25', '女宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('188', '1', 'D026', '女宿手環26', '女宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('189', '1', 'D027', '女宿手環27', '女宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('190', '1', 'D028', '女宿手環28', '女宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('191', '1', 'D029', '女宿手環29', '女宿', 'test', '2011-12-05 12:16:10', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('192', '1', 'D030', '女宿手環30', '女宿', 'test', '2011-12-05 17:03:45', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('463', '1', 'D031', '女宿手環31', '女宿', 'test', '2011-12-05 16:44:40', 'ZDN', '0', '');
INSERT INTO `data_table` VALUES ('464', '2', 'A01', '女宿手環31', '女宿', 'test', '2011-12-23 15:23:24', 'ZDN', '0', '');
