/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : cy

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-09-14 15:42:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dou_admin
-- ----------------------------
DROP TABLE IF EXISTS `dou_admin`;
CREATE TABLE `dou_admin` (
  `user_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `action_level` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '权限级别',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `last_login` int(11) NOT NULL DEFAULT '0',
  `last_ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_admin
-- ----------------------------
INSERT INTO `dou_admin` VALUES ('1', 'admin', '', 'e10adc3949ba59abbe56e057f20f883e', '99', '1478503787', '1505282651', '36.57.144.255');
INSERT INTO `dou_admin` VALUES ('2', 'lothar', '', 'e10adc3949ba59abbe56e057f20f883e', '50', '1478503787', '1502855307', '127.0.0.1');
INSERT INTO `dou_admin` VALUES ('3', 'ask1', '', 'e10adc3949ba59abbe56e057f20f883e', '10', '1478503787', '1502855307', '127.0.0.1');

-- ----------------------------
-- Table structure for dou_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `dou_admin_log`;
CREATE TABLE `dou_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for dou_apply
-- ----------------------------
DROP TABLE IF EXISTS `dou_apply`;
CREATE TABLE `dou_apply` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) NOT NULL DEFAULT '0',
  `lang_id` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言id',
  `title` varchar(150) NOT NULL DEFAULT '',
  `defined` text NOT NULL,
  `content` longtext NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_apply
-- ----------------------------
INSERT INTO `dou_apply` VALUES ('1', '4', '1', '肠胃医疗', '', '上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。于2003年3月获得国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。', 'images/apply/1_1502259965291618.jpg', '', '', '', '1502259965', '14', '0');
INSERT INTO `dou_apply` VALUES ('10', '0', '2', 'Ear, Nose, Throat', '', '', '', '', '', '', '1505118989', '0', '0');
INSERT INTO `dou_apply` VALUES ('11', '2', '2', 'Pulmonology', '', '', '', '', '', '', '1505119002', '0', '0');
INSERT INTO `dou_apply` VALUES ('12', '1', '2', 'Gastroenterology', '', '', '', '', '', '', '1505119013', '1', '0');
INSERT INTO `dou_apply` VALUES ('14', '9', '2', '测试', '', '演示数据', 'images/apply/14_1505281873936488.jpg', '', '', '', '1505281873', '0', '0');
INSERT INTO `dou_apply` VALUES ('15', '0', '2', '测试数据', '', '演示数据', 'images/apply/15_1505281943376658.jpg', '', '', '', '1505281943', '0', '0');
INSERT INTO `dou_apply` VALUES ('5', '5', '1', '呼吸呼吸下', '', '呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下', 'images/apply/5_1504692610144342.jpg', '', '', '', '1504692610', '1', '0');
INSERT INTO `dou_apply` VALUES ('6', '6', '1', '五官五官五官五官五官', '', '五官五官五官五官五官五官五官五官五官五官五官五官五官五官五官五官', 'images/apply/6_1504692647802170.jpg', '', '', '', '1504692647', '2', '0');

-- ----------------------------
-- Table structure for dou_apply_category
-- ----------------------------
DROP TABLE IF EXISTS `dou_apply_category`;
CREATE TABLE `dou_apply_category` (
  `cat_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(30) NOT NULL DEFAULT '',
  `lang_id` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言id',
  `cat_name` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `parent_id` smallint(5) NOT NULL DEFAULT '0',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_apply_category
-- ----------------------------
INSERT INTO `dou_apply_category` VALUES ('1', 'Gastroenterology', '2', '消化科', '', '', '0', '10');
INSERT INTO `dou_apply_category` VALUES ('2', 'Pulmonology', '2', '呼吸科', '', '', '0', '20');
INSERT INTO `dou_apply_category` VALUES ('3', 'EarNoseThroat', '2', '耳鼻喉科', '', '', '0', '30');
INSERT INTO `dou_apply_category` VALUES ('4', 'xh', '1', '消化科', '', '', '0', '10');
INSERT INTO `dou_apply_category` VALUES ('5', 'hx', '1', '呼吸科', '', '', '0', '50');
INSERT INTO `dou_apply_category` VALUES ('6', 'wg', '1', '五官科', '', '', '0', '60');
INSERT INTO `dou_apply_category` VALUES ('9', 'cs', '2', '测试1', '', '', '0', '50');

-- ----------------------------
-- Table structure for dou_article
-- ----------------------------
DROP TABLE IF EXISTS `dou_article`;
CREATE TABLE `dou_article` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) NOT NULL DEFAULT '0',
  `lang_id` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言id',
  `title` varchar(150) NOT NULL DEFAULT '',
  `defined` text NOT NULL COMMENT '自定义',
  `content` longtext NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '主图',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '小图标',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击量',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键词',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template` varchar(70) NOT NULL DEFAULT '' COMMENT '指定模板',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_article
-- ----------------------------
INSERT INTO `dou_article` VALUES ('1', '1', '1', '公司官网2017正式上线', '', '<p>\r\n	上线计划中……\r\n</p>\r\n<p>\r\n	上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。于2003年3月获得国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。于2003年3月获得国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。于2003年3月获得国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家, 内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。于2003年3月获得国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。\r\n</p>\r\n<p>\r\n	上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。于2003年3月获得国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。\r\n</p>', 'images/article/1_1502089823949049.png', '', '1502089823', '0', '', '', 'news_info.html', '1');
INSERT INTO `dou_article` VALUES ('2', '1', '1', '成运最新科研成果', '', '发布最新黑科技', 'images/article/2_1502090615070399.jpg', '', '1502090067', '0', '', '', 'news_info.html', '2');
INSERT INTO `dou_article` VALUES ('3', '1', '1', '武汉CMEF展会', '', '展位号A6F07', 'images/article/3_1502090681985419.jpg', '', '1502090433', '1', '', '', 'news_info.html', '3');
INSERT INTO `dou_article` VALUES ('6', '2', '1', '活动标题1', '', '活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1', 'images/article/6_1502093524275396.png', '', '1502093499', '0', '', '', 'article.dwt', '1');
INSERT INTO `dou_article` VALUES ('4', '1', '1', '第31届中国国际医疗器械（山东）博览会', '', '我公司于3月12日至3月14日参加第31届中国国际医疗器械（山东）博览会', '', '', '1502090471', '0', '', '', 'news_info.html', '4');
INSERT INTO `dou_article` VALUES ('5', '1', '1', '第25届中原医疗器械展览会', '', '我公司于3月6日至3月8日参加第25届中原医疗器械展览会', 'images/article/5_1502090507168845.jpg', '', '1502090507', '0', '', '', 'news_info.html', '5');
INSERT INTO `dou_article` VALUES ('7', '2', '1', '活动标题2', '', '活动内容2', 'images/article/7_1502094412504215.jpg', '', '1502093617', '0', '', '', 'article.dwt', '2');
INSERT INTO `dou_article` VALUES ('8', '2', '1', '活动标题3', '', '活动内容3', 'images/article/8_1502094391092479.png', '', '1502094391', '0', '', '', 'article.dwt', '3');
INSERT INTO `dou_article` VALUES ('9', '3', '1', '服务1', '', '400-800-00000', '', '', '1502244202', '0', '', '400-800-00000', 'article.dwt', '1');
INSERT INTO `dou_article` VALUES ('10', '3', '1', '服务2', '', 'HUGER after sales departmen', '', '', '1502244232', '0', '', 'HUGER after sales departmen', 'article.dwt', '2');
INSERT INTO `dou_article` VALUES ('11', '3', '1', '服务3', '', 'No. 1328 Yao North Road, Shanghai, Songjiang District', '', '', '1502244276', '0', '', 'No. 1328 Yao North Road, Shanghai, Songjiang District', 'article.dwt', '3');
INSERT INTO `dou_article` VALUES ('12', '4', '2', 'Launching Company\'s Official Website on 8th of Oct. 2017', '', '<p class=\"MsoNormal\">\r\n	HUGER MEDICAI is delighted to\r\nlaunch her new official website. This new website contains HUGER’s general\r\ninformation, products and services, R&amp;D results and News &amp; Events. It\r\nalso plays the role of a platform for customers contacting with us. We hope you\r\nfind what you would like to know via surfing this website or reach at the\r\nperson who is right the one in charge of your enquiries and problems.\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	Hope your enjoy this website and\r\nif you have any questions or suggestions, we sincerely appreciate you let us\r\nknow. <span></span> \r\n</p>', '', '', '1503292376', '0', '', '', 'news_info.html', '50');
INSERT INTO `dou_article` VALUES ('13', '6', '2', 'Services 1', '', '<span style=\"color:#000000;font-family:\" font-size:12px;font-style:normal;font-weight:normal;\"=\"\"><br />\r\n</span>', '', '', '1503292525', '0', '', '400-800-00000', 'article.dwt', '1');
INSERT INTO `dou_article` VALUES ('14', '6', '2', 'Services 2', '', '<span style=\"color:#000000;font-family:&quot;font-size:12px;font-style:normal;font-weight:normal;\">HUGER after sales departmen</span>', '', '', '1503294182', '0', '', '', 'article.dwt', '2');
INSERT INTO `dou_article` VALUES ('15', '6', '2', 'Services 3', '', '<span style=\"color:#000000;font-family:&quot;font-size:12px;font-style:normal;font-weight:normal;\">No. 1328 Yao North Road, Shanghai, Songjiang District</span>', '', '', '1503294218', '0', '', '', 'article.dwt', '3');
INSERT INTO `dou_article` VALUES ('16', '5', '2', 'Activity title 1', '', 'Activity Content 1', '', '', '1503294310', '0', '', '', 'article.dwt', '1');
INSERT INTO `dou_article` VALUES ('17', '5', '2', 'Activity Title 21', '', 'Activity Content 2', '', '', '1503294352', '0', '', '', 'article.dwt', '2');

-- ----------------------------
-- Table structure for dou_article_category
-- ----------------------------
DROP TABLE IF EXISTS `dou_article_category`;
CREATE TABLE `dou_article_category` (
  `cat_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(30) NOT NULL DEFAULT '' COMMENT '别名',
  `parent_id` smallint(5) NOT NULL DEFAULT '0',
  `lang_id` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言id',
  `cat_name` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `template` varchar(70) NOT NULL DEFAULT '' COMMENT '指定模板',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_article_category
