/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.253
Source Server Version : 50154
Source Host           : 192.168.2.253:3306
Source Database       : conductor

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2012-01-11 09:00:24
*/

SET FOREIGN_KEY_CHECKS=0;

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
