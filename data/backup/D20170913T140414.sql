-- DouPHP v1.x SQL Dump Program
-- http://cy.wincomtech.cn/
-- 
-- DATE : 2017-09-13 14:04:17
-- MYSQL SERVER VERSION : 5.7.17
-- PHP VERSION : 5.6.29
-- DouPHP VERSION : v1.3 Release 20170424

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

INSERT INTO dou_admin VALUES('1','admin','','e10adc3949ba59abbe56e057f20f883e','99','1478503787','1505282651','36.57.144.255');
INSERT INTO dou_admin VALUES('2','lothar','','e10adc3949ba59abbe56e057f20f883e','50','1478503787','1502855307','127.0.0.1');
INSERT INTO dou_admin VALUES('3','ask1','','e10adc3949ba59abbe56e057f20f883e','10','1478503787','1502855307','127.0.0.1');

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
) ENGINE=MyISAM AUTO_INCREMENT=395 DEFAULT CHARSET=utf8;

INSERT INTO dou_admin_log VALUES('1','1503043131','1','管理员登录: 登录成功！','127.0.0.1');
INSERT INTO dou_admin_log VALUES('2','1503103962','1','管理员登录: 登录成功！','127.0.0.1');
INSERT INTO dou_admin_log VALUES('3','1503104041','1','管理员登录: 登录成功！','127.0.0.1');
INSERT INTO dou_admin_log VALUES('4','1503104099','1','编辑导航: 研发','127.0.0.1');
INSERT INTO dou_admin_log VALUES('5','1503118700','1','管理员登录: 登录成功！','127.0.0.1');
INSERT INTO dou_admin_log VALUES('6','1503118726','1','管理员登录: 登录成功！','127.0.0.1');
INSERT INTO dou_admin_log VALUES('7','1503278456','1','管理员登录: 登录成功！','127.0.0.1');
INSERT INTO dou_admin_log VALUES('8','1503288435','1','添加单页面: About Us','127.0.0.1');
INSERT INTO dou_admin_log VALUES('9','1503288520','1','管理员登录: 登录成功！','127.0.0.1');
INSERT INTO dou_admin_log VALUES('10','1503288598','1','添加导航: Apply','127.0.0.1');
INSERT INTO dou_admin_log VALUES('11','1503288625','1','添加导航: Research','127.0.0.1');
INSERT INTO dou_admin_log VALUES('12','1503288645','1','添加导航: About Us','127.0.0.1');
INSERT INTO dou_admin_log VALUES('13','1503288816','1','添加分类: News','127.0.0.1');
INSERT INTO dou_admin_log VALUES('14','1503288922','1','编辑文章分类: 公司活动','127.0.0.1');
INSERT INTO dou_admin_log VALUES('15','1503290957','1','添加分类: Activity','127.0.0.1');
INSERT INTO dou_admin_log VALUES('16','1503290975','1','编辑文章分类: News','127.0.0.1');
INSERT INTO dou_admin_log VALUES('17','1503291148','1','添加分类: Service Center','127.0.0.1');
INSERT INTO dou_admin_log VALUES('18','1503291270','1','添加导航: Service Center','127.0.0.1');
INSERT INTO dou_admin_log VALUES('19','1503291295','1','添加导航: News Information','127.0.0.1');
INSERT INTO dou_admin_log VALUES('20','1503291318','1','添加导航: Recruitment','127.0.0.1');
INSERT INTO dou_admin_log VALUES('21','1503291334','1','编辑导航: Application','127.0.0.1');
INSERT INTO dou_admin_log VALUES('22','1503291346','1','编辑导航: Research &amp; Development','127.0.0.1');
INSERT INTO dou_admin_log VALUES('23','1503291459','1','添加分类: Endoscope','127.0.0.1');
INSERT INTO dou_admin_log VALUES('24','1503291497','1','添加分类: Industrial endoscopy','127.0.0.1');
INSERT INTO dou_admin_log VALUES('25','1503291522','1','添加分类: Animal endoscope','127.0.0.1');
INSERT INTO dou_admin_log VALUES('26','1503291543','1','添加分类: Endoscope accessories','127.0.0.1');
INSERT INTO dou_admin_log VALUES('27','1503291597','1','添加分类: 2100 Series','127.0.0.1');
INSERT INTO dou_admin_log VALUES('28','1503291622','1','编辑商品分类: Endoscope','127.0.0.1');
INSERT INTO dou_admin_log VALUES('29','1503291679','1','添加分类: 2600 Series','127.0.0.1');
INSERT INTO dou_admin_log VALUES('30','1503291719','1','添加分类: Fiber endoscope series','127.0.0.1');
INSERT INTO dou_admin_log VALUES('31','1503291872','1','添加分类: Image processor series','127.0.0.1');
INSERT INTO dou_admin_log VALUES('32','1503291892','1','添加分类: Cold light source series','127.0.0.1');
INSERT INTO dou_admin_log VALUES('33','1503291924','1','添加分类: Soft endoscope series','127.0.0.1');
INSERT INTO dou_admin_log VALUES('34','1503291946','1','添加分类: Hard tube mirror series','127.0.0.1');
INSERT INTO dou_admin_log VALUES('35','1503291974','1','添加分类: AGVE series','127.0.0.1');
INSERT INTO dou_admin_log VALUES('36','1503291997','1','添加分类: DGV series','127.0.0.1');
INSERT INTO dou_admin_log VALUES('37','1503292022','1','添加分类: Hard tube for animals','127.0.0.1');
INSERT INTO dou_admin_log VALUES('38','1503292049','1','添加分类: Angle steel wire','127.0.0.1');
INSERT INTO dou_admin_log VALUES('39','1503292069','1','添加分类: Bent rubber','127.0.0.1');
INSERT INTO dou_admin_log VALUES('40','1503292090','1','添加分类: Bending section','127.0.0.1');
INSERT INTO dou_admin_log VALUES('41','1503292376','1','添加文章: The company&#039;s official website is officially launched in 2017','127.0.0.1');
INSERT INTO dou_admin_log VALUES('42','1503292525','1','添加文章: Services 1','127.0.0.1');
INSERT INTO dou_admin_log VALUES('43','1503293409','1','编辑文章: 公司官网2017正式上线','127.0.0.1');
INSERT INTO dou_admin_log VALUES('44','1503293447','1','编辑文章: 公司官网2017正式上线','127.0.0.1');
INSERT INTO dou_admin_log VALUES('45','1503294182','1','添加文章: Services 2','127.0.0.1');
INSERT INTO dou_admin_log VALUES('46','1503294218','1','添加文章: Services 3','127.0.0.1');
INSERT INTO dou_admin_log VALUES('47','1503294229','1','编辑文章: Services 1','127.0.0.1');
INSERT INTO dou_admin_log VALUES('48','1503294310','1','添加文章: Activity title 1','127.0.0.1');
INSERT INTO dou_admin_log VALUES('49','1503294352','1','添加文章: Activity Title 21','127.0.0.1');
INSERT INTO dou_admin_log VALUES('50','1503294427','1','添加分类: recruitment','127.0.0.1');
INSERT INTO dou_admin_log VALUES('51','1503294464','1','编辑招聘: 销售人员','127.0.0.1');
INSERT INTO dou_admin_log VALUES('52','1503294476','1','编辑招聘: 技术总监','127.0.0.1');
INSERT INTO dou_admin_log VALUES('53','1503295158','1','添加招聘: Product manager','127.0.0.1');
INSERT INTO dou_admin_log VALUES('54','1503295199','1','添加招聘: Technical director','127.0.0.1');
INSERT INTO dou_admin_log VALUES('55','1503295254','1','添加招聘: salesman','127.0.0.1');
INSERT INTO dou_admin_log VALUES('56','1503295382','1','添加应用: Health of stomach','127.0.0.1');
INSERT INTO dou_admin_log VALUES('57','1503295464','1','添加分类: Research project','127.0.0.1');
INSERT INTO dou_admin_log VALUES('58','1503295523','1','添加分类: R&amp;D team','127.0.0.1');
INSERT INTO dou_admin_log VALUES('59','1503295976','1','添加: 100 series electron endoscopes','127.0.0.1');
INSERT INTO dou_admin_log VALUES('60','1503296024','1','添加: Shanghai chengyun medical equipment co. LTD','127.0.0.1');
INSERT INTO dou_admin_log VALUES('61','1503296092','1','添加: New environmental materials came out','127.0.0.1');
INSERT INTO dou_admin_log VALUES('62','1503296127','1','添加: Nanometer material joint project','127.0.0.1');
INSERT INTO dou_admin_log VALUES('63','1503296203','1','添加: Janson Wu','127.0.0.1');
INSERT INTO dou_admin_log VALUES('64','1503296278','1','添加: Zhang xx','127.0.0.1');
INSERT INTO dou_admin_log VALUES('65','1503296323','1','编辑: Janson Wu','127.0.0.1');
INSERT INTO dou_admin_log VALUES('66','1503296457','1','添加导航: About Us','127.0.0.1');
INSERT INTO dou_admin_log VALUES('67','1503296507','1','添加导航: Service Center','127.0.0.1');
INSERT INTO dou_admin_log VALUES('68','1503296544','1','添加导航: News Information','127.0.0.1');
INSERT INTO dou_admin_log VALUES('69','1503296581','1','添加导航: Recruitment','127.0.0.1');
INSERT INTO dou_admin_log VALUES('70','1503363646','1','管理员登录: 登录成功！','127.0.0.1');
INSERT INTO dou_admin_log VALUES('71','1503363652','1','管理员登录: 登录成功！','127.0.0.1');
INSERT INTO dou_admin_log VALUES('72','1503367484','1','编辑商品分类: Endoscope','127.0.0.1');
INSERT INTO dou_admin_log VALUES('73','1503367718','1','编辑商品分类: Endoscope','127.0.0.1');
INSERT INTO dou_admin_log VALUES('74','1503368637','1','添加商品: Electronic Gastroscope GVE-2100','127.0.0.1');
INSERT INTO dou_admin_log VALUES('75','1503369522','1','系统设置: 编辑成功','127.0.0.1');
INSERT INTO dou_admin_log VALUES('76','1503369587','1','编辑商品: Electronic Gastroscope GVE-2100','127.0.0.1');
INSERT INTO dou_admin_log VALUES('77','1503369660','1','编辑商品: 电子胃镜GVE-2100','127.0.0.1');
INSERT INTO dou_admin_log VALUES('78','1503369718','1','编辑商品: 电子胃镜GVE-2100 S系','127.0.0.1');
INSERT INTO dou_admin_log VALUES('79','1503370311','1','编辑商品: 电子胃镜GVE-2100 S系','127.0.0.1');
INSERT INTO dou_admin_log VALUES('80','1503371646','1','编辑应用: Gastrointestinal Medicine','127.0.0.1');
INSERT INTO dou_admin_log VALUES('81','1503371722','1','编辑应用: Gastrointestinal Medicine','127.0.0.1');
INSERT INTO dou_admin_log VALUES('82','1503385527','1','管理员登录: 登录成功！','127.0.0.1');
INSERT INTO dou_admin_log VALUES('83','1503385878','1','管理员登录: 登录成功！','127.0.0.1');
INSERT INTO dou_admin_log VALUES('84','1503385921','1','编辑单页面: About Us','127.0.0.1');
INSERT INTO dou_admin_log VALUES('85','1503388388','1','编辑招聘: Technical director','127.0.0.1');
INSERT INTO dou_admin_log VALUES('86','1503397312','1','编辑文章: Services 1','127.0.0.1');
INSERT INTO dou_admin_log VALUES('87','1503397331','1','编辑文章: Services 1','127.0.0.1');
INSERT INTO dou_admin_log VALUES('88','1503398988','1','编辑导航: Service Center','127.0.0.1');
INSERT INTO dou_admin_log VALUES('89','1503448265','1','管理员登录: 登录成功！','127.0.0.1');
INSERT INTO dou_admin_log VALUES('90','1503448302','1','管理员登录: 登录成功！','127.0.0.1');
INSERT INTO dou_admin_log VALUES('91','1503455417','1','系统设置: 编辑成功','127.0.0.1');
INSERT INTO dou_admin_log VALUES('92','1503455568','1','编辑商品: Electronic Gastroscope GVE-2100','127.0.0.1');
INSERT INTO dou_admin_log VALUES('93','1503456112','1','编辑商品: 电子胃镜GVE-2100 S系','127.0.0.1');
INSERT INTO dou_admin_log VALUES('94','1503467768','1','添加分类: 所属领域','127.0.0.1');
INSERT INTO dou_admin_log VALUES('95','1503467998','1','添加分类: 所属领域','127.0.0.1');
INSERT INTO dou_admin_log VALUES('96','1503468021','1','添加分类: 所属领域','127.0.0.1');
INSERT INTO dou_admin_log VALUES('97','1503472276','1','添加DIY: 医疗业','127.0.0.1');
INSERT INTO dou_admin_log VALUES('98','1503472292','1','添加DIY: 医疗业','127.0.0.1');
INSERT INTO dou_admin_log VALUES('99','1503472627','1','编辑DIY: 医疗业','127.0.0.1');
INSERT INTO dou_admin_log VALUES('100','1503472690','1','编辑DIY: 电器','127.0.0.1');
INSERT INTO dou_admin_log VALUES('101','1503472721','1','添加DIY: 产品经理','127.0.0.1');
INSERT INTO dou_admin_log VALUES('102','1503472839','1','添加DIY: 技术总监','127.0.0.1');
INSERT INTO dou_admin_log VALUES('103','1503472887','1','添加DIY: 行政主管','127.0.0.1');
INSERT INTO dou_admin_log VALUES('104','1503472912','1','添加DIY: 客服','127.0.0.1');
INSERT INTO dou_admin_log VALUES('105','1503472926','1','添加DIY: 销售','127.0.0.1');
INSERT INTO dou_admin_log VALUES('106','1503479058','1','系统设置: 编辑成功','127.0.0.1');
INSERT INTO dou_admin_log VALUES('107','1503479543','1','系统设置: 编辑成功','127.0.0.1');
INSERT INTO dou_admin_log VALUES('108','1503479681','1','编辑产品: 电子胃镜GVE-2100 X系','127.0.0.1');
INSERT INTO dou_admin_log VALUES('109','1503479695','1','编辑产品: 电子胃镜GVE-2100','127.0.0.1');
INSERT INTO dou_admin_log VALUES('110','1503479733','1','编辑产品: 电子胃镜GVE-2100','127.0.0.1');
INSERT INTO dou_admin_log VALUES('111','1503479749','1','编辑产品: 电子胃镜GVE-2100','127.0.0.1');
INSERT INTO dou_admin_log VALUES('112','1503479768','1','编辑产品: 电子胃镜GVE-2100','127.0.0.1');
INSERT INTO dou_admin_log VALUES('113','1503479818','1','编辑产品: Electronic Gastroscope GVE-2100','127.0.0.1');
INSERT INTO dou_admin_log VALUES('114','1503485886','1','恢复备份: cy20170823.sql','112.28.151.30');
INSERT INTO dou_admin_log VALUES('115','1503508486','1','管理员登录: 登录成功！','112.28.151.30');
INSERT INTO dou_admin_log VALUES('116','1503549760','1','管理员登录: 登录成功！','112.28.151.24');
INSERT INTO dou_admin_log VALUES('117','1503632429','1','管理员登录: 登录成功！','36.57.134.219');
INSERT INTO dou_admin_log VALUES('118','1503640713','1','管理员登录: 登录成功！','36.57.134.219');
INSERT INTO dou_admin_log VALUES('119','1503882632','1','管理员登录: 登录成功！','221.220.21.159');
INSERT INTO dou_admin_log VALUES('120','1504077373','1','管理员登录: 登录成功！','36.57.145.205');
INSERT INTO dou_admin_log VALUES('121','1504145101','1','管理员登录: 登录成功！','36.57.145.205');
INSERT INTO dou_admin_log VALUES('122','1504145127','1','系统设置: 编辑成功','36.57.145.205');
INSERT INTO dou_admin_log VALUES('123','1504229348','1','管理员登录: 登录成功！','36.57.151.111');
INSERT INTO dou_admin_log VALUES('124','1504238849','1','管理员登录: 登录成功！','36.57.151.111');
INSERT INTO dou_admin_log VALUES('125','1504239818','1','编辑单页面: 关于我们','36.57.151.111');
INSERT INTO dou_admin_log VALUES('126','1504239833','1','编辑单页面: About Us','36.57.151.111');
INSERT INTO dou_admin_log VALUES('127','1504246750','1','管理员登录: 登录成功！','36.57.151.111');
INSERT INTO dou_admin_log VALUES('128','1504246809','1','管理员登录: 登录成功！','36.57.151.111');
INSERT INTO dou_admin_log VALUES('129','1504247038','1','编辑导航: R&amp;D','36.57.151.111');
INSERT INTO dou_admin_log VALUES('130','1504247058','1','编辑导航: Services','36.57.151.111');
INSERT INTO dou_admin_log VALUES('131','1504247086','1','编辑导航: News &amp; Events','36.57.151.111');
INSERT INTO dou_admin_log VALUES('132','1504247120','1','编辑导航: Careers','36.57.151.111');
INSERT INTO dou_admin_log VALUES('133','1504247171','1','编辑导航: Services','36.57.151.111');
INSERT INTO dou_admin_log VALUES('134','1504247185','1','编辑导航: News &amp; Events','36.57.151.111');
INSERT INTO dou_admin_log VALUES('135','1504247197','1','编辑导航: Careers','36.57.151.111');
INSERT INTO dou_admin_log VALUES('136','1504677753','1','管理员登录: 登录成功！','36.57.135.161');
INSERT INTO dou_admin_log VALUES('137','1504677799','1','编辑产品分类: Animal endoscope','36.57.135.161');
INSERT INTO dou_admin_log VALUES('138','1504677815','1','编辑产品分类: 动物内窥镜','36.57.135.161');
INSERT INTO dou_admin_log VALUES('139','1504678027','1','添加分类: 消化科','36.57.135.161');
INSERT INTO dou_admin_log VALUES('140','1504678054','1','添加分类: 呼吸科','36.57.135.161');
INSERT INTO dou_admin_log VALUES('141','1504678076','1','添加分类: 五官科','36.57.135.161');
INSERT INTO dou_admin_log VALUES('142','1504678133','1','添加分类: 消化科','36.57.135.161');
INSERT INTO dou_admin_log VALUES('143','1504678147','1','添加分类: 呼吸科','36.57.135.161');
INSERT INTO dou_admin_log VALUES('144','1504678161','1','添加分类: 五官科','36.57.135.161');
INSERT INTO dou_admin_log VALUES('145','1504678184','1','添加导航: 消化科','36.57.135.161');
INSERT INTO dou_admin_log VALUES('146','1504678196','1','添加导航: 呼吸科','36.57.135.161');
INSERT INTO dou_admin_log VALUES('147','1504678212','1','添加导航: 五官科','36.57.135.161');
INSERT INTO dou_admin_log VALUES('148','1504680039','1','添加导航: xiaohua','36.57.135.161');
INSERT INTO dou_admin_log VALUES('149','1504680053','1','添加导航: huxi','36.57.135.161');
INSERT INTO dou_admin_log VALUES('150','1504680064','1','编辑导航: huxi','36.57.135.161');
INSERT INTO dou_admin_log VALUES('151','1504680077','1','添加导航: wuguan','36.57.135.161');
INSERT INTO dou_admin_log VALUES('152','1504680137','1','编辑应用: Gastrointestinal Medicine','36.57.135.161');
INSERT INTO dou_admin_log VALUES('153','1504680161','1','编辑应用: Gastrointestinal Medicine','36.57.135.161');
INSERT INTO dou_admin_log VALUES('154','1504683180','1','管理员登录: 登录成功！','36.57.135.161');
INSERT INTO dou_admin_log VALUES('155','1504689410','1','添加应用: dhjfhlajsglasd','36.57.135.161');
INSERT INTO dou_admin_log VALUES('156','1504689436','1','添加应用: fkjzhbfhdjzknbj,xcgd','36.57.135.161');
INSERT INTO dou_admin_log VALUES('157','1504689693','1','编辑应用: fkjzhbfhdjzknbj,xcgd','36.57.135.161');
INSERT INTO dou_admin_log VALUES('158','1504692568','1','编辑应用: 肠胃医疗','36.57.135.161');
INSERT INTO dou_admin_log VALUES('159','1504692610','1','添加应用: 呼吸呼吸下','36.57.135.161');
INSERT INTO dou_admin_log VALUES('160','1504692647','1','添加应用: 五官五官五官五官五官','36.57.135.161');
INSERT INTO dou_admin_log VALUES('161','1504767549','1','管理员登录: 登录成功！','36.57.135.161');
INSERT INTO dou_admin_log VALUES('162','1504767563','1','数据备份: D20170907T145913.sql','36.57.135.161');
INSERT INTO dou_admin_log VALUES('163','1504849733','1','管理员登录: 登录成功！','36.57.145.132');
INSERT INTO dou_admin_log VALUES('164','1504850391','1','管理员登录: 登录成功！','180.175.92.37');
INSERT INTO dou_admin_log VALUES('165','1504851452','1','管理员登录: 登录成功！','36.57.145.132');
INSERT INTO dou_admin_log VALUES('166','1504851540','1','编辑应用分类: 消化科','36.57.145.132');
INSERT INTO dou_admin_log VALUES('167','1504851600','1','编辑单页面: About Us','180.175.92.37');
INSERT INTO dou_admin_log VALUES('168','1504851695','1','编辑单页面: About Us','180.175.92.37');
INSERT INTO dou_admin_log VALUES('169','1504851792','1','编辑导航: Facial Features','36.57.145.132');
INSERT INTO dou_admin_log VALUES('170','1504851825','1','编辑导航: Breathing','36.57.145.132');
INSERT INTO dou_admin_log VALUES('171','1504851850','1','编辑导航: Digestion','36.57.145.132');
INSERT INTO dou_admin_log VALUES('172','1504852002','1','编辑单页面: About Us','180.175.92.37');
INSERT INTO dou_admin_log VALUES('173','1504852160','1','编辑单页面: About Us','180.175.92.37');
INSERT INTO dou_admin_log VALUES('174','1504852185','1','编辑单页面: About Us','180.175.92.37');
INSERT INTO dou_admin_log VALUES('175','1504852226','1','编辑单页面: About Us','180.175.92.37');
INSERT INTO dou_admin_log VALUES('176','1504852586','1','编辑单页面: About Us','36.57.145.132');
INSERT INTO dou_admin_log VALUES('177','1504852808','1','编辑单页面: About Us','36.57.145.132');
INSERT INTO dou_admin_log VALUES('178','1504852881','1','编辑单页面: About Us','36.57.145.132');
INSERT INTO dou_admin_log VALUES('179','1504853359','1','编辑导航: Gastroenterology','180.175.92.37');
INSERT INTO dou_admin_log VALUES('180','1504853393','1','编辑导航: Pulmonology','180.175.92.37');
INSERT INTO dou_admin_log VALUES('181','1504853477','1','编辑导航: Ear, Nose, Throat','180.175.92.37');
INSERT INTO dou_admin_log VALUES('182','1504853863','1','编辑产品分类: Medical Endoscopy','180.175.92.37');
INSERT INTO dou_admin_log VALUES('183','1504853906','1','编辑产品分类: Veterinary Endoscopy','180.175.92.37');
INSERT INTO dou_admin_log VALUES('184','1504853941','1','编辑产品分类: Industrial Endoscopy','180.175.92.37');
INSERT INTO dou_admin_log VALUES('185','1504853985','1','编辑产品分类: Endoscopic Accessories','180.175.92.37');
INSERT INTO dou_admin_log VALUES('186','1504854238','1','编辑产品分类: Endoscopes','180.175.92.37');
INSERT INTO dou_admin_log VALUES('187','1504854307','1','编辑产品分类: Imaging Processor','180.175.92.37');
INSERT INTO dou_admin_log VALUES('188','1504854322','1','编辑产品分类: endoscopes','180.175.92.37');
INSERT INTO dou_admin_log VALUES('189','1504854331','1','编辑产品分类: imaging Processor','180.175.92.37');
INSERT INTO dou_admin_log VALUES('190','1504854346','1','编辑产品分类: light source','180.175.92.37');
INSERT INTO dou_admin_log VALUES('191','1504854374','1','删除产品分类: Image processor series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('192','1504854384','1','删除产品分类: Cold light source series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('193','1504854398','1','编辑产品分类: Endoscopes','180.175.92.37');
INSERT INTO dou_admin_log VALUES('194','1504854417','1','编辑产品分类: Imaging processor','180.175.92.37');
INSERT INTO dou_admin_log VALUES('195','1504854429','1','编辑产品分类: Light source','180.175.92.37');
INSERT INTO dou_admin_log VALUES('196','1504854496','1','编辑产品分类: Endoscopes','180.175.92.37');
INSERT INTO dou_admin_log VALUES('197','1504854512','1','编辑产品分类: Imaging system','180.175.92.37');
INSERT INTO dou_admin_log VALUES('198','1504854531','1','编辑产品分类: Imaging processor','180.175.92.37');
INSERT INTO dou_admin_log VALUES('199','1504854551','1','编辑产品分类: Imaging system','180.175.92.37');
INSERT INTO dou_admin_log VALUES('200','1504854565','1','删除产品分类: Hard tube for animals','180.175.92.37');
INSERT INTO dou_admin_log VALUES('201','1504854594','1','编辑产品分类: Flexible Endoscopes','180.175.92.37');
INSERT INTO dou_admin_log VALUES('202','1504854611','1','编辑产品分类: Flexible endoscopes','180.175.92.37');
INSERT INTO dou_admin_log VALUES('203','1504854631','1','编辑产品分类: Rigid endosocopes','180.175.92.37');
INSERT INTO dou_admin_log VALUES('204','1504854644','1','删除产品分类: Angle steel wire','180.175.92.37');
INSERT INTO dou_admin_log VALUES('205','1504854652','1','删除产品分类: Bent rubber','180.175.92.37');
INSERT INTO dou_admin_log VALUES('206','1504854659','1','删除产品分类: Bending section','180.175.92.37');
INSERT INTO dou_admin_log VALUES('207','1504854787','1','编辑产品分类: Imaging Processor','180.175.92.37');
INSERT INTO dou_admin_log VALUES('208','1504854798','1','编辑产品分类: Light source','180.175.92.37');
INSERT INTO dou_admin_log VALUES('209','1504854812','1','编辑产品分类: Light Source','180.175.92.37');
INSERT INTO dou_admin_log VALUES('210','1504854828','1','编辑产品分类: Imaging System','180.175.92.37');
INSERT INTO dou_admin_log VALUES('211','1504854842','1','编辑产品分类: Flexible Endoscopes','180.175.92.37');
INSERT INTO dou_admin_log VALUES('212','1504854854','1','编辑产品分类: Rigid Endosocopes','180.175.92.37');
INSERT INTO dou_admin_log VALUES('213','1504855119','1','系统设置: 编辑成功','180.175.92.37');
INSERT INTO dou_admin_log VALUES('214','1504855196','1','系统设置: 编辑成功','180.175.92.37');
INSERT INTO dou_admin_log VALUES('215','1504855312','1','编辑应用分类: 消化科','180.175.92.37');
INSERT INTO dou_admin_log VALUES('216','1504855344','1','编辑应用分类: 呼吸科','180.175.92.37');
INSERT INTO dou_admin_log VALUES('217','1504855401','1','编辑应用: Ear, Nose, Throat','180.175.92.37');
INSERT INTO dou_admin_log VALUES('218','1504855430','1','编辑应用: Gastroenterology','180.175.92.37');
INSERT INTO dou_admin_log VALUES('219','1504855450','1','编辑应用: Pulmonology','180.175.92.37');
INSERT INTO dou_admin_log VALUES('220','1504855503','1','编辑: Chenfeng Wang','180.175.92.37');
INSERT INTO dou_admin_log VALUES('221','1504855531','1','编辑: Evan Meng','180.175.92.37');
INSERT INTO dou_admin_log VALUES('222','1504855652','1','编辑: 1080P Full HD Endoscopy System','180.175.92.37');
INSERT INTO dou_admin_log VALUES('223','1504856091','1','编辑: 720P HD System Upgrade','180.175.92.37');
INSERT INTO dou_admin_log VALUES('224','1504856115','1','编辑: AI Images Reader','180.175.92.37');
INSERT INTO dou_admin_log VALUES('225','1504856136','1','编辑: Disposable Flexible Endoscopes','180.175.92.37');
INSERT INTO dou_admin_log VALUES('226','1504856412','1','编辑招聘分类: Careers','180.175.92.37');
INSERT INTO dou_admin_log VALUES('227','1504856574','1','编辑招聘: Sales Manager','180.175.92.37');
INSERT INTO dou_admin_log VALUES('228','1504858826','1','编辑招聘: Technical Director','180.175.92.37');
INSERT INTO dou_admin_log VALUES('229','1504858841','1','编辑招聘: Product Manager','180.175.92.37');
INSERT INTO dou_admin_log VALUES('230','1504858973','1','编辑: Evan Meng','180.175.92.37');
INSERT INTO dou_admin_log VALUES('231','1504859006','1','编辑: Chenfeng Wang','180.175.92.37');
INSERT INTO dou_admin_log VALUES('232','1504861180','1','编辑文章: Launching Company&#039;s Official Website on 8th of Oct. 2017','180.175.92.37');
INSERT INTO dou_admin_log VALUES('233','1504861212','1','编辑文章: Launching Company&#039;s Official Website on 8th of Oct. 2017','180.175.92.37');
INSERT INTO dou_admin_log VALUES('234','1504861341','1','编辑文章: Launching Company&#039;s Official Website on 8th of Oct. 2017','180.175.92.37');
INSERT INTO dou_admin_log VALUES('235','1504861381','1','编辑文章分类: News','180.175.92.37');
INSERT INTO dou_admin_log VALUES('236','1504861409','1','编辑文章分类: News','180.175.92.37');
INSERT INTO dou_admin_log VALUES('237','1504861440','1','编辑文章分类: Activity','180.175.92.37');
INSERT INTO dou_admin_log VALUES('238','1504861490','1','编辑文章分类: Service Center','180.175.92.37');
INSERT INTO dou_admin_log VALUES('239','1504861534','1','编辑文章分类: Service Center','180.175.92.37');
INSERT INTO dou_admin_log VALUES('240','1504861565','1','编辑文章分类: Service Center','180.175.92.37');
INSERT INTO dou_admin_log VALUES('241','1504861641','1','系统设置: 编辑成功','180.175.92.37');
INSERT INTO dou_admin_log VALUES('242','1504861738','1','编辑文章分类: News','180.175.92.37');
INSERT INTO dou_admin_log VALUES('243','1504861757','1','编辑文章分类: Activity','180.175.92.37');
INSERT INTO dou_admin_log VALUES('244','1504863973','1','编辑应用: Pulmonology','180.175.92.37');
INSERT INTO dou_admin_log VALUES('245','1504864455','1','管理员登录: 登录成功！','180.175.92.37');
INSERT INTO dou_admin_log VALUES('246','1505094008','1','管理员登录: 登录成功！','36.57.149.41');
INSERT INTO dou_admin_log VALUES('247','1505094034','1','管理员登录: 登录成功！','106.38.132.55');
INSERT INTO dou_admin_log VALUES('248','1505095366','1','管理员登录: 登录成功！','180.175.92.37');
INSERT INTO dou_admin_log VALUES('249','1505097071','1','管理员登录: 登录成功！','36.57.149.41');
INSERT INTO dou_admin_log VALUES('250','1505097296','1','编辑单页面: About Us','36.57.149.41');
INSERT INTO dou_admin_log VALUES('251','1505097678','1','管理员登录: 登录成功！','36.57.149.41');
INSERT INTO dou_admin_log VALUES('252','1505098293','1','编辑导航: Application','180.175.92.37');
INSERT INTO dou_admin_log VALUES('253','1505098305','1','编辑导航: Application','36.57.149.41');
INSERT INTO dou_admin_log VALUES('254','1505098326','1','编辑导航: Application','36.57.149.41');
INSERT INTO dou_admin_log VALUES('255','1505098479','1','添加导航: reqtuy','36.57.149.41');
INSERT INTO dou_admin_log VALUES('256','1505100671','1','删除导航: reqtuy','36.57.149.41');
INSERT INTO dou_admin_log VALUES('257','1505101262','1','编辑单页面: About Us','36.57.149.41');
INSERT INTO dou_admin_log VALUES('258','1505117082','1','管理员登录: 登录成功！','180.175.92.37');
INSERT INTO dou_admin_log VALUES('259','1505117380','1','编辑产品: Video Gastroscope GVE-2100 Series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('260','1505117544','1','添加产品: Video Colonoscope CVE-2100 Series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('261','1505117795','1','添加产品: VEP-2100F','180.175.92.37');
INSERT INTO dou_admin_log VALUES('262','1505117875','1','添加产品: HLS2100P','180.175.92.37');
INSERT INTO dou_admin_log VALUES('263','1505118051','1','编辑产品: VEP-2100F','180.175.92.37');
INSERT INTO dou_admin_log VALUES('264','1505118101','1','编辑产品: VEP-2100F','180.175.92.37');
INSERT INTO dou_admin_log VALUES('265','1505118140','1','编辑产品: VEP-2100F','180.175.92.37');
INSERT INTO dou_admin_log VALUES('266','1505118182','1','编辑产品: VEP-2100F','180.175.92.37');
INSERT INTO dou_admin_log VALUES('267','1505118265','1','编辑产品: VEP-2100F','180.175.92.37');
INSERT INTO dou_admin_log VALUES('268','1505118307','1','编辑产品: VEP-2100F','180.175.92.37');
INSERT INTO dou_admin_log VALUES('269','1505118866','1','删除应用: Pulmonology','180.175.92.37');
INSERT INTO dou_admin_log VALUES('270','1505118872','1','删除应用: Gastroenterology','180.175.92.37');
INSERT INTO dou_admin_log VALUES('271','1505118878','1','删除应用: Ear, Nose, Throat','180.175.92.37');
INSERT INTO dou_admin_log VALUES('272','1505118908','1','添加应用: Gastroenterology','180.175.92.37');
INSERT INTO dou_admin_log VALUES('273','1505118927','1','添加应用: Pulmonology','180.175.92.37');
INSERT INTO dou_admin_log VALUES('274','1505118949','1','添加应用: Ear, Nose, Throat','180.175.92.37');
INSERT INTO dou_admin_log VALUES('275','1505118977','1','批量删除: APPLY IN (&#039;9&#039;,&#039;8&#039;,&#039;7&#039;)','180.175.92.37');
INSERT INTO dou_admin_log VALUES('276','1505118989','1','添加应用: Ear, Nose, Throat','180.175.92.37');
INSERT INTO dou_admin_log VALUES('277','1505119002','1','添加应用: Pulmonology','180.175.92.37');
INSERT INTO dou_admin_log VALUES('278','1505119013','1','添加应用: Gastroenterology','180.175.92.37');
INSERT INTO dou_admin_log VALUES('279','1505119171','1','添加应用: Veterinary','180.175.92.37');
INSERT INTO dou_admin_log VALUES('280','1505119287','1','添加分类: Veterinary','180.175.92.37');
INSERT INTO dou_admin_log VALUES('281','1505119309','1','删除应用分类: ','180.175.92.37');
INSERT INTO dou_admin_log VALUES('282','1505119614','1','添加分类: Veterinary','180.175.92.37');
INSERT INTO dou_admin_log VALUES('283','1505120261','1','编辑产品: VEP-2100F','180.175.92.37');
INSERT INTO dou_admin_log VALUES('284','1505120277','1','编辑产品: VEP-2100F','180.175.92.37');
INSERT INTO dou_admin_log VALUES('285','1505121793','1','删除应用分类: ','180.175.92.37');
INSERT INTO dou_admin_log VALUES('286','1505121834','1','删除应用: Veterinary','180.175.92.37');
INSERT INTO dou_admin_log VALUES('287','1505123204','1','管理员登录: 登录成功！','36.57.149.41');
INSERT INTO dou_admin_log VALUES('288','1505178214','1','管理员登录: 登录成功！','180.175.92.37');
INSERT INTO dou_admin_log VALUES('289','1505191341','1','管理员登录: 登录成功！','180.175.92.37');
INSERT INTO dou_admin_log VALUES('290','1505193099','1','编辑产品: Video Colonoscope CVE-2100 Series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('291','1505193321','1','编辑产品: Video Gastroscope GVE-2100 Series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('292','1505193359','1','编辑产品: Video Gastroscope GVE-2100 Series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('293','1505193416','1','删除产品: Video Gastroscope GVE-2100 Series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('294','1505193468','1','添加产品: Video Gastroscope GVE-2100 series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('295','1505193743','1','编辑产品: HLS2100P','180.175.92.37');
INSERT INTO dou_admin_log VALUES('296','1505193791','1','编辑产品: Halogen Light Source HLS2100P','180.175.92.37');
INSERT INTO dou_admin_log VALUES('297','1505194532','1','添加分类: Video Endoscopy System','180.175.92.37');
INSERT INTO dou_admin_log VALUES('298','1505194601','1','编辑产品分类: Endoscopy System','180.175.92.37');
INSERT INTO dou_admin_log VALUES('299','1505194937','1','编辑产品分类: Endoscopy System','180.175.92.37');
INSERT INTO dou_admin_log VALUES('300','1505194967','1','编辑产品分类: Endoscopy System','180.175.92.37');
INSERT INTO dou_admin_log VALUES('301','1505195123','1','编辑产品: Imaging Processor VEP-2100F','180.175.92.37');
INSERT INTO dou_admin_log VALUES('302','1505195163','1','添加产品: Video','180.175.92.37');
INSERT INTO dou_admin_log VALUES('303','1505195219','1','编辑产品: Video Endoscopy System 2100 Series ','180.175.92.37');
INSERT INTO dou_admin_log VALUES('304','1505195413','1','添加产品: Xenon Light Source SLS-2100P','180.175.92.37');
INSERT INTO dou_admin_log VALUES('305','1505195541','1','添加分类: Video Center','180.175.92.37');
INSERT INTO dou_admin_log VALUES('306','1505195574','1','编辑产品分类: Video Center','180.175.92.37');
INSERT INTO dou_admin_log VALUES('307','1505195625','1','删除产品分类: Video Center','180.175.92.37');
INSERT INTO dou_admin_log VALUES('308','1505195635','1','删除产品: Video Endoscopy System 2100 Series ','180.175.92.37');
INSERT INTO dou_admin_log VALUES('309','1505195646','1','删除产品分类: Endoscopy System','180.175.92.37');
INSERT INTO dou_admin_log VALUES('310','1505195669','1','添加分类: Video Center','180.175.92.37');
INSERT INTO dou_admin_log VALUES('311','1505195696','1','添加分类: Video Endoscopy System','180.175.92.37');
INSERT INTO dou_admin_log VALUES('312','1505195721','1','编辑产品分类: Endoscopy System','180.175.92.37');
INSERT INTO dou_admin_log VALUES('313','1505195743','1','编辑产品分类: Endoscope','180.175.92.37');
INSERT INTO dou_admin_log VALUES('314','1505195825','1','添加产品: Video Center 2100 Series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('315','1505195906','1','添加产品: Video Endoscopy System 2100 Series ','180.175.92.37');
INSERT INTO dou_admin_log VALUES('316','1505196562','1','添加产品: Video Gastroscope GVE-2600 series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('317','1505196628','1','添加产品: Video Gastroscope CVE-2600 series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('318','1505196652','1','删除产品: Video Gastroscope GVE-2600 series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('319','1505196680','1','添加产品: Video Gastroscope GVE-2600 series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('320','1505196804','1','添加产品: Video Bronchoscope VB-2600','180.175.92.37');
INSERT INTO dou_admin_log VALUES('321','1505197047','1','添加产品: Video Rhinolaryngoscope VN-2600','180.175.92.37');
INSERT INTO dou_admin_log VALUES('322','1505197191','1','编辑产品: Video Rhinolaryngoscope VN-2600','180.175.92.37');
INSERT INTO dou_admin_log VALUES('323','1505197417','1','添加产品: Imaging Processor VEP-2800','180.175.92.37');
INSERT INTO dou_admin_log VALUES('324','1505197657','1','添加产品: Xenon Light Source SLS-2850','180.175.92.37');
INSERT INTO dou_admin_log VALUES('325','1505197783','1','添加产品: LED Light Source LLS-2810','180.175.92.37');
INSERT INTO dou_admin_log VALUES('326','1505197872','1','添加产品: Video Center 2600 Series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('327','1505198063','1','添加产品: Video Endoscopy System 2600 Series ','180.175.92.37');
INSERT INTO dou_admin_log VALUES('328','1505198751','1','添加产品: Fiber Bronchoscope Series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('329','1505198869','1','添加产品: Fiber Rhinolaryngoscope Series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('330','1505199050','1','添加产品: Portable Fiber Nasopharyngoscope Series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('331','1505199109','1','添加产品: Portable Fiber Laryngoscope Series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('332','1505199155','1','编辑产品: Portable Fiber Laryngoscope Series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('333','1505199435','1','编辑产品: Portable Fiber Laryngoscope ','180.175.92.37');
INSERT INTO dou_admin_log VALUES('334','1505199503','1','编辑产品: Fiber Nasopharyngoscope Series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('335','1505199544','1','编辑产品: Fiber Nasopharyngoscope ','180.175.92.37');
INSERT INTO dou_admin_log VALUES('336','1505199632','1','编辑产品: Portable Fiber Nasopharyngoscope ','180.175.92.37');
INSERT INTO dou_admin_log VALUES('337','1505199683','1','编辑产品: Portable Fiber Nasopharyngoscope Series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('338','1505200127','1','编辑产品分类: Endoscope','180.175.92.37');
INSERT INTO dou_admin_log VALUES('339','1505200523','1','添加产品: Video GI Endoscope AGVE-2100 Series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('340','1505200765','1','添加产品: Digital Bronchoscope UCB-66 Series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('341','1505200893','1','添加产品: Digital Nasopharyngoscope UCN-66A','180.175.92.37');
INSERT INTO dou_admin_log VALUES('342','1505201183','1','添加产品: HD Video GI Endoscope AGVE-68H Series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('343','1505201767','1','添加产品: Imaging System VIS-2100 Series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('344','1505201811','1','编辑产品: Imaging System VIS-2100S','180.175.92.37');
INSERT INTO dou_admin_log VALUES('345','1505201887','1','编辑产品分类: Imaging Center','180.175.92.37');
INSERT INTO dou_admin_log VALUES('346','1505201976','1','编辑产品: Imaging Center VIS-2100S','180.175.92.37');
INSERT INTO dou_admin_log VALUES('347','1505202044','1','添加产品: Imaging Center USB Series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('348','1505202794','1','添加产品: HD Imaging Center VIS-68','180.175.92.37');
INSERT INTO dou_admin_log VALUES('349','1505203589','1','编辑应用分类: 耳鼻喉科','180.175.92.37');
INSERT INTO dou_admin_log VALUES('350','1505203787','1','添加导航: Products','180.175.92.37');
INSERT INTO dou_admin_log VALUES('351','1505206309','1','添加导航: 研发中心','180.175.92.37');
INSERT INTO dou_admin_log VALUES('352','1505206330','1','删除导航: 研发中心','180.175.92.37');
INSERT INTO dou_admin_log VALUES('353','1505206577','1','编辑产品: Portable Fiber Laryngoscope FL-39A','180.175.92.37');
INSERT INTO dou_admin_log VALUES('354','1505206619','1','编辑产品: Portable Fiber Nasopharyngoscope FN-38A/FN-32A','180.175.92.37');
INSERT INTO dou_admin_log VALUES('355','1505206657','1','编辑产品: Fiber Nasopharyngoscope FN-50A','180.175.92.37');
INSERT INTO dou_admin_log VALUES('356','1505206688','1','编辑产品: Fiber Bronchoscope FB-53A/FB60A','180.175.92.37');
INSERT INTO dou_admin_log VALUES('357','1505206803','1','编辑产品: Video Gastroscope GVE-2600/GVE2600X/GVE-2600P','180.175.92.37');
INSERT INTO dou_admin_log VALUES('358','1505206831','1','编辑产品: Video Gastroscope          GVE-2600/GVE2600X/GVE-2600P','180.175.92.37');
INSERT INTO dou_admin_log VALUES('359','1505206851','1','编辑产品: Video Gastroscope          GVE-2600/GVE2600X/GVE-2600P','180.175.92.37');
INSERT INTO dou_admin_log VALUES('360','1505206871','1','编辑产品: Video Gastroscope                                                GVE-2600/GVE2600X/GVE-2600P','180.175.92.37');
INSERT INTO dou_admin_log VALUES('361','1505206893','1','编辑产品: Video Gastroscope                                                GVE-2600/GVE2600X/GVE-2600P','180.175.92.37');
INSERT INTO dou_admin_log VALUES('362','1505206912','1','编辑产品: Video Gastroscope GVE-2600/GVE2600X/GVE-2600P','180.175.92.37');
INSERT INTO dou_admin_log VALUES('363','1505207089','1','编辑产品: Video Colonoscope CVE-2600TM/LM/IM/SM','180.175.92.37');
INSERT INTO dou_admin_log VALUES('364','1505207234','1','添加产品: Video Colonoscope CVE-2600TP/GVE2600LP/GVE-2600IP/GVE-2600SP','180.175.92.37');
INSERT INTO dou_admin_log VALUES('365','1505207275','1','编辑产品: Video Colonoscope CVE-2600TP/LP/IP/SP','180.175.92.37');
INSERT INTO dou_admin_log VALUES('366','1505207454','1','编辑产品: Video Gastroscope GVE-2100/GVE-2100X/GVE-2100P','180.175.92.37');
INSERT INTO dou_admin_log VALUES('367','1505207520','1','编辑产品: Video Colonoscope CVE-2100TM/LM/IM','180.175.92.37');
INSERT INTO dou_admin_log VALUES('368','1505207656','1','添加产品: Video Colonoscope CVE-2100TP/LP/IP','180.175.92.37');
INSERT INTO dou_admin_log VALUES('369','1505207687','1','编辑产品: Video Colonoscope CVE-2100TP/LP/IP','180.175.92.37');
INSERT INTO dou_admin_log VALUES('370','1505207733','1','编辑产品: Video Colonoscope CVE-2100TP/LP/IP','180.175.92.37');
INSERT INTO dou_admin_log VALUES('371','1505207970','1','编辑产品: HD Video GI Endoscope AGVE-68HQ/AGVE-68HS/AGVE-68HB','180.175.92.37');
INSERT INTO dou_admin_log VALUES('372','1505208032','1','编辑产品: Digital Bronchoscope UCB-66A/UCB-66L','180.175.92.37');
INSERT INTO dou_admin_log VALUES('373','1505208169','1','编辑产品: Video Gastroscope  AGVE-2100B/AGVE-2100P/AGVE-2100S/AGVE-2100P','180.175.92.37');
INSERT INTO dou_admin_log VALUES('374','1505208235','1','添加产品: Video Gastroscope AGVE-2100AL','180.175.92.37');
INSERT INTO dou_admin_log VALUES('375','1505208618','1','添加产品: Imaging Processing Software','180.175.92.37');
INSERT INTO dou_admin_log VALUES('376','1505209018','1','添加产品: HD Imaging Processor VEP-6100H','180.175.92.37');
INSERT INTO dou_admin_log VALUES('377','1505209101','1','添加产品: Video Center VEP-6100H Series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('378','1505209121','1','编辑产品: Video Center VEP-6100H Series','180.175.92.37');
INSERT INTO dou_admin_log VALUES('379','1505209317','1','编辑产品: Video Endoscopy System 2600 Series ','180.175.92.37');
INSERT INTO dou_admin_log VALUES('380','1505209406','1','编辑产品: Video Endoscopy System 2600 Series ','180.175.92.37');
INSERT INTO dou_admin_log VALUES('381','1505209652','1','添加产品: HD Video Endoscopy System VEP-6100H ','180.175.92.37');
INSERT INTO dou_admin_log VALUES('382','1505209700','1','编辑产品: HD Video Endoscopy System 6100H Series ','180.175.92.37');
INSERT INTO dou_admin_log VALUES('383','1505210148','1','编辑产品: HD Video Endoscopy System 6100H Series ','180.175.92.37');
INSERT INTO dou_admin_log VALUES('384','1505210241','1','编辑产品: HD Video Endoscopy System 6100H Series ','180.175.92.37');
INSERT INTO dou_admin_log VALUES('385','1505210310','1','编辑产品: HD Video Endoscopy System 6100H Series ','180.175.92.37');
INSERT INTO dou_admin_log VALUES('386','1505261017','1','管理员登录: 登录成功！','180.175.92.37');
INSERT INTO dou_admin_log VALUES('387','1505261062','1','删除导航: Products','180.175.92.37');
INSERT INTO dou_admin_log VALUES('388','1505275709','1','管理员登录: 登录成功！','180.175.92.37');
INSERT INTO dou_admin_log VALUES('389','1505280159','1','管理员登录: 登录成功！','36.57.144.255');
INSERT INTO dou_admin_log VALUES('390','1505281873','1','添加应用: 测试','36.57.144.255');
INSERT INTO dou_admin_log VALUES('391','1505281943','1','添加应用: 测试数据','36.57.144.255');
INSERT INTO dou_admin_log VALUES('392','1505281977','1','添加分类: 测试1','36.57.144.255');
INSERT INTO dou_admin_log VALUES('393','1505281986','1','编辑应用: 测试','36.57.144.255');
INSERT INTO dou_admin_log VALUES('394','1505282651','1','管理员登录: 登录成功！','36.57.144.255');

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

INSERT INTO dou_apply VALUES('1','4','1','肠胃医疗','','上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。于2003年3月获得国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。','images/apply/1_1502259965291618.jpg','','','','1502259965','14','0');
INSERT INTO dou_apply VALUES('10','0','2','Ear, Nose, Throat','','','','','','','1505118989','0','0');
INSERT INTO dou_apply VALUES('11','2','2','Pulmonology','','','','','','','1505119002','0','0');
INSERT INTO dou_apply VALUES('12','1','2','Gastroenterology','','','','','','','1505119013','1','0');
INSERT INTO dou_apply VALUES('14','9','2','测试','','演示数据','images/apply/14_1505281873936488.jpg','','','','1505281873','0','0');
INSERT INTO dou_apply VALUES('15','0','2','测试数据','','演示数据','images/apply/15_1505281943376658.jpg','','','','1505281943','0','0');
INSERT INTO dou_apply VALUES('5','5','1','呼吸呼吸下','','呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下呼吸呼吸下','images/apply/5_1504692610144342.jpg','','','','1504692610','1','0');
INSERT INTO dou_apply VALUES('6','6','1','五官五官五官五官五官','','五官五官五官五官五官五官五官五官五官五官五官五官五官五官五官五官','images/apply/6_1504692647802170.jpg','','','','1504692647','2','0');

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

INSERT INTO dou_apply_category VALUES('1','Gastroenterology','2','消化科','','','0','10');
INSERT INTO dou_apply_category VALUES('2','Pulmonology','2','呼吸科','','','0','20');
INSERT INTO dou_apply_category VALUES('3','EarNoseThroat','2','耳鼻喉科','','','0','30');
INSERT INTO dou_apply_category VALUES('4','xh','1','消化科','','','0','10');
INSERT INTO dou_apply_category VALUES('5','hx','1','呼吸科','','','0','50');
INSERT INTO dou_apply_category VALUES('6','wg','1','五官科','','','0','60');
INSERT INTO dou_apply_category VALUES('9','cs','2','测试1','','','0','50');

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

INSERT INTO dou_article VALUES('1','1','1','公司官网2017正式上线','','<p>\r\n	上线计划中……\r\n</p>\r\n<p>\r\n	上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。于2003年3月获得国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。于2003年3月获得国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。于2003年3月获得国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家, 内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。于2003年3月获得国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。\r\n</p>\r\n<p>\r\n	上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。于2003年3月获得国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。\r\n</p>','images/article/1_1502089823949049.png','','1502089823','0','','','news_info.html','1');
INSERT INTO dou_article VALUES('2','1','1','成运最新科研成果','','发布最新黑科技','images/article/2_1502090615070399.jpg','','1502090067','0','','','news_info.html','2');
INSERT INTO dou_article VALUES('3','1','1','武汉CMEF展会','','展位号A6F07','images/article/3_1502090681985419.jpg','','1502090433','1','','','news_info.html','3');
INSERT INTO dou_article VALUES('6','2','1','活动标题1','','活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1活动内容1','images/article/6_1502093524275396.png','','1502093499','0','','','article.dwt','1');
INSERT INTO dou_article VALUES('4','1','1','第31届中国国际医疗器械（山东）博览会','','我公司于3月12日至3月14日参加第31届中国国际医疗器械（山东）博览会','','','1502090471','0','','','news_info.html','4');
INSERT INTO dou_article VALUES('5','1','1','第25届中原医疗器械展览会','','我公司于3月6日至3月8日参加第25届中原医疗器械展览会','images/article/5_1502090507168845.jpg','','1502090507','0','','','news_info.html','5');
INSERT INTO dou_article VALUES('7','2','1','活动标题2','','活动内容2','images/article/7_1502094412504215.jpg','','1502093617','0','','','article.dwt','2');
INSERT INTO dou_article VALUES('8','2','1','活动标题3','','活动内容3','images/article/8_1502094391092479.png','','1502094391','0','','','article.dwt','3');
INSERT INTO dou_article VALUES('9','3','1','服务1','','400-800-00000','','','1502244202','0','','400-800-00000','article.dwt','1');
INSERT INTO dou_article VALUES('10','3','1','服务2','','HUGER after sales departmen','','','1502244232','0','','HUGER after sales departmen','article.dwt','2');
INSERT INTO dou_article VALUES('11','3','1','服务3','','No. 1328 Yao North Road, Shanghai, Songjiang District','','','1502244276','0','','No. 1328 Yao North Road, Shanghai, Songjiang District','article.dwt','3');
INSERT INTO dou_article VALUES('12','4','2','Launching Company\'s Official Website on 8th of Oct. 2017','','<p class=\"MsoNormal\">\r\n	HUGER MEDICAI is delighted to\r\nlaunch her new official website. This new website contains HUGER’s general\r\ninformation, products and services, R&amp;D results and News &amp; Events. It\r\nalso plays the role of a platform for customers contacting with us. We hope you\r\nfind what you would like to know via surfing this website or reach at the\r\nperson who is right the one in charge of your enquiries and problems.\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	Hope your enjoy this website and\r\nif you have any questions or suggestions, we sincerely appreciate you let us\r\nknow. <span></span> \r\n</p>','','','1503292376','0','','','news_info.html','50');
INSERT INTO dou_article VALUES('13','6','2','Services 1','','<span style=\"color:#000000;font-family:\" font-size:12px;font-style:normal;font-weight:normal;\"=\"\"><br />\r\n</span>','','','1503292525','0','','400-800-00000','article.dwt','1');
INSERT INTO dou_article VALUES('14','6','2','Services 2','','<span style=\"color:#000000;font-family:&quot;font-size:12px;font-style:normal;font-weight:normal;\">HUGER after sales departmen</span>','','','1503294182','0','','','article.dwt','2');
INSERT INTO dou_article VALUES('15','6','2','Services 3','','<span style=\"color:#000000;font-family:&quot;font-size:12px;font-style:normal;font-weight:normal;\">No. 1328 Yao North Road, Shanghai, Songjiang District</span>','','','1503294218','0','','','article.dwt','3');
INSERT INTO dou_article VALUES('16','5','2','Activity title 1','','Activity Content 1','','','1503294310','0','','','article.dwt','1');
INSERT INTO dou_article VALUES('17','5','2','Activity Title 21','','Activity Content 2','','','1503294352','0','','','article.dwt','2');

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

INSERT INTO dou_article_category VALUES('1','gsnews','0','1','公司新闻','','','','定期更新公司新闻','news.html','50');
INSERT INTO dou_article_category VALUES('2','activity','0','1','公司活动','','','活动','','article_category.dwt','50');
INSERT INTO dou_article_category VALUES('3','service','0','1','服务中心','','<ul class=\"serviceIntro\">\r\n<li class=\"serviceIntro_items\">\r\n<h6>\r\n最亲切的守护力量服务，让亲近更有价值\r\n</h6>\r\n<p>\r\n上海成运医疗器械股份有限公司是一家中德技术合作企业，公司的主要生产医用电子内窥镜。于2003年3月获得了国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。\r\n</p>\r\n</li>\r\n<li class=\"serviceIntro_items\">\r\n<h6>\r\n最亲切的守护力量服务，让亲近更有价值\r\n</h6>\r\n<p>\r\n上海成运医疗器械股份有限公司是一家中德技术合作企业，公司的主要生产医用电子内窥镜。于2003年3月获得了国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。\r\n</p>\r\n</li>\r\n<li class=\"serviceIntro_items\">\r\n<h6>\r\n最亲切的守护力量服务，让亲近更有价值\r\n</h6>\r\n<p>\r\n上海成运医疗器械股份有限公司是一家中德技术合作企业，公司的主要生产医用电子内窥镜。于2003年3月获得了国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。\r\n</p>\r\n</li>\r\n<li class=\"serviceIntro_items\">\r\n<h6>\r\n最亲切的守护力量服务，让亲近更有价值\r\n</h6>\r\n<p>\r\n上海成运医疗器械股份有限公司是一家中德技术合作企业，公司的主要生产医用电子内窥镜。于2003年3月获得了国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。\r\n</p>\r\n</li>\r\n</ul>','','最亲切的守护力量服务，让亲近更有价值\r\n上海成运医疗器械股份有限公司是一家中德技术合作企业，公司的主要生产医用电子内窥镜。于2003年3月获得了国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。','serviceCenter.html','50');
INSERT INTO dou_article_category VALUES('5','act-en','0','2','Activity','','<p class=\"MsoNormal\">\r\n	<br />\r\n</p>','','HUGER MEDICAL is delighted to launch her new official website. This new website contains HUGER’s general information, products and services, R&D results and News & Events. It also plays the role of a platform for customers contacting with us. We hope you ','article_category.dwt','50');
INSERT INTO dou_article_category VALUES('4','news-en','0','2','News','','<p class=\"MsoNormal\">\r\n	<br />\r\n</p>','','HUGER MEDICAL is delighted to launch her new official website. This new website contains HUGER’s general information, products and services, R&D results and News & Events. It also plays the role of a platform for customers contacting with us. We hope you ','news.html','50');
INSERT INTO dou_article_category VALUES('6','sc-en','0','2','Service Center','','<p class=\"MsoNormal\">\r\n	<br />\r\n</p>','','','serviceCenter.html','50');

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


DROP TABLE IF EXISTS `dou_config`;
CREATE TABLE `dou_config` (
  `name` varchar(80) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT '',
  `box` varchar(255) NOT NULL DEFAULT '',
  `tab` varchar(10) NOT NULL DEFAULT 'main',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `display` mediumint(8) NOT NULL DEFAULT '50'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO dou_config VALUES('site_name','成运网站','text','','main','1','1');
INSERT INTO dou_config VALUES('site_title','成运网站','text','','main','2','1');
INSERT INTO dou_config VALUES('site_keywords','成运网站','text','','main','3','1');
INSERT INTO dou_config VALUES('site_description','成运网站','text','','main','4','1');
INSERT INTO dou_config VALUES('site_logo','logo.png','file','','main','5','1');
INSERT INTO dou_config VALUES('site_closed','0','radio','','main','6','1');
INSERT INTO dou_config VALUES('company','上海成运医疗器械股份有限公司','text','','main','7','1');
INSERT INTO dou_config VALUES('site_address','中国上海市松江区莘砖公路3825号','text','','main','7','1');
INSERT INTO dou_config VALUES('icp','沪ICP备05048542','text','','main','8','1');
INSERT INTO dou_config VALUES('certi','《互联网药品信息服务资格证》证书编号：（沪）-非经营性-2010-0063','text','','main','8','1');
INSERT INTO dou_config VALUES('tel','+86-21-67691764','text','','main','9','1');
INSERT INTO dou_config VALUES('fax','+86-21-67691721','text','','main','10','1');
INSERT INTO dou_config VALUES('qq','','text','','main','11','1');
INSERT INTO dou_config VALUES('email','inform@huger.cn','text','','main','12','1');
INSERT INTO dou_config VALUES('language','en_us','select','','main','13','1');
INSERT INTO dou_config VALUES('rewrite','0','radio','','main','14','1');
INSERT INTO dou_config VALUES('sitemap','0','radio','','main','15','1');
INSERT INTO dou_config VALUES('captcha','0','radio','','main','16','1');
INSERT INTO dou_config VALUES('guestbook_check_chinese','1','radio','','main','17','1');
INSERT INTO dou_config VALUES('code','','textarea','','main','18','1');
INSERT INTO dou_config VALUES('thumb_width','135','text','','display','1','1');
INSERT INTO dou_config VALUES('thumb_height','135','text','','display','2','1');
INSERT INTO dou_config VALUES('price_decimal','2','text','','display','3','1');
INSERT INTO dou_config VALUES('display','a:10:{s:7:\"article\";s:1:\"1\";s:12:\"home_article\";s:1:\"5\";s:7:\"product\";s:2:\"10\";s:12:\"home_product\";s:1:\"4\";s:5:\"apply\";s:2:\"10\";s:10:\"home_apply\";s:1:\"5\";s:8:\"research\";s:1:\"9\";s:13:\"home_research\";s:1:\"5\";s:3:\"job\";s:2:\"20\";s:8:\"home_job\";s:1:\"5\";}','array','','display','4','1');
INSERT INTO dou_config VALUES('defined','a:2:{s:7:\"article\";s:0:\"\";s:7:\"product\";s:499:\"尺寸,电压,频率,功率,大小,重量,模拟信号输出,电子信号输出,白平衡,颜色调节,饱和度调节,测光测试,血红蛋白增强,结构增强,边缘增强,冻结,回放,电子放大,增益,画中画,图像存储,视频存储,SD卡,管理文件夹,主灯,灯泡平均寿命,亮度调节,备用灯,备用灯平均寿命,气泵压力,压力档位,方法,视野角,视向,景深(mm),头端外径mm),头端放大图,插入部外径(mm),钳道内径(mm),弯角,工作长度,总长度\";}','array','','defined','1','1');
INSERT INTO dou_config VALUES('mail_service','1','radio','','mail','1','1');
INSERT INTO dou_config VALUES('mail_host','smtp.qq.com','text','','mail','2','1');
INSERT INTO dou_config VALUES('mail_port','25','text','','mail','3','1');
INSERT INTO dou_config VALUES('mail_ssl','0','radio','','mail','4','1');
INSERT INTO dou_config VALUES('mail_username','wowlothar@foxmail.com','text','','mail','5','1');
INSERT INTO dou_config VALUES('mail_password','opqzaolxpbbjbdcf','text','','mail','6','1');
INSERT INTO dou_config VALUES('mobile_name','成运网站','text','','mobile','1','1');
INSERT INTO dou_config VALUES('mobile_title','成运网站触屏版','text','','mobile','2','1');
INSERT INTO dou_config VALUES('mobile_keywords','成运网站触屏版','text','','mobile','3','1');
INSERT INTO dou_config VALUES('mobile_description','成运网站触屏版','text','','mobile','4','1');
INSERT INTO dou_config VALUES('mobile_logo','','file','','mobile','5','1');
INSERT INTO dou_config VALUES('mobile_closed','1','radio','','mobile','6','1');
INSERT INTO dou_config VALUES('mobile_display','a:14:{s:7:\"article\";s:2:\"10\";s:12:\"home_article\";s:1:\"5\";s:7:\"product\";s:2:\"10\";s:12:\"home_product\";s:1:\"4\";s:5:\"video\";s:2:\"10\";s:10:\"home_video\";s:1:\"5\";s:7:\"gallery\";s:2:\"10\";s:12:\"home_gallery\";s:1:\"5\";s:8:\"download\";s:2:\"10\";s:13:\"home_download\";s:1:\"5\";s:4:\"case\";s:2:\"10\";s:9:\"home_case\";s:1:\"5\";s:4:\"user\";s:2:\"10\";s:9:\"home_user\";s:1:\"5\";}','array','','mobile','7','1');
INSERT INTO dou_config VALUES('site_theme','zh_cn','hidden','','','100','1');
INSERT INTO dou_config VALUES('mobile_theme','default','hidden','','','101','1');
INSERT INTO dou_config VALUES('build_date','1478503787','hidden','','','102','1');
INSERT INTO dou_config VALUES('update_number','a:6:{s:6:\"update\";s:1:\"0\";s:5:\"patch\";s:1:\"0\";s:6:\"module\";s:1:\"9\";s:6:\"plugin\";s:1:\"0\";s:5:\"theme\";s:1:\"0\";s:6:\"mobile\";N;}','hidden','','','103','1');
INSERT INTO dou_config VALUES('update_date','a:3:{s:6:\"system\";a:2:{s:6:\"update\";s:8:\"20170424\";s:5:\"patch\";s:8:\"20170424\";}s:6:\"module\";a:12:{s:7:\"article\";s:8:\"20170424\";s:7:\"product\";s:8:\"20170424\";s:9:\"guestbook\";s:8:\"20161107\";s:4:\"link\";s:8:\"20161109\";s:6:\"plugin\";s:8:\"20161109\";s:5:\"video\";s:8:\"20161110\";s:7:\"gallery\";s:8:\"20161110\";s:5:\"excel\";s:8:\"20161110\";s:8:\"download\";s:8:\"20161110\";s:4:\"case\";s:8:\"20161110\";s:5:\"order\";s:8:\"20161110\";s:4:\"user\";s:8:\"20161110\";}s:6:\"plugin\";a:1:{s:7:\"express\";s:8:\"20161109\";}}','hidden','','','104','1');
INSERT INTO dou_config VALUES('cloud_account','a:2:{s:4:\"user\";s:16:\"keven518@163.com\";s:8:\"password\";s:32:\"e10adc3949ba59abbe56e057f20f883e\";}','hidden','','','105','1');
INSERT INTO dou_config VALUES('hash_code','8181e1868966225f612680d39d3aa209','hidden','','','106','1');
INSERT INTO dou_config VALUES('douphp_version','v1.3 Release 20170424','hidden','','','107','1');

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

INSERT INTO dou_district VALUES('1','0','1','China','中国','','','50');
INSERT INTO dou_district VALUES('2','1','1','Russia','俄罗斯','','','50');
INSERT INTO dou_district VALUES('3','0','1','America','美国','','','50');

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

INSERT INTO dou_diy VALUES('1','1','1','医疗业','','','','','','1503472276','0','','0');
INSERT INTO dou_diy VALUES('2','1','1','电器','','','','','','1503472292','0','','0');
INSERT INTO dou_diy VALUES('3','2','1','产品经理','','','','','','1503472721','0','','0');
INSERT INTO dou_diy VALUES('4','2','1','技术总监','','','','','','1503472839','0','','0');
INSERT INTO dou_diy VALUES('5','2','1','行政主管','','','','','','1503472887','0','','0');
INSERT INTO dou_diy VALUES('6','2','1','客服','','','','','','1503472912','0','','0');
INSERT INTO dou_diy VALUES('7','2','1','销售','','','','','','1503472926','0','','0');

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

INSERT INTO dou_diy_category VALUES('1','industry','1','所属领域','','','','0','10');
INSERT INTO dou_diy_category VALUES('2','post','1','职业','','','','0','20');
INSERT INTO dou_diy_category VALUES('3','interest','1','兴趣','','','','0','30');

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

INSERT INTO dou_guestbook VALUES('1','测试主题','迪拜','','','网站建议','0','0','127.0.0.1','1502700076','0','HUGER研发部','0','机构','0','这是地址','236000','13954687952','cy@qq.com');
INSERT INTO dou_guestbook VALUES('2','测试主题','迪拜','','','网站建议','0','0','127.0.0.1','1502700102','0','HUGER研发部','0','机构','0','这是地址','236000','13954687952','cy@qq.com');
INSERT INTO dou_guestbook VALUES('4','测试主题','迪拜','','','网站建议','0','1','127.0.0.1','1502700296','0','HUGER研发部','0','机构','0','这是地址','236000','13954687952','cy@qq.com');

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

INSERT INTO dou_job VALUES('1','1','1','产品经理','','','','研发','1','上海','','','','1502251203','5','0');
INSERT INTO dou_job VALUES('2','1','1','技术总监','','<p style=\"color:#3E3E3E;font-family:微软雅黑, sans-serif;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:900;\">产品系统工程师</span> \r\n</p>\r\n<p style=\"color:#3E3E3E;font-family:微软雅黑, sans-serif;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:900;\">工作职责：</span> \r\n</p>\r\n<p style=\"color:#3E3E3E;font-family:微软雅黑, sans-serif;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;\">\r\n	1、负责体外诊断仪器产品系统设计相关开发、验证工作\r\n</p>\r\n<p style=\"color:#3E3E3E;font-family:微软雅黑, sans-serif;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:900;\">职位要求：</span> \r\n</p>\r\n<p style=\"color:#3E3E3E;font-family:微软雅黑, sans-serif;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;\">\r\n	1、生物医学工程、机电一体化、电子测量及仪器、自动化等相关专业，大学本科以上学历；\r\n</p>\r\n<p style=\"color:#3E3E3E;font-family:微软雅黑, sans-serif;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;\">\r\n	2、2年以上仪器系统设计相关工作经验；\r\n</p>\r\n<p style=\"color:#3E3E3E;font-family:微软雅黑, sans-serif;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;\">\r\n	3、熟悉机电系统可靠性设计、仪器信号系统设计、控制系统设计的基本方法和原理，具备相关系统子系统的开发经验；\r\n</p>\r\n<p style=\"color:#3E3E3E;font-family:微软雅黑, sans-serif;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;\">\r\n	4、能够熟练应用QFD、 FMEA、FTA等方法分析分解系统设计问题，熟悉医疗产品风险管理、质量体系管理相关法规；\r\n</p>\r\n<p style=\"color:#3E3E3E;font-family:微软雅黑, sans-serif;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;\">\r\n	5、具备体外诊断仪器产品系统设计经验者优先。\r\n</p>','','研发','1','上海','','','','1502251240','2','0');
INSERT INTO dou_job VALUES('3','1','1','销售人员','','','','销售','5','上海','','','','1502251294','4','0');
INSERT INTO dou_job VALUES('4','2','2','Product Manager','','','','reseach','1','Shanghai','','','','1503295158','0','0');
INSERT INTO dou_job VALUES('5','2','2','Technical Director','','<p>\r\n	<span>Product System Engineer</span> \r\n</p>\r\n<p>\r\n	<span>Operating Duty</span> \r\n</p>\r\n<p>\r\n	Be responsible for the design, development and validation of in vitro diagnostic instruments.\r\n</p>\r\n<p>\r\n	<span>Job Requirements</span> \r\n</p>\r\n<p>\r\n	1 Bachelor degree or above in biomedical engineering, mechatronics, electronic measurement and instrumentation, automation, etc.\r\n</p>\r\n<p>\r\n	2 More than 2 years work experience in instrument system design.\r\n</p>\r\n<p>\r\n	3 Familiar with the basic methods and principles of mechanical and electrical system reliability design, instrument signal system design, control system design, and related system subsystem development experience.\r\n</p>\r\n<p>\r\n	4 Familiar with QFD, FMEA, FTA and other methods to analyze and decompose system design issues, familiar with medical product risk management, quality system management related laws and regulations.\r\n</p>\r\n<p>\r\n	5 Experience in system design of in vitro diagnostic instruments is preferred.\r\n</p>','','reseach','1','Shanghai','','','','1503295199','0','0');
INSERT INTO dou_job VALUES('6','2','2','Sales Manager','','','','Sales','5','Shanghai','','','','1503295254','1','0');

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

INSERT INTO dou_job_category VALUES('1','master','1','职位招聘','','','0','50');
INSERT INTO dou_job_category VALUES('2','Talents','2','Careers','','','0','10');

DROP TABLE IF EXISTS `dou_link`;
CREATE TABLE `dou_link` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `link_name` varchar(60) NOT NULL DEFAULT '',
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO dou_link VALUES('1','tyloafer','http://tyloafer.cn','1');

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

INSERT INTO dou_nav VALUES('1','0','1','apply_category','应用','0','middle','50');
INSERT INTO dou_nav VALUES('2','0','1','research_category','研发','0','middle','50');
INSERT INTO dou_nav VALUES('3','0','1','page','关于我们','1','middle','50');
INSERT INTO dou_nav VALUES('4','0','1','article_category','服务中心','3','middle','50');
INSERT INTO dou_nav VALUES('5','0','1','article_category','新闻资讯','1','middle','70');
INSERT INTO dou_nav VALUES('6','0','1','job_category','职位招聘','0','middle','80');
INSERT INTO dou_nav VALUES('7','0','1','page','关于我们','1','bottom','10');
INSERT INTO dou_nav VALUES('8','0','1','article_category','服务中心','3','bottom','20');
INSERT INTO dou_nav VALUES('9','0','1','article_category','新闻资讯','1','bottom','30');
INSERT INTO dou_nav VALUES('10','0','1','job_category','招聘职位','0','bottom','40');
INSERT INTO dou_nav VALUES('11','0','2','apply_category','Application','0','middle','30');
INSERT INTO dou_nav VALUES('12','0','2','research_category','R&D','0','middle','20');
INSERT INTO dou_nav VALUES('13','0','2','page','About Us','2','middle','30');
INSERT INTO dou_nav VALUES('14','0','2','article_category','Services','6','middle','40');
INSERT INTO dou_nav VALUES('15','0','2','article_category','News & Events','4','middle','50');
INSERT INTO dou_nav VALUES('16','0','2','job_category','Careers','0','middle','60');
INSERT INTO dou_nav VALUES('17','0','2','page','About Us','2','bottom','10');
INSERT INTO dou_nav VALUES('18','0','2','article_category','Services','6','bottom','20');
INSERT INTO dou_nav VALUES('19','0','2','article_category','News & Events','4','bottom','30');
INSERT INTO dou_nav VALUES('20','0','2','job_category','Careers','0','bottom','40');
INSERT INTO dou_nav VALUES('21','1','1','apply_category','消化科','4','middle','1');
INSERT INTO dou_nav VALUES('22','1','1','apply_category','呼吸科','5','middle','2');
INSERT INTO dou_nav VALUES('23','1','1','apply_category','五官科','6','middle','3');
INSERT INTO dou_nav VALUES('24','11','2','apply_category','Gastroenterology','1','middle','50');
INSERT INTO dou_nav VALUES('25','11','2','apply_category','Pulmonology','2','middle','50');
INSERT INTO dou_nav VALUES('26','11','2','apply_category','Ear, Nose, Throat','3','middle','50');

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

INSERT INTO dou_order VALUES('1','2016111040620','1','15555423186','李小宇','adhflksfksdfsdf','230601','','','','9510.00','0.00','9510.00','0','1478745466');

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

INSERT INTO dou_order_product VALUES('1','1','6','BlackBerry黑莓9780','1860.00','1','');
INSERT INTO dou_order_product VALUES('2','1','7','MacBook Air笔记本电脑','7650.00','1','');

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

INSERT INTO dou_page VALUES('1','about','0','1','关于我们','<div class=\"aboutCon_content_img\">\r\n	<img src=\"http://cypro.wincomtech.cn/admin/theme/zh_cn/img/lb1.jpg\" alt=\"\" /> \r\n</div>\r\n<div class=\"aboutCon_content_con\">\r\n	<p>\r\n		上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。于2003年3月获得国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。\r\n	</p>\r\n	<p>\r\n		上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。于2003年3月获得国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。于2003年3月获得国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。于2003年3月获得国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家, 内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。于2003年3月获得国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。\r\n	</p>\r\n	<p>\r\n		上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。于2003年3月获得国家食品药品监督管理局《医疗器械产品生产注册证》成为国内第一家成功获准注册上市的医用电子内窥镜生产厂家。内镜的应用领域极为广泛，其中包括如：涡轮机的内部构造、飞机走私货物侦查或进行自然科学研究等用途。而测量系统、电子内镜、软性内镜及管道镜等品类丰富的产品则可保证在各种工作条件及应用领域中，使用者均可快速便捷地使用产品。\r\n	</p>\r\n</div>','','','上海成运医疗器械股份有限公司是一家中德技术合作企业，公司主要生产医用电子内窥镜。','about.html');
INSERT INTO dou_page VALUES('2','AboutUs','0','2','About Us','<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	HUGER MEDICAI INSTRUMENT Co.,\r\nLtd. is proud to be the first manufacture of medical video endoscope in China.\r\nThe advanced manufacturing system and motivated engineers with decades\r\nexperience guarantee products and systems distinguished by their quality and\r\nsafety. Huger has always been a driving force to the development in endoscopy\r\nfield.\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	Huger are not satisfied with the\r\ndomestic No.1, but also becoming the worldwide top-class company. It has been\r\ntaken comprehensively in the European market and enjoy a good name for its\r\nexcellent products and service. Based on the numerous distributors worldwide,\r\nwe can offer our products with considerate service after sales to most parts of\r\nthe world.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>','','','HUGER MEDICAI INSTRUMENT Co., Ltd. is proud to be the first manufacture of medical video endoscope in China. ','about.html');

DROP TABLE IF EXISTS `dou_plugin`;
CREATE TABLE `dou_plugin` (
  `unique_id` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(120) NOT NULL DEFAULT '',
  `config` text NOT NULL,
  `plugin_group` varchar(10) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO dou_plugin VALUES('express','快递配送','a:2:{s:3:\"fee\";s:2:\"10\";s:4:\"free\";s:2:\"99\";}','shipping','速度快，价格实惠，超重不加价。');

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

INSERT INTO dou_product VALUES('1','5','1','电子胃镜GVE-2100','images/product/1_1502178782495524.jpg','<p>\r\n	内窥镜的插入管经特殊的分段硬化后，具有优异的插入性能。精湛的加工和装配工艺，使弯角手轮操作时非常的柔顺自如。可以迅速顺利地到达所需观察的部位并发现病灶。\r\n</p>\r\n<p>\r\n	44万像素sony CCD。\r\n</p>','1.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1502178782','0');
INSERT INTO dou_product VALUES('2','5','1','电子胃镜GVE-2100 X系','images/product/2_1502178820309175.png','电子胃镜GVE-2100 S系<br />','1.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','简单描述','1502178820','0');
INSERT INTO dou_product VALUES('3','6','1','电子胃镜GVE-2600','images/product/3_1502178878119993.jpg','<p>\r\n	电子胃镜GVE-2600\r\n</p>\r\n<p>\r\n	产品说明\r\n</p>','0.00','','','','','','1502178878','0');
INSERT INTO dou_product VALUES('8','23','2','Video Gastroscope GVE-2100/GVE-2100X/GVE-2100P','images/product/8_1505193468904222.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505193468','0');
INSERT INTO dou_product VALUES('5','23','2','Video Colonoscope CVE-2100TM/LM/IM','images/product/5_1505193098785512.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505117544','0');
INSERT INTO dou_product VALUES('6','24','2','Imaging Processor VEP-2100F','images/product/6_1505195122366765.png','<p>\r\n	nnnnnnnnnnnnnnnnnnnnnnnnnn\r\n</p>','0.00','ssssssssssssssssssssssssss','','','VEP-2100F','jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj','1505117795','0');
INSERT INTO dou_product VALUES('11','38','2','Video Center 2100 Series','images/product/11_1505195824162954.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505195825','0');
INSERT INTO dou_product VALUES('10','25','2','Xenon Light Source SLS-2100P','images/product/10_1505195412671693.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505195413','0');
INSERT INTO dou_product VALUES('7','25','2','Halogen Light Source HLS2100P','images/product/7_1505193743110956.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505117875','0');
INSERT INTO dou_product VALUES('12','39','2','Video Endoscopy System 2100 Series ','images/product/12_1505195906408514.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505195906','0');
INSERT INTO dou_product VALUES('15','23','2','Video Gastroscope GVE-2600/GVE2600X/GVE-2600P','images/product/15_1505196680110821.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505196680','0');
INSERT INTO dou_product VALUES('14','23','2','Video Colonoscope CVE-2600TM/LM/IM/SM','images/product/14_1505196628524221.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505196628','0');
INSERT INTO dou_product VALUES('16','23','2','Video Bronchoscope VB-2600','images/product/16_1505196804055360.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505196804','0');
INSERT INTO dou_product VALUES('17','23','2','Video Rhinolaryngoscope VN-2600','images/product/17_1505197047153526.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505197047','0');
INSERT INTO dou_product VALUES('18','24','2','Imaging Processor VEP-2800','images/product/18_1505197417947798.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505197417','0');
INSERT INTO dou_product VALUES('19','25','2','Xenon Light Source SLS-2850','images/product/19_1505197657821479.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505197657','0');
INSERT INTO dou_product VALUES('20','25','2','LED Light Source LLS-2810','','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505197783','0');
INSERT INTO dou_product VALUES('21','38','2','Video Center 2600 Series','images/product/21_1505197872474692.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505197872','0');
INSERT INTO dou_product VALUES('22','39','2','Video Endoscopy System 2600 Series ','images/product/22_1505198063368015.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505198063','0');
INSERT INTO dou_product VALUES('23','23','2','Fiber Bronchoscope FB-53A/FB60A','images/product/23_1505198750182495.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505198751','0');
INSERT INTO dou_product VALUES('24','23','2','Fiber Nasopharyngoscope FN-50A','images/product/24_1505198868833672.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505198869','0');
INSERT INTO dou_product VALUES('25','23','2','Portable Fiber Nasopharyngoscope FN-38A/FN-32A','images/product/25_1505199049124661.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505199050','0');
INSERT INTO dou_product VALUES('26','23','2','Portable Fiber Laryngoscope FL-39A','images/product/26_1505199109232807.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505199109','0');
INSERT INTO dou_product VALUES('27','30','2','Video Gastroscope  AGVE-2100B/AGVE-2100P/AGVE-2100S/AGVE-2100P','images/product/27_1505200523847955.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505200523','0');
INSERT INTO dou_product VALUES('28','30','2','Digital Bronchoscope UCB-66A/UCB-66L','images/product/28_1505200765107383.JPG','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505200765','0');
INSERT INTO dou_product VALUES('29','30','2','Digital Nasopharyngoscope UCN-66A','images/product/29_1505200893606362.jpg','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505200893','0');
INSERT INTO dou_product VALUES('30','30','2','HD Video GI Endoscope AGVE-68HQ/AGVE-68HS/AGVE-68HB','images/product/30_1505201183417687.JPG','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505201183','0');
INSERT INTO dou_product VALUES('31','31','2','Imaging Center VIS-2100S','images/product/31_1505201767529638.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505201767','0');
INSERT INTO dou_product VALUES('32','31','2','Imaging Center USB Series','images/product/32_1505202044503781.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505202044','0');
INSERT INTO dou_product VALUES('33','31','2','HD Imaging Center VIS-68','images/product/33_1505202794774057.PNG','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505202794','0');
INSERT INTO dou_product VALUES('34','23','2','Video Colonoscope CVE-2600TP/LP/IP/SP','images/product/34_1505207234272714.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505207234','0');
INSERT INTO dou_product VALUES('35','23','2','Video Colonoscope CVE-2100TP/LP/IP','images/product/35_1505207732648191.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505207656','0');
INSERT INTO dou_product VALUES('36','30','2','Video Gastroscope AGVE-2100AL','images/product/36_1505208235731911.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505208235','0');
INSERT INTO dou_product VALUES('37','31','2','Imaging Processing Software','images/product/37_1505208618716404.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505208618','0');
INSERT INTO dou_product VALUES('38','24','2','HD Imaging Processor VEP-6100H','images/product/38_1505209018087079.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505209018','0');
INSERT INTO dou_product VALUES('39','38','2','Video Center VEP-6100H Series','images/product/39_1505209101632725.png','','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','','1505209101','0');
INSERT INTO dou_product VALUES('40','39','2','HD Video Endoscopy System 6100H Series ','images/product/40_1505209652045063.PNG','<p>\r\n	<span style=\"color:#E53333;font-size:14px;\"><strong>Enhanced Visualization</strong></span> \r\n</p>\r\n<p>\r\n	By adopting the cutting-edge 1280*720p CMOS\r\nsensor, the digital high-resolution endoscopes realize enhanced and more clear\r\nobservation. With the progressive scanning method, exceptionally high\r\ndefinition still endoscopic images of clear\r\nclarity in every detail are produced. Used in combination with 26inch IPS\r\ndisplay monitor of 60FPS capacity, smooth and clear dynamic is presented as\r\nwell.\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span><br />\r\n</span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span><br />\r\n</span> \r\n</p>\r\n<span style=\"font-size:14px;color:#E53333;\"><strong>Enhanced Maneuverability</strong></span> \r\n<p class=\"MsoNormal\">\r\n	<span>The new generation endoscope control\r\nsection is of small size, lighter weight and equipped with remote control button and advanced ergonomics which\r\nallows the medical staff to conduct optimal insertion and sophisticated procedures\r\nwith ease and enables enhanced user-friendly operation experiences.</span> \r\n</p>\r\nGVE-6100HP of 8.0mm slim insertion tube<b> </b>presents\r\noptimized insertion performance, decreases physicians’ fatigue, patients’ suffering and increases their tolerances.\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;color:#E53333;\"><strong>Enhanced Reprocessing </strong></span> \r\n</p>\r\n<p>\r\n	Cleanliness and safety focused on full\r\ndefense against disinfection.\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>Easily soiled Air/Water valve, suction\r\nvalve and instrument portal valve are removeable which facilitates the cleaning and\r\ndisinfection not only of themselves but also of the inner channels. A smoother,\r\nflatter and waterproof endoscope body assures all areas receive optimal contact\r\nwith cleaning and high-performance disinfecting solutions which enhances the\r\nefficiency and effectiveness of CDS procedures.</span> \r\n</p>\r\n<br />\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>','0.00','尺寸：,电压：,频率：,功率：,大小：,重量：,模拟信号输出：,电子信号输出：,白平衡：,颜色调节：,饱和度调节：,测光测试：,血红蛋白增强：,结构增强：,边缘增强：,冻结：,回放：,电子放大：,增益：,画中画：,图像存储：,视频存储：,SD卡：,管理文件夹：,主灯：,灯泡平均寿命：,亮度调节：,备用灯：,备用灯平均寿命：,气泵压力：,压力档位：,方法：,视野角：,视向：,景深(mm)：,头端外径mm)：,头端放大图：,插入部外径(mm)：,钳道内径(mm)：,弯角：,工作长度：,总长度：','','','','Enhanced Visualization\r\nEnhanced Maneuverability\r\nEnhanced Reprocessing\r\n','1505209652','0');

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

INSERT INTO dou_product_category VALUES('1','es1','0','1','医用内窥镜','images/product_category/1_1502175094072188.jpg','成套设备','医用内窥镜说明：','','10');
INSERT INTO dou_product_category VALUES('2','es2','0','1','工业内窥镜','images/product_category/2_1502175182746534.jpg','成套设备','工业内窥镜说明。','','20');
INSERT INTO dou_product_category VALUES('3','es3','0','1','动物内窥镜','images/product_category/3_1502175205258521.jpg','成套设备','动物内窥镜说明。','','15');
INSERT INTO dou_product_category VALUES('4','es4','0','1','内窥镜配件','images/product_category/4_1502175234078799.png','成套设备','内窥镜配件说明简介。','','40');
INSERT INTO dou_product_category VALUES('5','es1-1','1','1','2100系列','','成套设备','2100系列说明:','','1');
INSERT INTO dou_product_category VALUES('6','es1-2','1','1','2600系列','','成套设备','2600系列说明','','2');
INSERT INTO dou_product_category VALUES('7','es1-3','1','1','纤维内窥镜系列','','成套设备','纤维内窥镜系列说明','','3');
INSERT INTO dou_product_category VALUES('8','es1-4','1','1','图像处理器系列','','成套设备','图像处理器系列说明','','4');
INSERT INTO dou_product_category VALUES('9','es1-5','1','1','冷光源系列','','成套设备','冷光源系列说明','','5');
INSERT INTO dou_product_category VALUES('10','es2-1','2','1','软性内窥镜系列','','成套设备','软性内窥镜系列说明','','1');
INSERT INTO dou_product_category VALUES('11','es2-2','2','1','硬管镜系列','','成套设备','硬管镜系列说明','','2');
INSERT INTO dou_product_category VALUES('12','es3-1','3','1','AGVE 系列','','成套设备','AGVE 系列说明','','1');
INSERT INTO dou_product_category VALUES('13','es3-2','3','1','DGV 系列','','成套设备','DGV 系列说明','','2');
INSERT INTO dou_product_category VALUES('14','es3-3','3','1','兽用硬管系列','','成套设备','兽用硬管系列说明','','3');
INSERT INTO dou_product_category VALUES('15','es3-4','3','1','图像处理器系列','','成套设备','图像处理器系列说明','','4');
INSERT INTO dou_product_category VALUES('16','es3-5','3','1','冷光源系列','','成套设备','冷光源系列说明','','5');
INSERT INTO dou_product_category VALUES('17','es4-1','4','1','角度钢丝','','成套设备','角度钢丝说明','','1');
INSERT INTO dou_product_category VALUES('18','es4-2','4','1','弯曲橡皮','','成套设备','弯曲橡皮说明','','2');
INSERT INTO dou_product_category VALUES('19','es-en1','0','2','Medical Endoscopy','','Complete Equipment','Dynamic: Shanghai chengyun medical equipment co., LTD. Is a sino-german technical cooperation enterpriseDynamic: Shanghai chengyun medical equipment co., LTD. Is a sino-german technical cooperation enterpriseDynamic: Shanghai chengyun medical equipment co','','10');
INSERT INTO dou_product_category VALUES('20','es-en2','0','2','Industrial Endoscopy','','','','','20');
INSERT INTO dou_product_category VALUES('21','es-en3','0','2','Veterinary Endoscopy','','','','','15');
INSERT INTO dou_product_category VALUES('22','es-en4','0','2','Endoscopic Accessories','','','','','40');
INSERT INTO dou_product_category VALUES('23','es-en1-1','19','2','Endoscope','','','','','1');
INSERT INTO dou_product_category VALUES('24','es-en1-2','19','2','Imaging Processor','','','','','2');
INSERT INTO dou_product_category VALUES('25','es-en1-3','19','2','Light Source','','','','','3');
INSERT INTO dou_product_category VALUES('28','es-en2-1','20','2','Flexible Endoscopes','','','','','1');
INSERT INTO dou_product_category VALUES('29','es-en2-2','20','2','Rigid Endosocopes','','','','','2');
INSERT INTO dou_product_category VALUES('30','es-en3-1','21','2','Endoscope','','','','','1');
INSERT INTO dou_product_category VALUES('31','es-en3-2','21','2','Imaging Center','','','','','2');
INSERT INTO dou_product_category VALUES('38','videocenter','19','2','Video Center','','','','','50');
INSERT INTO dou_product_category VALUES('39','videoendoscopysystem','19','2','Endoscopy System','','','','','50');

DROP TABLE IF EXISTS `dou_rbac_awr`;
CREATE TABLE `dou_rbac_awr` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `rid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户与角色的关系表';


DROP TABLE IF EXISTS `dou_rbac_module`;
CREATE TABLE `dou_rbac_module` (
  `mid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='模块表';

INSERT INTO dou_rbac_module VALUES('1','system','系统设置');
INSERT INTO dou_rbac_module VALUES('2','nav','导航管理');
INSERT INTO dou_rbac_module VALUES('3','show','幻灯片');
INSERT INTO dou_rbac_module VALUES('4','page','单页管理');
INSERT INTO dou_rbac_module VALUES('5','product','产品管理');
INSERT INTO dou_rbac_module VALUES('6','article','文章管理');
INSERT INTO dou_rbac_module VALUES('7','job','招聘管理');
INSERT INTO dou_rbac_module VALUES('8','apply','应用管理');
INSERT INTO dou_rbac_module VALUES('9','research','研发管理');
INSERT INTO dou_rbac_module VALUES('10','guestbook','留言反馈');
INSERT INTO dou_rbac_module VALUES('11','cart','购物车');
INSERT INTO dou_rbac_module VALUES('12','user','会员管理');
INSERT INTO dou_rbac_module VALUES('13','backup','数据备份');
INSERT INTO dou_rbac_module VALUES('14','manager','管理员管理');
INSERT INTO dou_rbac_module VALUES('15','rbac','权限管理');
INSERT INTO dou_rbac_module VALUES('16','mobile','手机端');
INSERT INTO dou_rbac_module VALUES('17','district','国家管理');
INSERT INTO dou_rbac_module VALUES('18','manager_log','操作日志');

DROP TABLE IF EXISTS `dou_rbac_role`;
CREATE TABLE `dou_rbac_role` (
  `rid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色表';

INSERT INTO dou_rbac_role VALUES('1','ALL','超管');
INSERT INTO dou_rbac_role VALUES('2','ADMIN','管理员');
INSERT INTO dou_rbac_role VALUES('3','LHJ','编辑');

DROP TABLE IF EXISTS `dou_rbac_rwm`;
CREATE TABLE `dou_rbac_rwm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
  `mid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '模块id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色与模块的关系表';


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

INSERT INTO dou_research VALUES('1','1','1','100系列电子内窥镜','','<a>100系列电子内窥镜被上海医疗器械行业协会评为上海医疗器械名优产品</a>','','','','','','1502267027','0','0');
INSERT INTO dou_research VALUES('2','1','1','上海成运医疗器械股份有限公司','','<span style=\"color:#222222;font-family:Consolas, &quot;font-size:12px;font-style:normal;font-weight:normal;background-color:#FFFFFF;\">成果：上海成运医疗器械股份有限公司是一家中德技术合作企业</span>','','','','','','1502267080','0','0');
INSERT INTO dou_research VALUES('3','1','1','新型环保材料问世','','新型环保材料问世：黑科技产品','','','','','','1502267190','0','0');
INSERT INTO dou_research VALUES('4','1','1','奈米材料合计划','','高聚合材料研发而成<br />','','','','','','1502267297','0','0');
INSERT INTO dou_research VALUES('5','2','1','吴京','','','','','研发领队','','','1502267729','0','0');
INSERT INTO dou_research VALUES('6','2','1','张某某','','','','','研发人员','','','1502267865','0','0');
INSERT INTO dou_research VALUES('7','2','1','吴刚','','','','','研发队员','','','1502267915','0','0');
INSERT INTO dou_research VALUES('8','2','1','卢靖姗','','','','','研发队员','','','1502268004','0','0');
INSERT INTO dou_research VALUES('9','2','1','余男','','','','','研发队员','','','1502268025','0','0');
INSERT INTO dou_research VALUES('10','2','1','张翰','','','','','研发新手','','','1502268149','0','0');
INSERT INTO dou_research VALUES('11','3','2','Disposable Flexible Endoscopes','','<span style=\"color:#2E3033;font-family:Arial, \'Microsoft YaHei\', 微软雅黑, 宋体, \'Malgun Gothic\', sans-serif;font-size:12px;font-style:normal;font-weight:normal;line-height:20px;background-color:#EEF0F2;\">The 100 series electronic endoscope is awarded by Shanghai medical device industry association as the Shanghai medical device</span>','','','','','','1503295976','0','0');
INSERT INTO dou_research VALUES('12','3','2','AI Images Reader','','Achievements: Shanghai chengyun medical equipment co., LTD. Is a sino-german technical cooperation enterprise','','','','','','1503296024','0','0');
INSERT INTO dou_research VALUES('13','3','2','720P HD System Upgrade','','<span style=\"color:#2E3033;font-family:Arial, \'Microsoft YaHei\', 微软雅黑, 宋体, \'Malgun Gothic\', sans-serif;font-size:12px;font-style:normal;font-weight:normal;line-height:20px;background-color:#EEF0F2;\">New environmental materials: black technology products</span>','','','','','','1503296092','0','0');
INSERT INTO dou_research VALUES('14','3','2','1080P Full HD Endoscopy System','','High polymer material developed and developed','','','','','','1503296127','0','0');
INSERT INTO dou_research VALUES('15','4','2','Chenfeng Wang','','','','','R&D Leader','','','1503296203','0','0');
INSERT INTO dou_research VALUES('16','4','2','Evan Meng','','','','','R&D team','','','1503296278','0','0');

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

INSERT INTO dou_research_category VALUES('1','research','0','1','研发项目','','','10');
INSERT INTO dou_research_category VALUES('2','team','0','1','研发团队','','','20');
INSERT INTO dou_research_category VALUES('3','research-en','0','2','Research project','','','10');
INSERT INTO dou_research_category VALUES('4','research-team-en','0','2','R&D team','','','20');

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

INSERT INTO dou_show VALUES('1','这个时代 你所追求的是什么？','http://www.wincomtech.cn','data/slide/20130514acunau.jpg','center','1');
INSERT INTO dou_show VALUES('2','我们所追求的不是拥有一切，而是拥有值得的一切','','data/slide/20170807wpnxvv.jpg','center','20');
INSERT INTO dou_show VALUES('3','一段旅程，两个城市，潮流正在被重塑','','data/slide/20170807imamxg.jpg','center','30');
INSERT INTO dou_show VALUES('4','在这里，抛开重重限制，释放真实自我','','data/slide/20170807vwomhx.jpg','center','40');
INSERT INTO dou_show VALUES('5','banner1','','data/slide/20170807fvqqxf.jpg','pc','10');

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

INSERT INTO dou_user VALUES('1','','e10adc3949ba59abbe56e057f20f883e','keven518@163.com','15555423186','','','1','','李小宇','adhflksfksdfsdf','1','','230601','','','','','','1478745265','1','1478745265','127.0.0.1');
INSERT INTO dou_user VALUES('2','瓦大大','96e79218965eb72c92a549dd5a330112','915273691@qq.com','18715511536','4324423','','1','黄生','收货人','收货地址自定义','1','1','','','1','为单位范围','1','4','1502344574','34','1503648059,1504236267','180.175.92.37,36.57.151.111');
INSERT INTO dou_user VALUES('3','冷锋','96e79218965eb72c92a549dd5a330112','wangyun@sina.com','18788841247','','','0','汪云','他爸爸','黄埔','1','','','','','旗舰','1','5','1502690299','3','1502690431,1502692807','127.0.0.1,127.0.0.1');
INSERT INTO dou_user VALUES('4','','902c8fc62c86cae67fb43abcb1362e72','ida.hu@huger.cn','15902197941','','','0','HuIda','','','1','','','','','HUGER MEDICAL','1','4','1505263631','4','1505264012,1505264796','180.175.92.37,180.175.92.37');
INSERT INTO dou_user VALUES('5','','c5fde9de2d29789a81d1bc0f16292048','zhengwei9109@126.com','18823280930','','','0','ZhengWei','','','1','','','','','Huger','1','1','1505267459','1','1505267459','180.175.92.37');

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


