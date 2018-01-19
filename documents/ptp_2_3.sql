
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bankcard`       银行卡
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
  PRIMARY KEY (`bcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bankcard
-- ----------------------------

-- ----------------------------
-- Table structure for `borrowapply`        申请借款
-- ----------------------------
DROP TABLE IF EXISTS `borrowapply`;
CREATE TABLE `borrowapply` (
  `baid` int(11) NOT NULL AUTO_INCREMENT,
  `rname` varchar(50) NOT NULL COMMENT '真实姓名',
  `money` decimal(7,2) NOT NULL COMMENT '申请金额',
  `uid` int(11) NOT NULL COMMENT '借款人id',
  `bzid` int(11) NOT NULL COMMENT '标种id',
  `cktime` datetime DEFAULT NULL COMMENT '审核时间',
  `ckstatus` int(11) DEFAULT '0' COMMENT '审核状态',
  `type` int(11) NOT NULL COMMENT '借款类型',
  `term` int(11) NOT NULL COMMENT '借款期限',
  `deadline` datetime NOT NULL COMMENT '截止时间',
  `resint1` int(11) DEFAULT NULL,
  `resint2` int(11) DEFAULT NULL,
  `resstr1` varchar(50) DEFAULT NULL,
  `resstr2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`baid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borrowapply
-- ----------------------------

-- ----------------------------
-- Table structure for `borrowdetail`       借款详情
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
  `suggest` varchar(300) DEFAULT NULL COMMENT '借款人介绍',
  `xmdes` varchar(300) DEFAULT NULL COMMENT '项目描述',
  `guarantee` varchar(200) DEFAULT NULL COMMENT '保障措施',
  `money` decimal(7,2) NOT NULL COMMENT '金额',
  `nprofit` float(3,2) NOT NULL COMMENT '年化收益',
  `way` varchar(20) NOT NULL COMMENT '收益方式',
  `cpname` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `baid` int(11) NOT NULL COMMENT '借款id',
  `resint1` int(11) DEFAULT NULL,
  `resint2` int(11) DEFAULT NULL,
  `resstr1` varchar(50) DEFAULT NULL,
  `resstr2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`bdid`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borrowdetail
-- ----------------------------

-- ----------------------------
-- Table structure for `bz`       标种
-- ----------------------------
DROP TABLE IF EXISTS `bz`;
CREATE TABLE `bz` (
  `bzid` int(11) NOT NULL AUTO_INCREMENT,
  `bzname` varchar(30) NOT NULL COMMENT '标种名称',
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`bzid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bz
-- ----------------------------

-- ----------------------------
-- Table structure for `dxmodel`        短信模板
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
-- Table structure for `dynamic`        公司动态
-- ----------------------------
DROP TABLE IF EXISTS `dynamic`;
CREATE TABLE `dynamic` (
  `dyid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` varchar(500) NOT NULL,
  `pic` varchar(500) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`dyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dynamic
-- ----------------------------

-- ----------------------------
-- Table structure for `friend`       合作伙伴
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `furl` varchar(300) NOT NULL,
  `fpic` varchar(500) NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friend
-- ----------------------------

-- ----------------------------
-- Table structure for `hkb`        还款表
-- ----------------------------
DROP TABLE IF EXISTS `hkb`;
CREATE TABLE `hkb` (
  `hkid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '借款人id',
  `rname` varchar(30) NOT NULL COMMENT '真实姓名',
  `cpname` varchar(50) NOT NULL COMMENT '产品名',
  `rnum` int(11) DEFAULT NULL COMMENT '已还期数',
  `tnum` int(11) DEFAULT NULL COMMENT '总期数',
  `ytime` datetime NOT NULL COMMENT '应还时间',
  `rtime` datetime DEFAULT NULL COMMENT '实际还款时间',
  `bzname` varchar(255) NOT NULL COMMENT '标种',
  `ybx` decimal(7,2) DEFAULT NULL COMMENT '应还本息',
  `rbx` decimal(7,2) DEFAULT NULL COMMENT '已还本息',
  `ylx` decimal(7,2) DEFAULT NULL COMMENT '应还利息',
  `rlx` decimal(7,2) DEFAULT NULL COMMENT '已还利息',
  `ybj` decimal(7,2) DEFAULT NULL COMMENT '应还本金',
  `rbj` decimal(7,2) DEFAULT NULL COMMENT '已还本金',
  `yfc` decimal(7,2) DEFAULT NULL COMMENT '应还罚息',
  `rfc` decimal(7,2) DEFAULT NULL COMMENT '已还罚息',
  `yucount` int(11) DEFAULT NULL COMMENT '逾期次数',
  `status` int(11) DEFAULT '0' COMMENT '还款状态',
  `baid` int(11) NOT NULL COMMENT '借款id',
  `yustartime` datetime DEFAULT NULL COMMENT '逾期执行时间',
  `huid` int(11) NOT NULL COMMENT '贷后负责人',
  `resint1` int(11) DEFAULT NULL,
  `resint2` int(11) DEFAULT NULL,
  `resstr1` varchar(50) DEFAULT NULL,
  `resstr2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`hkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hkb
-- ----------------------------

-- ----------------------------
-- Table structure for `home`       首页信息
-- ----------------------------
DROP TABLE IF EXISTS `home`;
CREATE TABLE `home` (
  `hid` int(11) NOT NULL AUTO_INCREMENT,
  `pic1` varchar(500) DEFAULT NULL,
  `url1` varchar(100) DEFAULT NULL,
  `created_time`  DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of home
-- ----------------------------

-- ----------------------------
-- Table structure for `huser`        后台用户
-- ----------------------------
DROP TABLE IF EXISTS `huser`;
CREATE TABLE `huser` (
  `huid` int(11) NOT NULL AUTO_INCREMENT,
  `rname` varchar(50) NOT NULL,
  `sex` varchar(4) DEFAULT '',
  `phone` varchar(15) NOT NULL,
  `huname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `resint1` int(11) DEFAULT NULL,
  `resint2` int(11) DEFAULT NULL,
  `resstr1` varchar(50) DEFAULT NULL,
  `resstr2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`huid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of huser
-- ----------------------------

-- ----------------------------
-- Table structure for `jklx`       借款类型
-- ----------------------------
DROP TABLE IF EXISTS `jklx`;
CREATE TABLE `jklx` (
  `lxid` int(11) NOT NULL AUTO_INCREMENT,
  `lxname` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`lxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jklx
-- ----------------------------

-- ----------------------------
-- Table structure for `jur`      权限
-- ----------------------------
DROP TABLE IF EXISTS `jur`;
CREATE TABLE `jur` (
  `jid` int(11) NOT NULL AUTO_INCREMENT,
  `jurl` varchar(200) NOT NULL COMMENT '权限URL',
  `content` varchar(300) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`jid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jur
-- ----------------------------

-- ----------------------------
-- Table structure for `letter`       站内信
-- ----------------------------
DROP TABLE IF EXISTS `letter`;
CREATE TABLE `letter` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` varchar(500) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of letter
-- ----------------------------

-- ----------------------------
-- Table structure for `log_cz`       充值记录表
-- ----------------------------
DROP TABLE IF EXISTS `log_cz`;
CREATE TABLE `log_cz` (
  `czid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `bankcard` varchar(20) NOT NULL COMMENT '银行卡号',
  `banktype` varchar(50) NOT NULL COMMENT '银行卡类型',
  `money` decimal(7,2) NOT NULL COMMENT '金额',
  `created_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`czid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_cz
-- ----------------------------

-- ----------------------------
-- Table structure for `log_money`        资金流向记录表
-- ----------------------------
DROP TABLE IF EXISTS `log_money`;
CREATE TABLE `log_money` (
  `lmid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `type` int(11) NOT NULL COMMENT '类型',
  `income` decimal(7,2) DEFAULT NULL COMMENT '收入',
  `outlay` decimal(7,2) DEFAULT NULL COMMENT '支出',
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`lmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_money
-- ----------------------------

-- ----------------------------
-- Table structure for `log_tx`       提现记录
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_tx
-- ----------------------------

-- ----------------------------
-- Table structure for `media`        媒体报道
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` varchar(300) NOT NULL,
  `pic` varchar(500) DEFAULT NULL,
  `url` varchar(150) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of media
-- ----------------------------

-- ----------------------------
-- Table structure for `notice`       最新公告
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` TEXT NOT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for `option`       用户反馈表
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
-- Table structure for `recommend`        推荐管理
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
-- Table structure for `reward`       投资总额奖励表
-- ----------------------------
DROP TABLE IF EXISTS `reward`;
CREATE TABLE `reward` (
  `rwid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `tmoney` decimal(7,2) DEFAULT NULL COMMENT '投资总额',
  `money` decimal(7,2) DEFAULT NULL COMMENT '奖励金额',
  `status` varchar(255) DEFAULT '0',
  `reward_time` datetime DEFAULT NULL COMMENT '奖励发放时间',
  PRIMARY KEY (`rwid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reward
-- ----------------------------

-- ----------------------------
-- Table structure for `reward_setting`       投资奖励设置表
-- ----------------------------
DROP TABLE IF EXISTS `reward_setting`;
CREATE TABLE `reward_setting` (
  `rwsid` int(11) NOT NULL AUTO_INCREMENT,
  `minmoney` decimal(7,2) NOT NULL,
  `maxmoney` decimal(7,2) NOT NULL,
  `percent` double NOT NULL COMMENT '奖励百分比',
  PRIMARY KEY (`rwsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reward_setting
-- ----------------------------

-- ----------------------------
-- Table structure for `role`       角色
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0',
  `rname` varchar(50) NOT NULL,
  `content` varchar(100) NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for `rolejur`      角色权限
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
-- Table structure for `roleuser`       用户角色
-- ----------------------------
DROP TABLE IF EXISTS `roleuser`;
CREATE TABLE `roleuser` (
  `ruid` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `huid` int(11) NOT NULL,
  PRIMARY KEY (`ruid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roleuser
-- ----------------------------

-- ----------------------------
-- Table structure for `rzvip`        认证表
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rzvip
-- ----------------------------

-- ----------------------------
-- Table structure for `rz_check`       认证审核
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
-- Table structure for `shborrow`       借款审核
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shborrow
-- ----------------------------

-- ----------------------------
-- Table structure for `skb`        收款表
-- ----------------------------
DROP TABLE IF EXISTS `skb`;
CREATE TABLE `skb` (
  `skid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `juid` int(11) NOT NULL COMMENT '借款人id',
  `ybx` decimal(7,2) DEFAULT NULL COMMENT '应收本息',
  `rbx` decimal(7,2) DEFAULT NULL COMMENT '已收本息',
  `ylx` decimal(7,2) DEFAULT NULL COMMENT '应收利息',
  `rlx` decimal(7,2) DEFAULT NULL COMMENT '已收利息',
  `ybj` decimal(7,2) DEFAULT NULL COMMENT '应收本金',
  `rbj` decimal(7,2) DEFAULT NULL COMMENT '已收本金',
  `rnum` int(11) DEFAULT NULL COMMENT '已还期数',
  `tnum` int(11) DEFAULT NULL COMMENT '总期数',
  `sktime` datetime DEFAULT NULL COMMENT '收款时间',
  `baid` int(11) NOT NULL COMMENT '借款id',
  `resint1` int(11) DEFAULT NULL,
  `resint2` int(11) DEFAULT NULL,
  `resstr1` varchar(50) DEFAULT NULL,
  `resstr2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`skid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of skb
-- ----------------------------

-- ----------------------------
-- Table structure for `sway`       换款方式
-- ----------------------------
DROP TABLE IF EXISTS `sway`;
CREATE TABLE `sway` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `way` varchar(200) NOT NULL COMMENT '还款方式',
  `fw` varchar(200) NOT NULL COMMENT '算法',
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sway
-- ----------------------------

-- ----------------------------
-- Table structure for `ticket`       券
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ticket
-- ----------------------------

-- ----------------------------
-- Table structure for `tx_ckeck`       提现审核
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tx_check`
-- ----------------------------

-- ----------------------------
-- Table structure for `tzb`        投资表
-- ----------------------------
DROP TABLE IF EXISTS `tzb`;
CREATE TABLE `tzb` (
  `tzid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `juid` int(11) NOT NULL COMMENT '借款人id',
  `money` decimal(7,2) NOT NULL COMMENT '投资金额',
  `tztime` datetime DEFAULT NULL COMMENT '投资时间',
  `nprofit` float(3,2) DEFAULT NULL COMMENT '利率',
  `cpname` varchar(50) NOT NULL COMMENT '产品名',
  `baid` int(11) NOT NULL COMMENT '借款id',
  `resint1` int(11) DEFAULT NULL,
  `resint2` int(11) DEFAULT NULL,
  `resstr1` varchar(50) DEFAULT NULL,
  `resstr2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tzid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tzb
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user`       前台用户
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(36) DEFAULT NULL,
  `upwd` varchar(200) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `tzm` int(11) DEFAULT NULL COMMENT '推荐码',
  `zpwd` varchar(200) DEFAULT NULL COMMENT '支付密码',
  `idtype` varchar(30) DEFAULT NULL COMMENT '证件类型',
  `idno` varchar(50) DEFAULT NULL COMMENT '证件号',
  `email` varchar(100) DEFAULT NULL,
  `rname` varchar(36) DEFAULT NULL COMMENT '真实姓名',
  `tid` int(11) DEFAULT NULL COMMENT '推荐人id',
  `face` varchar(500) DEFAULT NULL COMMENT '头像',
  `sex` varchar(2) DEFAULT '男' COMMENT '性别',
  `isvip` int(11) DEFAULT '0',
  `resint1` int(11) DEFAULT NULL COMMENT '预留int1',
  `resint2` int(11) DEFAULT NULL COMMENT '预留int2',
  `resstr1` varchar(50) DEFAULT NULL COMMENT '预留String1',
  `resstr2` varchar(50) DEFAULT NULL COMMENT '预留String2',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------

-- ----------------------------
-- Table structure for `usermoney`        用户资金
-- ----------------------------
DROP TABLE IF EXISTS `usermoney`;
CREATE TABLE `usermoney` (
  `umid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `zmoney` decimal(7,2) DEFAULT NULL COMMENT '总资产',
  `kymoney` decimal(7,2) DEFAULT NULL COMMENT '可用余额',
  `symoney` decimal(7,2) DEFAULT NULL COMMENT '收益总额',
  `tzmoney` decimal(7,2) DEFAULT NULL COMMENT '投资总额',
  `djmoney` decimal(7,2) DEFAULT NULL COMMENT '冻结总额',
  `dsmoney` decimal(7,2) DEFAULT NULL COMMENT '待收总额',
  `jlmoney` decimal(7,2) DEFAULT NULL COMMENT '奖励总额',
  PRIMARY KEY (`umid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usermoney
-- ----------------------------

-- ----------------------------
-- Table structure for `user_ticket`        领券表
-- ----------------------------
DROP TABLE IF EXISTS `user_ticket`;
CREATE TABLE `user_ticket` (
  `ukid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `kid` int(11) NOT NULL COMMENT '券id',
  `tktime` datetime NOT NULL COMMENT '领券时间',
  PRIMARY KEY (`ukid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_ticket
-- ----------------------------

-- ----------------------------
-- Table structure for `ydata`        运营数据
-- ----------------------------
DROP TABLE IF EXISTS `ydata`;
CREATE TABLE `ydata` (
  `yid` int(11) NOT NULL AUTO_INCREMENT,
  `tmoney` decimal(7,2) NOT NULL COMMENT '交易总额',
  `mmoney` decimal(7,2) NOT NULL COMMENT '月交易总额',
  `tuser` int(11) NOT NULL COMMENT '总用户数',
  `muser` int(11) NOT NULL COMMENT '月注册数',
  `ttzno` int(11) NOT NULL COMMENT '总投资人数',
  `mtzno` int(11) NOT NULL COMMENT '月投资人数',
  `tdkno` int(11) NOT NULL COMMENT '总贷款人数',
  `mdkno` int(11) NOT NULL COMMENT '月贷款人数',
  `tdkbno` int(11) NOT NULL COMMENT '总贷款笔数',
  `mdkbno` int(11) NOT NULL COMMENT '月贷款笔数',
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`yid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ydata
-- ----------------------------

alter table t_user add constraint uk_user unique(phone);
alter table t_user add constraint uk_email unique(email);
alter table t_user add constraint uk_idno1 unique(idno);
alter table huser add constraint uk_huser unique(phone);
alter table huser add constraint uk_hemail unique(email);
alter table bankcard add constraint uk_bankcard unique(cardno);
alter table bankcard add constraint uk_idno unique(idno);
alter table log_cz add constraint uk_bankcard1 unique(bankcard);
alter table log_tx add constraint uk_bankcard2 unique(bankcard);
alter table t_user add constraint uk_tzm unique(tzm);
