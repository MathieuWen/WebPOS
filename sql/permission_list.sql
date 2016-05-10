/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.253
Source Server Version : 50154
Source Host           : 192.168.2.253:3306
Source Database       : conductor

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2012-01-11 09:00:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `permission_list`
-- ----------------------------
DROP TABLE IF EXISTS `permission_list`;
CREATE TABLE `permission_list` (
  `permission_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `permission_desc` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assoc_tb` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `assoc_tbid` int(20) unsigned NOT NULL,
  `establishdate` datetime DEFAULT NULL,
  `udate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `uby` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permission_list
-- ----------------------------
INSERT INTO `permission_list` VALUES ('1', '基本資料', 'menu', '1', '2011-12-28 00:00:00', '2011-12-29 09:31:28', '社區經理');
INSERT INTO `permission_list` VALUES ('2', '進退貨作業', 'menu', '14', '2011-12-28 00:00:00', '2011-12-29 09:31:31', '社區經理');
INSERT INTO `permission_list` VALUES ('3', '庫存作業', 'menu', '23', '2011-12-28 00:00:00', '2011-12-29 09:31:34', '社區經理');
INSERT INTO `permission_list` VALUES ('4', '銷售統計', 'menu', '28', '2011-12-28 00:00:00', '2011-12-29 09:31:38', '社區經理');
INSERT INTO `permission_list` VALUES ('5', '銷售分析', 'menu', '39', '2011-12-28 00:00:00', '2011-12-29 09:31:41', '社區經理');
INSERT INTO `permission_list` VALUES ('6', '附加功能', 'menu', '48', '2011-12-28 00:00:00', '2011-12-29 09:31:45', '社區經理');
INSERT INTO `permission_list` VALUES ('7', '系統設定', 'menu', '56', '2011-12-28 00:00:00', '2011-12-29 09:31:57', '社區經理');

-- ----------------------------
-- Table structure for `program_assoc`
-- ----------------------------
DROP TABLE IF EXISTS `program_assoc`;
CREATE TABLE `program_assoc` (
  `program_assoc_id` int(20) NOT NULL AUTO_INCREMENT,
  `station_id` int(20) unsigned NOT NULL,
  `program_id` int(20) NOT NULL,
  `program_argv` text COLLATE utf8_unicode_ci,
  `program_class` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'fn_p1' COMMENT '控制板名稱',
  `ordering` int(10) DEFAULT NULL,
  `client_active` tinyint(1) DEFAULT '1',
  `udate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`program_assoc_id`),
  KEY `program_id` (`program_id`),
  KEY `station_id` (`station_id`),
  CONSTRAINT `program_assoc_ibfk1` FOREIGN KEY (`program_id`) REFERENCES `program_definition` (`program_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `program_assoc_ibfk2` FOREIGN KEY (`station_id`) REFERENCES `data_station` (`station_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of program_assoc
-- ----------------------------
INSERT INTO `program_assoc` VALUES ('1', '12', '1', '', 'fn_p1', '0', '1', '2011-12-12 15:57:36');
INSERT INTO `program_assoc` VALUES ('2', '12', '2', '', 'fn_p1', '1', '1', '2011-12-12 15:57:36');
INSERT INTO `program_assoc` VALUES ('3', '12', '3', '', 'fn_p1', '2', '1', '2011-12-12 15:57:37');
INSERT INTO `program_assoc` VALUES ('4', '12', '4', '', 'fn_p1', '3', '1', '2011-12-12 15:57:37');
INSERT INTO `program_assoc` VALUES ('5', '12', '5', '', 'fn_p1', '4', '1', '2011-12-12 15:57:38');
INSERT INTO `program_assoc` VALUES ('6', '12', '6', '', 'fn_p1', '5', '1', '2011-12-12 15:57:38');
INSERT INTO `program_assoc` VALUES ('8', '12', '7', '', 'fn_p1', '6', '1', '2011-12-12 15:57:38');
INSERT INTO `program_assoc` VALUES ('9', '12', '8', '', 'fn_p1', '7', '1', '2011-12-12 15:57:39');
INSERT INTO `program_assoc` VALUES ('10', '12', '9', '', 'fn_p1', '8', '1', '2011-12-12 15:57:40');
INSERT INTO `program_assoc` VALUES ('11', '12', '10', '', 'fn_p1', '9', '1', '2011-12-12 15:57:40');
INSERT INTO `program_assoc` VALUES ('12', '12', '11', '', 'fn_p1', '10', '1', '2011-12-12 15:57:41');
INSERT INTO `program_assoc` VALUES ('13', '12', '12', '', 'fn_p1', '11', '1', '2011-12-12 15:57:41');
INSERT INTO `program_assoc` VALUES ('14', '12', '13', '', 'fn_p1', '14', '1', '2011-12-12 17:04:12');
INSERT INTO `program_assoc` VALUES ('15', '12', '14', '', 'fn_p1', '15', '1', '2011-12-12 17:04:13');
INSERT INTO `program_assoc` VALUES ('16', '12', '15', '', 'fn_p1', '16', '1', '2011-12-12 17:04:14');
INSERT INTO `program_assoc` VALUES ('17', '12', '16', '', 'fn_p1', '17', '1', '2011-12-12 17:04:17');
INSERT INTO `program_assoc` VALUES ('18', '12', '17', '', 'fn_p1', '19', '1', '2011-12-12 17:06:03');
INSERT INTO `program_assoc` VALUES ('19', '12', '18', '', 'focusepad', '0', '1', '2011-12-20 10:56:14');
INSERT INTO `program_assoc` VALUES ('20', '12', '19', '', 'focusepad', '1', '1', '2011-12-20 10:56:19');
INSERT INTO `program_assoc` VALUES ('21', '12', '21', '', 'fn_p1', '12', '1', '2011-12-13 17:49:33');
INSERT INTO `program_assoc` VALUES ('22', '12', '25', '', 'fn_p1', '13', '1', '2011-12-20 10:26:00');
INSERT INTO `program_assoc` VALUES ('23', '12', '24', '', 'fn_p1', '18', '1', '2011-12-21 14:03:29');
INSERT INTO `program_assoc` VALUES ('24', '12', '20', '', 'fn_p2', '0', '1', '2011-12-12 17:07:27');
INSERT INTO `program_assoc` VALUES ('25', '12', '20', '', 'fn_p2', '1', '1', '2011-12-12 17:07:53');
INSERT INTO `program_assoc` VALUES ('26', '12', '20', '', 'fn_p2', '2', '1', '2011-12-12 17:07:59');
INSERT INTO `program_assoc` VALUES ('27', '12', '20', '', 'fn_p2', '3', '1', '2011-12-12 17:14:23');
INSERT INTO `program_assoc` VALUES ('28', '12', '20', '', 'fn_p2', '4', '1', '2011-12-12 17:14:23');
INSERT INTO `program_assoc` VALUES ('29', '12', '20', '', 'fn_p2', '5', '1', '2011-12-12 17:14:23');
INSERT INTO `program_assoc` VALUES ('30', '12', '20', '', 'fn_p2', '6', '1', '2011-12-12 17:14:23');
INSERT INTO `program_assoc` VALUES ('31', '12', '20', '', 'fn_p2', '7', '1', '2011-12-12 17:14:23');
INSERT INTO `program_assoc` VALUES ('32', '12', '20', '', 'fn_p2', '8', '1', '2011-12-12 17:14:23');
INSERT INTO `program_assoc` VALUES ('33', '12', '20', '', 'fn_p2', '9', '1', '2011-12-12 17:14:23');
INSERT INTO `program_assoc` VALUES ('34', '12', '20', '', 'fn_p2', '10', '1', '2011-12-12 17:14:23');
INSERT INTO `program_assoc` VALUES ('35', '12', '20', '', 'fn_p2', '11', '1', '2011-12-12 17:14:23');
INSERT INTO `program_assoc` VALUES ('36', '12', '20', '', 'fn_p2', '12', '1', '2011-12-12 17:14:23');
INSERT INTO `program_assoc` VALUES ('37', '12', '20', '', 'fn_p2', '13', '1', '2011-12-12 17:14:23');
INSERT INTO `program_assoc` VALUES ('38', '12', '20', '', 'fn_p2', '14', '1', '2011-12-12 17:14:23');
INSERT INTO `program_assoc` VALUES ('39', '12', '20', '', 'fn_p2', '15', '1', '2011-12-12 17:14:24');
INSERT INTO `program_assoc` VALUES ('40', '12', '20', '', 'fn_p2', '16', '1', '2011-12-12 17:14:24');
INSERT INTO `program_assoc` VALUES ('41', '12', '20', '', 'fn_p2', '17', '1', '2011-12-12 17:14:24');
INSERT INTO `program_assoc` VALUES ('42', '12', '20', '', 'fn_p2', '18', '1', '2011-12-12 17:14:24');
INSERT INTO `program_assoc` VALUES ('43', '12', '20', '', 'fn_p2', '19', '1', '2011-12-12 17:14:24');
INSERT INTO `program_assoc` VALUES ('44', '12', '20', '', 'fn_p3', '3', '1', '2011-12-12 17:27:52');
INSERT INTO `program_assoc` VALUES ('45', '12', '20', '', 'fn_p3', '4', '1', '2011-12-12 17:27:52');
INSERT INTO `program_assoc` VALUES ('46', '12', '20', '', 'fn_p3', '5', '1', '2011-12-12 17:27:52');
INSERT INTO `program_assoc` VALUES ('47', '12', '20', '', 'fn_p3', '6', '1', '2011-12-12 17:27:52');
INSERT INTO `program_assoc` VALUES ('48', '12', '20', '', 'fn_p3', '7', '1', '2011-12-12 17:27:52');
INSERT INTO `program_assoc` VALUES ('49', '12', '20', '', 'fn_p3', '8', '1', '2011-12-12 17:27:52');
INSERT INTO `program_assoc` VALUES ('50', '12', '20', '', 'fn_p3', '9', '1', '2011-12-12 17:27:52');
INSERT INTO `program_assoc` VALUES ('51', '12', '20', '', 'fn_p3', '10', '1', '2011-12-12 17:27:52');
INSERT INTO `program_assoc` VALUES ('52', '12', '20', '', 'fn_p3', '11', '1', '2011-12-12 17:27:52');
INSERT INTO `program_assoc` VALUES ('53', '12', '20', '', 'fn_p3', '12', '1', '2011-12-12 17:27:52');
INSERT INTO `program_assoc` VALUES ('54', '12', '20', '', 'fn_p3', '13', '1', '2011-12-12 17:27:52');
INSERT INTO `program_assoc` VALUES ('55', '12', '20', '', 'fn_p3', '14', '1', '2011-12-12 17:27:52');
INSERT INTO `program_assoc` VALUES ('56', '12', '20', '', 'fn_p3', '15', '1', '2011-12-12 17:27:52');
INSERT INTO `program_assoc` VALUES ('57', '12', '20', '', 'fn_p3', '16', '1', '2011-12-12 17:27:52');
INSERT INTO `program_assoc` VALUES ('58', '12', '20', '', 'fn_p3', '17', '1', '2011-12-12 17:27:52');
INSERT INTO `program_assoc` VALUES ('59', '12', '20', '', 'fn_p3', '18', '1', '2011-12-12 17:27:52');
INSERT INTO `program_assoc` VALUES ('60', '12', '20', '', 'fn_p3', '19', '1', '2011-12-12 17:27:52');
INSERT INTO `program_assoc` VALUES ('61', '12', '20', '', 'fn_p4', '3', '1', '2011-12-12 17:28:27');
INSERT INTO `program_assoc` VALUES ('62', '12', '20', '', 'fn_p4', '4', '1', '2011-12-12 17:28:27');
INSERT INTO `program_assoc` VALUES ('63', '12', '20', '', 'fn_p4', '5', '1', '2011-12-12 17:28:27');
INSERT INTO `program_assoc` VALUES ('64', '12', '20', '', 'fn_p4', '6', '1', '2011-12-12 17:28:27');
INSERT INTO `program_assoc` VALUES ('65', '12', '20', '', 'fn_p4', '7', '1', '2011-12-12 17:28:27');
INSERT INTO `program_assoc` VALUES ('66', '12', '20', '', 'fn_p4', '8', '1', '2011-12-12 17:28:27');
INSERT INTO `program_assoc` VALUES ('67', '12', '20', '', 'fn_p4', '9', '1', '2011-12-12 17:28:27');
INSERT INTO `program_assoc` VALUES ('68', '12', '20', '', 'fn_p4', '10', '1', '2011-12-12 17:28:27');
INSERT INTO `program_assoc` VALUES ('69', '12', '20', '', 'fn_p4', '11', '1', '2011-12-12 17:28:27');
INSERT INTO `program_assoc` VALUES ('70', '12', '20', '', 'fn_p4', '12', '1', '2011-12-12 17:28:27');
INSERT INTO `program_assoc` VALUES ('71', '12', '20', '', 'fn_p4', '13', '1', '2011-12-12 17:28:27');
INSERT INTO `program_assoc` VALUES ('72', '12', '20', '', 'fn_p4', '14', '1', '2011-12-12 17:28:27');
INSERT INTO `program_assoc` VALUES ('73', '12', '20', '', 'fn_p4', '15', '1', '2011-12-12 17:28:27');
INSERT INTO `program_assoc` VALUES ('74', '12', '20', '', 'fn_p4', '16', '1', '2011-12-12 17:28:27');
INSERT INTO `program_assoc` VALUES ('75', '12', '20', '', 'fn_p4', '17', '1', '2011-12-12 17:28:27');
INSERT INTO `program_assoc` VALUES ('76', '12', '20', '', 'fn_p4', '18', '1', '2011-12-12 17:28:27');
INSERT INTO `program_assoc` VALUES ('77', '12', '20', '', 'fn_p4', '19', '1', '2011-12-12 17:28:27');
INSERT INTO `program_assoc` VALUES ('78', '12', '20', '', 'fn_p3', '1', '1', '2011-12-12 17:29:15');
INSERT INTO `program_assoc` VALUES ('79', '12', '20', '', 'fn_p3', '2', '1', '2011-12-12 17:29:16');
INSERT INTO `program_assoc` VALUES ('96', '12', '20', '', 'fn_p4', '1', '1', '2011-12-12 17:29:50');
INSERT INTO `program_assoc` VALUES ('97', '12', '20', '', 'fn_p4', '2', '1', '2011-12-12 17:30:07');
INSERT INTO `program_assoc` VALUES ('98', '12', '20', '', 'fn_p3', '0', '1', '2011-12-12 17:30:46');
INSERT INTO `program_assoc` VALUES ('99', '12', '20', '', 'fn_p4', '0', '1', '2011-12-12 17:30:54');
INSERT INTO `program_assoc` VALUES ('100', '12', '22', '', 'basic', '1', '1', '2011-12-14 22:35:56');
INSERT INTO `program_assoc` VALUES ('101', '12', '23', '', 'basic', '2', '1', '2011-12-14 22:37:30');
INSERT INTO `program_assoc` VALUES ('102', '12', '24', null, 'basic', '3', '1', '2011-12-15 01:16:35');
INSERT INTO `program_assoc` VALUES ('104', '14', '1', null, 'fn_p1', '0', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('105', '14', '2', null, 'fn_p1', '1', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('106', '14', '3', null, 'fn_p1', '2', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('107', '14', '4', null, 'fn_p1', '3', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('108', '14', '5', null, 'fn_p1', '4', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('109', '14', '6', null, 'fn_p1', '5', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('110', '14', '7', null, 'fn_p1', '6', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('111', '14', '8', null, 'fn_p1', '7', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('112', '14', '9', null, 'fn_p1', '8', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('113', '14', '10', null, 'fn_p1', '9', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('114', '14', '11', null, 'fn_p1', '10', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('115', '14', '12', null, 'fn_p1', '11', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('116', '14', '13', null, 'fn_p1', '14', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('117', '14', '14', null, 'fn_p1', '15', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('118', '14', '15', null, 'fn_p1', '16', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('119', '14', '16', null, 'fn_p1', '17', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('120', '14', '17', null, 'fn_p1', '19', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('121', '14', '18', null, 'focusepad', '0', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('122', '14', '19', null, 'focusepad', '1', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('123', '14', '21', null, 'fn_p1', '12', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('124', '14', '25', null, 'fn_p1', '13', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('125', '14', '20', null, 'fn_p1', '18', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('126', '14', '20', null, 'fn_p2', '0', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('127', '14', '20', null, 'fn_p2', '1', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('128', '14', '20', null, 'fn_p2', '2', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('129', '14', '20', null, 'fn_p2', '3', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('130', '14', '20', null, 'fn_p2', '4', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('131', '14', '20', null, 'fn_p2', '5', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('132', '14', '20', null, 'fn_p2', '6', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('133', '14', '20', null, 'fn_p2', '7', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('134', '14', '20', null, 'fn_p2', '8', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('135', '14', '20', null, 'fn_p2', '9', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('136', '14', '20', null, 'fn_p2', '10', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('137', '14', '20', null, 'fn_p2', '11', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('138', '14', '20', null, 'fn_p2', '12', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('139', '14', '20', null, 'fn_p2', '13', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('140', '14', '20', null, 'fn_p2', '14', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('141', '14', '20', null, 'fn_p2', '15', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('142', '14', '20', null, 'fn_p2', '16', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('143', '14', '20', null, 'fn_p2', '17', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('144', '14', '20', null, 'fn_p2', '18', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('145', '14', '20', null, 'fn_p2', '19', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('146', '14', '20', null, 'fn_p3', '3', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('147', '14', '20', null, 'fn_p3', '4', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('148', '14', '20', null, 'fn_p3', '5', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('149', '14', '20', null, 'fn_p3', '6', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('150', '14', '20', null, 'fn_p3', '7', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('151', '14', '20', null, 'fn_p3', '8', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('152', '14', '20', null, 'fn_p3', '9', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('153', '14', '20', null, 'fn_p3', '10', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('154', '14', '20', null, 'fn_p3', '11', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('155', '14', '20', null, 'fn_p3', '12', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('156', '14', '20', null, 'fn_p3', '13', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('157', '14', '20', null, 'fn_p3', '14', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('158', '14', '20', null, 'fn_p3', '15', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('159', '14', '20', null, 'fn_p3', '16', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('160', '14', '20', null, 'fn_p3', '17', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('161', '14', '20', null, 'fn_p3', '18', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('162', '14', '20', null, 'fn_p3', '19', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('163', '14', '20', null, 'fn_p4', '3', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('164', '14', '20', null, 'fn_p4', '4', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('165', '14', '20', null, 'fn_p4', '5', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('166', '14', '20', null, 'fn_p4', '6', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('167', '14', '20', null, 'fn_p4', '7', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('168', '14', '20', null, 'fn_p4', '8', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('169', '14', '20', null, 'fn_p4', '9', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('170', '14', '20', null, 'fn_p4', '10', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('171', '14', '20', null, 'fn_p4', '11', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('172', '14', '20', null, 'fn_p4', '12', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('173', '14', '20', null, 'fn_p4', '13', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('174', '14', '20', null, 'fn_p4', '14', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('175', '14', '20', null, 'fn_p4', '15', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('176', '14', '20', null, 'fn_p4', '16', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('177', '14', '20', null, 'fn_p4', '17', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('178', '14', '20', null, 'fn_p4', '18', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('179', '14', '20', null, 'fn_p4', '19', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('180', '14', '20', null, 'fn_p3', '1', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('181', '14', '20', null, 'fn_p3', '2', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('182', '14', '20', null, 'fn_p4', '1', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('183', '14', '20', null, 'fn_p4', '2', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('184', '14', '20', null, 'fn_p3', '0', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('185', '14', '20', null, 'fn_p4', '0', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('186', '14', '22', null, 'basic', '1', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('187', '14', '23', null, 'basic', '2', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('188', '14', '24', null, 'basic', '3', '1', '2011-12-20 11:48:02');
INSERT INTO `program_assoc` VALUES ('231', '13', '1', null, 'fn_p1', '0', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('232', '13', '2', null, 'fn_p1', '1', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('233', '13', '3', null, 'fn_p1', '2', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('234', '13', '4', null, 'fn_p1', '3', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('235', '13', '5', null, 'fn_p1', '4', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('236', '13', '6', null, 'fn_p1', '5', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('237', '13', '7', null, 'fn_p1', '6', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('238', '13', '8', null, 'fn_p1', '7', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('239', '13', '9', null, 'fn_p1', '8', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('240', '13', '10', null, 'fn_p1', '9', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('241', '13', '11', null, 'fn_p1', '10', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('242', '13', '12', null, 'fn_p1', '11', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('243', '13', '13', null, 'fn_p1', '14', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('244', '13', '14', null, 'fn_p1', '15', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('245', '13', '15', null, 'fn_p1', '16', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('246', '13', '16', null, 'fn_p1', '17', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('247', '13', '17', null, 'fn_p1', '19', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('248', '13', '18', null, 'focusepad', '0', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('249', '13', '19', null, 'focusepad', '1', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('250', '13', '21', null, 'fn_p1', '12', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('251', '13', '25', null, 'fn_p1', '13', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('252', '13', '20', null, 'fn_p1', '18', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('253', '13', '20', null, 'fn_p2', '0', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('254', '13', '20', null, 'fn_p2', '1', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('255', '13', '20', null, 'fn_p2', '2', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('256', '13', '20', null, 'fn_p2', '3', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('257', '13', '20', null, 'fn_p2', '4', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('258', '13', '20', null, 'fn_p2', '5', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('259', '13', '20', null, 'fn_p2', '6', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('260', '13', '20', null, 'fn_p2', '7', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('261', '13', '20', null, 'fn_p2', '8', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('262', '13', '20', null, 'fn_p2', '9', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('263', '13', '20', null, 'fn_p2', '10', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('264', '13', '20', null, 'fn_p2', '11', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('265', '13', '20', null, 'fn_p2', '12', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('266', '13', '20', null, 'fn_p2', '13', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('267', '13', '20', null, 'fn_p2', '14', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('268', '13', '20', null, 'fn_p2', '15', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('269', '13', '20', null, 'fn_p2', '16', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('270', '13', '20', null, 'fn_p2', '17', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('271', '13', '20', null, 'fn_p2', '18', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('272', '13', '20', null, 'fn_p2', '19', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('273', '13', '20', null, 'fn_p3', '3', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('274', '13', '20', null, 'fn_p3', '4', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('275', '13', '20', null, 'fn_p3', '5', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('276', '13', '20', null, 'fn_p3', '6', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('277', '13', '20', null, 'fn_p3', '7', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('278', '13', '20', null, 'fn_p3', '8', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('279', '13', '20', null, 'fn_p3', '9', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('280', '13', '20', null, 'fn_p3', '10', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('281', '13', '20', null, 'fn_p3', '11', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('282', '13', '20', null, 'fn_p3', '12', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('283', '13', '20', null, 'fn_p3', '13', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('284', '13', '20', null, 'fn_p3', '14', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('285', '13', '20', null, 'fn_p3', '15', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('286', '13', '20', null, 'fn_p3', '16', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('287', '13', '20', null, 'fn_p3', '17', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('288', '13', '20', null, 'fn_p3', '18', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('289', '13', '20', null, 'fn_p3', '19', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('290', '13', '20', null, 'fn_p4', '3', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('291', '13', '20', null, 'fn_p4', '4', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('292', '13', '20', null, 'fn_p4', '5', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('293', '13', '20', null, 'fn_p4', '6', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('294', '13', '20', null, 'fn_p4', '7', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('295', '13', '20', null, 'fn_p4', '8', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('296', '13', '20', null, 'fn_p4', '9', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('297', '13', '20', null, 'fn_p4', '10', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('298', '13', '20', null, 'fn_p4', '11', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('299', '13', '20', null, 'fn_p4', '12', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('300', '13', '20', null, 'fn_p4', '13', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('301', '13', '20', null, 'fn_p4', '14', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('302', '13', '20', null, 'fn_p4', '15', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('303', '13', '20', null, 'fn_p4', '16', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('304', '13', '20', null, 'fn_p4', '17', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('305', '13', '20', null, 'fn_p4', '18', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('306', '13', '20', null, 'fn_p4', '19', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('307', '13', '20', null, 'fn_p3', '1', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('308', '13', '20', null, 'fn_p3', '2', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('309', '13', '20', null, 'fn_p4', '1', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('310', '13', '20', null, 'fn_p4', '2', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('311', '13', '20', null, 'fn_p3', '0', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('312', '13', '20', null, 'fn_p4', '0', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('313', '13', '22', null, 'basic', '1', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('314', '13', '23', null, 'basic', '2', '1', '2011-12-20 11:55:17');
INSERT INTO `program_assoc` VALUES ('315', '13', '24', null, 'basic', '3', '1', '2011-12-20 11:55:17');

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

-- ----------------------------
-- Table structure for `purchase_receipt`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_receipt`;
CREATE TABLE `purchase_receipt` (
  `receipt_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `receipt_no` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `store_no` varchar(6) COLLATE utf8_unicode_ci NOT NULL COMMENT '進貨店別',
  `vender_id` int(20) NOT NULL COMMENT '廠商索引',
  `vender_name` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '廠商名稱',
  `receipt_allowance` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '折讓金額',
  `receipt_amount` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '進貨總額',
  `receipt_remark` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '備註說明',
  `receipt_date` datetime DEFAULT NULL COMMENT '建表日期',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`receipt_id`),
  KEY `receipt_no` (`receipt_no`),
  KEY `vender_id` (`vender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of purchase_receipt
-- ----------------------------

-- ----------------------------
-- Table structure for `purchase_receiptlist`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_receiptlist`;
CREATE TABLE `purchase_receiptlist` (
  `receiptlist_id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '進貨明細索引',
  `receipt_id` int(20) NOT NULL COMMENT '進貨單號',
  `item_id` int(20) NOT NULL COMMENT '商品編號',
  `item_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品名稱',
  `receiptlist_price` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '進價',
  `receiptlist_total` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '數量',
  `receiptlist_remark` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '備註說明',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`receiptlist_id`),
  KEY `receipt_id` (`receipt_id`),
  KEY `item_id` (`item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=606 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of purchase_receiptlist
-- ----------------------------

-- ----------------------------
-- Table structure for `purchase_temp_view`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_temp_view`;
CREATE TABLE `purchase_temp_view` (
  `vender_id` int(20) unsigned DEFAULT NULL COMMENT '索引',
  `vender_name` varchar(10) COLLATE utf8_unicode_ci COMMENT '廠商名稱',
  `class_id` int(20) unsigned DEFAULT NULL COMMENT '索引',
  `class_name` varchar(12) COLLATE utf8_unicode_ci COMMENT '名稱',
  `brand_id` int(20) unsigned DEFAULT NULL COMMENT '索引',
  `brand_name` varchar(10) COLLATE utf8_unicode_ci COMMENT '名稱',
  `item_no` varchar(16) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品編號',
  `item_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品名稱',
  `avg_price` varchar(49) CHARACTER SET utf8 DEFAULT NULL,
  `total` double(19,2) DEFAULT NULL,
  `amount` double(19,2) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of purchase_temp_view
-- ----------------------------

-- ----------------------------
-- Table structure for `sales_payment`
-- ----------------------------
DROP TABLE IF EXISTS `sales_payment`;
CREATE TABLE `sales_payment` (
  `payment_spk` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'sha256(SP+store_id+station_no+unixtime)',
  `store_id` int(20) NOT NULL,
  `station_no` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `sales_no` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `ord` tinyint(1) DEFAULT '0',
  `payment_amount` float(10,2) DEFAULT NULL COMMENT '總額',
  `payment_cashover` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '應收款',
  `payment_remark` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_count` int(20) DEFAULT '1',
  `establishdate` datetime DEFAULT NULL,
  `uby` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(2) DEFAULT '0',
  `udate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_spk`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sales_payment
-- ----------------------------
INSERT INTO `sales_payment` VALUES ('d1b340e358242dfb74fbc821c4e06c012910ea7c8928ac24c0691a07d1805ab6', '1', '01', '00000001', '0', '25.00', '0.00', '0', '2', '2012-01-10 22:28:20', '系統管理員', '-7', '2012-01-10 22:31:03');
INSERT INTO `sales_payment` VALUES ('DSP4f0c4b9a44364', '1', '01', '00000001', '0', '-25.00', '0.00', '0', '-2', '2012-01-10 22:31:03', '系統管理員', '7', '2012-01-10 22:31:03');
INSERT INTO `sales_payment` VALUES ('e731436d6816c82ed6d7d9fd831988d584248abfce5783ca8f417639164f222b', '1', '01', '00000002', '0', '268.00', '0.00', '0', '2', '2012-01-10 22:37:51', '系統管理員', '8', '2012-01-10 22:41:01');
INSERT INTO `sales_payment` VALUES ('bdd0018f524153c66c02ebdc4fd9a06fc3d5bb9ab3310aaf87ab1f442fa68a14', '1', '01', '00000003', '0', '0.00', '0.00', '0', '2', '2012-01-10 23:29:35', '系統管理員', '8', '2012-01-10 23:29:41');
INSERT INTO `sales_payment` VALUES ('7b0e42f527d497058657697e103bcc63716e4524f3a0e99ec64a8ae431ba9635', '1', '01', '00000004', '0', '358.00', '0.00', '0', '2', '2012-01-11 00:27:17', '系統管理員', '8', '2012-01-11 00:27:26');
INSERT INTO `sales_payment` VALUES ('6511bc2373cdefd1aa3736c609ec7ef7a0340e1a237d060a5ad6f7975518b6af', '1', '01', '00000005', '0', '219.00', '0.00', '0', '2', '2012-01-11 00:28:21', '系統管理員', '8', '2012-01-11 00:28:26');
INSERT INTO `sales_payment` VALUES ('b7db759e7ff186b5bd10b01d43a1a1a95e1a764eb5cb94296d73712f57949fbf', '1', '01', '00000006', '0', '169.00', '0.00', '0', '2', '0000-00-00 00:00:00', '系統管理員', '8', '2012-01-11 00:29:25');
INSERT INTO `sales_payment` VALUES ('91dd269386c7c5003795008d5d9bcbec4a2d0e20e0b2a25abe7d7e54f7ed836d', '1', '01', '00000007', '0', '169.00', '0.00', '0', '2', '2012-01-11 00:29:39', '系統管理員', '8', '2012-01-11 00:29:45');
INSERT INTO `sales_payment` VALUES ('58e0aa82e3ba97191aa2271e5725286aaee194736eded94036511d828947ac96', '1', '01', '00000008', '0', '25.00', '0.00', '0', '1', '2012-01-11 00:30:44', '系統管理員', '8', '2012-01-11 00:30:47');
INSERT INTO `sales_payment` VALUES ('7a55e8661bc7da61926a840cacd17f813ac67870bf10294b492d54e3e3abbf7b', '1', '01', '00000009', '0', '25.00', '0.00', '0', '1', '2012-01-11 00:31:14', '系統管理員', '8', '2012-01-11 00:31:22');
INSERT INTO `sales_payment` VALUES ('f5936a47dbdb094beac59a6fd112614d8f8bcb7b404819e15e54258761a7ef5a', '1', '01', '00000010', '0', '25.00', '0.00', '0', '1', '2012-01-11 00:33:00', '系統管理員', '8', '2012-01-11 00:33:04');
INSERT INTO `sales_payment` VALUES ('71db9e810cb77299d403b7e3a89026049a1bde3978084951b4733261676f4ecd', '1', '01', '00000011', '0', '40.00', '0.00', '0', '2', '2012-01-11 00:33:09', '系統管理員', '8', '2012-01-11 00:33:14');
INSERT INTO `sales_payment` VALUES ('dc6349d37b85139811116420c94c3dc39731aac47e9dbfbfcc15829e159e17e8', '1', '01', '00000012', '0', '7150.00', '0.00', '0', '1', '2012-01-11 00:33:39', '系統管理員', '8', '2012-01-11 00:33:58');
INSERT INTO `sales_payment` VALUES ('c41ea7935c1428a6682501829b8ed7599424aa615dc6ad2bd3798593adba11a6', '1', '01', '00000013', '0', '25.00', '0.00', '0', '1', '2012-01-11 00:35:22', '系統管理員', '8', '2012-01-11 00:35:28');
INSERT INTO `sales_payment` VALUES ('43001a25734a6d135be46a7cd985dd4e4c844215d9a8cbd0609b2729e6325474', '1', '01', '00000014', '0', '55.00', '0.00', '0', '1', '2012-01-11 00:35:41', '系統管理員', '8', '2012-01-11 00:35:50');
INSERT INTO `sales_payment` VALUES ('0cbbbbb22e22e2eae9830b6508837597b5613d8d3a08a57021c0a6716debd5fc', '1', '01', '00000015', '0', '25.00', '0.00', '0', '1', '2012-01-11 00:38:40', '系統管理員', '8', '2012-01-11 00:38:44');
INSERT INTO `sales_payment` VALUES ('2856570b4522abc47e466e5088a161bdb230c1f6280fdb936cf89b2d4331d447', '1', '01', '00000016', '0', '25.00', '0.00', '0', '1', '2012-01-11 00:39:28', '系統管理員', '8', '2012-01-11 00:39:33');

-- ----------------------------
-- Table structure for `sales_paymentlist`
-- ----------------------------
DROP TABLE IF EXISTS `sales_paymentlist`;
CREATE TABLE `sales_paymentlist` (
  `paymentlist_spk` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'sha256(SPL+store_id+station_no+unixtime)',
  `store_id` int(20) NOT NULL,
  `station_no` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `sales_no` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `customer_id` int(20) unsigned DEFAULT NULL,
  `customer_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seq` int(11) DEFAULT '1',
  `payno` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paytype` int(2) DEFAULT NULL,
  `payname` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `curid` int(3) DEFAULT NULL,
  `rate_id` int(20) DEFAULT NULL,
  `paymentlist_amount` float(8,2) DEFAULT NULL,
  `paymentlist_count` int(20) NOT NULL DEFAULT '1' COMMENT '使用次數',
  `paymentlist_remark` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `establishdate` datetime DEFAULT NULL,
  `status` tinyint(2) DEFAULT '2',
  `udate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uby` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`paymentlist_spk`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sales_paymentlist
-- ----------------------------
INSERT INTO `sales_paymentlist` VALUES ('0fb34d81f841b954d41182e17915d082807c69915130ffcc41bfb3cbbdfcb16d', '1', '01', '00000001', '0', '', '2', '9bf31c7ff062936a96d3c8bd1f8f2ff3', '15', '現金找零', '1', '1', '-5.00', '0', '', '2012-01-10 22:28:30', '-7', '2012-01-10 22:31:04', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('fc9d0a7c390df034ef347107f7181d2415a6d62462cd259ea598c51f4807f885', '1', '01', '00000001', '0', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '1', '現金', '1', '1', '30.00', '0', '', '2012-01-10 22:28:30', '-7', '2012-01-10 22:31:04', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('DSPL4f0c4b9a44366', '1', '01', '00000001', null, null, '2', '9bf31c7ff062936a96d3c8bd1f8f2ff3', '15', '現金找零', '1', '1', '5.00', '0', '', '2012-01-10 22:31:03', '7', '2012-01-10 22:31:03', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('DSPL4f0c4b9a44367', '1', '01', '00000001', null, null, '1', 'c4ca4238a0b923820dcc509a6f75849b', '1', '現金', '1', '1', '-30.00', '0', '', '2012-01-10 22:31:03', '7', '2012-01-10 22:31:03', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('90158dace6d85ef8e5b09562392a586dd00df83713f85ff1c4c5fb00c53af1ac', '1', '01', '00000002', '0', '', '2', '9bf31c7ff062936a96d3c8bd1f8f2ff3', '15', '現金找零', '1', '1', '-32.00', '0', '', '2012-01-10 22:41:00', '8', '2012-01-10 22:41:01', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('90c9c0476fa37f38f61298de631178df882de34533722fdc95508daec37814fd', '1', '01', '00000002', '0', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '1', '現金', '1', '1', '300.00', '0', '', '2012-01-10 22:41:00', '8', '2012-01-10 22:41:01', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('61940f836121a3e4d306747ace1398f17d0407b9d52e46c0a34ef6a727af9d8b', '1', '01', '00000003', '0', '', '2', '9bf31c7ff062936a96d3c8bd1f8f2ff3', '15', '現金找零', '1', '1', '-123.00', '0', '', '2012-01-10 23:29:41', '8', '2012-01-10 23:29:41', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('a94ef07be55ff02acd849abd21d3dcae39a38811b91481fdc1a247c0796cd7b4', '1', '01', '00000003', '0', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '1', '現金', '1', '1', '123.00', '0', '', '2012-01-10 23:29:41', '8', '2012-01-10 23:29:41', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('fe7affcc191fb41b4dfd9ecec8649a8c4a82bfb56aead6a64f7cec930aa5ed3e', '1', '01', '00000004', '0', '', '2', '9bf31c7ff062936a96d3c8bd1f8f2ff3', '15', '現金找零', '1', '1', '-42.00', '0', '', '2012-01-11 00:27:26', '8', '2012-01-11 00:27:26', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('52ba505d28df45a2347d7fc4d77f71e23109c3a3b3b06992ad5ba62a3b5dd9b0', '1', '01', '00000004', '0', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '1', '現金', '1', '1', '400.00', '0', '', '2012-01-11 00:27:26', '8', '2012-01-11 00:27:26', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('929ade618dbd3315eabe3baf147eefe35f4c3d523090ecdd1a152951e89b2baa', '1', '01', '00000005', '0', '', '2', '9bf31c7ff062936a96d3c8bd1f8f2ff3', '15', '現金找零', '1', '1', '-81.00', '0', '', '2012-01-11 00:28:25', '8', '2012-01-11 00:28:26', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('89c1748e4876a577b5c9fdd7297c48f40705ffab9021d651909cf4efc904cbed', '1', '01', '00000005', '0', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '1', '現金', '1', '1', '300.00', '0', '', '2012-01-11 00:28:25', '8', '2012-01-11 00:28:26', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('32809692a1546b39ba47e3a49390abc1d454be66fb51d362c3f4577c85ae4b4e', '1', '01', '00000006', '0', '', '2', '9bf31c7ff062936a96d3c8bd1f8f2ff3', '15', '現金找零', '1', '1', '-31.00', '0', '', '2012-01-11 00:29:24', '8', '2012-01-11 00:29:25', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('eb6cce5f52094d48da36105de52cd305b5ef8e5e47cbf68ce6638951e22e7411', '1', '01', '00000006', '0', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '1', '現金', '1', '1', '200.00', '0', '', '2012-01-11 00:29:24', '8', '2012-01-11 00:29:25', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('d3691c7ee0427147495a6e3f25cf9472cca725f86cd295efacb16eff900fc339', '1', '01', '00000007', '0', '', '2', '9bf31c7ff062936a96d3c8bd1f8f2ff3', '15', '現金找零', '1', '1', '-31.00', '0', '', '2012-01-11 00:29:44', '8', '2012-01-11 00:29:45', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('43cde135e7e1529b54d231083da3c094f5f509178f733391fae89f89bcc08889', '1', '01', '00000007', '0', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '1', '現金', '1', '1', '200.00', '0', '', '2012-01-11 00:29:44', '8', '2012-01-11 00:29:45', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('7b3b11a2aff3c9ed796b0ec0e2d870268a05f7583d2376cb9baa7ece06828490', '1', '01', '00000008', '0', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '1', '現金', '1', '1', '25.00', '0', '', '2012-01-11 00:30:47', '8', '2012-01-11 00:30:47', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('945ed2abd0f4a19ddf2425dd96295c411e28be3ce377c1cdb621df3afb627243', '1', '01', '00000009', '0', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '1', '現金', '1', '1', '25.00', '0', '', '2012-01-11 00:31:22', '8', '2012-01-11 00:31:22', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('a032bca7ebfd4f4bd79beefb2df1e36ece1837fbaddd925ec8d12a445baa1d8f', '1', '01', '00000010', '0', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '1', '現金', '1', '1', '25.00', '0', '', '2012-01-11 00:33:03', '8', '2012-01-11 00:33:04', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('d3a5bccc8cfa771c8ee7d966ea1dd74f3035c3ebb31f2ee762baa675c7f76d95', '1', '01', '00000011', '0', '', '2', '9bf31c7ff062936a96d3c8bd1f8f2ff3', '15', '現金找零', '1', '1', '-2.00', '0', '', '2012-01-11 00:33:14', '8', '2012-01-11 00:33:14', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('22eb839f4dd58bbf7f7029a0872d5525c6088cd691f3d0ddbeca299493b01377', '1', '01', '00000011', '0', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '1', '現金', '1', '1', '42.00', '0', '', '2012-01-11 00:33:14', '8', '2012-01-11 00:33:14', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('00da19ef4fcb0cb73b22ec317dcc859811e324199878d57ca16419620580feea', '1', '01', '00000012', '0', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '1', '現金', '1', '1', '7150.00', '0', '', '2012-01-11 00:33:53', '8', '2012-01-11 00:33:58', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('861d761e732b9f68310c09a124d3bf5c4c415f3ba39eef79faaf9c69e5894948', '1', '01', '00000013', '0', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '1', '現金', '1', '1', '25.00', '0', '', '2012-01-11 00:35:27', '8', '2012-01-11 00:35:28', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('c19ba2ffa8f85e6eba8e0bee1485ae0497b90d787d713d9499a1b0b151620a2d', '1', '01', '00000014', '0', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '1', '現金', '1', '1', '55.00', '0', '', '2012-01-11 00:35:49', '8', '2012-01-11 00:35:50', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('b6916c283f273009ebb9675b1a4e7c5901f95399df25f7ae705388454db29303', '1', '01', '00000015', '0', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '1', '現金', '1', '1', '25.00', '0', '', '2012-01-11 00:38:44', '8', '2012-01-11 00:38:44', '系統管理員');
INSERT INTO `sales_paymentlist` VALUES ('750b7d876cb7467ca700ec366f937dc9399b5ab13e28ab296ea63c1d873f7ccb', '1', '01', '00000016', '0', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '1', '現金', '1', '1', '25.00', '0', '', '2012-01-11 00:39:32', '8', '2012-01-11 00:39:33', '系統管理員');

-- ----------------------------
-- Table structure for `sales_prepaid`
-- ----------------------------
DROP TABLE IF EXISTS `sales_prepaid`;
CREATE TABLE `sales_prepaid` (
  `prepaid_id` int(20) NOT NULL AUTO_INCREMENT,
  `customer_id` int(20) unsigned NOT NULL,
  `store_id` int(20) unsigned NOT NULL COMMENT '店別',
  `station_no` varchar(2) COLLATE utf8_unicode_ci NOT NULL COMMENT '機碼',
  `cur_id` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '貨幣類別',
  `paytype` int(20) unsigned DEFAULT NULL COMMENT '付款類別',
  `rate_id` int(20) DEFAULT NULL COMMENT '匯率類別',
  `prepaid_amount` float(8,2) NOT NULL DEFAULT '0.00',
  `udate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uby` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`prepaid_id`),
  KEY `idxprepaidcid` (`customer_id`) USING BTREE,
  KEY `idxprepaidpaytype` (`paytype`) USING HASH,
  KEY `idxprepaidstid` (`store_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=167 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sales_prepaid
-- ----------------------------

-- ----------------------------
-- Table structure for `sales_receipt`
-- ----------------------------
DROP TABLE IF EXISTS `sales_receipt`;
CREATE TABLE `sales_receipt` (
  `sales_spk` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'sha256(SR+store_id+station_no+unixtime)',
  `sales_no` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `store_id` int(20) NOT NULL,
  `station_no` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '00' COMMENT '收銀機編號',
  `table_id` int(20) unsigned DEFAULT NULL COMMENT '桌號',
  `employee_id` int(20) unsigned NOT NULL COMMENT '職員編號',
  `employee_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_id` int(20) unsigned DEFAULT NULL,
  `customer_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sales_taxid` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '統一編號',
  `creditcard_no` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '信用卡號',
  `sales_amount` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '結帳金額',
  `sales_expenses` float(10,2) DEFAULT '0.00' COMMENT '銷售總額',
  `sales_point` float(8,0) NOT NULL DEFAULT '0' COMMENT '銷售總點數',
  `sales_tax` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '銷售稅額',
  `sales_exemption` float(10,2) DEFAULT '0.00' COMMENT '免稅額',
  `sales_count` int(20) DEFAULT '1' COMMENT '銷售品項數',
  `sales_total` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '銷售總量',
  `sales_plus` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '加成',
  `sales_discount` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '折扣',
  `sales_excessivepayment` float(8,2) DEFAULT '0.00' COMMENT '溢收款',
  `sales_allowance` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '減項(折讓/折價卷)',
  `healthtax` float(8,2) DEFAULT '0.00' COMMENT '健康捐',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '狀態碼(作廢:-7/作廢存根:7/已結帳:8/結帳:14/清帳:12/收單:10/退貨:9)',
  `customer_total` int(3) unsigned NOT NULL DEFAULT '1' COMMENT '顧客數',
  `establishdate` datetime DEFAULT NULL COMMENT '建立時間',
  `debtdate` datetime DEFAULT NULL COMMENT '帳務時間',
  `checkdate` datetime DEFAULT NULL COMMENT '結帳時間',
  `sales_remark` text COLLATE utf8_unicode_ci,
  `udate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uby` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sales_spk`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sales_receipt
-- ----------------------------
INSERT INTO `sales_receipt` VALUES ('444f3cf537e2a6e92dc894495ce3932545b3c036d1b61103a12bc19516821da8', '00000001', '1', '01', '73', '4', '系統管理員', '0', '', '', '', '25.00', '23.81', '0', '1.19', '0.00', '1', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '-7', '1', '2012-01-10 22:28:30', null, null, null, '2012-01-10 22:31:03', '系統管理員');
INSERT INTO `sales_receipt` VALUES ('DSR4f0c4b9a44363', '00000001', '1', '01', '73', '4', '系統管理員', '0', '', '', '', '-25.00', '-23.81', '0', '-1.19', '0.00', '1', '-1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '7', '1', '2012-01-10 22:28:30', '2012-01-10 22:31:03', null, null, '2012-01-10 22:31:03', '系統管理員');
INSERT INTO `sales_receipt` VALUES ('59146098cdbe601c57d88b54bd62219e38c2e0fcced08381de50ca7c504054cc', '00000002', '1', '01', '73', '4', '系統管理員', '0', '', '', '', '268.00', '255.24', '0', '12.76', '0.00', '2', '2.00', '0.00', '0.00', '0.00', '0.00', '0.00', '8', '1', '2012-01-10 22:38:00', '2012-01-10 22:41:01', null, null, '2012-01-10 22:41:01', '系統管理員');
INSERT INTO `sales_receipt` VALUES ('0cb5bb14cb6fa7c4421d2ff77ee566e934a3a96908ce360d22b1a89c7499546a', '00000003', '1', '01', '73', '4', '系統管理員', '0', '', '', '', '0.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '8', '1', '2012-01-10 23:29:41', '2012-01-10 23:29:41', null, null, '2012-01-10 23:29:41', '系統管理員');
INSERT INTO `sales_receipt` VALUES ('122d400f4168abb9bf5d11b433154bbd95a3d8b84e8b0d4757711103ccc7bd0d', '00000004', '1', '01', '73', '4', '系統管理員', '0', '', '', '', '358.00', '340.95', '0', '17.05', '0.00', '2', '2.00', '0.00', '0.00', '0.00', '0.00', '0.00', '8', '1', '2012-01-11 00:27:26', '2012-01-11 00:27:26', null, null, '2012-01-11 00:27:26', '系統管理員');
INSERT INTO `sales_receipt` VALUES ('238b967bc6e2fac639d519e416a795e33d12ccb5b3fe8b26ef4f441279e8b854', '00000005', '1', '01', '73', '4', '系統管理員', '0', '', '', '', '219.00', '208.57', '0', '10.43', '0.00', '1', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '8', '1', '2012-01-11 00:28:26', '2012-01-11 00:28:26', null, null, '2012-01-11 00:28:26', '系統管理員');
INSERT INTO `sales_receipt` VALUES ('cf92ea57af33820c3ded5ac043bbc43af68350ed971e0500bee984c8a2a5c566', '00000006', '1', '01', '73', '4', '系統管理員', '0', '', '', '', '169.00', '160.95', '0', '8.05', '0.00', '1', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '8', '1', '2012-01-11 00:29:25', '2012-01-11 00:29:25', null, null, '2012-01-11 00:29:25', '系統管理員');
INSERT INTO `sales_receipt` VALUES ('2aa66f600c83d2c685062fc16f82bce2393168eb6dcff9d2889e403c05d3096e', '00000007', '1', '01', '74', '4', '系統管理員', '0', '', '', '', '169.00', '160.95', '0', '8.05', '0.00', '1', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '8', '1', '2012-01-11 00:29:45', '2012-01-11 00:29:45', null, null, '2012-01-11 00:29:45', '系統管理員');
INSERT INTO `sales_receipt` VALUES ('b335861a8df7d6d9a932ec3652410b22885d1358692f805c3dbf040f0c3253ca', '00000008', '1', '01', '74', '4', '系統管理員', '0', '', '', '', '25.00', '23.81', '0', '1.19', '0.00', '1', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '8', '1', '2012-01-11 00:30:47', '2012-01-11 00:30:47', null, null, '2012-01-11 00:30:47', '系統管理員');
INSERT INTO `sales_receipt` VALUES ('84bf08ebcf66a0d33614bc74a91290eb5bac46eadf18de9bb05f2c2cad4d220b', '00000009', '1', '01', '73', '4', '系統管理員', '0', '', '', '', '25.00', '23.81', '0', '1.19', '0.00', '1', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '8', '1', '2012-01-11 00:31:22', '2012-01-11 00:31:22', null, null, '2012-01-11 00:31:22', '系統管理員');
INSERT INTO `sales_receipt` VALUES ('db5bb9ca5021d38c9021223e16f0572d08bfa4c78211bd4dc2286ee681116966', '00000010', '1', '01', '73', '4', '系統管理員', '0', '', '', '', '25.00', '23.81', '0', '1.19', '0.00', '1', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '8', '1', '2012-01-11 00:33:04', '2012-01-11 00:33:04', null, null, '2012-01-11 00:33:04', '系統管理員');
INSERT INTO `sales_receipt` VALUES ('05642ea697e81252f3a63dacb26bb73665ecd713401b0c1b70954035048875c0', '00000011', '1', '01', '73', '4', '系統管理員', '0', '', '', '', '40.00', '38.10', '0', '1.90', '0.00', '1', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '8', '1', '2012-01-11 00:33:14', '2012-01-11 00:33:14', null, null, '2012-01-11 00:33:14', '系統管理員');
INSERT INTO `sales_receipt` VALUES ('fdf6dd07846f441af8b2943d56accccd50d096f9ab1ebf8233e5b3840f32ec56', '00000012', '1', '01', '76', '4', '系統管理員', '0', '', '', '', '7150.00', '7150.00', '0', '0.00', '7150.00', '1', '1.00', '650.00', '0.00', '0.00', '0.00', '0.00', '8', '1', '2012-01-11 00:33:58', '2012-01-11 00:33:58', null, null, '2012-01-11 00:33:58', '系統管理員');
INSERT INTO `sales_receipt` VALUES ('5c7400eb5abd30493d489e76d5425feb34f10ec84c32a373564e027d835603bb', '00000013', '1', '01', '73', '4', '系統管理員', '0', '', '', '', '25.00', '23.81', '0', '1.19', '0.00', '1', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '8', '1', '2012-01-11 00:35:28', '2012-01-11 00:35:28', null, null, '2012-01-11 00:35:28', '系統管理員');
INSERT INTO `sales_receipt` VALUES ('785e0bfe3e2dbf429812f1fe71306a875aaf9a1750bb8b6e0cbf3b8e44de5c53', '00000014', '1', '01', '74', '4', '系統管理員', '0', '', '', '', '55.00', '52.38', '0', '2.62', '0.00', '1', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '8', '1', '2012-01-11 00:35:50', '2012-01-11 00:35:50', null, null, '2012-01-11 00:35:50', '系統管理員');
INSERT INTO `sales_receipt` VALUES ('89263a56f195118495f624a5854e559ae70bbe24d1a3d54ede3da71e0d6aa4ef', '00000015', '1', '01', '73', '4', '系統管理員', '0', '', '', '', '25.00', '23.81', '0', '1.19', '0.00', '1', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '8', '1', '2012-01-11 00:38:44', '2012-01-11 00:38:44', null, null, '2012-01-11 00:38:44', '系統管理員');
INSERT INTO `sales_receipt` VALUES ('7ad464a32de86ec796e879d839932d80618c22afd8c32d2813f7a3b180881176', '00000016', '1', '01', '74', '4', '系統管理員', '0', '', '', '', '25.00', '23.81', '20', '1.19', '0.00', '1', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '8', '1', '2012-01-11 00:39:33', '2012-01-11 00:39:33', null, null, '2012-01-11 00:39:33', '系統管理員');

-- ----------------------------
-- Table structure for `sales_receiptlist`
-- ----------------------------
DROP TABLE IF EXISTS `sales_receiptlist`;
CREATE TABLE `sales_receiptlist` (
  `saleslist_spk` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'sha256(SL+store_id+station_no+unixtime)',
  `store_id` int(20) NOT NULL,
  `station_no` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `sales_no` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `seq` int(3) DEFAULT '1' COMMENT '排序',
  `item_id` int(20) NOT NULL,
  `item_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `item_salesprice` float(8,2) DEFAULT '0.00' COMMENT '銷售單價',
  `saleslist_quantity` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '數量',
  `saleslist_amount` float(8,2) DEFAULT '0.00' COMMENT '結帳金額',
  `saleslist_expenses` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '銷售金額(結帳金額/1.05)',
  `saleslist_tax` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '銷售稅(銷售金額*0.05)',
  `saleslist_point` float(8,0) NOT NULL DEFAULT '0' COMMENT '點數',
  `saleslist_cost` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '銷售成本',
  `healthtax` float(8,2) DEFAULT '0.00' COMMENT '健康捐',
  `saleslist_exemption` float(8,2) DEFAULT '0.00' COMMENT '免稅金',
  `saleslist_discount` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '折扣',
  `saleslist_allowance` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '減項',
  `saleslist_plus` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '加成',
  `remark` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '備註',
  `addprice` float(8,2) DEFAULT '0.00' COMMENT '備註加價',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `establishdate` datetime DEFAULT NULL COMMENT '建立時間',
  `isprinted` tinyint(1) unsigned DEFAULT '0',
  `udate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uby` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`saleslist_spk`),
  UNIQUE KEY `saleslist_spk` (`saleslist_spk`) USING BTREE,
  KEY `sales_no` (`sales_no`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sales_receiptlist
-- ----------------------------
INSERT INTO `sales_receiptlist` VALUES ('c393545eae77dfbfe144ca9f1d9275f92af7732647a283b9acd4a94ff3b1dcdc', '1', '01', '00000001', '1', '238', '可口可樂-零熱量', '25.00', '1.00', '25.00', '23.81', '1.19', '0', '20.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0.00', '-7', '2012-01-10 22:28:24', '0', '2012-01-10 22:31:04', '系統管理員');
INSERT INTO `sales_receiptlist` VALUES ('DSL4f0c4b9a44365', '1', '01', '00000001', '1', '238', '可口可樂-零熱量', '25.00', '-1.00', '-25.00', '-23.81', '-1.19', '0', '20.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0.00', '7', '2012-01-10 22:31:03', '0', '2012-01-10 22:31:03', '系統管理員');
INSERT INTO `sales_receiptlist` VALUES ('cb41c1ec414a7c8fa58334790844a92d457570c5700c477d11702155b367bf42', '1', '01', '00000002', '1', '256', '杏仁燕麥', '169.00', '1.00', '169.00', '160.95', '8.05', '0', '149.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0.00', '8', '2012-01-10 22:37:56', '0', '2012-01-10 22:41:01', '系統管理員');
INSERT INTO `sales_receiptlist` VALUES ('7db526b5bbc74fad8437d424748d772b7d6334543a1797648789f6389da66026', '1', '01', '00000002', '2', '255', '茗賢情', '99.00', '1.00', '99.00', '94.29', '4.71', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0.00', '8', '2012-01-10 22:37:56', '0', '2012-01-10 22:41:01', '系統管理員');
INSERT INTO `sales_receiptlist` VALUES ('5a215155667f87a812ea989ba008196c042cd6f9d76d7a68488fc1db96f8f04f', '1', '01', '00000004', '1', '253', '月氏礦泉水', '219.00', '1.00', '219.00', '208.57', '10.43', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0.00', '8', '2012-01-11 00:27:19', '0', '2012-01-11 00:27:26', '系統管理員');
INSERT INTO `sales_receiptlist` VALUES ('99d3726929e54b703c0ce1dc5570fe4d8b8ad210d54768ca2a3e99074ab59d82', '1', '01', '00000004', '2', '254', '清靜好水', '139.00', '1.00', '139.00', '132.38', '6.62', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0.00', '8', '2012-01-11 00:27:19', '0', '2012-01-11 00:27:26', '系統管理員');
INSERT INTO `sales_receiptlist` VALUES ('b6cd954eb25f642f16c130d8c8db9aca1631bad4dff59329922b029740783769', '1', '01', '00000005', '1', '253', '月氏礦泉水', '219.00', '1.00', '219.00', '208.57', '10.43', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0.00', '8', '2012-01-11 00:28:22', '0', '2012-01-11 00:28:26', '系統管理員');
INSERT INTO `sales_receiptlist` VALUES ('1c56f98ef0c97c47f20521feb49bc1e831d3647bbe6d648aca82f07fa3a5cb47', '1', '01', '00000006', '1', '256', '杏仁燕麥', '169.00', '1.00', '169.00', '160.95', '8.05', '0', '149.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0.00', '8', '2012-01-11 00:29:21', '0', '2012-01-11 00:29:25', '系統管理員');
INSERT INTO `sales_receiptlist` VALUES ('5969d6d8d4e8ae511dc23deb1587a12539183cf0d6f5def860a55b7f28606022', '1', '01', '00000007', '1', '256', '杏仁燕麥', '169.00', '1.00', '169.00', '160.95', '8.05', '0', '149.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0.00', '8', '2012-01-11 00:29:41', '0', '2012-01-11 00:29:45', '系統管理員');
INSERT INTO `sales_receiptlist` VALUES ('de57ee61f5bc22da238342b0f92cc25927c9f9941eaea6c804f00eed282555ab', '1', '01', '00000008', '1', '238', '可口可樂-零熱量', '25.00', '1.00', '25.00', '23.81', '1.19', '0', '20.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0.00', '8', '2012-01-11 00:30:45', '0', '2012-01-11 00:30:47', '系統管理員');
INSERT INTO `sales_receiptlist` VALUES ('b52ded22d360fb1ffb0a00953e2487134f31bc105d003c9ce1113ec7b257faf6', '1', '01', '00000009', '1', '238', '可口可樂-零熱量', '25.00', '1.00', '25.00', '23.81', '1.19', '0', '20.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0.00', '8', '2012-01-11 00:31:19', '0', '2012-01-11 00:31:22', '系統管理員');
INSERT INTO `sales_receiptlist` VALUES ('15e1dbaf537952b187850959e87ae91e3cc6f164a04fe7461f824b7eaff39220', '1', '01', '00000010', '1', '237', '雪碧', '25.00', '1.00', '25.00', '23.81', '1.19', '0', '20.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0.00', '8', '2012-01-11 00:33:01', '0', '2012-01-11 00:33:04', '系統管理員');
INSERT INTO `sales_receiptlist` VALUES ('afd00d3ebd100523970738a3b739f91de12d8c5845660bdbeb197099f9c8c36e', '1', '01', '00000011', '1', '245', '墨西哥咖啡豆', '40.00', '1.00', '40.00', '38.10', '1.90', '0', '30.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0.00', '8', '2012-01-11 00:33:11', '0', '2012-01-11 00:33:14', '系統管理員');
INSERT INTO `sales_receiptlist` VALUES ('c58d9e870a96b83943594820b385ce0bfd68f2094003255ca9a7d5f094d6994f', '1', '01', '00000012', '1', '267', '數位相機', '6500.00', '1.00', '7150.00', '7150.00', '0.00', '0', '0.00', '0.00', '7150.00', '0.00', '0.00', '650.00', '', '0.00', '8', '2012-01-11 00:33:44', '0', '2012-01-11 00:33:58', '系統管理員');
INSERT INTO `sales_receiptlist` VALUES ('bcda71a0251204b806cdbda80557ba33b19ad238dce17d70a426fa8ecd42938b', '1', '01', '00000013', '1', '241', '分解茶', '25.00', '1.00', '25.00', '23.81', '1.19', '0', '21.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0.00', '8', '2012-01-11 00:35:25', '0', '2012-01-11 00:35:28', '系統管理員');
INSERT INTO `sales_receiptlist` VALUES ('c747bffad26c08225e31883b25e0e053ea4e9876593cd7d3783378912effe41e', '1', '01', '00000014', '1', '247', '拿鐵咖啡豆', '55.00', '1.00', '55.00', '52.38', '2.62', '0', '40.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0.00', '8', '2012-01-11 00:35:46', '0', '2012-01-11 00:35:50', '系統管理員');
INSERT INTO `sales_receiptlist` VALUES ('26b25dc10e099f2d8938ed854a61c6afc046db438ad6231af36a07b3bc60e5d2', '1', '01', '00000015', '1', '237', '雪碧', '25.00', '1.00', '25.00', '23.81', '1.19', '0', '20.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0.00', '8', '2012-01-11 00:38:42', '0', '2012-01-11 00:38:45', '系統管理員');
INSERT INTO `sales_receiptlist` VALUES ('3b82984366c170fa3a768cf6c17ba69587af0b21b90f19dcdc4336422de33dfe', '1', '01', '00000016', '1', '236', '可口可樂', '25.00', '1.00', '25.00', '23.81', '1.19', '20', '20.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0.00', '8', '2012-01-11 00:39:30', '0', '2012-01-11 00:39:33', '系統管理員');

-- ----------------------------
-- Table structure for `sessions`
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `sesskey` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `expiry` int(11) unsigned NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`sesskey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('71avt5sgrhi933nvpmp34spdd2', '1326191524', 'emp_no|s:3:\"888\";emp_name|s:15:\"系統管理員\";store_no|s:5:\"A0001\";current_page|s:30:\"/conductor/data/item/index.php\";online_time|i:1326186681;store_id|s:1:\"1\";');
INSERT INTO `sessions` VALUES ('jerkr47sdq78nte8c5sn3t1g04', '1326158410', 'emp_no|s:3:\"888\";emp_name|s:15:\"系統管理員\";store_no|s:5:\"A0001\";store_id|s:1:\"1\";current_page|s:19:\"/conductor/welcome/\";online_time|i:1326158410;store|s:311:\"{\"store_id\":\"1\",\"store_no\":\"A0001\",\"store_name\":\"\\u53f0\\u4e2d\\u6587\\u5fc3\\u5e97\",\"store_taxid\":\"4201452\",\"store_tel\":\"24-2201505\",\"store_address\":\"\\u53f0\\u4e2d\\u5e02\\u6587\\u5fc3\\u8def\\u4e09\\u6bb5269\\u865f\\u4e00\\u6a13\",\"store_remark\":\"\\u6587\\u5fc3\\u8def\\u4e09\\u6bb5\\u65c1\",\"udate\":\"2011-03-14 13:58:45\",\"uby\":\"\"}\";station|s:119:\"{\"station_id\":\"14\",\"store_id\":\"1\",\"station_no\":\"03\",\"station_ip\":\"127.0.0.1\",\"udate\":\"2011-12-10 01:22:54\",\"uby\":\"ZDN\"}\";device|s:5:\"false\";employee|s:200:\"{\"id\":\"4\",\"no\":\"888\",\"name\":\"\\u7cfb\\u7d71\\u7ba1\\u7406\\u54e1\",\"sex\":\"1\",\"card\":\"888\",\"pass\":\"07a046c046d6fd64c569ea48206e8bec\",\"tel\":\"\",\"fax\":\"\",\"birth\":\"0000-00-00\",\"level\":\"0\",\"mobile\":\"\",\"email\":\"\"}\";StationSetting|s:629:\"{\"store_id\":\"1\",\"station_no\":\"03\",\"setting_id\":\"3\",\"station_id\":\"14\",\"default_loading_Group\":\"0\",\"default_database\":\"server\",\"item_default_price\":\"1\",\"item_default_discountable\":\"0\",\"item_default_discount\":\"0.85\",\"purchase_default_allowable_allowance\":\"1\",\"table_autoStart\":\"1\",\"sales_taxrate\":\"0.05\",\"curid\":\"1\",\"rate_id\":\"1\",\"tip\":\"0.1\",\"point_gain_rate\":\"0.3\",\"point_rate\":\"0.33\",\"sales_max\":\"99999999\",\"isalelength\":\"10\",\"calculation\":\"round\",\"quantity_round_off_to_the_n_decimal_place\":\"0\",\"amount_round_off_to_the_n_decimal_place\":\"0\",\"customer_birth_status\":\"0\",\"prowill_title\":\"ZDPOS\\u9580\\u5e02\\u7ba1\\u7406\\u7cfb\\u7d71\"}\";station_no|s:2:\"03\";station_id|s:2:\"14\";ip|s:11:\"192.168.2.9\";');
INSERT INTO `sessions` VALUES ('shnjd8bef2f7jbt66iua996i10', '1326193758', 'store|s:311:\"{\"store_id\":\"1\",\"store_no\":\"A0001\",\"store_name\":\"\\u53f0\\u4e2d\\u6587\\u5fc3\\u5e97\",\"store_taxid\":\"4201452\",\"store_tel\":\"24-2201505\",\"store_address\":\"\\u53f0\\u4e2d\\u5e02\\u6587\\u5fc3\\u8def\\u4e09\\u6bb5269\\u865f\\u4e00\\u6a13\",\"store_remark\":\"\\u6587\\u5fc3\\u8def\\u4e09\\u6bb5\\u65c1\",\"udate\":\"2011-03-14 13:58:45\",\"uby\":\"\"}\";station|s:140:\"{\"station_id\":\"12\",\"store_id\":\"1\",\"station_no\":\"01\",\"station_ip\":\"127.0.0.1\",\"udate\":\"2011-12-12 17:33:12\",\"uby\":\"\\u793e\\u5340\\u7d93\\u7406\"}\";device|s:1074:\"[{\"device_id\":\"1\",\"store_id\":\"1\",\"station_id\":\"12\",\"device_label\":\"1\",\"device_name\":\"COM3\",\"device_location\":\"127.0.0.1\",\"device_type\":\"invoicing\",\"print_template\":\"receipt\",\"flag_PrintOnReceived\":\"0\",\"flag_PrintOnCheckOut\":\"0\",\"flag_PrintOnPrinted\":\"0\",\"active\":\"0\"},{\"device_id\":\"2\",\"store_id\":\"1\",\"station_id\":\"12\",\"device_label\":\"2\",\"device_name\":\"COM4\",\"device_location\":\"127.0.0.1\",\"device_type\":\"printer\",\"print_template\":\"listprowill\",\"flag_PrintOnReceived\":\"0\",\"flag_PrintOnCheckOut\":\"0\",\"flag_PrintOnPrinted\":\"0\",\"active\":\"0\"},{\"device_id\":\"5\",\"store_id\":\"1\",\"station_id\":\"12\",\"device_label\":\"3\",\"device_name\":\"COM5\",\"device_location\":\"192.168.2.9\",\"device_type\":\"printer\",\"print_template\":\"prowill\",\"flag_PrintOnReceived\":\"0\",\"flag_PrintOnCheckOut\":\"0\",\"flag_PrintOnPrinted\":\"0\",\"active\":\"0\"},{\"device_id\":\"6\",\"store_id\":\"1\",\"station_id\":\"12\",\"device_label\":null,\"device_name\":\"COM4\",\"device_location\":\"192.168.2.9\",\"device_type\":\"invoicing\",\"print_template\":\"receipt\",\"flag_PrintOnReceived\":\"0\",\"flag_PrintOnCheckOut\":\"0\",\"flag_PrintOnPrinted\":\"0\",\"active\":\"0\"}]\";employee|s:200:\"{\"id\":\"4\",\"no\":\"888\",\"name\":\"\\u7cfb\\u7d71\\u7ba1\\u7406\\u54e1\",\"sex\":\"1\",\"card\":\"888\",\"pass\":\"07a046c046d6fd64c569ea48206e8bec\",\"tel\":\"\",\"fax\":\"\",\"birth\":\"0000-00-00\",\"level\":\"0\",\"mobile\":\"\",\"email\":\"\"}\";StationSetting|s:629:\"{\"store_id\":\"1\",\"station_no\":\"01\",\"setting_id\":\"1\",\"station_id\":\"12\",\"default_loading_Group\":\"0\",\"default_database\":\"server\",\"item_default_price\":\"1\",\"item_default_discountable\":\"0\",\"item_default_discount\":\"0.85\",\"purchase_default_allowable_allowance\":\"1\",\"table_autoStart\":\"1\",\"sales_taxrate\":\"0.05\",\"curid\":\"1\",\"rate_id\":\"1\",\"tip\":\"0.1\",\"point_gain_rate\":\"0.3\",\"point_rate\":\"0.33\",\"sales_max\":\"99999999\",\"isalelength\":\"10\",\"calculation\":\"round\",\"quantity_round_off_to_the_n_decimal_place\":\"0\",\"amount_round_off_to_the_n_decimal_place\":\"0\",\"customer_birth_status\":\"0\",\"prowill_title\":\"ZDPOS\\u9580\\u5e02\\u7ba1\\u7406\\u7cfb\\u7d71\"}\";emp_no|s:3:\"888\";emp_name|s:15:\"系統管理員\";store_id|s:1:\"1\";station_no|s:2:\"01\";station_id|s:2:\"12\";current_page|s:4:\"zpos\";ip|s:12:\"192.168.2.10\";');

-- ----------------------------
-- Table structure for `SpecialSales_gift`
-- ----------------------------
DROP TABLE IF EXISTS `SpecialSales_gift`;
CREATE TABLE `SpecialSales_gift` (
  `special_rulegift_index` int(20) NOT NULL AUTO_INCREMENT,
  `special_rule_index` int(20) NOT NULL,
  `item_id` int(20) NOT NULL,
  `present_total` int(3) DEFAULT '1',
  `udate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`special_rulegift_index`),
  KEY `special_rule_gift` (`special_rule_index`),
  CONSTRAINT `special_rule_gift` FOREIGN KEY (`special_rule_index`) REFERENCES `SpecialSales_rule` (`special_rule_index`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of SpecialSales_gift
-- ----------------------------

-- ----------------------------
-- Table structure for `SpecialSales_pattern`
-- ----------------------------
DROP TABLE IF EXISTS `SpecialSales_pattern`;
CREATE TABLE `SpecialSales_pattern` (
  `special_type` int(3) NOT NULL DEFAULT '0',
  `special_description` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag_integrated` tinyint(1) DEFAULT '0',
  `flag_integratedAmount` tinyint(1) DEFAULT '0',
  `flag_integratedTotal` tinyint(1) DEFAULT '0',
  `flag_integratedCustomerLevel` tinyint(1) DEFAULT '0',
  `flag_integratedTime` tinyint(1) DEFAULT '0',
  `flag_integratedUserestrictions` tinyint(1) DEFAULT '0',
  `flag_integratedTotalrestrictions` tinyint(1) DEFAULT '0',
  `flag_integratedGift` tinyint(1) DEFAULT '0',
  `flag_integratedAllowance` tinyint(1) DEFAULT '0',
  `flag_individual_min_quantity` tinyint(1) DEFAULT '0',
  `flag_individualTimeout` tinyint(1) DEFAULT '0',
  `flag_individual_max_quantity` tinyint(1) DEFAULT '0',
  `flag_individual_item_price_flag` tinyint(1) DEFAULT '0',
  `flag_individual_alterDiscount` tinyint(1) DEFAULT '0',
  `flag_individual_alterPrice` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`special_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of SpecialSales_pattern
-- ----------------------------
INSERT INTO `SpecialSales_pattern` VALUES ('0', '搭配商品-依時間改價', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '1');
INSERT INTO `SpecialSales_pattern` VALUES ('1', '依時間做改價-價格自訂', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `SpecialSales_pattern` VALUES ('2', '依時間做改價-價格索引', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0');
INSERT INTO `SpecialSales_pattern` VALUES ('3', '搭配商品-價錢折讓', '1', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `SpecialSales_rule`
-- ----------------------------
DROP TABLE IF EXISTS `SpecialSales_rule`;
CREATE TABLE `SpecialSales_rule` (
  `special_rule_index` int(20) NOT NULL AUTO_INCREMENT,
  `special_no` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `special_type` int(3) DEFAULT '0',
  `require_amount` float(8,2) DEFAULT NULL,
  `require_total` float(8,2) DEFAULT NULL,
  `require_customer_level` tinyint(1) DEFAULT NULL,
  `period` text COLLATE utf8_unicode_ci COMMENT '使用期間 (yyyy-mm-dd|yyyy-mm-dd[,yyyy-mm-dd|yyyy-mm-dd,...])',
  `time_start` time DEFAULT NULL,
  `time_end` int(13) DEFAULT '0',
  `userestrictions` int(20) DEFAULT '0' COMMENT '單次銷售無使用限制(m=0:無使用限制, m>0:限制使用m次)',
  `totalrestrictions` int(20) DEFAULT '0' COMMENT '總使用限制(遞減) (m=0:無限制, m>0 || m<n: 最多使用n次',
  `establishdate` datetime DEFAULT NULL,
  `allowance` float(8,2) DEFAULT NULL,
  `individual` tinyint(1) DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `uby` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `udate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `system` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`special_rule_index`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of SpecialSales_rule
-- ----------------------------
INSERT INTO `SpecialSales_rule` VALUES ('1', 'a00000001', '1', null, null, null, null, '01:00:00', '3600', '0', '0', null, null, '1', '1', 'ZDN', '2011-12-29 21:36:55', '1');
INSERT INTO `SpecialSales_rule` VALUES ('2', 'a00000002', '2', null, null, null, null, '00:00:00', '3600', '0', '0', null, null, '1', '1', 'ZDN', '2011-12-29 21:36:57', '1');
INSERT INTO `SpecialSales_rule` VALUES ('3', 'a00000003', '3', null, null, null, null, null, '0', '0', '0', null, '14.00', '0', '1', 'ZDN', '2011-12-29 20:43:34', '0');

-- ----------------------------
-- Table structure for `SpecialSales_rulelist`
-- ----------------------------
DROP TABLE IF EXISTS `SpecialSales_rulelist`;
CREATE TABLE `SpecialSales_rulelist` (
  `special_rulelist_index` int(20) NOT NULL AUTO_INCREMENT,
  `special_rule_index` int(20) NOT NULL,
  `item_id` int(20) NOT NULL,
  `require_min_quantity` float(8,2) DEFAULT '1.00',
  `require_max_quantity` float(8,2) DEFAULT '1.00',
  `timeout` int(20) unsigned DEFAULT NULL,
  `item_price_flag` int(3) DEFAULT '0',
  `alterDiscount` int(2) DEFAULT NULL,
  `alterPrice` float(8,2) DEFAULT NULL,
  `udate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`special_rulelist_index`),
  KEY `special_rule_index` (`special_rule_index`),
  CONSTRAINT `special_rule_index` FOREIGN KEY (`special_rule_index`) REFERENCES `SpecialSales_rule` (`special_rule_index`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of SpecialSales_rulelist
-- ----------------------------
INSERT INTO `SpecialSales_rulelist` VALUES ('1', '1', '236', '1.00', '1.00', null, '0', null, '23.00', '2011-12-27 13:19:50');
INSERT INTO `SpecialSales_rulelist` VALUES ('2', '1', '237', '1.00', '1.00', null, '0', null, '23.00', '2011-12-27 13:19:51');
INSERT INTO `SpecialSales_rulelist` VALUES ('3', '2', '259', '1.00', '1.00', null, '2', null, null, '2011-12-29 00:41:14');
INSERT INTO `SpecialSales_rulelist` VALUES ('4', '3', '241', '1.00', '1.00', null, '0', null, null, '2011-12-29 20:44:07');
INSERT INTO `SpecialSales_rulelist` VALUES ('5', '3', '266', '1.00', '1.00', null, '0', null, null, '2011-12-29 20:44:21');

-- ----------------------------
-- Table structure for `statistic_temp_view`
-- ----------------------------
DROP TABLE IF EXISTS `statistic_temp_view`;
CREATE TABLE `statistic_temp_view` (
  `store_id` int(20) NOT NULL,
  `store_name` varchar(10) COLLATE utf8_unicode_ci COMMENT '名稱',
  `station_no` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(20) unsigned DEFAULT NULL COMMENT '索引',
  `class_name` varchar(12) COLLATE utf8_unicode_ci COMMENT '名稱',
  `customer_id` int(20) unsigned DEFAULT NULL,
  `customer_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_no` varchar(16) COLLATE utf8_unicode_ci COMMENT '商品編號',
  `item_name` varchar(30) COLLATE utf8_unicode_ci COMMENT '商品名稱',
  `vender_name` varchar(10) COLLATE utf8_unicode_ci COMMENT '廠商名稱',
  `employee_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `saleslist_quantity` varchar(63) CHARACTER SET utf8 DEFAULT NULL,
  `saleslist_tax` double(19,2) DEFAULT NULL,
  `saleslist_cost` double(19,2) DEFAULT NULL,
  `saleslist_discount` double(19,2) DEFAULT NULL,
  `saleslist_expenses` double(19,2) DEFAULT NULL,
  `saleslist_allowance` double(19,2) DEFAULT NULL,
  `saleslist_plus` double(19,2) DEFAULT NULL,
  `per_hour` varchar(34) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of statistic_temp_view
-- ----------------------------
INSERT INTO `statistic_temp_view` VALUES ('1', '台中文心店', '01', '89', '沖泡飲料', '0', '', '00071', '茗賢情', '品茶', '社區經理', '7', '32.98', '0.00', '0.00', '660.02', '0.00', '0.00', '2012-01-06   20:00~20:59');
INSERT INTO `statistic_temp_view` VALUES ('1', '台中文心店', '01', '89', '沖泡飲料', '0', '', '00072', '杏仁燕麥', '品茶', '社區經理', '18', '144.89', '2682.00', '0.00', '2897.11', '0.00', '0.00', '2012-01-06   20:00~20:59');
INSERT INTO `statistic_temp_view` VALUES ('1', '台中文心店', '01', '86', '咖啡', '0', '', '00032', '美國咖啡豆', '卡塔', '系統管理員', '1', '2.38', '30.00', '0.00', '47.62', '0.00', '0.00', '2012-01-07   17:00~17:59');
INSERT INTO `statistic_temp_view` VALUES ('1', '台中文心店', '01', '84', '飲料', '0', '', '00002', '雪碧', '黑松企業', '系統管理員', '9', '10.53', '180.00', '0.00', '210.47', '0.00', '0.00', '2012-01-07   18:00~18:59');
INSERT INTO `statistic_temp_view` VALUES ('1', '台中文心店', '01', '88', '礦泉水', '0', '', '00061', '月氏礦泉水', '月事', '系統管理員', '3', '31.29', '0.00', '0.00', '625.71', '0.00', '0.00', '2012-01-08   01:00~01:59');
INSERT INTO `statistic_temp_view` VALUES ('1', '台中文心店', '01', '88', '礦泉水', '0', '', '00062', '清靜好水', '月事', '系統管理員', '2', '13.24', '0.00', '0.00', '264.76', '0.00', '0.00', '2012-01-09   00:00~00:59');
INSERT INTO `statistic_temp_view` VALUES ('1', '台中文心店', '01', '84', '飲料', '0', '', '00007', '黑松沙士', '黑松企業', '系統管理員', '1', '1.19', '20.00', '0.00', '23.81', '0.00', '0.00', '2012-01-09   01:00~01:59');
INSERT INTO `statistic_temp_view` VALUES ('1', '台中文心店', '01', '84', '飲料', '0', '', '00006', '分解茶', '品茶', '系統管理員', '1', '1.19', '21.00', '0.00', '23.81', '0.00', '0.00', '2012-01-09   01:00~01:59');
INSERT INTO `statistic_temp_view` VALUES ('1', '台中文心店', '01', '92', '保健食品', '0', '', '00091', '紅棗', '康健生機', '系統管理員', '1', '38.98', '0.00', '95.00', '779.51', '36.51', '0.00', '2012-01-09   23:00~23:59');
INSERT INTO `statistic_temp_view` VALUES ('1', '台中文心店', '01', '92', '保健食品', '0', '', '00092', '紅趜', '康健生機', '系統管理員', '1', '22.93', '0.00', '55.90', '458.68', '21.49', '0.00', '2012-01-09   23:00~23:59');
INSERT INTO `statistic_temp_view` VALUES ('1', '台中文心店', '03', '90', '罐頭', '0', '', '00052', '辣椒醬', '牛頭牌', '社區經理', '2', '16.10', '0.00', '0.00', '321.90', '0.00', '0.00', '2012-01-06   18:00~18:59');
INSERT INTO `statistic_temp_view` VALUES ('1', '台中文心店', '03', '90', '罐頭', '0', '', '00051', '沙茶醬', '牛頭牌', '社區經理', '2', '15.14', '0.00', '0.00', '302.86', '0.00', '0.00', '2012-01-06   18:00~18:59');
DROP TRIGGER IF EXISTS `purchase_receiptlist_after_insert`;
DELIMITER ;;
CREATE TRIGGER `purchase_receiptlist_after_insert` AFTER INSERT ON `purchase_receiptlist` FOR EACH ROW BEGIN

UPDATE `stock_inventory` SET 
`stock_inventory`.`inventory_average` = (((`stock_inventory`.`inventory_average`*`stock_inventory`.`inventory_total`)+(New.`receiptlist_total`*New.`receiptlist_price`))/(New.`receiptlist_total`+`stock_inventory`.`inventory_total`)),
`stock_inventory`.`inventory_total`=(`stock_inventory`.`inventory_total`+New.`receiptlist_total`),
`stock_inventory`.`inventory_amount` = (`stock_inventory`.`inventory_amount`+(New.`receiptlist_price`*New.`receiptlist_total`)) WHERE New.`item_id`=`stock_inventory`.`item_id`;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `afterinsert_sales_prepaid`;
DELIMITER ;;
CREATE TRIGGER `afterinsert_sales_prepaid` AFTER INSERT ON `sales_prepaid` FOR EACH ROW BEGIN
DECLARE amount FLOAT DEFAULT 0.0;
IF new.paytype = 13 THEN
SELECT customer_point INTO amount FROM data_customer WHERE customer_id = new.customer_id;
UPDATE data_customer SET customer_point = ( amount + new.prepaid_amount ) WHERE customer_id = new.customer_id;
END IF;
IF new.paytype = 7 THEN
SELECT customer_deposit INTO amount FROM data_customer WHERE customer_id = new.customer_id;
UPDATE data_customer SET customer_deposit = ( amount + new.prepaid_amount ) WHERE customer_id = new.customer_id;
END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `salesReceiptBeforeInsert`;
DELIMITER ;;
CREATE TRIGGER `salesReceiptBeforeInsert` BEFORE INSERT ON `sales_receipt` FOR EACH ROW BEGIN
DECLARE activable INT DEFAULT 0;
IF NEW.table_id IS NOT NULL THEN
SELECT isTableActive INTO activable FROM system_status WHERE status_no = NEW.status;
IF activable=1 THEN
UPDATE data_table SET `active` = 1 WHERE table_id = NEW.table_id;
ELSE
UPDATE data_table SET `active` = 0, `lock`='' WHERE table_id = NEW.table_id;
END IF;
END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `salesReceiptAfterUpdate`;
DELIMITER ;;
CREATE TRIGGER `salesReceiptAfterUpdate` AFTER UPDATE ON `sales_receipt` FOR EACH ROW BEGIN
DECLARE activable INT DEFAULT 0;
IF NEW.table_id IS NOT NULL THEN
SELECT isTableActive INTO activable FROM system_status WHERE status_no = NEW.status;
IF activable=1 THEN
UPDATE data_table SET `active` = 1 WHERE table_id = NEW.table_id;
ELSE
UPDATE data_table SET `active` = 0, `lock`='' WHERE table_id = NEW.table_id;
END IF;
END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sales_receiptlist_before_insert`;
DELIMITER ;;
CREATE TRIGGER `sales_receiptlist_before_insert` BEFORE INSERT ON `sales_receiptlist` FOR EACH ROW BEGIN
DECLARE flag int;
DECLARE old_cost  float(12,2);
DECLARE Vstore VARCHAR(6);
DECLARE oldtotal float(8,2);
DECLARE oldStocktotal float(8,2);
DECLARE flag_instock int;

SELECT `store_no` INTO Vstore FROM `data_store` WHERE `store_id` = NEW.`store_id`;
SELECT COUNT(`item_id`) INTO flag FROM `stock_inventory` WHERE `stock_inventory`.`display` = 1 AND `stock_inventory`.`item_id` = NEW.`item_id` AND `stock_inventory`.`store_no` = Vstore;
SELECT `data_item`.`item_cost` INTO old_cost FROM `data_item` WHERE `data_item`.`item_id` = NEW.item_id;
SELECT `isInStock` INTO flag_instock FROM `system_status` WHERE `status_no`=NEW.`status`;


IF flag = 0 THEN
IF flag_instock = 1 THEN
INSERT INTO `stock_inventory` (`store_no`, `item_id`,`item_no`,`inventory_total`,`inventory_amount`, `inventory_average`,`inventory_location`) VALUES(Vstore, NEW.item_id, (SELECT `item_no` FROM `data_item` WHERE `item_id`=NEW.`item_id`),-1*NEW.saleslist_quantity,-1*NEW.saleslist_quantity*old_cost,old_cost,(SELECT `data_item`.`item_location` FROM `data_item` WHERE `data_item`.`item_id` = NEW.item_id) );
INSERT INTO `stock_inventorylist` (`store_no`,`item_id`,`list_no`,`list_judge`,`ori_total`,`chg_total`,`inventorylist_date`,`employee_name`) VALUES(Vstore, NEW.`item_id`, NEW.`sales_no`, NEW.`status`, 0, (NEW.`saleslist_quantity`)*(-1), CURRENT_TIMESTAMP, NEW.`uby`);
END IF;
ELSE
IF flag_instock = 1 THEN
SELECT `saleslist_quantity` INTO oldtotal FROM `sales_receiptlist` WHERE `saleslist_spk` = NEW.`saleslist_spk`;
SELECT `inventory_total` INTO oldStocktotal FROM `stock_inventory` WHERE `item_id` = NEW.`item_id` AND `store_no` = Vstore AND `display` = 1;


IF oldtotal <> NEW.`saleslist_quantity` OR oldtotal IS NULL THEN
UPDATE  `stock_inventory` SET  `stock_inventory`.`inventory_total` = (oldStocktotal-NEW.`saleslist_quantity`) WHERE `item_id`=NEW.`item_id` AND `store_no` = Vstore AND `display`=1;
INSERT INTO `stock_inventorylist` (`store_no`,`item_id`,`list_no`,`list_judge`,`ori_total`,`chg_total`,`inventorylist_date`,`employee_name`) VALUES(Vstore, NEW.`item_id`, NEW.`sales_no`, NEW.`status`, oldStocktotal, (NEW.`saleslist_quantity`)*(-1),  CURRENT_TIMESTAMP, NEW.`uby`);
END IF;
END IF;

END IF;



END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sales_receiptlist_before_update`;
DELIMITER ;;
CREATE TRIGGER `sales_receiptlist_before_update` BEFORE UPDATE ON `sales_receiptlist` FOR EACH ROW BEGIN



END
;;
DELIMITER ;
