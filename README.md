# cy
������Ӣ��


���ݿ�
data/backup/***.sql

׼��������������
������cy.ext1.cn
�������cypro.ext1.cn


���ݿ���¼�¼��
INSERT INTO `dou_config` VALUES ('copyright', '��Ȩ','copyright', 'text', '', 'main', '8', '1');

INSERT INTO `cy`.`dou_config` (`name`, `value`, `value2`, `type`, `box`, `tab`, `sort`, `display`) VALUES ('domain', 'http://cy.ext1.cn', 'http://cy.ext1.cn', 'text', '', 'main', '5', '1');
INSERT INTO `cy`.`dou_config` (`name`, `value`, `value2`, `type`, `box`, `tab`, `sort`, `display`) VALUES ('domain_pro', 'http://cypro.ext1.cn/product_category.php', 'http://cypro.ext1.cn/product_category.php', 'text', '', 'main', '5', '1');
ALTER TABLE dou_product_category add `fields` text not null COMMENT 'ѡ���ֶ�';
UPDATE dou_product set defined='';
ALTER TABLE dou_product add `daos` text NOT NULL COMMENT 'ѡ���ֶε� serialize ��ֵ' after `defined`;

delete from dou_config where `name`='language';

<!-- INSERT INTO `dou_config` VALUES ('defined', 'a:2:{s:7:\"article\";s:0:\"\";s:7:\"product\";s:500:\"�ߴ�,��ѹ,Ƶ��,����,��С,����,ģ���ź����,�����ź����,��ƽ��,��ɫ����,���Ͷȵ���,������,Ѫ�쵰����ǿ,�ṹ��ǿ,��Ե��ǿ,����,�ط�,���ӷŴ�,����,���л�,ͼ��洢,��Ƶ�洢,SD��,�����ļ���,����,����ƽ������,���ȵ���,���õ�,���õ�ƽ������,����ѹ��,ѹ����λ,����,��Ұ��,����,����(mm),ͷ���⾶(mm),ͷ�˷Ŵ�ͼ,���벿�⾶(mm),ǯ���ھ�(mm),���,��������,�ܳ���\";}', 'a:2:{s:7:\"article\";s:0:\"\";s:7:\"product\";s:547:\"measure,voltage,frequency,power,size,weight,AO,ElectronicSignalOutput,white balance,Rgb,SATURATION,Photometric test,Hemoglobin enhancement,structure enhance,edge enhancement,freeze,playback,Digital zoom,gain,PIP,image storage,video storage,SD Card,Manage Folders,king light,Bulb life,brilliance control,standby lamp,Spare lamp average life,Pump pressure,Pressure gear,Method,field angle,view direction,depth of field(mm),Head end diameter(mm),Head enlargement,Insert external diameter(mm),Pliers way inside(mm),Corner,working length,Overall length\";}', 'array', '', 'defined', '1', '1'); -->