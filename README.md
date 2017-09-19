# cy
成运中英文


数据库
data/backup/***.sql

准备两个域名测试
官网：cy.ext1.cn
配件网：cypro.ext1.cn


数据库更新记录：
INSERT INTO `dou_config` VALUES ('copyright', '版权','copyright', 'text', '', 'main', '8', '1');
INSERT INTO `cy`.`dou_config` (`name`, `value`, `value2`, `type`, `box`, `tab`, `sort`, `display`) VALUES ('domain', 'http://cy.ext1.cn', 'http://cy.ext1.cn', 'text', '', 'main', '5', '1');
INSERT INTO `cy`.`dou_config` (`name`, `value`, `value2`, `type`, `box`, `tab`, `sort`, `display`) VALUES ('domain_pro', 'http://cypro.ext1.cn/product_category.php', 'http://cypro.ext1.cn/product_category.php', 'text', '', 'main', '5', '1');

ALTER TABLE dou_product_category add fields text(0) DEFAULT '' COMMENT '选定字段';
UPDATE dou_product set defined='';

<!-- INSERT INTO `dou_config` VALUES ('defined', 'a:2:{s:7:\"article\";s:0:\"\";s:7:\"product\";s:500:\"尺寸,电压,频率,功率,大小,重量,模拟信号输出,电子信号输出,白平衡,颜色调节,饱和度调节,测光测试,血红蛋白增强,结构增强,边缘增强,冻结,回放,电子放大,增益,画中画,图像存储,视频存储,SD卡,管理文件夹,主灯,灯泡平均寿命,亮度调节,备用灯,备用灯平均寿命,气泵压力,压力档位,方法,视野角,视向,景深(mm),头端外径(mm),头端放大图,插入部外径(mm),钳道内径(mm),弯角,工作长度,总长度\";}', 'a:2:{s:7:\"article\";s:0:\"\";s:7:\"product\";s:547:\"measure,voltage,frequency,power,size,weight,AO,ElectronicSignalOutput,white balance,Rgb,SATURATION,Photometric test,Hemoglobin enhancement,structure enhance,edge enhancement,freeze,playback,Digital zoom,gain,PIP,image storage,video storage,SD Card,Manage Folders,king light,Bulb life,brilliance control,standby lamp,Spare lamp average life,Pump pressure,Pressure gear,Method,field angle,view direction,depth of field(mm),Head end diameter(mm),Head enlargement,Insert external diameter(mm),Pliers way inside(mm),Corner,working length,Overall length\";}', 'array', '', 'defined', '1', '1'); -->