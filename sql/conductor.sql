/*
Navicat MySQL Data Transfer

Source Server         : Comp-UbuntuServer
Source Server Version : 50154
Source Host           : www.zdn.com.tw:3307
Source Database       : conductor

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2012-01-11 08:11:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `addition_message`
-- ----------------------------
DROP TABLE IF EXISTS `addition_message`;
CREATE TABLE `addition_message` (
  `message_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `message_customer` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `message_content` text COLLATE utf8_unicode_ci NOT NULL,
  `message_state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `del_date` datetime NOT NULL,
  `udate` datetime NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='附加功能-訊息紀錄';

-- ----------------------------
-- Records of addition_message
-- ----------------------------

-- ----------------------------
-- Table structure for `addition_package`
-- ----------------------------
DROP TABLE IF EXISTS `addition_package`;
CREATE TABLE `addition_package` (
  `package_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `package_customer` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `package_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `package_type` tinyint(3) unsigned NOT NULL,
  `package_state` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `package_receive` datetime NOT NULL,
  `udate` datetime NOT NULL,
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='附加功能-包裏紀錄';

-- ----------------------------
-- Records of addition_package
-- ----------------------------

-- ----------------------------
-- Table structure for `addition_repair`
-- ----------------------------
DROP TABLE IF EXISTS `addition_repair`;
CREATE TABLE `addition_repair` (
  `repair_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `repair_customer` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ro_id` int(20) unsigned NOT NULL,
  `repair_receive` tinyint(1) NOT NULL DEFAULT '0',
  `receive_udate` datetime NOT NULL,
  `repair_done` tinyint(1) NOT NULL DEFAULT '0',
  `done_udate` datetime NOT NULL,
  `udate` datetime NOT NULL,
  PRIMARY KEY (`repair_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='附加功能-修繕紀錄';

-- ----------------------------
-- Records of addition_repair
-- ----------------------------

-- ----------------------------
-- Table structure for `addition_repair_option`
-- ----------------------------
DROP TABLE IF EXISTS `addition_repair_option`;
CREATE TABLE `addition_repair_option` (
  `ro_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `ro_fac` tinyint(1) NOT NULL COMMENT '1客廳2浴室3廚房4臥室5陽台6其他',
  `ro_name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `udate` datetime NOT NULL,
  PRIMARY KEY (`ro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='附加功能-修繕項目';

-- ----------------------------
-- Records of addition_repair_option
-- ----------------------------
INSERT INTO `addition_repair_option` VALUES ('1', '1', ' 牆壁飾面', '2010-11-05 17:30:12');
INSERT INTO `addition_repair_option` VALUES ('2', '1', '地板/地磚', '2010-11-05 17:30:16');
INSERT INTO `addition_repair_option` VALUES ('3', '1', 'E -HOME', '2010-11-05 17:30:20');
INSERT INTO `addition_repair_option` VALUES ('4', '1', '電話', '2010-11-05 17:30:24');
INSERT INTO `addition_repair_option` VALUES ('5', '1', '網路', '2010-11-05 17:30:28');
INSERT INTO `addition_repair_option` VALUES ('6', '1', '第四台', '2010-11-05 17:30:32');
INSERT INTO `addition_repair_option` VALUES ('7', '1', '跳電', '2010-11-05 17:30:35');
INSERT INTO `addition_repair_option` VALUES ('8', '1', '空調', '2010-11-05 17:30:38');
INSERT INTO `addition_repair_option` VALUES ('9', '1', '其他', '2010-11-05 17:30:43');
INSERT INTO `addition_repair_option` VALUES ('23', '2', '馬桶', '2010-11-05 17:32:02');
INSERT INTO `addition_repair_option` VALUES ('24', '2', '蓮蓬頭', '2010-11-05 17:32:05');
INSERT INTO `addition_repair_option` VALUES ('25', '2', '淋浴拉門', '2010-11-05 17:32:09');
INSERT INTO `addition_repair_option` VALUES ('26', '2', '水龍頭', '2010-11-05 17:32:12');
INSERT INTO `addition_repair_option` VALUES ('27', '2', '浴缸', '2010-11-05 17:32:15');
INSERT INTO `addition_repair_option` VALUES ('28', '2', '面盆', '2010-11-05 17:32:20');
INSERT INTO `addition_repair_option` VALUES ('29', '2', '排水不順', '2010-11-05 17:32:23');
INSERT INTO `addition_repair_option` VALUES ('30', '2', '水壓太小', '2010-11-05 17:32:26');
INSERT INTO `addition_repair_option` VALUES ('31', '2', '其他', '2010-11-05 17:32:30');
INSERT INTO `addition_repair_option` VALUES ('32', '3', '廚房設備', '2010-11-05 17:32:36');
INSERT INTO `addition_repair_option` VALUES ('33', '3', '牆壁飾面', '2010-11-05 17:32:39');
INSERT INTO `addition_repair_option` VALUES ('34', '3', '地板', '2010-11-05 17:32:54');
INSERT INTO `addition_repair_option` VALUES ('35', '3', '瓦斯偵煙器', '2010-11-05 17:32:58');
INSERT INTO `addition_repair_option` VALUES ('36', '3', '排水不順', '2010-11-05 17:33:01');
INSERT INTO `addition_repair_option` VALUES ('37', '3', '瓦斯管路', '2010-11-05 17:33:05');
INSERT INTO `addition_repair_option` VALUES ('38', '3', '其他', '2010-11-05 17:33:09');
INSERT INTO `addition_repair_option` VALUES ('45', '8', '指紋機', '2010-11-16 11:47:03');
INSERT INTO `addition_repair_option` VALUES ('46', '8', '感應扣', '2010-11-16 11:47:06');
INSERT INTO `addition_repair_option` VALUES ('47', '8', '曬衣架', '2010-11-16 11:47:08');
INSERT INTO `addition_repair_option` VALUES ('48', '6', '門鎖', '2010-11-16 11:47:16');
INSERT INTO `addition_repair_option` VALUES ('49', '6', '手把', '2010-11-16 11:47:18');
INSERT INTO `addition_repair_option` VALUES ('51', '5', '牆壁飾面', '2010-11-16 11:47:30');
INSERT INTO `addition_repair_option` VALUES ('52', '5', '地板', '2010-11-16 11:47:33');
INSERT INTO `addition_repair_option` VALUES ('53', '5', '電話', '2010-11-16 11:47:35');
INSERT INTO `addition_repair_option` VALUES ('54', '5', '網路', '2010-11-16 11:47:37');
INSERT INTO `addition_repair_option` VALUES ('55', '5', '第四台', '2010-11-16 11:47:39');
INSERT INTO `addition_repair_option` VALUES ('56', '5', '跳電', '2010-11-16 11:47:41');
INSERT INTO `addition_repair_option` VALUES ('57', '5', '空調', '2010-11-16 11:47:44');
INSERT INTO `addition_repair_option` VALUES ('58', '5', '其他', '2010-11-16 11:47:46');
INSERT INTO `addition_repair_option` VALUES ('59', '4', '廚房設備', '2010-11-16 11:48:00');
INSERT INTO `addition_repair_option` VALUES ('60', '4', '牆壁飾面', '2010-11-16 11:48:05');
INSERT INTO `addition_repair_option` VALUES ('61', '4', '地板', '2010-11-16 11:48:07');
INSERT INTO `addition_repair_option` VALUES ('62', '4', '瓦斯偵煙器', '2010-11-16 11:48:09');
INSERT INTO `addition_repair_option` VALUES ('63', '4', '排水不順', '2010-11-16 11:48:11');
INSERT INTO `addition_repair_option` VALUES ('64', '4', '瓦斯管路', '2010-11-16 11:48:13');
INSERT INTO `addition_repair_option` VALUES ('65', '4', '其他', '2010-11-16 11:48:15');
INSERT INTO `addition_repair_option` VALUES ('66', '6', '其他', '2010-11-16 11:48:22');

-- ----------------------------
-- Table structure for `addition_reservation`
-- ----------------------------
DROP TABLE IF EXISTS `addition_reservation`;
CREATE TABLE `addition_reservation` (
  `reservation_id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `reservation_facid` int(10) unsigned NOT NULL COMMENT '預約設施',
  `reservation_userid` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '預約者',
  `reservation_date` date NOT NULL COMMENT '預約日期',
  `reservation_week` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `reservation_start` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '00:00' COMMENT '預約起始時間',
  `reservation_end` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '00:00' COMMENT '預約結束時間',
  `reservation_remark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '註記：1為取消，0為正常預約',
  `reservation_create` datetime NOT NULL COMMENT '創立時間',
  `reservation_canceltime` datetime NOT NULL COMMENT '預約取消時間',
  `reservation_restore` datetime NOT NULL COMMENT '被恢復預約時間',
  `reservation_memo` text COLLATE utf8_unicode_ci,
  `reservation_orderid` int(10) NOT NULL,
  `reservation_ps` text COLLATE utf8_unicode_ci,
  `reservation_change` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reservation_num` int(10) NOT NULL COMMENT '一次預約多少人數',
  `reservation_all` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`reservation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='預約表New';

-- ----------------------------
-- Records of addition_reservation
-- ----------------------------
INSERT INTO `addition_reservation` VALUES ('1', '1', '888', '2010-11-17', '3', '07:00', '08:00', '0', '2010-11-17 09:58:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '2895', null, null, '0', '0');

-- ----------------------------
-- Table structure for `addition_reservation_period`
-- ----------------------------
DROP TABLE IF EXISTS `addition_reservation_period`;
CREATE TABLE `addition_reservation_period` (
  `period_id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period_facid` int(20) unsigned NOT NULL COMMENT '設施ID',
  `period_sort` tinyint(2) unsigned NOT NULL COMMENT '時段順序',
  `period_start` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '00:00' COMMENT '時段起始時間',
  `period_end` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '00:00' COMMENT '時段結束時間',
  `period_amount` int(10) unsigned NOT NULL COMMENT '限制預約次數',
  `period_week` int(2) unsigned NOT NULL COMMENT '星期幾?',
  PRIMARY KEY (`period_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3987 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='設施時段表';

-- ----------------------------
-- Records of addition_reservation_period
-- ----------------------------
INSERT INTO `addition_reservation_period` VALUES ('26', '4', '0', '07:00', '21:30', '100', '3');
INSERT INTO `addition_reservation_period` VALUES ('27', '4', '0', '07:00', '21:30', '100', '4');
INSERT INTO `addition_reservation_period` VALUES ('28', '4', '0', '07:00', '21:30', '100', '5');
INSERT INTO `addition_reservation_period` VALUES ('29', '4', '0', '07:00', '21:30', '100', '6');
INSERT INTO `addition_reservation_period` VALUES ('30', '4', '0', '07:00', '21:30', '100', '7');
INSERT INTO `addition_reservation_period` VALUES ('154', '4', '0', '07:00', '21:30', '100', '3');
INSERT INTO `addition_reservation_period` VALUES ('155', '4', '0', '07:00', '21:30', '100', '4');
INSERT INTO `addition_reservation_period` VALUES ('156', '4', '0', '07:00', '21:30', '100', '5');
INSERT INTO `addition_reservation_period` VALUES ('157', '4', '0', '07:00', '21:30', '100', '6');
INSERT INTO `addition_reservation_period` VALUES ('158', '4', '0', '07:00', '21:30', '100', '7');
INSERT INTO `addition_reservation_period` VALUES ('900', '8', '0', '13:00', '14:00', '30', '1');
INSERT INTO `addition_reservation_period` VALUES ('901', '8', '0', '14:00', '15:00', '30', '1');
INSERT INTO `addition_reservation_period` VALUES ('902', '8', '0', '15:00', '16:00', '30', '1');
INSERT INTO `addition_reservation_period` VALUES ('903', '8', '0', '16:00', '17:00', '30', '1');
INSERT INTO `addition_reservation_period` VALUES ('904', '8', '0', '17:00', '18:00', '30', '1');
INSERT INTO `addition_reservation_period` VALUES ('905', '8', '0', '18:00', '19:00', '30', '1');
INSERT INTO `addition_reservation_period` VALUES ('906', '8', '0', '19:00', '20:00', '30', '1');
INSERT INTO `addition_reservation_period` VALUES ('907', '8', '0', '20:00', '21:00', '30', '1');
INSERT INTO `addition_reservation_period` VALUES ('908', '8', '0', '21:00', '21:30', '30', '1');
INSERT INTO `addition_reservation_period` VALUES ('909', '8', '0', '13:00', '14:00', '30', '2');
INSERT INTO `addition_reservation_period` VALUES ('910', '8', '0', '14:00', '15:00', '30', '2');
INSERT INTO `addition_reservation_period` VALUES ('911', '8', '0', '15:00', '16:00', '30', '2');
INSERT INTO `addition_reservation_period` VALUES ('912', '8', '0', '16:00', '17:00', '30', '2');
INSERT INTO `addition_reservation_period` VALUES ('913', '8', '0', '17:00', '18:00', '30', '2');
INSERT INTO `addition_reservation_period` VALUES ('914', '8', '0', '18:00', '19:00', '30', '2');
INSERT INTO `addition_reservation_period` VALUES ('915', '8', '0', '19:00', '20:00', '30', '2');
INSERT INTO `addition_reservation_period` VALUES ('916', '8', '0', '20:00', '21:00', '30', '2');
INSERT INTO `addition_reservation_period` VALUES ('917', '8', '0', '21:00', '21:30', '30', '2');
INSERT INTO `addition_reservation_period` VALUES ('918', '8', '0', '13:00', '14:00', '30', '3');
INSERT INTO `addition_reservation_period` VALUES ('919', '8', '0', '14:00', '15:00', '30', '3');
INSERT INTO `addition_reservation_period` VALUES ('920', '8', '0', '15:00', '16:00', '30', '3');
INSERT INTO `addition_reservation_period` VALUES ('921', '8', '0', '16:00', '17:00', '30', '3');
INSERT INTO `addition_reservation_period` VALUES ('922', '8', '0', '17:00', '18:00', '30', '3');
INSERT INTO `addition_reservation_period` VALUES ('923', '8', '0', '18:00', '19:00', '30', '3');
INSERT INTO `addition_reservation_period` VALUES ('924', '8', '0', '19:00', '20:00', '30', '3');
INSERT INTO `addition_reservation_period` VALUES ('925', '8', '0', '20:00', '21:00', '30', '3');
INSERT INTO `addition_reservation_period` VALUES ('926', '8', '0', '21:00', '21:30', '30', '3');
INSERT INTO `addition_reservation_period` VALUES ('927', '8', '0', '13:00', '14:00', '30', '4');
INSERT INTO `addition_reservation_period` VALUES ('928', '8', '0', '14:00', '15:00', '30', '4');
INSERT INTO `addition_reservation_period` VALUES ('929', '8', '0', '15:00', '16:00', '30', '4');
INSERT INTO `addition_reservation_period` VALUES ('930', '8', '0', '16:00', '17:00', '30', '4');
INSERT INTO `addition_reservation_period` VALUES ('931', '8', '0', '17:00', '18:00', '30', '4');
INSERT INTO `addition_reservation_period` VALUES ('932', '8', '0', '18:00', '19:00', '30', '4');
INSERT INTO `addition_reservation_period` VALUES ('933', '8', '0', '19:00', '20:00', '30', '4');
INSERT INTO `addition_reservation_period` VALUES ('934', '8', '0', '20:00', '21:00', '30', '4');
INSERT INTO `addition_reservation_period` VALUES ('935', '8', '0', '21:00', '21:30', '30', '4');
INSERT INTO `addition_reservation_period` VALUES ('936', '8', '0', '13:00', '14:00', '30', '5');
INSERT INTO `addition_reservation_period` VALUES ('937', '8', '0', '14:00', '15:00', '30', '5');
INSERT INTO `addition_reservation_period` VALUES ('938', '8', '0', '15:00', '16:00', '30', '5');
INSERT INTO `addition_reservation_period` VALUES ('939', '8', '0', '16:00', '17:00', '30', '5');
INSERT INTO `addition_reservation_period` VALUES ('940', '8', '0', '17:00', '18:00', '30', '5');
INSERT INTO `addition_reservation_period` VALUES ('941', '8', '0', '18:00', '19:00', '30', '5');
INSERT INTO `addition_reservation_period` VALUES ('942', '8', '0', '19:00', '20:00', '30', '5');
INSERT INTO `addition_reservation_period` VALUES ('943', '8', '0', '20:00', '21:00', '30', '5');
INSERT INTO `addition_reservation_period` VALUES ('944', '8', '0', '21:00', '21:30', '30', '5');
INSERT INTO `addition_reservation_period` VALUES ('945', '8', '0', '13:00', '14:00', '30', '6');
INSERT INTO `addition_reservation_period` VALUES ('946', '8', '0', '14:00', '15:00', '30', '6');
INSERT INTO `addition_reservation_period` VALUES ('947', '8', '0', '15:00', '16:00', '30', '6');
INSERT INTO `addition_reservation_period` VALUES ('948', '8', '0', '16:00', '17:00', '30', '6');
INSERT INTO `addition_reservation_period` VALUES ('949', '8', '0', '17:00', '18:00', '30', '6');
INSERT INTO `addition_reservation_period` VALUES ('950', '8', '0', '18:00', '19:00', '30', '6');
INSERT INTO `addition_reservation_period` VALUES ('951', '8', '0', '19:00', '20:00', '30', '6');
INSERT INTO `addition_reservation_period` VALUES ('952', '8', '0', '20:00', '21:00', '30', '6');
INSERT INTO `addition_reservation_period` VALUES ('953', '8', '0', '21:00', '21:30', '30', '6');
INSERT INTO `addition_reservation_period` VALUES ('954', '8', '0', '13:00', '14:00', '30', '7');
INSERT INTO `addition_reservation_period` VALUES ('955', '8', '0', '14:00', '15:00', '30', '7');
INSERT INTO `addition_reservation_period` VALUES ('956', '8', '0', '15:00', '16:00', '30', '7');
INSERT INTO `addition_reservation_period` VALUES ('957', '8', '0', '16:00', '17:00', '30', '7');
INSERT INTO `addition_reservation_period` VALUES ('958', '8', '0', '17:00', '18:00', '30', '7');
INSERT INTO `addition_reservation_period` VALUES ('959', '8', '0', '18:00', '19:00', '30', '7');
INSERT INTO `addition_reservation_period` VALUES ('960', '8', '0', '19:00', '20:00', '30', '7');
INSERT INTO `addition_reservation_period` VALUES ('961', '8', '0', '20:00', '21:00', '30', '7');
INSERT INTO `addition_reservation_period` VALUES ('962', '8', '0', '21:00', '21:30', '30', '7');
INSERT INTO `addition_reservation_period` VALUES ('1539', '1', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('1576', '16', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('1589', '1', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('1590', '1', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('1657', '1', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('1667', '18', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('1677', '18', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('1678', '18', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('1688', '18', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('1689', '18', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('1699', '18', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('1709', '18', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('1710', '18', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('1720', '18', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('1721', '18', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('1731', '18', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('1741', '18', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('1751', '18', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('1761', '18', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('1771', '18', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('1781', '18', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('1791', '18', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('1801', '18', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('1811', '18', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('1824', '1', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('2035', '5', '0', '07:00', '09:00', '30', '3');
INSERT INTO `addition_reservation_period` VALUES ('2036', '5', '0', '09:00', '11:00', '30', '3');
INSERT INTO `addition_reservation_period` VALUES ('2037', '5', '0', '11:00', '13:00', '30', '3');
INSERT INTO `addition_reservation_period` VALUES ('2038', '5', '0', '14:30', '16:30', '30', '3');
INSERT INTO `addition_reservation_period` VALUES ('2039', '5', '0', '16:30', '18:30', '30', '3');
INSERT INTO `addition_reservation_period` VALUES ('2040', '5', '0', '18:30', '20:30', '30', '3');
INSERT INTO `addition_reservation_period` VALUES ('2041', '5', '0', '20:30', '21:30', '10', '3');
INSERT INTO `addition_reservation_period` VALUES ('2042', '5', '0', '07:00', '09:00', '30', '4');
INSERT INTO `addition_reservation_period` VALUES ('2043', '5', '0', '09:00', '11:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2044', '5', '0', '11:00', '13:00', '30', '4');
INSERT INTO `addition_reservation_period` VALUES ('2045', '5', '0', '14:30', '16:30', '30', '4');
INSERT INTO `addition_reservation_period` VALUES ('2046', '5', '0', '16:30', '18:30', '30', '4');
INSERT INTO `addition_reservation_period` VALUES ('2047', '5', '0', '18:30', '20:30', '30', '4');
INSERT INTO `addition_reservation_period` VALUES ('2048', '5', '0', '20:30', '21:30', '30', '4');
INSERT INTO `addition_reservation_period` VALUES ('2049', '5', '0', '07:00', '09:00', '30', '5');
INSERT INTO `addition_reservation_period` VALUES ('2050', '5', '0', '09:00', '11:00', '30', '5');
INSERT INTO `addition_reservation_period` VALUES ('2051', '5', '0', '11:00', '13:00', '30', '5');
INSERT INTO `addition_reservation_period` VALUES ('2052', '5', '0', '14:30', '16:30', '30', '5');
INSERT INTO `addition_reservation_period` VALUES ('2053', '5', '0', '16:30', '18:30', '30', '5');
INSERT INTO `addition_reservation_period` VALUES ('2054', '5', '0', '18:30', '20:30', '30', '5');
INSERT INTO `addition_reservation_period` VALUES ('2055', '5', '0', '20:30', '21:30', '30', '5');
INSERT INTO `addition_reservation_period` VALUES ('2063', '5', '0', '07:00', '09:00', '30', '7');
INSERT INTO `addition_reservation_period` VALUES ('2064', '5', '0', '09:00', '11:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('2065', '5', '0', '11:00', '13:00', '30', '7');
INSERT INTO `addition_reservation_period` VALUES ('2066', '5', '0', '14:30', '16:30', '30', '7');
INSERT INTO `addition_reservation_period` VALUES ('2067', '5', '0', '16:30', '18:30', '30', '7');
INSERT INTO `addition_reservation_period` VALUES ('2068', '5', '0', '18:30', '20:30', '30', '7');
INSERT INTO `addition_reservation_period` VALUES ('2069', '5', '0', '20:30', '21:30', '30', '7');
INSERT INTO `addition_reservation_period` VALUES ('2070', '5', '0', '07:00', '09:00', '30', '6');
INSERT INTO `addition_reservation_period` VALUES ('2071', '5', '0', '09:00', '11:00', '30', '6');
INSERT INTO `addition_reservation_period` VALUES ('2072', '5', '0', '11:00', '13:00', '30', '6');
INSERT INTO `addition_reservation_period` VALUES ('2073', '5', '0', '14:30', '16:30', '30', '6');
INSERT INTO `addition_reservation_period` VALUES ('2074', '5', '0', '16:30', '18:30', '30', '6');
INSERT INTO `addition_reservation_period` VALUES ('2075', '5', '0', '18:30', '20:30', '30', '6');
INSERT INTO `addition_reservation_period` VALUES ('2076', '5', '0', '20:30', '21:30', '30', '6');
INSERT INTO `addition_reservation_period` VALUES ('2113', '6', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('2123', '6', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('2133', '6', '0', '1010', '0111', '2', '0');
INSERT INTO `addition_reservation_period` VALUES ('2134', '0', '0', '', '', '0', '0');
INSERT INTO `addition_reservation_period` VALUES ('2135', '0', '0', '0999', '0999', '99', '2');
INSERT INTO `addition_reservation_period` VALUES ('2136', '31', '0', '11', '11', '11', '1');
INSERT INTO `addition_reservation_period` VALUES ('2137', '31', '0', '22', '22', '22', '2');
INSERT INTO `addition_reservation_period` VALUES ('2138', '27', '0', '0100', '0300', '10', '1');
INSERT INTO `addition_reservation_period` VALUES ('2139', '27', '0', '0300', '0500', '10', '3');
INSERT INTO `addition_reservation_period` VALUES ('2142', '29', '0', '0100', '0300', '10', '1');
INSERT INTO `addition_reservation_period` VALUES ('2143', '29', '0', '0300', '0500', '10', '2');
INSERT INTO `addition_reservation_period` VALUES ('2161', '28', '0', '0100', '0300', '10', '1');
INSERT INTO `addition_reservation_period` VALUES ('2162', '28', '0', '0300', '0500', '10', '1');
INSERT INTO `addition_reservation_period` VALUES ('2163', '28', '0', '0500', '0700', '10', '1');
INSERT INTO `addition_reservation_period` VALUES ('2164', '28', '0', '0700', '0900', '10', '1');
INSERT INTO `addition_reservation_period` VALUES ('2165', '28', '0', '0900', '1000', '10', '1');
INSERT INTO `addition_reservation_period` VALUES ('2166', '28', '0', '0300', '0500', '10', '5');
INSERT INTO `addition_reservation_period` VALUES ('2167', '28', '0', '0100', '0300', '10', '5');
INSERT INTO `addition_reservation_period` VALUES ('2230', '5', '0', '07:00', '09:00', '30', '2');
INSERT INTO `addition_reservation_period` VALUES ('2231', '5', '0', '09:00', '11:00', '30', '2');
INSERT INTO `addition_reservation_period` VALUES ('2232', '5', '0', '11:00', '13:00', '30', '2');
INSERT INTO `addition_reservation_period` VALUES ('2233', '5', '0', '14:30', '16:30', '30', '2');
INSERT INTO `addition_reservation_period` VALUES ('2234', '5', '0', '16:30', '18:30', '30', '2');
INSERT INTO `addition_reservation_period` VALUES ('2235', '5', '0', '18:30', '20:30', '30', '2');
INSERT INTO `addition_reservation_period` VALUES ('2236', '5', '0', '20:30', '21:30', '30', '2');
INSERT INTO `addition_reservation_period` VALUES ('2237', '5', '0', '22:00', '23:00', '12', '2');
INSERT INTO `addition_reservation_period` VALUES ('2287', '5', '0', '07:00', '09:00', '30', '1');
INSERT INTO `addition_reservation_period` VALUES ('2288', '5', '0', '09:00', '11:00', '30', '1');
INSERT INTO `addition_reservation_period` VALUES ('2289', '5', '0', '11:00', '13:00', '30', '1');
INSERT INTO `addition_reservation_period` VALUES ('2290', '5', '0', '14:30', '16:30', '30', '1');
INSERT INTO `addition_reservation_period` VALUES ('2291', '5', '0', '16:30', '18:30', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2292', '5', '0', '18:30', '20:30', '30', '1');
INSERT INTO `addition_reservation_period` VALUES ('2293', '5', '0', '20:30', '21:30', '10', '1');
INSERT INTO `addition_reservation_period` VALUES ('2294', '5', '0', '22:00', '23:00', '12', '1');
INSERT INTO `addition_reservation_period` VALUES ('2430', '30', '0', '13:00', '14:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2431', '30', '0', '14:00', '15:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2432', '30', '0', '15:00', '16:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2433', '30', '0', '16:00', '17:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2434', '30', '0', '17:00', '18:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2435', '30', '0', '18:00', '19:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2436', '30', '0', '19:00', '20:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2437', '30', '0', '20:00', '21:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2438', '30', '0', '21:00', '22:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2448', '30', '0', '13:00', '14:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('2449', '30', '0', '14:00', '15:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('2450', '30', '0', '15:00', '16:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('2451', '30', '0', '16:00', '17:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('2452', '30', '0', '17:00', '18:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('2453', '30', '0', '18:00', '19:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('2454', '30', '0', '19:00', '20:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('2455', '30', '0', '20:00', '21:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('2456', '30', '0', '21:00', '22:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('2457', '30', '0', '13:00', '14:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2458', '30', '0', '14:00', '15:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2459', '30', '0', '15:00', '16:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2460', '30', '0', '16:00', '17:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2461', '30', '0', '17:00', '18:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2462', '30', '0', '18:00', '19:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2463', '30', '0', '19:00', '20:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2464', '30', '0', '20:00', '21:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2465', '30', '0', '21:00', '22:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2466', '30', '0', '13:00', '14:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('2467', '30', '0', '14:00', '15:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('2468', '30', '0', '15:00', '16:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('2469', '30', '0', '16:00', '17:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('2470', '30', '0', '17:00', '18:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('2471', '30', '0', '18:00', '19:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('2472', '30', '0', '19:00', '20:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('2473', '30', '0', '20:00', '21:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('2474', '30', '0', '21:00', '22:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('2475', '30', '0', '13:00', '14:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('2476', '30', '0', '14:00', '15:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('2477', '30', '0', '15:00', '16:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('2478', '30', '0', '16:00', '17:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('2479', '30', '0', '17:00', '18:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('2480', '30', '0', '18:00', '19:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('2481', '30', '0', '19:00', '20:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('2482', '30', '0', '20:00', '21:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('2483', '30', '0', '21:00', '22:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('2507', '30', '0', '13:00', '14:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('2508', '30', '0', '14:00', '15:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('2509', '30', '0', '15:00', '16:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('2510', '30', '0', '16:00', '17:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('2511', '30', '0', '17:00', '18:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('2512', '30', '0', '18:00', '19:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('2513', '30', '0', '19:00', '20:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('2514', '30', '0', '20:00', '21:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('2515', '30', '0', '21:00', '22:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('2516', '30', '0', '13:00', '14:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('2517', '30', '0', '14:00', '15:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('2518', '30', '0', '15:00', '16:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('2519', '30', '0', '16:00', '17:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('2520', '30', '0', '17:00', '18:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('2521', '30', '0', '18:00', '19:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('2522', '30', '0', '19:00', '20:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('2523', '30', '0', '20:00', '21:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('2764', '1', '0', '07:00', '08:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('2765', '1', '0', '08:00', '09:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('2766', '1', '0', '09:00', '10:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('2767', '1', '0', '10:00', '11:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('2768', '1', '0', '11:00', '12:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('2769', '1', '0', '12:00', '13:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('2770', '1', '0', '13:00', '14:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('2771', '1', '0', '14:00', '15:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('2772', '1', '0', '15:00', '16:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('2773', '1', '0', '16:00', '17:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('2774', '1', '0', '17:00', '18:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('2775', '1', '0', '18:00', '19:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('2776', '1', '0', '19:00', '20:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('2777', '1', '0', '20:00', '21:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('2778', '1', '0', '21:00', '22:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('2821', '1', '0', '07:00', '08:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2822', '1', '0', '08:00', '09:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2823', '1', '0', '09:00', '10:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2824', '1', '0', '10:00', '11:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2825', '1', '0', '11:00', '12:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2826', '1', '0', '12:00', '13:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2827', '1', '0', '13:00', '14:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2828', '1', '0', '14:00', '15:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2829', '1', '0', '15:00', '16:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2830', '1', '0', '16:00', '17:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2831', '1', '0', '17:00', '18:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2832', '1', '0', '18:00', '19:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2833', '1', '0', '19:00', '20:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2834', '1', '0', '20:00', '21:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2835', '1', '0', '21:00', '22:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('2836', '1', '0', '07:00', '08:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('2837', '1', '0', '08:00', '09:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('2838', '1', '0', '09:00', '10:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('2839', '1', '0', '10:00', '11:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('2840', '1', '0', '11:00', '12:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('2841', '1', '0', '12:00', '13:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('2842', '1', '0', '13:00', '14:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('2843', '1', '0', '14:00', '15:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('2844', '1', '0', '15:00', '16:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('2845', '1', '0', '16:00', '17:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('2846', '1', '0', '17:00', '18:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('2847', '1', '0', '18:00', '19:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('2848', '1', '0', '19:00', '20:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('2849', '1', '0', '20:00', '21:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('2850', '1', '0', '21:00', '22:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('2851', '1', '0', '08:00', '09:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2852', '1', '0', '09:00', '10:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2853', '1', '0', '10:00', '11:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2854', '1', '0', '11:00', '12:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2855', '1', '0', '12:00', '13:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2856', '1', '0', '13:00', '14:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2857', '1', '0', '14:00', '15:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2858', '1', '0', '15:00', '16:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2859', '1', '0', '16:00', '17:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2860', '1', '0', '17:00', '18:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2861', '1', '0', '18:00', '19:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2862', '1', '0', '19:00', '20:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2863', '1', '0', '20:00', '21:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2864', '1', '0', '21:00', '22:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2865', '1', '0', '07:00', '08:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('2866', '1', '0', '08:00', '09:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('2867', '1', '0', '09:00', '10:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('2868', '1', '0', '10:00', '11:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('2869', '1', '0', '11:00', '12:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('2870', '1', '0', '12:00', '13:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('2871', '1', '0', '13:00', '14:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('2872', '1', '0', '14:00', '15:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('2873', '1', '0', '15:00', '16:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('2874', '1', '0', '16:00', '17:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('2875', '1', '0', '17:00', '18:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('2876', '1', '0', '18:00', '19:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('2877', '1', '0', '19:00', '20:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('2878', '1', '0', '20:00', '21:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('2879', '1', '0', '21:00', '22:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('2880', '1', '0', '07:00', '08:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('2881', '1', '0', '08:00', '09:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('2882', '1', '0', '09:00', '10:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('2883', '1', '0', '10:00', '11:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('2884', '1', '0', '11:00', '12:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('2885', '1', '0', '12:00', '13:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('2886', '1', '0', '13:00', '14:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('2887', '1', '0', '14:00', '15:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('2888', '1', '0', '15:00', '16:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('2889', '1', '0', '16:00', '17:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('2890', '1', '0', '17:00', '18:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('2891', '1', '0', '18:00', '19:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('2892', '1', '0', '19:00', '20:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('2893', '1', '0', '20:00', '21:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('2894', '1', '0', '21:00', '22:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('2895', '1', '0', '07:00', '08:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('2896', '1', '0', '07:00', '08:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('2897', '1', '0', '08:00', '09:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('2898', '1', '0', '09:00', '10:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('2899', '1', '0', '10:00', '11:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('2900', '1', '0', '11:00', '12:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('2901', '1', '0', '12:00', '13:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('2902', '1', '0', '13:00', '14:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('2903', '1', '0', '14:00', '15:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('2904', '1', '0', '15:00', '16:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('2905', '1', '0', '16:00', '17:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('2906', '1', '0', '17:00', '18:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('2907', '1', '0', '18:00', '19:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('2908', '1', '0', '19:00', '20:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('2909', '1', '0', '20:00', '21:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('2910', '1', '0', '21:00', '22:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('2911', '2', '0', '07:00', '08:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('2912', '2', '0', '08:00', '09:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('2913', '2', '0', '09:00', '10:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('2914', '2', '0', '10:00', '11:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('2915', '2', '0', '11:00', '12:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('2916', '2', '0', '12:00', '13:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('2917', '2', '0', '13:00', '14:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('2918', '2', '0', '14:00', '15:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('2919', '2', '0', '15:00', '16:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('2920', '2', '0', '16:00', '17:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('2921', '2', '0', '17:00', '18:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('2922', '2', '0', '18:00', '19:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('2923', '2', '0', '19:00', '20:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('2924', '2', '0', '20:00', '21:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('2925', '2', '0', '21:00', '22:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('2926', '2', '0', '07:00', '08:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('2927', '2', '0', '08:00', '09:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('2928', '2', '0', '09:00', '10:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('2929', '2', '0', '10:00', '11:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('2930', '2', '0', '11:00', '12:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('2931', '2', '0', '12:00', '13:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('2932', '2', '0', '13:00', '14:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('2933', '2', '0', '14:00', '15:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('2934', '2', '0', '15:00', '16:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('2935', '2', '0', '16:00', '17:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('2936', '2', '0', '17:00', '18:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('2937', '2', '0', '18:00', '19:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('2938', '2', '0', '19:00', '20:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('2939', '2', '0', '20:00', '21:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('2940', '2', '0', '21:00', '22:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('2941', '2', '0', '07:00', '08:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('2942', '2', '0', '08:00', '09:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('2943', '2', '0', '09:00', '10:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('2944', '2', '0', '10:00', '11:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('2945', '2', '0', '11:00', '12:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('2946', '2', '0', '12:00', '13:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('2947', '2', '0', '13:00', '14:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('2948', '2', '0', '14:00', '15:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('2949', '2', '0', '15:00', '16:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('2950', '2', '0', '16:00', '17:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('2951', '2', '0', '17:00', '18:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('2952', '2', '0', '18:00', '19:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('2953', '2', '0', '19:00', '20:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('2954', '2', '0', '20:00', '21:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('2955', '2', '0', '21:00', '22:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('2956', '2', '0', '07:00', '08:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('2957', '2', '0', '08:00', '09:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('2958', '2', '0', '09:00', '10:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('2959', '2', '0', '10:00', '11:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('2960', '2', '0', '11:00', '12:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('2961', '2', '0', '12:00', '13:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('2962', '2', '0', '13:00', '14:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('2963', '2', '0', '14:00', '15:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('2964', '2', '0', '15:00', '16:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('2965', '2', '0', '16:00', '17:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('2966', '2', '0', '17:00', '18:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('2967', '2', '0', '18:00', '19:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('2968', '2', '0', '19:00', '20:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('2969', '2', '0', '20:00', '21:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('2970', '2', '0', '21:00', '22:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('2971', '2', '0', '07:00', '08:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('2972', '2', '0', '08:00', '09:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('2973', '2', '0', '09:00', '10:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('2974', '2', '0', '10:00', '11:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('2975', '2', '0', '11:00', '12:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('2976', '2', '0', '12:00', '13:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('2977', '2', '0', '13:00', '14:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('2978', '2', '0', '14:00', '15:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('2979', '2', '0', '15:00', '16:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('2980', '2', '0', '16:00', '17:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('2981', '2', '0', '17:00', '18:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('2982', '2', '0', '18:00', '19:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('2983', '2', '0', '19:00', '20:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('2984', '2', '0', '20:00', '21:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('2985', '2', '0', '21:00', '22:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('2986', '2', '0', '07:00', '08:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('2987', '2', '0', '08:00', '09:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('2988', '2', '0', '09:00', '10:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('2989', '2', '0', '10:00', '11:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('2990', '2', '0', '11:00', '12:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('2991', '2', '0', '12:00', '13:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('2992', '2', '0', '13:00', '14:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('2993', '2', '0', '14:00', '15:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('2994', '2', '0', '15:00', '16:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('2995', '2', '0', '16:00', '17:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('2996', '2', '0', '17:00', '18:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('2997', '2', '0', '18:00', '19:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('2998', '2', '0', '19:00', '20:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('2999', '2', '0', '20:00', '21:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('3000', '2', '0', '21:00', '22:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('3016', '2', '0', '07:00', '08:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3017', '2', '0', '08:00', '09:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3018', '2', '0', '09:00', '10:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3019', '2', '0', '10:00', '11:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3020', '2', '0', '11:00', '12:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3021', '2', '0', '12:00', '13:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3022', '2', '0', '13:00', '14:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3023', '2', '0', '14:00', '15:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3024', '2', '0', '15:00', '16:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3025', '2', '0', '16:00', '17:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3026', '2', '0', '17:00', '18:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3027', '2', '0', '18:00', '19:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3028', '2', '0', '19:00', '20:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3029', '2', '0', '20:00', '21:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3030', '2', '0', '21:00', '22:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3031', '7', '0', '13:00', '14:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3032', '7', '0', '14:00', '15:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3033', '7', '0', '15:00', '16:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3034', '7', '0', '16:00', '17:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3035', '7', '0', '17:00', '18:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3036', '7', '0', '18:00', '19:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3037', '7', '0', '19:00', '20:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3038', '7', '0', '20:00', '21:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3039', '7', '0', '21:00', '22:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3040', '7', '0', '13:00', '14:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3041', '7', '0', '14:00', '15:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3042', '7', '0', '15:00', '16:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3043', '7', '0', '16:00', '17:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3044', '7', '0', '17:00', '18:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3045', '7', '0', '18:00', '19:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3046', '7', '0', '19:00', '20:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3047', '7', '0', '20:00', '21:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3048', '7', '0', '21:00', '22:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3049', '7', '0', '13:00', '14:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3050', '7', '0', '14:00', '15:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3051', '7', '0', '15:00', '16:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3052', '7', '0', '16:00', '17:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3053', '7', '0', '17:00', '18:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3054', '7', '0', '18:00', '19:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3055', '7', '0', '19:00', '20:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3056', '7', '0', '20:00', '21:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3057', '7', '0', '21:00', '22:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3058', '7', '0', '13:00', '14:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3059', '7', '0', '14:00', '15:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3060', '7', '0', '15:00', '16:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3061', '7', '0', '16:00', '17:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3062', '7', '0', '17:00', '18:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3063', '7', '0', '18:00', '19:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3064', '7', '0', '19:00', '20:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3065', '7', '0', '20:00', '21:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3066', '7', '0', '21:00', '22:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3067', '7', '0', '13:00', '14:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3068', '7', '0', '14:00', '15:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3069', '7', '0', '15:00', '16:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3070', '7', '0', '16:00', '17:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3071', '7', '0', '17:00', '18:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3072', '7', '0', '18:00', '19:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3073', '7', '0', '19:00', '20:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3074', '7', '0', '20:00', '21:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3075', '7', '0', '21:00', '22:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3076', '7', '0', '13:00', '14:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3077', '7', '0', '14:00', '15:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3078', '7', '0', '15:00', '16:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3079', '7', '0', '16:00', '17:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3080', '7', '0', '17:00', '18:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3081', '7', '0', '18:00', '19:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3082', '7', '0', '19:00', '20:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3083', '7', '0', '20:00', '21:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3084', '7', '0', '21:00', '22:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3103', '7', '0', '13:00', '14:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3104', '7', '0', '14:00', '15:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3105', '7', '0', '15:00', '16:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3106', '7', '0', '16:00', '17:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3107', '7', '0', '17:00', '18:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3108', '7', '0', '18:00', '19:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3109', '7', '0', '19:00', '20:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3110', '7', '0', '20:00', '21:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3111', '7', '0', '21:00', '22:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3112', '6', '0', '13:00', '14:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3113', '6', '0', '14:00', '15:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3114', '6', '0', '15:00', '16:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3115', '6', '0', '16:00', '17:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3116', '6', '0', '17:00', '18:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3117', '6', '0', '18:00', '19:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3118', '6', '0', '19:00', '20:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3119', '6', '0', '20:00', '21:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3120', '6', '0', '21:00', '22:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3121', '6', '0', '13:00', '14:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3122', '6', '0', '14:00', '15:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3123', '6', '0', '15:00', '16:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3124', '6', '0', '16:00', '17:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3125', '6', '0', '17:00', '18:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3126', '6', '0', '18:00', '19:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3127', '6', '0', '19:00', '20:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3128', '6', '0', '20:00', '21:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3129', '6', '0', '21:00', '22:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3130', '6', '0', '13:00', '14:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3131', '6', '0', '14:00', '15:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3132', '6', '0', '15:00', '16:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3133', '6', '0', '16:00', '17:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3134', '6', '0', '17:00', '18:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3135', '6', '0', '18:00', '19:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3136', '6', '0', '19:00', '20:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3137', '6', '0', '20:00', '21:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3138', '6', '0', '21:00', '22:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3139', '6', '0', '13:00', '14:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3140', '6', '0', '14:00', '15:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3141', '6', '0', '15:00', '16:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3142', '6', '0', '16:00', '17:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3143', '6', '0', '17:00', '18:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3144', '6', '0', '18:00', '19:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3145', '6', '0', '19:00', '20:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3146', '6', '0', '20:00', '21:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3147', '6', '0', '21:00', '22:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3148', '6', '0', '13:00', '14:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3149', '6', '0', '14:00', '15:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3150', '6', '0', '15:00', '16:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3151', '6', '0', '16:00', '17:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3152', '6', '0', '17:00', '18:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3153', '6', '0', '18:00', '19:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3154', '6', '0', '19:00', '20:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3155', '6', '0', '20:00', '21:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3156', '6', '0', '21:00', '22:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3157', '6', '0', '13:00', '14:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3158', '6', '0', '14:00', '15:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3159', '6', '0', '15:00', '16:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3160', '6', '0', '16:00', '17:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3161', '6', '0', '17:00', '18:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3162', '6', '0', '18:00', '19:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3163', '6', '0', '19:00', '20:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3164', '6', '0', '20:00', '21:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3165', '6', '0', '21:00', '22:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3166', '6', '0', '13:00', '14:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3167', '6', '0', '14:00', '15:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3168', '6', '0', '15:00', '16:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3169', '6', '0', '16:00', '17:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3170', '6', '0', '17:00', '18:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3171', '6', '0', '18:00', '19:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3172', '6', '0', '19:00', '20:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3173', '6', '0', '20:00', '21:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3174', '6', '0', '21:00', '22:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3238', '9', '0', '07:00', '08:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('3239', '9', '0', '08:00', '09:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('3240', '9', '0', '09:00', '10:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('3241', '9', '0', '10:00', '11:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('3242', '9', '0', '11:00', '12:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('3243', '9', '0', '12:00', '13:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('3244', '9', '0', '13:00', '14:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('3245', '9', '0', '14:00', '15:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('3246', '9', '0', '15:00', '16:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('3247', '9', '0', '16:00', '17:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('3248', '9', '0', '17:00', '18:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('3249', '9', '0', '18:00', '19:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('3250', '9', '0', '19:00', '20:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('3251', '9', '0', '20:00', '21:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('3252', '9', '0', '21:00', '22:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('3253', '9', '0', '07:00', '08:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('3254', '9', '0', '08:00', '09:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('3255', '9', '0', '09:00', '10:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('3256', '9', '0', '10:00', '11:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('3257', '9', '0', '11:00', '12:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('3258', '9', '0', '12:00', '13:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('3259', '9', '0', '13:00', '14:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('3260', '9', '0', '14:00', '15:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('3261', '9', '0', '15:00', '16:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('3262', '9', '0', '16:00', '17:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('3263', '9', '0', '17:00', '18:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('3264', '9', '0', '18:00', '19:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('3265', '9', '0', '19:00', '20:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('3266', '9', '0', '20:00', '21:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('3267', '9', '0', '21:00', '22:00', '5', '2');
INSERT INTO `addition_reservation_period` VALUES ('3268', '9', '0', '07:00', '08:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('3269', '9', '0', '08:00', '09:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('3270', '9', '0', '09:00', '10:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('3271', '9', '0', '10:00', '11:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('3272', '9', '0', '11:00', '12:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('3273', '9', '0', '12:00', '13:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('3274', '9', '0', '13:00', '14:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('3275', '9', '0', '14:00', '15:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('3276', '9', '0', '15:00', '16:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('3277', '9', '0', '16:00', '17:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('3278', '9', '0', '17:00', '18:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('3279', '9', '0', '18:00', '19:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('3280', '9', '0', '19:00', '20:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('3281', '9', '0', '20:00', '21:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('3282', '9', '0', '21:00', '22:00', '5', '3');
INSERT INTO `addition_reservation_period` VALUES ('3283', '9', '0', '07:00', '08:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('3284', '9', '0', '08:00', '09:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('3285', '9', '0', '09:00', '10:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('3286', '9', '0', '10:00', '11:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('3287', '9', '0', '11:00', '12:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('3288', '9', '0', '12:00', '13:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('3289', '9', '0', '13:00', '14:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('3290', '9', '0', '14:00', '15:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('3291', '9', '0', '15:00', '16:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('3292', '9', '0', '16:00', '17:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('3293', '9', '0', '17:00', '18:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('3294', '9', '0', '18:00', '19:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('3295', '9', '0', '19:00', '20:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('3296', '9', '0', '20:00', '21:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('3297', '9', '0', '21:00', '22:00', '5', '4');
INSERT INTO `addition_reservation_period` VALUES ('3298', '9', '0', '07:00', '08:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('3299', '9', '0', '08:00', '09:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('3300', '9', '0', '09:00', '10:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('3301', '9', '0', '10:00', '11:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('3302', '9', '0', '11:00', '12:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('3303', '9', '0', '12:00', '13:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('3304', '9', '0', '13:00', '14:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('3305', '9', '0', '14:00', '15:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('3306', '9', '0', '15:00', '16:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('3307', '9', '0', '16:00', '17:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('3308', '9', '0', '17:00', '18:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('3309', '9', '0', '18:00', '19:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('3310', '9', '0', '19:00', '20:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('3311', '9', '0', '20:00', '21:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('3312', '9', '0', '21:00', '22:00', '5', '5');
INSERT INTO `addition_reservation_period` VALUES ('3313', '9', '0', '07:00', '08:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('3314', '9', '0', '08:00', '09:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('3315', '9', '0', '09:00', '10:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('3316', '9', '0', '10:00', '11:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('3317', '9', '0', '11:00', '12:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('3318', '9', '0', '12:00', '13:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('3319', '9', '0', '13:00', '14:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('3320', '9', '0', '14:00', '15:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('3321', '9', '0', '15:00', '16:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('3322', '9', '0', '16:00', '17:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('3323', '9', '0', '17:00', '18:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('3324', '9', '0', '18:00', '19:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('3325', '9', '0', '19:00', '20:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('3326', '9', '0', '20:00', '21:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('3327', '9', '0', '21:00', '22:00', '5', '6');
INSERT INTO `addition_reservation_period` VALUES ('3328', '9', '0', '07:00', '08:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3329', '9', '0', '08:00', '09:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3330', '9', '0', '09:00', '10:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3331', '9', '0', '10:00', '11:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3332', '9', '0', '11:00', '12:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3333', '9', '0', '12:00', '13:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3334', '9', '0', '13:00', '14:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3335', '9', '0', '14:00', '15:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3336', '9', '0', '15:00', '16:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3337', '9', '0', '16:00', '17:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3338', '9', '0', '17:00', '18:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3339', '9', '0', '18:00', '19:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3340', '9', '0', '19:00', '20:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3341', '9', '0', '20:00', '21:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3342', '9', '0', '21:00', '22:00', '5', '7');
INSERT INTO `addition_reservation_period` VALUES ('3448', '12', '0', '13:00', '14:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3449', '12', '0', '14:00', '15:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3450', '12', '0', '15:00', '16:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3451', '12', '0', '16:00', '17:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3452', '12', '0', '17:00', '18:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3453', '12', '0', '18:00', '19:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3454', '12', '0', '19:00', '20:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3455', '12', '0', '20:00', '21:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3456', '12', '0', '21:00', '22:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3457', '12', '0', '13:00', '14:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3458', '12', '0', '14:00', '15:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3459', '12', '0', '15:00', '16:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3460', '12', '0', '16:00', '17:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3461', '12', '0', '17:00', '18:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3462', '12', '0', '18:00', '19:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3463', '12', '0', '19:00', '20:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3464', '12', '0', '20:00', '21:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3465', '12', '0', '21:00', '22:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3466', '12', '0', '13:00', '14:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3467', '12', '0', '14:00', '15:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3468', '12', '0', '15:00', '16:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3469', '12', '0', '16:00', '17:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3470', '12', '0', '17:00', '18:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3471', '12', '0', '18:00', '19:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3472', '12', '0', '19:00', '20:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3473', '12', '0', '20:00', '21:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3474', '12', '0', '21:00', '22:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3475', '12', '0', '13:00', '14:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3476', '12', '0', '14:00', '15:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3477', '12', '0', '15:00', '16:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3478', '12', '0', '16:00', '17:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3479', '12', '0', '17:00', '18:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3480', '12', '0', '18:00', '19:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3481', '12', '0', '19:00', '20:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3482', '12', '0', '20:00', '21:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3483', '12', '0', '21:00', '22:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3484', '12', '0', '13:00', '14:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3485', '12', '0', '14:00', '15:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3486', '12', '0', '15:00', '16:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3487', '12', '0', '16:00', '17:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3488', '12', '0', '17:00', '18:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3489', '12', '0', '18:00', '19:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3490', '12', '0', '19:00', '20:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3491', '12', '0', '20:00', '21:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3492', '12', '0', '21:00', '22:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3493', '12', '0', '13:00', '14:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3494', '12', '0', '14:00', '15:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3495', '12', '0', '15:00', '16:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3496', '12', '0', '16:00', '17:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3497', '12', '0', '17:00', '18:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3498', '12', '0', '18:00', '19:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3499', '12', '0', '19:00', '20:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3500', '12', '0', '20:00', '21:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3501', '12', '0', '21:00', '22:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3502', '12', '0', '13:00', '14:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3503', '12', '0', '14:00', '15:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3504', '12', '0', '15:00', '16:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3505', '12', '0', '16:00', '17:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3506', '12', '0', '17:00', '18:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3507', '12', '0', '18:00', '19:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3508', '12', '0', '19:00', '20:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3509', '12', '0', '20:00', '21:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3510', '12', '0', '21:00', '22:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3511', '13', '0', '13:00', '14:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3512', '13', '0', '14:00', '15:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3513', '13', '0', '15:00', '16:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3514', '13', '0', '16:00', '17:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3515', '13', '0', '17:00', '18:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3516', '13', '0', '18:00', '19:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3517', '13', '0', '19:00', '20:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3518', '13', '0', '20:00', '21:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3519', '13', '0', '21:00', '22:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3520', '13', '0', '13:00', '14:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3521', '13', '0', '14:00', '15:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3522', '13', '0', '15:00', '16:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3523', '13', '0', '16:00', '17:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3524', '13', '0', '17:00', '18:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3525', '13', '0', '18:00', '19:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3526', '13', '0', '19:00', '20:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3527', '13', '0', '20:00', '21:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3528', '13', '0', '21:00', '22:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3529', '13', '0', '13:00', '14:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3530', '13', '0', '14:00', '15:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3531', '13', '0', '15:00', '16:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3532', '13', '0', '16:00', '17:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3533', '13', '0', '17:00', '18:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3534', '13', '0', '18:00', '19:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3535', '13', '0', '19:00', '20:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3536', '13', '0', '20:00', '21:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3537', '13', '0', '21:00', '22:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3538', '13', '0', '13:00', '14:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3539', '13', '0', '14:00', '15:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3540', '13', '0', '15:00', '16:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3541', '13', '0', '16:00', '17:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3542', '13', '0', '17:00', '18:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3543', '13', '0', '18:00', '19:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3544', '13', '0', '19:00', '20:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3545', '13', '0', '20:00', '21:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3546', '13', '0', '21:00', '22:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3547', '13', '0', '13:00', '14:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3548', '13', '0', '14:00', '15:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3549', '13', '0', '15:00', '16:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3550', '13', '0', '16:00', '17:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3551', '13', '0', '17:00', '18:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3552', '13', '0', '18:00', '19:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3553', '13', '0', '19:00', '20:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3554', '13', '0', '20:00', '21:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3555', '13', '0', '21:00', '22:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3556', '13', '0', '13:00', '14:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3557', '13', '0', '14:00', '15:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3558', '13', '0', '15:00', '16:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3559', '13', '0', '16:00', '17:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3560', '13', '0', '17:00', '18:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3561', '13', '0', '18:00', '19:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3562', '13', '0', '19:00', '20:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3563', '13', '0', '20:00', '21:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3564', '13', '0', '21:00', '22:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3565', '13', '0', '13:00', '14:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3566', '13', '0', '14:00', '15:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3567', '13', '0', '15:00', '16:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3568', '13', '0', '16:00', '17:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3569', '13', '0', '17:00', '18:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3570', '13', '0', '18:00', '19:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3571', '13', '0', '19:00', '20:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3572', '13', '0', '20:00', '21:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3573', '13', '0', '21:00', '22:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3637', '15', '0', '13:00', '14:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3638', '15', '0', '14:00', '15:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3639', '15', '0', '15:00', '16:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3640', '15', '0', '16:00', '17:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3641', '15', '0', '17:00', '18:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3642', '15', '0', '18:00', '19:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3643', '15', '0', '19:00', '20:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3644', '15', '0', '20:00', '21:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3645', '15', '0', '21:00', '22:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3646', '15', '0', '13:00', '14:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3647', '15', '0', '14:00', '15:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3648', '15', '0', '15:00', '16:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3649', '15', '0', '16:00', '17:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3650', '15', '0', '17:00', '18:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3651', '15', '0', '18:00', '19:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3652', '15', '0', '19:00', '20:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3653', '15', '0', '20:00', '21:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3654', '15', '0', '21:00', '22:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3655', '15', '0', '13:00', '14:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3656', '15', '0', '14:00', '15:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3657', '15', '0', '15:00', '16:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3658', '15', '0', '16:00', '17:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3659', '15', '0', '17:00', '18:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3660', '15', '0', '18:00', '19:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3661', '15', '0', '19:00', '20:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3662', '15', '0', '20:00', '21:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3663', '15', '0', '21:00', '22:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3664', '15', '0', '13:00', '14:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3665', '15', '0', '14:00', '15:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3666', '15', '0', '15:00', '16:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3667', '15', '0', '16:00', '17:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3668', '15', '0', '17:00', '18:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3669', '15', '0', '18:00', '19:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3670', '15', '0', '19:00', '20:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3671', '15', '0', '20:00', '21:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3672', '15', '0', '21:00', '22:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3673', '15', '0', '13:00', '14:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3674', '15', '0', '14:00', '15:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3675', '15', '0', '15:00', '16:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3676', '15', '0', '16:00', '17:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3677', '15', '0', '17:00', '18:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3678', '15', '0', '18:00', '19:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3679', '15', '0', '19:00', '20:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3680', '15', '0', '20:00', '21:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3681', '15', '0', '21:00', '22:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3682', '15', '0', '13:00', '14:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3683', '15', '0', '14:00', '15:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3684', '15', '0', '15:00', '16:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3685', '15', '0', '16:00', '17:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3686', '15', '0', '17:00', '18:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3687', '15', '0', '18:00', '19:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3688', '15', '0', '19:00', '20:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3689', '15', '0', '20:00', '21:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3690', '15', '0', '21:00', '22:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3691', '15', '0', '13:00', '14:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3692', '15', '0', '14:00', '15:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3693', '15', '0', '15:00', '16:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3694', '15', '0', '16:00', '17:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3695', '15', '0', '17:00', '18:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3696', '15', '0', '18:00', '19:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3697', '15', '0', '19:00', '20:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3698', '15', '0', '20:00', '21:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3699', '15', '0', '21:00', '22:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3700', '16', '0', '13:00', '14:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3701', '16', '0', '14:00', '15:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3702', '16', '0', '15:00', '16:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3703', '16', '0', '16:00', '17:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3704', '16', '0', '17:00', '18:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3705', '16', '0', '18:00', '19:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3706', '16', '0', '19:00', '20:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3707', '16', '0', '20:00', '21:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3708', '16', '0', '21:00', '22:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3709', '16', '0', '13:00', '14:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3710', '16', '0', '14:00', '15:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3711', '16', '0', '15:00', '16:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3712', '16', '0', '16:00', '17:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3713', '16', '0', '17:00', '18:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3714', '16', '0', '18:00', '19:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3715', '16', '0', '19:00', '20:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3716', '16', '0', '20:00', '21:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3717', '16', '0', '21:00', '22:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3718', '16', '0', '13:00', '14:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3719', '16', '0', '14:00', '15:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3720', '16', '0', '15:00', '16:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3721', '16', '0', '16:00', '17:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3722', '16', '0', '17:00', '18:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3723', '16', '0', '18:00', '19:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3724', '16', '0', '19:00', '20:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3725', '16', '0', '20:00', '21:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3726', '16', '0', '21:00', '22:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3727', '16', '0', '13:00', '14:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3728', '16', '0', '14:00', '15:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3729', '16', '0', '15:00', '16:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3730', '16', '0', '16:00', '17:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3731', '16', '0', '17:00', '18:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3732', '16', '0', '18:00', '19:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3733', '16', '0', '19:00', '20:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3734', '16', '0', '20:00', '21:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3735', '16', '0', '21:00', '22:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3736', '16', '0', '13:00', '14:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3737', '16', '0', '14:00', '15:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3738', '16', '0', '15:00', '16:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3739', '16', '0', '16:00', '17:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3740', '16', '0', '17:00', '18:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3741', '16', '0', '18:00', '19:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3742', '16', '0', '19:00', '20:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3743', '16', '0', '20:00', '21:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3744', '16', '0', '21:00', '22:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3745', '16', '0', '13:00', '14:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3746', '16', '0', '14:00', '15:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3747', '16', '0', '15:00', '16:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3748', '16', '0', '16:00', '17:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3749', '16', '0', '17:00', '18:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3750', '16', '0', '18:00', '19:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3751', '16', '0', '19:00', '20:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3752', '16', '0', '20:00', '21:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3753', '16', '0', '21:00', '22:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3754', '16', '0', '13:00', '14:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3755', '16', '0', '14:00', '15:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3756', '16', '0', '15:00', '16:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3757', '16', '0', '16:00', '17:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3758', '16', '0', '17:00', '18:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3759', '16', '0', '18:00', '19:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3760', '16', '0', '19:00', '20:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3761', '16', '0', '20:00', '21:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3762', '16', '0', '21:00', '22:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3826', '17', '0', '13:00', '14:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3827', '17', '0', '14:00', '15:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3828', '17', '0', '15:00', '16:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3829', '17', '0', '16:00', '17:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3830', '17', '0', '17:00', '18:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3831', '17', '0', '18:00', '19:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3832', '17', '0', '19:00', '20:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3833', '17', '0', '20:00', '21:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3834', '17', '0', '21:00', '22:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3835', '17', '0', '13:00', '14:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3836', '17', '0', '14:00', '15:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3837', '17', '0', '15:00', '16:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3838', '17', '0', '16:00', '17:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3839', '17', '0', '17:00', '18:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3840', '17', '0', '18:00', '19:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3841', '17', '0', '19:00', '20:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3842', '17', '0', '20:00', '21:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3843', '17', '0', '21:00', '22:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3844', '17', '0', '13:00', '14:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3845', '17', '0', '14:00', '15:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3846', '17', '0', '15:00', '16:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3847', '17', '0', '16:00', '17:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3848', '17', '0', '17:00', '18:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3849', '17', '0', '18:00', '19:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3850', '17', '0', '19:00', '20:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3851', '17', '0', '20:00', '21:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3852', '17', '0', '21:00', '22:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3853', '17', '0', '13:00', '14:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3854', '17', '0', '14:00', '15:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3855', '17', '0', '15:00', '16:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3856', '17', '0', '16:00', '17:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3857', '17', '0', '17:00', '18:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3858', '17', '0', '18:00', '19:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3859', '17', '0', '19:00', '20:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3860', '17', '0', '20:00', '21:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3861', '17', '0', '21:00', '22:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3862', '17', '0', '13:00', '14:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3863', '17', '0', '14:00', '15:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3864', '17', '0', '15:00', '16:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3865', '17', '0', '16:00', '17:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3866', '17', '0', '17:00', '18:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3867', '17', '0', '18:00', '19:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3868', '17', '0', '19:00', '20:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3869', '17', '0', '20:00', '21:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3870', '17', '0', '21:00', '22:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3885', '17', '0', '13:00', '14:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3886', '17', '0', '14:00', '15:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3887', '17', '0', '15:00', '16:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3888', '17', '0', '16:00', '17:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3889', '17', '0', '17:00', '18:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3890', '17', '0', '18:00', '19:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3891', '17', '0', '19:00', '20:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3892', '17', '0', '20:00', '21:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3893', '17', '0', '21:00', '22:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3894', '17', '0', '13:00', '14:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3895', '17', '0', '14:00', '15:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3896', '17', '0', '15:00', '16:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3897', '17', '0', '16:00', '17:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3898', '17', '0', '17:00', '18:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3899', '17', '0', '18:00', '19:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3900', '17', '0', '19:00', '20:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3901', '17', '0', '20:00', '21:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3902', '17', '0', '21:00', '22:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3903', '19', '0', '13:00', '14:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3904', '19', '0', '14:00', '15:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3905', '19', '0', '15:00', '16:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3906', '19', '0', '16:00', '17:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3907', '19', '0', '17:00', '18:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3908', '19', '0', '18:00', '19:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3909', '19', '0', '19:00', '20:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3910', '19', '0', '20:00', '21:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3911', '19', '0', '21:00', '22:00', '1', '1');
INSERT INTO `addition_reservation_period` VALUES ('3912', '19', '0', '13:00', '14:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3913', '19', '0', '14:00', '15:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3914', '19', '0', '15:00', '16:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3915', '19', '0', '16:00', '17:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3916', '19', '0', '17:00', '18:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3917', '19', '0', '18:00', '19:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3918', '19', '0', '19:00', '20:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3919', '19', '0', '20:00', '21:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3920', '19', '0', '21:00', '22:00', '1', '2');
INSERT INTO `addition_reservation_period` VALUES ('3921', '19', '0', '13:00', '14:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3922', '19', '0', '14:00', '15:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3923', '19', '0', '15:00', '16:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3924', '19', '0', '16:00', '17:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3925', '19', '0', '17:00', '18:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3926', '19', '0', '18:00', '19:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3927', '19', '0', '19:00', '20:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3928', '19', '0', '20:00', '21:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3929', '19', '0', '21:00', '22:00', '1', '3');
INSERT INTO `addition_reservation_period` VALUES ('3930', '19', '0', '13:00', '14:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3931', '19', '0', '14:00', '15:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3932', '19', '0', '15:00', '16:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3933', '19', '0', '16:00', '17:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3934', '19', '0', '17:00', '18:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3935', '19', '0', '18:00', '19:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3936', '19', '0', '19:00', '20:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3937', '19', '0', '20:00', '21:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3938', '19', '0', '21:00', '22:00', '1', '4');
INSERT INTO `addition_reservation_period` VALUES ('3939', '19', '0', '13:00', '14:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3940', '19', '0', '14:00', '15:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3941', '19', '0', '15:00', '16:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3942', '19', '0', '16:00', '17:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3943', '19', '0', '17:00', '18:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3944', '19', '0', '18:00', '19:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3945', '19', '0', '19:00', '20:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3946', '19', '0', '20:00', '21:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3947', '19', '0', '21:00', '22:00', '1', '5');
INSERT INTO `addition_reservation_period` VALUES ('3948', '19', '0', '13:00', '14:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3949', '19', '0', '14:00', '15:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3950', '19', '0', '15:00', '16:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3951', '19', '0', '16:00', '17:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3952', '19', '0', '17:00', '18:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3953', '19', '0', '18:00', '19:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3954', '19', '0', '19:00', '20:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3955', '19', '0', '20:00', '21:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3956', '19', '0', '21:00', '22:00', '1', '6');
INSERT INTO `addition_reservation_period` VALUES ('3957', '19', '0', '13:00', '14:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3958', '19', '0', '14:00', '15:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3959', '19', '0', '15:00', '16:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3960', '19', '0', '16:00', '17:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3961', '19', '0', '17:00', '18:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3962', '19', '0', '18:00', '19:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3963', '19', '0', '19:00', '20:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3964', '19', '0', '20:00', '21:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3965', '19', '0', '21:00', '22:00', '1', '7');
INSERT INTO `addition_reservation_period` VALUES ('3980', '22', '0', '07:00', '08:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('3981', '22', '0', '08:00', '09:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('3982', '22', '0', '09:00', '10:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('3983', '22', '0', '10:00', '11:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('3984', '22', '0', '11:00', '12:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('3985', '22', '0', '12:00', '13:00', '5', '1');
INSERT INTO `addition_reservation_period` VALUES ('3986', '22', '0', '13:00', '14:00', '5', '1');

-- ----------------------------
-- Table structure for `data_brand`
-- ----------------------------
DROP TABLE IF EXISTS `data_brand`;
CREATE TABLE `data_brand` (
  `brand_id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引',
  `brand_no` varchar(6) COLLATE utf8_unicode_ci NOT NULL COMMENT '編號',
  `brand_name` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '名稱',
  `brand_remark` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `udate` datetime NOT NULL COMMENT '修改時間',
  `uby` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='品牌資料表';

-- ----------------------------
-- Records of data_brand
-- ----------------------------
INSERT INTO `data_brand` VALUES ('38', '001', 'Sony Erics', '', '2012-01-05 12:56:23', '社區經理');
INSERT INTO `data_brand` VALUES ('39', '002', 'HTC', '', '2012-01-07 17:52:27', '系統管理員');
INSERT INTO `data_brand` VALUES ('40', '000', '先逃牌', '555', '2012-01-07 17:59:39', '系統管理員');

-- ----------------------------
-- Table structure for `data_card`
-- ----------------------------
DROP TABLE IF EXISTS `data_card`;
CREATE TABLE `data_card` (
  `card_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `card_num` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '卡號',
  `customer_id` int(20) DEFAULT NULL COMMENT '客戶ID',
  `card_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '持卡人',
  `card_relation` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '持卡人關係',
  `card_ikey` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ikey',
  `card_condition` tinyint(1) DEFAULT '0' COMMENT '卡片狀態',
  `udate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='卡片資料';

-- ----------------------------
-- Records of data_card
-- ----------------------------
INSERT INTO `data_card` VALUES ('1', '0123456783', '158', '王大朝家族卡', '本人', '0123456789', '1', '2011-08-11 17:54:46');
INSERT INTO `data_card` VALUES ('2', '0123456787', '158', '王大朝家族卡', '配偶', '0123456788', '1', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `data_class`
-- ----------------------------
DROP TABLE IF EXISTS `data_class`;
CREATE TABLE `data_class` (
  `class_id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引',
  `class_no` varchar(6) COLLATE utf8_unicode_ci NOT NULL COMMENT '編號',
  `class_name` varchar(12) COLLATE utf8_unicode_ci NOT NULL COMMENT '名稱',
  `class_show` tinyint(1) NOT NULL COMMENT '顯示',
  `class_remark` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `udate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `uby` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  `ordering` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`class_id`),
  KEY `data_class_id` (`class_id`) USING BTREE,
  KEY `data_class_no` (`class_no`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='類別資料';

-- ----------------------------
-- Records of data_class
-- ----------------------------
INSERT INTO `data_class` VALUES ('102', '888', '文具', '1', '', '2012-01-09 10:51:17', '系統管理員', '0');
INSERT INTO `data_class` VALUES ('97', '000110', '3C數位', '1', '', '2012-01-07 15:01:57', '社區經理', '0');
INSERT INTO `data_class` VALUES ('96', '0009', '休閒用品', '1', '', '2012-01-09 09:52:38', '社區經理', '0');
INSERT INTO `data_class` VALUES ('95', '00020', '食材', '1', '11', '2012-01-10 18:19:50', '社區經理', '0');
INSERT INTO `data_class` VALUES ('94', '00028', '居家清潔', '1', '居家用具', '2012-01-07 15:03:57', '社區經理', '0');
INSERT INTO `data_class` VALUES ('93', '0005', '日常用品', '1', '', '2012-01-06 16:58:16', '社區經理', '0');
INSERT INTO `data_class` VALUES ('92', '99999', '保健食品', '1', '營養食品', '2012-01-07 15:02:18', '社區經理', '0');
INSERT INTO `data_class` VALUES ('91', 'ohshit', '巧克力', '1', '', '2012-01-05 09:18:58', '社區經理', '0');
INSERT INTO `data_class` VALUES ('90', '00090', '罐頭', '1', '', '2012-01-09 10:50:28', '社區經理', '0');
INSERT INTO `data_class` VALUES ('89', '00013', '沖泡飲料', '1', '', '2012-01-07 18:07:36', '社區經理', '0');
INSERT INTO `data_class` VALUES ('88', '0008', '礦泉水', '1', '', '2012-01-07 18:30:36', '社區經理', '0');
INSERT INTO `data_class` VALUES ('87', '00012', '果汁', '1', '', '2012-01-09 10:03:17', '社區經理', '0');
INSERT INTO `data_class` VALUES ('86', '0004', '咖啡', '1', '', '2012-01-09 10:51:07', '社區經理', '0');
INSERT INTO `data_class` VALUES ('84', '000112', '飲料', '1', '111', '2012-01-10 18:19:38', '社區經理', '0');
INSERT INTO `data_class` VALUES ('85', '0003', '餅乾', '1', '111', '2012-01-10 18:19:52', '社區經理', '0');

-- ----------------------------
-- Table structure for `data_cusgrp`
-- ----------------------------
DROP TABLE IF EXISTS `data_cusgrp`;
CREATE TABLE `data_cusgrp` (
  `cusgrp_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `cusgrp_no` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `cusgrp_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `udate` datetime NOT NULL COMMENT '修改時間',
  `uby` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`cusgrp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='客戶群組資料';

-- ----------------------------
-- Records of data_cusgrp
-- ----------------------------
INSERT INTO `data_cusgrp` VALUES ('1', '2', '龍騰會館', '0000-00-00 00:00:00', '');
INSERT INTO `data_cusgrp` VALUES ('2', '3', '紫光會館', '0000-00-00 00:00:00', '');
INSERT INTO `data_cusgrp` VALUES ('3', '4', '凌雲會館', '0000-00-00 00:00:00', '');
INSERT INTO `data_cusgrp` VALUES ('4', '5', '極峰會館', '0000-00-00 00:00:00', '');
INSERT INTO `data_cusgrp` VALUES ('5', '6', '鳳翔會館', '0000-00-00 00:00:00', '');
INSERT INTO `data_cusgrp` VALUES ('12', '1', '一樓公設', '0000-00-00 00:00:00', '');
INSERT INTO `data_cusgrp` VALUES ('84', '006', '咖啡館', '2011-01-18 18:05:56', '');
INSERT INTO `data_cusgrp` VALUES ('85', '1200', '高級西餐廳', '2011-02-15 15:50:24', '');
INSERT INTO `data_cusgrp` VALUES ('88', '009', '水貨LV專屬館', '2011-02-18 14:49:05', '');
INSERT INTO `data_cusgrp` VALUES ('91', '0010', '繽紛糖果屋', '2011-02-22 18:37:20', '');
INSERT INTO `data_cusgrp` VALUES ('92', '00101', '過期香水專賣店', '2011-02-22 18:39:51', '');
INSERT INTO `data_cusgrp` VALUES ('93', '0011', '巧克力蛋糕館', '2011-02-23 09:57:33', '');
INSERT INTO `data_cusgrp` VALUES ('94', '12', '滷味廳', '2011-02-23 18:29:16', '');
INSERT INTO `data_cusgrp` VALUES ('96', '0221', '丁丁麻糬', '2011-02-25 17:32:11', '社區經理');
INSERT INTO `data_cusgrp` VALUES ('98', '0123', '公用廁所', '2011-09-27 13:21:07', '社區經理');
INSERT INTO `data_cusgrp` VALUES ('100', '1001', 'pos', '2011-11-09 10:27:47', '社區經理');

-- ----------------------------
-- Table structure for `data_customer`
-- ----------------------------
DROP TABLE IF EXISTS `data_customer`;
CREATE TABLE `data_customer` (
  `customer_id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `customer_no` varchar(16) COLLATE utf8_unicode_ci NOT NULL COMMENT '客戶編號',
  `customer_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '客戶名稱',
  `customer_sex` tinyint(1) NOT NULL DEFAULT '1' COMMENT '男:0  女:1',
  `customer_password` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客戶密碼',
  `customer_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_tel` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客戶電話',
  `customer_fax` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客戶傳真',
  `customer_mobile` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客戶手機',
  `customer_email` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客戶Mail',
  `customer_address` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客戶地址',
  `customer_birthday` date DEFAULT NULL COMMENT '客戶生日',
  `customer_level` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '客戶級別',
  `customer_class` tinyint(1) unsigned DEFAULT NULL COMMENT '客戶價別',
  `customer_point` int(4) NOT NULL DEFAULT '0' COMMENT '客戶點數',
  `customer_deposit` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '客戶儲值',
  `customer_group` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '群組',
  `customer_remark` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '註解',
  `udate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  `uby` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`customer_id`),
  KEY `idxdata_customer_no` (`customer_no`) USING BTREE,
  KEY `idxdata_customer_phone` (`customer_tel`,`customer_fax`,`customer_mobile`) USING BTREE,
  FULLTEXT KEY `idxdata_customer_name` (`customer_name`)
) ENGINE=MyISAM AUTO_INCREMENT=182 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='客戶資料';

-- ----------------------------
-- Records of data_customer
-- ----------------------------
INSERT INTO `data_customer` VALUES ('115', '099', '張美琪', '0', '*****', '11', '(02)11', '1', '0911-111115', '', '1', '1922-12-11', '1', '1', '1', '1.00', '98,96,12,100,94,', '炒麵一盤', '2011-12-30 16:59:39', '阿拉丁');
INSERT INTO `data_customer` VALUES ('154', '003', '謝怡安', '0', '***', '204.1.1.1', '0421111111', '0428825252', '0919222222', '', 'huhuhuhu', '1931-11-11', '200', '0', '10', '72.00', '', '超級奧客', '2012-01-02 11:31:50', '');
INSERT INTO `data_customer` VALUES ('157', '0091', '張曼玉', '0', '****', '', '', '', '0322-111111', '', '', '0000-00-00', '0', '0', '0', '0.00', '', '', '2011-11-10 13:58:52', '');
INSERT INTO `data_customer` VALUES ('158', '001', '王大朝', '0', '***', '', '0422235808', '', '0931608568', '', '', '1985-05-11', '0', '0', '200', '2432.00', '', '', '2012-01-02 17:22:29', '');
INSERT INTO `data_customer` VALUES ('160', '004', '龍劭華', '0', '***', '', '', '', '0921-336440', '', '', '1986-05-09', '0', '0', '0', '200.00', '84', '', '2011-11-25 15:02:08', '');
INSERT INTO `data_customer` VALUES ('161', '005', '林志玲', '0', '123', '', '', '', '', '', '', '1990-05-08', '0', '0', '0', '2100.00', '', '', '2011-11-11 09:15:51', '');
INSERT INTO `data_customer` VALUES ('162', '006', '王丹伶', '0', '', '', '', '', '', '', '', '1995-05-07', '0', '0', '0', '0.00', '', '', '2011-12-20 16:24:34', '');
INSERT INTO `data_customer` VALUES ('163', '009', '林青霞', '0', '***125', '222', '206562', '5526', '223', '', '2323', '1981-11-21', '1', '0', '0', '-29195.00', '', '', '2012-01-02 11:41:31', '');
INSERT INTO `data_customer` VALUES ('164', '010', '高天賜', '1', '', '', '', '', '', '', '', '1922-02-02', '0', '0', '0', '0.00', '91', '', '2011-05-12 18:04:02', '');
INSERT INTO `data_customer` VALUES ('166', '002', '李艾玉', '0', '****', '123', '123', '123', '0123-123456', '', '1212', '1985-05-10', '123', '123', '123', '1000.00', '84,12', '123', '2011-11-11 10:02:36', '');
INSERT INTO `data_customer` VALUES ('167', '0223', '謝訕', '0', '****', '', '', '', '', '', '', '1989-03-02', '0', '0', '0', '-2620.00', '', '', '2011-12-30 12:34:29', '');
INSERT INTO `data_customer` VALUES ('168', '0224', '張學友', '1', '****', '', '', '', '', '', '', '1987-01-15', '0', '0', '0', '0.00', '', '', '2011-11-25 15:03:16', '');
INSERT INTO `data_customer` VALUES ('169', '0025', '陳美鳳', '0', '******************************', '123', '123', '123', '4566-666666', '', '456', '2011-05-10', '255', '255', '456', '-1140.00', '93', '456', '2011-12-30 10:08:32', '');
INSERT INTO `data_customer` VALUES ('170', '007', '李盈君', '0', '****', '', '', '', '', '', '', '1987-05-06', '0', '0', '0', '0.00', '91', '', '2011-11-10 13:58:55', '');
INSERT INTO `data_customer` VALUES ('171', '0028', '李小龍', '1', '0028', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '500.00', '', '', '2011-05-24 17:43:56', '');
INSERT INTO `data_customer` VALUES ('172', '033', '窮瑤', '0', '*', '3', '3333', '3', '', '', '3', '0000-00-00', '3', '3', '3', '190.00', '91,92', '', '2011-12-30 10:04:52', '社區經理');
INSERT INTO `data_customer` VALUES ('173', '91', '周星馳', '1', '', '', '', '', '0963-211572', '', '', '1963-02-21', '0', '0', '0', '0.00', '', '', '2011-05-12 17:28:37', '社區經理');
INSERT INTO `data_customer` VALUES ('174', '6666', '王大銘', '0', '****', '', '0911120123', '123123123123', '0963-211572', '', '', '0000-00-00', '0', '0', '0', '9000.00', '', '測試', '2012-01-02 11:51:35', '社區經理');
INSERT INTO `data_customer` VALUES ('175', '0857', 'ASDA', '1', '****', '10', '0915251151', '0001', '0193424525', ' ', ' ', '1985-11-21', '0', '0', '0', '0.00', '1', 'test', '2011-12-26 11:31:12', 'ZDN');
INSERT INTO `data_customer` VALUES ('178', '7878', '王哩紅', '1', '****', '196.22.55.11', '0933-513292', '04-22515058', '0921-336440', 'jjcc@qq', 'taichung', '1987-10-16', '6', '0', '0', '0.00', '', '', '2011-11-10 14:47:52', '社區經理');
INSERT INTO `data_customer` VALUES ('179', '8591', '林老師', '0', '********', '192.88.88.8', '09444545454', '', '09151115151', 'jack80346@yahoo.com.tw', '', '1987-10-15', '0', '33', '100', '560.00', '', '', '2011-12-30 10:03:06', '社區經理');
INSERT INTO `data_customer` VALUES ('180', '10009', '', '-1', '', '', '', '', '', '', '', '0000-00-00', '255', '0', '0', '0.00', '', '', '2011-11-11 11:19:38', '社區經理');

-- ----------------------------
-- Table structure for `data_device`
-- ----------------------------
DROP TABLE IF EXISTS `data_device`;
CREATE TABLE `data_device` (
  `device_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(20) unsigned NOT NULL,
  `station_id` int(20) unsigned NOT NULL,
  `device_label` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_location` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ip位置',
  `device_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'ip/comport',
  `print_template` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag_PrintOnReceived` tinyint(1) unsigned DEFAULT '0' COMMENT '收單印',
  `flag_PrintOnCheckOut` tinyint(1) unsigned DEFAULT '0' COMMENT '結帳印',
  `flag_PrintOnPrinted` tinyint(1) unsigned DEFAULT '0' COMMENT '印已經印過的',
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`device_id`),
  KEY `store_id` (`store_id`),
  KEY `station_id` (`station_id`),
  CONSTRAINT `station_id` FOREIGN KEY (`station_id`) REFERENCES `data_station` (`station_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `store_id` FOREIGN KEY (`store_id`) REFERENCES `data_store` (`store_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of data_device
-- ----------------------------
INSERT INTO `data_device` VALUES ('1', '1', '12', '1', 'COM3', '127.0.0.1', 'invoicing', 'receipt', '0', '0', '0', '0');
INSERT INTO `data_device` VALUES ('2', '1', '12', '2', 'COM4', '127.0.0.1', 'printer', 'listprowill', '0', '0', '0', '0');
INSERT INTO `data_device` VALUES ('3', '1', '13', null, 'COM5', '127.0.0.1', 'printer', 'prowill', '0', '0', '0', '1');
INSERT INTO `data_device` VALUES ('4', '1', '13', null, 'COM4', '127.0.0.1', 'invoicing', 'receipt', '0', '0', '0', '1');
INSERT INTO `data_device` VALUES ('5', '1', '12', '3', 'COM5', '192.168.2.9', 'printer', 'prowill', '0', '0', '0', '0');
INSERT INTO `data_device` VALUES ('6', '1', '12', null, 'COM4', '192.168.2.9', 'invoicing', 'receipt', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `data_employee`
-- ----------------------------
DROP TABLE IF EXISTS `data_employee`;
CREATE TABLE `data_employee` (
  `employee_id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `employee_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '員工編號',
  `employee_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '員工姓名',
  `employee_sex` tinyint(1) NOT NULL DEFAULT '1',
  `employee_cardnum` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '員工帳號',
  `employee_pass` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '員工密碼',
  `employee_tel` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '員工電話',
  `employee_fax` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '員工傳真',
  `employee_birthday` date NOT NULL COMMENT '員工生日',
  `employee_level` int(3) unsigned NOT NULL DEFAULT '1',
  `employee_mobile` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '員工手機',
  `employee_email` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '員工Mail',
  `createdate` datetime DEFAULT NULL,
  `udate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改時間',
  `uby` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='管理員資料';

-- ----------------------------
-- Records of data_employee
-- ----------------------------
INSERT INTO `data_employee` VALUES ('4', '888', '系統管理員', '1', '888', '07a046c046d6fd64c569ea48206e8bec', '', '', '0000-00-00', '0', '', '', null, '0000-00-00 00:00:00', '');
INSERT INTO `data_employee` VALUES ('6', '1112', '林俊傑', '1', '', '07a046c046d6fd64c569ea48206e8bec', '', '', '0000-00-00', '1', '', '', null, '0000-00-00 00:00:00', '');
INSERT INTO `data_employee` VALUES ('11', '333', '周杰倫', '1', '', 'd41d8cd98f00b204e9800998ecf8427e', 'dd', 'dd', '0000-00-00', '1', 'dd', 'dd', null, '0000-00-00 00:00:00', '');
INSERT INTO `data_employee` VALUES ('28', '020', '王永在', '1', '123', '07a046c046d6fd64c569ea48206e8bec', '', '999', '0000-00-00', '1', '999', '妳好', null, '0000-00-00 00:00:00', '');
INSERT INTO `data_employee` VALUES ('30', '055', '范逸臣', '1', '    055', '07a046c046d6fd64c569ea48206e8bec', '55', '(02)-55566', '1922-05-05', '1', '55', '55', null, '0000-00-00 00:00:00', '');
INSERT INTO `data_employee` VALUES ('35', '021', '王丹玲', '1', '533', '07a046c046d6fd64c569ea48206e8bec', '', '', '0000-00-00', '1', '', '', null, '0000-00-00 00:00:00', '');
INSERT INTO `data_employee` VALUES ('37', '021', '李怡君', '0', '', '07a046c046d6fd64c569ea48206e8bec', '', '', '0000-00-00', '1', '0911-11112', '', null, '0000-00-00 00:00:00', '');
INSERT INTO `data_employee` VALUES ('41', '012', '陳奕瑞', '1', '33', '07a046c046d6fd64c569ea48206e8bec', '', '', '0000-00-00', '1', '', '33', null, '0000-00-00 00:00:00', '');
INSERT INTO `data_employee` VALUES ('42', '009', '張紹涵', '1', '1123', '07a046c046d6fd64c569ea48206e8bec', '1123', '', '2004-02-18', '1', '0911-11111', '123546', null, '0000-00-00 00:00:00', '');
INSERT INTO `data_employee` VALUES ('43', '121', '黃建豪', '0', '121', '310dcbbf4cce62f762a2aaa148d556bd', '121', '', '2011-02-08', '1', '1211-11111', '121', null, '0000-00-00 00:00:00', '');
INSERT INTO `data_employee` VALUES ('44', '514', '全佩真', '0', '514', '07a046c046d6fd64c569ea48206e8bec', '514', '514', '2011-02-14', '1', '0911-11111', '514', null, '0000-00-00 00:00:00', '');
INSERT INTO `data_employee` VALUES ('45', '1599', '田壘', '1', '1599', '07a046c046d6fd64c569ea48206e8bec', '1599', '1599', '2011-02-16', '1', '1599-99999', '999999', null, '0000-00-00 00:00:00', '');
INSERT INTO `data_employee` VALUES ('46', '9923', '王建豪', '1', '9923', '07a046c046d6fd64c569ea48206e8bec', '9923', '9923', '2011-02-22', '1', '9999-99999', '9', null, '2011-02-25 17:45:28', '社區經理');
INSERT INTO `data_employee` VALUES ('47', 'su', '林怡芯', '0', '999', '07a046c046d6fd64c569ea48206e8bec', '8888888888', '04-2201505', '2001-03-07', '0', '8888-88888', '', null, '2011-03-09 15:46:03', '社區經理');
INSERT INTO `data_employee` VALUES ('48', 'jack', '黃阿傑', '1', '666', '313b56039c1504494ec5de2420c10ec3', '0933-51329', '', '1987-10-16', '1', '0933-51329', 'jack@zdn.com.tw', null, '2011-09-27 13:35:49', '社區經理');
INSERT INTO `data_employee` VALUES ('49', '789', '隋糖', '0', '787877', 'cd3d95b5e8f83320f010930265f8d5ca', '(04)-23565', '(05)-66666', '1995-04-07', '1', '0956-33565', '', null, '2011-12-30 10:35:51', '社區經理');
INSERT INTO `data_employee` VALUES ('50', '999', '林林林', '1', '999', '202cb962ac59075b964b07152d234b70', '', '', '0000-00-00', '1', '', '', null, '2011-12-30 12:01:20', '社區經理');
INSERT INTO `data_employee` VALUES ('51', '566', '消經疼', '0', '888888', 'db85e2590b6109813dafa101ceb2faeb', '(08)-88888', '(06)-66666', '1981-03-12', '1', '0956-56656', '', null, '2011-12-30 14:33:41', '周杰倫');
INSERT INTO `data_employee` VALUES ('60', '958', '三井瘦', '1', '44444', '550a141f12de6341fba65b0ad0433500', '(04)-88888', '(04)-88888', '1995-01-06', '1', '0965-55555', '', null, '2012-01-02 14:38:25', '社區經理');
INSERT INTO `data_employee` VALUES ('61', '998', 'AAA', '1', '988', 'e10adc3949ba59abbe56e057f20f883e', '', '', '0000-00-00', '1', '', '', null, '2012-01-04 11:20:10', '社區經理');
INSERT INTO `data_employee` VALUES ('62', '123', 'bbb', '1', '', '202cb962ac59075b964b07152d234b70', '', '', '0000-00-00', '1', '', '', null, '2012-01-10 16:06:32', '系統管理員');
INSERT INTO `data_employee` VALUES ('63', '555', '111', '1', '', '15de21c670ae7c3f6f3f1f37029303c9', '', '', '0000-00-00', '1', '', '', null, '2012-01-10 16:25:07', '系統管理員');

-- ----------------------------
-- Table structure for `data_facility`
-- ----------------------------
DROP TABLE IF EXISTS `data_facility`;
CREATE TABLE `data_facility` (
  `facility_id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `facility_no` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `facility_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '設施名稱',
  `facility_start` varchar(4) COLLATE utf8_unicode_ci NOT NULL COMMENT '開放時間',
  `facility_end` varchar(4) COLLATE utf8_unicode_ci NOT NULL COMMENT '結束時間',
  `facility_rule` text COLLATE utf8_unicode_ci NOT NULL COMMENT '預約規則',
  `facility_open` tinyint(2) unsigned NOT NULL COMMENT '開放次數',
  `facility_image` varchar(80) COLLATE utf8_unicode_ci NOT NULL COMMENT '圖片',
  `facility_thumb` varchar(80) COLLATE utf8_unicode_ci NOT NULL COMMENT '縮圖',
  `facility_group` int(10) unsigned NOT NULL COMMENT '群組',
  `facility_food` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:可點餐 0:不可點餐',
  `facility_foodgrp` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '點餐設施名稱',
  `udate` datetime NOT NULL COMMENT '修改時間',
  `uby` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`facility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='設施資料';

-- ----------------------------
-- Records of data_facility
-- ----------------------------
INSERT INTO `data_facility` VALUES ('1', '', 'VIP撞球休閒中心', '0700', '2130', '<p>\r\n	<span class=\"Apple-style-span\" style=\"font-size: 14px; font-weight: bold; \">VIP休閒中心之撞球區使用規定</span></p>\r\n<p>\r\n	一、開放時間：</p>\r\n<p>\r\n	<span style=\"color:#f00;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;1.</strong><strong>週一至週日&nbsp; AM07:00 ～ PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 2.委員會排定之社區活動時間內，本設施暫停開放。</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>二、付費方式</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 1.使用者須向櫃檯服務人員登記預約，本設施以完成預約登記者，優先使用。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 2.預約人須於二天前向櫃檯服務人員登記預約，取消預約時亦須告知服務人員。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; 3.使用付費方式：使用前向服務人員登記並以儲值卡扣抵消費收費，每小時收費100元 ，</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;不滿1小時，以1小時計，預約者每次使用不可超過三小時，如須續用，須洽櫃檯服務人員辦理</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;(服務人員須視後段時間無人使用預約情況下，始得辦理續用)。</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	三、使用規定</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 1.使用對象：鄉林皇居全體住戶。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 2.櫃檯備有球具，會員如有需要得於使用前向櫃檯領取，使用完畢後應將設備歸還櫃檯&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 3.使用期間請隨時保持環境整齊清潔，以利維護。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 4.損壞任何設施或器材、桌椅者，應照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 5.除瓶裝飲用水外，禁止攜帶飲料或食物入內。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 6.室內禁止吸煙、嬉戲、奔跑、大聲喧嘩。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 7.室內不可舉行任何具危險性或不適當之活動。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 8.非會員或其所帶之親友，及未經批准人員，服務人員得令其離開，不聽從勸告者，將依私自侵入報請警政機關處理。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 9.本使用規定若有未盡事宜，得經由管理委員會會議決議修訂並公告實施。</p>\r\n', '3', '.jpg', 's-e1-1.jpg', '12', '1', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('2', '', 'VIP休閒中心KTV', '0700', '2130', '<p>\r\n	<span style=\"font-size:12px;\"><span class=\"Apple-style-span\" style=\"font-weight: bold; \">VIP休閒中心之KTV視聽室使用規定</span></span></p>\r\n<p>\r\n	一、開放時間：</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;1.</strong><strong>週一至週日&nbsp; AM07:00 ～ PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.委員會排定之社區活動時間內，本設施暫停開放。</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	二、包場使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 1.使用者須向櫃檯服務人員登記預約包場，本設施以完成預約登記者，優先使用。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 2.預約人須於二天前向櫃檯服務人員登記預約，取消預約時亦須告知服務人員。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; 3.</strong><strong>包場使用付費方式：使用前向服務人員登記並以儲值卡扣抵消費收費，每小時收費500元，</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;預約者每次使用不可超過三小時，如須續用，須洽櫃檯服務人員辦理(服務人員須視後段時間無人使用</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 預約情況下，始得辦理續用)。</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>\r\n<p>\r\n	三、使用規定：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.使用對象：鄉林皇居全體住戶。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.委員會名義主辦之社區活動及召開之會議不適用包場付費限制。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;3.請愛惜公物並維護室內清潔，損壞公物照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;4.除瓶裝飲用水外，禁止攜帶飲料或食物入內。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;5.使用中如有移動公物，請於離去時歸回原位。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;6.室內禁止吸煙、嬉戲、奔跑、大聲喧嘩。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;7.室內不可舉行任何具危險性或不適當之活動。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;8.請遵守使用規定及服務人員之操作說明與指導。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;9.本使用規定若有未盡事宜，得經由管理委員會會議決議修訂並公告實施。</p>\r\n', '2', '.jpg', '', '12', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('3', '', 'VIP撞球休閒中心+KTV', '0700', '2130', '<p>\r\n	<span style=\"font-size:12px;\"><span class=\"Apple-style-span\" style=\"font-weight: bold; \">VIP休閒中心之（撞球區＋KTV視聽室）包場使用規定</span></span></p>\r\n<p>\r\n	一、開放時間：</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; 1.</strong><strong>週一至週日&nbsp; AM07:00 ～ PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 2.委員會排定之社區活動時間內，本設施暫停開放。</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	二、包場使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.使用者須向櫃檯服務人員登記預約包場，本設施以完成預約登記者，優先使用。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.預約人須於二天前向櫃檯服務人員登記預約，取消預約時亦須告知服務人員。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;3.</strong><strong>包場使用付費方式：使用前向服務人員登記並以儲值卡扣抵消費收費，場地費2&cedil;000元每場次以3小時為限，</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;每小時收費700 元，</strong>&nbsp;<strong>不滿1小時，以1小時計。預約者每次使用不可超過三小時，如須續用，須洽櫃檯服務人員辦理(服務人員</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 須視後段時間無人使用</strong><strong>預 &nbsp; &nbsp;約情況下，始得辦理續用)。</strong></span></p>\r\n<p style=\"margin-left:45.0pt;\">\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<p>\r\n	三、使用規定：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.使用對象：鄉林皇居全體住戶。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.委員會名義主辦之社區活動及召開之會議不適用包場付費限制。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;3.請愛惜公物並維護室內清潔，損壞公物照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;4.除瓶裝飲用水外，禁止攜帶飲料或食物入內。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;5.使用中如有移動公物，請於離去時歸回原位。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;6.室內禁止吸煙、嬉戲、奔跑、大聲喧嘩。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;7.室內不可舉行任何具危險性或不適當之活動。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;8.請遵守使用規定及服務人員之操作說明與指導。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;9.本使用規定若有未盡事宜，得經由管理委員會會議決議修訂並公告實施。</p>\r\n', '3', '.jpg', '', '12', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('4', '', '皇品宴會廳(A廳-早餐)', '0700', '0900', '<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<b><strong>皇品宴會廳使用規定</strong></b></p>\r\n<p align=\"center\">\r\n	&nbsp;</p>\r\n<p>\r\n	一、開放時間：</p>\r\n<p>\r\n	<b><span style=\"color: rgb(255, 0, 0); \"><strong>&nbsp;&nbsp; &nbsp; 1.</strong><strong>週一至週日&nbsp; AM07:00 ～ AM9:00&nbsp; AM11:30 ～ PM2:00&nbsp;&nbsp; PM5:30&nbsp;</strong><strong>～&nbsp;</strong><strong>PM21:00</strong></span></b></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 2.委員會排定之社區活動時間內，本設施暫停開放。</p>\r\n<p>\r\n	二、使用付費方式：</p>\r\n<p>\r\n	<b><span style=\"color: rgb(255, 0, 0); \"><strong>非包場使用時&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></span></b></p>\r\n<p>\r\n	<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>&nbsp; 1.本設施為開放式設施，凡具住戶資格者皆可<b><strong><span style=\"color: rgb(255, 0, 0); \">依餐飲價目表自行消費</span>。</strong></b></p>\r\n<p>\r\n	<b>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;</b>2.採儲值卡扣抵消費。</p>\r\n<p>\r\n	<b><span style=\"color: rgb(255, 0, 0); \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>包場使用時</strong></span></b></p>\r\n<p>\r\n	<b><span style=\"color: rgb(255, 0, 0); \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<strong>1.</strong><strong>會議用：</strong></span></b></p>\r\n<p>\r\n	<b><span style=\"color: rgb(255, 0, 0); \"><strong>（A廳-早餐）</strong></span></b></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<b><span style=\"color: rgb(255, 0, 0); \"><strong>採預約制，每場次以3小時為限，酌收場地費3&cedil;000元；逾時以1&cedil;000元/小時收費，</strong></span></b></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<b><span style=\"color: rgb(255, 0, 0); \"><strong>不足1小時，以1小時計之。</strong></span></b></p>\r\n<p>\r\n	<strong>（B廳）</strong></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<strong>採預約制，每場次以3小時為限，酌收場地費1&cedil;500元；逾時以500元/小時收費，</strong></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<strong>不足1小時，以1小時計之。</strong></p>\r\n<p>\r\n	<strong>（C廳）</strong></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<strong>採預約制，每場次以3小時為限，酌收場地費1&cedil;500元；逾時以500元/小時收費，</strong></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<strong>不足1小時，以1小時計之。</strong></p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.宴會用：</p>\r\n<p>\r\n	<b><span style=\"color: rgb(255, 0, 0); \"><strong>（A廳-早餐）</strong></span></b></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<b><span style=\"color: rgb(255, 0, 0); \"><strong>採預約制，每場次以3小時為限，酌收場地費3&cedil;000元；逾時以1&cedil;000元/小時收費，</strong></span></b></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<b><span style=\"color: rgb(255, 0, 0); \"><strong>不足1小時，以1小時計之。 (外燴使用廚房加收清潔費1&cedil;500元)</strong></span></b></p>\r\n<p>\r\n	<strong>（B廳）</strong></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<strong>採預約制，每場次以3小時為限，酌收場地費1&cedil;500元；逾時以500元/小時收費，</strong></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<strong>不足1小時，以1小時計之。(外燴使用廚房加收清潔費1&cedil;500元)</strong></p>\r\n<p>\r\n	<strong>（C廳）</strong></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<strong>採預約制，每場次以3小時為限，酌收場地費1&cedil;500元；逾時以500元/小時收費，</strong></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<strong>不足1小時，以1小時計之。(外燴使用廚房加收清潔費1&cedil;500元)</strong></p>\r\n<p>\r\n	<strong><span style=\"color: rgb(255, 0, 0); \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.預訂桌(人)數須於宴會舉行前三日(72小時)確認，宴會開始至結束如未達預訂桌(人)</span></strong></p>\r\n<p>\r\n	<strong><span style=\"color: rgb(255, 0, 0); \">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;數時，仍按原預訂桌(人)數之費用收費。</span></strong></p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.宴會帳款請於宴會結束後，金額採以現金儲值卡扣抵消費。</p>\r\n<p>\r\n	&nbsp;&nbsp; 三、服務注意事項</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.對各項設施、設備及裝潢等，請注意維護及使用，如有損壞情形，請告知管理服務中心處理。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.使用期間請隨時保持環境整齊清潔，以利清潔維護工作。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;3.凡違反規定者，得勒令離開，並視情節輕重，報請管委會處理，停止其使用權一至四週。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;4.損壞任何設施或器材、桌椅者，應照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;5.非會員或其所帶之親友，及未經批准人員，服務人員得令其離開，不聽從勸告者，</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 將依私自侵入報請警政機關處理。</p>\r\n', '2', '33.jpg', '', '12', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('5', '', '皇品宴會廳(A廳)', '0700', '2130', '<p>\r\n	<span class=\"Apple-style-span\"><strong>皇品宴會廳使用規定</strong></span></p>\r\n<p align=\"center\">\r\n	&nbsp;</p>\r\n<p>\r\n	一、開放時間：</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; 1.</strong><strong>週一至週日&nbsp; AM07:00 ～ AM9:00&nbsp; AM11:30 ～ PM2:00&nbsp;&nbsp; PM5:30 </strong><strong>～ </strong><strong>PM21:00</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 2.委員會排定之社區活動時間內，本設施暫停開放。</p>\r\n<p>\r\n	二、使用付費方式：</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>非包場使用時&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.本設施為開放式設施，凡具住戶資格者皆可<strong><span style=\"color:#f00;\">依餐飲價目表自行消費</span>。</strong></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;2.採儲值卡扣抵消費。</p>\r\n<p>\r\n	<span style=\"color:#f00;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>包場使用時</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<strong>1.</strong><strong>會議用：</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>（A廳）</strong></span></p>\r\n<p style=\"margin-left:48.0pt;\">\r\n	<span style=\"color:#f00;\"><strong>採預約制，每場次以3小時為限，酌收場地費3&cedil;000元；逾時以1&cedil;000元/小時收費，</strong></span></p>\r\n<p style=\"margin-left:48.0pt;\">\r\n	<span style=\"color:#f00;\"><strong>不足1小時，以1小時計之。</strong></span></p>\r\n<p>\r\n	<strong>（B廳）</strong></p>\r\n<p style=\"margin-left:48.0pt;\">\r\n	<strong>採預約制，每場次以3小時為限，酌收場地費1&cedil;500元；逾時以500元/小時收費，</strong></p>\r\n<p style=\"margin-left:48.0pt;\">\r\n	<strong>不足1小時，以1小時計之。</strong></p>\r\n<p>\r\n	<strong>（C廳）</strong></p>\r\n<p style=\"margin-left:48.0pt;\">\r\n	<strong>採預約制，每場次以3小時為限，酌收場地費1&cedil;500元；逾時以500元/小時收費，</strong></p>\r\n<p style=\"margin-left:48.0pt;\">\r\n	<strong>不足1小時，以1小時計之。</strong></p>\r\n<p>\r\n	<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.</strong><strong>宴會用：</strong></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>（A廳）</strong></span></p>\r\n<p style=\"margin-left:48.0pt;\">\r\n	<span style=\"color:#f00;\"><strong>採預約制，每場次以3小時為限，酌收場地費3&cedil;000元；逾時以1&cedil;000元/小時收費，</strong></span></p>\r\n<p style=\"margin-left:48.0pt;\">\r\n	<span style=\"color:#f00;\"><strong>不足1小時，以1小時計之。 (外燴使用廚房加收清潔費1&cedil;500元)</strong></span></p>\r\n<p>\r\n	<strong>（B廳）</strong></p>\r\n<p style=\"margin-left:48.0pt;\">\r\n	<strong>採預約制，每場次以3小時為限，酌收場地費1&cedil;500元；逾時以500元/小時收費，</strong></p>\r\n<p style=\"margin-left:48.0pt;\">\r\n	<strong>不足1小時，以1小時計之。(外燴使用廚房加收清潔費1&cedil;500元)</strong></p>\r\n<p>\r\n	<strong>（C廳）</strong></p>\r\n<p style=\"margin-left:48.0pt;\">\r\n	<strong>採預約制，每場次以3小時為限，酌收場地費1&cedil;500元；逾時以500元/小時收費，</strong></p>\r\n<p style=\"margin-left:48.0pt;\">\r\n	<strong>不足1小時，以1小時計之。(外燴使用廚房加收清潔費1&cedil;500元)</strong></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.</strong><strong>預訂桌(人)數須於宴會舉行前三日(72小時)確認，宴會開始至結束如未達預訂桌(人)</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>數時，仍按原預訂桌(人)數之費用收費。</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.宴會帳款請於宴會結束後，金額採以現金儲值卡扣抵消費。</p>\r\n<p>\r\n	&nbsp;&nbsp; 三、服務注意事項</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.對各項設施、設備及裝潢等，請注意維護及使用，如有損壞情形，請告知管理服務中心處理。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.使用期間請隨時保持環境整齊清潔，以利清潔維護工作。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;3.凡違反規定者，得勒令離開，並視情節輕重，報請管委會處理，停止其使用權一至四週。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;4.損壞任何設施或器材、桌椅者，應照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;5.非會員或其所帶之親友，及未經批准人員，服務人員得令其離開，不聽從勸告者，將依私自侵入報請警政機關處理。</p>\r\n', '3', '11.jpg', '', '12', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('6', '', '皇品宴會廳(B廳)', '0730', '2130', '<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<b><strong>皇品宴會廳使用規定</strong></b></p>\r\n<p align=\"center\">\r\n	&nbsp;</p>\r\n<p>\r\n	一、開放時間：</p>\r\n<p>\r\n	<b><span style=\"color: rgb(255, 0, 0); \"><strong>&nbsp;&nbsp; &nbsp; 1.</strong><strong>週一至週日&nbsp; AM07:00 ～ AM9:00&nbsp; AM11:30 ～ PM2:00&nbsp;&nbsp; PM5:30&nbsp;</strong><strong>～&nbsp;</strong><strong>PM21:00</strong></span></b></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 2.委員會排定之社區活動時間內，本設施暫停開放。</p>\r\n<p>\r\n	二、使用付費方式：</p>\r\n<p>\r\n	<b><span style=\"color: rgb(255, 0, 0); \"><strong>非包場使用時&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></span></b></p>\r\n<p>\r\n	<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>&nbsp; 1.本設施為開放式設施，凡具住戶資格者皆可<b><strong><span style=\"color: rgb(255, 0, 0); \">依餐飲價目表自行消費</span>。</strong></b></p>\r\n<p>\r\n	<b>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;</b>2.採儲值卡扣抵消費。</p>\r\n<p>\r\n	<b><span style=\"color: rgb(255, 0, 0); \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>包場使用時</strong></span></b></p>\r\n<p>\r\n	<b><span style=\"color: rgb(255, 0, 0); \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<strong>1.</strong><strong>會議用：</strong></span></b></p>\r\n<p>\r\n	<b><strong>（A廳）</strong></b></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<b><strong>採預約制，每場次以3小時為限，酌收場地費3&cedil;000元；逾時以1&cedil;000元/小時收費，</strong></b></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<b><strong>不足1小時，以1小時計之。</strong></b></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>（B廳）</strong></span></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<span style=\"color:#f00;\"><strong>採預約制，每場次以3小時為限，酌收場地費1&cedil;500元；逾時以500元/小時收費，</strong></span></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<span style=\"color:#f00;\"><strong>不足1小時，以1小時計之。</strong></span></p>\r\n<p>\r\n	<strong>（C廳）</strong></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<strong>採預約制，每場次以3小時為限，酌收場地費1&cedil;500元；逾時以500元/小時收費，</strong></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<strong>不足1小時，以1小時計之。</strong></p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.宴會用：</p>\r\n<p>\r\n	<b><strong>（A廳）</strong></b></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<b><strong>採預約制，每場次以3小時為限，酌收場地費3&cedil;000元；逾時以1&cedil;000元/小時收費，</strong></b></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<b><strong>不足1小時，以1小時計之。 (外燴使用廚房加收清潔費1&cedil;500元)</strong></b></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>（B廳）</strong></span></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<span style=\"color:#f00;\"><strong>採預約制，每場次以3小時為限，酌收場地費1&cedil;500元；逾時以500元/小時收費，</strong></span></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<span style=\"color:#f00;\"><strong>不足1小時，以1小時計之。(外燴使用廚房加收清潔費1&cedil;500元)</strong></span></p>\r\n<p>\r\n	<strong>（C廳）</strong></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<strong>採預約制，每場次以3小時為限，酌收場地費1&cedil;500元；逾時以500元/小時收費，</strong></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<strong>不足1小時，以1小時計之。(外燴使用廚房加收清潔費1&cedil;500元)</strong></p>\r\n<p>\r\n	<strong><span style=\"color: rgb(255, 0, 0); \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.預訂桌(人)數須於宴會舉行前三日(72小時)確認，宴會開始至結束如未達預訂桌(人)</span></strong></p>\r\n<p>\r\n	<strong><span style=\"color: rgb(255, 0, 0); \">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;數時，仍按原預訂桌(人)數之費用收費。</span></strong></p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.宴會帳款請於宴會結束後，金額採以現金儲值卡扣抵消費。</p>\r\n<p>\r\n	&nbsp;&nbsp; 三、服務注意事項</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.對各項設施、設備及裝潢等，請注意維護及使用，如有損壞情形，請告知管理服務中心處理。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.使用期間請隨時保持環境整齊清潔，以利清潔維護工作。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;3.凡違反規定者，得勒令離開，並視情節輕重，報請管委會處理，停止其使用權一至四週。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;4.損壞任何設施或器材、桌椅者，應照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;5.非會員或其所帶之親友，及未經批准人員，服務人員得令其離開，不聽從勸告者，</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 將依私自侵入報請警政機關處理。</p>\r\n', '3', '43.jpg', '', '12', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('7', '', '皇品宴會廳(C廳)', '0730', '2130', '<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<b><strong>皇品宴會廳使用規定</strong></b></p>\r\n<p align=\"center\">\r\n	&nbsp;</p>\r\n<p>\r\n	一、開放時間：</p>\r\n<p>\r\n	<b><span style=\"color: rgb(255, 0, 0); \"><strong>&nbsp;&nbsp; &nbsp; 1.</strong><strong>週一至週日&nbsp; AM07:00 ～ AM9:00&nbsp; AM11:30 ～ PM2:00&nbsp;&nbsp; PM5:30&nbsp;</strong><strong>～&nbsp;</strong><strong>PM21:00</strong></span></b></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 2.委員會排定之社區活動時間內，本設施暫停開放。</p>\r\n<p>\r\n	二、使用付費方式：</p>\r\n<p>\r\n	<b><span style=\"color: rgb(255, 0, 0); \"><strong>非包場使用時&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></span></b></p>\r\n<p>\r\n	<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>&nbsp; 1.本設施為開放式設施，凡具住戶資格者皆可<b><strong><span style=\"color: rgb(255, 0, 0); \">依餐飲價目表自行消費</span>。</strong></b></p>\r\n<p>\r\n	<b>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;</b>2.採儲值卡扣抵消費。</p>\r\n<p>\r\n	<b><span style=\"color: rgb(255, 0, 0); \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>包場使用時</strong></span></b></p>\r\n<p>\r\n	<b><span style=\"color: rgb(255, 0, 0); \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<strong>1.</strong><strong>會議用：</strong></span></b></p>\r\n<p>\r\n	<b><strong>（A廳）</strong></b></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<b><strong>採預約制，每場次以3小時為限，酌收場地費3&cedil;000元；逾時以1&cedil;000元/小時收費，</strong></b></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<b><strong>不足1小時，以1小時計之。</strong></b></p>\r\n<p>\r\n	<strong>（B廳）</strong></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<strong>採預約制，每場次以3小時為限，酌收場地費1&cedil;500元；逾時以500元/小時收費，</strong></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<strong>不足1小時，以1小時計之。</strong></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>（C廳）</strong></span></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<span style=\"color:#f00;\"><strong>採預約制，每場次以3小時為限，酌收場地費1&cedil;500元；逾時以500元/小時收費，</strong></span></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<span style=\"color:#f00;\"><strong>不足1小時，以1小時計之。</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.宴會用：</p>\r\n<p>\r\n	<b><strong>（A廳）</strong></b></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<b><strong>採預約制，每場次以3小時為限，酌收場地費3&cedil;000元；逾時以1&cedil;000元/小時收費，</strong></b></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<b><strong>不足1小時，以1小時計之。 (外燴使用廚房加收清潔費1&cedil;500元)</strong></b></p>\r\n<p>\r\n	<strong>（B廳）</strong></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<strong>採預約制，每場次以3小時為限，酌收場地費1&cedil;500元；逾時以500元/小時收費，</strong></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<strong>不足1小時，以1小時計之。(外燴使用廚房加收清潔費1&cedil;500元)</strong></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>（C廳）</strong></span></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<span style=\"color:#f00;\"><strong>採預約制，每場次以3小時為限，酌收場地費1&cedil;500元；逾時以500元/小時收費，</strong></span></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	<span style=\"color:#f00;\"><strong>不足1小時，以1小時計之。(外燴使用廚房加收清潔費1&cedil;500元)</strong></span></p>\r\n<p>\r\n	<strong><span style=\"color: rgb(255, 0, 0); \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.預訂桌(人)數須於宴會舉行前三日(72小時)確認，宴會開始至結束如未達預訂桌(人)</span></strong></p>\r\n<p>\r\n	<strong><span style=\"color: rgb(255, 0, 0); \">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;數時，仍按原預訂桌(人)數之費用收費。</span></strong></p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.宴會帳款請於宴會結束後，金額採以現金儲值卡扣抵消費。</p>\r\n<p>\r\n	&nbsp;&nbsp; 三、服務注意事項</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.對各項設施、設備及裝潢等，請注意維護及使用，如有損壞情形，請告知管理服務中心處理。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.使用期間請隨時保持環境整齊清潔，以利清潔維護工作。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;3.凡違反規定者，得勒令離開，並視情節輕重，報請管委會處理，停止其使用權一至四週。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;4.損壞任何設施或器材、桌椅者，應照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;5.非會員或其所帶之親友，及未經批准人員，服務人員得令其離開，不聽從勸告者，</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 將依私自侵入報請警政機關處理。</p>\r\n', '3', '12.jpg', '', '12', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('8', '', '皇極亭', '0700', '2130', '<p>\r\n	<span class=\"Apple-style-span\"><strong>皇極亭使用規定</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	一、開放時間：</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;1.</strong><strong>週一至週日&nbsp; AM07:00 ～PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.委員會排定之社區活動時間內，本設施暫停開放。</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	二、使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.本設施為開放式設施，凡具住戶資格者皆可<strong><span style=\"color:#f00;\">依餐飲價目表自行消費</span>。</strong></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.採儲值卡扣抵消費。&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</p>\r\n<p>\r\n	三、服務注意事項</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.每日AM 07:00 ～PM 21:30提供各式餐飲服務。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.每日AM 10:00 ～PM 21:30提供各場所專送服務。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;3.對各項設施、設備及裝潢等，請注意維護及使用，如有損壞情形，請告知管理服務中心處理。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;4.使用期間請隨時保持環境整齊清潔，以利清潔維護工作。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;5.凡違反規定者，得勒令離開，並視情節輕重，報請管委會處理，停止其使用權一至四週。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;6.損壞任何設施或器材、桌椅者，應照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;7.非會員或其所帶之親友，及未經批准人員，服務人員得令其離開，不聽從勸告者，將依私自侵入報請警政機關處理。</p>\r\n', '2', '4.jpg', '', '12', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('9', '', '輕翠 Lobby coffee bar', '0700', '2130', '<p>\n	<span class=\"Apple-style-span\"><strong>輕翠Lobby Coffee Bar使用規定</strong></span></p>\n<p>\n	<font class=\"Apple-style-span\">一、開放時間：</font></p>\n<p>\n	<font class=\"Apple-style-span\"><span style=\"color:#f00;\">       <strong>1.</strong><strong>週一至週日  AM07:00 ～PM21:30</strong></span></font></p>\n<p>\n	<font class=\"Apple-style-span\">       2.委員會排定之社區活動時間內，本設施暫停開放。</font></p>\n<p>\n	 </p>\n<p>\n	<font class=\"Apple-style-span\">二、使用付費方式：</font></p>\n<p>\n	<font class=\"Apple-style-span\">       1.本設施為開放式設施，凡具住戶資格者皆可<strong><span style=\"color:#f00;\">依餐飲價目表自行消費</span>。</strong></font></p>\n<p>\n	<font class=\"Apple-style-span\">       2.採儲值卡扣抵消費。           </font></p>\n<p>\n	<font class=\"Apple-style-span\">     </font></p>\n<p>\n	<font class=\"Apple-style-span\">三、服務注意事項</font></p>\n<p>\n	<font class=\"Apple-style-span\">       1.每日AM 07:00 ～AM 09:00提供早餐供餐服務。</font></p>\n<p>\n	<font class=\"Apple-style-span\">       2.每日AM 07:00 ～PM 21:30提供各式餐飲服務。</font></p>\n<p>\n	<font class=\"Apple-style-span\">       3.每日AM 10:00 ～PM 21:30提供各場所專送服務。</font></p>\n<p>\n	<font class=\"Apple-style-span\">       4.對各項設施、設備及裝潢等，請注意維護及使用，如有損壞情形，請告知管理服務中心處理。</font></p>\n<p>\n	<font class=\"Apple-style-span\">       5.使用期間請隨時保持環境整齊清潔，以利清潔維護工作。</font></p>\n<p>\n	<font class=\"Apple-style-span\">       6.凡違反規定者，得勒令離開，並視情節輕重，報請管委會處理，停止其使用權一至四週。</font></p>\n<p>\n	<font class=\"Apple-style-span\">       7.損壞任何設施或器材、桌椅者，應照價賠償。</font></p>\n<p>\n	       8.非會員或其所帶之親友，及未經批准人員，服務人員得令其離開，不聽從勸告者，將依私自侵入報請警政機關處理。</p>\n', '0', '21.jpg', '', '12', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('10', '', '溪唱 Lobby coffee bar', '0700', '2130', '<p>\r\n	<span class=\"Apple-style-span\"><strong>溪唱Lobby Coffee Bar使用規定</strong></span></p>\r\n<p align=\"center\">\r\n	&nbsp;</p>\r\n<p>\r\n	一、開放時間：</p>\r\n<p>\r\n	<span style=\"color:#f00;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>1.</strong><strong>週一至週日&nbsp; AM07:00 ～PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.委員會排定之社區活動時間內，本設施暫停開放。</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	二、使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.本設施為開放式設施，凡具住戶資格者皆可<strong><span style=\"color:#f00;\">依餐飲價目表自行消費</span>。</strong></p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.採儲值卡扣抵消費。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<p>\r\n	&nbsp;&nbsp; 三、服務注意事項</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;1.每日AM 07:00 ～AM 09:00提供早餐供餐服務。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;2.每日AM 07:00 ～PM 21:30提供各式餐飲服務。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.每日AM 10:00 ～PM 21:30提供各場所專送服務。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 4.對各項設施、設備及裝潢等，請注意維護及使用，如有損壞情形，請告知管理服務中心處理。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5.使用期間請隨時保持環境整齊清潔，以利清潔維護工作。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 6.凡違反規定者，得勒令離開，並視情節輕重，報請管委會處理，停止其使用權一至四週。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7.損壞任何設施或器材、桌椅者，應照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 8.非會員或其所帶之親友，及未經批准人員，服務人員得令其離開，不聽從勸告者，將依私自侵入報請警政機關處理。</p>\r\n', '2', '41.jpg', '', '12', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('11', '', '延春閣', '0700', '2130', '', '0', '41.jpg', '', '12', '1', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('12', '', '怡和軒', '0700', '2130', '', '0', '51.jpg', '', '12', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('13', '', '麗池游泳池', '0700', '2130', '<p>\r\n	<strong>麗池游泳池使用規定</strong></p>\r\n<p>\r\n	<span class=\"Apple-style-span\" style=\"color: rgb(255, 0, 0); \"><strong>一、開放時間：週二 ～ 週日AM07:00 ～ PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;週一休館進行例行清潔養護(遇假日順延)或依管理委員會決議之時段開放，於開放期間，</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 社區應聘請安全管理(救生員)及清潔維護之專業人員</p>\r\n<p>\r\n	二、使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 1.使用前向服務人員登記。</p>\r\n<p>\r\n	<span class=\"Apple-style-span\" style=\"color: rgb(255, 0, 0); \"><strong>&nbsp;&nbsp; &nbsp; &nbsp; 2.</strong><strong>住戶使用免費，非住戶每人每次收費100元，每人使用時限不得超過3小時</strong><strong>。</strong></span></p>\r\n<p>\r\n	<span class=\"Apple-style-span\" style=\"color: rgb(255, 0, 0); \"><strong>&nbsp;&nbsp; &nbsp; &nbsp; 3.</strong><strong>包場使用時，</strong><strong>採預約制，每場酌收場地費</strong><strong>3</strong><strong>&cedil;000元，使用時限不得超過3小時</strong><strong>。</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 4.採儲值卡扣抵消費。</p>\r\n<p>\r\n	三、使用規定：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 1.使用對象：鄉林皇居全體住戶。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;<strong style=\"color: rgb(255, 0, 0); \">2.</strong><strong style=\"color: rgb(255, 0, 0); \">非開放時間(無救生員在場)禁止使用</strong><strong style=\"color: rgb(255, 0, 0); \">。</strong></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 3.游泳時請穿著泳衣、泳褲、戴泳帽並先淋浴及卸妝，並做暖身操之後再入池。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 4.入內請脫鞋並將鞋子置於置物櫃。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 5.除瓶裝飲用水外，禁止攜帶任何食品入內。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 6.禁止在池邊嬉戲，以免發生危險。</p>\r\n<p>\r\n	<span class=\"Apple-style-span\" style=\"color: rgb(255, 0, 0); \"><strong>&nbsp;&nbsp; &nbsp; &nbsp; 7.</strong><strong>身高未滿140公分之12歲以下兒童須由家長陪同；60歲以上長者須由家人陪同，方得入內。</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 8.不得攜帶寵物、玻璃、尖物等危險物品入池。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 9.禁止於池內丟棄廢棄物，以維護環境整潔。</p>\r\n<p>\r\n	<span class=\"Apple-style-span\" style=\"color: rgb(255, 0, 0); \"><strong>&nbsp;&nbsp; &nbsp; &nbsp; 10.</strong><strong>患有心臟病、氣喘、高血壓、皮膚病及眼部等傳染病之患者，禁止使用。</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 11.除游泳圈等小型浮水工具外，不得攜帶大型浮水工具入池，不得在池內甩飛盤及干擾他人游泳之運動器材，以保水質清潔。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 12.請勿做跳水、奔跑等危險動作。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 13.不得在池中食用食物及飲料。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 14.禁止塗抹護髮或護膚油膏，以免污染水質。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 15.自行攜帶浴巾。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 16.離去前將個人物品或廢棄物收拾完畢才可離去。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 17.蒸氣室及烤箱使用後請隨手將其電源開關關閉，以節省公共資源。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 18.進入烤箱或蒸氣室請勿配載金屬飾品，以免高溫燙傷。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 19.烤箱內不得曝曬衣物。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 20.請愛惜公物並維護室內清潔，使用後請自行清潔善後，如有汙染，損壞公物照價賠償</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 21.請遵守使用規定及接受服務人員之操作說明與指導。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 22.本使用規定如有未盡事宜，得經由管理委員會會議決議修訂並公告實施。</p>\r\n', '3', '.jpg', '', '12', '1', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('14', '', '龍騰-KTV室', '1300', '2130', '<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<strong>龍騰KTV視聽室使用規定</strong></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>一、開放時間：週一至週五&nbsp; PM13:00 ～PM21:30&nbsp; 例假日AM10:00 </strong><strong>～ </strong><strong>PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	二、包場使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 1.使用者須向櫃檯服務人員登記預約包場，本設施以完成預約登記者，優先使用。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 2.預約人須於二天前向櫃檯服務人員登記預約，取消預約時亦須告知服務人員。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; 3.</strong><strong>包場使用付費方式：使用前向服務人員登記並以儲值卡扣抵消費收費，</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;每小時收費500元，預約者每次使用不可超過</strong></span><span class=\"Apple-style-span\" style=\"color: rgb(255, 0, 0); \"><strong>&nbsp;三小時，如須續用，</strong></span></p>\r\n<p>\r\n	<span class=\"Apple-style-span\" style=\"color: rgb(255, 0, 0); \"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 須洽櫃檯服務人員辦理(服務人員須視後段時間無人使用預約情況下，始得辦理續用)。</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>\r\n<p>\r\n	三、使用規定：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 1.使用對象：龍騰會館住戶。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 2.委員會名義主辦之社區活動及召開之會議不適用包場付費限制。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 3.請愛惜公物並維護室內清潔，損壞公物照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 4.除瓶裝飲用水外，禁止攜帶飲料或食物入內。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 5.使用中如有移動公物，請於離去時歸回原位。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 6.室內禁止吸煙、嬉戲、奔跑、大聲喧嘩。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 7.室內不可舉行任何具危險性或不適當之活動。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 8.請遵守使用規定及服務人員之操作說明與指導。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 9.本使用規定若有未盡事宜，得經由管理委員會會議決議修訂並公告實施。</p>\r\n', '3', '11.jpg', 's-F5-1.jpg', '1', '1', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('15', '', '龍騰-休閒棋奕室', '1300', '2130', '<p>\r\n	<span class=\"Apple-style-span\"><strong>龍騰休閒棋奕室使用規定</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span class=\"Apple-style-span\" style=\"color: rgb(255, 0, 0); \"><strong>&nbsp;一、開放時間：週一至週五&nbsp; PM13:00 ～PM21:30&nbsp; 例假日AM10:00 </strong><strong>～ </strong><strong>PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;二、使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;1.使用前向服務人員登記及現金儲值卡扣抵消費收費。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;2.</strong><strong>使用者每間每一小時收費300元，以三小時為一個使用時段，每人使用時限不得超過六小時。</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	三、使用規定：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 1.使用對象：龍騰會館住戶。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 2.使用前可預約申請，申請時按所需之時段，先後申請次序排定，先到先排。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 3.請愛惜公物並維護室內清潔，使用後請自行清潔善後，如有汙染，損壞公物照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 4.使用中若有移動公物，請於離去時歸回原位。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 5.室內禁止嬉戲、奔跑、大聲喧嘩。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 6.棋奕室內不可舉行任何具危險性或不適當之活動。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 7.七歲以下兒童須由家長陪同方可入內。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 8.請遵守使用規定及服務人員之操作說明與指導。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 9.本使用規定若有未盡事宜，得經由管理委員會會議決議修訂並公告實施。</p>\r\n', '6', '12.jpg', 's-F5-1.jpg', '1', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('16', '', '龍騰-奔雲空中健身中心', '1300', '2130', '<p>\r\n	<span class=\"Apple-style-span\"><strong>龍騰奔雲空中健身中心使用規定</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span style=\"color:#f00;\">一、<strong>開放時間：週一至週五&nbsp; PM13:00 ～PM21:30&nbsp; 例假日AM10:00 </strong><strong>～ </strong><strong>PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	二、使用及付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.使用前向服務人員登記及儲值卡扣抵消費收費。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;2.</strong><strong>使用者住戶免費，非住戶每人每次100元，每人使用時限不得超過二小時</strong><strong>。</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	三、使用規定：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.使用對象：龍騰會館住戶</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.使用前可預約申請，申請時按所需之時段，先後申請之次序排定，先到先排。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;3.請穿著運動服及乾淨球鞋並攜帶毛巾擦汗避免汗水滴落檯面影響衛生，方能入場使用。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;4.</strong><strong>未滿16歲及120公分以下之孩童，不得入內使用</strong><strong>。</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;5.</strong><strong>除瓶裝飲用水外，禁止攜帶飲料或食物入內</strong><strong>。</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;6.使用前先做暖身運動十至十五分鐘。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;7.請勿在室內高聲喧嘩、奔跑。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;8.使用器材應避免碰撞，用畢後請歸回原處。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;9.請勿攜帶寵物進入。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;10.室內禁止吸煙。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;11.請愛惜公物，損壞公物照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;12.服務人員得管制設施內之人數，額滿時得管制進出。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;13.請遵守使用規定及服務人員之操作說明與指導。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;14.本使用規定若有未盡事宜，得經由管理委員會會議決議修訂並公告實施。</p>\r\n', '2', '15.jpg', 's-e1-4.jpg', '1', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('17', '', '龍騰-雲水空中泳池', '1300', '2130', '<p>\r\n	<span class=\"Apple-style-span\"><strong>龍騰雲水</strong><strong>游泳池使用規定</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>一、開放時間：週二 ～ 週日AM7:00 ～ PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 1.週一休館進行例行清潔養護(遇假日順延)或依管理委員會決議之時段開放。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 2.住戶採預約服務。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 3.預約服務時間應聘請安全管理(救生員)專業人員。</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	二、使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 1.使用前向服務人員預約登記並以儲值卡扣抵消費收費。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; 2.</strong><strong>住戶使用每人每次收費300元（含附個人清潔用具），非住戶每人每次收費500元，</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;每人使用時限不得超過2小時。</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	三、使用規定：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 1.使用對象：龍騰會館住戶。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; 2.</strong><strong>非開放時間(無救生員在場)禁止使用。</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 3.游泳時請穿著泳衣、泳褲、戴泳帽並先淋浴及卸妝，並做暖身操之後再入池。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 4.入內請脫鞋並將鞋子置於置物櫃。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 5.除瓶裝飲用水外，禁止攜帶任何食品入內。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 6.禁止在池邊嬉戲，以免發生危險。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; 7.</strong><strong>身高未滿140公分之12歲以下兒童須由家長陪同；60歲以上長者須由家人陪同，方得入內。</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 8.不得攜帶寵物、玻璃、尖物等危險物品入池。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 9.禁止於池內丟棄廢棄物，以維護環境整潔。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp;10.</strong><strong>患有心臟病、氣喘、高血壓、皮膚病及眼部等傳染病之患者，禁止使用。</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;11.除游泳圈等小型浮水工具外，不得攜帶大型浮水工具入池，</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 不得在池內甩飛盤及干擾他人游泳之運動器材，以保水質清潔。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;12.請勿做跳水、奔跑等危險動作。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;13.不得在池中食用食物及飲料。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;14.禁止塗抹護髮或護膚油膏，以免污染水質。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;15.自行攜帶浴巾。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;16.離去前將個人物品或廢棄物收拾完畢才可離去。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;17.蒸氣室及烤箱使用後請隨手將其電源開關關閉，以節省公共資源。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;18.進入烤箱或蒸氣室請勿配載金屬飾品，以免高溫燙傷。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;19.烤箱內不得曝曬衣物。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;20.請愛惜公物並維護室內清潔，使用後請自行清潔善後，如有汙染，損壞公物照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;21.請遵守使用規定及接受服務人員之操作說明與指導。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;22.本使用規定如有未盡事宜，得經由管理委員會會議決議修訂並公告實施。</p>\r\n', '2', '16.jpg', 's-25.jpg', '1', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('18', '', '龍騰-景觀吧檯', '1300', '2130', '<p>\r\n	<strong>龍騰景觀吧檯使用規定</strong></p>\r\n<p>\r\n	一、開放時間：</p>\r\n<p>\r\n	<span style=\"color:#f00;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>1.</strong><strong>週一至週五&nbsp; PM13:00 ～PM21:30&nbsp; 例假日AM10:00 </strong><strong>～ </strong><strong>PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.委員會排定之社區活動時間內，本設施暫停開放。</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	二、使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.本設施為開放式設施，凡具住戶資格者皆可<strong><span style=\"color:#f00;\">依餐飲價目表自行消費</span>。</strong></p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;2.金額採以儲值卡扣抵消費。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;&nbsp;</p>\r\n<p>\r\n	三、服務注意事項</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;1.每日依開放時間提供各場所餐飲專送服務。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 2.對各項設施、設備及裝潢等，請注意維護及使用，如有損壞情形，請告知管理服務中心處理。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;3.使用期間請隨時保持環境整齊清潔，以利清潔維護工作。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 4.凡違反規定者，得勒令離開，並視情節輕重，報請管委會處理，停止其使用權一至四週。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;5.損壞任何設施或器材、桌椅者，應照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 6.非會員或其所帶之親友，及未經批准人員，服務人員得令其離開，不聽從勸告者，將依私自侵入報請警政機關處理。</p>\r\n', '3', '4.jpg', '', '1', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('19', '', '龍騰-女三溫暖', '1300', '2130', '<p>\r\n	<strong>龍騰三溫暖室</strong><strong>使用規定</strong></p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; &nbsp;</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>一、開放時間：週二 ～ 週日AM7:00 ～ PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	二、使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 1.使用前向服務人員預約登記並以儲值卡扣抵消費收費。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; 2.</strong><strong>使用者住戶每人每次收費100元，非住戶每人每次收費200元（已給付泳池設施費用不加收），</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;每人使用時限不得超過3小時</strong><strong>。</strong></span></p>\r\n<p style=\"margin-left:48.0pt;\">\r\n	&nbsp;</p>\r\n<p>\r\n	三、服務注意事項</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 1.設施清潔維護時間，請勿進場。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 2.使用水池前請先淋浴，以維護公共衛生。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 3.嚴禁於室內閱讀報章雜誌及掛曬衣物。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 4.冷/熱水池、蒸氣室及烤箱室內禁止使用護膚護髮產品。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 5.請勿配帶眼鏡、項鍊、手錶等金屬飾品進入冷/熱水池、蒸氣室及烤箱。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 6.身體不適或已飲酒者，請勿勉強使用。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; 7</strong><strong>.</strong><strong>患</strong><strong>有心臟病、皮膚病、高血壓、感冒、角膜炎、其他傳染病及懷孕者嚴禁使用。</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp;8</strong><strong>.</strong><strong>12</strong><strong>歲以下兒童須由成人陪</strong><strong>同；60歲以上長者須由家人陪同，方可進入使用。</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;9.上述各項如有違反而發生意外者，由使用者自行負責。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;10.使用期間請隨時保持環境整齊清潔，以利維護。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;11.設施如有損壞情形請告知管理服務中心處理。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;12.凡違反規定者，得勒令離開，並視情節輕重，報請管委會處理，停止其使用權一至四週。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;13.損壞任何設施或器材、桌椅者，應照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;14.非會員或未經批准之人員，服務人員得令其離開，不聽從勸告者，將報請警政機關處理。</p>\r\n', '3', '5.jpg', '', '1', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('20', '', '龍騰-男三溫暖', '1300', '2130', '<p>\r\n	<span class=\"Apple-style-span\"><strong>龍騰三溫暖室</strong><strong>使用規定</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\">&nbsp;&nbsp;&nbsp; &nbsp;</span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>一、開放時間：週二 ～ 週日AM7:00 ～ PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	二、使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.使用前向服務人員預約登記並以儲值卡扣抵消費收費。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;2.</strong><strong>使用者住戶每人每次收費100元，非住戶每人每次收費200元（已給付泳池設施費用不加收），</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 每人使用時限不得超過3小時</strong><strong>。</strong></span></p>\r\n<p style=\"margin-left:48.0pt;\">\r\n	&nbsp;</p>\r\n<p>\r\n	三、服務注意事項</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.設施清潔維護時間，請勿進場。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.使用水池前請先淋浴，以維護公共衛生。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;3.嚴禁於室內閱讀報章雜誌及掛曬衣物。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;4.冷/熱水池、蒸氣室及烤箱室內禁止使用護膚護髮產品。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;5.請勿配帶眼鏡、項鍊、手錶等金屬飾品進入冷/熱水池、蒸氣室及烤箱。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;6.身體不適或已飲酒者，請勿勉強使用。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;7</strong><strong>.</strong><strong>患</strong><strong>有心臟病、皮膚病、高血壓、感冒、角膜炎、其他傳染病及懷孕者嚴禁使用。</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;8</strong><strong>.</strong><strong>12</strong><strong>歲以下兒童須由成人陪</strong><strong>同；60歲以上長者須由家人陪同，方可進入使用。</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;9.上述各項如有違反而發生意外者，由使用者自行負責。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;10.使用期間請隨時保持環境整齊清潔，以利維護。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;11.設施如有損壞情形請告知管理服務中心處理。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;12.凡違反規定者，得勒令離開，並視情節輕重，報請管委會處理，停止其使用權一至四週。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;13.損壞任何設施或器材、桌椅者，應照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;14.非會員或未經批准之人員，服務人員得令其離開，不聽從勸告者，將報請警政機關處理。</p>\r\n', '3', '2.jpg', '', '1', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('21', '', '紫光-KTV室 ', '1300', '2130', '<p>\r\n	<span class=\"Apple-style-span\"><strong>紫光KTV</strong><strong>視聽室使用規定</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>一、開放時間：週一至週五&nbsp; PM13:00 ～PM21:30&nbsp; 例假日AM10:00 </strong><strong>～ </strong><strong>PM21:30</strong></span></p>\r\n<p>\r\n	二、包場使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;1.使用者須向櫃檯服務人員登記預約包場，本設施以完成預約登記者，優先使用。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;2.預約人須於二天前向櫃檯服務人員登記預約，取消預約時亦須告知服務人員。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;3.</strong><strong>包場使用付費方式：使用前向服務人員登記並以儲值卡扣抵消費收費，每小時收費500元，</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;預約者每次使用不可超過三小時，如須續用，須洽櫃檯服務人員辦理</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(服務人員須視後段時間無人使用預約情況下，始得辦理續用)。</strong></span></p>\r\n<p>\r\n	三、使用規定：</p>\r\n<p style=\"margin-left:18.7pt;\">\r\n	1.使用對象：紫光會館住戶。</p>\r\n<p style=\"margin-left:18.7pt;\">\r\n	2.委員會名義主辦之社區活動及召開之會議不適用包場付費限制。</p>\r\n<p style=\"margin-left:18.7pt;\">\r\n	3.請愛惜公物並維護室內清潔，損壞公物照價賠償。</p>\r\n<p style=\"margin-left:18.7pt;\">\r\n	4.除瓶裝飲用水外，禁止攜帶飲料或食物入內。</p>\r\n<p style=\"margin-left:18.7pt;\">\r\n	5.使用中如有移動公物，請於離去時歸回原位。</p>\r\n<p style=\"margin-left:18.7pt;\">\r\n	6.室內禁止吸煙、嬉戲、奔跑、大聲喧嘩。</p>\r\n<p style=\"margin-left:18.7pt;\">\r\n	7.室內不可舉行任何具危險性或不適當之活動。</p>\r\n<p style=\"margin-left:18.7pt;\">\r\n	8.請遵守使用規定及服務人員之操作說明與指導。</p>\r\n<p style=\"margin-left:18.7pt;\">\r\n	9.本使用規定若有未盡事宜，得經由管理委員會會議決議修訂並公告實施。</p>\r\n', '3', '21.jpg', 's-f2-1.jpg', '2', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('22', '', '紫光-休閒棋奕室', '1300', '2130', '<p>\r\n	<span class=\"Apple-style-span\"><strong>紫光休閒棋奕室使用規定</strong></span></p>\r\n<p>\r\n	<span class=\"Apple-style-span\" style=\"color: rgb(255, 0, 0); \">&nbsp;<strong>一、開放時間：週一至週五&nbsp; PM13:00 ～PM21:30&nbsp; 例假日AM10:00 </strong><strong>～ </strong><strong>PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp;二、使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;1.使用前向服務人員登記並以儲值卡扣抵消費收費。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;2.</strong><strong>使用者每間每一小時收費300元，以三小時為一個使用時段，每人使用時限不得超過六小時。</strong></span></p>\r\n<p>\r\n	三、使用規定：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;1.使用對象：紫光會館住戶。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;2.使用前可預約申請，申請時按所需之時段，先後申請次序排定，先到先排。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;3.請愛惜公物並維護室內清潔，使用後請自行清潔善後，如有汙染，損壞公物照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;4.使用中若有移動公物，請於離去時歸回原位。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;5.室內禁止嬉戲、奔跑、大聲喧嘩。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;6.棋奕室內不可舉行任何具危險性或不適當之活動。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;7.七歲以下兒童須由家長陪同方可入內。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;8.請遵守使用規定及服務人員之操作說明與指導。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;9.本使用規定若有未盡事宜，得經由管理委員會會議決議修訂並公告實施。</p>\r\n', '6', '22.jpg', 's-f2-2.jpg', '1', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('23', '', '紫光-星空健身房', '1300', '2130', '<p>\r\n	<strong>紫光星空健身房使用規定</strong></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span class=\"Apple-style-span\" style=\"color: rgb(255, 0, 0); \"><strong>&nbsp;一、開放時間：週一至週五&nbsp; PM13:00 ～PM21:30&nbsp; 例假日AM10:00 </strong><strong>～ </strong><strong>PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;二、使用及付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.使用前向服務人員登記並以儲值卡扣抵消費收費。</p>\r\n<p>\r\n	<span style=\"color:#f00;\">&nbsp;&nbsp; &nbsp; &nbsp;<strong>2.</strong><strong>使用者住戶免費，非住戶每人每次100元，每人使用時限不得超過二小時。</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	三、使用規定：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.使用對象：紫光會館住戶。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.使用前可預約申請，申請時按所需之時段，先後申請之次序排定，先到先排。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;3.請穿著運動服及乾淨球鞋並攜帶毛巾擦汗避免汗水滴落檯面影響衛生，方能入場使用。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;4.</strong><strong>未滿16歲及120公分以下之孩童，不得入內使用</strong><strong>。</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;5.</strong><strong>除瓶裝飲用水外，禁止攜帶飲料或食物入內</strong><strong>。</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;6.使用前先做暖身運動十至十五分鐘。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;7.請勿在室內高聲喧嘩、奔跑。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;8.使用器材應避免碰撞，用畢後請歸回原處。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;9.請勿攜帶寵物進入。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;10.室內禁止吸煙。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;11.請愛惜公物，損壞公物照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;12.服務人員得管制設施內之人數，額滿時得管制進出。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;13.請遵守使用規定及服務人員之操作說明與指導。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;14.本使用規定若有未盡事宜，得經由管理委員會會議決議修訂並公告實施。</p>\r\n', '2', '23.jpg', 's-02.jpg', '2', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('24', '', '紫光-景觀吧台', '1300', '2130', '<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<strong>紫光景觀吧檯使用規定</strong></p>\r\n<p>\r\n	一、開放時間：</p>\r\n<p>\r\n	<span style=\"color:#f00;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;1.</strong><strong>週一至週五&nbsp; PM13:00 ～PM21:30&nbsp; 例假日AM10:00 </strong><strong>～ </strong><strong>PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.委員會排定之社區活動時間內，本設施暫停開放。</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	二、使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.本設施為開放式設施，凡具紫光會館住戶資格者皆可<strong><span style=\"color:#f00;\">依餐飲價目表自行消費</span>。</strong></p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.金額採以儲值卡扣抵消費。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;</p>\r\n<p>\r\n	&nbsp;&nbsp; 三、服務注意事項</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;1.每日依開放時間提供各場所餐飲專送服務。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 2.對各項設施、設備及裝潢等，請注意維護及使用，如有損壞情形，請告知管理服務中心處理。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;3.使用期間請隨時保持環境整齊清潔，以利清潔維護工作。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 4.凡違反規定者，得勒令離開，並視情節輕重，報請管委會處理，停止其使用權一至四週。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5.損壞任何設施或器材、桌椅者，應照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 6.非會員或其所帶之親友，及未經批准人員，服務人員得令其離開，不聽從勸告者，將依私自侵入報請警政機關處理。</p>\r\n', '3', '13.jpg', '', '2', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('25', '', '凌雲-KTV室 ', '1300', '2130', '<p>\r\n	<span class=\"Apple-style-span\"><strong>凌雲KTV</strong><strong>視聽室使用規定</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>一、開放時間：週一至週五&nbsp; PM13:00 ～PM21:30&nbsp; 例假日AM10:00 </strong><strong>～ </strong><strong>PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	二、包場使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.使用者須向櫃檯服務人員登記預約包場，本設施以完成預約登記者，優先使用。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.預約人須於二天前向櫃檯服務人員登記預約，取消預約時亦須告知服務人員。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;3.</strong><strong>包場使用付費方式：使用前向服務人員登記並以儲值卡扣抵消費收費，</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 每小時收費500元，預約者每次使用不可超過三小時，如須續用，</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 須洽櫃檯服務人員辦理(服務人員須視後段時間無人使用預約情況下，始得辦理續用)。</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	三、使用規定：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.使用對象：凌雲會館住戶</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.委員會名義主辦之社區活動及召開之會議不適用包場付費限制。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;3.請愛惜公物並維護室內清潔，損壞公物照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;4.除瓶裝飲用水外，禁止攜帶飲料或食物入內。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;5.使用中如有移動公物，請於離去時歸回原位。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;6.室內禁止吸煙、嬉戲、奔跑、大聲喧嘩。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;7.室內不可舉行任何具危險性或不適當之活動。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;8.請遵守使用規定及服務人員之操作說明與指導。&nbsp;</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;9.本使用規定若有未盡事宜，得經由管理委員會會議決議修訂並公告實施。</p>\r\n', '4', '.jpg', 's-F5-1-1.jpg', '3', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('26', '', '凌雲-休閒棋奕室', '1300', '2130', '<p>\r\n	<strong>凌雲休閒棋奕室使用規定</strong></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>一、開放時間：週一至週五&nbsp; PM13:00 ～PM21:30&nbsp; 例假日AM10:00 </strong><strong>～ </strong><strong>PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	二、使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.使用前向管理秘書登記並以儲值卡扣抵消費收費。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;2.</strong><strong>使用者每間每一小時收費300元，以三小時為一個使用時段，每人使用時限不得超過六小時。</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	三、使用規定：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.使用對象：凌雲會館住戶。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.使用前可預約申請，申請時按所需之時段，先後申請次序排定，先到先排。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;3.請愛惜公物並維護室內清潔，使用後請自行清潔善後，如有汙染，損壞公物照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;4.使用中若有移動公物，請於離去時歸回原位。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;5.室內禁止嬉戲、奔跑、大聲喧嘩。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;6.棋奕室內不可舉行任何具危險性或不適當之活動。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;7.七歲以下兒童須由家長陪同方可入內。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;8.請遵守使用規定及服務人員之操作說明與指導。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;9.本使用規定若有未盡事宜，得經由管理委員會會議決議修訂並公告實施。</p>\r\n', '6', '32.jpg', 's-18.jpg', '3', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('27', '', '凌雲-流星健身中心', '1300', '2130', '<p>\r\n	<span class=\"Apple-style-span\"><strong>凌雲流星健身中心使用規定</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>一、開放時間：週一至週五&nbsp; PM13:00 ～PM21:30&nbsp; 例假日AM10:00 </strong><strong>～ </strong><strong>PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	二、使用及付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.使用前向服務人員登記並以儲值卡扣抵消費收費。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;2.</strong><strong>使用者住戶免費，非住戶每人每次100元，每人使用時限不得超過二小時</strong><strong>。</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	三、使用規定：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.使用對象：凌雲會館住戶</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.使用前可預約申請，申請時按所需之時段，先後申請之次序排定，先到先排。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;3.請穿著運動服及乾淨球鞋並攜帶毛巾擦汗避免汗水滴落檯面影響衛生，方能入場使用。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;4.</strong><strong>未滿16歲及120公分以下之孩童，不得入內使用</strong><strong>。</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;5.</strong><strong>除瓶裝飲用水外，禁止攜帶飲料或食物入內</strong><strong>。</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;6.使用前先做暖身運動十至十五分鐘。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;7.請勿在室內高聲喧嘩、奔跑。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;8.使用器材應避免碰撞，用畢後請歸回原處。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;9.請勿攜帶寵物進入。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;10.室內禁止吸煙。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;11.請愛惜公物，損壞公物照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;12.服務人員得管制設施內之人數，額滿時得管制進出。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;13.請遵守使用規定及服務人員之操作說明與指導。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;14.本使用規定若有未盡事宜，得經由管理委員會會議決議修訂並公告實施。</p>\r\n', '3', '34.jpg', 's-101.jpg', '3', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('28', '', '凌雲-星情景觀吧檯', '1300', '2130', '<p>\r\n	<strong>星情</strong><strong>景觀吧檯使用規定</strong></p>\r\n<p>\r\n	一、開放時間：</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;1</strong><strong>.</strong><strong>週一至週五&nbsp; PM13:00 ～ PM21:30&nbsp; 例假日AM10:00 </strong><strong>～ </strong><strong>PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.委員會排定之社區活動時間內，本設施暫停開放。</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	二、使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.本設施為開放式設施，凡具凌雲會館住戶資格者皆可<strong><span style=\"color:#f00;\">依餐飲價目表自行消費</span>。</strong></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.採儲值卡扣抵消費收費。 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>\r\n<p>\r\n	三、服務注意事項</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.每日依開放時間提供各場所餐飲專送服務。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.對各項設施、設備及裝潢等，請注意維護及使用，如有損壞情形，請告知管理服務中心處理。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;3.使用期間請隨時保持環境整齊清潔，以利清潔維護工作。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;4.凡違反規定者，得勒令離開，並視情節輕重，報請管委會處理，停止其使用權一至四週。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;5.損壞任何設施或器材、桌椅者，應照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;6.非會員或其所帶之親友，及未經批准人員，服務人員得令其離開，不聽從勸告者，將依私自侵入報請警政機關處理。</p>\r\n', '3', '13.jpg', '', '3', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('29', '', '凌雲-星願交誼廳', '1300', '2130', '<p>\r\n	<strong>凌雲星願交誼廳</strong><strong>使用規定</strong></p>\r\n<p>\r\n	一、開放時間：</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;1.</strong><strong>週一至週五&nbsp; PM13:00 ～PM21:30&nbsp; 例假日AM10:00 </strong><strong>～ </strong><strong>PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.委員會排定之社區活動時間內，本設施暫停開放。</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	二、使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.本設施為開放式設施，凡具凌雲會館住戶住戶資格者皆可<strong><span style=\"color:#f00;\">依餐飲價目表自行消費</span>。</strong></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.並採以儲值卡扣抵消費收費。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<p>\r\n	&nbsp;&nbsp; 三、服務注意事項</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.每日依開放時間提供各場所餐飲專送服務。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.對各項設施、設備及裝潢等，請注意維護及使用，如有損壞情形，請告知管理服務中心處理。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;3.使用期間請隨時保持環境整齊清潔，以利清潔維護工作。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;4.凡違反規定者，得勒令離開，並視情節輕重，報請管委會處理，停止其使用權一至四週。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;5.損壞任何設施或器材、桌椅者，應照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;6.非會員或其所帶之親友，及未經批准人員，服務人員得令其離開，不聽從勸告者，將依私自侵入報請警政機關處理。</p>\r\n', '3', '51.jpg', '', '3', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('30', '', '凌雲-撞球區', '0700', '2130', '<p>\r\n	<span class=\"Apple-style-span\" style=\"font-weight: bold; \">凌雲撞球區使用規定</span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>一、開放時間：</strong><strong>週一至週五&nbsp; PM13:00 ～PM21:30&nbsp; 例假日AM10:00 ～ PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	二、付費方式</p>\r\n<p>\r\n	1.使用者須向櫃檯服務人員登記預約，本設施以完成預約登記者，優先使用。</p>\r\n<p>\r\n	2.預約人須於二天前向櫃檯服務人員登記預約，取消預約時亦須告知服務人員。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>3.</strong><strong>使用付費方式：使用前向服務人員登記並以儲值卡扣抵消費收費，每小時收費100元 ，</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; 不滿1小時，以1小時計，預約者每次使用不可超過三小時，如須續用，須洽櫃檯服務人員辦理</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; (服務人員須視後段時間無人使用預約情況下，始得辦理續用)。</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	三、使用規定</p>\r\n<p>\r\n	1.使用對象：凌雲會館住戶。</p>\r\n<p>\r\n	2.櫃檯備有球具，會員如有需要得於使用前向櫃檯領取，使用完畢後應將設備歸還櫃檯&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 。</p>\r\n<p>\r\n	3.管委會排定之會員活動時間內，本設施暫停開放。</p>\r\n<p>\r\n	4.使用期間請隨時保持環境整齊清潔，以利維護。</p>\r\n<p>\r\n	5.損壞任何設施或器材、桌椅者，應照價賠償。</p>\r\n<p>\r\n	6.除瓶裝飲用水外，禁止攜帶飲料或食物入內。</p>\r\n<p>\r\n	7.室內禁止吸煙、嬉戲、奔跑、大聲喧嘩。</p>\r\n<p>\r\n	8.室內不可舉行任何具危險性或不適當之活動。</p>\r\n<p>\r\n	9.非會員或其所帶之親友，及未經批准人員，服務人員得令其離開，不聽從勸告者，將依私自侵入報請警政機關處理。</p>\r\n<p>\r\n	10.本使用規定若有未盡事宜，得經由管理委員會會議決議修訂並公告實施。</p>\r\n', '3', '41.jpg', '', '3', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('31', '', '凌雲-月光電影院 ', '1300', '2130', '<p>\r\n	<span class=\"Apple-style-span\"><strong>凌雲月光電影院使用規定</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>一、開放時間：週一至週五&nbsp; PM13:00 ～PM21:30&nbsp; 例假日AM10:00 ～ PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span class=\"Apple-style-span\" style=\"color: rgb(255, 0, 0); \">&nbsp;<strong>二、包場使用付費方式：</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 1.使用者須向櫃檯服務人員登記預約包場，本設施以完成預約登記者，優先使用。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 2.預約人須於二天前向櫃檯服務人員登記預約，取消預約時亦須告知服務人員。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; 3.</strong><strong>包場使用付費方式：使用前向</strong><strong>服務人員</strong><strong>登記並以</strong><strong>儲值卡扣抵消費</strong><strong>收費</strong><strong>，每小時收費200元，</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;預約者每次使用不可超過三小時，如須續用，須洽櫃檯</strong><strong>服務人員</strong><strong>辦理</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(</strong><strong>服務人員</strong><strong>須視後段時間無人使用預約情況下，始得辦理續用)。</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	三<strong>、</strong>使用規定：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.使用對象：凌雲會館住戶</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.委員會名義主辦之社區活動及召開之會議不適用包場付費限制。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;3.請愛惜公物並維護室內清潔，損壞公物照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;4.周末假日為促進住戶情誼與交流可提供社區住戶電影欣賞。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;5.除瓶裝飲用水外，禁止攜帶飲料或食物入內。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;6.使用中如有移動公物，請於離去時歸回原位。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;7.室內禁止吸煙、嬉戲、奔跑、大聲喧嘩。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;8.室內不可舉行任何具危險性或不適當之活動。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;9.請遵守使用規定及服務人員之操作說明與指導。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 10.本使用規定若有未盡事宜，得經由管理委員會會議決議修訂並公告實施。</p>\r\n', '3', '33.jpg', 's-06.jpg', '3', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('32', '', '極峰 -KTV室', '1300', '2130', '<p>\r\n	<span class=\"Apple-style-span\"><strong>極峰KTV</strong><strong>視聽室使用規定</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>一、開放時間：週一至週五&nbsp; PM13:00 ～PM21:30&nbsp; 例假日AM10:00 ～ PM21:30</strong></span></p>\r\n<p style=\"margin-left:18.7pt;\">\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;二、包場使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.使用者須向櫃檯服務人員登記預約包場，本設施以完成預約登記者，優先使用。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.預約人須於二天前向櫃檯服務人員登記預約，取消預約時亦須告知服務人員。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;3.</strong><strong>包場使用付費方式：使用前向服務人員登記並以儲值卡扣抵消費收費，</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 每小時收費500元，預約者每次使用不可超過三小時，如須續用，</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 須洽櫃檯服務人員辦理(服務人員須視後段時間無人使用預約情況下，始得辦理續用)。</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	三、使用規定：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 1.使用對象：極峰會館住戶。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 2.委員會名義主辦之社區活動及召開之會議不適用包場付費限制。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 3.請愛惜公物並維護室內清潔，損壞公物照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 4.除瓶裝飲用水外，禁止攜帶飲料或食物入內。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 5.使用中如有移動公物，請於離去時歸回原位。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 6.室內禁止吸煙、嬉戲、奔跑、大聲喧嘩。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 7.室內不可舉行任何具危險性或不適當之活動。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 8.請遵守使用規定及服務人員之操作說明與指導。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 9.本使用規定若有未盡事宜，得經由管理委員會會議決議修訂並公告實施。</p>\r\n', '3', '41.jpg', 's-102.jpg', '4', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('33', '', '極峰 -月牙泉泳池', '1300', '2130', '<p>\r\n	<span class=\"Apple-style-span\"><strong>極峰月牙泉</strong><strong>游泳池使用規定</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>一、開放時間：週二 ～ 週日AM7:00 ～ PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.週一休館進行例行清潔養護(遇假日順延)或依管理委員會決議之時段開放。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.住戶採預約服務。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;3.預約服務時間應聘請安全管理(救生員)專業人員。</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	二、使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.使用前向服務人員預約登記並以儲值卡扣抵消費收費。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;2.</strong><strong>住戶使用每人每次收費300元（含附個人清潔用具），非住戶每人每次收費500元，</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 每人使用時限不得超過2小時。</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	三、使用規定：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.使用對象：極峰會館住戶。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;2.</strong><strong>非開放時間(無救生員在場)禁止使用。</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;3.游泳時請穿著泳衣、泳褲、戴泳帽並先淋浴及卸妝，並做暖身操之後再入池。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;4.入內請脫鞋並將鞋子置於置物櫃。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;5.除瓶裝飲用水外，禁止攜帶任何食品入內。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;6.禁止在池邊嬉戲，以免發生危險。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;7.</strong><strong>身高未滿140公分之12歲以下兒童須由家長陪同；60歲以上長者須由家人陪同，方得入內。</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 8.不得攜帶寵物、玻璃、尖物等危險物品入池。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 9.禁止於池內丟棄廢棄物，以維護環境整潔。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; 10.</strong><strong>患有心臟病、氣喘、高血壓、皮膚病及眼部等傳染病之患者，禁止使用。</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 11.除游泳圈等小型浮水工具外，不得攜帶大型浮水工具入池，</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;不得在池內甩飛盤及干擾他人游泳之運動器材，以保水質清潔。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 12.請勿做跳水、奔跑等危險動作。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 13.不得在池中食用食物及飲料。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 14.禁止塗抹護髮或護膚油膏，以免污染水質。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 15.自行攜帶浴巾。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 16.離去前將個人物品或廢棄物收拾完畢才可離去。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 17.蒸氣室及烤箱使用後請隨手將其電源開關關閉，以節省公共資源。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 18.進入烤箱或蒸氣室請勿配載金屬飾品，以免高溫燙傷。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 19.烤箱內不得曝曬衣物。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 20.請愛惜公物並維護室內清潔，使用後請自行清潔善後，如有汙染，損壞公物照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 21.請遵守使用規定及接受服務人員之操作說明與指導。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 22.本使用規定如有未盡事宜，得經由管理委員會會議決議修訂並公告實施。</p>\r\n', '2', '42.jpg', 's-105.jpg', '4', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('34', '', '極峰-景觀吧檯', '1300', '2130', '<p>\r\n	<strong>極峰景觀吧檯使用規定</strong></p>\r\n<p align=\"center\">\r\n	&nbsp;</p>\r\n<p>\r\n	一、開放時間：</p>\r\n<p>\r\n	<span style=\"color:#f00;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>1.</strong><strong>週一至週五&nbsp; PM13:00 ～PM21:30&nbsp; 例假日AM10:00 ～ PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.委員會排定之社區活動時間內，本設施暫停開放。</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	二、使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.本設施為開放式設施，凡具住戶資格者皆可<strong><span style=\"color:#f00;\">依餐飲價目表自行消費</span>。</strong></p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;2.金額採以儲值卡扣抵消費。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<p>\r\n	&nbsp;&nbsp; 三、服務注意事項</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;1.每日依開放時間提供各場所餐飲專送服務。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 2.對各項設施、設備及裝潢等，請注意維護及使用，如有損壞情形，請告知管理服務中心處理。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;3.使用期間請隨時保持環境整齊清潔，以利清潔維護工作。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 4.凡違反規定者，得勒令離開，並視情節輕重，報請管委會處理，停止其使用權一至四週。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;5.損壞任何設施或器材、桌椅者，應照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 6.非會員或其所帶之親友，及未經批准人員，服務人員得令其離開，不聽從勸告者，將依私自侵入報請警政機關處理。</p>\r\n', '3', '13.jpg', '', '4', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('35', '', '極峰-女三溫暖', '1300', '2100', '<p>\r\n	<strong>極峰三溫暖室使用規定</strong></p>\r\n<p>\r\n	<span style=\"color: rgb(255, 0, 0); \">&nbsp;&nbsp;&nbsp; &nbsp;</span></p>\r\n<p>\r\n	<span style=\"color: rgb(255, 0, 0); \"><strong>一、開放時間：週二 ～ 週日AM7:00 ～ PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	二、使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.使用前向服務人員預約登記並以儲值卡扣抵消費收費。</p>\r\n<p>\r\n	<span style=\"color: rgb(255, 0, 0); \"><strong>&nbsp;&nbsp; &nbsp; &nbsp;2.</strong><strong>使用者住戶每人每次收費100元，非住戶每人每次收費200元（已給付泳池設施費用不加收），</strong></span></p>\r\n<p>\r\n	<span style=\"color: rgb(255, 0, 0); \"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 每人使用時限不得超過3小時</strong><strong>。</strong></span></p>\r\n<p style=\"margin-left: 48pt; \">\r\n	&nbsp;</p>\r\n<p>\r\n	三、服務注意事項</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.設施清潔維護時間，請勿進場。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.使用水池前請先淋浴，以維護公共衛生。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;3.嚴禁於室內閱讀報章雜誌及掛曬衣物。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;4.冷/熱水池、蒸氣室及烤箱室內禁止使用護膚護髮產品。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;5.請勿配帶眼鏡、項鍊、手錶等金屬飾品進入冷/熱水池、蒸氣室及烤箱。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;6.身體不適或已飲酒者，請勿勉強使用。</p>\r\n<p>\r\n	<span style=\"color: rgb(255, 0, 0); \"><strong>&nbsp;&nbsp; &nbsp; &nbsp;7</strong><strong>.</strong><strong>患</strong><strong>有心臟病、皮膚病、高血壓、感冒、角膜炎、其他傳染病及懷孕者嚴禁使用。</strong></span></p>\r\n<p>\r\n	<span style=\"color: rgb(255, 0, 0); \"><strong>&nbsp;&nbsp; &nbsp; 8</strong><strong>.</strong><strong>12</strong><strong>歲以下兒童須由成人陪</strong><strong>同；60歲以上長者須由家人陪同，方可進入使用。</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 9.上述各項如有違反而發生意外者，由使用者自行負責。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;10.使用期間請隨時保持環境整齊清潔，以利維護。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;11.設施如有損壞情形請告知管理服務中心處理。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;12.凡違反規定者，得勒令離開，並視情節輕重，報請管委會處理，停止其使用權一至四週。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;13.損壞任何設施或器材、桌椅者，應照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;14.非會員或未經批准之人員，服務人員得令其離開，不聽從勸告者，將報請警政機關處理。</p>\r\n', '3', '5.jpg', '', '4', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('36', '', '極峰-男三溫暖', '1300', '2130', '<p>\r\n	<strong>極峰三溫暖室使用規定</strong></p>\r\n<p>\r\n	<span style=\"color:#f00;\">&nbsp;&nbsp;&nbsp; &nbsp;</span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>一、開放時間：週二 ～ 週日AM7:00 ～ PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	二、使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.使用前向服務人員預約登記並以儲值卡扣抵消費收費。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;2.</strong><strong>使用者住戶每人每次收費100元，非住戶每人每次收費200元（已給付泳池設施費用不加收），</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 每人使用時限不得超過3小時</strong><strong>。</strong></span></p>\r\n<p style=\"margin-left:48.0pt;\">\r\n	&nbsp;</p>\r\n<p>\r\n	三、服務注意事項</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 1.設施清潔維護時間，請勿進場。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 2.使用水池前請先淋浴，以維護公共衛生。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 3.嚴禁於室內閱讀報章雜誌及掛曬衣物。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 4.冷/熱水池、蒸氣室及烤箱室內禁止使用護膚護髮產品。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 5.請勿配帶眼鏡、項鍊、手錶等金屬飾品進入冷/熱水池、蒸氣室及烤箱。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 6.身體不適或已飲酒者，請勿勉強使用。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; 7</strong><strong>.</strong><strong>患</strong><strong>有心臟病、皮膚病、高血壓、感冒、角膜炎、其他傳染病及懷孕者嚴禁使用。</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; 8</strong><strong>.</strong><strong>12</strong><strong>歲以下兒童須由成人陪</strong><strong>同；60歲以上長者須由家人陪同，方可進入使用。&nbsp;</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 9.上述各項如有違反而發生意外者，由使用者自行負責。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;10.使用期間請隨時保持環境整齊清潔，以利維護。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;11.設施如有損壞情形請告知管理服務中心處理。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;12.凡違反規定者，得勒令離開，並視情節輕重，報請管委會處理，停止其使用權一至四週。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;13.損壞任何設施或器材、桌椅者，應照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp;14.非會員或未經批准之人員，服務人員得令其離開，不聽從勸告者，將報請警政機關處理。</p>\r\n', '3', '22.jpg', '', '4', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('37', '', '極峰-宴會廳', '1000', '2100', '<p>\r\n	<span class=\"Apple-style-span\"><strong>極峰宴會廳使用規定</strong></span></p>\r\n<p align=\"center\">\r\n	&nbsp;</p>\r\n<p>\r\n	一、開放時間：</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; 1.</strong><strong>預約制</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.委員會排定之社區活動時間內，本設施暫停開放。</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	二、使用付費方式：</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;1.</strong><strong>會議用：採預約制，每場次以3小時為限，酌收場地費2&cedil;000元；逾時以700元/小時收費，</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 不足1小時，以1小時計之。</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;2.</strong><strong>宴會用：採預約制，每場次以3小時為限，酌收場地費3&cedil;000元；逾時以1&cedil;000元/小時收費，</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;不足1小時，以1小時計之。</strong></span><span class=\"Apple-style-span\" style=\"color: rgb(255, 0, 0); \"><strong>&nbsp;&nbsp;(外燴使用: &nbsp;廚房加收清潔費1&cedil;500元)</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;3.</strong><strong>預訂桌(人)數須於宴會舉行前三日(72小時)確認，宴會開始至結束如未達預訂桌(人)數時，</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 仍按原預訂桌(人)數之費用收費。</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;4.宴會帳款請於宴會結束後，金額採儲值卡扣抵消費收費。</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	三、服務注意事項</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.對各項設施、設備及裝潢等，請注意維護及使用，如有損壞情形，請告知管理服務中心處理。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.使用期間請隨時保持環境整齊清潔，以利清潔維護工作。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;3.凡違反規定者，得勒令離開，並視情節輕重，報請管委會處理，停止其使用權一至四週。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;4.損壞任何設施或器材、桌椅者，應照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;5.非會員或其所帶之親友，及未經批准人員，服務人員得令其離開，</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 不聽從勸告者，將依私自侵入報請警政機關處理。</p>\r\n', '3', '87.jpg', 's-103.jpg', '4', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('38', '', '鳳翔-KTV室 ', '1300', '2130', '<p>\r\n	<strong>鳳翔KTV</strong><strong>視聽室使用規定</strong></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span class=\"Apple-style-span\" style=\"color: rgb(255, 0, 0); \"><strong>一、開放時間：週一至週五&nbsp; PM13:00 ～PM21:30&nbsp; 例假日AM10:00 ～ PM21:30</strong></span></p>\r\n<p>\r\n	二、包場使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 1.使用者須向櫃檯服務人員登記預約包場，本設施以完成預約登記者，優先使用。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 2.預約人須於二天前向櫃檯服務人員登記預約，取消預約時亦須告知服務人員。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;3.</strong><strong>包場使用付費方式：使用前向服務人員登記並以儲值卡扣抵消費收費，每小時收費500元，</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 預約者每次使用不可超過三小 時，如須續用，須洽櫃檯服務人員辦理</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (服務人員須視後段時無人使用預約情況下，始得辦理續用)。</strong></span></p>\r\n<p style=\"margin-left:54.0pt;\">\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;&nbsp; 三、使用規定：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1.使用對象：鳳翔會館住戶。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2.委員會名義主辦之社區活動及召開之會議不適用包場付費限制。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;3.請愛惜公物並維護室內清潔，損壞公物照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 4.除瓶裝飲用水外，禁止攜帶飲料或食物入內。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 5.使用中如有移動公物，請於離去時歸回原位。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 6.室內禁止吸煙、嬉戲、奔跑、大聲喧嘩。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 7.室內不可舉行任何具危險性或不適當之活動。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 8.請遵守使用規定及服務人員之操作說明與指導。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 9.本使用規定若有未盡事宜，得經由管理委員會會議決議修訂並公告實施。</p>\r\n', '3', '51.jpg', 's-107.jpg', '5', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('39', '', '鳳翔-休閒棋奕室', '1300', '2130', '<p>\r\n	<b>鳳翔休閒棋奕室使用規定</b></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>一、開放時間：週一至週五&nbsp; PM13:00 ～PM21:30&nbsp; 例假日AM10:00 ～ PM21:30</strong></span></p>\r\n<p>\r\n	二、使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.使用前向服務人員登記及儲值卡扣抵消費收費。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;2.</strong><strong>使用者每間每一小時收費300元，以三小時為一個使用時段，每人使用時限不得超過六小時。</strong></span></p>\r\n<p style=\"margin-left:43.5pt;\">\r\n	&nbsp;</p>\r\n<p>\r\n	三、使用規定：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.使用對象：鳳翔會館住戶。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.使用前可預約申請，申請時按所需之時段，先後申請次序排定，先到先排。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;3.請愛惜公物並維護室內清潔，使用後請自行清潔善後，如有汙染，損壞公物照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;4.使用中若有移動公物，請於離去時歸回原位。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;5.室內禁止嬉戲、奔跑、大聲喧嘩。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;6.棋奕室內不可舉行任何具危險性或不適當之活動。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;7.七歲以下兒童須由家長陪同方可入內。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;8.請遵守使用規定及服務人員之操作說明與指導。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;9.本使用規定若有未盡事宜，得經由管理委員會會議決議修訂並公告實施。</p>\r\n', '6', '89.jpg', 's-108.jpg', '5', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('40', '', '鳳翔-空中健身中心', '1300', '2130', '<p>\r\n	<strong>鳳翔SKY GYM</strong><strong>空中健身中心使用規定</strong></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span class=\"Apple-style-span\" style=\"color: rgb(255, 0, 0); \"><strong>一、開放時間：週一至週五&nbsp; PM13:00 ～PM21:30&nbsp; 例假日AM10:00 ～ PM21:30</strong></span></p>\r\n<p style=\"margin-left:18.7pt;\">\r\n	&nbsp;</p>\r\n<p>\r\n	二、使用及付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 1.使用前向服務人員登記並以儲值卡扣抵消費收費。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; 2.</strong><strong>使用者住戶免費，非住戶每人每次100元，每人使用時限不得超過二小時。</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	三、使用規定：</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 1.使用對象：鳳翔會館住戶。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 2.使用前可預約申請，申請時按所需之時段，先後申請之次序排定，先到先排。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 3.請穿著運動服及乾淨球鞋並攜帶毛巾擦汗避免汗水滴落檯面影響衛生，方能入場使用。</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; 4.</strong><strong>未滿16歲及120公分以下之孩童，不得入內使用</strong><strong>。</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; 5.</strong><strong>除瓶裝飲用水外，禁止攜帶飲料或食物入內</strong><strong>。</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 6.使用前先做暖身運動十至十五分鐘。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 7.請勿在室內高聲喧嘩、奔跑。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 8.使用器材應避免碰撞，用畢後請歸回原處。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 9.請勿攜帶寵物進入。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;10.室內禁止吸煙。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;11.請愛惜公物，損壞公物照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 12.管理秘書得管制設施內之人數，額滿時得管制進出。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 13.請遵守使用規定及服務人員之操作說明與指導。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 14.本使用規定若有未盡事宜，得經由管理委員會會議決議修訂並公告實施。</p>\r\n', '2', '53.jpg', 's-106.jpg', '5', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('41', '', '鳳翔-景觀吧檯', '1300', '2130', '<p>\r\n	<strong>鳳翔景觀吧檯使用規定</strong></p>\r\n<p align=\"center\">\r\n	&nbsp;</p>\r\n<p>\r\n	一、開放時間：</p>\r\n<p>\r\n	<span style=\"color:#f00;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;1.</strong><strong>週一至週五&nbsp; PM13:00 ～PM21:30&nbsp; 例假日AM10:00 ～ PM21:30</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.委員會排定之社區活動時間內，本設施暫停開放。</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	二、使用付費方式：</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.本設施為開放式設施，凡具住戶資格者皆可<strong><span style=\"color:#f00;\">依餐飲價目表自行消費</span>。</strong></p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;2.金額採以儲值卡扣抵消費。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<p>\r\n	&nbsp;&nbsp; 三、服務注意事項</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;1.每日依開放時間提供各場所餐飲專送服務。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 2.對各項設施、設備及裝潢等，請注意維護及使用，如有損壞情形，請告知管理服務中心處理。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;3.使用期間請隨時保持環境整齊清潔，以利清潔維護工作。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 4.凡違反規定者，得勒令離開，並視情節輕重，報請管委會處理，停止其使用權一至四週。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;5.損壞任何設施或器材、桌椅者，應照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 6.非會員或其所帶之親友，及未經批准人員，服務人員得令其離開，不聽從勸告者，將依私自侵入報請警政機關處理。</p>\r\n', '3', '4.jpg', '', '5', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('42', '', '鳳翔-紅頂宴會廳', '1000', '2100', '<p>\r\n	<strong>鳳翔紅頂宴會廳使用規定</strong></p>\r\n<p align=\"center\">\r\n	&nbsp;</p>\r\n<p>\r\n	一、開放時間：</p>\r\n<p>\r\n	<span style=\"color:#f00;\">&nbsp;&nbsp; &nbsp; &nbsp; 1.<strong>預約制</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; 2.委員會排定之社區活動時間內，本設施暫停開放。</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	二、使用付費方式：</p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;1.</strong><strong>會議用：採預約制，每場次以3小時為限，酌收場地費1&cedil;500元；逾時以500元/小時收費，</strong></span></p>\r\n<p>\r\n	<span class=\"Apple-style-span\" style=\"color: rgb(255, 0, 0); \"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 不足1小時，以1小時計之。</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;2.</strong><strong>宴會用：採預約制，酌收場地費2&cedil;000元；逾時以700元/小時收費，</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;不足1小時，以1小時計之。</strong></span><span class=\"Apple-style-span\" style=\"color: rgb(255, 0, 0); \"><strong>&nbsp;&nbsp;(外燴使用廚房加收清潔費1&cedil;500元)</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp;3.</strong><strong>預訂桌(人)數須於宴會舉行前三日(72小時)確認，宴會開始至結束如未達預訂桌(人)數時，</strong></span></p>\r\n<p>\r\n	<span style=\"color:#f00;\"><strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 仍按原預訂桌(人)數之費用收費。</strong></span></p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; 4.宴會帳款請於宴會結束後，金額採儲值卡扣抵消費收費。</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	三、服務注意事項</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;1.對各項設施、設備及裝潢等，請注意維護及使用，如有損壞情形，請告知管理服務中心處理。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;2.使用期間請隨時保持環境整齊清潔，以利清潔維護工作。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;3.凡違反規定者，得勒令離開，並視情節輕重，報請管委會處理，停止其使用權一至四週。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;4.損壞任何設施或器材、桌椅者，應照價賠償。</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp;5.非會員或其所帶之親友，及未經批准人員，服務人員得令其離開，不聽從勸告者，</p>\r\n<p>\r\n	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;將依私自侵入報請警政機關處理。</p>\r\n', '3', '54.jpg', 's-109.jpg', '5', '0', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('149', 'df', 'df', '44', '44', '', '4', '.jpg', '', '93', '1', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('150', '3211', '阿花糖果屋', '0200', '0300', '<p>\n	特惠活動唷!!</p>\n', '5', '3211.jpg', '', '91', '1', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('151', '0211', '宏添-養身旅館', '1200', '1300', '<p>\r\n	fggs 丁丁新開的店 &nbsp;開幕期間有打折唷123</p>\r\n', '10', '0211.jpg', '', '4', '-1', '', '0000-00-00 00:00:00', '');
INSERT INTO `data_facility` VALUES ('152', '112', '112', '0200', '0300', '<p>\n	ddsdd</p>\n', '1', '-', '', '93', '0', '', '2011-02-25 17:49:34', '社區經理');
INSERT INTO `data_facility` VALUES ('159', '12346', '12345', '', '', '', '0', '.jpg', '', '1', '-1', '', '2011-11-05 11:49:59', '社區經理');
INSERT INTO `data_facility` VALUES ('160', '1003', '987654', '3600', '8500', '', '1', '-', '', '0', '-1', '', '2011-11-11 09:36:55', '社區經理');
INSERT INTO `data_facility` VALUES ('161', '1004', '213546', '9600', '8500', '', '0', '-', '', '0', '-1', '', '2011-11-11 09:37:59', '社區經理');

-- ----------------------------
-- Table structure for `data_item`
-- ----------------------------
DROP TABLE IF EXISTS `data_item`;
CREATE TABLE `data_item` (
  `item_id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品序號',
  `item_no` varchar(16) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品編號',
  `item_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品名稱',
  `item_price` float(8,2) NOT NULL COMMENT '商品價格',
  `item_class` int(11) DEFAULT NULL COMMENT '商品類別',
  `item_vender` int(11) DEFAULT NULL COMMENT '廠商',
  `item_brand` int(11) DEFAULT NULL COMMENT '品牌',
  `item_point` float(6,0) NOT NULL COMMENT '點數',
  `item_image` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '圖片',
  `item_show` tinyint(1) NOT NULL COMMENT '顯示',
  `item_discount` tinyint(1) NOT NULL COMMENT '折扣',
  `item_upprice` tinyint(1) NOT NULL COMMENT '改價',
  `item_service` tinyint(1) NOT NULL COMMENT '服務',
  `item_selltax` tinyint(1) NOT NULL COMMENT '銷售計稅',
  `item_outputlist` tinyint(1) NOT NULL COMMENT '出單',
  `item_label` tinyint(1) NOT NULL COMMENT '標籤',
  `item_barcode` varchar(13) COLLATE utf8_unicode_ci NOT NULL COMMENT '原印條碼',
  `item_cost` float(8,2) NOT NULL COMMENT '進價',
  `item_saleprice1` float(8,2) NOT NULL COMMENT '售價1',
  `item_saleprice2` float(8,2) NOT NULL COMMENT '售價2',
  `item_saleprice3` float(8,2) NOT NULL COMMENT '售價3',
  `item_avgcost` float(8,2) NOT NULL COMMENT '平均成本',
  `item_stock` float(4,2) NOT NULL COMMENT '庫存量',
  `item_location` varchar(14) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '貨架位置',
  `item_donate` float(4,0) NOT NULL COMMENT '健康捐',
  `item_style` text CHARACTER SET utf8,
  `item_remark` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `udate` datetime NOT NULL COMMENT '修改時間',
  `uby` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  `ordering` int(10) unsigned NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `item_no` (`item_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品資料表';

-- ----------------------------
-- Records of data_item
-- ----------------------------
INSERT INTO `data_item` VALUES ('236', '0001', '可口可樂', '24.00', '86', '35', '0', '20', '-', '1', '1', '1', '0', '1', '0', '0', '4710999888', '20.00', '25.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:05:18', '社區經理', '1');
INSERT INTO `data_item` VALUES ('237', '00002', '雪碧', '24.00', '84', '36', '0', '0', '-', '1', '1', '1', '0', '1', '0', '0', '2222', '20.00', '25.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:12:23', '社區經理', '2');
INSERT INTO `data_item` VALUES ('238', '00003', '可口可樂-零熱量', '24.00', '84', '35', '0', '0', '-', '1', '1', '1', '0', '1', '0', '0', '888', '20.00', '25.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:13:13', '社區經理', '3');
INSERT INTO `data_item` VALUES ('239', '00004', '每招健康', '17.00', '84', '38', '0', '0', '-', '1', '1', '1', '0', '1', '0', '0', '999', '17.00', '20.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:14:52', '社區經理', '4');
INSERT INTO `data_item` VALUES ('240', '00007', '黑松沙士', '24.00', '84', '36', '0', '0', '-', '1', '1', '1', '0', '1', '0', '0', '', '20.00', '25.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:15:30', '社區經理', '5');
INSERT INTO `data_item` VALUES ('241', '00006', '分解茶', '20.00', '84', '38', '0', '0', '-', '1', '1', '1', '0', '1', '0', '0', '', '21.00', '25.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:16:13', '社區經理', '6');
INSERT INTO `data_item` VALUES ('242', '00020', '可樂果', '15.00', '85', '43', '0', '0', '-', '1', '1', '1', '0', '1', '0', '0', '', '15.00', '20.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:17:26', '社區經理', '7');
INSERT INTO `data_item` VALUES ('243', '000022', '巧克力酥片(12)', '110.00', '85', '43', '0', '0', '-', '1', '1', '1', '0', '1', '0', '0', '', '115.00', '120.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:19:02', '社區經理', '8');
INSERT INTO `data_item` VALUES ('244', '00023', '地瓜酥(12)', '250.00', '85', '43', '0', '0', '-', '1', '1', '1', '0', '1', '0', '0', '', '240.00', '300.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:19:57', '社區經理', '9');
INSERT INTO `data_item` VALUES ('245', '00031', '墨西哥咖啡豆', '35.00', '86', '41', '0', '0', '-', '1', '1', '1', '0', '1', '0', '0', '', '30.00', '40.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:21:01', '社區經理', '10');
INSERT INTO `data_item` VALUES ('246', '00032', '美國咖啡豆', '30.00', '86', '41', '0', '0', '-', '1', '1', '1', '0', '1', '0', '0', '', '30.00', '50.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:22:02', '社區經理', '11');
INSERT INTO `data_item` VALUES ('247', '00033', '拿鐵咖啡豆', '45.00', '86', '41', '0', '0', '-', '1', '1', '1', '0', '1', '0', '0', '', '40.00', '55.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:22:47', '社區經理', '12');
INSERT INTO `data_item` VALUES ('248', '00040', '芭樂汁', '30.00', '87', '40', '0', '0', '-', '1', '1', '1', '0', '1', '0', '0', '', '35.00', '40.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:24:31', '社區經理', '13');
INSERT INTO `data_item` VALUES ('249', '00041', '柳橙汁', '40.00', '87', '40', '0', '0', '-', '1', '1', '1', '0', '1', '0', '0', '', '0.00', '45.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:24:44', '社區經理', '14');
INSERT INTO `data_item` VALUES ('250', '00042', '芒果汁', '42.00', '87', '40', '0', '0', '-', '1', '1', '1', '0', '1', '0', '0', '', '0.00', '50.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:25:07', '社區經理', '15');
INSERT INTO `data_item` VALUES ('251', '00051', '沙茶醬', '149.00', '90', '44', '0', '0', '-', '1', '1', '1', '0', '1', '0', '0', '', '0.00', '159.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:25:46', '社區經理', '16');
INSERT INTO `data_item` VALUES ('252', '00052', '辣椒醬', '150.00', '90', '44', '0', '0', '-', '1', '1', '1', '0', '1', '0', '0', '', '0.00', '169.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:26:08', '社區經理', '17');
INSERT INTO `data_item` VALUES ('253', '00061', '月氏礦泉水', '199.00', '88', '42', '0', '0', '-', '1', '1', '1', '0', '1', '0', '0', '', '0.00', '219.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:26:42', '社區經理', '18');
INSERT INTO `data_item` VALUES ('254', '00062', '清靜好水', '129.00', '88', '42', '0', '0', '-', '1', '1', '1', '0', '1', '0', '0', '', '0.00', '139.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:27:34', '社區經理', '19');
INSERT INTO `data_item` VALUES ('255', '00071', '茗賢情', '50.00', '89', '38', '0', '0', '-', '1', '1', '1', '0', '1', '0', '0', '', '0.00', '99.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:30:46', '社區經理', '20');
INSERT INTO `data_item` VALUES ('256', '00072', '杏仁燕麥', '150.00', '89', '38', '38', '0', '-', '1', '1', '1', '0', '1', '0', '0', '', '149.00', '169.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:31:23', '社區經理', '21');
INSERT INTO `data_item` VALUES ('257', '00081', '棒球', '25.00', '96', '37', '38', '0', '-', '1', '1', '1', '0', '1', '0', '0', '', '20.00', '30.00', '25.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:33:29', '社區經理', '22');
INSERT INTO `data_item` VALUES ('258', '00082', '球棒', '299.00', '96', '37', '38', '0', '-', '1', '1', '1', '0', '1', '0', '0', '', '0.00', '349.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:34:03', '社區經理', '23');
INSERT INTO `data_item` VALUES ('259', '00083', '手套', '599.00', '96', '37', '39', '0', '-', '1', '1', '1', '0', '1', '0', '0', '', '500.00', '649.00', '600.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:34:28', '社區經理', '24');
INSERT INTO `data_item` VALUES ('260', '00084', '足球', '699.00', '96', '37', '38', '0', '-', '1', '1', '1', '0', '1', '0', '0', '', '0.00', '759.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:35:03', '社區經理', '25');
INSERT INTO `data_item` VALUES ('261', '00091', '紅棗', '899.00', '92', '39', '39', '0', '-', '1', '1', '1', '0', '1', '0', '0', '', '0.00', '950.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:36:30', '社區經理', '26');
INSERT INTO `data_item` VALUES ('262', '00092', '紅趜', '459.00', '92', '39', '38', '0', '-', '1', '1', '1', '0', '1', '0', '0', '', '0.00', '559.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 10:37:10', '社區經理', '27');
INSERT INTO `data_item` VALUES ('263', '00093', '人參', '999.00', '92', '39', '0', '0', '-', '1', '1', '1', '0', '0', '0', '0', '00099', '0.00', '1299.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 11:03:07', '社區經理', '28');
INSERT INTO `data_item` VALUES ('264', '00094', '冬蟲夏草', '999.00', '92', '39', '0', '0', '-', '1', '1', '1', '0', '0', '0', '0', '', '0.00', '1199.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-14 12:09:42', '社區經理', '29');
INSERT INTO `data_item` VALUES ('265', '00024', '玉蜀黍', '25.00', '85', '43', '0', '0', '-', '1', '1', '1', '0', '0', '0', '0', '', '0.00', '30.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-23 13:15:02', '社區經理', '30');
INSERT INTO `data_item` VALUES ('266', '00025', '義美小泡芙', '69.00', '85', '43', '0', '0', '-', '1', '1', '1', '0', '0', '0', '0', '', '0.00', '79.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2011-12-23 13:21:08', '社區經理', '31');
INSERT INTO `data_item` VALUES ('267', '00126', '數位相機', '6888.00', '97', '45', '38', '0', '-', '1', '1', '1', '1', '0', '0', '0', '', '0.00', '6500.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '123', '2012-01-03 15:48:59', '社區經理', '32');
INSERT INTO `data_item` VALUES ('268', '00128', '滯慧型手機', '7878.00', '97', '45', '0', '0', '.jpg', '0', '0', '0', '1', '1', '3', '0', '', '0.00', '8900.00', '0.00', '0.00', '0.00', '0.00', null, '0', null, '', '2012-01-03 15:50:42', '社區經理', '33');

-- ----------------------------
-- Table structure for `data_job`
-- ----------------------------
DROP TABLE IF EXISTS `data_job`;
CREATE TABLE `data_job` (
  `job_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `job_level` int(3) unsigned NOT NULL,
  `job_description` varchar(12) COLLATE utf8_unicode_ci DEFAULT '',
  `establishdate` datetime DEFAULT NULL COMMENT '建立時間',
  `udate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `uby` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`job_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of data_job
-- ----------------------------
INSERT INTO `data_job` VALUES ('1', '0', '超級管理員', '2011-12-28 00:00:00', '2011-12-28 16:08:04', '社區經理');
INSERT INTO `data_job` VALUES ('2', '1', '經理', '2011-12-28 00:00:00', '2011-12-28 16:08:40', '社區經理');
INSERT INTO `data_job` VALUES ('3', '2', '員工', '2011-12-28 00:00:00', '2011-12-28 16:10:37', '社區經理');

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

-- ----------------------------
-- Table structure for `data_remarkassoc`
-- ----------------------------
DROP TABLE IF EXISTS `data_remarkassoc`;
CREATE TABLE `data_remarkassoc` (
  `remarkassoc_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `remark_id` int(20) unsigned NOT NULL,
  `remarkassoc_tbid` int(20) unsigned NOT NULL,
  `remarkassoc_tbname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`remarkassoc_id`)
) ENGINE=MyISAM AUTO_INCREMENT=579 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of data_remarkassoc
-- ----------------------------
INSERT INTO `data_remarkassoc` VALUES ('22', '13', '51', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('23', '13', '52', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('24', '13', '53', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('403', '15', '42', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('397', '20', '51', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('206', '9', '18', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('68', '11', '18', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('71', '11', '47', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('505', '15', '73', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('194', '19', '46', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('87', '9', '16', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('186', '19', '16', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('187', '19', '18', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('188', '19', '20', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('504', '20', '73', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('191', '19', '47', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('192', '19', '50', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('500', '8', '47', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('501', '8', '46', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('502', '8', '73', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('503', '19', '73', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('404', '15', '47', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('417', '9', '19', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('418', '11', '42', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('496', '8', '16', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('497', '8', '18', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('498', '8', '19', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('499', '8', '20', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('448', '14', '20', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('447', '14', '46', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('446', '12', '18', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('445', '12', '16', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('568', '8', '95', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('569', '8', '94', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('511', '9', '95', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('512', '11', '89', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('513', '11', '87', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('514', '11', '86', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('515', '11', '84', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('516', '14', '95', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('517', '15', '96', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('518', '15', '94', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('519', '15', '93', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('520', '19', '90', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('521', '19', '91', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('576', '8', '85', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('577', '8', '86', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('575', '8', '88', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('574', '8', '87', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('573', '8', '89', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('570', '8', '93', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('571', '8', '91', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('572', '8', '90', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('567', '8', '96', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('566', '8', '92', 'data_class');
INSERT INTO `data_remarkassoc` VALUES ('578', '8', '84', 'data_class');

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

-- ----------------------------
-- Table structure for `data_station`
-- ----------------------------
DROP TABLE IF EXISTS `data_station`;
CREATE TABLE `data_station` (
  `station_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(20) unsigned NOT NULL,
  `station_no` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `station_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT '127.0.0.1',
  `udate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uby` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of data_station
-- ----------------------------
INSERT INTO `data_station` VALUES ('12', '1', '01', '127.0.0.1', '2011-12-12 17:33:12', '社區經理');
INSERT INTO `data_station` VALUES ('13', '1', '02', '127.0.0.1', '2011-12-10 01:22:53', 'ZDN');
INSERT INTO `data_station` VALUES ('14', '1', '03', '127.0.0.1', '2011-12-10 01:22:54', 'ZDN');
INSERT INTO `data_station` VALUES ('15', '1', '04', '127.0.0.1', '2011-12-10 01:22:56', 'ZDN');

-- ----------------------------
-- Table structure for `data_StationSetting`
-- ----------------------------
DROP TABLE IF EXISTS `data_StationSetting`;
CREATE TABLE `data_StationSetting` (
  `setting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `station_id` int(20) unsigned NOT NULL,
  `default_loading_Group` int(11) DEFAULT '0',
  `default_database` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'server',
  `item_default_price` int(3) DEFAULT '1' COMMENT '商品預設售價',
  `item_default_discountable` tinyint(1) DEFAULT '0' COMMENT '商品自動折扣',
  `item_default_discount` float DEFAULT '0.15' COMMENT '商品折扣',
  `purchase_default_allowable_allowance` tinyint(1) DEFAULT '1',
  `table_autoStart` tinyint(1) DEFAULT '1',
  `sales_taxrate` float DEFAULT '0.05' COMMENT '稅率',
  `curid` int(11) DEFAULT '1' COMMENT '錢幣索引',
  `rate_id` int(11) DEFAULT '1' COMMENT '匯率索引',
  `tip` float DEFAULT '0.1' COMMENT '服務費率',
  `point_gain_rate` float DEFAULT '0.3' COMMENT '金額換取點數',
  `point_rate` float DEFAULT '0.33' COMMENT '點數換取金額',
  `sales_max` int(11) DEFAULT '99999999' COMMENT '單筆輸入上限',
  `isalelength` int(11) DEFAULT '10' COMMENT '品名長度限制',
  `calculation` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'round',
  `quantity_round_off_to_the_n_decimal_place` int(11) DEFAULT '0' COMMENT '數量取小數第幾位',
  `amount_round_off_to_the_n_decimal_place` int(11) DEFAULT '0' COMMENT '總額取小數第幾位',
  `customer_birth_status` int(11) DEFAULT '0' COMMENT '顧客生日狀態',
  `prowill_title` varchar(60) COLLATE utf8_unicode_ci DEFAULT 'ZDPOS門市管理系統',
  PRIMARY KEY (`setting_id`),
  KEY `station_id` (`station_id`),
  CONSTRAINT `data_StationSetting_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `data_station` (`station_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of data_StationSetting
-- ----------------------------
INSERT INTO `data_StationSetting` VALUES ('1', '12', '0', 'server', '1', '0', '0.85', '1', '1', '0.05', '1', '1', '0.1', '0.3', '0.33', '99999999', '10', 'round', '0', '0', '0', 'ZDPOS門市管理系統');
INSERT INTO `data_StationSetting` VALUES ('2', '13', '0', 'server', '1', '0', '0.85', '1', '1', '0.05', '1', '1', '0.1', '0.3', '0.33', '99999999', '10', 'round', '0', '0', '0', 'ZDPOS門市管理系統');
INSERT INTO `data_StationSetting` VALUES ('3', '14', '0', 'server', '1', '0', '0.85', '1', '1', '0.05', '1', '1', '0.1', '0.3', '0.33', '99999999', '10', 'round', '0', '0', '0', 'ZDPOS門市管理系統');
INSERT INTO `data_StationSetting` VALUES ('4', '15', '0', 'server', '1', '0', '0.85', '1', '1', '0.05', '1', '1', '0.1', '0.3', '0.33', '99999999', '10', 'round', '0', '0', '0', 'ZDPOS門市管理系統');

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

-- ----------------------------
-- Table structure for `data_vender`
-- ----------------------------
DROP TABLE IF EXISTS `data_vender`;
CREATE TABLE `data_vender` (
  `vender_id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引',
  `vender_no` varchar(6) COLLATE utf8_unicode_ci NOT NULL COMMENT '廠商編號',
  `vender_name` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '廠商名稱',
  `vender_tel` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '電話',
  `vender_fax` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '傳真',
  `vender_address` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '地址',
  `vender_email` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'email',
  `vender_taxid` int(8) NOT NULL COMMENT '統一編號',
  `vender_contact` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT '聯絡人',
  `vender_remark` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `udate` datetime NOT NULL COMMENT '修改人',
  `uby` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改時間',
  PRIMARY KEY (`vender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='供應商資料表';

-- ----------------------------
-- Records of data_vender
-- ----------------------------
INSERT INTO `data_vender` VALUES ('35', '001', '可口可樂', '0988854564', '', '', '', '0', '', '', '2011-12-14 10:39:06', '社區經理');
INSERT INTO `data_vender` VALUES ('36', '002', '黑松企業', '', '', '', '', '0', '', '', '2011-12-14 10:39:21', '社區經理');
INSERT INTO `data_vender` VALUES ('37', '003', '大辱閣', '', '', '', '', '0', '', '', '2011-12-14 10:39:33', '社區經理');
INSERT INTO `data_vender` VALUES ('38', '004', '品茶', '', '', '', '', '0', '', '', '2011-12-14 10:39:45', '社區經理');
INSERT INTO `data_vender` VALUES ('39', '005', '康健生機', '', '', '', '', '0', '', '', '2011-12-14 10:40:16', '社區經理');
INSERT INTO `data_vender` VALUES ('40', '006', '光泉', '', '', '', '', '0', '', '', '2011-12-14 10:40:36', '社區經理');
INSERT INTO `data_vender` VALUES ('41', '007', '卡塔', '', '', '', '', '0', '', '', '2011-12-14 10:41:16', '社區經理');
INSERT INTO `data_vender` VALUES ('42', '008', '月事', '', '', '', '', '0', '', '', '2011-12-14 10:41:45', '社區經理');
INSERT INTO `data_vender` VALUES ('43', '009', '盛香真', '', '', '', '', '0', '', '', '2011-12-14 10:42:38', '社區經理');
INSERT INTO `data_vender` VALUES ('44', '010', '牛頭牌', '', '', '', '', '0', '', '', '2011-12-14 11:00:47', '社區經理');
INSERT INTO `data_vender` VALUES ('45', '011', 'SAMSUNG', '0978666666', '0965454645', '', '', '0', '', '', '2012-01-03 16:26:00', '社區經理');
INSERT INTO `data_vender` VALUES ('47', '000', '黑新工業', '', '', '', '', '0', '', '', '2012-01-07 12:49:38', '社區經理');

-- ----------------------------
-- Table structure for `ip`
-- ----------------------------
DROP TABLE IF EXISTS `ip`;
CREATE TABLE `ip` (
  `index` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` varchar(0) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `mac` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`index`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ip
-- ----------------------------
INSERT INTO `ip` VALUES ('25', '', '', '', '', '');
INSERT INTO `ip` VALUES ('26', '', '', '', '', '');
INSERT INTO `ip` VALUES ('27', '', '', '', '', '');
INSERT INTO `ip` VALUES ('28', '', '', '', '', '');
INSERT INTO `ip` VALUES ('29', '', '', '', '', '');
INSERT INTO `ip` VALUES ('30', '', '', '', '', '');
INSERT INTO `ip` VALUES ('31', '', '', '', '', '');
INSERT INTO `ip` VALUES ('32', '', '', '', '', '');
INSERT INTO `ip` VALUES ('33', '', '', '', '', '');
INSERT INTO `ip` VALUES ('34', '', '', '', '', '');
INSERT INTO `ip` VALUES ('35', '', '', '', '', '');
INSERT INTO `ip` VALUES ('36', '', '', '', '', '');
INSERT INTO `ip` VALUES ('37', '', '', '', '', '');
INSERT INTO `ip` VALUES ('38', '', '', '', '', '');
INSERT INTO `ip` VALUES ('39', '', '', '', '', '');
INSERT INTO `ip` VALUES ('40', '', '', '', '', '');
INSERT INTO `ip` VALUES ('41', '', '', '', '', '');
INSERT INTO `ip` VALUES ('42', '', '', '', '', '');
INSERT INTO `ip` VALUES ('43', '', '', '', '', '');
INSERT INTO `ip` VALUES ('44', '', '', '', '', '');
INSERT INTO `ip` VALUES ('45', '', '', '', '', '');
INSERT INTO `ip` VALUES ('46', '', '', '', '', '');
INSERT INTO `ip` VALUES ('47', '', '', '', '', 'Asda');
INSERT INTO `ip` VALUES ('48', '', '', '', '', 'Asda');
INSERT INTO `ip` VALUES ('49', null, '', '', '', 'Asda');
INSERT INTO `ip` VALUES ('50', null, '', '', '', 'Asda');
INSERT INTO `ip` VALUES ('51', null, '', '', '', 'Asda');
INSERT INTO `ip` VALUES ('52', null, '', '192.168.2.10', '44-87-FC-8C-95-27', 'Asda');
INSERT INTO `ip` VALUES ('53', null, '', '192.168.2.10', '44-87-FC-8C-95-27', 'Asda');
INSERT INTO `ip` VALUES ('54', null, '', '192.168.2.10', '44-87-FC-8C-95-27', 'Asda');
INSERT INTO `ip` VALUES ('55', null, '', '192.168.2.10', '44-87-FC-8C-95-27', 'Asda');
INSERT INTO `ip` VALUES ('56', null, '', '192.168.2.11', '40-61-86-F2-18-B6', 'Asda');
INSERT INTO `ip` VALUES ('57', null, '', '192.168.2.15', '40-61-86-0B-18-FC', 'Asda');
INSERT INTO `ip` VALUES ('58', null, '', '192.168.2.15', '40-61-86-0B-18-FC', 'Asda');

-- ----------------------------
-- Table structure for `job_assoc`
-- ----------------------------
DROP TABLE IF EXISTS `job_assoc`;
CREATE TABLE `job_assoc` (
  `job_assoc_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `job_level` int(8) unsigned NOT NULL,
  `permission_id` int(20) unsigned NOT NULL,
  `establishdate` datetime DEFAULT NULL COMMENT '建立時間',
  `udate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `uby` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`job_assoc_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of job_assoc
-- ----------------------------
INSERT INTO `job_assoc` VALUES ('1', '0', '1', '2011-12-29 00:00:00', '2011-12-29 09:28:07', '社區經理');
INSERT INTO `job_assoc` VALUES ('2', '0', '2', '2011-12-29 00:00:00', '2011-12-29 09:28:20', '社區經理');
INSERT INTO `job_assoc` VALUES ('3', '0', '3', '2011-12-29 00:00:00', '2011-12-29 09:28:21', '社區經理');
INSERT INTO `job_assoc` VALUES ('4', '0', '4', '2011-12-29 00:00:00', '2011-12-29 09:28:22', '社區經理');
INSERT INTO `job_assoc` VALUES ('5', '0', '5', '2011-12-29 00:00:00', '2011-12-29 09:28:22', '社區經理');
INSERT INTO `job_assoc` VALUES ('6', '0', '6', '2011-12-29 00:00:00', '2011-12-29 09:28:23', '社區經理');
INSERT INTO `job_assoc` VALUES ('7', '0', '7', '2011-12-29 00:00:00', '2011-12-29 09:28:26', '社區經理');

-- ----------------------------
-- Table structure for `loga1`
-- ----------------------------
DROP TABLE IF EXISTS `loga1`;
CREATE TABLE `loga1` (
  `Id` longtext NOT NULL,
  `onoff` varchar(32) NOT NULL,
  `state` int(11) NOT NULL,
  KEY `Id` (`Id`(20))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loga1
-- ----------------------------

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(10) unsigned DEFAULT '0',
  `parent_id` int(10) unsigned DEFAULT '0',
  `access` tinyint(3) unsigned DEFAULT NULL,
  `ordering` int(10) unsigned DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `display` tinyint(1) unsigned DEFAULT '1',
  `position` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', 'menu_data', '基本資料', 'nav', 'data/', 'data', '#', '0', '1', '0', '0', null, '2011-04-04 17:46:59', '1', '');
INSERT INTO `menu` VALUES ('2', 'menu_data_class', '類別資料：依照商品的屬性訂定商品分類或主題。', 'subnav', 'data/class/', 'data.class', 'index.php', '1', '1', '0', '1', null, '2011-04-04 17:52:20', '1', 'start');
INSERT INTO `menu` VALUES ('3', 'menu_data_brand', '品牌資料：用於識別某個或某群銷售者的商品，並與其它的商品做區別，通常為廠商名稱和標誌。', 'subnav', 'data/brand/', 'data.brand', 'index.php', '1', '1', '0', '3', null, '2011-04-04 18:06:03', '1', '');
INSERT INTO `menu` VALUES ('4', 'menu_data_item', '商品資料：建立商品的基本資料，作為進貨、銷貨、存貨等行為之依據。', 'subnav', 'data/item/', 'data.item', 'index.php', '1', '1', '0', '4', null, '2011-04-04 18:06:03', '1', '');
INSERT INTO `menu` VALUES ('5', 'menu_data_cusgrp', '群組資料：依據相同性質、屬性將商品組織在一起。', 'subnav', 'data/cusgrp/', 'data.cusgrp', 'index.php', '1', '1', '0', '5', null, '2011-04-04 18:06:03', '1', '');
INSERT INTO `menu` VALUES ('6', 'menu_data_customer', '客戶資料：建立消費者的基本資料，依據顧客的特質作為銷售行為的參考。', 'subnav', 'data/customer/', 'data.customer', 'index.php', '1', '1', '0', '6', null, '2011-04-04 18:06:03', '1', '');
INSERT INTO `menu` VALUES ('7', 'menu_data_vender', '廠商資料', 'subnav', 'data/vender/', 'data.vender', 'index.php', '1', '1', '0', '2', null, '2011-04-04 18:06:03', '1', '');
INSERT INTO `menu` VALUES ('8', 'menu_data_employee', '員工資料', 'subnav', 'data/employee/', 'data.employee', 'index.php', '1', '1', '0', '7', null, '2011-04-04 18:06:03', '1', '');
INSERT INTO `menu` VALUES ('9', 'menu_data_table', '桌號資料', 'subnav', 'data/table/', 'data.table', 'index.php', '1', '1', '0', '8', null, '2011-04-04 18:06:03', '1', '');
INSERT INTO `menu` VALUES ('10', 'menu_data_store', '店別資料', 'subnav', 'data/store/', 'data.store', 'index.php', '1', '1', '0', '9', null, '2011-04-04 18:06:03', '1', '');
INSERT INTO `menu` VALUES ('11', 'menu_data_facility', '設施資料', 'subnav', 'data/facility/', 'data.facility', 'index.php', '1', '1', '0', '10', null, '2011-04-04 18:06:03', '1', '');
INSERT INTO `menu` VALUES ('13', 'menu_data_remark', '備註資料', 'subnav', 'data/remark/', 'data.remark', 'index.php', '1', '1', '0', '12', null, '2011-04-04 18:06:03', '1', 'end');
INSERT INTO `menu` VALUES ('14', 'menu_pp', '進退貨作業', 'nav', 'purchase/', 'purchase', '#', '0', '14', '0', '0', null, '2011-04-04 18:18:13', '1', '');
INSERT INTO `menu` VALUES ('15', 'menu_pp_purchase_input', '進貨輸入', 'subnav', 'purchase/receipt/input/', 'purchase.input', 'index.php', '1', '14', '0', '1', null, '2011-04-04 18:18:13', '1', 'start');
INSERT INTO `menu` VALUES ('16', 'menu_pp_purchase_receipt', '進貨單據', 'subnav', 'purchase/receipt/order/', 'purchase.order', 'index.php', '1', '14', '0', '2', null, '2011-04-04 22:17:28', '1', '');
INSERT INTO `menu` VALUES ('18', 'menu_pp_purchase_summary', '進貨統計', 'subnav', 'purchase/receipt/summary/', 'purchase.summary', 'index.php', '1', '14', '0', '4', null, '2011-04-04 22:17:29', '1', '');
INSERT INTO `menu` VALUES ('19', 'menu_pp_preturn_input', '退貨輸入', 'subnav', 'purchase/return/input/', 'preturn.input', 'index.php', '1', '14', '0', '5', null, '2011-04-04 22:17:29', '1', '');
INSERT INTO `menu` VALUES ('20', 'menu_pp_preturn_receipt', '退貨單據', 'subnav', 'purchase/return/order/', 'preturn.order', 'index.php', '1', '14', '0', '6', null, '2011-04-04 22:17:29', '1', '');
INSERT INTO `menu` VALUES ('22', 'menu_pp_preturn_summary', '退貨統計', 'subnav', 'purchase/return/summary/', 'preturn.summary', 'index.php', '1', '14', '0', '8', null, '2011-04-04 22:17:29', '1', 'end');
INSERT INTO `menu` VALUES ('23', 'menu_stock', '庫存作業', 'nav', 'stock/', 'stock', '#', '0', '23', '0', '0', null, '2011-04-04 22:46:42', '1', '');
INSERT INTO `menu` VALUES ('24', 'menu_stock_stock_search', '庫存查詢', 'subnav', 'stock/stock_search/', 'stock.search', 'index.php', '1', '23', '0', '1', null, '2011-04-04 22:46:43', '1', 'start');
INSERT INTO `menu` VALUES ('25', 'menu_stock_inventory_input', '盤點輸入', 'subnav', 'stock/inventory_input/', 'stock.input', 'index.php', '1', '23', '0', '3', null, '2011-04-04 22:46:43', '1', '');
INSERT INTO `menu` VALUES ('26', 'menu_stock_inventory_difference', '盤差查詢', 'subnav', 'stock/inventory_difference/', 'stock.difference', 'index.php', '1', '23', '0', '4', null, '2011-04-04 22:46:43', '1', '');
INSERT INTO `menu` VALUES ('27', 'menu_stock_inventory_turn', '盤點轉入', 'subnav', 'stock/inventory_turn/', 'stock.turn', 'index.php', '1', '23', '0', '5', null, '2011-04-04 22:46:43', '1', 'end');
INSERT INTO `menu` VALUES ('28', 'menu_statistics', '銷售統計', 'nav', 'statistics/', 'statistics', '#', '0', '28', '0', '0', null, '2011-04-04 22:46:43', '1', '');
INSERT INTO `menu` VALUES ('30', 'menu_statistics_item', '商品統計', 'subnav', 'statistics/item/', 'statistics.item', 'index.php', '1', '28', '0', '1', null, '2011-04-04 22:46:43', '1', 'start');
INSERT INTO `menu` VALUES ('31', 'menu_statistics_customer', '客戶統計', 'subnav', 'statistics/customer/', 'statistics.customer', 'index.php', '1', '28', '0', '5', null, '2011-04-04 22:46:43', '1', '');
INSERT INTO `menu` VALUES ('32', 'menu_statistics_vender', '廠商統計', 'subnav', 'statistics/vender/', 'statistics.vender', 'index.php', '1', '28', '0', '3', null, '2011-04-04 22:46:43', '1', '');
INSERT INTO `menu` VALUES ('33', 'menu_statistics_employee', '員工統計', 'subnav', 'statistics/employee/', 'statistics.employee', 'index.php', '1', '28', '0', '4', null, '2011-04-04 22:46:43', '1', '');
INSERT INTO `menu` VALUES ('34', 'menu_statistics_timing', '時段統計', 'subnav', 'statistics/timing/', 'statistics.timing', 'index.php', '1', '28', '0', '6', null, '2011-04-04 22:46:43', '1', '');
INSERT INTO `menu` VALUES ('35', 'menu_statistics_station', '站號統計', 'subnav', 'statistics/station/', 'statistics.station', 'index.php', '1', '28', '0', '7', null, '2011-04-04 22:46:43', '1', '');
INSERT INTO `menu` VALUES ('36', 'menu_statistics_trade', '交易統計', 'subnav', 'statistics/trade/', 'statistics.trade', 'index.php', '1', '28', '0', '8', null, '2011-04-04 22:46:43', '1', '');
INSERT INTO `menu` VALUES ('37', 'menu_statistics_detail', '明細統計', 'subnav', 'statistics/detail/', 'statistics.detail', 'index.php', '1', '28', '0', '9', null, '2011-04-04 22:46:43', '1', '');
INSERT INTO `menu` VALUES ('38', 'menu_statistics_payment', '付款統計', 'subnav', 'statistics/payment/', 'statistics.payment', 'index.php', '1', '28', '0', '10', null, '2011-04-04 22:46:43', '1', 'end');
INSERT INTO `menu` VALUES ('39', 'menu_analysis', '銷售分析', 'nav', 'analysis/', 'analysis', '#', '0', '39', '0', '0', null, '2011-04-04 23:17:56', '1', '');
INSERT INTO `menu` VALUES ('40', 'menu_analysis_month', '月分析表', 'subnav', 'analysis/month/', 'analysis.month', 'index.php', '1', '39', '0', '1', null, '2011-04-04 23:17:56', '1', 'start');
INSERT INTO `menu` VALUES ('41', 'menu_analysis_week', '周分析表', 'subnav', 'analysis/week/', 'analysis.week', 'index.php', '1', '39', '0', '2', null, '2011-04-04 23:17:56', '1', '');
INSERT INTO `menu` VALUES ('42', 'menu_analysis_day', '日分析表', 'subnav', 'analysis/day/', 'analysis.day', 'index.php', '1', '39', '0', '3', null, '2011-04-04 23:17:56', '1', '');
INSERT INTO `menu` VALUES ('43', 'menu_analysis_profit_class', '類別毛利', 'subnav', 'analysis/profit_class/', 'analysis.profit_class', 'index.php', '1', '39', '0', '4', null, '2011-04-04 23:17:56', '1', '');
INSERT INTO `menu` VALUES ('44', 'menu_analysis_profit_item', '商品毛利', 'subnav', 'analysis/profit_item/', 'analysis.profit_item', 'index.php', '1', '39', '0', '5', null, '2011-04-04 23:17:56', '1', '');
INSERT INTO `menu` VALUES ('45', 'menu_analysis_profit_vender', '廠商毛利', 'subnav', 'analysis/profit_vender/', 'analysis.profit_vender', 'index.php', '1', '39', '0', '6', null, '2011-04-04 23:17:56', '1', '');
INSERT INTO `menu` VALUES ('46', 'menu_analysis_invalid', '作廢紀錄', 'subnav', 'analysis/invalid/', 'analysis.invalid', 'index.php', '1', '39', '0', '7', null, '2011-04-04 23:17:56', '1', '');
INSERT INTO `menu` VALUES ('47', 'menu_analysis_report', '營業日報', 'subnav', 'analysis/report/', 'analysis.report', 'index.php', '1', '39', '0', '8', null, '2011-04-04 23:17:56', '1', 'end');
INSERT INTO `menu` VALUES ('48', 'menu_addition', '附加功能', 'nav', 'addition/', 'addition', '#', '0', '48', '0', '0', null, '2011-04-04 23:17:56', '1', '');
INSERT INTO `menu` VALUES ('49', 'menu_addition_message', '訊息通知', 'subnav', 'addition/message/', 'addition.message', 'index.php', '1', '48', '0', '1', null, '2011-04-04 23:17:56', '1', 'start');
INSERT INTO `menu` VALUES ('50', 'menu_addition_package_input', '郵件輸入', 'subnav', 'addition/package/input/', 'addition.package_input', 'index.php', '1', '48', '0', '2', null, '2011-04-04 23:17:56', '1', '');
INSERT INTO `menu` VALUES ('51', 'menu_addition_package_receive', '郵件領取', 'subnav', 'addition/package/receive/', 'addition.package_receive', 'index.php', '1', '48', '0', '3', null, '2011-04-04 23:17:56', '1', '');
INSERT INTO `menu` VALUES ('52', 'menu_addition_repair_confirm', '修繕確認', 'subnav', 'addition/repair/confirm/', 'addition.repair_confirm', 'index.php', '1', '48', '0', '4', null, '2011-04-04 23:17:56', '1', '');
INSERT INTO `menu` VALUES ('53', 'menu_addition_repair_report', '修繕紀錄', 'subnav', 'addition/report/report/', 'addition.repair_report', 'index.php', '1', '48', '0', '5', null, '2011-04-04 23:17:56', '1', '');
INSERT INTO `menu` VALUES ('54', 'menu_addition_reservation_confirm', '預約確認', 'subnav', 'addition/reservation/confirm/', 'addition.reservation_confirm', 'index.php', '1', '48', '0', '6', null, '2011-04-04 23:17:56', '1', '');
INSERT INTO `menu` VALUES ('55', 'menu_addition_reservation_report', '預約紀錄', 'subnav', 'addition/reservation/report/', 'addition.reservation_report', 'index.php', '1', '48', '0', '7', null, '2011-04-04 23:17:56', '1', 'end');
INSERT INTO `menu` VALUES ('56', 'menu_system', '系統設定', 'nav', 'system/', 'system', '#', '0', '56', '0', '0', null, '2011-04-04 23:25:50', '1', '');
INSERT INTO `menu` VALUES ('57', 'menu_system_permission', '權限設定', 'subnav', 'system/permission/', 'system.permission', 'index.php', '1', '56', '0', '1', null, '2011-04-04 23:25:50', '1', 'start');
INSERT INTO `menu` VALUES ('58', 'menu_system_backup', '備份作業', 'subnav', 'system/backup/', 'system.backup', 'index.php', '1', '56', '0', '2', null, '2011-04-04 23:25:50', '1', '');
INSERT INTO `menu` VALUES ('59', 'menu_system_dataerase', '資料刪除', 'subnav', 'system/dataerase/', 'system.dataerase', 'index.php', '1', '56', '0', '3', null, '2011-04-04 23:25:50', '1', '');
INSERT INTO `menu` VALUES ('60', 'menu_system_local_setting', '本機設定', 'subnav', 'system/localsetting/', 'system.localsetting', 'index.php', '1', '56', '0', '4', null, '2011-04-04 23:25:50', '1', '');
INSERT INTO `menu` VALUES ('61', 'menu_system_online_management', '線上管理', 'subnav', 'system/onlinemanage/', 'system.onlinemanage', 'index.php', '1', '56', '0', '5', null, '2011-04-07 08:56:54', '1', 'end');
INSERT INTO `menu` VALUES ('62', 'menu_stock_inventory_collection', '盤點彙總', 'subnav', 'stock/inventory_collection/', 'stock.inventory_collection', 'index.php', '1', '23', '0', '3', null, '2011-04-07 10:08:11', '1', '');
INSERT INTO `menu` VALUES ('63', 'menu_stock_stock_record', '庫存紀錄', 'subnav', 'stock/stock_record/', 'stock.record', 'index.php', '1', '23', '0', '2', null, '2011-11-28 09:32:16', '1', '');
INSERT INTO `menu` VALUES ('64', 'menu_statistics_class', '類別統計', 'subnav', 'statistics/class/', 'statistics.class', 'index.php', '1', '28', '0', '2', null, '2011-12-14 17:00:07', '1', '  ');

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

-- ----------------------------
-- Table structure for `stock_collection`
-- ----------------------------
DROP TABLE IF EXISTS `stock_collection`;
CREATE TABLE `stock_collection` (
  `collection_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '彙整索引',
  `collection_no` varchar(16) COLLATE utf8_unicode_ci NOT NULL COMMENT '彙整單號',
  `store_no` varchar(6) COLLATE utf8_unicode_ci NOT NULL COMMENT '店別',
  `collection_remark` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '備註說明',
  `collection_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建表日期',
  `collector` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '建表人',
  `checked` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '已轉入',
  `display` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`collection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='盤點彙整表';

-- ----------------------------
-- Records of stock_collection
-- ----------------------------

-- ----------------------------
-- Table structure for `stock_collectionlist`
-- ----------------------------
DROP TABLE IF EXISTS `stock_collectionlist`;
CREATE TABLE `stock_collectionlist` (
  `collectionlist_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `collection_no` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `item_no` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `total` float(8,2) NOT NULL DEFAULT '0.00',
  `average` float(8,2) NOT NULL DEFAULT '0.00',
  `remark` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`collectionlist_id`)
) ENGINE=MyISAM AUTO_INCREMENT=193 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stock_collectionlist
-- ----------------------------

-- ----------------------------
-- Table structure for `stock_inventory`
-- ----------------------------
DROP TABLE IF EXISTS `stock_inventory`;
CREATE TABLE `stock_inventory` (
  `inventory_id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '庫存索引',
  `store_no` varchar(6) COLLATE utf8_unicode_ci NOT NULL COMMENT '店號',
  `item_id` int(20) NOT NULL COMMENT '商品索引',
  `item_no` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `inventory_location` varchar(14) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '貨架位置',
  `safety_stock` float(8,2) unsigned DEFAULT '0.00' COMMENT '安全存量',
  `inventory_total` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '庫存數量',
  `inventory_amount` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '庫存金額',
  `inventory_average` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '平均成本',
  `display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '顯示',
  PRIMARY KEY (`inventory_id`),
  KEY `store_no` (`store_no`,`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=378 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stock_inventory
-- ----------------------------
INSERT INTO `stock_inventory` VALUES ('361', 'A0001', '237', '00002', null, '0.00', '-3.00', '-20.00', '20.00', '1');
INSERT INTO `stock_inventory` VALUES ('362', 'A0001', '253', '00061', null, '0.00', '-3.00', '0.00', '0.00', '1');
INSERT INTO `stock_inventory` VALUES ('363', 'A0001', '254', '00062', null, '0.00', '-2.00', '0.00', '0.00', '1');
INSERT INTO `stock_inventory` VALUES ('364', 'A0001', '246', '00032', null, '0.00', '-1.00', '-30.00', '30.00', '1');
INSERT INTO `stock_inventory` VALUES ('365', 'A0001', '252', '00052', null, '0.00', '-1.00', '0.00', '0.00', '1');
INSERT INTO `stock_inventory` VALUES ('366', 'A0001', '249', '00041', null, '0.00', '-1.00', '0.00', '0.00', '1');
INSERT INTO `stock_inventory` VALUES ('367', 'A0001', '258', '00082', null, '0.00', '-1.00', '0.00', '0.00', '1');
INSERT INTO `stock_inventory` VALUES ('368', 'A0001', '241', '00006', null, '0.00', '-2.00', '-21.00', '21.00', '1');
INSERT INTO `stock_inventory` VALUES ('369', 'A0001', '256', '00072', null, '0.00', '-3.00', '-149.00', '149.00', '1');
INSERT INTO `stock_inventory` VALUES ('370', 'A0001', '238', '00003', null, '0.00', '-3.00', '-20.00', '20.00', '1');
INSERT INTO `stock_inventory` VALUES ('371', 'A0001', '267', '00126', null, '0.00', '-2.00', '0.00', '0.00', '1');
INSERT INTO `stock_inventory` VALUES ('372', 'A0001', '255', '00071', null, '0.00', '-1.00', '0.00', '0.00', '1');
INSERT INTO `stock_inventory` VALUES ('373', 'A0001', '262', '00092', null, '0.00', '-1.00', '0.00', '0.00', '1');
INSERT INTO `stock_inventory` VALUES ('374', 'A0001', '261', '00091', null, '0.00', '-1.00', '0.00', '0.00', '1');
INSERT INTO `stock_inventory` VALUES ('375', 'A0001', '245', '00031', null, '0.00', '-1.00', '-30.00', '30.00', '1');
INSERT INTO `stock_inventory` VALUES ('376', 'A0001', '247', '00033', null, '0.00', '-1.00', '-40.00', '40.00', '1');
INSERT INTO `stock_inventory` VALUES ('377', 'A0001', '236', '0001', null, '0.00', '-1.00', '-20.00', '20.00', '1');

-- ----------------------------
-- Table structure for `stock_inventorylist`
-- ----------------------------
DROP TABLE IF EXISTS `stock_inventorylist`;
CREATE TABLE `stock_inventorylist` (
  `inventorylist_id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '庫存明細索引',
  `store_no` varchar(6) COLLATE utf8_unicode_ci NOT NULL COMMENT '店號',
  `item_id` int(20) unsigned NOT NULL COMMENT '商品索引',
  `list_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '單據編號',
  `list_judge` tinyint(2) unsigned NOT NULL COMMENT 'list_judge參考system status表',
  `ori_total` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '原本庫存量',
  `chg_total` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '變更庫存量',
  `inventorylist_date` datetime DEFAULT NULL COMMENT '建表日期',
  `employee_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '建表人',
  PRIMARY KEY (`inventorylist_id`),
  KEY `store_no` (`store_no`,`item_id`,`list_no`)
) ENGINE=InnoDB AUTO_INCREMENT=974 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stock_inventorylist
-- ----------------------------
INSERT INTO `stock_inventorylist` VALUES ('944', 'A0001', '237', '00000003', '8', '0.00', '-1.00', '2012-01-10 15:37:31', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('945', 'A0001', '253', '00000003', '8', '0.00', '-1.00', '2012-01-10 15:37:31', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('946', 'A0001', '254', '00000003', '8', '0.00', '-1.00', '2012-01-10 15:37:31', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('947', 'A0001', '246', '00000003', '8', '0.00', '-1.00', '2012-01-10 16:24:41', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('948', 'A0001', '252', '00000003', '8', '0.00', '-1.00', '2012-01-10 16:24:41', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('949', 'A0001', '249', '00000003', '8', '0.00', '-1.00', '2012-01-10 16:35:27', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('950', 'A0001', '258', '00000003', '8', '0.00', '-1.00', '2012-01-10 16:35:27', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('951', 'A0001', '241', '00000003', '8', '0.00', '-1.00', '2012-01-10 17:07:01', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('952', 'A0001', '256', '00000003', '8', '0.00', '-1.00', '2012-01-10 18:39:17', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('953', 'A0001', '238', '00000007', '8', '0.00', '-1.00', '2012-01-10 18:48:04', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('954', 'A0001', '267', '00000010', '8', '0.00', '-1.00', '2012-01-10 18:55:11', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('955', 'A0001', '255', '00000015', '8', '0.00', '-1.00', '2012-01-10 19:09:37', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('956', 'A0001', '262', '00000018', '8', '0.00', '-1.00', '2012-01-10 21:30:01', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('957', 'A0001', '261', '00000018', '8', '0.00', '-1.00', '2012-01-10 21:30:01', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('958', 'A0001', '238', '00000001', '8', '-1.00', '-1.00', '2012-01-10 22:28:30', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('959', 'A0001', '238', '00000001', '7', '-2.00', '1.00', '2012-01-10 22:31:03', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('960', 'A0001', '253', '00000004', '8', '-1.00', '-1.00', '2012-01-11 00:27:26', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('961', 'A0001', '254', '00000004', '8', '-1.00', '-1.00', '2012-01-11 00:27:26', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('962', 'A0001', '253', '00000005', '8', '-2.00', '-1.00', '2012-01-11 00:28:26', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('963', 'A0001', '256', '00000006', '8', '-1.00', '-1.00', '2012-01-11 00:29:25', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('964', 'A0001', '256', '00000007', '8', '-2.00', '-1.00', '2012-01-11 00:29:45', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('965', 'A0001', '238', '00000008', '8', '-1.00', '-1.00', '2012-01-11 00:30:47', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('966', 'A0001', '238', '00000009', '8', '-2.00', '-1.00', '2012-01-11 00:31:22', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('967', 'A0001', '237', '00000010', '8', '-1.00', '-1.00', '2012-01-11 00:33:04', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('968', 'A0001', '245', '00000011', '8', '0.00', '-1.00', '2012-01-11 00:33:14', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('969', 'A0001', '267', '00000012', '8', '-1.00', '-1.00', '2012-01-11 00:33:58', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('970', 'A0001', '241', '00000013', '8', '-1.00', '-1.00', '2012-01-11 00:35:28', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('971', 'A0001', '247', '00000014', '8', '0.00', '-1.00', '2012-01-11 00:35:50', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('972', 'A0001', '237', '00000015', '8', '-2.00', '-1.00', '2012-01-11 00:38:45', '系統管理員');
INSERT INTO `stock_inventorylist` VALUES ('973', 'A0001', '236', '00000016', '8', '0.00', '-1.00', '2012-01-11 00:39:33', '系統管理員');

-- ----------------------------
-- Table structure for `stock_stocktaking`
-- ----------------------------
DROP TABLE IF EXISTS `stock_stocktaking`;
CREATE TABLE `stock_stocktaking` (
  `stocktaking_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '盤點索引',
  `stocktaking_no` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '盤點單號',
  `collection_no` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '彙總單號',
  `store_no` varchar(6) COLLATE utf8_unicode_ci NOT NULL COMMENT '店號',
  `stocktaking_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '盤點時間',
  `stocktaker` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '盤點人',
  `checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '彙總確認',
  PRIMARY KEY (`stocktaking_id`),
  KEY `stocktaking_no` (`stocktaking_no`)
) ENGINE=MyISAM AUTO_INCREMENT=1237 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stock_stocktaking
-- ----------------------------

-- ----------------------------
-- Table structure for `stock_stocktakinglist`
-- ----------------------------
DROP TABLE IF EXISTS `stock_stocktakinglist`;
CREATE TABLE `stock_stocktakinglist` (
  `stocktakinglist_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '盤點明細索引',
  `store_no` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `stocktaking_no` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '盤點單號',
  `item_no` varchar(16) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品單號',
  `quantity` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '數量',
  PRIMARY KEY (`stocktakinglist_id`),
  KEY `stocktaking_no` (`stocktaking_no`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stock_stocktakinglist
-- ----------------------------

-- ----------------------------
-- Table structure for `system_status`
-- ----------------------------
DROP TABLE IF EXISTS `system_status`;
CREATE TABLE `system_status` (
  `status_no` tinyint(2) NOT NULL,
  `status_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_value` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `isTableActive` tinyint(1) DEFAULT '0',
  `isGlobalChange` tinyint(1) DEFAULT '0',
  `isInStock` tinyint(1) unsigned DEFAULT '0' COMMENT '是否入庫存',
  `ordering` int(2) DEFAULT '1',
  PRIMARY KEY (`status_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_status
-- ----------------------------
INSERT INTO `system_status` VALUES ('-7', 'STATUSDISANNUL', '作廢', '0', '0', '0', '6');
INSERT INTO `system_status` VALUES ('7', 'STATUSDISANNULSTUB', '作廢存根', '0', '0', '1', '7');
INSERT INTO `system_status` VALUES ('8', 'STATUSCHECKOUT', '已結帳', '0', '1', '1', '3');
INSERT INTO `system_status` VALUES ('14', 'STATUSCHECKING', '結帳', '0', '0', '0', '8');
INSERT INTO `system_status` VALUES ('12', 'STATUSSETTLEMENT', '清帳', '0', '0', '0', '5');
INSERT INTO `system_status` VALUES ('10', 'STATUSRECEIVEDORDER', '收單', '1', '1', '0', '2');
INSERT INTO `system_status` VALUES ('9', 'STATUSRETURNED', '退貨', '0', '0', '1', '4');
INSERT INTO `system_status` VALUES ('0', 'STATUSNONE', '預設', '0', '1', '0', '1');
INSERT INTO `system_status` VALUES ('1', null, '廠商進貨', '0', '0', '1', '19');
INSERT INTO `system_status` VALUES ('2', null, '廠商退貨', '0', '0', '1', '20');
INSERT INTO `system_status` VALUES ('3', null, '調貨', '0', '0', '1', '21');
INSERT INTO `system_status` VALUES ('4', null, '盤點', '0', '0', '1', '22');
INSERT INTO `system_status` VALUES ('5', null, '銷售', '0', '0', '0', '23');
INSERT INTO `system_status` VALUES ('6', null, '清倉', '0', '0', '1', '24');
INSERT INTO `system_status` VALUES ('15', 'STATUSDISABLEMERGE', '併桌失效', '0', '0', '1', '9');
INSERT INTO `system_status` VALUES ('16', 'STATUSDISABLERECEIVED', '收單失效', '0', '0', '1', '10');

-- ----------------------------
-- Table structure for `table_assoc`
-- ----------------------------
DROP TABLE IF EXISTS `table_assoc`;
CREATE TABLE `table_assoc` (
  `table_assoc_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引',
  `tblog_id` int(10) unsigned NOT NULL COMMENT '表單索引',
  `customer_id` int(10) unsigned NOT NULL COMMENT '客戶',
  `card_id` int(10) unsigned NOT NULL COMMENT '卡號',
  `udate` datetime NOT NULL COMMENT '修改時間',
  `uby` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`table_assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of table_assoc
-- ----------------------------

-- ----------------------------
-- Table structure for `table_log`
-- ----------------------------
DROP TABLE IF EXISTS `table_log`;
CREATE TABLE `table_log` (
  `tblog_id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引',
  `table_id` int(20) NOT NULL COMMENT '桌號',
  `custom_num` int(3) unsigned NOT NULL COMMENT '人數',
  `service` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '服務',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '抵達時間',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '離開時間',
  `remark` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `udate` datetime DEFAULT NULL COMMENT '修改時間',
  `uby` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`tblog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of table_log
-- ----------------------------

-- ----------------------------
-- Table structure for `trans_curid`
-- ----------------------------
DROP TABLE IF EXISTS `trans_curid`;
CREATE TABLE `trans_curid` (
  `curid` int(3) NOT NULL AUTO_INCREMENT,
  `curtype` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `curname` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `udate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uby` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`curid`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of trans_curid
-- ----------------------------
INSERT INTO `trans_curid` VALUES ('1', 'TWD', '新台幣', '2011-05-20 15:08:42', 'ZDN');
INSERT INTO `trans_curid` VALUES ('2', ' USD', ' 美金', '2011-05-20 15:08:42', 'ZDN');
INSERT INTO `trans_curid` VALUES ('3', ' HKD', ' 港幣', '2011-05-20 15:08:42', 'ZDN');
INSERT INTO `trans_curid` VALUES ('4', ' GBP', ' 英鎊', '2011-05-20 15:08:42', 'ZDN');
INSERT INTO `trans_curid` VALUES ('5', ' AUD', ' 澳幣', '2011-05-20 15:08:42', 'ZDN');
INSERT INTO `trans_curid` VALUES ('6', ' CAD', ' 加拿大幣', '2011-05-20 15:08:42', 'ZDN');
INSERT INTO `trans_curid` VALUES ('7', ' SGD', ' 新加坡幣', '2011-05-20 15:08:42', 'ZDN');
INSERT INTO `trans_curid` VALUES ('8', ' CHF', ' 瑞士法郎', '2011-05-20 15:08:42', 'ZDN');
INSERT INTO `trans_curid` VALUES ('9', ' JPY', ' 日圓', '2011-05-20 15:08:42', 'ZDN');
INSERT INTO `trans_curid` VALUES ('10', ' ZAR', ' 南非幣', '2011-05-20 15:08:42', 'ZDN');
INSERT INTO `trans_curid` VALUES ('11', ' SEK', ' 瑞典幣', '2011-05-20 15:08:42', 'ZDN');
INSERT INTO `trans_curid` VALUES ('12', ' NZD', ' 紐元', '2011-05-20 15:08:42', 'ZDN');
INSERT INTO `trans_curid` VALUES ('13', ' THB', ' 泰幣', '2011-05-20 15:08:42', 'ZDN');
INSERT INTO `trans_curid` VALUES ('14', ' PHP', ' 菲國比索', '2011-05-20 15:08:42', 'ZDN');
INSERT INTO `trans_curid` VALUES ('15', ' IDR', ' 印尼幣', '2011-05-20 15:08:42', 'ZDN');
INSERT INTO `trans_curid` VALUES ('16', ' EUR', ' 歐元', '2011-05-20 15:08:42', 'ZDN');
INSERT INTO `trans_curid` VALUES ('17', ' KRW', ' 韓元', '2011-05-20 15:08:42', 'ZDN');
INSERT INTO `trans_curid` VALUES ('18', ' VND', ' 越南盾', '2011-05-20 15:08:42', 'ZDN');
INSERT INTO `trans_curid` VALUES ('19', ' MYR', ' 馬來幣', '2011-05-20 15:08:42', 'ZDN');
INSERT INTO `trans_curid` VALUES ('20', ' CNY', ' 人民幣', '2011-05-20 15:08:42', 'ZDN');

-- ----------------------------
-- Table structure for `trans_rates`
-- ----------------------------
DROP TABLE IF EXISTS `trans_rates`;
CREATE TABLE `trans_rates` (
  `rate_id` int(20) NOT NULL,
  `curid` int(3) NOT NULL,
  `rates` float(8,2) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `udate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uby` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of trans_rates
-- ----------------------------
INSERT INTO `trans_rates` VALUES ('1', '1', '1.00', '2011-05-20 15:27:42', '2021-05-20 15:28:10', '2011-05-20 15:28:48', 'ZDN');

-- ----------------------------
-- Table structure for `user_permission`
-- ----------------------------
DROP TABLE IF EXISTS `user_permission`;
CREATE TABLE `user_permission` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(20) unsigned NOT NULL,
  `permission_id` int(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `employee_id` FOREIGN KEY (`employee_id`) REFERENCES `data_employee` (`employee_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_permission
-- ----------------------------
INSERT INTO `user_permission` VALUES ('3', '4', '3');
INSERT INTO `user_permission` VALUES ('4', '4', '4');
INSERT INTO `user_permission` VALUES ('5', '4', '5');
INSERT INTO `user_permission` VALUES ('15', '6', '1');
INSERT INTO `user_permission` VALUES ('16', '6', '2');
INSERT INTO `user_permission` VALUES ('17', '6', '3');
INSERT INTO `user_permission` VALUES ('18', '6', '4');
INSERT INTO `user_permission` VALUES ('22', '11', '1');
INSERT INTO `user_permission` VALUES ('23', '11', '2');
INSERT INTO `user_permission` VALUES ('24', '11', '3');
INSERT INTO `user_permission` VALUES ('27', '11', '6');
INSERT INTO `user_permission` VALUES ('29', '28', '1');
INSERT INTO `user_permission` VALUES ('36', '30', '1');
INSERT INTO `user_permission` VALUES ('37', '30', '2');
INSERT INTO `user_permission` VALUES ('38', '30', '3');
INSERT INTO `user_permission` VALUES ('39', '30', '4');
INSERT INTO `user_permission` VALUES ('43', '48', '1');
INSERT INTO `user_permission` VALUES ('44', '48', '2');
INSERT INTO `user_permission` VALUES ('45', '48', '3');
INSERT INTO `user_permission` VALUES ('46', '48', '4');
INSERT INTO `user_permission` VALUES ('48', '48', '6');
INSERT INTO `user_permission` VALUES ('50', '51', '1');
INSERT INTO `user_permission` VALUES ('51', '51', '2');
INSERT INTO `user_permission` VALUES ('52', '51', '3');
INSERT INTO `user_permission` VALUES ('53', '51', '4');
INSERT INTO `user_permission` VALUES ('57', '51', '1');
INSERT INTO `user_permission` VALUES ('58', '51', '2');
INSERT INTO `user_permission` VALUES ('59', '51', '3');
INSERT INTO `user_permission` VALUES ('60', '51', '4');
INSERT INTO `user_permission` VALUES ('66', '4', '1');
INSERT INTO `user_permission` VALUES ('67', '4', '2');
INSERT INTO `user_permission` VALUES ('72', '4', '6');
INSERT INTO `user_permission` VALUES ('73', '4', '7');
INSERT INTO `user_permission` VALUES ('77', '60', '4');
INSERT INTO `user_permission` VALUES ('79', '60', '6');
INSERT INTO `user_permission` VALUES ('81', '11', '5');
INSERT INTO `user_permission` VALUES ('82', '6', '5');
INSERT INTO `user_permission` VALUES ('83', '28', '4');
INSERT INTO `user_permission` VALUES ('84', '61', '1');
INSERT INTO `user_permission` VALUES ('85', '61', '2');
INSERT INTO `user_permission` VALUES ('87', '61', '4');
INSERT INTO `user_permission` VALUES ('88', '61', '5');
INSERT INTO `user_permission` VALUES ('90', '61', '3');
INSERT INTO `user_permission` VALUES ('91', '62', '4');
INSERT INTO `user_permission` VALUES ('92', '62', '3');
INSERT INTO `user_permission` VALUES ('93', '62', '2');
INSERT INTO `user_permission` VALUES ('94', '62', '1');
INSERT INTO `user_permission` VALUES ('95', '62', '7');
INSERT INTO `user_permission` VALUES ('96', '63', '3');
INSERT INTO `user_permission` VALUES ('97', '63', '2');
INSERT INTO `user_permission` VALUES ('98', '63', '1');

-- ----------------------------
-- View structure for `analysis_day`
-- ----------------------------
DROP VIEW IF EXISTS `analysis_day`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `analysis_day` AS select substr(`sales_receipt`.`debtdate`,1,10) AS `day`,`sales_receipt`.`station_no` AS `station_no`,`data_store`.`store_name` AS `store_name`,sum(`sales_receipt`.`sales_amount`) AS `sales_samount`,sum(`sales_receipt`.`sales_tax`) AS `sales_stax`,sum(`sales_receipt`.`sales_exemption`) AS `sales_sexemption`,sum(`sales_receipt`.`sales_total`) AS `sales_stotal`,sum(`sales_receipt`.`sales_discount`) AS `sales_sdiscount`,sum(`sales_receipt`.`customer_total`) AS `customer_stotal`,sum(`sales_receipt`.`healthtax`) AS `shealthtax`,count(`sales_receipt`.`sales_no`) AS `sales_num`,substr(`sales_receipt`.`debtdate`,1,10) AS `time` from (`sales_receipt` join `data_store`) where ((substr(`sales_receipt`.`debtdate`,1,4) = substr(now(),1,4)) and (`data_store`.`store_id` = `sales_receipt`.`store_id`) and (`sales_receipt`.`status` = _utf8'2')) group by `sales_receipt`.`station_no`,`sales_receipt`.`store_id`,substr(`sales_receipt`.`debtdate`,1,10) ;

-- ----------------------------
-- View structure for `analysis_month`
-- ----------------------------
DROP VIEW IF EXISTS `analysis_month`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `analysis_month` AS select monthname(`sales_receipt`.`debtdate`) AS `month`,`data_store`.`store_name` AS `store_name`,sum(`sales_receipt`.`sales_amount`) AS `sales_samount`,sum(`sales_receipt`.`sales_tax`) AS `sales_stax`,sum(`sales_receipt`.`sales_exemption`) AS `sales_sexemption`,sum(`sales_receipt`.`sales_total`) AS `sales_stotal`,sum(`sales_receipt`.`sales_discount`) AS `sales_sdiscount`,sum(`sales_receipt`.`customer_total`) AS `customer_stotal`,sum(`sales_receipt`.`healthtax`) AS `shealthtax`,count(`sales_receipt`.`sales_no`) AS `sales_num` from (`sales_receipt` join `data_store`) where ((substr(`sales_receipt`.`debtdate`,1,4) = substr(now(),1,4)) and (`data_store`.`store_id` = `sales_receipt`.`store_id`) and (`sales_receipt`.`status` = _utf8'2')) group by `sales_receipt`.`store_id`,substr(`sales_receipt`.`debtdate`,1,7) ;

-- ----------------------------
-- View structure for `analysis_profit_class`
-- ----------------------------
DROP VIEW IF EXISTS `analysis_profit_class`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `analysis_profit_class` AS select `data_class`.`class_id` AS `class_id`,`data_class`.`class_name` AS `class_name`,sum(`sales_receiptlist`.`saleslist_quantity`) AS `quantity`,sum((`sales_receiptlist`.`saleslist_quantity` * `sales_receiptlist`.`saleslist_expenses`)) AS `sales_samount`,sum(`sales_receiptlist`.`saleslist_tax`) AS `sales_stax`,sum(`sales_receiptlist`.`healthtax`) AS `shealthtax`,sum(`sales_receiptlist`.`saleslist_exemption`) AS `sales_sexemption`,sum(`sales_receiptlist`.`saleslist_discount`) AS `saleslist_discount`,sum(`sales_receiptlist`.`saleslist_allowance`) AS `saleslist_allowance`,(((((sum((`sales_receiptlist`.`saleslist_quantity` * `sales_receiptlist`.`saleslist_expenses`)) - sum(`sales_receiptlist`.`saleslist_discount`)) - sum(`sales_receiptlist`.`saleslist_allowance`)) + sum(`sales_receiptlist`.`saleslist_plus`)) - sum(`sales_receiptlist`.`saleslist_cost`)) - (sum(`sales_receiptlist`.`saleslist_tax`) + sum(`sales_receiptlist`.`healthtax`))) AS `gross_profit`,((((((sum((`sales_receiptlist`.`saleslist_quantity` * `sales_receiptlist`.`saleslist_expenses`)) - sum(`sales_receiptlist`.`saleslist_discount`)) - sum(`sales_receiptlist`.`saleslist_allowance`)) + sum(`sales_receiptlist`.`saleslist_plus`)) - sum(`sales_receiptlist`.`saleslist_cost`)) - (sum(`sales_receiptlist`.`saleslist_tax`) + sum(`sales_receiptlist`.`healthtax`))) / (((sum((`sales_receiptlist`.`saleslist_quantity` * `sales_receiptlist`.`saleslist_expenses`)) - sum(`sales_receiptlist`.`saleslist_discount`)) - sum(`sales_receiptlist`.`saleslist_allowance`)) + sum(`sales_receiptlist`.`saleslist_plus`))) AS `gross_profit_rate` from ((`sales_receiptlist` join `data_item`) join `data_class`) where ((`sales_receiptlist`.`item_id` = `data_item`.`item_id`) and (`data_item`.`item_class` = `data_class`.`class_id`)) group by `data_class`.`class_name` ;

-- ----------------------------
-- View structure for `analysis_profit_item`
-- ----------------------------
DROP VIEW IF EXISTS `analysis_profit_item`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `analysis_profit_item` AS select `data_item`.`item_id` AS `item_id`,`data_item`.`item_name` AS `item_name`,sum(`sales_receiptlist`.`saleslist_quantity`) AS `quantity`,sum((`sales_receiptlist`.`saleslist_quantity` * `sales_receiptlist`.`saleslist_expenses`)) AS `sales_samount`,sum(`sales_receiptlist`.`saleslist_tax`) AS `sales_stax`,sum(`sales_receiptlist`.`healthtax`) AS `shealthtax`,sum(`sales_receiptlist`.`saleslist_exemption`) AS `sales_sexemption`,sum(`sales_receiptlist`.`saleslist_discount`) AS `saleslist_discount`,sum(`sales_receiptlist`.`saleslist_allowance`) AS `saleslist_allowance`,(((((sum((`sales_receiptlist`.`saleslist_quantity` * `sales_receiptlist`.`saleslist_expenses`)) - sum(`sales_receiptlist`.`saleslist_discount`)) - sum(`sales_receiptlist`.`saleslist_allowance`)) + sum(`sales_receiptlist`.`saleslist_plus`)) - sum(`sales_receiptlist`.`saleslist_cost`)) - (sum(`sales_receiptlist`.`saleslist_tax`) + sum(`sales_receiptlist`.`healthtax`))) AS `gross_profit`,((((((sum((`sales_receiptlist`.`saleslist_quantity` * `sales_receiptlist`.`saleslist_expenses`)) - sum(`sales_receiptlist`.`saleslist_discount`)) - sum(`sales_receiptlist`.`saleslist_allowance`)) + sum(`sales_receiptlist`.`saleslist_plus`)) - sum(`sales_receiptlist`.`saleslist_cost`)) - (sum(`sales_receiptlist`.`saleslist_tax`) + sum(`sales_receiptlist`.`healthtax`))) / (((sum((`sales_receiptlist`.`saleslist_quantity` * `sales_receiptlist`.`saleslist_expenses`)) - sum(`sales_receiptlist`.`saleslist_discount`)) - sum(`sales_receiptlist`.`saleslist_allowance`)) + sum(`sales_receiptlist`.`saleslist_plus`))) AS `gross_profit_rate` from (`sales_receiptlist` join `data_item`) where (`sales_receiptlist`.`item_id` = `data_item`.`item_id`) group by `data_item`.`item_name` ;

-- ----------------------------
-- View structure for `analysis_profit_vender`
-- ----------------------------
DROP VIEW IF EXISTS `analysis_profit_vender`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `analysis_profit_vender` AS select `data_vender`.`vender_id` AS `vender_id`,`data_vender`.`vender_name` AS `vender_name`,sum(`sales_receiptlist`.`saleslist_quantity`) AS `quantity`,sum((`sales_receiptlist`.`saleslist_quantity` * `sales_receiptlist`.`saleslist_expenses`)) AS `sales_samount`,sum(`sales_receiptlist`.`saleslist_tax`) AS `sales_stax`,sum(`sales_receiptlist`.`healthtax`) AS `shealthtax`,sum(`sales_receiptlist`.`saleslist_exemption`) AS `sales_sexemption`,sum(`sales_receiptlist`.`saleslist_discount`) AS `saleslist_discount`,sum(`sales_receiptlist`.`saleslist_allowance`) AS `saleslist_allowance`,(((((sum((`sales_receiptlist`.`saleslist_quantity` * `sales_receiptlist`.`saleslist_expenses`)) - sum(`sales_receiptlist`.`saleslist_discount`)) - sum(`sales_receiptlist`.`saleslist_allowance`)) + sum(`sales_receiptlist`.`saleslist_plus`)) - sum(`sales_receiptlist`.`saleslist_cost`)) - (sum(`sales_receiptlist`.`saleslist_tax`) + sum(`sales_receiptlist`.`healthtax`))) AS `gross_profit`,((((((sum((`sales_receiptlist`.`saleslist_quantity` * `sales_receiptlist`.`saleslist_expenses`)) - sum(`sales_receiptlist`.`saleslist_discount`)) - sum(`sales_receiptlist`.`saleslist_allowance`)) + sum(`sales_receiptlist`.`saleslist_plus`)) - sum(`sales_receiptlist`.`saleslist_cost`)) - (sum(`sales_receiptlist`.`saleslist_tax`) + sum(`sales_receiptlist`.`healthtax`))) / (((sum((`sales_receiptlist`.`saleslist_quantity` * `sales_receiptlist`.`saleslist_expenses`)) - sum(`sales_receiptlist`.`saleslist_discount`)) - sum(`sales_receiptlist`.`saleslist_allowance`)) + sum(`sales_receiptlist`.`saleslist_plus`))) AS `gross_profit_rate` from ((`sales_receiptlist` join `data_item`) join `data_vender`) where ((`sales_receiptlist`.`item_id` = `data_item`.`item_id`) and (`data_item`.`item_vender` = `data_vender`.`vender_id`)) group by `data_vender`.`vender_name` ;

-- ----------------------------
-- View structure for `base_itemdb_view`
-- ----------------------------
DROP VIEW IF EXISTS `base_itemdb_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `base_itemdb_view` AS select `ds`.`store_id` AS `store_id`,`di`.`item_id` AS `item_id`,`di`.`item_vender` AS `vender_id`,`di`.`item_class` AS `class_id`,`di`.`item_brand` AS `brand_id`,`ds`.`store_no` AS `store_no`,`ds`.`store_name` AS `store_name`,`dv`.`vender_name` AS `vender_name`,`dc`.`class_name` AS `class_name`,`db`.`brand_name` AS `brand_name`,`di`.`item_no` AS `item_no`,`di`.`item_name` AS `item_name`,`si`.`inventory_location` AS `location`,`di`.`item_image` AS `item_image` from (((((`data_item` `di` join `stock_inventory` `si`) left join `data_brand` `db` on((`di`.`item_brand` = `db`.`brand_id`))) left join `data_vender` `dv` on((`di`.`item_vender` = `dv`.`vender_id`))) left join `data_store` `ds` on((`ds`.`store_no` = `si`.`store_no`))) left join `data_class` `dc` on((`di`.`item_class` = `dc`.`class_id`))) where ((`di`.`item_no` = `si`.`item_no`) and (`si`.`display` = 1)) ;

-- ----------------------------
-- View structure for `base_purchase_info`
-- ----------------------------
DROP VIEW IF EXISTS `base_purchase_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `base_purchase_info` AS select `dc`.`class_id` AS `class_id`,`dc`.`class_no` AS `class_no`,`dc`.`class_name` AS `class_name`,`di`.`item_id` AS `item_id`,`di`.`item_no` AS `item_no`,`di`.`item_name` AS `item_name`,`di`.`item_saleprice1` AS `item_saleprice1` from (`data_item` `di` join `data_class` `dc`) where (`di`.`item_class` = `dc`.`class_id`) ;

-- ----------------------------
-- View structure for `base_stockdb_view`
-- ----------------------------
DROP VIEW IF EXISTS `base_stockdb_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `base_stockdb_view` AS select `biv`.`store_id` AS `store_id`,`biv`.`item_id` AS `item_id`,`biv`.`vender_id` AS `vender_id`,`biv`.`class_id` AS `class_id`,`biv`.`brand_id` AS `brand_id`,`si`.`store_no` AS `store_no`,`biv`.`store_name` AS `store_name`,`biv`.`vender_name` AS `vender_name`,`biv`.`class_name` AS `class_name`,`biv`.`brand_name` AS `brand_name`,`si`.`item_no` AS `item_no`,`biv`.`item_name` AS `item_name`,`biv`.`location` AS `location`,`si`.`safety_stock` AS `safety_stock`,`si`.`inventory_total` AS `inventory_total`,`si`.`inventory_average` AS `inventory_average`,`si`.`inventory_amount` AS `inventory_amount`,`biv`.`item_image` AS `item_image` from (`stock_inventory` `si` join `base_itemdb_view` `biv`) where ((`si`.`store_no` = `biv`.`store_no`) and (`si`.`item_no` = `biv`.`item_no`) and (`si`.`display` = 1)) ;

-- ----------------------------
-- View structure for `base_stocktakingdifference_view`
-- ----------------------------
DROP VIEW IF EXISTS `base_stocktakingdifference_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `base_stocktakingdifference_view` AS select `scl`.`collectionlist_id` AS `collectionlist_id`,`bsv`.`store_id` AS `store_id`,`bsv`.`item_id` AS `item_id`,`bsv`.`vender_id` AS `vender_id`,`bsv`.`class_id` AS `class_id`,`bsv`.`brand_id` AS `brand_id`,`bsv`.`store_no` AS `store_no`,`bsv`.`store_name` AS `store_name`,`scl`.`collection_no` AS `collection_no`,`bsv`.`vender_name` AS `vender_name`,`bsv`.`class_name` AS `class_name`,`bsv`.`brand_name` AS `brand_name`,`bsv`.`location` AS `location`,`bsv`.`item_no` AS `item_no`,`bsv`.`item_name` AS `item_name`,`bsv`.`inventory_total` AS `inventory_total`,`bsv`.`inventory_average` AS `inventory_average`,`bsv`.`inventory_amount` AS `inventory_amount`,`scl`.`total` AS `total`,`scl`.`average` AS `average`,(`scl`.`total` * `scl`.`average`) AS `collection_amount`,(`scl`.`total` - `bsv`.`inventory_total`) AS `difference_total`,((`scl`.`total` * `scl`.`average`) - `bsv`.`inventory_amount`) AS `difference_amount`,`scl`.`remark` AS `collectionlist_remark`,`sc`.`collection_date` AS `collection_date`,if((`sc`.`checked` = 0),_utf8'',_utf8'V') AS `checked` from ((`base_stockdb_view` `bsv` join `stock_collection` `sc`) join `stock_collectionlist` `scl`) where ((`sc`.`store_no` = `bsv`.`store_no`) and (`scl`.`item_no` = `bsv`.`item_no`) and (`sc`.`collection_no` = `scl`.`collection_no`) and (`sc`.`display` = 1) and (`scl`.`display` = 1)) ;

-- ----------------------------
-- View structure for `cklatestno_view`
-- ----------------------------
DROP VIEW IF EXISTS `cklatestno_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cklatestno_view` AS select `stock_stocktaking`.`stocktaking_no` AS `no` from `stock_stocktaking` order by `stock_stocktaking`.`stocktaking_id` desc limit 0,1 ;

-- ----------------------------
-- View structure for `class4json_view`
-- ----------------------------
DROP VIEW IF EXISTS `class4json_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `class4json_view` AS select `data_class`.`ordering` AS `list`,`data_class`.`class_id` AS `id`,`data_class`.`class_no` AS `no`,`data_class`.`class_name` AS `name` from `data_class` where (`data_class`.`class_show` = 1) order by `data_class`.`ordering` ;

-- ----------------------------
-- View structure for `client_data_brand`
-- ----------------------------
DROP VIEW IF EXISTS `client_data_brand`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_data_brand` AS select `data_brand`.`brand_id` AS `brand_id`,`data_brand`.`brand_no` AS `brand_no`,`data_brand`.`brand_name` AS `brand_name`,`data_brand`.`brand_remark` AS `brand_remark`,`data_brand`.`udate` AS `udate` from `data_brand` ;

-- ----------------------------
-- View structure for `client_data_class`
-- ----------------------------
DROP VIEW IF EXISTS `client_data_class`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_data_class` AS select `data_class`.`class_id` AS `class_id`,`data_class`.`class_no` AS `class_no`,`data_class`.`class_name` AS `class_name`,`data_class`.`class_remark` AS `class_remark`,`data_class`.`udate` AS `udate`,`data_class`.`ordering` AS `ordering` from `data_class` where (`data_class`.`class_show` = 1) ;

-- ----------------------------
-- View structure for `client_data_customer`
-- ----------------------------
DROP VIEW IF EXISTS `client_data_customer`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_data_customer` AS select `data_customer`.`customer_id` AS `customer_id`,`data_customer`.`customer_no` AS `customer_no`,`data_customer`.`customer_name` AS `customer_name`,`data_customer`.`customer_sex` AS `customer_sex`,`data_customer`.`customer_tel` AS `customer_tel`,replace(`data_customer`.`customer_mobile`,_utf8'-',_utf8'') AS `customer_mobile`,`data_customer`.`customer_birthday` AS `customer_birthday`,`data_customer`.`customer_level` AS `customer_level`,`data_customer`.`customer_class` AS `customer_class`,`data_customer`.`customer_point` AS `customer_point`,`data_customer`.`customer_deposit` AS `customer_deposit`,`data_customer`.`customer_group` AS `customer_group`,`data_customer`.`customer_remark` AS `customer_remark`,`data_customer`.`udate` AS `udate`,`data_customer`.`uby` AS `uby` from `data_customer` ;

-- ----------------------------
-- View structure for `client_data_employee`
-- ----------------------------
DROP VIEW IF EXISTS `client_data_employee`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_data_employee` AS select `data_employee`.`employee_id` AS `employee_id`,`data_employee`.`employee_no` AS `employee_no`,`data_employee`.`employee_name` AS `employee_name`,`data_employee`.`employee_pass` AS `employee_pass`,`data_employee`.`employee_sex` AS `employee_sex`,`data_employee`.`employee_cardnum` AS `employee_cardnum`,`data_employee`.`employee_tel` AS `employee_tel`,`data_employee`.`employee_birthday` AS `employee_birthday`,`data_employee`.`employee_level` AS `employee_level`,`data_employee`.`employee_mobile` AS `employee_mobile`,`data_employee`.`udate` AS `udate` from `data_employee` ;

-- ----------------------------
-- View structure for `client_data_item`
-- ----------------------------
DROP VIEW IF EXISTS `client_data_item`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_data_item` AS select `data_item`.`item_id` AS `item_id`,`data_item`.`item_no` AS `item_no`,`data_item`.`item_name` AS `item_name`,`data_item`.`item_price` AS `item_price`,`data_item`.`item_class` AS `item_class`,`data_item`.`item_vender` AS `item_vender`,`data_item`.`item_brand` AS `item_brand`,`data_item`.`item_point` AS `item_point`,`data_item`.`item_image` AS `item_image`,`data_item`.`item_discount` AS `item_discount`,`data_item`.`item_upprice` AS `item_upprice`,`data_item`.`item_service` AS `item_service`,`data_item`.`item_outputlist` AS `item_outputlist`,`data_item`.`item_label` AS `item_label`,`data_item`.`item_barcode` AS `item_barcode`,`data_item`.`item_cost` AS `item_cost`,`data_item`.`item_saleprice1` AS `item_saleprice1`,`data_item`.`item_saleprice2` AS `item_saleprice2`,`data_item`.`item_saleprice3` AS `item_saleprice3`,`data_item`.`item_avgcost` AS `item_avgcost`,`data_item`.`item_stock` AS `item_stock`,`data_item`.`item_location` AS `item_location`,`data_item`.`item_selltax` AS `item_selltax`,`data_item`.`item_donate` AS `item_donate`,`data_item`.`item_remark` AS `item_remark`,`data_item`.`udate` AS `udate`,`data_item`.`ordering` AS `ordering` from `data_item` where (`data_item`.`item_show` = 1) ;

-- ----------------------------
-- View structure for `client_data_remark`
-- ----------------------------
DROP VIEW IF EXISTS `client_data_remark`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_data_remark` AS select `data_remark`.`remark_id` AS `remark_id`,`data_remark`.`remark_no` AS `remark_no`,`data_remark`.`remark_name` AS `remark_name`,`data_remark`.`remark_type` AS `remark_type`,`data_remark`.`remark_style` AS `remark_style`,`data_remark`.`udate` AS `udate` from `data_remark` order by `data_remark`.`remark_no`,`data_remark`.`remark_id` ;

-- ----------------------------
-- View structure for `client_data_remark_class2assoc`
-- ----------------------------
DROP VIEW IF EXISTS `client_data_remark_class2assoc`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_data_remark_class2assoc` AS select `data_remarkassoc`.`remarkassoc_id` AS `remarkassoc_id`,`data_remarkassoc`.`remark_id` AS `remark_id`,`data_remarkassoc`.`remarkassoc_tbid` AS `remarkassoc_tbid`,`data_remarkassoc`.`remarkassoc_tbname` AS `remarkassoc_tbname` from `data_remarkassoc` where (`data_remarkassoc`.`remarkassoc_tbname` = _utf8'data_class') ;

-- ----------------------------
-- View structure for `client_data_remarklist`
-- ----------------------------
DROP VIEW IF EXISTS `client_data_remarklist`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_data_remarklist` AS select `data_remarklist`.`remarklist_id` AS `remarklist_id`,`data_remarklist`.`remark_id` AS `remark_id`,`data_remarklist`.`remarklist_no` AS `remarklist_no`,`data_remarklist`.`remarklist_name` AS `remarklist_name`,`data_remarklist`.`remarklist_price` AS `remarklist_price`,`data_remarklist`.`remarklist_style` AS `remarklist_style`,`data_remarklist`.`udate` AS `udate` from `data_remarklist` order by `data_remarklist`.`remarklist_no`,`data_remarklist`.`remark_id` ;

-- ----------------------------
-- View structure for `client_data_table`
-- ----------------------------
DROP VIEW IF EXISTS `client_data_table`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_data_table` AS select `data_table`.`table_id` AS `table_id`,`data_table`.`store_id` AS `store_id`,`data_table`.`no` AS `table_no`,`data_table`.`name` AS `table_name`,`data_table`.`location` AS `location`,`data_table`.`remark` AS `table_remark`,`data_table`.`udate` AS `udate` from `data_table` ;

-- ----------------------------
-- View structure for `client_data_vender`
-- ----------------------------
DROP VIEW IF EXISTS `client_data_vender`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_data_vender` AS select `data_vender`.`vender_id` AS `vender_id`,`data_vender`.`vender_no` AS `vender_no`,`data_vender`.`vender_name` AS `vender_name`,`data_vender`.`vender_tel` AS `vender_tel`,`data_vender`.`vender_fax` AS `vender_fax`,`data_vender`.`vender_address` AS `vender_address`,`data_vender`.`vender_email` AS `vender_email`,`data_vender`.`vender_taxid` AS `vender_taxid`,`data_vender`.`vender_contact` AS `vender_contact`,`data_vender`.`vender_remark` AS `vender_remark`,`data_vender`.`udate` AS `udate` from `data_vender` ;

-- ----------------------------
-- View structure for `data_employee_view`
-- ----------------------------
DROP VIEW IF EXISTS `data_employee_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `data_employee_view` AS select `data_employee`.`employee_id` AS `employee_id`,`data_employee`.`employee_no` AS `employee_no`,`data_employee`.`employee_name` AS `employee_name`,`data_employee`.`employee_sex` AS `employee_sex`,`data_employee`.`employee_cardnum` AS `employee_cardnum`,`data_employee`.`employee_pass` AS `employee_pass`,`data_employee`.`employee_tel` AS `employee_tel`,`data_employee`.`employee_fax` AS `employee_fax`,`data_employee`.`employee_birthday` AS `employee_birthday`,`data_employee`.`employee_level` AS `employee_level`,`data_employee`.`employee_mobile` AS `employee_mobile`,`data_employee`.`employee_email` AS `employee_email`,`data_employee`.`createdate` AS `createdate`,`data_employee`.`udate` AS `udate`,`data_employee`.`uby` AS `uby` from `data_employee` where (`data_employee`.`employee_level` <> 0) ;

-- ----------------------------
-- View structure for `gklatestno_view`
-- ----------------------------
DROP VIEW IF EXISTS `gklatestno_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gklatestno_view` AS select `stock_collection`.`collection_no` AS `no` from `stock_collection` order by `stock_collection`.`collection_id` desc limit 0,1 ;

-- ----------------------------
-- View structure for `item4json_view`
-- ----------------------------
DROP VIEW IF EXISTS `item4json_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `item4json_view` AS select `data_item`.`ordering` AS `list`,`data_item`.`item_id` AS `id`,`data_item`.`item_no` AS `no`,`data_item`.`item_name` AS `name`,`data_item`.`item_class` AS `class`,`data_item`.`item_point` AS `point`,`data_item`.`item_saleprice1` AS `price`,`data_item`.`item_barcode` AS `barcode`,`data_item`.`item_image` AS `image` from `data_item` where (`data_item`.`item_show` = 1) order by `data_item`.`ordering` ;

-- ----------------------------
-- View structure for `menu_view`
-- ----------------------------
DROP VIEW IF EXISTS `menu_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `menu_view` AS select `menu`.`id` AS `id`,`menu`.`title` AS `title`,`menu`.`note` AS `note`,`menu`.`type` AS `type`,`menu`.`path` AS `path`,`menu`.`group` AS `group`,`menu`.`link` AS `link`,`menu`.`level` AS `level`,`menu`.`parent_id` AS `parent_id`,`menu`.`access` AS `access`,`menu`.`ordering` AS `ordering`,`menu`.`img` AS `img`,`menu`.`menu_date` AS `menu_date`,`menu`.`display` AS `display`,`menu`.`position` AS `position` from `menu` where (`menu`.`display` = 1) order by `menu`.`parent_id`,`menu`.`ordering` ;

-- ----------------------------
-- View structure for `purchase_item_view`
-- ----------------------------
DROP VIEW IF EXISTS `purchase_item_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `purchase_item_view` AS select `pr`.`receipt_no` AS `receipt_no`,`prl`.`receiptlist_id` AS `receiptlist_id`,`dst`.`store_id` AS `store_id`,`dst`.`store_name` AS `store_name`,`dv`.`vender_id` AS `vender_id`,`dv`.`vender_name` AS `vender_name`,`dc`.`class_id` AS `class_id`,`dc`.`class_name` AS `class_name`,`db`.`brand_id` AS `brand_id`,`db`.`brand_name` AS `brand_name`,`di`.`item_no` AS `item_no`,`di`.`item_name` AS `item_name`,`prl`.`receiptlist_price` AS `price`,`prl`.`receiptlist_total` AS `total`,`pr`.`receipt_date` AS `date` from ((((((`purchase_receiptlist` `prl` join `purchase_receipt` `pr`) join `data_item` `di`) join `data_store` `dst`) left join `data_vender` `dv` on((`di`.`item_vender` = `dv`.`vender_id`))) left join `data_class` `dc` on((`di`.`item_class` = `dc`.`class_id`))) left join `data_brand` `db` on((`di`.`item_brand` = `db`.`brand_id`))) where ((`prl`.`receipt_id` = `pr`.`receipt_id`) and (`prl`.`item_id` = `di`.`item_id`) and (`pr`.`store_no` = `dst`.`store_no`) and (`pr`.`display` = 1)) ;

-- ----------------------------
-- View structure for `simple_item_view`
-- ----------------------------
DROP VIEW IF EXISTS `simple_item_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `simple_item_view` AS select `ds`.`store_no` AS `store_no`,`ds`.`store_name` AS `store_name`,`dv`.`vender_name` AS `vender_name`,`dc`.`class_name` AS `class_name`,`db`.`brand_name` AS `brand_name`,`si`.`inventory_location` AS `location`,`di`.`item_no` AS `item_no`,`di`.`item_name` AS `item_name` from (((((`data_item` `di` join `data_store` `ds`) left join `data_vender` `dv` on((`di`.`item_vender` = `dv`.`vender_id`))) left join `data_class` `dc` on((`di`.`item_class` = `dc`.`class_id`))) left join `data_brand` `db` on((`di`.`item_brand` = `db`.`brand_id`))) join `stock_inventory` `si`) where ((`si`.`item_no` = `di`.`item_no`) and (`si`.`display` = 1)) ;

-- ----------------------------
-- View structure for `statistice_detail_veiw`
-- ----------------------------
DROP VIEW IF EXISTS `statistice_detail_veiw`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `statistice_detail_veiw` AS select `srl`.`saleslist_spk` AS `saleslist_spk`,`srl`.`sales_no` AS `sales_no`,`srl`.`station_no` AS `station_no`,`srl`.`store_id` AS `store_id`,`dst`.`store_name` AS `store_name`,`sr`.`customer_id` AS `customer_id`,`sr`.`customer_name` AS `customer_name`,`dc`.`class_id` AS `class_id`,`dv`.`vender_id` AS `vender_id`,`dt`.`item_no` AS `item_no`,`dv`.`vender_name` AS `vender_name`,`dc`.`class_name` AS `class_name`,`dt`.`item_name` AS `item_name`,format(`srl`.`saleslist_quantity`,0) AS `saleslist_quantity`,`srl`.`saleslist_tax` AS `saleslist_tax`,`srl`.`saleslist_cost` AS `saleslist_cost`,`srl`.`saleslist_discount` AS `saleslist_discount`,`srl`.`saleslist_expenses` AS `saleslist_expenses`,`srl`.`remark` AS `remark`,date_format(`srl`.`udate`,_utf8'%Y-%m-%e') AS `udate`,`srl`.`saleslist_allowance` AS `saleslist_allowance`,`srl`.`saleslist_plus` AS `saleslist_plus`,`sr`.`debtdate` AS `debtdate`,`sr`.`employee_name` AS `employee_name` from (((((`sales_receiptlist` `srl` join `sales_receipt` `sr`) left join `data_item` `dt` on((`srl`.`item_id` = `dt`.`item_id`))) left join `data_class` `dc` on((`dc`.`class_id` = `dt`.`item_class`))) left join `data_vender` `dv` on((`dv`.`vender_id` = `dt`.`item_vender`))) left join `data_store` `dst` on((`dst`.`store_id` = `srl`.`store_id`))) where ((`sr`.`status` = _utf8'8') and (`sr`.`sales_no` = `srl`.`sales_no`) and (`sr`.`store_id` = `srl`.`store_id`) and (`sr`.`station_no` = `srl`.`station_no`)) order by `srl`.`store_id`,`srl`.`station_no`,`srl`.`sales_no` ;

-- ----------------------------
-- View structure for `statistice_payment_view`
-- ----------------------------
DROP VIEW IF EXISTS `statistice_payment_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `statistice_payment_view` AS select `spl`.`paymentlist_spk` AS `paymentlist_spk`,concat(`spl`.`store_id`,`spl`.`station_no`,`spl`.`sales_no`,`dp`.`paytypeGroup`) AS `pkey`,`spl`.`store_id` AS `store_id`,`dst`.`store_name` AS `store_name`,`spl`.`station_no` AS `station_no`,`spl`.`sales_no` AS `sales_no`,`sr`.`customer_name` AS `customer_name`,`cur`.`curname` AS `curname`,`rates`.`rates` AS `rates`,sum(`spl`.`paymentlist_amount`) AS `amount`,`sr`.`sales_excessivepayment` AS `sales_excessivepayment`,(sum(`spl`.`paymentlist_amount`) - `sr`.`sales_excessivepayment`) AS `account`,`spl`.`paymentlist_remark` AS `remark`,`spl`.`udate` AS `udate`,`spl`.`status` AS `status`,`dp`.`paytypeGroup` AS `paytypeGroup` from ((((((`sales_paymentlist` `spl` join `sales_payment` `sp`) join `data_store` `dst`) join `trans_curid` `cur`) join `trans_rates` `rates`) join `sales_receipt` `sr`) join `data_paydesc` `dp`) where ((`spl`.`store_id` = `sp`.`store_id`) and (`spl`.`station_no` = `sp`.`station_no`) and (`spl`.`sales_no` = `sp`.`sales_no`) and (`spl`.`store_id` = `dst`.`store_id`) and (`spl`.`status` = _utf8'8') and (`spl`.`curid` = `cur`.`curid`) and (`spl`.`rate_id` = `rates`.`rate_id`) and (`sp`.`sales_no` = `sr`.`sales_no`) and (`sp`.`store_id` = `sr`.`store_id`) and (`sp`.`station_no` = `sr`.`station_no`) and (`spl`.`paytype` = `dp`.`paytype`)) group by concat(`spl`.`store_id`,`spl`.`station_no`,`spl`.`sales_no`,`dp`.`paytypeGroup`) order by `spl`.`store_id`,`spl`.`station_no`,`spl`.`sales_no` ;

-- ----------------------------
-- View structure for `statistice_trade_view`
-- ----------------------------
DROP VIEW IF EXISTS `statistice_trade_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `statistice_trade_view` AS select `sr`.`sales_spk` AS `sales_spk`,`sr`.`sales_no` AS `sales_no`,`sr`.`store_id` AS `store_id`,`dst`.`store_name` AS `store_name`,`sr`.`station_no` AS `station_no`,`de`.`employee_name` AS `employee_name`,`dc`.`customer_name` AS `customer_name`,`sr`.`sales_tax` AS `sales_tax`,`sr`.`creditcard_no` AS `creditcard_no`,`sr`.`sales_amount` AS `sales_amount`,`sr`.`sales_allowance` AS `sales_allowance`,`sr`.`sales_exemption` AS `sales_exemption`,`sr`.`sales_total` AS `sales_total`,`sr`.`sales_plus` AS `sales_plus`,`sr`.`sales_discount` AS `sales_discount`,`sr`.`customer_total` AS `customer_total`,`sr`.`debtdate` AS `debtdate` from (((`sales_receipt` `sr` left join `data_employee` `de` on((`sr`.`employee_name` = `de`.`employee_name`))) left join `data_store` `dst` on((`sr`.`store_id` = `dst`.`store_id`))) left join `data_customer` `dc` on((`sr`.`customer_id` = `dc`.`customer_id`))) where (`sr`.`status` = _utf8'8') order by `sr`.`store_id`,`sr`.`station_no`,`sr`.`sales_no` ;

-- ----------------------------
-- View structure for `statistics_item_view`
-- ----------------------------
DROP VIEW IF EXISTS `statistics_item_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `statistics_item_view` AS select `statistice_detail_veiw`.`store_id` AS `store_id`,`statistice_detail_veiw`.`class_id` AS `class_id`,`statistice_detail_veiw`.`item_no` AS `item_no`,`statistice_detail_veiw`.`store_name` AS `store_name`,`statistice_detail_veiw`.`vender_name` AS `vender_name`,`statistice_detail_veiw`.`class_name` AS `class_name`,`statistice_detail_veiw`.`item_name` AS `item_name`,format(sum(`statistice_detail_veiw`.`saleslist_quantity`),0) AS `saleslist_quantity`,sum(`statistice_detail_veiw`.`saleslist_tax`) AS `saleslist_tax`,`statistice_detail_veiw`.`saleslist_cost` AS `saleslist_cost`,`statistice_detail_veiw`.`saleslist_discount` AS `saleslist_discount`,`statistice_detail_veiw`.`saleslist_expenses` AS `saleslist_expenses`,`statistice_detail_veiw`.`saleslist_allowance` AS `saleslist_allowance`,`statistice_detail_veiw`.`saleslist_plus` AS `saleslist_plus` from `statistice_detail_veiw` group by `statistice_detail_veiw`.`store_id`,`statistice_detail_veiw`.`item_no` ;

-- ----------------------------
-- View structure for `stock_collectiondiff_view`
-- ----------------------------
DROP VIEW IF EXISTS `stock_collectiondiff_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stock_collectiondiff_view` AS select `sc`.`collection_id` AS `collection_id`,`sc`.`collection_no` AS `collection_no`,`siv`.`store_no` AS `store_no`,`siv`.`store_name` AS `store_name`,`siv`.`vender_name` AS `vender_name`,`siv`.`class_name` AS `class_name`,`siv`.`brand_name` AS `brand_name`,`siv`.`location` AS `location`,`scl`.`item_no` AS `item_no`,`siv`.`item_name` AS `item_name`,`si`.`inventory_total` AS `inventory_total`,`si`.`inventory_average` AS `inventory_average`,`si`.`inventory_amount` AS `inventory_amount`,`scl`.`total` AS `total`,`scl`.`average` AS `average`,(`scl`.`total` * `scl`.`average`) AS `collection_amount`,((`scl`.`total` * `scl`.`average`) - `si`.`inventory_amount`) AS `collection_difference`,`sc`.`collection_remark` AS `collection_remark` from (((`simple_item_view` `siv` join `stock_inventory` `si`) join `stock_collection` `sc`) join `stock_collectionlist` `scl`) where ((`siv`.`store_no` = `sc`.`store_no`) and ((`siv`.`item_no` = `scl`.`item_no`) = `si`.`item_no`) and (`sc`.`collection_no` = `scl`.`collection_no`)) ;

-- ----------------------------
-- View structure for `stock_record_view`
-- ----------------------------
DROP VIEW IF EXISTS `stock_record_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stock_record_view` AS select `SI`.`inventorylist_id` AS `id`,`DS`.`store_name` AS `store_name`,`SI`.`inventorylist_date` AS `date`,`DI`.`item_no` AS `item_no`,`DI`.`item_name` AS `item_name`,`SI`.`list_judge` AS `list_judge`,`SI`.`list_no` AS `list_no`,`SI`.`ori_total` AS `ori_total`,`SI`.`chg_total` AS `chg_total`,(`SI`.`ori_total` + `SI`.`chg_total`) AS `now_total`,`SI`.`employee_name` AS `employee_name` from ((`stock_inventorylist` `SI` join `data_item` `DI`) join `data_store` `DS`) where ((`SI`.`item_id` = `DI`.`item_id`) and (`SI`.`store_no` = `DS`.`store_no`)) order by `SI`.`inventorylist_id` desc ;

-- ----------------------------
-- View structure for `stocktaking_view`
-- ----------------------------
DROP VIEW IF EXISTS `stocktaking_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stocktaking_view` AS select `ss`.`stocktaking_id` AS `stocktaking_id`,`ds`.`store_no` AS `store_no`,`ds`.`store_name` AS `store_name`,date_format(`ss`.`stocktaking_date`,_utf8'%Y-%m-%d %h:%i:%s') AS `stocktaking_date`,`ss`.`collection_no` AS `collection_no`,`ss`.`stocktaking_no` AS `stocktaking_no`,if((`ss`.`checked` = 0),_utf8'',_utf8'V') AS `checked` from (`stock_stocktaking` `ss` join `data_store` `ds`) where (`ss`.`store_no` = `ds`.`store_no`) ;

-- ----------------------------
-- View structure for `stocktakinglist_view`
-- ----------------------------
DROP VIEW IF EXISTS `stocktakinglist_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stocktakinglist_view` AS select `sst`.`stocktakinglist_id` AS `stocktakinglist_id`,`siv`.`store_no` AS `store_no`,`ss`.`stocktaking_no` AS `stocktaking_no`,`siv`.`vender_name` AS `vender_name`,`siv`.`class_name` AS `class_name`,`siv`.`brand_name` AS `brand_name`,`siv`.`location` AS `location`,`siv`.`item_no` AS `item_no`,`siv`.`item_name` AS `item_name`,`sst`.`quantity` AS `quantity` from ((`simple_item_view` `siv` join `stock_stocktaking` `ss`) join `stock_stocktakinglist` `sst`) where ((`siv`.`store_no` = `ss`.`store_no`) and (`siv`.`item_no` = `sst`.`item_no`) and (`ss`.`stocktaking_no` = `sst`.`stocktaking_no`)) ;

-- ----------------------------
-- View structure for `view_paydefined`
-- ----------------------------
DROP VIEW IF EXISTS `view_paydefined`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_paydefined` AS select `dp`.`pay_index` AS `pay_index`,`dp`.`store_id` AS `store_id`,`dp`.`station_id` AS `station_id`,`dp`.`payno` AS `payno`,`dp`.`payname` AS `payname`,`dp`.`paytype` AS `paytype`,`dpd`.`upable` AS `upable`,`dp`.`targetItem` AS `targetItem`,`dpd`.`sign` AS `sign`,`dp`.`payamount` AS `payamount`,`dpd`.`returnable` AS `returnable`,`dp`.`returntype` AS `returntype`,`dp`.`paygroup` AS `paygroup`,`dp`.`userestrictions` AS `userestrictions`,`dp`.`totalrestrictions` AS `totalrestrictions`,`dp`.`period` AS `period` from (`data_payment` `dp` join `data_paydesc` `dpd`) where ((`dp`.`paytype` = `dpd`.`paytype`) and (`dpd`.`show` = 1)) ;

-- ----------------------------
-- View structure for `view_program_assoc`
-- ----------------------------
DROP VIEW IF EXISTS `view_program_assoc`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_program_assoc` AS select `ds`.`store_id` AS `store_id`,`pa`.`station_id` AS `station_id`,`pd`.`program_id` AS `program_id`,`pd`.`program_no` AS `program_no`,`pd`.`program_name` AS `program_name`,`pa`.`program_argv` AS `program_argv`,`pd`.`program_content` AS `program_content`,`pd`.`program_label` AS `program_label`,`pd`.`associateKey` AS `associateKey`,`pa`.`program_class` AS `program_class`,`pa`.`ordering` AS `ordering`,`pa`.`client_active` AS `client_active`,`pd`.`program_active` AS `program_active` from ((`program_assoc` `pa` left join `data_station` `ds` on((`ds`.`station_id` = `pa`.`station_id`))) left join `program_definition` `pd` on((`pd`.`program_id` = `pa`.`program_id`))) ;

-- ----------------------------
-- View structure for `view_remark_assoc`
-- ----------------------------
DROP VIEW IF EXISTS `view_remark_assoc`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_remark_assoc` AS select `DR`.`remark_id` AS `remark_id`,`DR`.`remark_no` AS `remark_no`,`DR`.`remark_name` AS `remark_name`,`DR`.`remark_type` AS `remark_type`,`DR`.`remark_style` AS `remark_style`,`DRL`.`remarklist_id` AS `remarklist_id`,`DRL`.`remarklist_no` AS `remarklist_no`,`DRL`.`remarklist_name` AS `remarklist_name`,`DRL`.`remarklist_price` AS `remarklist_price`,`DRL`.`remarklist_style` AS `remarklist_style`,`DRA`.`remarkassoc_tbid` AS `class_id` from ((`data_remark` `DR` join `data_remarklist` `DRL`) join `data_remarkassoc` `DRA`) where ((`DRA`.`remark_id` = `DR`.`remark_id`) and (`DR`.`remark_id` = `DRL`.`remark_id`) and (`DRA`.`remarkassoc_tbname` = 'data_class')) ;

-- ----------------------------
-- View structure for `view_SpecialSales`
-- ----------------------------
DROP VIEW IF EXISTS `view_SpecialSales`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_SpecialSales` AS select `ssr`.`special_rule_index` AS `special_rule_index`,`ssr`.`special_no` AS `special_no`,`ssr`.`special_type` AS `special_type`,`sp`.`flag_integrated` AS `flag_integrated`,`sp`.`flag_integratedAmount` AS `flag_integratedAmount`,`sp`.`flag_integratedTotal` AS `flag_integratedTotal`,`sp`.`flag_integratedCustomerLevel` AS `flag_integratedCustomerLevel`,`sp`.`flag_integratedTime` AS `flag_integratedTime`,`sp`.`flag_integratedUserestrictions` AS `flag_integratedUserestrictions`,`sp`.`flag_integratedTotalrestrictions` AS `flag_integratedTotalrestrictions`,`sp`.`flag_integratedGift` AS `flag_integratedGift`,`sp`.`flag_integratedAllowance` AS `flag_integratedAllowance`,`sp`.`flag_individual_min_quantity` AS `flag_individual_min_quantity`,`sp`.`flag_individual_max_quantity` AS `flag_individual_max_quantity`,`sp`.`flag_individualTimeout` AS `flag_individualTimeout`,`sp`.`flag_individual_item_price_flag` AS `flag_individual_item_price_flag`,`sp`.`flag_individual_alterDiscount` AS `flag_individual_alterDiscount`,`sp`.`flag_individual_alterPrice` AS `flag_individual_alterPrice`,`ssr`.`require_amount` AS `require_amount`,`ssr`.`require_total` AS `require_total`,`ssr`.`require_customer_level` AS `require_customer_level`,`ssr`.`period` AS `period`,`ssr`.`time_start` AS `time_start`,`ssr`.`time_end` AS `time_end`,`ssr`.`allowance` AS `allowance`,`ssr`.`userestrictions` AS `userestrictions`,`ssr`.`totalrestrictions` AS `totalrestrictions`,`ssr`.`establishdate` AS `establishdate`,`ssr`.`individual` AS `individual`,`ssr`.`active` AS `active`,`ssrl`.`special_rulelist_index` AS `special_rulelist_index`,`ssrl`.`item_id` AS `item_id`,`ssrl`.`require_min_quantity` AS `require_min_quantity`,`ssrl`.`require_max_quantity` AS `require_max_quantity`,`ssrl`.`timeout` AS `timeout`,`ssrl`.`item_price_flag` AS `item_price_flag`,`ssrl`.`alterDiscount` AS `alterDiscount`,`ssrl`.`alterPrice` AS `alterPrice` from ((`SpecialSales_rule` `ssr` left join `SpecialSales_rulelist` `ssrl` on((`ssr`.`special_rule_index` = `ssrl`.`special_rule_index`))) join `SpecialSales_pattern` `sp`) where (`ssr`.`special_type` = `sp`.`special_type`) ;

-- ----------------------------
-- Procedure structure for `create_purchase_view`
-- ----------------------------
DROP PROCEDURE IF EXISTS `create_purchase_view`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_purchase_view`(purchase_type  TINYINT(1), Vstore INT(20),date_start DATE,date_end DATE)
    COMMENT '參數 purchase_type: 1代表進貨/2代表退貨'
BEGIN

DECLARE tmp_date date;	

IF TO_DAYS(`date_start`) > TO_DAYS(`date_end`) THEN
	SET tmp_date = `date_start`;
	SET `date_start` = `date_end`; 
	SET `date_end` = tmp_date;
END IF;

IF purchase_type=1 THEN 

DROP TABLE IF EXISTS purchase_temp_view ;
CREATE TABLE purchase_temp_view ENGINE=MEMORY
SELECT 
`purchase_item_view`.`vender_id` AS `vender_id`,
`purchase_item_view`.`vender_name` AS `vender_name`,
`purchase_item_view`.`class_id` AS `class_id`,
`purchase_item_view`.`class_name` AS `class_name`,
`purchase_item_view`.`brand_id` AS `brand_id`,
`purchase_item_view`.`brand_name` AS `brand_name`,
`purchase_item_view`.`item_no` AS `item_no`,
`purchase_item_view`.`item_name` AS `item_name`,
format(avg(`purchase_item_view`.`price`),2) AS `avg_price`,
sum(`purchase_item_view`.`total`) AS `total`,
sum(`purchase_item_view`.`price` * `purchase_item_view`.`total`) AS `amount`

FROM `purchase_item_view`
WHERE `purchase_item_view`.`store_id`=`Vstore` and `purchase_item_view`.`date` between `date_start` AND DATE_ADD(`date_end`,INTERVAL 1 DAY) and `purchase_item_view`.`total`>=0
GROUP BY `purchase_item_view`.`item_no`;


ELSEIF purchase_type=2 THEN

DROP TABLE IF EXISTS purchase_temp_view ;
CREATE TABLE purchase_temp_view ENGINE=MEMORY
SELECT
`purchase_item_view`.`vender_id` AS `vender_id`,
`purchase_item_view`.`vender_name` AS `vender_name`,
`purchase_item_view`.`class_id` AS `class_id`,
`purchase_item_view`.`class_name` AS `class_name`,
`purchase_item_view`.`brand_id` AS `brand_id`,
`purchase_item_view`.`brand_name` AS `brand_name`,
`purchase_item_view`.`item_no` AS `item_no`,
`purchase_item_view`.`item_name` AS `item_name`,
format(avg(`purchase_item_view`.`price`),2) AS `avg_price`,
sum(`purchase_item_view`.`total`) AS `total`,
sum(`purchase_item_view`.`price` * `purchase_item_view`.`total`) AS `amount`

FROM `purchase_item_view`
WHERE `purchase_item_view`.`store_id`=`Vstore` and `purchase_item_view`.`date` between `date_start` AND DATE_ADD(`date_end`,INTERVAL 1 DAY) and `purchase_item_view`.`total`<0
GROUP BY `purchase_item_view`.`item_no`;
 

END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `create_statistice_view`
-- ----------------------------
DROP PROCEDURE IF EXISTS `create_statistice_view`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_statistice_view`(group_store INT(20),group_column VARCHAR(20),date_start DATE,date_end DATE,Vstation_no VARCHAR(2))
BEGIN

DECLARE tmp_date date;	

IF TO_DAYS(`date_start`) > TO_DAYS(`date_end`) THEN
	SET tmp_date = `date_start`;
	SET `date_start` = `date_end`; 
	SET `date_end` = tmp_date;
END IF;

IF group_store <> 0 THEN

DROP TABLE IF EXISTS statistic_temp_view ;
CREATE TABLE statistic_temp_view ENGINE=MEMORY
SELECT 
`statistice_detail_veiw`.`store_id` AS `store_id`,
`statistice_detail_veiw`.`store_name` AS `store_name`,
`statistice_detail_veiw`.`station_no` AS `station_no`,
`statistice_detail_veiw`.`class_id` AS `class_id`,
`statistice_detail_veiw`.`class_name` AS `class_name`,
`statistice_detail_veiw`.`customer_id` AS `customer_id`,
`statistice_detail_veiw`.`customer_name` AS `customer_name`,
`statistice_detail_veiw`.`item_no` AS `item_no`,
`statistice_detail_veiw`.`item_name` AS `item_name`,
`statistice_detail_veiw`.`vender_name` AS `vender_name`,
`statistice_detail_veiw`.`employee_name` AS `employee_name`,
format(sum(`statistice_detail_veiw`.`saleslist_quantity`),0) AS `saleslist_quantity`,
sum(`statistice_detail_veiw`.`saleslist_tax`) AS `saleslist_tax`,
sum(`statistice_detail_veiw`.`saleslist_cost`) AS `saleslist_cost`,
sum(`statistice_detail_veiw`.`saleslist_discount`) AS `saleslist_discount`,
sum(`statistice_detail_veiw`.`saleslist_expenses`) AS `saleslist_expenses`,
sum(`statistice_detail_veiw`.`saleslist_allowance`) AS `saleslist_allowance`,
sum(`statistice_detail_veiw`.`saleslist_plus`) AS `saleslist_plus`,
CONCAT(DATE_FORMAT(`statistice_detail_veiw`.`debtdate`,'%Y-%m-%d   %H:00~'),DATE_FORMAT(`statistice_detail_veiw`.`debtdate`,'%H:59')) AS `per_hour` 
from `statistice_detail_veiw` 
where `debtdate` between `date_start` AND DATE_ADD(`date_end`,INTERVAL 1 DAY) AND `store_id` = group_store AND IF(Vstation_no='',1,`station_no`= Vstation_no)
group by `statistice_detail_veiw`.`store_id`, IF (group_column='item_no',`statistice_detail_veiw`.`item_no`,IF(group_column='class_id',`statistice_detail_veiw`.`class_id`,IF(group_column='vender_id',`statistice_detail_veiw`.`vender_id`,IF(group_column='employee_name',`statistice_detail_veiw`.`employee_name`,IF(group_column='customer_id',`statistice_detail_veiw`.`customer_id`,IF(group_column='debtdate',DATE_FORMAT(`debtdate`,'%Y%m%d%H'),IF(group_column='station_no',`statistice_detail_veiw`.`station_no`,3)))))));

ELSE

DROP TABLE IF EXISTS statistic_temp_view ;
CREATE TABLE statistic_temp_view ENGINE=MEMORY
SELECT 
`statistice_detail_veiw`.`store_id` AS `store_id`,
`statistice_detail_veiw`.`store_name` AS `store_name`,
`statistice_detail_veiw`.`station_no` AS `station_no`,
`statistice_detail_veiw`.`class_id` AS `class_id`,
`statistice_detail_veiw`.`class_name` AS `class_name`,
`statistice_detail_veiw`.`customer_id` AS `customer_id`,
`statistice_detail_veiw`.`customer_name` AS `customer_name`,
`statistice_detail_veiw`.`item_no` AS `item_no`,
`statistice_detail_veiw`.`item_name` AS `item_name`,
`statistice_detail_veiw`.`vender_name` AS `vender_name`,
`statistice_detail_veiw`.`employee_name` AS `employee_name`,
format(sum(`statistice_detail_veiw`.`saleslist_quantity`),0) AS `saleslist_quantity`,
sum(`statistice_detail_veiw`.`saleslist_tax`) AS `saleslist_tax`,
sum(`statistice_detail_veiw`.`saleslist_cost`) AS `saleslist_cost`,
sum(`statistice_detail_veiw`.`saleslist_discount`) AS `saleslist_discount`,
sum(`statistice_detail_veiw`.`saleslist_expenses`) AS `saleslist_expenses`,
sum(`statistice_detail_veiw`.`saleslist_allowance`) AS `saleslist_allowance`,
sum(`statistice_detail_veiw`.`saleslist_plus`) AS `saleslist_plus`,
CONCAT(DATE_FORMAT(`statistice_detail_veiw`.`debtdate`,'%Y-%m-%d   %H:00~'),DATE_FORMAT(`statistice_detail_veiw`.`debtdate`,'%H:59')) AS `per_hour` 
from `statistice_detail_veiw` 
where `debtdate` between `date_start` AND DATE_ADD(`date_end`,INTERVAL 1 DAY) AND IF(Vstation_no='',1,`station_no`= Vstation_no)
group by `statistice_detail_veiw`.`store_id`, IF (group_column='item_no',`statistice_detail_veiw`.`item_no`,IF(group_column='class_id',`statistice_detail_veiw`.`class_id`,IF(group_column='vender_id',`statistice_detail_veiw`.`vender_id`,IF(group_column='employee_name',`statistice_detail_veiw`.`employee_name`,IF(group_column='customer_id',`statistice_detail_veiw`.`customer_id`,IF(group_column='debtdate',DATE_FORMAT(`debtdate`,'%Y%m%d%H'),IF(group_column='station_no',`statistice_detail_veiw`.`station_no`,3)))))));

END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `procedure_sales_calculate`
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_sales_calculate`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_sales_calculate`(sno VARCHAR(64))
BEGIN
	DECLARE allowance FLOAT(8,2) DEFAULT 0.0;
	DECLARE spk VARCHAR(64);
	DECLARE target VARCHAR(64);
	DEClARE temp_price FLOAT(8,2) DEFAULT 0.0;
	DECLARE plus FLOAT(8,2) DEFAULT 0.0;
	DECLARE remainder_allowance FLOAT(8,2) DEFAULT 0.0;
	DECLARE remainder_plus FLOAT(8,2) DEFAULT 0.0;
	DECLARE amount FLOAT(8,2) DEFAULT 0.0;
	DECLARE temp_allowance FLOAT(8,2) DEFAULT 0.0;
	DECLARE temp_plus FLOAT(8,2) DEFAULT 0.0;
	DECLARE price FLOAT(8,2) DEFAULT 0.0;
	DECLARE done INT DEFAULT 0;
	DECLARE mycursor CURSOR FOR SELECT `saleslist_spk`, `saleslist_expenses` FROM `sales_receiptlist` WHERE `sales_no` = (SELECT `sales_no` FROM `sales_receipt` WHERE `sales_spk` = sno);
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

	SELECT `sales_plus`, `sales_allowance`, `sales_amount` INTO plus, allowance, amount FROM `sales_receipt` WHERE `sales_receipt`.`sales_spk` = sno;
	SET remainder_allowance = allowance;
	SET remainder_plus = plus;

	OPEN mycursor;
	myloop:LOOP
		FETCH mycursor INTO spk, price;

		IF NOT done THEN
			SET temp_allowance = ROUND(allowance * price / amount, 2);
			SET temp_plus =  ROUND(plus * price / amount, 2);
			SET remainder_allowance = remainder_allowance - temp_allowance;
			SET remainder_plus = remainder_plus - temp_plus;
			UPDATE `sales_receiptlist` SET `saleslist_allowance` = temp_allowance, `saleslist_plus` = temp_plus WHERE `saleslist_spk` = spk;

			IF price > temp_price THEN
				SET temp_price = price;
				SET target = spk;
			END IF;

		ELSE
			LEAVE myloop;
		END IF;
	END LOOP myloop;

	CLOSE mycursor;

	UPDATE `sales_receiptlist` SET `saleslist_allowance` = `saleslist_allowance` + remainder_allowance, `saleslist_plus` = `saleslist_plus` + remainder_plus WHERE `saleslist_spk` = target;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `test`
-- ----------------------------
DROP PROCEDURE IF EXISTS `test`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `test`()
BEGIN
DECLARE item VARCHAR(16);
DECLARE quity FLOAT DEFAULT 0.0;
DECLARE sumt FLOAT DEFAULT 0.0;
DECLARE flag INT DEFAULT 0;
DECLARE done INT DEFAULT 0;
DECLARE mycursor CURSOR FOR SELECT item_no, quantity FROM `stock_stocktakinglist` WHERE `stocktaking_no` = 'CK11040703';
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
#UPDATE `stock_stocktaking` SET `collection_no` = 'GK11040801', `checked` = 1 WHERE `stock_stocktaking`.`stocktaking_id` = 1180;

OPEN mycursor;
myloop:LOOP
  FETCH mycursor INTO item, quity;

	IF NOT done THEN  

  SELECT COUNT(`collectionlist_id`) INTO flag FROM `stock_collectionlist` WHERE `stock_collectionlist`.`collection_no` = 'GK11040801' AND `item_no` = '004';
	#SELECT flag;

  IF flag = 0 THEN
      INSERT INTO `stock_collectionlist`(`collection_no`, `item_no`, `total`) VALUES('GK11040801', '004', 10);
  ELSE 
      SELECT `total` INTO sumt FROM `stock_collectionlist` WHERE `collection_no` = NEW.`collection_no` AND `item_no` = item;
      SET sumt = sumt + quity;
      UPDATE `stock_collectionlist` SET `total` = sumt WHERE `collection_no` = 'GK11040801' AND `item_no` = '004';
  END IF;
	
	ELSE
		LEAVE myloop;
	END IF;

  #IF done = 1 THEN
	#		SELECT 1;
  #    LEAVE myloop;
  #END IF;
END LOOP myloop;

CLOSE mycursor;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `authenticate`
-- ----------------------------
DROP FUNCTION IF EXISTS `authenticate`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `authenticate`(user_no CHAR(30), user_pass CHAR(30)) RETURNS char(30) CHARSET utf8
BEGIN
  DECLARE xname CHAR(30);
  SELECT `data_employee`.`employee_name` INTO xname
    FROM `data_employee` WHERE MD5(`data_employee`.`employee_no`) = MD5(user_no) AND `data_employee`.`employee_pass` = MD5(user_pass);
  RETURN xname;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `getLatestNO`
-- ----------------------------
DROP FUNCTION IF EXISTS `getLatestNO`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getLatestNO`(storeno CHAR(6), title CHAR(2)) RETURNS char(10) CHARSET utf8
BEGIN
  DECLARE lastNo VARCHAR(10);
  DECLARE newstr VARCHAR(10);
  DECLARE y VARCHAR(2);
  DECLARE m VARCHAR(2);
  DECLARE d VARCHAR(2);
  DECLARE sno VARCHAR(2);
  SET sno = '01';
  #SELECT MAX(`receipt_no`) INTO lastNo FROM `purchase_receipt` WHERE `store_no` = storeno;
	IF title = 'CK' THEN
		SELECT MAX(`stocktaking_no`) INTO lastNo FROM `stock_stocktaking` WHERE `store_no` = storeno LIMIT 0,1 FOR UPDATE;
	END IF;
	IF title = 'GK' THEN
		SELECT MAX(`collection_no`) INTO lastNo FROM `stock_collection` WHERE `store_no` = storeno LIMIT 0,1 FOR UPDATE;
	END IF;
	IF title = 'RD' THEN
		SELECT MAX(`receipt_no`) INTO lastNo FROM `purchase_receipt` WHERE `store_no` = storeno LIMIT 0,1 FOR UPDATE;
	END IF;	
 
  IF lastNo IS NULL THEN
     SET lastNo = '0101010100';
  END IF;
  SET y = SUBSTRING(lastNo, 3, 2);
  SET m = SUBSTRING(lastNo, 5, 2);
  SET d = SUBSTRING(lastNo, 7, 2);
  IF STRCMP(DATE_FORMAT(CURRENT_DATE, '%y'), y) >= 0 THEN
    SET y = DATE_FORMAT(CURRENT_DATE, '%y');
  END IF;

  IF STRCMP(DATE_FORMAT(CURRENT_DATE, '%m'), m) >= 0 THEN
    SET m = DATE_FORMAT(CURRENT_DATE, '%m');
  END IF;
  IF STRCMP(DATE_FORMAT(CURRENT_DATE, '%d'), d) >= 0 OR STRCMP(DATE_FORMAT(CURRENT_DATE, '%m'), SUBSTRING(lastNo, 5, 2)) > 0 THEN
    SET d = DATE_FORMAT(CURRENT_DATE, '%d');
  END IF;

  IF STRCMP(DATE_FORMAT(CURRENT_DATE, '%d'), SUBSTRING(lastNo, 7, 2))=0 THEN
    SET sno = CAST(SUBSTRING(lastNo, 9, 2) AS UNSIGNED INTEGER)+1 ;
    SET sno = LPAD(sno, 2, '0');
  END IF;

  #SET newstr = CONCAT('RD', y, m, d, sno);
  SET newstr = CONCAT(title, y, m, d, sno);
  RETURN  newstr;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `item_before_update`;
DELIMITER ;;
CREATE TRIGGER `item_before_update` BEFORE UPDATE ON `data_item` FOR EACH ROW BEGIN


UPDATE `stock_inventory` SET `stock_inventory`.`item_no` = NEW.`item_no` WHERE  `stock_inventory`.`item_id` = OLD.`item_id`;



END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `insertafter_insert_log`;
DELIMITER ;;
CREATE TRIGGER `insertafter_insert_log` AFTER INSERT ON `data_remarkassoc` FOR EACH ROW BEGIN
DECLARE temp VARCHAR(255);
SET temp = CONCAT('INSERT INTO `data_remarkassoc` (remark_id, remarkassoc_tbid, remarkassoc_tbname) VALUES(' ,(NEW.`remark_id`),',',(NEW.`remarkassoc_tbid`),',"',(NEW.`remarkassoc_tbname`),'")');

INSERT INTO `log` (`tbname`,`tbindex`,`statement_sql`,`statement_quote`) VALUES(NEW.`remarkassoc_tbname`,NEW.`remark_id`,(temp), CONCAT('新增資料,索引為[',NEW.remarkassoc_id,']'));

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `delafter_insertdel_log`;
DELIMITER ;;
CREATE TRIGGER `delafter_insertdel_log` AFTER DELETE ON `data_remarkassoc` FOR EACH ROW BEGIN
DECLARE temp VARCHAR(255);

SET temp =  CONCAT('DELETE FROM `data_remarkassoc` WHERE `remark_id`=',(OLD.`remark_id`),' AND `remarkassoc_tbid` =', (OLD.`remarkassoc_tbid`),' AND `remarkassoc_tbname` = "', (OLD.`remarkassoc_tbname`),'";');

INSERT INTO `log` (`tbname`,`tbindex`,`statement_sql`) VALUES(OLD.`remarkassoc_tbname`,OLD.`remark_id`,(temp));

END
;;
DELIMITER ;
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
DROP TRIGGER IF EXISTS `stocktaking_update_before`;
DELIMITER ;;
CREATE TRIGGER `stocktaking_update_before` BEFORE UPDATE ON `stock_stocktaking` FOR EACH ROW BEGIN
DECLARE item VARCHAR(16);
DECLARE quity FLOAT DEFAULT 0.0;
DECLARE avg FLOAT DEFAULT 0.0;
DECLARE sumt FLOAT DEFAULT 0.0;
DECLARE flag int DEFAULT 0;
DECLARE done INT DEFAULT 0;
DECLARE mycursor CURSOR FOR SELECT `stock_stocktakinglist`.`item_no`, `stock_stocktakinglist`.`quantity` FROM `stock_stocktakinglist` WHERE `stock_stocktakinglist`.`stocktaking_no` = OLD.`stocktaking_no`;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

OPEN mycursor;
myloop:LOOP
  FETCH mycursor INTO item, quity;

 # IF done = 1 THEN    LEAVE myloop;  END IF;
IF NOT done THEN 
  SELECT COUNT(`stock_collectionlist`.`collectionlist_id`) INTO flag FROM `stock_collectionlist` WHERE `stock_collectionlist`.`collection_no` = NEW.`collection_no` AND `item_no` = item;
  SELECT `stock_inventory`.`inventory_average` INTO avg FROM `stock_inventory` WHERE `item_no`=item AND `display`=1 AND `store_no`=OLD.`store_no`;

  IF flag = 0 THEN
      INSERT INTO `stock_collectionlist`(`collection_no`, `item_no`, `total`,`average`) VALUES(NEW.`collection_no`, item, quity,avg);
  ELSE
      SELECT `total` INTO sumt FROM `stock_collectionlist` WHERE `collection_no` = NEW.`collection_no` AND `item_no` = item;
      SET sumt = sumt + quity;
      UPDATE `stock_collectionlist` SET `total` = sumt WHERE `collection_no` = NEW.`collection_no` AND `item_no` = item;
  END IF;
ELSE
  LEAVE myloop;
END IF;
END LOOP myloop;
CLOSE mycursor;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `stocktaking_before_insert`;
DELIMITER ;;
CREATE TRIGGER `stocktaking_before_insert` BEFORE INSERT ON `stock_stocktakinglist` FOR EACH ROW BEGIN

DECLARE flag int;

SELECT COUNT(DISTINCT `item_no`) INTO flag FROM `stock_inventory` WHERE `stock_inventory`.`display` = 1 AND `stock_inventory`.`item_no` = NEW.item_no AND `stock_inventory`.`store_no` = NEW.`store_no`;


IF flag = 0 THEN
INSERT INTO `stock_inventory` (`store_no`,`item_id`, `item_no`, `inventory_average`,`inventory_location`) VALUES(New.store_no,(SELECT `item_id` FROM `data_item` WHERE `item_no`=NEW.item_no), NEW.item_no, (SELECT `data_item`.`item_cost` FROM `data_item` WHERE `data_item`.`item_no` = NEW.item_no),(SELECT `data_item`.`item_location` FROM `data_item` WHERE `data_item`.`item_no` = NEW.item_no) );

END IF;


END
;;
DELIMITER ;
