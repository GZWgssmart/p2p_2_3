/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : boot_ptp

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2018-01-23 16:45:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bankcard
-- ----------------------------
DROP TABLE IF EXISTS `bankcard`;
CREATE TABLE `bankcard` (
  `bcid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `cardno` varchar(20) NOT NULL COMMENT '卡号',
  `rname` varchar(50) NOT NULL,
  `idno` varchar(18) NOT NULL,
  `type` varchar(50) NOT NULL COMMENT '所属银行',
  `status` int(11) DEFAULT '0',
  `bktime` datetime DEFAULT NULL COMMENT '绑卡时间',
  PRIMARY KEY (`bcid`),
  UNIQUE KEY `uk_bankcard` (`cardno`),
  UNIQUE KEY `uk_idno` (`idno`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bankcard
-- ----------------------------
INSERT INTO `bankcard` VALUES ('8', '17', '6212842126680063632', '刘金泳', '360781199902212950', '中国农业银行', '0', '2018-01-23 10:48:32');
INSERT INTO `bankcard` VALUES ('10', '22', '6212842126680063634', '叶小鹏', '36072610070101', '中国银行', '0', '2018-01-23 10:49:51');

-- ----------------------------
-- Table structure for borrowapply
-- ----------------------------
DROP TABLE IF EXISTS `borrowapply`;
CREATE TABLE `borrowapply` (
  `baid` int(11) NOT NULL AUTO_INCREMENT,
  `rname` varchar(50) NOT NULL COMMENT '真实姓名',
  `money` decimal(15,2) NOT NULL COMMENT '申请金额',
  `uid` int(11) NOT NULL COMMENT '借款人id',
  `bzid` int(11) NOT NULL COMMENT '标种id',
  `cktime` datetime DEFAULT NULL COMMENT '审核时间',
  `ckstatus` int(11) DEFAULT '0' COMMENT '审核状态',
  `type` int(11) NOT NULL COMMENT '借款类型',
  `term` int(11) NOT NULL COMMENT '借款期限',
  `deadline` datetime DEFAULT NULL COMMENT '截止时间',
  `resint1` int(11) DEFAULT NULL,
  `resint2` int(11) DEFAULT NULL,
  `resstr1` varchar(50) DEFAULT NULL,
  `resstr2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`baid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borrowapply
-- ----------------------------
INSERT INTO `borrowapply` VALUES ('1', '刘振南', '90000.00', '18', '3', '2018-01-20 08:37:22', '4', '1', '9', '2018-09-23 00:00:00', null, null, null, null);
INSERT INTO `borrowapply` VALUES ('2', '刘金泳', '500000.00', '18', '1', '2018-01-20 11:02:28', '2', '0', '6', '2018-09-12 00:00:00', null, null, null, null);
INSERT INTO `borrowapply` VALUES ('3', '刘金泳', '100000.00', '18', '1', '2018-01-20 11:02:30', '2', '1', '6', '2018-06-24 00:00:00', null, null, null, null);
INSERT INTO `borrowapply` VALUES ('4', '刘金泳', '100000.00', '18', '1', '2018-01-20 11:02:32', '2', '1', '6', '2018-06-24 00:00:00', null, null, null, null);
INSERT INTO `borrowapply` VALUES ('5', '刘金泳', '100000.00', '18', '2', '2018-01-20 11:02:34', '2', '1', '6', '2018-05-31 00:00:00', null, null, null, null);
INSERT INTO `borrowapply` VALUES ('6', '刘金泳', '100000.00', '18', '2', '2018-01-20 11:02:37', '2', '1', '6', '2018-06-29 00:00:00', null, null, null, null);
INSERT INTO `borrowapply` VALUES ('7', '刘金泳', '100000.00', '18', '2', '2018-01-20 11:02:39', '2', '1', '6', '2018-07-27 00:00:00', null, null, null, null);
INSERT INTO `borrowapply` VALUES ('8', '刘金泳', '100000.00', '18', '4', '2018-01-20 11:02:40', '2', '1', '6', '2018-08-31 00:00:00', null, null, null, null);
INSERT INTO `borrowapply` VALUES ('9', '刘金泳', '100000.00', '18', '4', '2018-01-20 11:02:44', '2', '1', '6', '2018-06-27 00:00:00', null, null, null, null);
INSERT INTO `borrowapply` VALUES ('10', '刘金泳', '100000.00', '18', '4', '2018-01-20 11:02:47', '2', '1', '6', '2018-11-30 00:00:00', null, null, null, null);
INSERT INTO `borrowapply` VALUES ('14', '叶小鹏', '90000.00', '17', '1', null, '0', '0', '3', '2018-02-01 00:00:00', null, null, null, null);

-- ----------------------------
-- Table structure for borrowdetail
-- ----------------------------
DROP TABLE IF EXISTS `borrowdetail`;
CREATE TABLE `borrowdetail` (
  `bdid` int(11) NOT NULL AUTO_INCREMENT,
  `fpic` varchar(500) NOT NULL COMMENT '法人身份证',
  `ypic` varchar(500) DEFAULT NULL COMMENT '营业执照副本',
  `qpic` varchar(500) DEFAULT NULL COMMENT '企业银行账号',
  `tpic` varchar(500) DEFAULT NULL COMMENT '其他资料',
  `mpurpose` varchar(300) NOT NULL COMMENT '资金用途',
  `hksource` varchar(150) NOT NULL COMMENT '还款来源',
  `suggest` varchar(500) DEFAULT NULL COMMENT '借款人介绍',
  `xmdes` varchar(300) DEFAULT NULL COMMENT '项目描述',
  `guarantee` varchar(200) DEFAULT NULL COMMENT '保障措施',
  `money` decimal(7,2) NOT NULL COMMENT '金额',
  `nprofit` float(4,2) NOT NULL COMMENT '年化收益',
  `way` varchar(20) NOT NULL COMMENT '收益方式',
  `cpname` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `baid` int(11) NOT NULL COMMENT '借款id',
  `resint1` int(11) DEFAULT NULL,
  `resint2` int(11) DEFAULT NULL,
  `resstr1` varchar(50) DEFAULT NULL,
  `resstr2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`bdid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borrowdetail
-- ----------------------------
INSERT INTO `borrowdetail` VALUES ('1', '/static/uploads/borrowdetail/5fbbec23a39acf0d93b6f35768182328.jpeg', '/static/uploads/borrowdetail/44a3f00ee88952adfa7c008afce864a8.jpeg', '/static/uploads/borrowdetail/23e138dcdfbffb29df1a83fac10d82a1.jpeg', '/static/uploads/borrowdetail/8e5bcb9f4cb3e425a10fd036fe28e40a.jpg', '资金周转', '电子商业承兑汇票到期资金', '原债权方赣州某广告传媒有限公司，主要从事地产营销、演艺策划、明星经纪、媒体传播、国内外时尚品牌发布会、会展及论坛举办、高级婚宴、高端私人酒会、公益慈善等，公司注册资本300万元。承接恒创有限公司全资子公司赣州恒创置业有限公司项目广告设计、制作安装、媒体传播等。原债权方将恒创置业所开具商业承兑汇票转让给某保理公司，恒创置业集团信用状况良好，资产实力充裕。本项目本次融资金额为132254元，融资期6个月。', '本期投资标的为某保理公司转让出的编号为YC2017TD00012的保理服务合同对应的商业承兑汇票债权，原债权借款人为赣州某广告传媒有限公司。承兑机构为赣州恒创置业有限公司。', '1、项目到期由某保理公司回购 2、恒创置业有限公司无限连带责任保证 3、赣州某广告传媒有限公司承担回购及连带担保责任', '90000.00', '15.00', '1', 'PJ2018BZ0001', '1', null, null, null, null);
INSERT INTO `borrowdetail` VALUES ('2', '/static/uploads/borrowdetail/20170929152916160.jpg', '/static/uploads/borrowdetail/20170929152926337.jpg', '/static/uploads/borrowdetail/20170929152937548.jpg', '/static/uploads/borrowdetail/20170929152951650.jpg', '资金周转', '经营性收入', '赣州市**车业有限公司成立于2014年3月，注册资本200万元，股东为陈**占比70%，罗**占比30%，陈**为法定代表人，经营范围：电瓶车、摩托车、国产电动客车、家用电器及其配件、汽车配件销售。（依法须经批准的项目，经相关部门批准后方可开展经营活动） 赣州市**车业有限公司是目前赣州地区**电动车的经销商。公司前身为赣州市**贸易有限公司，成立于2009年，主营品牌为豪进摩托、大阳摩托、长铃摩托等。由于摩托车行业变化和公司逐渐发展，在2013年与浙江**电动车有限公司签订经销合作协议。公司目前经营面积800多平米，仓库面积1500平米，在赣南摩托车大市场、环城路、东阳山均设有门店，**电动车，年销量10000台以上。 至2017年8月份，公司主营业务收入合计1673.14万元，实现主营业务利润105.83万元。', '本次借款主要用于订购**电动车，该企业借款金额为100万元，第二期50万元，借款期限3个月，本平台为此借款提供服务。', '1、 公司股东陈*、肖*夫妇；罗*、钟*夫妇提供无限连带责任担保 2、 赣州市**门诊部提供无限连带责任担保', '0.00', '12.00', '1', 'PJ2018BZ0002', '2', null, null, null, null);
INSERT INTO `borrowdetail` VALUES ('3', '/static/uploads/borrowdetail/20170929152916160.jpg', '/static/uploads/borrowdetail/20170929152926337.jpg', '/static/uploads/borrowdetail/20170929152937548.jpg', '/static/uploads/borrowdetail/20170929152951650.jpg', '资金周转', '经营性收入', '赣州市**车业有限公司成立于2014年3月，注册资本200万元，股东为陈**占比70%，罗**占比30%，陈**为法定代表人，经营范围：电瓶车、摩托车、国产电动客车、家用电器及其配件、汽车配件销售。（依法须经批准的项目，经相关部门批准后方可开展经营活动） 赣州市**车业有限公司是目前赣州地区**电动车的经销商。公司前身为赣州市**贸易有限公司，成立于2009年，主营品牌为豪进摩托、大阳摩托、长铃摩托等。由于摩托车行业变化和公司逐渐发展，在2013年与浙江**电动车有限公司签订经销合作协议。公司目前经营面积800多平米，仓库面积1500平米，在赣南摩托车大市场、环城路、东阳山均设有门店，**电动车，年销量10000台以上。 至2017年8月份，公司主营业务收入合计1673.14万元，实现主营业务利润105.83万元。', '本次借款主要用于订购**电动车，该企业借款金额为100万元，第二期50万元，借款期限3个月，本平台为此借款提供服务。', '1、 公司股东陈*、肖*夫妇；罗*、钟*夫妇提供无限连带责任担保 2、 赣州市**门诊部提供无限连带责任担保', '99900.00', '12.00', '1', 'PJ2018BZ0003', '3', null, null, null, null);
INSERT INTO `borrowdetail` VALUES ('4', '/static/uploads/borrowdetail/20170929152916160.jpg', '/static/uploads/borrowdetail/20170929152926337.jpg', '/static/uploads/borrowdetail/20170929152937548.jpg', '/static/uploads/borrowdetail/20170929152951650.jpg', '资金周转', '经营性收入', '赣州市**车业有限公司成立于2014年3月，注册资本200万元，股东为陈**占比70%，罗**占比30%，陈**为法定代表人，经营范围：电瓶车、摩托车、国产电动客车、家用电器及其配件、汽车配件销售。（依法须经批准的项目，经相关部门批准后方可开展经营活动） 赣州市**车业有限公司是目前赣州地区**电动车的经销商。公司前身为赣州市**贸易有限公司，成立于2009年，主营品牌为豪进摩托、大阳摩托、长铃摩托等。由于摩托车行业变化和公司逐渐发展，在2013年与浙江**电动车有限公司签订经销合作协议。公司目前经营面积800多平米，仓库面积1500平米，在赣南摩托车大市场、环城路、东阳山均设有门店，**电动车，年销量10000台以上。 至2017年8月份，公司主营业务收入合计1673.14万元，实现主营业务利润105.83万元。', '本次借款主要用于订购**电动车，该企业借款金额为100万元，第二期50万元，借款期限3个月，本平台为此借款提供服务。', '1、 公司股东陈*、肖*夫妇；罗*、钟*夫妇提供无限连带责任担保 2、 赣州市**门诊部提供无限连带责任担保', '0.00', '12.00', '1', 'PJ2018BZ0004', '4', null, null, null, null);
INSERT INTO `borrowdetail` VALUES ('5', '/static/uploads/borrowdetail/20170929152916160.jpg', '/static/uploads/borrowdetail/20170929152926337.jpg', '/static/uploads/borrowdetail/20170929152937548.jpg', '/static/uploads/borrowdetail/20170929152951650.jpg', '资金周转', '经营性收入', '赣州市**车业有限公司成立于2014年3月，注册资本200万元，股东为陈**占比70%，罗**占比30%，陈**为法定代表人，经营范围：电瓶车、摩托车、国产电动客车、家用电器及其配件、汽车配件销售。（依法须经批准的项目，经相关部门批准后方可开展经营活动） 赣州市**车业有限公司是目前赣州地区**电动车的经销商。公司前身为赣州市**贸易有限公司，成立于2009年，主营品牌为豪进摩托、大阳摩托、长铃摩托等。由于摩托车行业变化和公司逐渐发展，在2013年与浙江**电动车有限公司签订经销合作协议。公司目前经营面积800多平米，仓库面积1500平米，在赣南摩托车大市场、环城路、东阳山均设有门店，**电动车，年销量10000台以上。 至2017年8月份，公司主营业务收入合计1673.14万元，实现主营业务利润105.83万元。', '本次借款主要用于订购**电动车，该企业借款金额为100万元，第二期50万元，借款期限3个月，本平台为此借款提供服务。', '1、 公司股东陈*、肖*夫妇；罗*、钟*夫妇提供无限连带责任担保 2、 赣州市**门诊部提供无限连带责任担保', '99868.00', '12.00', '1', 'PJ2018BZ0005', '5', null, null, null, null);
INSERT INTO `borrowdetail` VALUES ('6', '/static/uploads/borrowdetail/20170929152916160.jpg', '/static/uploads/borrowdetail/20170929152926337.jpg', '/static/uploads/borrowdetail/20170929152937548.jpg', '/static/uploads/borrowdetail/20170929152951650.jpg', '资金周转', '经营性收入', '赣州市**车业有限公司成立于2014年3月，注册资本200万元，股东为陈**占比70%，罗**占比30%，陈**为法定代表人，经营范围：电瓶车、摩托车、国产电动客车、家用电器及其配件、汽车配件销售。（依法须经批准的项目，经相关部门批准后方可开展经营活动） 赣州市**车业有限公司是目前赣州地区**电动车的经销商。公司前身为赣州市**贸易有限公司，成立于2009年，主营品牌为豪进摩托、大阳摩托、长铃摩托等。由于摩托车行业变化和公司逐渐发展，在2013年与浙江**电动车有限公司签订经销合作协议。公司目前经营面积800多平米，仓库面积1500平米，在赣南摩托车大市场、环城路、东阳山均设有门店，**电动车，年销量10000台以上。 至2017年8月份，公司主营业务收入合计1673.14万元，实现主营业务利润105.83万元。', '本次借款主要用于订购**电动车，该企业借款金额为100万元，第二期50万元，借款期限3个月，本平台为此借款提供服务。', '1、 公司股东陈*、肖*夫妇；罗*、钟*夫妇提供无限连带责任担保 2、 赣州市**门诊部提供无限连带责任担保', '0.00', '12.00', '1', 'PJ2018BZ0006', '6', null, null, null, null);
INSERT INTO `borrowdetail` VALUES ('7', '/static/uploads/borrowdetail/20170929152916160.jpg', '/static/uploads/borrowdetail/20170929152926337.jpg', '/static/uploads/borrowdetail/20170929152937548.jpg', '/static/uploads/borrowdetail/20170929152951650.jpg', '资金周转', '经营性收入', '赣州市**车业有限公司成立于2014年3月，注册资本200万元，股东为陈**占比70%，罗**占比30%，陈**为法定代表人，经营范围：电瓶车、摩托车、国产电动客车、家用电器及其配件、汽车配件销售。（依法须经批准的项目，经相关部门批准后方可开展经营活动） 赣州市**车业有限公司是目前赣州地区**电动车的经销商。公司前身为赣州市**贸易有限公司，成立于2009年，主营品牌为豪进摩托、大阳摩托、长铃摩托等。由于摩托车行业变化和公司逐渐发展，在2013年与浙江**电动车有限公司签订经销合作协议。公司目前经营面积800多平米，仓库面积1500平米，在赣南摩托车大市场、环城路、东阳山均设有门店，**电动车，年销量10000台以上。 至2017年8月份，公司主营业务收入合计1673.14万元，实现主营业务利润105.83万元。', '本次借款主要用于订购**电动车，该企业借款金额为100万元，第二期50万元，借款期限3个月，本平台为此借款提供服务。', '1、 公司股东陈*、肖*夫妇；罗*、钟*夫妇提供无限连带责任担保 2、 赣州市**门诊部提供无限连带责任担保', '0.00', '12.00', '1', 'PJ2018BZ0007', '7', null, null, null, null);
INSERT INTO `borrowdetail` VALUES ('8', '/static/uploads/borrowdetail/20170929152916160.jpg', '/static/uploads/borrowdetail/20170929152926337.jpg', '/static/uploads/borrowdetail/20170929152937548.jpg', '/static/uploads/borrowdetail/20170929152951650.jpg', '资金周转', '经营性收入', '赣州市**车业有限公司成立于2014年3月，注册资本200万元，股东为陈**占比70%，罗**占比30%，陈**为法定代表人，经营范围：电瓶车、摩托车、国产电动客车、家用电器及其配件、汽车配件销售。（依法须经批准的项目，经相关部门批准后方可开展经营活动） 赣州市**车业有限公司是目前赣州地区**电动车的经销商。公司前身为赣州市**贸易有限公司，成立于2009年，主营品牌为豪进摩托、大阳摩托、长铃摩托等。由于摩托车行业变化和公司逐渐发展，在2013年与浙江**电动车有限公司签订经销合作协议。公司目前经营面积800多平米，仓库面积1500平米，在赣南摩托车大市场、环城路、东阳山均设有门店，**电动车，年销量10000台以上。 至2017年8月份，公司主营业务收入合计1673.14万元，实现主营业务利润105.83万元。', '本次借款主要用于订购**电动车，该企业借款金额为100万元，第二期50万元，借款期限3个月，本平台为此借款提供服务。', '1、 公司股东陈*、肖*夫妇；罗*、钟*夫妇提供无限连带责任担保 2、 赣州市**门诊部提供无限连带责任担保', '0.00', '12.00', '1', 'PJ2018BZ0008', '8', null, null, null, null);
INSERT INTO `borrowdetail` VALUES ('9', '/static/uploads/borrowdetail/20170929152916160.jpg', '/static/uploads/borrowdetail/20170929152926337.jpg', '/static/uploads/borrowdetail/20170929152937548.jpg', '/static/uploads/borrowdetail/20170929152951650.jpg', '资金周转', '经营性收入', '赣州市**车业有限公司成立于2014年3月，注册资本200万元，股东为陈**占比70%，罗**占比30%，陈**为法定代表人，经营范围：电瓶车、摩托车、国产电动客车、家用电器及其配件、汽车配件销售。（依法须经批准的项目，经相关部门批准后方可开展经营活动） 赣州市**车业有限公司是目前赣州地区**电动车的经销商。公司前身为赣州市**贸易有限公司，成立于2009年，主营品牌为豪进摩托、大阳摩托、长铃摩托等。由于摩托车行业变化和公司逐渐发展，在2013年与浙江**电动车有限公司签订经销合作协议。公司目前经营面积800多平米，仓库面积1500平米，在赣南摩托车大市场、环城路、东阳山均设有门店，**电动车，年销量10000台以上。 至2017年8月份，公司主营业务收入合计1673.14万元，实现主营业务利润105.83万元。', '本次借款主要用于订购**电动车，该企业借款金额为100万元，第二期50万元，借款期限3个月，本平台为此借款提供服务。', '1、 公司股东陈*、肖*夫妇；罗*、钟*夫妇提供无限连带责任担保 2、 赣州市**门诊部提供无限连带责任担保', '0.00', '12.00', '1', 'PJ2018BZ0009', '9', null, null, null, null);
INSERT INTO `borrowdetail` VALUES ('10', '/static/uploads/borrowdetail/20170929152916160.jpg', '/static/uploads/borrowdetail/20170929152926337.jpg', '/static/uploads/borrowdetail/20170929152937548.jpg', '/static/uploads/borrowdetail/20170929152951650.jpg', '资金周转', '经营性收入', '赣州市**车业有限公司成立于2014年3月，注册资本200万元，股东为陈**占比70%，罗**占比30%，陈**为法定代表人，经营范围：电瓶车、摩托车、国产电动客车、家用电器及其配件、汽车配件销售。（依法须经批准的项目，经相关部门批准后方可开展经营活动） 赣州市**车业有限公司是目前赣州地区**电动车的经销商。公司前身为赣州市**贸易有限公司，成立于2009年，主营品牌为豪进摩托、大阳摩托、长铃摩托等。由于摩托车行业变化和公司逐渐发展，在2013年与浙江**电动车有限公司签订经销合作协议。公司目前经营面积800多平米，仓库面积1500平米，在赣南摩托车大市场、环城路、东阳山均设有门店，**电动车，年销量10000台以上。 至2017年8月份，公司主营业务收入合计1673.14万元，实现主营业务利润105.83万元。', '本次借款主要用于订购**电动车，该企业借款金额为100万元，第二期50万元，借款期限3个月，本平台为此借款提供服务。', '1、 公司股东陈*、肖*夫妇；罗*、钟*夫妇提供无限连带责任担保 2、 赣州市**门诊部提供无限连带责任担保', '0.00', '12.00', '1', 'PJ2018BZ0010', '10', null, null, null, null);
INSERT INTO `borrowdetail` VALUES ('13', '/static/uploads/borrowdetail/7.jpg', '/static/uploads/borrowdetail/6.jpg', '/static/uploads/borrowdetail/6(2K).jpg', '/static/uploads/borrowdetail/2.jpg', '贸易', '贸易', '借款代理', '投资', '数据库的反馈', '0.00', '12.00', '1', 'PJ2018BZ0014', '14', null, null, null, null);

-- ----------------------------
-- Table structure for bz
-- ----------------------------
DROP TABLE IF EXISTS `bz`;
CREATE TABLE `bz` (
  `bzid` int(11) NOT NULL AUTO_INCREMENT,
  `bzname` varchar(30) NOT NULL COMMENT '标种名称',
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`bzid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bz
-- ----------------------------
INSERT INTO `bz` VALUES ('1', '恒金保', '0');
INSERT INTO `bz` VALUES ('2', '多金宝', '0');
INSERT INTO `bz` VALUES ('3', '新手标', '0');
INSERT INTO `bz` VALUES ('4', '普金保', '0');

-- ----------------------------
-- Table structure for dxmodel
-- ----------------------------
DROP TABLE IF EXISTS `dxmodel`;
CREATE TABLE `dxmodel` (
  `dxid` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`dxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dxmodel
-- ----------------------------

-- ----------------------------
-- Table structure for dynamic
-- ----------------------------
DROP TABLE IF EXISTS `dynamic`;
CREATE TABLE `dynamic` (
  `dyid` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `pic` text,
  `created_time` datetime DEFAULT NULL,
  `url` text,
  PRIMARY KEY (`dyid`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dynamic
-- ----------------------------
INSERT INTO `dynamic` VALUES ('53', '普金资本拥抱金融整改合规合法经营', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255);\">2018年1月18日下午，关于江西省互联网金融网络借贷及P2P平台整改座谈会在赣州市发展投资控股集团总部会议室召开，会议由省互联网金融协会龚思女士主持召开，省互联网金融协会郑秘书长列席，市协会秘书长参会，我司总裁吴鸿出席会议，一同参加座谈会的有融通资产，惠众金融，真鑫贷，创绩宝等同行业优秀公司，各方就整改政策公司经营情况相互交流沟通。</span></p><p style=\"text-align:center\"><img src=\"http://localhost:8080/static/uploads/image/20180120/20180119171941_8221516408833629.jpg\" title=\"20180119171941_8221516408833629.jpg\" alt=\"20180119171941_822.jpg\" width=\"632\" height=\"331\"/></p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255);\">会议期间，网络借贷P2P整改验收是本次网贷风险专项整改工作的重要环节，各公司应高度重视和认识，切实落实属地管理职责，做好组织管理和风险预案，各机构、成立小组将严格把关组织协调后续整改验收工作，其中由省互联网金融协会刘芳女士解读省金融办关于省互联网金融整改政策解读，传达精神。其中各社区市验收小组应以《办法》及相关监督文件及本通知验收标准，从严开展网贷机构的验收工作和关键问题：根据互联网金融风险专项整治领导小组要求，对在《办法》发布之日（2016年8月24日）后新设立的网贷机构、新从事的网贷机构、自始未纳入本次网贷整治机构以及规定的十三禁止性行为单一借款上限、房地产首付贷，校园贷，现在金贷等不符合规范管理整顿的将一律不予验收，网贷机构应根据《网贷资金存管指引》开展资金存管和开展业务合作，在验收前按照《网贷信息中介机构业务活动信息披露指引》进行完整的信息披露，业务进行验收。</span></p><p>&nbsp;&nbsp;&nbsp;&nbsp;</p><p style=\"text-align:center\"><img src=\"http://localhost:8080/static/uploads/image/20180120/20180119172028_1361516408929252.png\" title=\"20180119172028_1361516408929252.png\" alt=\"20180119172028_136.png\" width=\"614\" height=\"442\"/></p><p><br/></p><p><br/></p>', 'http://localhost:8080/static/uploads/image/20180120/20180119171941_8221516408833629.jpg', '2018-01-20 08:44:05', null);
INSERT INTO `dynamic` VALUES ('54', '【普金资本】校企联手 探寻合作新契机！', '<p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-align: justify;\"><span style=\"word-wrap: break-word;\">&nbsp;<span style=\"word-wrap: break-word; color: rgb(0, 0, 0);\">2017年10月14号，普金资本公司与赣南医学院共同签定了《校外创新创业实践基地协议书》。根据协议，双方将充分发挥校企优势，加强学生就业、创业合作，联手培养互联网创新人才。</span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(0, 0, 0);\">普金资本总裁吴鸿先生率领公司高层、联同赣南医学院领导刘宁生院长、<span style=\"word-wrap: break-word;\">副院长</span>陶钧、人文学院管理系主任李钧一同出席了此次合作会议；吴鸿先生在致辞说，普金资本作为赣州知名的金融企业，一直注重基层管理人才的提前储备，近年来不断加大力度联手各高校建立创新型产学研合作人才培养模式，提高学生实践能力与社会适应能力，充分展现了普金资本对校企合作的重视度，未来，普金资本还将加大对人才的投入，为学校、社会提供更多的就业机会。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(0, 0, 0);\">&nbsp;</span></p><p style=\"text-align:center\"><img src=\"http://localhost:8080/static/uploads/image/20180120/46f6000137f66cbbd2fa1516409107783.jpg\" title=\"46f6000137f66cbbd2fa1516409107783.jpg\" alt=\"46f6000137f66cbbd2fa.jpg\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(0, 0, 0);\"></span><br/></p>', 'http://localhost:8080/static/uploads/image/20180120/46f6000137f66cbbd2fa1516409107783.jpg', '2018-01-20 08:45:18', '2017年10月14号，普金资本公司与赣南医学院共同签定了《校外创新创业实践基地协议书》。根据协议，双方将充分发挥校企优势，加强学生就业、创业合作，联手培养互联网创新人才。普金资本总裁吴鸿先生率领公司高层、联同赣南医学院领导刘宁生院长、副院长陶钧、人文学院管理系主任李钧一同出席了此次合作会议；吴鸿先生在致辞说，普金资本作为赣州知名的金融企业，一直注重基层管理人才的提前储备，近年来不断加大力度联手各高校建立创新型产学研合作人才培养模式，提高学生实践能力与社会适应能力，充分展现了普金资本对校企合作的重视度，未来，普金资本还将加大对人才的投入，为学校、社会提供更多的就业机会。');
INSERT INTO `dynamic` VALUES ('55', '【喜报】庆贺普金资本成功当选江西省第二届互联网金融协会副会长单位！', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">2017</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">年</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">10</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">月</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">100</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">日，江西省互联网金融协会第二届第一次会员代表大会在南昌前湖迎宾馆隆重召开。本次会议，通过了第一届理事会工作报告和财务报告，并且选举产生了第二届理事单位。其中，普金资本运营（赣州）有限公司成功当选江西省互联网金融协会第二届副会长单位，与此同时，公司</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">CEO</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">吴鸿先生成功当选为理事会副会长。</span></p><p style=\"text-align:center\"><img src=\"http://localhost:8080/static/uploads/image/20180120/11111231231231516409153777.png\" title=\"11111231231231516409153777.png\" alt=\"1111123123123.png\"/></p><p><br/></p>', 'http://localhost:8080/static/uploads/image/20180120/11111231231231516409153777.png', '2018-01-20 09:00:09', '2017年10月100日，江西省互联网金融协会第二届第一次会员代表大会在南昌前湖迎宾馆隆重召开。本次会议，通过了第一届理事会工作报告和财务报告，并且选举产生了第二届理事单位。其中，普金资本运营（赣州）有限公司成功当选江西省互联网金融协会第二届副会长单位，与此同时，公司CEO吴鸿先生成功当选为理事会副会长。');

-- ----------------------------
-- Table structure for friend
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `furl` varchar(300) NOT NULL,
  `fpic` varchar(500) NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friend
-- ----------------------------
INSERT INTO `friend` VALUES ('2', 'https://www.baidu.com/', 'http://localhost:8080/static/uploads/201704141714413995.png');
INSERT INTO `friend` VALUES ('3', 'https://www.baidu.com/', 'http://localhost:8080/static/uploads/201704141714599412.png');
INSERT INTO `friend` VALUES ('4', 'https://www.baidu.com/', 'http://localhost:8080/static/uploads/201612290824108901.jpg');
INSERT INTO `friend` VALUES ('5', 'https://www.baidu.com/', 'http://localhost:8080/static/uploads/201612290824515414.jpg');
INSERT INTO `friend` VALUES ('6', 'https://daohang.qq.com/?fr=bkmark', 'http://localhost:8080/static/uploads/201612290825022265.jpg');

-- ----------------------------
-- Table structure for hkb
-- ----------------------------
DROP TABLE IF EXISTS `hkb`;
CREATE TABLE `hkb` (
  `hkid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '借款人id',
  `rname` varchar(30) NOT NULL COMMENT '真实姓名',
  `cpname` varchar(50) NOT NULL COMMENT '产品名',
  `rnum` int(11) DEFAULT '0' COMMENT '已还期数',
  `tnum` int(11) DEFAULT '0' COMMENT '总期数',
  `ytime` datetime NOT NULL COMMENT '应还时间',
  `rtime` datetime DEFAULT NULL COMMENT '实际还款时间',
  `bzname` varchar(255) NOT NULL COMMENT '标种',
  `ybx` decimal(7,2) DEFAULT '0.00' COMMENT '应还本息',
  `rbx` decimal(7,2) DEFAULT '0.00' COMMENT '已还本息',
  `ylx` decimal(7,2) DEFAULT '0.00' COMMENT '应还利息',
  `rlx` decimal(7,2) DEFAULT '0.00' COMMENT '已还利息',
  `ybj` decimal(7,2) DEFAULT '0.00' COMMENT '应还本金',
  `rbj` decimal(7,2) DEFAULT '0.00' COMMENT '已还本金',
  `yfc` decimal(7,2) DEFAULT '0.00' COMMENT '应还罚息',
  `rfc` decimal(7,2) DEFAULT '0.00' COMMENT '已还罚息',
  `yucount` int(11) DEFAULT '0' COMMENT '逾期次数',
  `status` int(11) DEFAULT '0' COMMENT '还款状态',
  `baid` int(11) NOT NULL COMMENT '借款id',
  `yustartime` datetime DEFAULT NULL COMMENT '逾期执行时间',
  `huid` int(11) NOT NULL COMMENT '贷后负责人',
  `resint1` int(11) DEFAULT NULL,
  `resint2` int(11) DEFAULT NULL,
  `resstr1` varchar(50) DEFAULT NULL,
  `resstr2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`hkid`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hkb
-- ----------------------------
INSERT INTO `hkb` VALUES ('37', '18', '刘振南', 'PJ2018BZ0001', '1', '9', '2018-01-21 20:34:28', '2018-01-21 20:42:27', '新手标', '10635.35', '10635.35', '1125.00', '1125.00', '9510.35', '9510.35', '0.00', '0.00', '0', '1', '1', null, '1', null, null, null, null);
INSERT INTO `hkb` VALUES ('38', '18', '刘振南', 'PJ2018BZ0001', '1', '9', '2018-03-21 20:34:28', null, '新手标', '10635.35', '0.00', '1006.12', '0.00', '9629.23', '0.00', '0.00', '0.00', '0', '0', '1', null, '1', null, null, null, null);
INSERT INTO `hkb` VALUES ('39', '18', '刘振南', 'PJ2018BZ0001', '1', '9', '2018-04-21 20:34:28', null, '新手标', '10635.35', '0.00', '885.76', '0.00', '9749.59', '0.00', '0.00', '0.00', '0', '0', '1', null, '1', null, null, null, null);
INSERT INTO `hkb` VALUES ('40', '18', '刘振南', 'PJ2018BZ0001', '1', '9', '2018-05-21 20:34:28', null, '新手标', '10635.35', '0.00', '763.89', '0.00', '9871.46', '0.00', '0.00', '0.00', '0', '0', '1', null, '1', null, null, null, null);
INSERT INTO `hkb` VALUES ('41', '18', '刘振南', 'PJ2018BZ0001', '1', '9', '2018-06-21 20:34:28', null, '新手标', '10635.35', '0.00', '640.49', '0.00', '9994.86', '0.00', '0.00', '0.00', '0', '0', '1', null, '1', null, null, null, null);
INSERT INTO `hkb` VALUES ('42', '18', '刘振南', 'PJ2018BZ0001', '1', '9', '2018-07-21 20:34:28', null, '新手标', '10635.35', '0.00', '515.56', '0.00', '10119.79', '0.00', '0.00', '0.00', '0', '0', '1', null, '1', null, null, null, null);
INSERT INTO `hkb` VALUES ('43', '18', '刘振南', 'PJ2018BZ0001', '1', '9', '2018-08-21 20:34:28', null, '新手标', '10635.35', '0.00', '389.06', '0.00', '10246.29', '0.00', '0.00', '0.00', '0', '0', '1', null, '1', null, null, null, null);
INSERT INTO `hkb` VALUES ('44', '18', '刘振南', 'PJ2018BZ0001', '1', '9', '2018-09-21 20:34:28', null, '新手标', '10635.35', '0.00', '260.98', '0.00', '10374.37', '0.00', '0.00', '0.00', '0', '0', '1', null, '1', null, null, null, null);
INSERT INTO `hkb` VALUES ('45', '18', '刘振南', 'PJ2018BZ0001', '1', '9', '2018-10-21 20:34:28', null, '新手标', '10635.35', '0.00', '131.30', '0.00', '10504.05', '0.00', '0.00', '0.00', '0', '0', '1', null, '1', null, null, null, null);

-- ----------------------------
-- Table structure for home
-- ----------------------------
DROP TABLE IF EXISTS `home`;
CREATE TABLE `home` (
  `hid` int(11) NOT NULL AUTO_INCREMENT,
  `pic1` varchar(500) DEFAULT NULL,
  `pic2` varchar(500) DEFAULT NULL,
  `pic3` varchar(500) DEFAULT NULL,
  `ewm` varchar(500) DEFAULT NULL COMMENT '二维码',
  `phone` varchar(15) DEFAULT NULL,
  `url1` varchar(100) DEFAULT NULL,
  `url2` varchar(100) DEFAULT NULL,
  `url3` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of home
-- ----------------------------
INSERT INTO `home` VALUES ('6', 'http://localhost:8080/static/uploads/3.jpg', 'http://localhost:8080/static/uploads/7.jpg', 'http://localhost:8080/static/uploads/6.jpg', 'wu', '', 'www.baidu.com', 'www.google.cn', 'www.360safe.com', '0');
INSERT INTO `home` VALUES ('7', 'http://localhost:8080/static/uploads/1.jpg', 'http://localhost:8080/static/uploads/6.jpg', 'http://localhost:8080/static/uploads/4.jpg', 'wu', null, '123123123', '123123123123123', '123123123132', '0');
INSERT INTO `home` VALUES ('9', 'http://localhost:8080/static/uploads/6.jpg', 'http://localhost:8080/static/uploads/7.jpg', 'http://localhost:8080/static/uploads/1.jpg', 'kong', '000', 'qwe', 'qwe', 'qwe', '0');
INSERT INTO `home` VALUES ('10', 'http://localhost:8080/static/uploads/6.jpg', 'http://localhost:8080/static/uploads/1.jpg', 'http://localhost:8080/static/uploads/1.jpg', 'kong', '000', '123', '222', '343123', '0');
INSERT INTO `home` VALUES ('11', 'http://localhost:8080/static/uploads/1.jpg', 'http://localhost:8080/static/uploads/5.jpg', 'http://localhost:8080/static/uploads/8.png', 'kong', '000', '1231231', '123123', '14124234', '0');
INSERT INTO `home` VALUES ('21', 'http://localhost:8080/static/uploads/7.jpg', 'http://localhost:8080/static/uploads/8.png', 'http://localhost:8080/static/uploads/6.jpg', 'kong', '000', '1', '222', '333', '0');
INSERT INTO `home` VALUES ('22', 'http://localhost:8080/static/uploads/7.jpg', 'http://localhost:8080/static/uploads/7.jpg', 'http://localhost:8080/static/uploads/1.jpg', 'kong', '000', '987', '876', 'uiyg', '0');
INSERT INTO `home` VALUES ('23', 'http://localhost:8080/static/uploads/20171018160753035.jpg', 'http://localhost:8080/static/uploads/20180115164554256.jpg', 'http://localhost:8080/static/uploads/201704281355082037.jpg', 'kong', '000', 'www.baidu.com', 'www.baidu.com', 'www.baidu.com', '1');

-- ----------------------------
-- Table structure for huser
-- ----------------------------
DROP TABLE IF EXISTS `huser`;
CREATE TABLE `huser` (
  `huid` int(11) NOT NULL AUTO_INCREMENT,
  `rname` varchar(50) NOT NULL DEFAULT '',
  `sex` varchar(4) DEFAULT '男',
  `phone` varchar(15) NOT NULL,
  `huname` varchar(50) DEFAULT 'admin',
  `email` varchar(50) DEFAULT NULL,
  `resint1` int(11) DEFAULT NULL,
  `resint2` int(11) DEFAULT NULL,
  `resstr1` varchar(50) DEFAULT NULL,
  `resstr2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`huid`),
  UNIQUE KEY `uk_huser` (`phone`),
  UNIQUE KEY `uk_hemail` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of huser
-- ----------------------------
INSERT INTO `huser` VALUES ('0', 'root', '男', '15779860000', 'root', null, null, null, '4QrcOUm6Wau+VuBX8g+IPg==', null);
INSERT INTO `huser` VALUES ('1', '刘金泳', '男', '17607974221', '咸菜', '1151757358@qq.com', null, null, '4QrcOUm6Wau+VuBX8g+IPg==', null);
INSERT INTO `huser` VALUES ('8', '管理员一号', '男', '13879735517', '曾创', '1614142419@qq.com', null, null, '4QrcOUm6Wau+VuBX8g+IPg==', '');

-- ----------------------------
-- Table structure for jklx
-- ----------------------------
DROP TABLE IF EXISTS `jklx`;
CREATE TABLE `jklx` (
  `lxid` int(11) NOT NULL AUTO_INCREMENT,
  `lxname` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`lxid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jklx
-- ----------------------------
INSERT INTO `jklx` VALUES ('1', '个人', '0');
INSERT INTO `jklx` VALUES ('2', '企业', '0');

-- ----------------------------
-- Table structure for jur
-- ----------------------------
DROP TABLE IF EXISTS `jur`;
CREATE TABLE `jur` (
  `jid` int(11) NOT NULL AUTO_INCREMENT,
  `jurl` varchar(200) NOT NULL COMMENT '权限URL',
  `content` varchar(300) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`jid`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jur
-- ----------------------------
INSERT INTO `jur` VALUES ('1', 'role:add', '添加角色');
INSERT INTO `jur` VALUES ('2', 'role:update', '修改角色');
INSERT INTO `jur` VALUES ('3', 'role:delete', '删除角色');
INSERT INTO `jur` VALUES ('4', 'role:pager', '角色分页查看');
INSERT INTO `jur` VALUES ('5', 'role:all', '所有角色，分配权限时');
INSERT INTO `jur` VALUES ('6', 'role:dep', '添加角色时指定属于某个部门，所有部门');
INSERT INTO `jur` VALUES ('7', 'roleJur:saveRoleJur', '角色权限分配');
INSERT INTO `jur` VALUES ('8', 'roleJur:delete', '删除角色的权限');
INSERT INTO `jur` VALUES ('9', 'roleUser:saveRoleUser', '用户角色分配');
INSERT INTO `jur` VALUES ('10', 'ticket:pagerTicket', '后台优惠券分页查看');
INSERT INTO `jur` VALUES ('11', 'ticket:updateTicket', '修改券信息');
INSERT INTO `jur` VALUES ('12', 'ticket:saveTicket', '添加券');
INSERT INTO `jur` VALUES ('13', 'ticket:deleteTicket', '删除券');
INSERT INTO `jur` VALUES ('14', 'friend:delete', '删除合作伙伴');
INSERT INTO `jur` VALUES ('15', 'friend:pager', '合作伙伴分页查看');
INSERT INTO `jur` VALUES ('16', 'friend:save', '添加合作伙伴');
INSERT INTO `jur` VALUES ('17', 'friend:update', '修改合作伙伴');
INSERT INTO `jur` VALUES ('18', 'jur:initJur', '初始化权限');
INSERT INTO `jur` VALUES ('19', 'jur:listJurByRid', '根据角色id查看角色的权限');
INSERT INTO `jur` VALUES ('20', 'jur:all', '添加角色时，列出所有权限');
INSERT INTO `jur` VALUES ('21', 'jur:pager', '权限分页');
INSERT INTO `jur` VALUES ('22', 'jur:updateJur', '更新权限');
INSERT INTO `jur` VALUES ('23', 'user:register', '用户注册');
INSERT INTO `jur` VALUES ('24', 'user:getByPhone', '用户验证手机号');
INSERT INTO `jur` VALUES ('25', 'user:login', '用户登录');
INSERT INTO `jur` VALUES ('26', 'user:list', '用户分页列表');
INSERT INTO `jur` VALUES ('27', 'user:updatePwd', '用户改密');
INSERT INTO `jur` VALUES ('28', 'user:saveEmail', '用户添加邮箱');
INSERT INTO `jur` VALUES ('29', 'huser:login', '管理员登录');
INSERT INTO `jur` VALUES ('30', 'huser:getByPhone', '管理员验证手机号');
INSERT INTO `jur` VALUES ('31', 'huser:add', '添加管理员');
INSERT INTO `jur` VALUES ('32', 'huser:list', '管理员分页列表');
INSERT INTO `jur` VALUES ('33', 'huser:updatePwd', '管理员改密');
INSERT INTO `jur` VALUES ('34', 'huser:update', '管理员修改信息');
INSERT INTO `jur` VALUES ('35', 'rewardset:list', '奖励设置列表');
INSERT INTO `jur` VALUES ('36', 'bz:save', '标种添加');
INSERT INTO `jur` VALUES ('37', 'bz:remove', '标种添加');
INSERT INTO `jur` VALUES ('38', 'bz:update', '标种添加');
INSERT INTO `jur` VALUES ('39', 'bz:pager', '标种添加');
INSERT INTO `jur` VALUES ('40', 'dxmodel:save', '短信模板添加');
INSERT INTO `jur` VALUES ('41', 'dxmodel:remove', '短信模板删除');
INSERT INTO `jur` VALUES ('42', 'dxmodel:update', '短信模板修改');
INSERT INTO `jur` VALUES ('43', 'dxmodel:pager', '短信模板分页');
INSERT INTO `jur` VALUES ('44', 'jklx:save', '借款类型添加');
INSERT INTO `jur` VALUES ('45', 'jklx:update', '借款类型修改');
INSERT INTO `jur` VALUES ('46', 'jklx：pager', '借款类型分页');
INSERT INTO `jur` VALUES ('47', 'letter:save', '站内信添加');
INSERT INTO `jur` VALUES ('48', 'letter:remove', '站内信删除');
INSERT INTO `jur` VALUES ('49', 'letter:update', '站内信修改');
INSERT INTO `jur` VALUES ('50', 'letter:pager', '站内信分页');
INSERT INTO `jur` VALUES ('51', 'sway:save', '还款方式添加');
INSERT INTO `jur` VALUES ('52', 'sway：remove', '还款方式删除');
INSERT INTO `jur` VALUES ('53', 'sway:update', '还款方式修改');
INSERT INTO `jur` VALUES ('54', 'sway:pager', '还款方式分页');
INSERT INTO `jur` VALUES ('55', 'dynamic:save', '添加公司动态');
INSERT INTO `jur` VALUES ('56', 'dynamic:updatedync', '公司动态修改');
INSERT INTO `jur` VALUES ('57', 'dynamic:removedyna', '公司动态删除');
INSERT INTO `jur` VALUES ('58', 'dynamic:pager', '公司动态表格查询分页');
INSERT INTO `jur` VALUES ('59', 'dynamic:byiddync', '根据id查公司动态详情');
INSERT INTO `jur` VALUES ('60', 'dynamic:PagerCriteria', '公司动态前台分页查询');
INSERT INTO `jur` VALUES ('61', 'media:save', '媒体报道保存');
INSERT INTO `jur` VALUES ('62', 'media:updatemedia', '媒体报道修改');
INSERT INTO `jur` VALUES ('63', 'media:removemedia', '媒体报道删除');
INSERT INTO `jur` VALUES ('64', 'media:pager', '媒体报道表格查询分页');
INSERT INTO `jur` VALUES ('65', 'media:byiddync', '根据id查媒体报道详情');
INSERT INTO `jur` VALUES ('66', 'media:PagerCriteria', '媒体报道前台分页查询');
INSERT INTO `jur` VALUES ('67', 'notice:save', '平台公告保存');
INSERT INTO `jur` VALUES ('68', 'notice:updatenotice', '平台公告修改');
INSERT INTO `jur` VALUES ('69', 'notice:removenotice', '平台公告删除');
INSERT INTO `jur` VALUES ('70', 'notice:pager', '平台公告表格查询分页');
INSERT INTO `jur` VALUES ('71', 'notice:byiddync', '根据id查平台公告详情');
INSERT INTO `jur` VALUES ('72', 'notice:PagerCriteria', '平台公告前台分页查询');
INSERT INTO `jur` VALUES ('73', 'home:upload', '首页轮播图片上传');
INSERT INTO `jur` VALUES ('74', 'home:save', '首页图片保存');
INSERT INTO `jur` VALUES ('75', 'home:pager', '首页图片表格查询分页');
INSERT INTO `jur` VALUES ('76', 'home:update', '首页图片修改');
INSERT INTO `jur` VALUES ('77', 'home:listhome', '首页图片前台查询');
INSERT INTO `jur` VALUES ('78', 'home:updhid', '首页图片修改状态可用或不可用');
INSERT INTO `jur` VALUES ('79', 'ydata:all', '查询平台运营数据');
INSERT INTO `jur` VALUES ('80', 'ydata:pager', '平台运营分页');
INSERT INTO `jur` VALUES ('81', 'ydata:downloadMonthData', '平台运营下载excel');
INSERT INTO `jur` VALUES ('82', 'bank:add', '绑定银行卡');
INSERT INTO `jur` VALUES ('83', 'bank:list', '显示用户所有银行卡');
INSERT INTO `jur` VALUES ('84', 'bank:delete', '用户解绑银行卡');
INSERT INTO `jur` VALUES ('85', 'logCz:recharge', '用户充值');
INSERT INTO `jur` VALUES ('86', 'logCz:listRecord', '用户查看充值记录');
INSERT INTO `jur` VALUES ('87', 'logMoney:pager', '分页显示资金流向记录');
INSERT INTO `jur` VALUES ('88', 'logTx:withdraw', '用户提现');
INSERT INTO `jur` VALUES ('89', 'logTx:pager', '分页显示提现记录');
INSERT INTO `jur` VALUES ('90', 'txCheck:check', '提现审核');
INSERT INTO `jur` VALUES ('91', 'txCheck:listRecord', '分页显示提现审核记录');
INSERT INTO `jur` VALUES ('92', 'txCheck:delete', '删除提现审核记录');
INSERT INTO `jur` VALUES ('93', 'userMoney:selectBanlance', '查看用户的可用余额');
INSERT INTO `jur` VALUES ('94', 'admin:view', '访问管理员后台');
INSERT INTO `jur` VALUES ('95', 'user:mannager', '用户管理');
INSERT INTO `jur` VALUES ('96', 'admin:mannager', '管理员管理');
INSERT INTO `jur` VALUES ('97', 'touzi:mannager', '投资管理');
INSERT INTO `jur` VALUES ('98', 'yy:mannager', '运营管理');
INSERT INTO `jur` VALUES ('99', 'jk:mannager', '借款管理');

-- ----------------------------
-- Table structure for letter
-- ----------------------------
DROP TABLE IF EXISTS `letter`;
CREATE TABLE `letter` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` varchar(500) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of letter
-- ----------------------------
INSERT INTO `letter` VALUES ('1', '哈哈哈哈哈', '撒打算打算是的撒的萨达撒大声地', '2018-01-22 15:24:36', '0');

-- ----------------------------
-- Table structure for log_cz
-- ----------------------------
DROP TABLE IF EXISTS `log_cz`;
CREATE TABLE `log_cz` (
  `czid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `bankcard` varchar(20) NOT NULL COMMENT '银行卡号',
  `banktype` varchar(50) NOT NULL COMMENT '银行卡类型',
  `money` decimal(15,2) NOT NULL COMMENT '金额',
  `created_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`czid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_cz
-- ----------------------------
INSERT INTO `log_cz` VALUES ('1', '17', '6212842126680063633', '中国银行', '10000.00', '2018-01-20 08:09:03', '0');
INSERT INTO `log_cz` VALUES ('2', '17', '6212842126680063633', '中国银行', '10000.00', '2018-01-20 08:09:05', '0');
INSERT INTO `log_cz` VALUES ('3', '17', '6212842126680063633', '中国银行', '10000.00', '2018-01-20 08:09:06', '0');
INSERT INTO `log_cz` VALUES ('4', '17', '6212842126680063633', '中国银行', '10000.00', '2018-01-20 08:09:06', '0');
INSERT INTO `log_cz` VALUES ('7', '17', '6212842126680063633', '中国银行', '100000.00', '2018-01-20 08:11:13', '0');
INSERT INTO `log_cz` VALUES ('8', '17', '6212842126680063633', '中国银行', '100000.00', '2018-01-21 19:48:10', '0');
INSERT INTO `log_cz` VALUES ('9', '17', '6212842126680063633', '中国银行', '100000.00', '2018-01-21 20:14:04', '0');
INSERT INTO `log_cz` VALUES ('10', '17', '6212842126680063633', '中国银行', '100000.00', '2018-01-21 20:25:29', '0');
INSERT INTO `log_cz` VALUES ('11', '17', '6212842126680063633', '中国银行', '1000000.00', '2018-01-21 20:33:33', '0');
INSERT INTO `log_cz` VALUES ('12', '17', '6212842126680063632', '中国农业银行', '88888.00', '2018-01-23 10:48:51', '0');
INSERT INTO `log_cz` VALUES ('13', '22', '6212842126680063634', '中国银行', '9999999.00', '2018-01-23 10:50:02', '0');

-- ----------------------------
-- Table structure for log_money
-- ----------------------------
DROP TABLE IF EXISTS `log_money`;
CREATE TABLE `log_money` (
  `lmid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `type` int(11) NOT NULL COMMENT '类型',
  `income` decimal(15,2) DEFAULT NULL COMMENT '收入',
  `outlay` decimal(15,2) DEFAULT NULL COMMENT '支出',
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`lmid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_money
-- ----------------------------
INSERT INTO `log_money` VALUES ('1', '17', '0', '10000.00', null, '2018-01-20 08:09:03');
INSERT INTO `log_money` VALUES ('2', '17', '0', '10000.00', null, '2018-01-20 08:09:05');
INSERT INTO `log_money` VALUES ('3', '17', '0', '10000.00', null, '2018-01-20 08:09:06');
INSERT INTO `log_money` VALUES ('4', '17', '0', '10000.00', null, '2018-01-20 08:09:06');
INSERT INTO `log_money` VALUES ('5', '17', '0', '100000.00', null, '2018-01-20 08:11:13');
INSERT INTO `log_money` VALUES ('6', '17', '1', null, '1000.00', '2018-01-21 19:22:26');
INSERT INTO `log_money` VALUES ('7', '17', '0', '100000.00', null, '2018-01-21 19:48:10');
INSERT INTO `log_money` VALUES ('8', '17', '0', '100000.00', null, '2018-01-21 20:14:04');
INSERT INTO `log_money` VALUES ('9', '17', '0', '100000.00', null, '2018-01-21 20:25:29');
INSERT INTO `log_money` VALUES ('10', '17', '0', '1000000.00', null, '2018-01-21 20:33:33');
INSERT INTO `log_money` VALUES ('11', '17', '0', '88888.00', null, '2018-01-23 10:48:51');
INSERT INTO `log_money` VALUES ('12', '22', '0', '9999999.00', null, '2018-01-23 10:50:02');
INSERT INTO `log_money` VALUES ('13', '22', '1', null, '3456.00', '2018-01-23 10:52:19');

-- ----------------------------
-- Table structure for log_tx
-- ----------------------------
DROP TABLE IF EXISTS `log_tx`;
CREATE TABLE `log_tx` (
  `txid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `bankcard` varchar(20) NOT NULL COMMENT '银行卡号',
  `banktype` varchar(50) NOT NULL COMMENT '所属银行',
  `money` decimal(7,2) NOT NULL COMMENT '金额',
  `created_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`txid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_tx
-- ----------------------------
INSERT INTO `log_tx` VALUES ('1', '17', '6212842126680063633', '中国银行', '20000.00', '2018-01-21 19:17:26', '2');
INSERT INTO `log_tx` VALUES ('2', '17', '6212842126680063633', '中国银行', '1000.00', '2018-01-21 19:22:16', '1');
INSERT INTO `log_tx` VALUES ('3', '17', '6212842126680063633', '中国银行', '10000.00', '2018-01-21 19:23:40', '2');
INSERT INTO `log_tx` VALUES ('4', '17', '6212842126680063633', '中国银行', '600.00', '2018-01-22 16:41:21', '0');
INSERT INTO `log_tx` VALUES ('5', '22', '6212842126680063634', '中国银行', '5555.00', '2018-01-23 10:50:28', '2');
INSERT INTO `log_tx` VALUES ('6', '22', '6212842126680063634', '中国银行', '3456.00', '2018-01-23 10:51:58', '1');

-- ----------------------------
-- Table structure for media
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `pic` varchar(500) DEFAULT NULL,
  `url` text,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of media
-- ----------------------------
INSERT INTO `media` VALUES ('8', '年底投资有风险 选择普金资本安全可靠！', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">随着近年来中国经济的快速发展，社会财富不断增长，个人金融资产也不断增加，理财的必要性也逐渐体现出来了。同时，年关将至，很多人想乘着年末大赚一笔，不少消费者也会将自己的年终奖金投入到理财当中去，以获得鸡生蛋、蛋生鸡的效应。不过，年底投资还是有风险存在的，投资者一定要擦亮眼睛。</span></p><p style=\"text-align:center\"><img src=\"http://localhost:8080/static/uploads/image/20180120/1111516409323246.jpg\" title=\"1111516409323246.jpg\" alt=\"111.jpg\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">具体来说，年底投资的风险体现在以下三个方面。第一，投资者选择了不靠谱的投资平台，而这些平台的老板借着年末敛财的时机圈钱跑路了。这对于投资者来说，确实是不小的打击。第二，投资者没有注意到理财产品的时效性，陷入了流动性的陷阱。当投资者把自己手头的钱全部投入到理财平台上之后，万一有急需用钱的情况，投资者就只有抓瞎了。第三，市场上还是存在着很多的金融诈骗案，在年底更值诈骗的高峰期，需要投资者提高警惕，不要轻易上当。综上所述，投资者只有选择有保障的大平台，才有可能取得好的收益。</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">  有人可能会问，有保障的大平台究竟有哪些明显的特征呢？业内人士提醒大家，在选择投资平台时，首先要看投资平台是否有合法的资质，其次要看投资平台的企业实力，最后要看投资平台上的理财产品是否具有较高的安全性和收益性。说到底，如果一个投资平台是在金融监管单位的监督下成立和运行的，企业的注册资金相当雄厚，同时推出的理财产品也是安全可靠、能够带来高收益的，那么，这样的投资平台无疑是可以为投资者选择的。专家还向大家推荐了普金资本运营（赣州）有限公司，为有投资需求的朋友指明了方向。</p>', 'http://localhost:8080/static/uploads/image/20180120/1111516409323246.jpg', '随着近年来中国经济的快速发展，社会财富不断增长，个人金融资产也不断增加，理财的必要性也逐渐体现出来了。同时，年关将至，很多人想乘着年末大赚一笔，不少消费者也会将自己的年终奖金投入到理财当中去，以获得鸡生蛋、蛋生鸡的效应。不过，年底投资还是有风险存在的，投资者一定要擦亮眼睛。具体来说，年底投资的风险体现在以下三个方面。第一，投资者选择了不靠谱的投资平台，而这些平台的老板借着年末敛财的时机圈钱跑路了。这对于投资者来说，确实是不小的打击。第二，投资者没有注意到理财产品的时效性，陷入了流动性的陷阱。当投资者把自己手头的钱全部投入到理财平台上之后，万一有急需用钱的情况，投资者就只有抓瞎了。第三，市场上还是存在着很多的金融诈骗案，在年底更值诈骗的高峰期，需要投资者提高警惕，不要轻易上当。综上所述，投资者只有选择有保障的大平台，才有可能取得好的收益。  有人可能会问，有保障的大平台究竟有哪些明显的特征呢？业内人士提醒大家，在选择投资平台时，首先要看投资平台是否有合法的资质，其次要看投资平台的企业实力，最后要看投资平台上的理财产品是否具有较高的安全性和收益性。说到底，如果一个投资平台是在金融监管单位的监督下成立和运行的，企业的注册资金相当雄厚，同时推出的理财产品也是安全可靠、能够带来高收益的，那么，这样的投资平台无疑是可以为投资者选择的。专家还向大家推荐了普金资本运营（赣州）有限公司，为有投资需求的朋友指明了方向。', '2018-01-20 08:58:50');
INSERT INTO `media` VALUES ('9', '这个双十一，你准备好了没有？', '<p style=\"text-align:center\"><img src=\"http://localhost:8080/static/uploads/image/20180120/46f6000137f66cbbd2fa1516409282687.jpg\" title=\"46f6000137f66cbbd2fa1516409282687.jpg\" alt=\"46f6000137f66cbbd2fa.jpg\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(93, 93, 93); text-indent: 2em;\">随着双十一的临近，国内的金融投资市场也呈现出一派繁荣景象。不过，时值年底，对于普通的投资者来说，如果没有选择对投资平台，想赚钱盈利的美好愿望就会落空。所以，大多数投资者在选择投资平台时都是慎之又慎，不敢轻易下手。</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(93, 93, 93); text-indent: 2em;\">就算这样，还是有不少投资者误入歧途，被那些不靠谱的平台的承诺所吸引，将自己的血汗钱投入到项目当中，结果是可想而知的，不但钱财血本无归，连精神上也受到了巨大的打击。比如退休在家的老刘，就因为上了一个投资平台的当，将5万元资本全部投入到所谓的高盈利项目中去，结果到期后不但没有承诺的高额利润，更是连本钱都拿不回来了。</p><p style=\"text-align:center\"><img src=\"http://localhost:8080/static/uploads/image/20180120/你说你是对的1516409296509.png\" title=\"你说你是对的1516409296509.png\" alt=\"你说你是对的.png\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(93, 93, 93); text-indent: 2em;\">面对这样的情形，很多投资者开始思考这样的问题：怎么样才能选择到好的投资平台，让自己的投资行为变得更理性、更有保障呢？其实，要想实现对投资的监管，主要还是要睁大眼睛，选择一个靠谱的金融投资平台。只有这样，才能确保自己的投资行为是理性的，是不会给自己带来负面影响的。特别是对于一些本身对金融不太懂的消费者来说，选择这样的平台，更可以省心省力，让自己在投资行动中如虎添翼，如鱼得水。</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(93, 93, 93); text-indent: 2em;\">而以国企参股为特色的普金资本，显然是大家可以信赖的对象。据悉，普金资本是赣州市政府直属、市国资委监管的国有独资企业，不但在资金实力上相当的雄厚，在风险把控方面也做得十分到位。正因为此，自平台对外开放以来，已经有数以千计的投资者和融资者从这个平台中得到了自己想要的效益。</p><p><br/></p>', 'http://localhost:8080/static/uploads/image/20180120/46f6000137f66cbbd2fa1516409282687.jpg', '随着双十一的临近，国内的金融投资市场也呈现出一派繁荣景象。不过，时值年底，对于普通的投资者来说，如果没有选择对投资平台，想赚钱盈利的美好愿望就会落空。所以，大多数投资者在选择投资平台时都是慎之又慎，不敢轻易下手。就算这样，还是有不少投资者误入歧途，被那些不靠谱的平台的承诺所吸引，将自己的血汗钱投入到项目当中，结果是可想而知的，不但钱财血本无归，连精神上也受到了巨大的打击。比如退休在家的老刘，就因为上了一个投资平台的当，将5万元资本全部投入到所谓的高盈利项目中去，结果到期后不但没有承诺的高额利润，更是连本钱都拿不回来了。面对这样的情形，很多投资者开始思考这样的问题：怎么样才能选择到好的投资平台，让自己的投资行为变得更理性、更有保障呢？其实，要想实现对投资的监管，主要还是要睁大眼睛，选择一个靠谱的金融投资平台。只有这样，才能确保自己的投资行为是理性的，是不会给自己带来负面影响的。特别是对于一些本身对金融不太懂的消费者来说，选择这样的平台，更可以省心省力，让自己在投资行动中如虎添翼，如鱼得水。而以国企参股为特色的普金资本，显然是大家可以信赖的对象。据悉，普金资本是赣州市政府直属、市国资委监管的国有独资企业，不但在资金实力上相当的雄厚，在风险把控方面也做得十分到位。正因为此，自平台对外开放以来，已经有数以千计的投资者和融资者从这个平台中得到了自己想要的效益。', '2018-01-20 08:58:46');
INSERT INTO `media` VALUES ('10', '【喜报】庆贺普金资本成功当选江西省第二届互联网金融协会副会长单位！', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">2017</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">年</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">10</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">月</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">100</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">日，江西省互联网金融协会第二届第一次会员代表大会在南昌前湖迎宾馆隆重召开。本次会议，通过了第一届理事会工作报告和财务报告，并且选举产生了第二届理事单位。其中，普金资本运营（赣州）有限公司成功当选江西省互联网金融协会第二届副会长单位，与此同时，公司</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">CEO</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">吴鸿先生成功当选为理事会副会长。</span></p><p style=\"text-align:center\"><img src=\"http://localhost:8080/static/uploads/image/20180120/1111516409264750.jpg\" title=\"1111516409264750.jpg\" alt=\"111.jpg\"/></p><p style=\"text-align:center\"><br/></p><p><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><br/></span><br/></p>', 'http://localhost:8080/static/uploads/image/20180120/1111516409264750.jpg', '2017年10月100日，江西省互联网金融协会第二届第一次会员代表大会在南昌前湖迎宾馆隆重召开。本次会议，通过了第一届理事会工作报告和财务报告，并且选举产生了第二届理事单位。其中，普金资本运营（赣州）有限公司成功当选江西省互联网金融协会第二届副会长单位，与此同时，公司CEO吴鸿先生成功当选为理事会副会长。', '2018-01-20 08:59:22');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL,
  `content` text NOT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('2', '2017年12月29日新标预告', '<p><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">【项目简介】<span class=\"Apple-converted-space\">&nbsp;</span></span><br/><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">借款人温**，</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">男，赣州市石城人，2014年经营一家广告公司，每月盈利5万元左右，经济实力强，该次借款用于还清银行按揭贷款，尾款目前余额50万元左右， 该借款人已跟买家签好房屋买卖合同，房产售出即可回款。本次借款用于还清银行按揭贷款，尾款目前余额50万元左右， 该借款人已跟买家签好房屋买卖合同，房产售出即可回款，该次借款金额为20万元，借款期限3个月，本平台为此借款提供服务。1111</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><br/></span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">【借款金额】20 万元</span><br/><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">【产品类别】多金宝</span><br/><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">【借款期限】3个月</span><br/><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">【借款利率】9+1%</span><br/><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">【发标时间】2017年12月29日 15:00</span></p>', '2018-01-16 15:32:26');
INSERT INTO `notice` VALUES ('3', '关于元旦假期工作安排公告', '<p style=\"word-wrap: break-word;margin-top: 0px;margin-bottom: 0px;padding: 0px;border: 0px;color: rgb(51, 51, 51);font-family: &#39;Microsoft Yahei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Helvetica Neue&#39;, Helvetica, tahoma, arial, Verdana, sans-serif, &#39;WenQuanYi Micro Hei&#39;, 宋体;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 28px;vertical-align: baseline\">尊敬的普金资本用户：</p><p style=\"word-wrap: break-word;margin-top: 0px;margin-bottom: 0px;padding: 0px;border: 0px;color: rgb(51, 51, 51);font-family: &#39;Microsoft Yahei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Helvetica Neue&#39;, Helvetica, tahoma, arial, Verdana, sans-serif, &#39;WenQuanYi Micro Hei&#39;, 宋体;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 28px;vertical-align: baseline\">  根据《国务院办公厅关于2018年部分节假日安排的通知》，经我公司研究决定，现将普金资本2018年元旦放假安排公告如下：</p><p style=\"word-wrap: break-word;margin-top: 0px;margin-bottom: 0px;padding: 0px;border: 0px;color: rgb(51, 51, 51);font-family: &#39;Microsoft Yahei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Helvetica Neue&#39;, Helvetica, tahoma, arial, Verdana, sans-serif, &#39;WenQuanYi Micro Hei&#39;, 宋体;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 28px;vertical-align: baseline\">  2017年12月30日（星期六）—2018年1月1日（星期一）放假，&nbsp;2018年1月2日(星期二)起正常上班。</p><p style=\"word-wrap: break-word;margin-top: 0px;margin-bottom: 0px;padding: 0px;border: 0px;color: rgb(51, 51, 51);font-family: &#39;Microsoft Yahei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Helvetica Neue&#39;, Helvetica, tahoma, arial, Verdana, sans-serif, &#39;WenQuanYi Micro Hei&#39;, 宋体;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 28px;vertical-align: baseline\">  元旦放假期间：</p><p style=\"word-wrap: break-word;margin-top: 0px;margin-bottom: 0px;padding: 0px;border: 0px;color: rgb(51, 51, 51);font-family: &#39;Microsoft Yahei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Helvetica Neue&#39;, Helvetica, tahoma, arial, Verdana, sans-serif, &#39;WenQuanYi Micro Hei&#39;, 宋体;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 28px;vertical-align: baseline\">  1、每天9：00——18：00安排在线客服值班。</p><p style=\"word-wrap: break-word;margin-top: 0px;margin-bottom: 0px;padding: 0px;border: 0px;color: rgb(51, 51, 51);font-family: &#39;Microsoft Yahei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Helvetica Neue&#39;, Helvetica, tahoma, arial, Verdana, sans-serif, &#39;WenQuanYi Micro Hei&#39;, 宋体;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 28px;vertical-align: baseline\">  备注：因假期内安排手机值班，如未能及时回复，敬请谅解!</p><p style=\"word-wrap: break-word;margin-top: 0px;margin-bottom: 0px;padding: 0px;border: 0px;color: rgb(51, 51, 51);font-family: &#39;Microsoft Yahei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Helvetica Neue&#39;, Helvetica, tahoma, arial, Verdana, sans-serif, &#39;WenQuanYi Micro Hei&#39;, 宋体;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 28px;vertical-align: baseline\">  2、假期内正常充值、回款。</p><p style=\"word-wrap: break-word;margin-top: 0px;margin-bottom: 0px;padding: 0px;border: 0px;color: rgb(51, 51, 51);font-family: &#39;Microsoft Yahei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Helvetica Neue&#39;, Helvetica, tahoma, arial, Verdana, sans-serif, &#39;WenQuanYi Micro Hei&#39;, 宋体;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 28px;vertical-align: baseline\">  3、关于提现：假期内不处理提现，2017年12月29日-2018年1月1日期间的普通提现，均2018年1月2日到账；请提前做好资金安排；</p><p style=\"word-wrap: break-word;margin-top: 0px;margin-bottom: 0px;padding: 0px;border: 0px;color: rgb(51, 51, 51);font-family: &#39;Microsoft Yahei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Helvetica Neue&#39;, Helvetica, tahoma, arial, Verdana, sans-serif, &#39;WenQuanYi Micro Hei&#39;, 宋体;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 28px;vertical-align: baseline\">  4、发标信息以普金资本网站公布的发标预告为准。</p><p style=\"word-wrap: break-word;margin-top: 0px;margin-bottom: 0px;padding: 0px;border: 0px;color: rgb(51, 51, 51);font-family: &#39;Microsoft Yahei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Helvetica Neue&#39;, Helvetica, tahoma, arial, Verdana, sans-serif, &#39;WenQuanYi Micro Hei&#39;, 宋体;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255)\">  温馨提醒：请大家提前做好各项安排，不便之处，敬请谅解！如有疑问，请致电网站服务热线400-606-2079或0797-2139619</p><p style=\"word-wrap: break-word;margin-top: 0px;margin-bottom: 0px;padding: 0px;border: 0px;color: rgb(51, 51, 51);font-family: &#39;Microsoft Yahei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Helvetica Neue&#39;, Helvetica, tahoma, arial, Verdana, sans-serif, &#39;WenQuanYi Micro Hei&#39;, 宋体;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 28px;vertical-align: baseline\"><br/></p><p style=\"word-wrap: break-word;margin-top: 0px;margin-bottom: 0px;padding: 0px;border: 0px;color: rgb(51, 51, 51);font-family: &#39;Microsoft Yahei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Helvetica Neue&#39;, Helvetica, tahoma, arial, Verdana, sans-serif, &#39;WenQuanYi Micro Hei&#39;, 宋体;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 28px;vertical-align: baseline\">  特此通知!</p><p style=\"word-wrap: break-word;margin-top: 0px;margin-bottom: 0px;margin-left: 0;padding: 0px;border: 0px;color: rgb(51, 51, 51);font-family: &#39;Microsoft Yahei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Helvetica Neue&#39;, Helvetica, tahoma, arial, Verdana, sans-serif, &#39;WenQuanYi Micro Hei&#39;, 宋体;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 28px;text-align: right\"> 普金资本运营（赣州）有限公司</p><p style=\"word-wrap: break-word;margin-top: 0px;margin-bottom: 0px;margin-left: 0;padding: 0px;border: 0px;color: rgb(51, 51, 51);font-family: &#39;Microsoft Yahei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Helvetica Neue&#39;, Helvetica, tahoma, arial, Verdana, sans-serif, &#39;WenQuanYi Micro Hei&#39;, 宋体;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 28px;text-align: right\">2017年12月28日</p><p><br/></p>', '2018-01-02 20:02:27');
INSERT INTO `notice` VALUES ('4', '关于多金宝项目正常还款的公告', '<p style=\"word-wrap: break-word;margin-top: 0px;margin-bottom: 0px;padding: 0px;border: 0px;color: rgb(51, 51, 51);font-family: &#39;Microsoft Yahei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Helvetica Neue&#39;, Helvetica, tahoma, arial, Verdana, sans-serif, &#39;WenQuanYi Micro Hei&#39;, 宋体;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255)\">尊敬的普金资本用户：<br/>2017年09月19日发布多金宝PJ2017BZ0025(1)项目（借款金额：50万元、借款期限：3个月）已于2017年12月26日归还本息504166.67元。如您是上述项目投资人，敬请查阅个人账户回款情况。<br/>感谢您一直以来对我们的支持与厚爱！</p><p style=\"word-wrap: break-word;margin-top: 0px;margin-bottom: 0px;padding: 0px;border: 0px;color: rgb(51, 51, 51);font-family: &#39;Microsoft Yahei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Helvetica Neue&#39;, Helvetica, tahoma, arial, Verdana, sans-serif, &#39;WenQuanYi Micro Hei&#39;, 宋体;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255)\"><br/></p><p style=\"word-wrap: break-word;margin-top: 0px;margin-bottom: 0px;padding: 0px;border: 0px;color: rgb(51, 51, 51);font-family: &#39;Microsoft Yahei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Helvetica Neue&#39;, Helvetica, tahoma, arial, Verdana, sans-serif, &#39;WenQuanYi Micro Hei&#39;, 宋体;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-align: right\">普金资本运营（赣州）有限公司</p><p style=\"word-wrap: break-word;margin-top: 0px;margin-bottom: 0px;padding: 0px;border: 0px;color: rgb(51, 51, 51);font-family: &#39;Microsoft Yahei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Helvetica Neue&#39;, Helvetica, tahoma, arial, Verdana, sans-serif, &#39;WenQuanYi Micro Hei&#39;, 宋体;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-align: right\">2017年12月26日</p><p><br/></p>', '2018-01-02 20:02:44');

-- ----------------------------
-- Table structure for option
-- ----------------------------
DROP TABLE IF EXISTS `option`;
CREATE TABLE `option` (
  `opid` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) NOT NULL,
  `content` varchar(500) NOT NULL COMMENT '反馈内容',
  `created_time` datetime DEFAULT NULL COMMENT '反馈时间',
  PRIMARY KEY (`opid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of option
-- ----------------------------

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend` (
  `rmid` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL COMMENT '推荐人id',
  `tname` varchar(50) NOT NULL COMMENT '推荐人姓名',
  `uid` int(11) NOT NULL COMMENT '被推荐人id',
  `rname` varchar(50) NOT NULL COMMENT '被推荐人姓名',
  `created_time` datetime DEFAULT NULL COMMENT '推荐时间',
  PRIMARY KEY (`rmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recommend
-- ----------------------------

-- ----------------------------
-- Table structure for reward
-- ----------------------------
DROP TABLE IF EXISTS `reward`;
CREATE TABLE `reward` (
  `rwid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `tmoney` decimal(15,2) DEFAULT NULL COMMENT '投资总额',
  `money` decimal(15,2) DEFAULT NULL COMMENT '奖励金额',
  `status` varchar(255) DEFAULT '0',
  `reward_time` datetime DEFAULT NULL COMMENT '奖励发放时间',
  PRIMARY KEY (`rwid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reward
-- ----------------------------
INSERT INTO `reward` VALUES ('1', '17', '549868.00', '109973.60', '1', '2018-02-28 23:00:05');
INSERT INTO `reward` VALUES ('3', '22', '80600.00', '4030.00', '1', '2018-01-31 23:00:00');

-- ----------------------------
-- Table structure for reward_setting
-- ----------------------------
DROP TABLE IF EXISTS `reward_setting`;
CREATE TABLE `reward_setting` (
  `rwsid` int(11) NOT NULL AUTO_INCREMENT,
  `minmoney` decimal(15,2) NOT NULL,
  `maxmoney` decimal(15,2) NOT NULL,
  `percent` double NOT NULL COMMENT '奖励百分比',
  PRIMARY KEY (`rwsid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reward_setting
-- ----------------------------
INSERT INTO `reward_setting` VALUES ('5', '10000.00', '50000.00', '1');
INSERT INTO `reward_setting` VALUES ('6', '50000.00', '100000.00', '5');
INSERT INTO `reward_setting` VALUES ('7', '100000.00', '500000.00', '10');
INSERT INTO `reward_setting` VALUES ('8', '500000.00', '1000000.00', '20');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0',
  `rname` varchar(50) NOT NULL,
  `content` varchar(100) NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('5', '0', '管理员', '管理员');
INSERT INTO `role` VALUES ('6', '5', '普通管理员001', '需要分配权限才可以访问系统资源');
INSERT INTO `role` VALUES ('7', '0', '财务部', '管理公司财务');
INSERT INTO `role` VALUES ('8', '7', '财务总经理', '管理财务');
INSERT INTO `role` VALUES ('9', '0', '人事部', '管理公司人力资源');
INSERT INTO `role` VALUES ('10', '9', '人事总经理', '管理公司人力');
INSERT INTO `role` VALUES ('11', '5', '管理员002', '需要分配权限才可以访问系统资源');

-- ----------------------------
-- Table structure for rolejur
-- ----------------------------
DROP TABLE IF EXISTS `rolejur`;
CREATE TABLE `rolejur` (
  `rjid` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `jid` int(11) NOT NULL,
  PRIMARY KEY (`rjid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rolejur
-- ----------------------------

-- ----------------------------
-- Table structure for roleuser
-- ----------------------------
DROP TABLE IF EXISTS `roleuser`;
CREATE TABLE `roleuser` (
  `ruid` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `huid` int(11) NOT NULL,
  PRIMARY KEY (`ruid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roleuser
-- ----------------------------
INSERT INTO `roleuser` VALUES ('1', '6', '1');
INSERT INTO `roleuser` VALUES ('2', '11', '8');
INSERT INTO `roleuser` VALUES ('3', '6', '1');
INSERT INTO `roleuser` VALUES ('4', '6', '1');
INSERT INTO `roleuser` VALUES ('5', '6', '8');

-- ----------------------------
-- Table structure for rzvip
-- ----------------------------
DROP TABLE IF EXISTS `rzvip`;
CREATE TABLE `rzvip` (
  `rzid` int(11) NOT NULL AUTO_INCREMENT COMMENT '认证id（主键）',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `xl` varchar(36) DEFAULT '暂无' COMMENT '学历',
  `ism` varchar(4) DEFAULT '未知' COMMENT '婚否',
  `bschool` varchar(100) DEFAULT NULL COMMENT '毕业院校',
  `addr` varchar(200) DEFAULT NULL,
  `work` varchar(50) DEFAULT '暂无数据',
  `age` int(11) DEFAULT NULL,
  `resint1` int(11) DEFAULT NULL,
  `resint2` int(11) DEFAULT NULL,
  `resstr1` varchar(50) DEFAULT NULL,
  `resstr2` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rzid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rzvip
-- ----------------------------
INSERT INTO `rzvip` VALUES ('15', '17', '暂无', '未知', null, null, '暂无数据', null, null, null, null, null);
INSERT INTO `rzvip` VALUES ('16', '18', '暂无', '未知', null, null, '暂无数据', null, null, null, null, null);
INSERT INTO `rzvip` VALUES ('17', '19', '暂无', '未知', null, null, '暂无数据', null, null, null, null, null);
INSERT INTO `rzvip` VALUES ('18', '20', '暂无', '未知', null, null, '暂无数据', null, null, null, null, null);
INSERT INTO `rzvip` VALUES ('19', '21', '暂无', '未知', null, null, '暂无数据', null, null, null, null, null);
INSERT INTO `rzvip` VALUES ('20', '22', '暂无', '未知', null, null, '暂无数据', null, null, null, null, null);

-- ----------------------------
-- Table structure for rz_check
-- ----------------------------
DROP TABLE IF EXISTS `rz_check`;
CREATE TABLE `rz_check` (
  `rcid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `huid` int(11) NOT NULL COMMENT '审核人',
  `isok` int(11) NOT NULL DEFAULT '0' COMMENT '是否通过',
  `excuse` varchar(300) DEFAULT NULL COMMENT '审核理由',
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`rcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rz_check
-- ----------------------------

-- ----------------------------
-- Table structure for shborrow
-- ----------------------------
DROP TABLE IF EXISTS `shborrow`;
CREATE TABLE `shborrow` (
  `shid` int(11) NOT NULL AUTO_INCREMENT,
  `huid` int(11) NOT NULL COMMENT '审核人id',
  `isok` int(11) DEFAULT '0' COMMENT '审核是否通过',
  `excuse` varchar(255) DEFAULT NULL COMMENT '理由',
  `cktime` datetime DEFAULT NULL COMMENT '审核时间',
  `baid` int(11) NOT NULL COMMENT '借款ID',
  PRIMARY KEY (`shid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shborrow
-- ----------------------------
INSERT INTO `shborrow` VALUES ('1', '1', '0', '同意', '2018-01-20 08:37:22', '1');
INSERT INTO `shborrow` VALUES ('2', '1', '0', '1', '2018-01-20 11:02:27', '2');
INSERT INTO `shborrow` VALUES ('3', '1', '0', '1', '2018-01-20 11:02:30', '3');
INSERT INTO `shborrow` VALUES ('4', '1', '0', '1', '2018-01-20 11:02:32', '4');
INSERT INTO `shborrow` VALUES ('5', '1', '0', '1', '2018-01-20 11:02:34', '5');
INSERT INTO `shborrow` VALUES ('6', '1', '0', '1', '2018-01-20 11:02:37', '6');
INSERT INTO `shborrow` VALUES ('7', '1', '0', '1', '2018-01-20 11:02:39', '7');
INSERT INTO `shborrow` VALUES ('8', '1', '0', '1', '2018-01-20 11:02:40', '8');
INSERT INTO `shborrow` VALUES ('9', '1', '0', '1', '2018-01-20 11:02:44', '9');
INSERT INTO `shborrow` VALUES ('10', '1', '0', '1', '2018-01-20 11:02:47', '10');
INSERT INTO `shborrow` VALUES ('11', '1', '1', 'juue', '2018-01-22 20:39:03', '12');
INSERT INTO `shborrow` VALUES ('12', '1', '1', '拒绝', '2018-01-22 20:41:19', '13');

-- ----------------------------
-- Table structure for skb
-- ----------------------------
DROP TABLE IF EXISTS `skb`;
CREATE TABLE `skb` (
  `skid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `juid` int(11) NOT NULL COMMENT '借款人id',
  `ybx` decimal(7,2) DEFAULT '0.00' COMMENT '应收本息',
  `rbx` decimal(7,2) DEFAULT '0.00' COMMENT '已收本息',
  `ylx` decimal(7,2) DEFAULT '0.00' COMMENT '应收利息',
  `rlx` decimal(7,2) DEFAULT '0.00' COMMENT '已收利息',
  `ybj` decimal(7,2) DEFAULT '0.00' COMMENT '应收本金',
  `rbj` decimal(7,2) DEFAULT '0.00' COMMENT '已收本金',
  `rnum` int(11) DEFAULT '0' COMMENT '已还期数',
  `tnum` int(11) DEFAULT '0' COMMENT '总期数',
  `sktime` datetime DEFAULT NULL COMMENT '收款时间',
  `baid` int(11) NOT NULL COMMENT '借款id',
  `resint1` int(11) DEFAULT NULL,
  `resint2` int(11) DEFAULT NULL,
  `resstr1` varchar(50) DEFAULT NULL,
  `resstr2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`skid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of skb
-- ----------------------------
INSERT INTO `skb` VALUES ('1', '17', '18', '10635.35', '10635.35', '1125.00', '1125.00', '9510.35', '9510.35', '2', '9', '2018-01-21 20:34:28', '1', null, null, null, null);
INSERT INTO `skb` VALUES ('2', '17', '18', '10635.35', '10635.35', '1006.12', '1006.12', '9629.23', '9629.23', '2', '9', '2018-01-21 20:34:28', '1', null, null, null, null);
INSERT INTO `skb` VALUES ('3', '17', '18', '10635.35', '0.00', '885.76', '0.00', '9749.59', '0.00', '2', '9', '2018-04-21 20:34:28', '1', null, null, null, null);
INSERT INTO `skb` VALUES ('4', '17', '18', '10635.35', '0.00', '763.89', '0.00', '9871.46', '0.00', '2', '9', '2018-05-21 20:34:28', '1', null, null, null, null);
INSERT INTO `skb` VALUES ('5', '17', '18', '10635.35', '0.00', '640.49', '0.00', '9994.86', '0.00', '2', '9', '2018-06-21 20:34:28', '1', null, null, null, null);
INSERT INTO `skb` VALUES ('6', '17', '18', '10635.35', '0.00', '515.56', '0.00', '10119.79', '0.00', '2', '9', '2018-07-21 20:34:28', '1', null, null, null, null);
INSERT INTO `skb` VALUES ('7', '17', '18', '10635.35', '0.00', '389.06', '0.00', '10246.29', '0.00', '2', '9', '2018-08-21 20:34:28', '1', null, null, null, null);
INSERT INTO `skb` VALUES ('8', '17', '18', '10635.35', '0.00', '260.98', '0.00', '10374.37', '0.00', '2', '9', '2018-09-21 20:34:28', '1', null, null, null, null);
INSERT INTO `skb` VALUES ('9', '17', '18', '10635.35', '0.00', '131.30', '0.00', '10504.05', '0.00', '2', '9', '2018-10-21 20:34:28', '1', null, null, null, null);

-- ----------------------------
-- Table structure for sway
-- ----------------------------
DROP TABLE IF EXISTS `sway`;
CREATE TABLE `sway` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `way` varchar(200) NOT NULL COMMENT '还款方式',
  `fw` varchar(200) NOT NULL COMMENT '算法',
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sway
-- ----------------------------
INSERT INTO `sway` VALUES ('1', '等额本息', '(a+a*b)/c', '0');
INSERT INTO `sway` VALUES ('2', '等额本金', '11', '0');
INSERT INTO `sway` VALUES ('3', '每月付息到期还本', '22', '0');
INSERT INTO `sway` VALUES ('4', '一次性还本付息', '33', '0');

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `kid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '券名称',
  `type` int(11) NOT NULL DEFAULT '0',
  `tkmoney` decimal(7,2) NOT NULL,
  `tktime` datetime DEFAULT '0000-00-00 00:00:00',
  `tnum` int(11) DEFAULT '0',
  `isvip` int(11) DEFAULT '0',
  PRIMARY KEY (`kid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES ('1', '专享优惠券', '1', '100.00', '2018-01-18 18:29:19', '7', '1');
INSERT INTO `ticket` VALUES ('22', '普通用户专享', '0', '50.00', '2018-01-22 20:15:04', '2', '0');

-- ----------------------------
-- Table structure for tx_check
-- ----------------------------
DROP TABLE IF EXISTS `tx_check`;
CREATE TABLE `tx_check` (
  `tcid` int(11) NOT NULL AUTO_INCREMENT,
  `txid` int(11) NOT NULL COMMENT '提现id',
  `huid` int(11) NOT NULL COMMENT '审核人id',
  `isok` int(11) NOT NULL DEFAULT '0' COMMENT '是否通过',
  `excuse` varchar(300) DEFAULT NULL COMMENT '审核理由',
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`tcid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tx_check
-- ----------------------------
INSERT INTO `tx_check` VALUES ('1', '2', '1', '0', '同意', '2018-01-21 19:22:26');
INSERT INTO `tx_check` VALUES ('2', '6', '1', '0', 'ok', '2018-01-23 10:52:18');

-- ----------------------------
-- Table structure for tzb
-- ----------------------------
DROP TABLE IF EXISTS `tzb`;
CREATE TABLE `tzb` (
  `tzid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `juid` int(11) NOT NULL COMMENT '借款人id',
  `money` decimal(7,2) NOT NULL COMMENT '投资金额',
  `tztime` datetime DEFAULT NULL COMMENT '投资时间',
  `nprofit` float(5,2) DEFAULT NULL COMMENT '利率',
  `cpname` varchar(50) NOT NULL COMMENT '产品名',
  `baid` int(11) NOT NULL COMMENT '借款id',
  `resint1` int(11) DEFAULT NULL,
  `resint2` int(11) DEFAULT NULL,
  `resint3` int(50) DEFAULT NULL,
  `resint4` int(50) DEFAULT NULL,
  PRIMARY KEY (`tzid`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tzb
-- ----------------------------
INSERT INTO `tzb` VALUES ('6', '17', '18', '90000.00', '2018-01-21 20:34:28', '15.00', 'PJ2018BZ0001', '1', '9', '1', null, null);
INSERT INTO `tzb` VALUES ('7', '17', '18', '270.00', '2018-01-22 11:30:18', '12.00', 'PJ2018BZ0003', '3', '6', '1', null, null);
INSERT INTO `tzb` VALUES ('8', '17', '18', '100.00', '2018-01-22 11:30:44', '12.00', 'PJ2018BZ0003', '3', '6', '1', '1', null);
INSERT INTO `tzb` VALUES ('9', '17', '18', '100.00', '2018-01-22 11:33:43', '12.00', 'PJ2018BZ0003', '3', '6', '1', null, null);
INSERT INTO `tzb` VALUES ('10', '17', '18', '100.00', '2018-01-22 14:54:21', '12.00', 'PJ2018BZ0003', '3', '6', '1', '3', null);
INSERT INTO `tzb` VALUES ('11', '17', '18', '100.00', '2018-01-22 16:40:44', '12.00', 'PJ2018BZ0003', '3', '6', '1', null, null);
INSERT INTO `tzb` VALUES ('12', '17', '18', '10000.00', '2018-01-22 16:40:57', '12.00', 'PJ2018BZ0003', '3', '6', '1', null, null);
INSERT INTO `tzb` VALUES ('13', '17', '18', '100.00', '2018-01-22 16:59:57', '12.00', 'PJ2018BZ0003', '3', '6', '1', '4', null);
INSERT INTO `tzb` VALUES ('14', '17', '18', '100.00', '2018-01-22 17:00:37', '12.00', 'PJ2018BZ0003', '3', '6', '1', '5', null);
INSERT INTO `tzb` VALUES ('15', '17', '18', '2000.00', '2018-01-22 17:00:51', '12.00', 'PJ2018BZ0003', '3', '6', '1', '10', null);
INSERT INTO `tzb` VALUES ('16', '17', '18', '130.00', '2018-01-22 19:28:16', '12.00', 'PJ2018BZ0003', '3', '6', '1', null, null);
INSERT INTO `tzb` VALUES ('17', '17', '18', '2000.00', '2018-01-22 19:28:55', '12.00', 'PJ2018BZ0003', '3', '6', '1', '11', null);
INSERT INTO `tzb` VALUES ('18', '17', '18', '2000.00', '2018-01-22 19:33:37', '12.00', 'PJ2018BZ0003', '3', '6', '1', '12', null);
INSERT INTO `tzb` VALUES ('19', '17', '18', '2000.00', '2018-01-22 19:35:47', '12.00', 'PJ2018BZ0003', '3', '6', '1', '13', null);
INSERT INTO `tzb` VALUES ('21', '17', '18', '100.00', '2018-01-22 20:19:28', '12.00', 'PJ2018BZ0003', '3', '6', '1', '28', null);
INSERT INTO `tzb` VALUES ('22', '17', '18', '100.00', '2018-01-22 20:19:44', '12.00', 'PJ2018BZ0003', '3', '6', '1', null, null);
INSERT INTO `tzb` VALUES ('23', '17', '18', '100.00', '2018-01-22 20:20:35', '12.00', 'PJ2018BZ0003', '3', '6', '1', '29', null);
INSERT INTO `tzb` VALUES ('24', '17', '18', '100.00', '2018-01-23 10:23:57', '12.00', 'PJ2018BZ0005', '5', '6', '1', '30', null);
INSERT INTO `tzb` VALUES ('25', '17', '18', '100.00', '2018-01-23 10:24:57', '12.00', 'PJ2018BZ0005', '5', '6', '1', '31', null);
INSERT INTO `tzb` VALUES ('33', '22', '18', '10000.00', '2018-01-23 10:56:05', '12.00', 'PJ2018BZ0003', '3', '6', '1', '32', null);
INSERT INTO `tzb` VALUES ('35', '22', '18', '10000.00', '2018-01-23 10:56:29', '12.00', 'PJ2018BZ0003', '3', '6', '1', null, null);
INSERT INTO `tzb` VALUES ('36', '22', '18', '10000.00', '2018-01-23 10:56:34', '12.00', 'PJ2018BZ0003', '3', '6', '1', null, null);
INSERT INTO `tzb` VALUES ('37', '22', '18', '10000.00', '2018-01-23 10:56:36', '12.00', 'PJ2018BZ0003', '3', '6', '1', null, null);
INSERT INTO `tzb` VALUES ('38', '22', '18', '10000.00', '2018-01-23 10:56:38', '12.00', 'PJ2018BZ0003', '3', '6', '1', null, null);
INSERT INTO `tzb` VALUES ('39', '22', '18', '10000.00', '2018-01-23 10:56:40', '12.00', 'PJ2018BZ0003', '3', '6', '1', null, null);
INSERT INTO `tzb` VALUES ('40', '22', '18', '10000.00', '2018-01-23 10:56:43', '12.00', 'PJ2018BZ0003', '3', '6', '1', null, null);
INSERT INTO `tzb` VALUES ('41', '22', '18', '10000.00', '2018-01-23 10:56:45', '12.00', 'PJ2018BZ0003', '3', '6', '1', null, null);
INSERT INTO `tzb` VALUES ('43', '22', '18', '100.00', '2018-01-23 10:57:07', '12.00', 'PJ2018BZ0003', '3', '6', '1', null, null);
INSERT INTO `tzb` VALUES ('44', '22', '18', '100.00', '2018-01-23 10:57:09', '12.00', 'PJ2018BZ0003', '3', '6', '1', null, null);
INSERT INTO `tzb` VALUES ('45', '22', '18', '100.00', '2018-01-23 10:57:11', '12.00', 'PJ2018BZ0003', '3', '6', '1', null, null);
INSERT INTO `tzb` VALUES ('46', '22', '18', '100.00', '2018-01-23 10:57:12', '12.00', 'PJ2018BZ0003', '3', '6', '1', null, null);
INSERT INTO `tzb` VALUES ('47', '22', '18', '100.00', '2018-01-23 10:57:13', '12.00', 'PJ2018BZ0003', '3', '6', '1', null, null);
INSERT INTO `tzb` VALUES ('48', '22', '18', '100.00', '2018-01-23 10:57:14', '12.00', 'PJ2018BZ0003', '3', '6', '1', null, null);
INSERT INTO `tzb` VALUES ('52', '17', '18', '15656.00', '2018-02-28 23:07:36', '12.00', 'PJ2018BZ0005', '5', '6', '1', null, null);
INSERT INTO `tzb` VALUES ('53', '17', '18', '2312.00', '2018-02-28 23:07:44', '12.00', 'PJ2018BZ0005', '5', '6', '1', null, null);
INSERT INTO `tzb` VALUES ('54', '17', '18', '80000.00', '2018-02-28 23:07:50', '12.00', 'PJ2018BZ0005', '5', '6', '1', null, null);
INSERT INTO `tzb` VALUES ('56', '17', '18', '1700.00', '2018-02-28 23:08:17', '12.00', 'PJ2018BZ0005', '5', '6', '1', null, null);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(36) DEFAULT 'user',
  `upwd` varchar(200) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `tzm` int(11) DEFAULT NULL COMMENT '推荐码',
  `zpwd` varchar(200) DEFAULT NULL COMMENT '支付密码',
  `idtype` varchar(30) DEFAULT '身份证' COMMENT '证件类型',
  `idno` varchar(50) DEFAULT NULL COMMENT '证件号',
  `email` varchar(100) DEFAULT NULL,
  `rname` varchar(36) DEFAULT NULL COMMENT '真实姓名',
  `tid` int(11) DEFAULT NULL COMMENT '推荐人id',
  `face` varchar(500) DEFAULT '/static/uploads/user/head.jpg' COMMENT '头像',
  `sex` varchar(2) DEFAULT '男' COMMENT '性别',
  `isvip` int(11) DEFAULT '0',
  `resint1` datetime DEFAULT NULL COMMENT '预留int1',
  `resint2` int(11) DEFAULT NULL COMMENT '预留int2',
  `resstr1` varchar(50) DEFAULT NULL COMMENT '预留String1',
  `resstr2` varchar(50) DEFAULT NULL COMMENT '预留String2',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uk_user` (`phone`),
  UNIQUE KEY `uk_email` (`email`),
  UNIQUE KEY `uk_idno1` (`idno`),
  UNIQUE KEY `uk_tzm` (`tzm`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('17', '咸菜大佬', '4QrcOUm6Wau+VuBX8g+IPg==', '17607974221', null, '123456', '身份证', '360781199902212950', '1151757358@qq.com', '刘金泳', null, '/static/uploads/user/head.jpg', '男', '1', '2018-01-19 20:42:18', null, '382761', '');
INSERT INTO `t_user` VALUES ('18', '蛤蛤蛤11', '/OqSD3QStdp74M9CuMk3WQ==', '13879735517', null, '1234561', '身份证', '360781199902212951', '13879735517@qq.com', '咸菜1', null, '/static/uploads/user/head.jpg', '女', '0', '2018-01-20 08:12:46', null, '471826', '382761');
INSERT INTO `t_user` VALUES ('21', 'user', '4QrcOUm6Wau+VuBX8g+IPg==', '15779862212', null, null, '身份证', null, null, null, null, '/static/uploads/user/head.jpg', '男', '0', '2018-07-01 00:00:55', null, '246593', '');
INSERT INTO `t_user` VALUES ('22', 'user', '4QrcOUm6Wau+VuBX8g+IPg==', '15779862103', null, '123456', '身份证', '36072610070101', '123@qq.com', '叶小鹏', null, '/static/uploads/user/head.jpg', '男', '1', '2018-01-23 10:44:49', null, '275896', '');

-- ----------------------------
-- Table structure for usermoney
-- ----------------------------
DROP TABLE IF EXISTS `usermoney`;
CREATE TABLE `usermoney` (
  `umid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `zmoney` decimal(15,2) DEFAULT '0.00' COMMENT '总资产',
  `kymoney` decimal(15,2) DEFAULT '0.00' COMMENT '可用余额',
  `symoney` decimal(15,2) DEFAULT '0.00' COMMENT '收益总额',
  `tzmoney` decimal(15,2) DEFAULT '0.00' COMMENT '投资总额',
  `djmoney` decimal(15,2) DEFAULT '0.00' COMMENT '冻结总额',
  `dsmoney` decimal(15,2) DEFAULT '0.00' COMMENT '待收总额',
  `jlmoney` decimal(15,2) DEFAULT '0.00' COMMENT '奖励总额',
  PRIMARY KEY (`umid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usermoney
-- ----------------------------
INSERT INTO `usermoney` VALUES ('17', '17', '1685889.49', '1139160.00', '150032.59', '549868.00', '0.00', '537839.89', '140790.00');
INSERT INTO `usermoney` VALUES ('18', '18', '619832.65', '439364.65', '0.00', '0.00', '180468.00', '0.00', '0.00');
INSERT INTO `usermoney` VALUES ('19', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `usermoney` VALUES ('20', '20', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `usermoney` VALUES ('21', '21', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `usermoney` VALUES ('22', '22', '10003467.46', '9920023.00', '6874.46', '80600.00', '0.00', '83444.46', '4030.00');

-- ----------------------------
-- Table structure for user_ticket
-- ----------------------------
DROP TABLE IF EXISTS `user_ticket`;
CREATE TABLE `user_ticket` (
  `ukid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `kid` int(11) NOT NULL COMMENT '券id',
  `tktime` datetime NOT NULL COMMENT '领券时间',
  PRIMARY KEY (`ukid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_ticket
-- ----------------------------
INSERT INTO `user_ticket` VALUES ('33', '22', '22', '2018-01-23 10:58:36');

-- ----------------------------
-- Table structure for ydata
-- ----------------------------
DROP TABLE IF EXISTS `ydata`;
CREATE TABLE `ydata` (
  `yid` int(11) NOT NULL AUTO_INCREMENT,
  `tmoney` decimal(20,2) DEFAULT '0.00' COMMENT '交易总额',
  `mmoney` decimal(7,2) DEFAULT '0.00' COMMENT '月交易总额',
  `tuser` int(11) DEFAULT '0' COMMENT '总用户数',
  `muser` int(11) DEFAULT '0' COMMENT '月注册数',
  `ttzno` int(11) DEFAULT '0' COMMENT '总投资人数',
  `mtzno` int(11) DEFAULT '0' COMMENT '月投资人数',
  `tdkno` int(11) DEFAULT '0' COMMENT '总贷款人数',
  `mdkno` int(11) DEFAULT '0' COMMENT '月贷款人数',
  `tdkbno` int(11) DEFAULT '0' COMMENT '总贷款笔数',
  `mdkbno` int(11) DEFAULT '0' COMMENT '月贷款笔数',
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`yid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ydata
-- ----------------------------
INSERT INTO `ydata` VALUES ('4', '109300.00', '0.00', '4', '0', '1', '0', '1', '1', '9', '9', '2018-01-28 23:00:06');
INSERT INTO `ydata` VALUES ('7', '190100.00', '0.00', '4', '0', '2', '0', '1', '1', '9', '9', '2018-02-28 23:00:00');
