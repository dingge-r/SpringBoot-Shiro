/*
Navicat MySQL Data Transfer

Source Server         : mybase
Source Server Version : 80003
Source Host           : localhost:3306
Source Database       : xdclass

Target Server Type    : MYSQL
Target Server Version : 80003
File Encoding         : 65001

Date: 2020-03-05 10:38:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for chapter
-- ----------------------------
DROP TABLE IF EXISTS `chapter`;
CREATE TABLE `chapter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `video_id` int(11) DEFAULT NULL COMMENT '视频主键',
  `title` varchar(128) DEFAULT NULL COMMENT '章节名称',
  `ordered` int(11) DEFAULT NULL COMMENT '章节顺序',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chapter
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(256) DEFAULT NULL COMMENT '内容',
  `user_id` int(11) DEFAULT NULL,
  `head_img` varchar(128) DEFAULT NULL COMMENT '用户头像',
  `name` varchar(128) DEFAULT NULL COMMENT '昵称',
  `point` double(5,2) DEFAULT NULL COMMENT '评分，10分满分',
  `up` int(11) DEFAULT NULL COMMENT '点赞数',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `video_id` int(11) DEFAULT NULL COMMENT '视频id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cname` char(50) NOT NULL,
  `number` char(50) NOT NULL,
  `starttime` date DEFAULT NULL,
  `endtime` date DEFAULT NULL,
  `state` char(10) DEFAULT NULL,
  `mark` char(20) DEFAULT NULL,
  `type` char(30) DEFAULT NULL,
  `typetwo` varchar(30) DEFAULT NULL,
  `typethree` varchar(255) DEFAULT NULL,
  `money` varchar(255) DEFAULT NULL,
  `ifframe` char(20) DEFAULT NULL,
  `contraname` varchar(255) DEFAULT NULL,
  `contranum` char(30) DEFAULT NULL,
  `ifstock` char(30) DEFAULT NULL,
  `ifpurchase` char(30) DEFAULT NULL,
  `ifprequest` char(30) DEFAULT NULL,
  `purchasetype` varchar(255) DEFAULT NULL,
  `ifppifurequest` char(30) DEFAULT NULL,
  `ifstandard` char(30) DEFAULT NULL,
  `ifequal` char(30) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `cproject` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cproject` (`cproject`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of contract
-- ----------------------------

-- ----------------------------
-- Table structure for detail
-- ----------------------------
DROP TABLE IF EXISTS `detail`;
CREATE TABLE `detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `settleprice` char(10) DEFAULT NULL,
  `notaxsettle` varchar(255) DEFAULT NULL,
  `paymentprice` char(50) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `money` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `money` (`money`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of detail
-- ----------------------------

-- ----------------------------
-- Table structure for episode
-- ----------------------------
DROP TABLE IF EXISTS `episode`;
CREATE TABLE `episode` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(524) DEFAULT NULL COMMENT '集标题',
  `num` int(10) DEFAULT NULL COMMENT '第几集',
  `duration` varchar(64) DEFAULT NULL COMMENT '时长 分钟，单位',
  `cover_img` varchar(524) DEFAULT NULL COMMENT '封面图',
  `video_id` int(10) DEFAULT NULL COMMENT '视频id',
  `summary` varchar(256) DEFAULT NULL COMMENT '集概述',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `chapter_id` int(11) DEFAULT NULL COMMENT '章节主键id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of episode
-- ----------------------------

-- ----------------------------
-- Table structure for materiel
-- ----------------------------
DROP TABLE IF EXISTS `materiel`;
CREATE TABLE `materiel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mname` char(50) DEFAULT NULL,
  `type` char(50) DEFAULT NULL,
  `unit` char(20) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `price` char(50) DEFAULT NULL,
  `sumprice` char(100) DEFAULT NULL,
  `remark` char(100) DEFAULT NULL,
  `mproject` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mproject` (`mproject`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of materiel
-- ----------------------------

-- ----------------------------
-- Table structure for money
-- ----------------------------
DROP TABLE IF EXISTS `money`;
CREATE TABLE `money` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `factoryname` varchar(255) DEFAULT NULL,
  `cargoname` varchar(255) DEFAULT NULL,
  `contractprice` char(50) DEFAULT NULL,
  `settleprice` varchar(255) DEFAULT NULL,
  `paymentprice` varchar(255) DEFAULT NULL,
  `paymentdatil` int(11) DEFAULT NULL,
  `project` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `project` (`project`) USING BTREE,
  CONSTRAINT `detail` FOREIGN KEY (`id`) REFERENCES `detail` (`money`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of money
-- ----------------------------

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `blocname` char(30) NOT NULL,
  `companyname` char(30) NOT NULL,
  `projectbranchname` char(255) DEFAULT NULL,
  `projectname` varchar(255) DEFAULT NULL,
  `code` char(50) DEFAULT NULL,
  `retendernum` char(30) DEFAULT NULL,
  `year` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `project` FOREIGN KEY (`id`) REFERENCES `money` (`project`),
  CONSTRAINT `project1` FOREIGN KEY (`id`) REFERENCES `contract` (`cproject`),
  CONSTRAINT `projectm` FOREIGN KEY (`id`) REFERENCES `materiel` (`mproject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of project
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `perms` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', 'user:add');
INSERT INTO `user` VALUES ('2', 'hh', 'bb', 'user:update');

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(524) DEFAULT NULL COMMENT '视频标题',
  `summary` varchar(1026) DEFAULT NULL COMMENT '概述',
  `cover_img` varchar(524) DEFAULT NULL COMMENT '封面图',
  `view_num` int(10) DEFAULT '0' COMMENT '观看数',
  `price` int(11) DEFAULT NULL COMMENT '价格,分',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `online` int(5) DEFAULT '0' COMMENT '0表示未上线，1表示上线',
  `point` double(11,2) DEFAULT '8.70' COMMENT '默认8.7，最高10分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('2', '高级教程', '这是概要', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/upload/video/video_cover.png', '43', '500', null, '0', '9.70');
INSERT INTO `video` VALUES ('3', 'JMeter接口测试入门到实战', '这是概要', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/upload/video/video_cover.png', '53', '123', null, '0', '8.70');
INSERT INTO `video` VALUES ('4', 'Spring Boot2.x零基础入门到高级实战', '这是概要', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/upload/video/video_cover.png', '23', '199', null, '0', '6.20');
INSERT INTO `video` VALUES ('5', '亿级流量处理搜索', '这是概要', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/upload/video/video_cover.png', '64', '10', null, '0', '9.10');
INSERT INTO `video` VALUES ('6', 'reidis消息队列高级实战', '这是概要', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/upload/video/video_cover.png', '12', '10', null, '0', '6.70');
INSERT INTO `video` VALUES ('7', '谷歌面试题', '这是概要', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/upload/video/video_cover.png', '52', '23', null, '0', '5.10');
INSERT INTO `video` VALUES ('8', 'js高级前端视频', '这是概要', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/upload/video/video_cover.png', '54', '442', null, '0', '8.70');
INSERT INTO `video` VALUES ('9', 'java高级教程', '动态语句测试', null, null, null, null, null, null);
INSERT INTO `video` VALUES ('10', '微信支付实战666', null, null, null, null, null, null, '0.00');
INSERT INTO `video` VALUES ('11', 'java高级教程', '动态语句测试', null, null, null, null, null, null);
INSERT INTO `video` VALUES ('12', 'C高级教程', '动态语句测试', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for video_order
-- ----------------------------
DROP TABLE IF EXISTS `video_order`;
CREATE TABLE `video_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(32) DEFAULT NULL COMMENT '用户标示',
  `out_trade_no` varchar(64) DEFAULT NULL COMMENT '订单唯一标识',
  `state` int(11) DEFAULT NULL COMMENT '0表示未支付，1表示已支付',
  `create_time` datetime DEFAULT NULL COMMENT '订单生成时间',
  `notify_time` datetime DEFAULT NULL COMMENT '支付回调时间',
  `total_fee` int(11) DEFAULT NULL COMMENT '支付金额，单位分',
  `nickname` varchar(32) DEFAULT NULL COMMENT '微信昵称',
  `head_img` varchar(128) DEFAULT NULL COMMENT '微信头像',
  `video_id` int(11) DEFAULT NULL COMMENT '视频主键',
  `video_title` varchar(128) DEFAULT NULL COMMENT '视频名称',
  `video_img` varchar(256) DEFAULT NULL COMMENT '视频图片',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `ip` varchar(64) DEFAULT NULL COMMENT '用户ip地址',
  `del` int(5) DEFAULT '0' COMMENT '0表示未删除，1表示已经删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_order
-- ----------------------------
INSERT INTO `video_order` VALUES ('1', 'werwewfwe', 'dasfweqdqf', '1', '2018-07-12 00:00:00', '2018-07-12 00:00:00', '12', '小D', 'xxx', '1', 'SpringBoot视频', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/upload/video/video_cover.png', '1', '192.154.2.32', '0');
INSERT INTO `video_order` VALUES ('2', '3452333', 'gasdfdf', '1', '2018-07-12 00:00:00', '2018-07-12 00:00:00', '12', '小X', 'xxx', '2', '2018年 6.2新版本ELK ElasticSearch ', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/upload/video/video_cover.png', '2', '192.154.2.32', '0');
INSERT INTO `video_order` VALUES ('3', 'sfsd', '432werew', '1', '2018-07-12 00:00:00', '2018-07-12 00:00:00', '12', '小C', 'xxx', '3', 'JMeter接口测试入门到实战', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/upload/video/video_cover.png', '3', '192.154.2.32', '0');
INSERT INTO `video_order` VALUES ('4', 'werqwe', '3432', '1', '2018-07-12 00:00:00', '2018-07-12 00:00:00', '12', '小D', 'xxx', '2', '2018年 6.2新版本ELK ElasticSearch ', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/upload/video/video_cover.png', '1', '192.154.2.32', '0');
