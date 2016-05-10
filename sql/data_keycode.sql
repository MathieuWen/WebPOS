/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.253
Source Server Version : 50154
Source Host           : 192.168.2.253:3306
Source Database       : conductor

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2012-01-11 08:58:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `data_keycode`
-- ----------------------------
DROP TABLE IF EXISTS `data_keycode`;
CREATE TABLE `data_keycode` (
  `KeyCode` int(3) unsigned DEFAULT NULL,
  `KeyValue` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OS` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'WIN'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of data_keycode
-- ----------------------------
INSERT INTO `data_keycode` VALUES ('8', 'BackSpace', 'WIN');
INSERT INTO `data_keycode` VALUES ('9', 'Tab', 'WIN');
INSERT INTO `data_keycode` VALUES ('12', 'Clear', 'WIN');
INSERT INTO `data_keycode` VALUES ('13', 'Enter', 'WIN');
INSERT INTO `data_keycode` VALUES ('16', 'Shift', 'WIN');
INSERT INTO `data_keycode` VALUES ('17', 'Control', 'WIN');
INSERT INTO `data_keycode` VALUES ('18', 'Alt', 'WIN');
INSERT INTO `data_keycode` VALUES ('20', 'CapLock', 'WIN');
INSERT INTO `data_keycode` VALUES ('27', 'Esc', 'WIN');
INSERT INTO `data_keycode` VALUES ('32', 'Spacebar', 'WIN');
INSERT INTO `data_keycode` VALUES ('33', 'PageUp', 'WIN');
INSERT INTO `data_keycode` VALUES ('34', 'PageDown', 'WIN');
INSERT INTO `data_keycode` VALUES ('35', 'End', 'WIN');
INSERT INTO `data_keycode` VALUES ('36', 'Home', 'WIN');
INSERT INTO `data_keycode` VALUES ('37', 'LeftArrow', 'WIN');
INSERT INTO `data_keycode` VALUES ('38', 'UpArrow', 'WIN');
INSERT INTO `data_keycode` VALUES ('39', 'RightArrow', 'WIN');
INSERT INTO `data_keycode` VALUES ('40', 'DownArrow', 'WIN');
INSERT INTO `data_keycode` VALUES ('45', 'Insert', 'WIN');
INSERT INTO `data_keycode` VALUES ('46', 'Delete', 'WIN');
INSERT INTO `data_keycode` VALUES ('144', 'NumLock', 'WIN');
INSERT INTO `data_keycode` VALUES ('186', ';', 'WIN');
INSERT INTO `data_keycode` VALUES ('187', '=', 'WIN');
INSERT INTO `data_keycode` VALUES ('188', ',', 'WIN');
INSERT INTO `data_keycode` VALUES ('189', '-', 'WIN');
INSERT INTO `data_keycode` VALUES ('190', '.', 'WIN');
INSERT INTO `data_keycode` VALUES ('191', '/', 'WIN');
INSERT INTO `data_keycode` VALUES ('219', '[', 'WIN');
INSERT INTO `data_keycode` VALUES ('220', '\\', 'WIN');
INSERT INTO `data_keycode` VALUES ('221', ']', 'WIN');
INSERT INTO `data_keycode` VALUES ('222', '\'', 'WIN');
INSERT INTO `data_keycode` VALUES ('65', 'A', 'WIN');
INSERT INTO `data_keycode` VALUES ('66', 'B', 'WIN');
INSERT INTO `data_keycode` VALUES ('67', 'C', 'WIN');
INSERT INTO `data_keycode` VALUES ('68', 'D', 'WIN');
INSERT INTO `data_keycode` VALUES ('69', 'E', 'WIN');
INSERT INTO `data_keycode` VALUES ('70', 'F', 'WIN');
INSERT INTO `data_keycode` VALUES ('71', 'G', 'WIN');
INSERT INTO `data_keycode` VALUES ('72', 'H', 'WIN');
INSERT INTO `data_keycode` VALUES ('73', 'I', 'WIN');
INSERT INTO `data_keycode` VALUES ('74', 'S', 'WIN');
INSERT INTO `data_keycode` VALUES ('75', 'T', 'WIN');
INSERT INTO `data_keycode` VALUES ('76', 'L', 'WIN');
INSERT INTO `data_keycode` VALUES ('77', 'M', 'WIN');
INSERT INTO `data_keycode` VALUES ('78', 'N', 'WIN');
INSERT INTO `data_keycode` VALUES ('79', 'O', 'WIN');
INSERT INTO `data_keycode` VALUES ('80', 'P', 'WIN');
INSERT INTO `data_keycode` VALUES ('81', 'Q', 'WIN');
INSERT INTO `data_keycode` VALUES ('82', 'R', 'WIN');
INSERT INTO `data_keycode` VALUES ('83', 'S', 'WIN');
INSERT INTO `data_keycode` VALUES ('84', 'T', 'WIN');
INSERT INTO `data_keycode` VALUES ('85', 'U', 'WIN');
INSERT INTO `data_keycode` VALUES ('86', 'V', 'WIN');
INSERT INTO `data_keycode` VALUES ('87', 'W', 'WIN');
INSERT INTO `data_keycode` VALUES ('88', 'X', 'WIN');
INSERT INTO `data_keycode` VALUES ('89', 'Y', 'WIN');
INSERT INTO `data_keycode` VALUES ('90', 'Z', 'WIN');
INSERT INTO `data_keycode` VALUES ('48', '0', 'WIN');
INSERT INTO `data_keycode` VALUES ('49', '1', 'WIN');
INSERT INTO `data_keycode` VALUES ('50', '2', 'WIN');
INSERT INTO `data_keycode` VALUES ('51', '3', 'WIN');
INSERT INTO `data_keycode` VALUES ('52', '4', 'WIN');
INSERT INTO `data_keycode` VALUES ('53', '5', 'WIN');
INSERT INTO `data_keycode` VALUES ('54', '6', 'WIN');
INSERT INTO `data_keycode` VALUES ('55', '7', 'WIN');
INSERT INTO `data_keycode` VALUES ('56', '8', 'WIN');
INSERT INTO `data_keycode` VALUES ('57', '9', 'WIN');
INSERT INTO `data_keycode` VALUES ('96', '0', 'WIN');
INSERT INTO `data_keycode` VALUES ('97', '1', 'WIN');
INSERT INTO `data_keycode` VALUES ('98', '2', 'WIN');
INSERT INTO `data_keycode` VALUES ('99', '3', 'WIN');
INSERT INTO `data_keycode` VALUES ('100', '4', 'WIN');
INSERT INTO `data_keycode` VALUES ('101', '5', 'WIN');
INSERT INTO `data_keycode` VALUES ('102', '6', 'WIN');
INSERT INTO `data_keycode` VALUES ('103', '7', 'WIN');
INSERT INTO `data_keycode` VALUES ('104', '8', 'WIN');
INSERT INTO `data_keycode` VALUES ('105', '9', 'WIN');
INSERT INTO `data_keycode` VALUES ('106', '*', 'WIN');
INSERT INTO `data_keycode` VALUES ('107', '+', 'WIN');
INSERT INTO `data_keycode` VALUES ('108', 'Enter', 'WIN');
INSERT INTO `data_keycode` VALUES ('109', '-', 'WIN');
INSERT INTO `data_keycode` VALUES ('110', '.', 'WIN');
INSERT INTO `data_keycode` VALUES ('111', '/', 'WIN');
INSERT INTO `data_keycode` VALUES ('112', 'F1', 'WIN');
INSERT INTO `data_keycode` VALUES ('113', 'F2', 'WIN');
INSERT INTO `data_keycode` VALUES ('114', 'F3', 'WIN');
INSERT INTO `data_keycode` VALUES ('115', 'F4', 'WIN');
INSERT INTO `data_keycode` VALUES ('116', 'F5', 'WIN');
INSERT INTO `data_keycode` VALUES ('117', 'F6', 'WIN');
INSERT INTO `data_keycode` VALUES ('118', 'F7', 'WIN');
INSERT INTO `data_keycode` VALUES ('119', 'F8', 'WIN');
INSERT INTO `data_keycode` VALUES ('120', 'F9', 'WIN');
INSERT INTO `data_keycode` VALUES ('121', 'F10', 'WIN');
INSERT INTO `data_keycode` VALUES ('122', 'F11', 'WIN');
INSERT INTO `data_keycode` VALUES ('123', 'F12', 'WIN');
