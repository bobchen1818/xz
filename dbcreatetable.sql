#设置客户端连接服务器端编码
SET NAMES UTF8;
#丢弃数据库，如果存在
DROP DATABASE IF EXISTS jy;
#创建数据库，设置编码
CREATE DATABASE jy CHARSET=UTF8;
#进入数据库
USE jy;
#注意建立外键的表，主表必须放在前面
-- DROP TABLE IF EXISTS `accident`
CREATE  TABLE `accident`(
  `id` int  NOT NULL AUTO_INCREMENT,
  `theatre` char(8) NOT NULL DEFAULT '' COMMENT '手术室',
  `table_number` date  COMMENT '台次',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '姓名',
  `case_number` varchar(8) NOT NULL DEFAULT '' COMMENT '病例号',
  `bed_number` varchar(8) NOT NULL DEFAULT '' COMMENT '床位号',
  `doctor` varchar(16) NOT NULL DEFAULT '' COMMENT '主刀医生',
  `depart_name` varchar(16) NOT NULL DEFAULT '' COMMENT '科室',
  `status` varchar(16) NOT NULL DEFAULT '' COMMENT '状态',
  `operation` varchar(64) NOT NULL DEFAULT '' COMMENT '手术名称',
  `plan` varchar(16) NOT NULL DEFAULT '' COMMENT '投保方案',
  `plan_code` varchar(32) NOT NULL DEFAULT '' COMMENT '投保方案代码',
  `grade` char(8) NOT NULL DEFAULT '' COMMENT '手术等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='手术';
-- DROP TABLE IF EXISTS `hospital`
CREATE TABLE `hospital`(
  `id` int  NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '名称',
  `address` varchar(64) NOT NULL DEFAULT '' COMMENT '地址',
  `organId` varchar(32) NOT NULL DEFAULT '' COMMENT '机构id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=942 DEFAULT CHARSET=utf8 COMMENT='医院';
CREATE TABLE department(
      did INT  PRIMARY KEY,
      depart varchar(8) NOT NULL DEFAULT '' COMMENT '科室名'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='科室';
-- DROP TABLE IF EXISTS doctor
CREATE TABLE `doctor` (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    doctor_name varchar(16) NOT NULL DEFAULT '' COMMENT '姓名',
    job_num varchar(16) NOT NULL DEFAULT '' COMMENT '医生工号',
    doctor_id int                           COMMENT '医生id',
    team_id varchar(8) NOT NULL DEFAULT '' COMMENT '团队id',
    depart_id int,
    foreign key (depart_id) references department(did)
) ENGINE=InnoDB  AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='医生';
CREATE TABLE `order_applicant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `insure_date` date  COMMENT '投保日期',
  `operation_date` date  COMMENT '手术日期',
  `insure_person` varchar(16)  NULL DEFAULT '' COMMENT '投保人',
  `insured_person` varchar(16)  NULL DEFAULT '' COMMENT '被保险人',
  `relation` varchar(6) NOT NULL DEFAULT '' COMMENT '与投保人关系(被保人/受益人)',
  `card_number` char(18) NOT NULL DEFAULT '' COMMENT '证件号码',
  `depart_name` varchar(16) NOT NULL DEFAULT '' COMMENT '科室',
  `plan` varchar(16) NOT NULL DEFAULT '' COMMENT '投保方案',
  `grade` char(8) NOT NULL DEFAULT '' COMMENT '手术等级',
  `fee`   SMALLINT NOT NULL DEFAULT '0' COMMENT '保费',
  `phone` varchar(12) NOT NULL DEFAULT '' COMMENT '手机号',
  `case_number` varchar(8) NOT NULL DEFAULT '' COMMENT '病例号',
  `bed_number` varchar(8) NOT NULL DEFAULT '' COMMENT '床位号',
  `doctor` varchar(16) NOT NULL DEFAULT '' COMMENT '主刀医生',
  `operation` varchar(128) NOT NULL DEFAULT '' COMMENT '手术名称',
  `policy_number` varchar(32) NOT NULL DEFAULT '' COMMENT '保单号',
  `remark` varchar(32) NOT NULL DEFAULT '' COMMENT '退保备注',
    `birthday` date  COMMENT '出生年月日',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8 COMMENT='保单人员信息';