-- ----------------------------
INSERT INTO `dou_article_category` VALUES ('1', 'gsnews', '0', '1', '公司新闻', '', '', '', '定期更新公司新闻', 'news.html', '50');
INSERT INTO `dou_article_category` VALUES ('2', 'activity', '0', '1', '公司活动', '', '', '活动', '', 'article_category.dwt', '50');
INSERT INTO `dou_article_category` VALUES ('3', 'service', '0', '1', '服务中心', '', '<ul class=\"serviceIntro\">\r\n<li class=\"serviceIntro_items\">\r\n<h6>\r\n最亲切的守护力量服务，让亲近更有价值\r\n</h6>\r\n<p>\r\n上海成运医疗器械股份有限公司是一家中德技术合作企业，公司的主要生产医用电子内窥镜。于2003年3月获得了国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。\r\n</p>\r\n</li>\r\n<li class=\"serviceIntro_items\">\r\n<h6>\r\n最亲切的守护力量服务，让亲近更有价值\r\n</h6>\r\n<p>\r\n上海成运医疗器械股份有限公司是一家中德技术合作企业，公司的主要生产医用电子内窥镜。于2003年3月获得了国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。\r\n</p>\r\n</li>\r\n<li class=\"serviceIntro_items\">\r\n<h6>\r\n最亲切的守护力量服务，让亲近更有价值\r\n</h6>\r\n<p>\r\n上海成运医疗器械股份有限公司是一家中德技术合作企业，公司的主要生产医用电子内窥镜。于2003年3月获得了国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。\r\n</p>\r\n</li>\r\n<li class=\"serviceIntro_items\">\r\n<h6>\r\n最亲切的守护力量服务，让亲近更有价值\r\n</h6>\r\n<p>\r\n上海成运医疗器械股份有限公司是一家中德技术合作企业，公司的主要生产医用电子内窥镜。于2003年3月获得了国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。\r\n</p>\r\n</li>\r\n</ul>', '', '最亲切的守护力量服务，让亲近更有价值\r\n上海成运医疗器械股份有限公司是一家中德技术合作企业，公司的主要生产医用电子内窥镜。于2003年3月获得了国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。', 'serviceCenter.html', '50');
INSERT INTO `dou_article_category` VALUES ('5', 'act-en', '0', '2', 'Activity', '', '<p class=\"MsoNormal\">\r\n	<br />\r\n</p>', '', 'HUGER MEDICAL is delighted to launch her new official website. This new website contains HUGER’s general information, products and services, R&D results and News & Events. It also plays the role of a platform for customers contacting with us. We hope you ', 'article_category.dwt', '50');
INSERT INTO `dou_article_category` VALUES ('4', 'news-en', '0', '2', 'News', '', '<p class=\"MsoNormal\">\r\n	<br />\r\n</p>', '', 'HUGER MEDICAL is delighted to launch her new official website. This new website contains HUGER’s general information, products and services, R&D results and News & Events. It also plays the role of a platform for customers contacting with us. We hope you ', 'news.html', '50');
INSERT INTO `dou_article_category` VALUES ('6', 'sc-en', '0', '2', 'Service Center', '', '<p class=\"MsoNormal\">\r\n	<br />\r\n</p>', '', '', 'serviceCenter.html', '50');

-- ----------------------------
-- Table structure for dou_cart
-- ----------------------------
DROP TABLE IF EXISTS `dou_cart`;
CREATE TABLE `dou_cart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '产品id组',
  `num_ids` varchar(255) NOT NULL COMMENT '产品数量id组',
  `uid` int(11) unsigned NOT NULL COMMENT '操作用户的id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '操作状态',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时机',
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_cart
-- ----------------------------

-- ----------------------------
-- Table structure for dou_case
-- ----------------------------
DROP TABLE IF EXISTS `dou_case`;
CREATE TABLE `dou_case` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '',
  `defined` text NOT NULL,
  `content` longtext NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_case
-- ----------------------------

-- ----------------------------
-- Table structure for dou_case_category
-- ----------------------------
DROP TABLE IF EXISTS `dou_case_category`;
CREATE TABLE `dou_case_category` (
  `cat_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(30) NOT NULL DEFAULT '',
  `cat_name` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `parent_id` smallint(5) NOT NULL DEFAULT '0',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_case_category
-- ----------------------------

