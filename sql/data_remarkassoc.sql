/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.253
Source Server Version : 50154
Source Host           : 192.168.2.253:3306
Source Database       : conductor

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2012-01-11 08:59:29
*/

SET FOREIGN_KEY_CHECKS=0;

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