-- ----------------------------
-- Table structure for dou_config
-- ----------------------------
DROP TABLE IF EXISTS `dou_config`;
CREATE TABLE `dou_config` (
  `name` varchar(80) NOT NULL COMMENT 'j键名',
  `value` text NOT NULL COMMENT '键值（默认）',
  `value2` text NOT NULL COMMENT '键值（2英文）',
  `type` varchar(10) NOT NULL DEFAULT '',
  `box` varchar(255) NOT NULL DEFAULT '',
  `tab` varchar(10) NOT NULL DEFAULT 'main',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `display` mediumint(8) NOT NULL DEFAULT '50'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_config
-- ----------------------------
INSERT INTO `dou_config` VALUES ('site_name', '成运网站', 'As luck website', 'text', '', 'main', '1', '1');
INSERT INTO `dou_config` VALUES ('site_title', '成运网站', 'As luck website', 'text', '', 'main', '2', '1');
INSERT INTO `dou_config` VALUES ('site_keywords', '成运网站', 'As luck website', 'text', '', 'main', '3', '1');
INSERT INTO `dou_config` VALUES ('site_description', '成运网站', 'As luck website', 'text', '', 'main', '4', '1');
INSERT INTO `dou_config` VALUES ('site_logo', 'logo.png', 'logo.png', 'file', '', 'main', '5', '1');
INSERT INTO `dou_config` VALUES ('site_closed', '0', '0', 'radio', '', 'main', '6', '1');
INSERT INTO `dou_config` VALUES ('company', '上海成运医疗器械股份有限公司', 'Shanghai chengyun medical equipment co. LTD', 'text', '', 'main', '7', '1');
INSERT INTO `dou_config` VALUES ('site_address', '中国上海市松江区莘砖公路3825号', 'No. 3825, xinbrick road, songjiang district, Shanghai, China', 'text', '', 'main', '7', '1');
INSERT INTO `dou_config` VALUES ('icp', '沪ICP备05048542', '沪ICP备05048542', 'text', '', 'main', '8', '1');
INSERT INTO `dou_config` VALUES ('certi', '《互联网药品信息服务资格证》证书编号：（沪）-非经营性-2010-0063', 'Certificate no. : (Shanghai) - non-operating -2010-0063', 'text', '', 'main', '8', '1');
INSERT INTO `dou_config` VALUES ('tel', '+86-21-67691764', '+86-21-67691764', 'text', '', 'main', '9', '1');
INSERT INTO `dou_config` VALUES ('fax', '+86-21-67691721', '+86-21-67691721', 'text', '', 'main', '10', '1');
INSERT INTO `dou_config` VALUES ('qq', '', '', 'text', '', 'main', '11', '1');
INSERT INTO `dou_config` VALUES ('email', 'inform@huger.cn', 'inform@huger.cn', 'text', '', 'main', '12', '1');
INSERT INTO `dou_config` VALUES ('language', 'en_us', 'en_us', 'select', '', 'main', '13', '1');
INSERT INTO `dou_config` VALUES ('rewrite', '0', '0', 'radio', '', 'main', '14', '1');
INSERT INTO `dou_config` VALUES ('sitemap', '0', '0', 'radio', '', 'main', '15', '1');
INSERT INTO `dou_config` VALUES ('captcha', '0', '0', 'radio', '', 'main', '16', '1');
INSERT INTO `dou_config` VALUES ('guestbook_check_chinese', '1', '1', 'radio', '', 'main', '17', '1');
INSERT INTO `dou_config` VALUES ('code', '', '', 'textarea', '', 'main', '18', '1');
INSERT INTO `dou_config` VALUES ('thumb_width', '135', '135', 'text', '', 'display', '1', '1');
INSERT INTO `dou_config` VALUES ('thumb_height', '135', '135', 'text', '', 'display', '2', '1');
INSERT INTO `dou_config` VALUES ('price_decimal', '2', '2', 'text', '', 'display', '3', '1');
INSERT INTO `dou_config` VALUES ('display', 'a:10:{s:7:\"article\";s:1:\"1\";s:12:\"home_article\";s:1:\"5\";s:7:\"product\";s:2:\"10\";s:12:\"home_product\";s:1:\"4\";s:5:\"apply\";s:2:\"10\";s:10:\"home_apply\";s:1:\"5\";s:8:\"research\";s:1:\"9\";s:13:\"home_research\";s:1:\"5\";s:3:\"job\";s:2:\"20\";s:8:\"home_job\";s:1:\"5\";}', 'a:10:{s:7:\"article\";s:1:\"1\";s:12:\"home_article\";s:1:\"5\";s:7:\"product\";s:2:\"10\";s:12:\"home_product\";s:1:\"4\";s:5:\"apply\";s:2:\"10\";s:10:\"home_apply\";s:1:\"5\";s:8:\"research\";s:1:\"9\";s:13:\"home_research\";s:1:\"5\";s:3:\"job\";s:2:\"20\";s:8:\"home_job\";s:1:\"5\";}', 'array', '', 'display', '4', '1');
INSERT INTO `dou_config` VALUES ('defined', 'a:2:{s:7:\"article\";s:0:\"\";s:7:\"product\";s:500:\"尺寸,电压,频率,功率,大小,重量,模拟信号输出,电子信号输出,白平衡,颜色调节,饱和度调节,测光测试,血红蛋白增强,结构增强,边缘增强,冻结,回放,电子放大,增益,画中画,图像存储,视频存储,SD卡,管理文件夹,主灯,灯泡平均寿命,亮度调节,备用灯,备用灯平均寿命,气泵压力,压力档位,方法,视野角,视向,景深(mm),头端外径(mm),头端放大图,插入部外径(mm),钳道内径(mm),弯角,工作长度,总长度\";}', 'a:2:{s:7:\"article\";s:0:\"\";s:7:\"product\";s:547:\"measure,voltage,frequency,power,size,weight,AO,ElectronicSignalOutput,white balance,Rgb,SATURATION,Photometric test,Hemoglobin enhancement,structure enhance,edge enhancement,freeze,playback,Digital zoom,gain,PIP,image storage,video storage,SD Card,Manage Folders,king light,Bulb life,brilliance control,standby lamp,Spare lamp average life,Pump pressure,Pressure gear,Method,field angle,view direction,depth of field(mm),Head end diameter(mm),Head enlargement,Insert external diameter(mm),Pliers way inside(mm),Corner,working length,Overall length\";}', 'array', '', 'defined', '1', '1');
INSERT INTO `dou_config` VALUES ('mail_service', '1', '1', 'radio', '', 'mail', '1', '1');
INSERT INTO `dou_config` VALUES ('mail_host', 'smtp.qq.com', 'smtp.qq.com', 'text', '', 'mail', '2', '1');
INSERT INTO `dou_config` VALUES ('mail_port', '25', '25', 'text', '', 'mail', '3', '1');
INSERT INTO `dou_config` VALUES ('mail_ssl', '0', '0', 'radio', '', 'mail', '4', '1');
INSERT INTO `dou_config` VALUES ('mail_username', 'wowlothar@foxmail.com', 'wowlothar@foxmail.com', 'text', '', 'mail', '5', '1');
INSERT INTO `dou_config` VALUES ('mail_password', 'opqzaolxpbbjbdcf', 'opqzaolxpbbjbdcf', 'text', '', 'mail', '6', '1');
INSERT INTO `dou_config` VALUES ('mobile_name', '成运网站', 'As luck website', 'text', '', 'mobile', '1', '1');
INSERT INTO `dou_config` VALUES ('mobile_title', '成运网站触屏版', 'As luck website', 'text', '', 'mobile', '2', '1');
INSERT INTO `dou_config` VALUES ('mobile_keywords', '成运网站触屏版', 'As luck website', 'text', '', 'mobile', '3', '1');
INSERT INTO `dou_config` VALUES ('mobile_description', '成运网站触屏版', 'As luck website', 'text', '', 'mobile', '4', '1');
INSERT INTO `dou_config` VALUES ('mobile_logo', 'logo.png', 'logo.png', 'file', '', 'mobile', '5', '1');
INSERT INTO `dou_config` VALUES ('mobile_closed', '1', '1', 'radio', '', 'mobile', '6', '1');
INSERT INTO `dou_config` VALUES ('mobile_display', 'a:14:{s:7:\"article\";s:2:\"10\";s:12:\"home_article\";s:1:\"5\";s:7:\"product\";s:2:\"10\";s:12:\"home_product\";s:1:\"4\";s:5:\"video\";s:2:\"10\";s:10:\"home_video\";s:1:\"5\";s:7:\"gallery\";s:2:\"10\";s:12:\"home_gallery\";s:1:\"5\";s:8:\"download\";s:2:\"10\";s:13:\"home_download\";s:1:\"5\";s:4:\"case\";s:2:\"10\";s:9:\"home_case\";s:1:\"5\";s:4:\"user\";s:2:\"10\";s:9:\"home_user\";s:1:\"5\";}', 'a:14:{s:7:\"article\";s:2:\"10\";s:12:\"home_article\";s:1:\"5\";s:7:\"product\";s:2:\"10\";s:12:\"home_product\";s:1:\"4\";s:5:\"video\";s:2:\"10\";s:10:\"home_video\";s:1:\"5\";s:7:\"gallery\";s:2:\"10\";s:12:\"home_gallery\";s:1:\"5\";s:8:\"download\";s:2:\"10\";s:13:\"home_download\";s:1:\"5\";s:4:\"case\";s:2:\"10\";s:9:\"home_case\";s:1:\"5\";s:4:\"user\";s:2:\"10\";s:9:\"home_user\";s:1:\"5\";}', 'array', '', 'mobile', '7', '1');
INSERT INTO `dou_config` VALUES ('site_theme', 'zh_cn', 'zh_cn', 'hidden', '', '', '100', '1');
INSERT INTO `dou_config` VALUES ('mobile_theme', 'default', 'default', 'hidden', '', '', '101', '1');
INSERT INTO `dou_config` VALUES ('build_date', '1478503787', '1478503787', 'hidden', '', '', '102', '1');
INSERT INTO `dou_config` VALUES ('update_number', 'a:6:{s:6:\"update\";s:1:\"0\";s:5:\"patch\";s:1:\"0\";s:6:\"module\";s:1:\"9\";s:6:\"plugin\";s:1:\"0\";s:5:\"theme\";s:1:\"0\";s:6:\"mobile\";N;}', 'a:6:{s:6:\"update\";s:1:\"0\";s:5:\"patch\";s:1:\"0\";s:6:\"module\";s:1:\"9\";s:6:\"plugin\";s:1:\"0\";s:5:\"theme\";s:1:\"0\";s:6:\"mobile\";N;}', 'hidden', '', '', '103', '1');
INSERT INTO `dou_config` VALUES ('update_date', 'a:3:{s:6:\"system\";a:2:{s:6:\"update\";s:8:\"20170424\";s:5:\"patch\";s:8:\"20170424\";}s:6:\"module\";a:12:{s:7:\"article\";s:8:\"20170424\";s:7:\"product\";s:8:\"20170424\";s:9:\"guestbook\";s:8:\"20161107\";s:4:\"link\";s:8:\"20161109\";s:6:\"plugin\";s:8:\"20161109\";s:5:\"video\";s:8:\"20161110\";s:7:\"gallery\";s:8:\"20161110\";s:5:\"excel\";s:8:\"20161110\";s:8:\"download\";s:8:\"20161110\";s:4:\"case\";s:8:\"20161110\";s:5:\"order\";s:8:\"20161110\";s:4:\"user\";s:8:\"20161110\";}s:6:\"plugin\";a:1:{s:7:\"express\";s:8:\"20161109\";}}', 'a:3:{s:6:\"system\";a:2:{s:6:\"update\";s:8:\"20170424\";s:5:\"patch\";s:8:\"20170424\";}s:6:\"module\";a:12:{s:7:\"article\";s:8:\"20170424\";s:7:\"product\";s:8:\"20170424\";s:9:\"guestbook\";s:8:\"20161107\";s:4:\"link\";s:8:\"20161109\";s:6:\"plugin\";s:8:\"20161109\";s:5:\"video\";s:8:\"20161110\";s:7:\"gallery\";s:8:\"20161110\";s:5:\"excel\";s:8:\"20161110\";s:8:\"download\";s:8:\"20161110\";s:4:\"case\";s:8:\"20161110\";s:5:\"order\";s:8:\"20161110\";s:4:\"user\";s:8:\"20161110\";}s:6:\"plugin\";a:1:{s:7:\"express\";s:8:\"20161109\";}}', 'hidden', '', '', '104', '1');
INSERT INTO `dou_config` VALUES ('cloud_account', 'a:2:{s:4:\"user\";s:16:\"keven518@163.com\";s:8:\"password\";s:32:\"e10adc3949ba59abbe56e057f20f883e\";}', 'a:2:{s:4:\"user\";s:16:\"keven518@163.com\";s:8:\"password\";s:32:\"e10adc3949ba59abbe56e057f20f883e\";}', 'hidden', '', '', '105', '1');
INSERT INTO `dou_config` VALUES ('hash_code', '8181e1868966225f612680d39d3aa209', '8181e1868966225f612680d39d3aa209', 'hidden', '', '', '106', '1');
INSERT INTO `dou_config` VALUES ('douphp_version', 'v1.3 Release 20170424', 'v1.3 Release 20170424', 'hidden', '', '', '107', '1');

-- ----------------------------
-- Table structure for dou_district
-- ----------------------------
DROP TABLE IF EXISTS `dou_district`;
CREATE TABLE `dou_district` (
  `cat_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `unique_id` varchar(30) NOT NULL DEFAULT '',
  `cat_name` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`cat_id`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_district
-- ----------------------------
INSERT INTO `dou_district` VALUES ('1', '0', '1', 'China', '中国', '', '', '50');
INSERT INTO `dou_district` VALUES ('2', '1', '1', 'Russia', '俄罗斯', '', '', '50');
INSERT INTO `dou_district` VALUES ('3', '0', '1', 'America', '美国', '', '', '50');

-- ----------------------------
-- Table structure for dou_diy
-- ----------------------------
DROP TABLE IF EXISTS `dou_diy`;
CREATE TABLE `dou_diy` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) NOT NULL DEFAULT '0',
  `lang_id` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `title` varchar(150) NOT NULL DEFAULT '',
  `title2` varchar(150) NOT NULL COMMENT '英文',
  `defined` text NOT NULL,
  `content` longtext NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_diy
-- ----------------------------
INSERT INTO `dou_diy` VALUES ('1', '1', '1', '医疗业', '', '', '', '', '', '1503472276', '0', '', '0');
INSERT INTO `dou_diy` VALUES ('2', '1', '1', '电器', '', '', '', '', '', '1503472292', '0', '', '0');
INSERT INTO `dou_diy` VALUES ('3', '2', '1', '产品经理', '', '', '', '', '', '1503472721', '0', '', '0');
INSERT INTO `dou_diy` VALUES ('4', '2', '1', '技术总监', '', '', '', '', '', '1503472839', '0', '', '0');
INSERT INTO `dou_diy` VALUES ('5', '2', '1', '行政主管', '', '', '', '', '', '1503472887', '0', '', '0');
INSERT INTO `dou_diy` VALUES ('6', '2', '1', '客服', '', '', '', '', '', '1503472912', '0', '', '0');
INSERT INTO `dou_diy` VALUES ('7', '2', '1', '销售', '', '', '', '', '', '1503472926', '0', '', '0');

-- ----------------------------
-- Table structure for dou_diy_category
-- ----------------------------
DROP TABLE IF EXISTS `dou_diy_category`;
CREATE TABLE `dou_diy_category` (
  `cat_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(30) NOT NULL DEFAULT '',
  `lang_id` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `cat_name` varchar(150) NOT NULL DEFAULT '',
  `cat_name2` varchar(150) NOT NULL DEFAULT '' COMMENT '英文',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `parent_id` smallint(5) NOT NULL DEFAULT '0',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_diy_category
-- ----------------------------
INSERT INTO `dou_diy_category` VALUES ('1', 'industry', '1', '所属领域', '', '', '', '0', '10');
INSERT INTO `dou_diy_category` VALUES ('2', 'post', '1', '职业', '', '', '', '0', '20');
INSERT INTO `dou_diy_category` VALUES ('3', 'interest', '1', '兴趣', '', '', '', '0', '30');

-- ----------------------------
-- Table structure for dou_download
-- ----------------------------
DROP TABLE IF EXISTS `dou_download`;
CREATE TABLE `dou_download` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '',
  `defined` text NOT NULL,
  `content` longtext NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `download_link` varchar(255) NOT NULL DEFAULT '',
  `size` varchar(50) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_download
-- ----------------------------

-- ----------------------------
-- Table structure for dou_download_category
-- ----------------------------
DROP TABLE IF EXISTS `dou_download_category`;
CREATE TABLE `dou_download_category` (
  `cat_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(30) NOT NULL DEFAULT '',
  `cat_name` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `parent_id` smallint(5) NOT NULL DEFAULT '0',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_download_category
-- ----------------------------

-- ----------------------------
-- Table structure for dou_gallery
-- ----------------------------
DROP TABLE IF EXISTS `dou_gallery`;
CREATE TABLE `dou_gallery` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `gallery` text NOT NULL,
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_gallery
-- ----------------------------

-- ----------------------------
-- Table structure for dou_gallery_category
-- ----------------------------
DROP TABLE IF EXISTS `dou_gallery_category`;
CREATE TABLE `dou_gallery_category` (
  `cat_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(30) NOT NULL DEFAULT '',
  `cat_name` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `parent_id` smallint(5) NOT NULL DEFAULT '0',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_gallery_category
-- ----------------------------

-- ----------------------------
-- Table structure for dou_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `dou_guestbook`;
CREATE TABLE `dou_guestbook` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `contact_type` varchar(30) NOT NULL DEFAULT '',
  `contact` varchar(150) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `if_show` tinyint(1) NOT NULL DEFAULT '0',
  `if_read` tinyint(1) NOT NULL DEFAULT '0',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `reply_id` smallint(5) NOT NULL DEFAULT '0',
  `toname` varchar(150) NOT NULL COMMENT '接收对象',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `organisation` varchar(200) NOT NULL DEFAULT '' COMMENT '所属机构名称',
  `country` smallint(6) NOT NULL,
  `address` varchar(255) NOT NULL,
  `postcode` varchar(15) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_guestbook
-- ----------------------------
INSERT INTO `dou_guestbook` VALUES ('1', '测试主题', '迪拜', '', '', '网站建议', '0', '0', '127.0.0.1', '1502700076', '0', 'HUGER研发部', '0', '机构', '0', '这是地址', '236000', '13954687952', 'cy@qq.com');
INSERT INTO `dou_guestbook` VALUES ('2', '测试主题', '迪拜', '', '', '网站建议', '0', '0', '127.0.0.1', '1502700102', '0', 'HUGER研发部', '0', '机构', '0', '这是地址', '236000', '13954687952', 'cy@qq.com');
INSERT INTO `dou_guestbook` VALUES ('4', '测试主题', '迪拜', '', '', '网站建议', '0', '1', '127.0.0.1', '1502700296', '0', 'HUGER研发部', '0', '机构', '0', '这是地址', '236000', '13954687952', 'cy@qq.com');

-- ----------------------------
-- Table structure for dou_job
-- ----------------------------
DROP TABLE IF EXISTS `dou_job`;
CREATE TABLE `dou_job` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) NOT NULL DEFAULT '0',
  `lang_id` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言id',
  `title` varchar(150) NOT NULL DEFAULT '',
  `defined` text NOT NULL,
  `content` longtext NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '职位类别',
  `num` smallint(6) unsigned NOT NULL COMMENT '招聘人数',
  `addr` varchar(255) NOT NULL COMMENT '工作地点',
  `link` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_job
-- ----------------------------
INSERT INTO `dou_job` VALUES ('1', '1', '1', '产品经理', '', '', '', '研发', '1', '上海', '', '', '', '1502251203', '5', '0');
INSERT INTO `dou_job` VALUES ('2', '1', '1', '技术总监', '', '<p style=\"color:#3E3E3E;font-family:微软雅黑, sans-serif;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:900;\">产品系统工程师</span> \r\n</p>\r\n<p style=\"color:#3E3E3E;font-family:微软雅黑, sans-serif;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:900;\">工作职责：</span> \r\n</p>\r\n<p style=\"color:#3E3E3E;font-family:微软雅黑, sans-serif;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;\">\r\n	1、负责体外诊断仪器产品系统设计相关开发、验证工作\r\n</p>\r\n<p style=\"color:#3E3E3E;font-family:微软雅黑, sans-serif;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:900;\">职位要求：</span> \r\n</p>\r\n<p style=\"color:#3E3E3E;font-family:微软雅黑, sans-serif;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;\">\r\n	1、生物医学工程、机电一体化、电子测量及仪器、自动化等相关专业，大学本科以上学历；\r\n</p>\r\n<p style=\"color:#3E3E3E;font-family:微软雅黑, sans-serif;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;\">\r\n	2、2年以上仪器系统设计相关工作经验；\r\n</p>\r\n<p style=\"color:#3E3E3E;font-family:微软雅黑, sans-serif;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;\">\r\n	3、熟悉机电系统可靠性设计、仪器信号系统设计、控制系统设计的基本方法和原理，具备相关系统子系统的开发经验；\r\n</p>\r\n<p style=\"color:#3E3E3E;font-family:微软雅黑, sans-serif;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;\">\r\n	4、能够熟练应用QFD、 FMEA、FTA等方法分析分解系统设计问题，熟悉医疗产品风险管理、质量体系管理相关法规；\r\n</p>\r\n<p style=\"color:#3E3E3E;font-family:微软雅黑, sans-serif;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;\">\r\n	5、具备体外诊断仪器产品系统设计经验者优先。\r\n</p>', '', '研发', '1', '上海', '', '', '', '1502251240', '2', '0');
INSERT INTO `dou_job` VALUES ('3', '1', '1', '销售人员', '', '', '', '销售', '5', '上海', '', '', '', '1502251294', '4', '0');
INSERT INTO `dou_job` VALUES ('4', '2', '2', 'Product Manager', '', '', '', 'reseach', '1', 'Shanghai', '', '', '', '1503295158', '0', '0');
INSERT INTO `dou_job` VALUES ('5', '2', '2', 'Technical Director', '', '<p>\r\n	<span>Product System Engineer</span> \r\n</p>\r\n<p>\r\n	<span>Operating Duty</span> \r\n</p>\r\n<p>\r\n	Be responsible for the design, development and validation of in vitro diagnostic instruments.\r\n</p>\r\n<p>\r\n	<span>Job Requirements</span> \r\n</p>\r\n<p>\r\n	1 Bachelor degree or above in biomedical engineering, mechatronics, electronic measurement and instrumentation, automation, etc.\r\n</p>\r\n<p>\r\n	2 More than 2 years work experience in instrument system design.\r\n</p>\r\n<p>\r\n	3 Familiar with the basic methods and principles of mechanical and electrical system reliability design, instrument signal system design, control system design, and related system subsystem development experience.\r\n</p>\r\n<p>\r\n	4 Familiar with QFD, FMEA, FTA and other methods to analyze and decompose system design issues, familiar with medical product risk management, quality system management related laws and regulations.\r\n</p>\r\n<p>\r\n	5 Experience in system design of in vitro diagnostic instruments is preferred.\r\n</p>', '', 'reseach', '1', 'Shanghai', '', '', '', '1503295199', '0', '0');
INSERT INTO `dou_job` VALUES ('6', '2', '2', 'Sales Manager', '', '', '', 'Sales', '5', 'Shanghai', '', '', '', '1503295254', '1', '0');

-- ----------------------------
-- Table structure for dou_job_category
-- ----------------------------
DROP TABLE IF EXISTS `dou_job_category`;
CREATE TABLE `dou_job_category` (
  `cat_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(30) NOT NULL DEFAULT '',
  `lang_id` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言id',
  `cat_name` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `parent_id` smallint(5) NOT NULL DEFAULT '0',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_job_category
-- ----------------------------
INSERT INTO `dou_job_category` VALUES ('1', 'master', '1', '职位招聘', '', '', '0', '50');
INSERT INTO `dou_job_category` VALUES ('2', 'Talents', '2', 'Careers', '', '', '0', '10');

-- ----------------------------
-- Table structure for dou_link
-- ----------------------------
DROP TABLE IF EXISTS `dou_link`;
CREATE TABLE `dou_link` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `link_name` varchar(60) NOT NULL DEFAULT '',
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_link
-- ----------------------------
INSERT INTO `dou_link` VALUES ('1', 'tyloafer', 'http://tyloafer.cn', '1');

-- ----------------------------
-- Table structure for dou_nav
-- ----------------------------
DROP TABLE IF EXISTS `dou_nav`;
CREATE TABLE `dou_nav` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) NOT NULL DEFAULT '0',
  `lang_id` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言id',
  `module` varchar(20) NOT NULL,
  `nav_name` varchar(255) NOT NULL,
  `guide` varchar(255) NOT NULL,
  `type` varchar(10) NOT NULL,
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_nav
-- ----------------------------
INSERT INTO `dou_nav` VALUES ('1', '0', '1', 'apply_category', '应用', '0', 'middle', '50');
INSERT INTO `dou_nav` VALUES ('2', '0', '1', 'research_category', '研发', '0', 'middle', '50');
INSERT INTO `dou_nav` VALUES ('3', '0', '1', 'page', '关于我们', '1', 'middle', '50');
INSERT INTO `dou_nav` VALUES ('4', '0', '1', 'article_category', '服务中心', '3', 'middle', '50');
INSERT INTO `dou_nav` VALUES ('5', '0', '1', 'article_category', '新闻资讯', '1', 'middle', '70');
INSERT INTO `dou_nav` VALUES ('6', '0', '1', 'job_category', '职位招聘', '0', 'middle', '80');
INSERT INTO `dou_nav` VALUES ('7', '0', '1', 'page', '关于我们', '1', 'bottom', '10');
INSERT INTO `dou_nav` VALUES ('8', '0', '1', 'article_category', '服务中心', '3', 'bottom', '20');
INSERT INTO `dou_nav` VALUES ('9', '0', '1', 'article_category', '新闻资讯', '1', 'bottom', '30');
INSERT INTO `dou_nav` VALUES ('10', '0', '1', 'job_category', '招聘职位', '0', 'bottom', '40');
INSERT INTO `dou_nav` VALUES ('11', '0', '2', 'apply_category', 'Application', '0', 'middle', '30');
INSERT INTO `dou_nav` VALUES ('12', '0', '2', 'research_category', 'R&D', '0', 'middle', '20');
INSERT INTO `dou_nav` VALUES ('13', '0', '2', 'page', 'About Us', '2', 'middle', '30');
INSERT INTO `dou_nav` VALUES ('14', '0', '2', 'article_category', 'Services', '6', 'middle', '40');
INSERT INTO `dou_nav` VALUES ('15', '0', '2', 'article_category', 'News & Events', '4', 'middle', '50');
INSERT INTO `dou_nav` VALUES ('16', '0', '2', 'job_category', 'Careers', '0', 'middle', '60');
INSERT INTO `dou_nav` VALUES ('17', '0', '2', 'page', 'About Us', '2', 'bottom', '10');
INSERT INTO `dou_nav` VALUES ('18', '0', '2', 'article_category', 'Services', '6', 'bottom', '20');
INSERT INTO `dou_nav` VALUES ('19', '0', '2', 'article_category', 'News & Events', '4', 'bottom', '30');
INSERT INTO `dou_nav` VALUES ('20', '0', '2', 'job_category', 'Careers', '0', 'bottom', '40');
INSERT INTO `dou_nav` VALUES ('21', '1', '1', 'apply_category', '消化科', '4', 'middle', '1');
INSERT INTO `dou_nav` VALUES ('22', '1', '1', 'apply_category', '呼吸科', '5', 'middle', '2');
INSERT INTO `dou_nav` VALUES ('23', '1', '1', 'apply_category', '五官科', '6', 'middle', '3');
INSERT INTO `dou_nav` VALUES ('24', '11', '2', 'apply_category', 'Gastroenterology', '1', 'middle', '50');
INSERT INTO `dou_nav` VALUES ('25', '11', '2', 'apply_category', 'Pulmonology', '2', 'middle', '50');
INSERT INTO `dou_nav` VALUES ('26', '11', '2', 'apply_category', 'Ear, Nose, Throat', '3', 'middle', '50');

-- ----------------------------
-- Table structure for dou_order
-- ----------------------------
DROP TABLE IF EXISTS `dou_order`;
CREATE TABLE `dou_order` (
  `order_id` smallint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(20) NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `telphone` varchar(20) NOT NULL DEFAULT '',
  `contact` varchar(60) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `postcode` varchar(60) NOT NULL DEFAULT '',
  `pay_id` varchar(30) NOT NULL DEFAULT '',
  `shipping_id` varchar(30) NOT NULL DEFAULT '',
  `tracking_no` varchar(255) NOT NULL DEFAULT '',
  `product_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_order
-- ----------------------------
INSERT INTO `dou_order` VALUES ('1', '2016111040620', '1', '15555423186', '李小宇', 'adhflksfksdfsdf', '230601', '', '', '', '9510.00', '0.00', '9510.00', '0', '1478745466');

-- ----------------------------
-- Table structure for dou_order_product
-- ----------------------------
DROP TABLE IF EXISTS `dou_order_product`;
CREATE TABLE `dou_order_product` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `product_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(150) NOT NULL DEFAULT '',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `product_number` smallint(5) unsigned NOT NULL DEFAULT '1',
  `defined` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_order_product
-- ----------------------------
INSERT INTO `dou_order_product` VALUES ('1', '1', '6', 'BlackBerry黑莓9780', '1860.00', '1', '');
INSERT INTO `dou_order_product` VALUES ('2', '1', '7', 'MacBook Air笔记本电脑', '7650.00', '1', '');

-- ----------------------------
-- Table structure for dou_page
-- ----------------------------
DROP TABLE IF EXISTS `dou_page`;
CREATE TABLE `dou_page` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(30) NOT NULL DEFAULT '',
  `parent_id` smallint(5) NOT NULL DEFAULT '0',
  `lang_id` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言id',
  `page_name` varchar(150) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `template` varchar(70) NOT NULL DEFAULT '' COMMENT '指定模板',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_page
-- ----------------------------
INSERT INTO `dou_page` VALUES ('1', 'about', '0', '1', '关于我们', '<div class=\"aboutCon_content_img\">\r\n	<img src=\"http://cypro.wincomtech.cn/admin/theme/zh_cn/img/lb1.jpg\" alt=\"\" /> \r\n</div>\r\n<div class=\"aboutCon_content_con\">\r\n	<p>\r\n		上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。于2003年3月获得国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。\r\n	</p>\r\n	<p>\r\n		上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。于2003年3月获得国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。于2003年3月获得国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。于2003年3月获得国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家, 内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。于2003年3月获得国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。\r\n	</p>\r\n	<p>\r\n		上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。于2003年3月获得国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。\r\n	</p>\r\n</div>', '', '', '上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。', 'about.html');
INSERT INTO `dou_page` VALUES ('2', 'AboutUs', '0', '2', 'About Us', '<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	HUGER MEDICAI INSTRUMENT Co.,\r\nLtd. is proud to be the first manufacture of medical video endoscope in China.\r\nThe advanced manufacturing system and motivated engineers with decades\r\nexperience guarantee products and systems distinguished by their quality and\r\nsafety. Huger has always been a driving force to the development in endoscopy\r\nfield.\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	Huger are not satisfied with the\r\ndomestic No.1, but also becoming the worldwide top-class company. It has been\r\ntaken comprehensively in the European market and enjoy a good name for its\r\nexcellent products and service. Based on the numerous distributors worldwide,\r\nwe can offer our products with considerate service after sales to most parts of\r\nthe world.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '', '', 'HUGER MEDICAI INSTRUMENT Co., Ltd. is proud to be the first manufacture of medical video endoscope in China. ', 'about.html');

-- ----------------------------
-- Table structure for dou_plugin
-- ----------------------------
DROP TABLE IF EXISTS `dou_plugin`;
CREATE TABLE `dou_plugin` (
  `unique_id` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(120) NOT NULL DEFAULT '',
  `config` text NOT NULL,
  `plugin_group` varchar(10) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_plugin
-- ----------------------------
INSERT INTO `dou_plugin` VALUES ('express', '快递配送', 'a:2:{s:3:\"fee\";s:2:\"10\";s:4:\"free\";s:2:\"99\";}', 'shipping', '速度快，价格实惠，超重不加价。');

-- ----------------------------
-- Table structure for dou_product
-- ----------------------------
DROP TABLE IF EXISTS `dou_product`;
CREATE TABLE `dou_product` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) NOT NULL DEFAULT '0',
  `lang_id` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言id',
  `name` varchar(150) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `defined` text NOT NULL,
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '型号',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '外链',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_product
-- ----------------------------
INSERT INTO `dou_product` VALUES ('1', '5', '1', '电子胃镜GVE-2100', 'images/product/1_1502178782495524.jpg', '<p>\r\n	内窥镜的插入管经特殊的分段硬化后，具有优异的插入性能。精湛的加工和装配工艺，使弯角手轮操作时非常的柔顺自如。可以迅速顺利地到达所需观察的部位并发现病灶。\r\n</p>\r\n<p>\r\n	44万像素sony CCD。\r\n</p>', '1.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1502178782', '0');
INSERT INTO `dou_product` VALUES ('2', '5', '1', '电子胃镜GVE-2100 X系', 'images/product/2_1502178820309175.png', '电子胃镜GVE-2100 S系<br />', '1.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '简单描述', '1502178820', '0');
INSERT INTO `dou_product` VALUES ('3', '6', '1', '电子胃镜GVE-2600', 'images/product/3_1502178878119993.jpg', '<p>\r\n	电子胃镜GVE-2600\r\n</p>\r\n<p>\r\n	产品说明\r\n</p>', '0.00', '', '', '', '', '', '1502178878', '0');
INSERT INTO `dou_product` VALUES ('8', '23', '2', 'Video Gastroscope GVE-2100/GVE-2100X/GVE-2100P', 'images/product/8_1505193468904222.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505193468', '0');
INSERT INTO `dou_product` VALUES ('5', '23', '2', 'Video Colonoscope CVE-2100TM/LM/IM', 'images/product/5_1505193098785512.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505117544', '0');
INSERT INTO `dou_product` VALUES ('6', '24', '2', 'Imaging Processor VEP-2100F', 'images/product/6_1505195122366765.png', '<p>\r\n	nnnnnnnnnnnnnnnnnnnnnnnnnn\r\n</p>', '0.00', 'ssssssssssssssssssssssssss', '', '', 'VEP-2100F', 'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj', '1505117795', '0');
INSERT INTO `dou_product` VALUES ('11', '38', '2', 'Video Center 2100 Series', 'images/product/11_1505195824162954.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505195825', '0');
INSERT INTO `dou_product` VALUES ('10', '25', '2', 'Xenon Light Source SLS-2100P', 'images/product/10_1505195412671693.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505195413', '0');
INSERT INTO `dou_product` VALUES ('7', '25', '2', 'Halogen Light Source HLS2100P', 'images/product/7_1505193743110956.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505117875', '0');
INSERT INTO `dou_product` VALUES ('12', '39', '2', 'Video Endoscopy System 2100 Series ', 'images/product/12_1505195906408514.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505195906', '0');
INSERT INTO `dou_product` VALUES ('15', '23', '2', 'Video Gastroscope GVE-2600/GVE2600X/GVE-2600P', 'images/product/15_1505196680110821.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505196680', '0');
INSERT INTO `dou_product` VALUES ('14', '23', '2', 'Video Colonoscope CVE-2600TM/LM/IM/SM', 'images/product/14_1505196628524221.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505196628', '0');
INSERT INTO `dou_product` VALUES ('16', '23', '2', 'Video Bronchoscope VB-2600', 'images/product/16_1505196804055360.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505196804', '0');
INSERT INTO `dou_product` VALUES ('17', '23', '2', 'Video Rhinolaryngoscope VN-2600', 'images/product/17_1505197047153526.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505197047', '0');
INSERT INTO `dou_product` VALUES ('18', '24', '2', 'Imaging Processor VEP-2800', 'images/product/18_1505197417947798.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505197417', '0');
INSERT INTO `dou_product` VALUES ('19', '25', '2', 'Xenon Light Source SLS-2850', 'images/product/19_1505197657821479.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505197657', '0');
INSERT INTO `dou_product` VALUES ('20', '25', '2', 'LED Light Source LLS-2810', '', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505197783', '0');
INSERT INTO `dou_product` VALUES ('21', '38', '2', 'Video Center 2600 Series', 'images/product/21_1505197872474692.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505197872', '0');
INSERT INTO `dou_product` VALUES ('22', '39', '2', 'Video Endoscopy System 2600 Series ', 'images/product/22_1505198063368015.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505198063', '0');
INSERT INTO `dou_product` VALUES ('23', '23', '2', 'Fiber Bronchoscope FB-53A/FB60A', 'images/product/23_1505198750182495.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505198751', '0');
INSERT INTO `dou_product` VALUES ('24', '23', '2', 'Fiber Nasopharyngoscope FN-50A', 'images/product/24_1505198868833672.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505198869', '0');
INSERT INTO `dou_product` VALUES ('25', '23', '2', 'Portable Fiber Nasopharyngoscope FN-38A/FN-32A', 'images/product/25_1505199049124661.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505199050', '0');
INSERT INTO `dou_product` VALUES ('26', '23', '2', 'Portable Fiber Laryngoscope FL-39A', 'images/product/26_1505199109232807.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505199109', '0');
INSERT INTO `dou_product` VALUES ('27', '30', '2', 'Video Gastroscope  AGVE-2100B/AGVE-2100P/AGVE-2100S/AGVE-2100P', 'images/product/27_1505200523847955.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505200523', '0');
INSERT INTO `dou_product` VALUES ('28', '30', '2', 'Digital Bronchoscope UCB-66A/UCB-66L', 'images/product/28_1505200765107383.JPG', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505200765', '0');
INSERT INTO `dou_product` VALUES ('29', '30', '2', 'Digital Nasopharyngoscope UCN-66A', 'images/product/29_1505200893606362.jpg', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505200893', '0');
INSERT INTO `dou_product` VALUES ('30', '30', '2', 'HD Video GI Endoscope AGVE-68HQ/AGVE-68HS/AGVE-68HB', 'images/product/30_1505201183417687.JPG', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505201183', '0');
INSERT INTO `dou_product` VALUES ('31', '31', '2', 'Imaging Center VIS-2100S', 'images/product/31_1505201767529638.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505201767', '0');
INSERT INTO `dou_product` VALUES ('32', '31', '2', 'Imaging Center USB Series', 'images/product/32_1505202044503781.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505202044', '0');
INSERT INTO `dou_product` VALUES ('33', '31', '2', 'HD Imaging Center VIS-68', 'images/product/33_1505202794774057.PNG', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505202794', '0');
INSERT INTO `dou_product` VALUES ('34', '23', '2', 'Video Colonoscope CVE-2600TP/LP/IP/SP', 'images/product/34_1505207234272714.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505207234', '0');
INSERT INTO `dou_product` VALUES ('35', '23', '2', 'Video Colonoscope CVE-2100TP/LP/IP', 'images/product/35_1505207732648191.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505207656', '0');
INSERT INTO `dou_product` VALUES ('36', '30', '2', 'Video Gastroscope AGVE-2100AL', 'images/product/36_1505208235731911.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505208235', '0');
INSERT INTO `dou_product` VALUES ('37', '31', '2', 'Imaging Processing Software', 'images/product/37_1505208618716404.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505208618', '0');
INSERT INTO `dou_product` VALUES ('38', '24', '2', 'HD Imaging Processor VEP-6100H', 'images/product/38_1505209018087079.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505209018', '0');
INSERT INTO `dou_product` VALUES ('39', '38', '2', 'Video Center VEP-6100H Series', 'images/product/39_1505209101632725.png', '', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', '', '1505209101', '0');
INSERT INTO `dou_product` VALUES ('40', '39', '2', 'HD Video Endoscopy System 6100H Series ', 'images/product/40_1505209652045063.PNG', '<p>\r\n	<span style=\"color:#E53333;font-size:14px;\"><strong>Enhanced Visualization</strong></span> \r\n</p>\r\n<p>\r\n	By adopting the cutting-edge 1280*720p CMOS\r\nsensor, the digital high-resolution endoscopes realize enhanced and more clear\r\nobservation. With the progressive scanning method, exceptionally high\r\ndefinition still endoscopic images of clear\r\nclarity in every detail are produced. Used in combination with 26inch IPS\r\ndisplay monitor of 60FPS capacity, smooth and clear dynamic is presented as\r\nwell.\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span><br />\r\n</span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span><br />\r\n</span> \r\n</p>\r\n<span style=\"font-size:14px;color:#E53333;\"><strong>Enhanced Maneuverability</strong></span> \r\n<p class=\"MsoNormal\">\r\n	<span>The new generation endoscope control\r\nsection is of small size, lighter weight and equipped with remote control button and advanced ergonomics which\r\nallows the medical staff to conduct optimal insertion and sophisticated procedures\r\nwith ease and enables enhanced user-friendly operation experiences.</span> \r\n</p>\r\nGVE-6100HP of 8.0mm slim insertion tube<b> </b>presents\r\noptimized insertion performance, decreases physicians’ fatigue, patients’ suffering and increases their tolerances.\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;color:#E53333;\"><strong>Enhanced Reprocessing </strong></span> \r\n</p>\r\n<p>\r\n	Cleanliness and safety focused on full\r\ndefense against disinfection.\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>Easily soiled Air/Water valve, suction\r\nvalve and instrument portal valve are removeable which facilitates the cleaning and\r\ndisinfection not only of themselves but also of the inner channels. A smoother,\r\nflatter and waterproof endoscope body assures all areas receive optimal contact\r\nwith cleaning and high-performance disinfecting solutions which enhances the\r\nefficiency and effectiveness of CDS procedures.</span> \r\n</p>\r\n<br />\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '0.00', '尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：', '', '', '', 'Enhanced Visualization\r\nEnhanced Maneuverability\r\nEnhanced Reprocessing\r\n', '1505209652', '0');

-- ----------------------------
-- Table structure for dou_product_category
-- ----------------------------
DROP TABLE IF EXISTS `dou_product_category`;
CREATE TABLE `dou_product_category` (
  `cat_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(30) NOT NULL DEFAULT '',
  `parent_id` smallint(5) NOT NULL DEFAULT '0',
  `lang_id` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '语言id',
  `cat_name` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `template` varchar(70) NOT NULL COMMENT '指定模板',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_product_category
-- ----------------------------
INSERT INTO `dou_product_category` VALUES ('1', 'es1', '0', '1', '医用内窥镜', 'images/product_category/1_1502175094072188.jpg', '成套设备', '医用内窥镜说明：', '', '10');
INSERT INTO `dou_product_category` VALUES ('2', 'es2', '0', '1', '工业内窥镜', 'images/product_category/2_1502175182746534.jpg', '成套设备', '工业内窥镜说明。', '', '20');
INSERT INTO `dou_product_category` VALUES ('3', 'es3', '0', '1', '动物内窥镜', 'images/product_category/3_1502175205258521.jpg', '成套设备', '动物内窥镜说明。', '', '15');
INSERT INTO `dou_product_category` VALUES ('4', 'es4', '0', '1', '内窥镜配件', 'images/product_category/4_1502175234078799.png', '成套设备', '内窥镜配件说明简介。', '', '40');
INSERT INTO `dou_product_category` VALUES ('5', 'es1-1', '1', '1', '2100系列', '', '成套设备', '2100系列说明:', '', '1');
INSERT INTO `dou_product_category` VALUES ('6', 'es1-2', '1', '1', '2600系列', '', '成套设备', '2600系列说明', '', '2');
INSERT INTO `dou_product_category` VALUES ('7', 'es1-3', '1', '1', '纤维内窥镜系列', '', '成套设备', '纤维内窥镜系列说明', '', '3');
INSERT INTO `dou_product_category` VALUES ('8', 'es1-4', '1', '1', '图像处理器系列', '', '成套设备', '图像处理器系列说明', '', '4');
INSERT INTO `dou_product_category` VALUES ('9', 'es1-5', '1', '1', '冷光源系列', '', '成套设备', '冷光源系列说明', '', '5');
INSERT INTO `dou_product_category` VALUES ('10', 'es2-1', '2', '1', '软性内窥镜系列', '', '成套设备', '软性内窥镜系列说明', '', '1');
INSERT INTO `dou_product_category` VALUES ('11', 'es2-2', '2', '1', '硬管镜系列', '', '成套设备', '硬管镜系列说明', '', '2');
INSERT INTO `dou_product_category` VALUES ('12', 'es3-1', '3', '1', 'AGVE 系列', '', '成套设备', 'AGVE 系列说明', '', '1');
INSERT INTO `dou_product_category` VALUES ('13', 'es3-2', '3', '1', 'DGV 系列', '', '成套设备', 'DGV 系列说明', '', '2');
INSERT INTO `dou_product_category` VALUES ('14', 'es3-3', '3', '1', '兽用硬管系列', '', '成套设备', '兽用硬管系列说明', '', '3');
INSERT INTO `dou_product_category` VALUES ('15', 'es3-4', '3', '1', '图像处理器系列', '', '成套设备', '图像处理器系列说明', '', '4');
INSERT INTO `dou_product_category` VALUES ('16', 'es3-5', '3', '1', '冷光源系列', '', '成套设备', '冷光源系列说明', '', '5');
INSERT INTO `dou_product_category` VALUES ('17', 'es4-1', '4', '1', '角度钢丝', '', '成套设备', '角度钢丝说明', '', '1');
INSERT INTO `dou_product_category` VALUES ('18', 'es4-2', '4', '1', '弯曲橡皮', '', '成套设备', '弯曲橡皮说明', '', '2');
INSERT INTO `dou_product_category` VALUES ('19', 'es-en1', '0', '2', 'Medical Endoscopy', '', 'Complete Equipment', 'Dynamic: Shanghai chengyun medical equipment co., LTD. Is a sino-german technical cooperation enterpriseDynamic: Shanghai chengyun medical equipment co., LTD. Is a sino-german technical cooperation enterpriseDynamic: Shanghai chengyun medical equipment co', '', '10');
INSERT INTO `dou_product_category` VALUES ('20', 'es-en2', '0', '2', 'Industrial Endoscopy', '', '', '', '', '20');
INSERT INTO `dou_product_category` VALUES ('21', 'es-en3', '0', '2', 'Veterinary Endoscopy', '', '', '', '', '15');
INSERT INTO `dou_product_category` VALUES ('22', 'es-en4', '0', '2', 'Endoscopic Accessories', '', '', '', '', '40');
INSERT INTO `dou_product_category` VALUES ('23', 'es-en1-1', '19', '2', 'Endoscope', '', '', '', '', '1');
INSERT INTO `dou_product_category` VALUES ('24', 'es-en1-2', '19', '2', 'Imaging Processor', '', '', '', '', '2');
INSERT INTO `dou_product_category` VALUES ('25', 'es-en1-3', '19', '2', 'Light Source', '', '', '', '', '3');
INSERT INTO `dou_product_category` VALUES ('28', 'es-en2-1', '20', '2', 'Flexible Endoscopes', '', '', '', '', '1');
INSERT INTO `dou_product_category` VALUES ('29', 'es-en2-2', '20', '2', 'Rigid Endosocopes', '', '', '', '', '2');
INSERT INTO `dou_product_category` VALUES ('30', 'es-en3-1', '21', '2', 'Endoscope', '', '', '', '', '1');
INSERT INTO `dou_product_category` VALUES ('31', 'es-en3-2', '21', '2', 'Imaging Center', '', '', '', '', '2');
INSERT INTO `dou_product_category` VALUES ('38', 'videocenter', '19', '2', 'Video Center', '', '', '', '', '50');
INSERT INTO `dou_product_category` VALUES ('39', 'videoendoscopysystem', '19', '2', 'Endoscopy System', '', '', '', '', '50');

-- ----------------------------
-- Table structure for dou_rbac_awr
-- ----------------------------
DROP TABLE IF EXISTS `dou_rbac_awr`;
CREATE TABLE `dou_rbac_awr` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `rid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户与角色的关系表';

-- ----------------------------
-- Records of dou_rbac_awr
-- ----------------------------

-- ----------------------------
-- Table structure for dou_rbac_module
-- ----------------------------
DROP TABLE IF EXISTS `dou_rbac_module`;
CREATE TABLE `dou_rbac_module` (
  `mid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='模块表';

-- ----------------------------
-- Records of dou_rbac_module
-- ----------------------------
INSERT INTO `dou_rbac_module` VALUES ('1', 'system', '系统设置');
INSERT INTO `dou_rbac_module` VALUES ('2', 'nav', '导航管理');
INSERT INTO `dou_rbac_module` VALUES ('3', 'show', '幻灯片');
INSERT INTO `dou_rbac_module` VALUES ('4', 'page', '单页管理');
INSERT INTO `dou_rbac_module` VALUES ('5', 'product', '产品管理');
INSERT INTO `dou_rbac_module` VALUES ('6', 'article', '文章管理');
INSERT INTO `dou_rbac_module` VALUES ('7', 'job', '招聘管理');
INSERT INTO `dou_rbac_module` VALUES ('8', 'apply', '应用管理');
INSERT INTO `dou_rbac_module` VALUES ('9', 'research', '研发管理');
INSERT INTO `dou_rbac_module` VALUES ('10', 'guestbook', '留言反馈');
INSERT INTO `dou_rbac_module` VALUES ('11', 'cart', '购物车');
INSERT INTO `dou_rbac_module` VALUES ('12', 'user', '会员管理');
INSERT INTO `dou_rbac_module` VALUES ('13', 'backup', '数据备份');
INSERT INTO `dou_rbac_module` VALUES ('14', 'manager', '管理员管理');
INSERT INTO `dou_rbac_module` VALUES ('15', 'rbac', '权限管理');
INSERT INTO `dou_rbac_module` VALUES ('16', 'mobile', '手机端');
INSERT INTO `dou_rbac_module` VALUES ('17', 'district', '国家管理');
INSERT INTO `dou_rbac_module` VALUES ('18', 'manager_log', '操作日志');

-- ----------------------------
-- Table structure for dou_rbac_role
-- ----------------------------
DROP TABLE IF EXISTS `dou_rbac_role`;
CREATE TABLE `dou_rbac_role` (
  `rid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of dou_rbac_role
-- ----------------------------
INSERT INTO `dou_rbac_role` VALUES ('1', 'ALL', '超管');
INSERT INTO `dou_rbac_role` VALUES ('2', 'ADMIN', '管理员');
INSERT INTO `dou_rbac_role` VALUES ('3', 'LHJ', '编辑');

-- ----------------------------
-- Table structure for dou_rbac_rwm
-- ----------------------------
DROP TABLE IF EXISTS `dou_rbac_rwm`;
CREATE TABLE `dou_rbac_rwm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
  `mid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '模块id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色与模块的关系表';

-- ----------------------------
-- Records of dou_rbac_rwm
-- ----------------------------

-- ----------------------------
-- Table structure for dou_research
-- ----------------------------
DROP TABLE IF EXISTS `dou_research`;
CREATE TABLE `dou_research` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) NOT NULL DEFAULT '0',
  `lang_id` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言id',
  `title` varchar(150) NOT NULL DEFAULT '',
  `defined` text NOT NULL,
  `content` longtext NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `role` varchar(20) NOT NULL COMMENT '职称',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_research
-- ----------------------------
INSERT INTO `dou_research` VALUES ('1', '1', '1', '100系列电子内窥镜', '', '<a>100系列电子内窥镜被上海医疗器械行业协会评为上海医疗器械名优产品</a>', '', '', '', '', '', '1502267027', '0', '0');
INSERT INTO `dou_research` VALUES ('2', '1', '1', '上海成运医疗器械股份有限公司', '', '<span style=\"color:#222222;font-family:Consolas, &quot;font-size:12px;font-style:normal;font-weight:normal;background-color:#FFFFFF;\">成果：上海成运医疗器械股份有限公司是一家中德技术合作企业</span>', '', '', '', '', '', '1502267080', '0', '0');
INSERT INTO `dou_research` VALUES ('3', '1', '1', '新型环保材料问世', '', '新型环保材料问世：黑科技产品', '', '', '', '', '', '1502267190', '0', '0');
INSERT INTO `dou_research` VALUES ('4', '1', '1', '奈米材料合计划', '', '高聚合材料研发而成<br />', '', '', '', '', '', '1502267297', '0', '0');
INSERT INTO `dou_research` VALUES ('5', '2', '1', '吴京', '', '', '', '', '研发领队', '', '', '1502267729', '0', '0');
INSERT INTO `dou_research` VALUES ('6', '2', '1', '张某某', '', '', '', '', '研发人员', '', '', '1502267865', '0', '0');
INSERT INTO `dou_research` VALUES ('7', '2', '1', '吴刚', '', '', '', '', '研发队员', '', '', '1502267915', '0', '0');
INSERT INTO `dou_research` VALUES ('8', '2', '1', '卢靖姗', '', '', '', '', '研发队员', '', '', '1502268004', '0', '0');
INSERT INTO `dou_research` VALUES ('9', '2', '1', '余男', '', '', '', '', '研发队员', '', '', '1502268025', '0', '0');
INSERT INTO `dou_research` VALUES ('10', '2', '1', '张翰', '', '', '', '', '研发新手', '', '', '1502268149', '0', '0');
INSERT INTO `dou_research` VALUES ('11', '3', '2', 'Disposable Flexible Endoscopes', '', '<span style=\"color:#2E3033;font-family:Arial, \'Microsoft YaHei\', 微软雅黑, 宋体, \'Malgun Gothic\', sans-serif;font-size:12px;font-style:normal;font-weight:normal;line-height:20px;background-color:#EEF0F2;\">The 100 series electronic endoscope is awarded by Shanghai medical device industry association as the Shanghai medical device</span>', '', '', '', '', '', '1503295976', '0', '0');
INSERT INTO `dou_research` VALUES ('12', '3', '2', 'AI Images Reader', '', 'Achievements: Shanghai chengyun medical equipment co., LTD. Is a sino-german technical cooperation enterprise', '', '', '', '', '', '1503296024', '0', '0');
INSERT INTO `dou_research` VALUES ('13', '3', '2', '720P HD System Upgrade', '', '<span style=\"color:#2E3033;font-family:Arial, \'Microsoft YaHei\', 微软雅黑, 宋体, \'Malgun Gothic\', sans-serif;font-size:12px;font-style:normal;font-weight:normal;line-height:20px;background-color:#EEF0F2;\">New environmental materials: black technology products</span>', '', '', '', '', '', '1503296092', '0', '0');
INSERT INTO `dou_research` VALUES ('14', '3', '2', '1080P Full HD Endoscopy System', '', 'High polymer material developed and developed', '', '', '', '', '', '1503296127', '0', '0');
INSERT INTO `dou_research` VALUES ('15', '4', '2', 'Chenfeng Wang', '', '', '', '', 'R&D Leader', '', '', '1503296203', '0', '0');
INSERT INTO `dou_research` VALUES ('16', '4', '2', 'Evan Meng', '', '', '', '', 'R&D team', '', '', '1503296278', '0', '0');

-- ----------------------------
-- Table structure for dou_research_category
-- ----------------------------
DROP TABLE IF EXISTS `dou_research_category`;
CREATE TABLE `dou_research_category` (
  `cat_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(30) NOT NULL DEFAULT '',
  `parent_id` smallint(5) NOT NULL DEFAULT '0',
  `lang_id` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '语言id',
  `cat_name` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_research_category
-- ----------------------------
INSERT INTO `dou_research_category` VALUES ('1', 'research', '0', '1', '研发项目', '', '', '10');
INSERT INTO `dou_research_category` VALUES ('2', 'team', '0', '1', '研发团队', '', '', '20');
INSERT INTO `dou_research_category` VALUES ('3', 'research-en', '0', '2', 'Research project', '', '', '10');
INSERT INTO `dou_research_category` VALUES ('4', 'research-team-en', '0', '2', 'R&D team', '', '', '20');

-- ----------------------------
-- Table structure for dou_show
-- ----------------------------
DROP TABLE IF EXISTS `dou_show`;
CREATE TABLE `dou_show` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `show_name` varchar(60) NOT NULL DEFAULT '',
  `show_link` varchar(255) NOT NULL DEFAULT '',
  `show_img` varchar(255) NOT NULL,
  `type` varchar(10) NOT NULL COMMENT 'pc电脑端 mobile手机端 noob新手引导 ',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_show
-- ----------------------------
INSERT INTO `dou_show` VALUES ('1', '这个时代 你所追求的是什么？', 'http://www.wincomtech.cn', 'data/slide/20130514acunau.jpg', 'center', '1');
INSERT INTO `dou_show` VALUES ('2', '我们所追求的不是拥有一切，而是拥有值得的一切', '', 'data/slide/20170807wpnxvv.jpg', 'center', '20');
INSERT INTO `dou_show` VALUES ('3', '一段旅程，两个城市，潮流正在被重塑', '', 'data/slide/20170807imamxg.jpg', 'center', '30');
INSERT INTO `dou_show` VALUES ('4', '在这里，抛开重重限制，释放真实自我', '', 'data/slide/20170807vwomhx.jpg', 'center', '40');
INSERT INTO `dou_show` VALUES ('5', 'banner1', '', 'data/slide/20170807fvqqxf.jpg', 'pc', '10');

-- ----------------------------
-- Table structure for dou_user
-- ----------------------------
DROP TABLE IF EXISTS `dou_user`;
CREATE TABLE `dou_user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `telephone` varchar(20) NOT NULL DEFAULT '',
  `fax` varchar(25) NOT NULL COMMENT '传真',
  `avatar` varchar(255) NOT NULL COMMENT '头像',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `truename` varchar(20) NOT NULL COMMENT '真实姓名',
  `contact` varchar(60) NOT NULL DEFAULT '' COMMENT '联系方式',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '收货地址',
  `country` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '国家',
  `province` varchar(30) NOT NULL DEFAULT '' COMMENT '省份',
  `postcode` varchar(60) NOT NULL DEFAULT '',
  `defined` text NOT NULL,
  `institution_type` varchar(20) NOT NULL COMMENT '所属单位',
  `company` varchar(30) NOT NULL COMMENT '公司名称',
  `industry` varchar(30) NOT NULL COMMENT '所属领域',
  `post` varchar(30) NOT NULL COMMENT '职位',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `login_count` smallint(6) unsigned NOT NULL DEFAULT '0',
  `last_login` varchar(30) NOT NULL DEFAULT '',
  `last_ip` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`),
  KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_user
-- ----------------------------
INSERT INTO `dou_user` VALUES ('1', '', 'e10adc3949ba59abbe56e057f20f883e', 'keven518@163.com', '15555423186', '', '', '1', '', '李小宇', 'adhflksfksdfsdf', '1', '', '230601', '', '', '', '', '', '1478745265', '1', '1478745265', '127.0.0.1');
INSERT INTO `dou_user` VALUES ('2', '瓦大大', '96e79218965eb72c92a549dd5a330112', '915273691@qq.com', '18715511536', '4324423', '', '1', '黄生', '收货人', '收货地址自定义', '1', '1', '', '', '1', '为单位范围', '1', '4', '1502344574', '34', '1503648059,1504236267', '180.175.92.37,36.57.151.111');
INSERT INTO `dou_user` VALUES ('3', '冷锋', '96e79218965eb72c92a549dd5a330112', 'wangyun@sina.com', '18788841247', '', '', '0', '汪云', '他爸爸', '黄埔', '1', '', '', '', '', '旗舰', '1', '5', '1502690299', '3', '1502690431,1502692807', '127.0.0.1,127.0.0.1');
INSERT INTO `dou_user` VALUES ('4', '', '902c8fc62c86cae67fb43abcb1362e72', 'ida.hu@huger.cn', '15902197941', '', '', '0', 'HuIda', '', '', '1', '', '', '', '', 'HUGER MEDICAL', '1', '4', '1505263631', '4', '1505264012,1505264796', '180.175.92.37,180.175.92.37');
INSERT INTO `dou_user` VALUES ('5', '', 'c5fde9de2d29789a81d1bc0f16292048', 'zhengwei9109@126.com', '18823280930', '', '', '0', 'ZhengWei', '', '', '1', '', '', '', '', 'Huger', '1', '1', '1505267459', '1', '1505267459', '180.175.92.37');

-- ----------------------------
-- Table structure for dou_video
-- ----------------------------
DROP TABLE IF EXISTS `dou_video`;
CREATE TABLE `dou_video` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '',
  `defined` text NOT NULL,
  `file` varchar(255) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_video
-- ----------------------------

-- ----------------------------
-- Table structure for dou_video_category
-- ----------------------------
DROP TABLE IF EXISTS `dou_video_category`;
CREATE TABLE `dou_video_category` (
  `cat_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(30) NOT NULL DEFAULT '',
  `cat_name` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `parent_id` smallint(5) NOT NULL DEFAULT '0',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dou_video_category
-- ----------------------------
