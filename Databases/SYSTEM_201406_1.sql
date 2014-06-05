# -----------------------------------------------------------
# 邀99大学恋爱网管理数据库
# Blog: http://www.feiruan.net
# Type: 系统自动备份
# Description:当前SQL文件包含了表：mxczhyk_access、mxczhyk_activity、mxczhyk_activityapply、mxczhyk_admin、mxczhyk_advertisement、mxczhyk_article、mxczhyk_article_class、mxczhyk_article_discuss、mxczhyk_attention、mxczhyk_business、mxczhyk_code、mxczhyk_failedlogin、mxczhyk_findpass、mxczhyk_gift、mxczhyk_gift_record、mxczhyk_gift_type、mxczhyk_guestbook、mxczhyk_invites、mxczhyk_label、mxczhyk_link、mxczhyk_marriage_term、mxczhyk_member、mxczhyk_member_detail、mxczhyk_member_spaces、mxczhyk_menu、mxczhyk_message、mxczhyk_mood、mxczhyk_node、mxczhyk_notice、mxczhyk_onlinetime、mxczhyk_payment、mxczhyk_payrecord、mxczhyk_photo、mxczhyk_photo_detail、mxczhyk_privatemessage、mxczhyk_read、mxczhyk_role、mxczhyk_role_user、mxczhyk_success_object、mxczhyk_vip_space、mxczhyk_viptype、mxczhyk_vote、mxczhyk_vote_log、mxczhyk_vote_option、mxczhyk_webinfo、mxczhyk_words的结构信息，表：mxczhyk_access、mxczhyk_activity、mxczhyk_activityapply、mxczhyk_admin、mxczhyk_advertisement、mxczhyk_article、mxczhyk_article_class、mxczhyk_article_discuss、mxczhyk_attention、mxczhyk_business、mxczhyk_code、mxczhyk_failedlogin、mxczhyk_findpass、mxczhyk_gift、mxczhyk_gift_record、mxczhyk_gift_type、mxczhyk_guestbook、mxczhyk_invites、mxczhyk_label、mxczhyk_link、mxczhyk_marriage_term、mxczhyk_member、mxczhyk_member_detail、mxczhyk_member_spaces、mxczhyk_menu、mxczhyk_message、mxczhyk_mood、mxczhyk_node、mxczhyk_notice、mxczhyk_onlinetime、mxczhyk_payment、mxczhyk_payrecord、mxczhyk_photo、mxczhyk_photo_detail、mxczhyk_privatemessage、mxczhyk_read、mxczhyk_role、mxczhyk_role_user、mxczhyk_success_object、mxczhyk_vip_space、mxczhyk_viptype、mxczhyk_vote、mxczhyk_vote_log、mxczhyk_vote_option、mxczhyk_webinfo、mxczhyk_words的数据
# Time: 2014-06-02 09:47:28
# -----------------------------------------------------------
# 当前SQL卷标：#1
# -----------------------------------------------------------


# 数据库表：mxczhyk_access 结构信息
DROP TABLE IF EXISTS `mxczhyk_access`;
CREATE TABLE `mxczhyk_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='各个操作和用户组的对应' ;

# 数据库表：mxczhyk_activity 结构信息
DROP TABLE IF EXISTS `mxczhyk_activity`;
CREATE TABLE `mxczhyk_activity` (
  `activity_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '活动',
  `title` varchar(50) NOT NULL COMMENT '活动名称',
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '发起人',
  `cost` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '花费（可有可无）',
  `starttimefrom` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间 年月日 具体时间',
  `starttimeto` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间 年月日 具体时间',
  `place` varchar(40) NOT NULL DEFAULT '' COMMENT '大学具体地址',
  `class` varchar(20) NOT NULL DEFAULT '' COMMENT '活动分类',
  `gender` tinyint(1) NOT NULL DEFAULT '1' COMMENT '性别男1  女2',
  `number` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '人数',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '有效期',
  `schoolName` varchar(30) NOT NULL COMMENT '举办的大学名称',
  `content` varchar(300) NOT NULL COMMENT '活动阐述',
  `isLock` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1开启；2禁止',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`activity_id`),
  KEY `uid` (`member_id`,`starttimefrom`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='活动表' ;

# 数据库表：mxczhyk_activityapply 结构信息
DROP TABLE IF EXISTS `mxczhyk_activityapply`;
CREATE TABLE `mxczhyk_activityapply` (
  `applyid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '活动申请表',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '活动id',
  `username` char(15) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '申请人id',
  `message` char(200) NOT NULL DEFAULT '',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `payment` mediumint(8) NOT NULL DEFAULT '0',
  `contact` char(200) NOT NULL,
  PRIMARY KEY (`applyid`),
  KEY `uid` (`uid`),
  KEY `tid` (`tid`),
  KEY `dateline` (`tid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='参加活动表' ;

# 数据库表：mxczhyk_admin 结构信息
DROP TABLE IF EXISTS `mxczhyk_admin`;
CREATE TABLE `mxczhyk_admin` (
  `aid` tinyint(2) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) NOT NULL COMMENT '名称',
  `email` varchar(50) NOT NULL COMMENT '登录账号',
  `pwd` char(32) NOT NULL COMMENT '登录密码',
  `status` tinyint(1) DEFAULT '1' COMMENT '账号状态1开启 2禁止',
  `remark` varchar(255) DEFAULT '' COMMENT '备注信息',
  `find_code` char(5) DEFAULT NULL COMMENT '找回账号验证码',
  `time` int(10) NOT NULL COMMENT '开通时间',
  `isSup` tinyint(1) DEFAULT '1' COMMENT '1不是超级管理员；2是超级管理员',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='网站后台管理员表' ;

# 数据库表：mxczhyk_advertisement 结构信息
DROP TABLE IF EXISTS `mxczhyk_advertisement`;
CREATE TABLE `mxczhyk_advertisement` (
  `advertisement_id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_link` varchar(100) NOT NULL DEFAULT '无' COMMENT '广告链接地址',
  `if_float` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否浮动  是1 0为不浮动',
  `description` varchar(200) NOT NULL DEFAULT '无' COMMENT '广告描述',
  `title_name` varchar(50) NOT NULL DEFAULT '' COMMENT '广告标题',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '广告类型顶部1、中部2、浮动3',
  `code` text NOT NULL COMMENT '广告代码',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `image_site` varchar(100) NOT NULL COMMENT '广告图片地址',
  `available` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为可用；不可用为2；广告可用',
  `displayorder` tinyint(3) NOT NULL COMMENT '广告显示顺序',
  `targets` text NOT NULL COMMENT '广告投放范围',
  `parameters` text NOT NULL COMMENT '广告参数',
  PRIMARY KEY (`advertisement_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='广告表' ;

# 数据库表：mxczhyk_article 结构信息
DROP TABLE IF EXISTS `mxczhyk_article`;
CREATE TABLE `mxczhyk_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(6) NOT NULL COMMENT '文章类别',
  `label_id` int(11) NOT NULL COMMENT '标签',
  `member_id` int(10) NOT NULL COMMENT '个人id',
  `keywords` varchar(120) DEFAULT NULL COMMENT '关键字',
  `title` varchar(120) NOT NULL COMMENT '文章标题',
  `description` varchar(200) NOT NULL COMMENT '文章描述',
  `img` varchar(200) NOT NULL COMMENT '图片地址',
  `content` text NOT NULL COMMENT '文章内容',
  `add_time` int(15) NOT NULL,
  `update_time` int(15) NOT NULL,
  `sort` int(15) NOT NULL,
  `islock` tinyint(1) NOT NULL DEFAULT '1' COMMENT '2是  1否锁定 默认1',
  `ip` varchar(15) NOT NULL COMMENT '发布ip',
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文章详细表' ;

# 数据库表：mxczhyk_article_class 结构信息
DROP TABLE IF EXISTS `mxczhyk_article_class`;
CREATE TABLE `mxczhyk_article_class` (
  `cid` mediumint(5) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `pid` int(5) NOT NULL COMMENT 'parentCategory上级分类',
  `type_name` varchar(20) NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文章分类表' ;

# 数据库表：mxczhyk_article_discuss 结构信息
DROP TABLE IF EXISTS `mxczhyk_article_discuss`;
CREATE TABLE `mxczhyk_article_discuss` (
  `discuss_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `parentId` int(11) NOT NULL COMMENT '为member_id指的是回复人id 父子段为0指的是评论文章本身；',
  `content` varchar(200) NOT NULL COMMENT '评论详情',
  `create_time` int(15) NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1为禁止；2为开启',
  PRIMARY KEY (`discuss_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文章评论回复表' ;

# 数据库表：mxczhyk_attention 结构信息
DROP TABLE IF EXISTS `mxczhyk_attention`;
CREATE TABLE `mxczhyk_attention` (
  `attention_id` bigint(18) unsigned NOT NULL AUTO_INCREMENT COMMENT '关注信息id',
  `guanzhuzhe` int(11) NOT NULL COMMENT '关注人id',
  `beiguanzhu` int(11) NOT NULL COMMENT '被关注人id',
  `create_time` int(15) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`attention_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='个人关注信息记录表' ;

# 数据库表：mxczhyk_business 结构信息
DROP TABLE IF EXISTS `mxczhyk_business`;
CREATE TABLE `mxczhyk_business` (
  `business_id` mediumint(5) NOT NULL AUTO_INCREMENT COMMENT '商家id',
  `business_name` varchar(30) NOT NULL COMMENT '企业名称',
  `address` varchar(40) NOT NULL COMMENT '公司企业地址',
  `postcode` varchar(15) NOT NULL COMMENT '邮政编码',
  `workTel` varchar(15) NOT NULL COMMENT '工作电话',
  `qq` varchar(15) NOT NULL,
  `content` varchar(200) NOT NULL COMMENT '详情',
  `create_time` varchar(15) NOT NULL COMMENT '创建时间',
  `remark` varchar(50) NOT NULL COMMENT '备注',
  PRIMARY KEY (`business_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商家入赘表' ;

# 数据库表：mxczhyk_code 结构信息
DROP TABLE IF EXISTS `mxczhyk_code`;
CREATE TABLE `mxczhyk_code` (
  `code_id` tinyint(2) NOT NULL AUTO_INCREMENT COMMENT '发表心情id',
  `image` blob NOT NULL COMMENT '二维码图片',
  `create_time` int(11) NOT NULL COMMENT '新建时间；评论时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为开启；2为禁止',
  PRIMARY KEY (`code_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='二维码存蓄表' ;

# 数据库表：mxczhyk_failedlogin 结构信息
DROP TABLE IF EXISTS `mxczhyk_failedlogin`;
CREATE TABLE `mxczhyk_failedlogin` (
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '登录失败者IP',
  `username` char(32) NOT NULL DEFAULT '' COMMENT '登录失败者',
  `count` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '登录失败次数',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上次登录失败时间',
  PRIMARY KEY (`ip`,`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='登陆失败记录表' ;

# 数据库表：mxczhyk_findpass 结构信息
DROP TABLE IF EXISTS `mxczhyk_findpass`;
CREATE TABLE `mxczhyk_findpass` (
  `findpass_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '找回密码记录id',
  `member_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `md5email` varchar(15) NOT NULL DEFAULT '0' COMMENT '将email和时间加密',
  `expired` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '有效时间加固定的时间',
  PRIMARY KEY (`findpass_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='找回密码记录表' ;

# 数据库表：mxczhyk_gift 结构信息
DROP TABLE IF EXISTS `mxczhyk_gift`;
CREATE TABLE `mxczhyk_gift` (
  `gift_id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '礼品表的id',
  `gift_type_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '种类id',
  `gift_name` varchar(50) DEFAULT NULL COMMENT '详细礼品的名称',
  `points` decimal(18,2) unsigned DEFAULT '0.00' COMMENT '得到的分数',
  `imgurl` varchar(100) DEFAULT NULL COMMENT '上传图片的url',
  `intro` varchar(200) DEFAULT NULL COMMENT '详细介绍',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `flag` tinyint(1) unsigned DEFAULT '0' COMMENT '是2  否1 是标志',
  `elite` tinyint(1) unsigned DEFAULT '0' COMMENT '是2 否1是精华',
  `istop` tinyint(1) unsigned DEFAULT '1' COMMENT '是2  否1置顶',
  PRIMARY KEY (`gift_id`),
  KEY `cateid` (`gift_type_id`),
  KEY `flag` (`flag`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='礼品表' ;

# 数据库表：mxczhyk_gift_record 结构信息
DROP TABLE IF EXISTS `mxczhyk_gift_record`;
CREATE TABLE `mxczhyk_gift_record` (
  `record_id` bigint(20) unsigned NOT NULL,
  `giftid` mediumint(10) unsigned DEFAULT '0',
  `fromuserid` int(10) unsigned DEFAULT '0',
  `touserid` int(10) unsigned DEFAULT '0',
  `points` decimal(18,2) unsigned DEFAULT '0.00',
  `message` varchar(255) DEFAULT NULL,
  `sendtimeline` int(10) unsigned DEFAULT '0',
  `flag` tinyint(1) unsigned DEFAULT '0',
  `viewstatus` tinyint(1) unsigned DEFAULT '0',
  `viewtimeline` int(10) unsigned DEFAULT '0',
  `reply` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `fromuserid` (`fromuserid`),
  KEY `touserid` (`touserid`),
  KEY `flag` (`flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='这个是一个礼品记录表 没有完成' ;

# 数据库表：mxczhyk_gift_type 结构信息
DROP TABLE IF EXISTS `mxczhyk_gift_type`;
CREATE TABLE `mxczhyk_gift_type` (
  `gift_type_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '种类编号',
  `type_name` varchar(50) NOT NULL COMMENT '种类名称',
  `sort` smallint(2) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '新建时间',
  `gift_num` mediumint(8) NOT NULL COMMENT '礼品编号 不能高于8位',
  PRIMARY KEY (`gift_type_id`),
  KEY `orders` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='礼品种类表' ;

# 数据库表：mxczhyk_guestbook 结构信息
DROP TABLE IF EXISTS `mxczhyk_guestbook`;
CREATE TABLE `mxczhyk_guestbook` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `SendID` int(11) NOT NULL COMMENT '留言人id',
  `RecID` int(11) NOT NULL COMMENT '回复人id',
  `content` varchar(200) NOT NULL COMMENT '留言内容',
  `PostTime` datetime NOT NULL COMMENT '发送时间',
  `PostIP` char(15) NOT NULL COMMENT '发送ip',
  `IsLock` tinyint(1) DEFAULT '1' COMMENT '是（2）否（1）  锁定默认1',
  `IsPub` tinyint(1) DEFAULT NULL COMMENT '是（2）否（1）公开',
  PRIMARY KEY (`book_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户留言表\r\n多对多的关系' ;

# 数据库表：mxczhyk_invites 结构信息
DROP TABLE IF EXISTS `mxczhyk_invites`;
CREATE TABLE `mxczhyk_invites` (
  `invites_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '邀请记录id',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '邀请人id',
  `dateline` int(10) NOT NULL DEFAULT '0' COMMENT '邀请购买时间',
  `expiration` int(10) NOT NULL DEFAULT '0' COMMENT '邀请有效时间',
  `inviteip` char(15) NOT NULL COMMENT '被邀请人ip',
  `invitecode` char(16) NOT NULL COMMENT '邀请码',
  `reguid` int(10) NOT NULL DEFAULT '0' COMMENT '受邀人id',
  `regdateline` int(10) NOT NULL DEFAULT '0' COMMENT '邀请人注册时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '邀请码状态（1=未使用 2=已用 3=已发送 4=过期）',
  PRIMARY KEY (`invites_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邀请注册记录表' ;

# 数据库表：mxczhyk_label 结构信息
DROP TABLE IF EXISTS `mxczhyk_label`;
CREATE TABLE `mxczhyk_label` (
  `label_id` smallint(2) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `label_name` varchar(10) NOT NULL COMMENT '标签名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1开启 2正常',
  `create_time` varchar(15) NOT NULL COMMENT '创建时间',
  `sort` varchar(5) NOT NULL COMMENT '排序',
  `isTop` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是2     否1    置顶',
  PRIMARY KEY (`label_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='标签表' ;

# 数据库表：mxczhyk_link 结构信息
DROP TABLE IF EXISTS `mxczhyk_link`;
CREATE TABLE `mxczhyk_link` (
  `link_id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL COMMENT '地址',
  `name` varchar(20) NOT NULL COMMENT '链接名称',
  `logo` varchar(100) NOT NULL COMMENT 'logo地址',
  `remark` varchar(50) NOT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态为1 表示正常；2禁止',
  `sort` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='友情链接' ;

# 数据库表：mxczhyk_marriage_term 结构信息
DROP TABLE IF EXISTS `mxczhyk_marriage_term`;
CREATE TABLE `mxczhyk_marriage_term` (
  `marriage_id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '婚姻id',
  `member_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `city` varchar(20) NOT NULL DEFAULT '无' COMMENT '城市',
  `province` varchar(50) NOT NULL DEFAULT '无' COMMENT '省份',
  `old` varchar(50) NOT NULL COMMENT '年龄范围',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `high` varchar(10) NOT NULL DEFAULT '0' COMMENT '身高范围',
  `character` varchar(10) NOT NULL COMMENT '性格',
  `objectFan` varchar(10) NOT NULL COMMENT '用户爱好（js加载 多选）',
  `Nation` varchar(10) NOT NULL COMMENT '民族',
  `nationality` varchar(20) NOT NULL COMMENT '国籍',
  `academy` varchar(10) NOT NULL COMMENT '学历',
  PRIMARY KEY (`marriage_id`),
  KEY `cateid` (`member_id`),
  KEY `flag` (`high`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='恋爱条件表' ;

# 数据库表：mxczhyk_member 结构信息
DROP TABLE IF EXISTS `mxczhyk_member`;
CREATE TABLE `mxczhyk_member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员表id',
  `username` varchar(20) NOT NULL COMMENT '会员名字',
  `email` varchar(80) NOT NULL COMMENT '电子邮箱',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `role_name` varchar(100) NOT NULL COMMENT '角色名称',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `reg_time` varchar(40) NOT NULL COMMENT '注册时间',
  `last_login_time` varchar(40) NOT NULL COMMENT '最后的登陆时间',
  `ifadmin` varchar(5) NOT NULL DEFAULT '1' COMMENT '管理员 是2',
  `Mobile` int(11) NOT NULL COMMENT '手机登陆的时候用',
  `isLock` varchar(5) NOT NULL DEFAULT '2' COMMENT '1表示禁止个人用户；2表示开启个人用户账户',
  `vip_type_id` tinyint(3) NOT NULL DEFAULT '1' COMMENT '会员类型 1普通会员',
  `getIp` varchar(15) NOT NULL COMMENT 'ip',
  `OnlineTF` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户在线状态，1为在线，0为不在线',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='会员表' ;

# 数据库表：mxczhyk_member_detail 结构信息
DROP TABLE IF EXISTS `mxczhyk_member_detail`;
CREATE TABLE `mxczhyk_member_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '每个人详细的id',
  `member_id` int(11) DEFAULT NULL,
  `english_name` varchar(30) NOT NULL COMMENT '英文名称',
  `username` varchar(20) NOT NULL COMMENT '真实名称',
  `if_shaoNation` tinyint(1) NOT NULL DEFAULT '1' COMMENT '不是1；其他2',
  `nationName` varchar(50) NOT NULL DEFAULT '汉族' COMMENT '民族名称',
  `schoolName` varchar(30) NOT NULL COMMENT '学校名称',
  `academy` varchar(30) NOT NULL COMMENT '学院',
  `academic` tinyint(1) NOT NULL DEFAULT '0' COMMENT '学历;专科1 本科2 研究生3 博士4',
  `if_overseas` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是 2  否1是留学生',
  `if_belif_object` tinyint(1) NOT NULL COMMENT '1是；2不是  信仰对象要求',
  `belif_state` varchar(200) DEFAULT NULL COMMENT '信仰阐述内容',
  `belif_name` varchar(255) DEFAULT NULL COMMENT '1伊斯兰；2佛教；3道教；4基督教；',
  `if_ belief` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是2 否1信仰宗教',
  `gender` tinyint(1) NOT NULL DEFAULT '1' COMMENT '男1；女2',
  `nationality` varchar(50) NOT NULL DEFAULT '中国' COMMENT '留学生大学所在国家；本地默认中国',
  `province` varchar(20) NOT NULL COMMENT '家乡省份',
  `city` varchar(20) NOT NULL COMMENT '城市',
  `birthday` int(10) NOT NULL,
  `age` mediumint(2) NOT NULL COMMENT '年龄',
  `height` mediumint(3) NOT NULL COMMENT '身高',
  `star` mediumint(2) NOT NULL COMMENT '明星',
  `blood` mediumint(2) NOT NULL COMMENT ' ab:1  a：2  b：3  0：4  血型',
  `UserFan` char(20) NOT NULL COMMENT '用户爱好；js加载上来存蓄名称',
  `drinking` tinyint(1) NOT NULL COMMENT '有无喝酒',
  `smoke` tinyint(1) NOT NULL COMMENT '有无抽烟',
  `job` mediumint(2) NOT NULL COMMENT '职业',
  `income` mediumint(5) NOT NULL COMMENT '收入',
  `house` mediumint(2) NOT NULL COMMENT '有无房子',
  `marry` mediumint(2) NOT NULL COMMENT '婚姻状态',
  `monologue` varchar(255) NOT NULL COMMENT '独白',
  `qq` int(10) NOT NULL COMMENT 'qq',
  `msn` char(30) NOT NULL DEFAULT '无',
  `look_grade` smallint(3) NOT NULL COMMENT '相貌自评分数',
  `goal` tinyint(1) NOT NULL DEFAULT '1' COMMENT '交友目的：（恋爱交友1，激情交友2，征婚3，）',
  `love_time` varchar(20) NOT NULL COMMENT '希望多久能够找到对象',
  `graduate_time` varchar(8) NOT NULL COMMENT '毕业年份',
  `in_school` varchar(8) NOT NULL COMMENT '入学年份',
  `iPoint` int(8) NOT NULL COMMENT '积分',
  `ePoint` int(8) NOT NULL DEFAULT '0' COMMENT '点击次数  人气值',
  `cPoint` int(8) NOT NULL COMMENT '魅力值 （积分+登陆次数）',
  `aPoint` int(8) NOT NULL DEFAULT '1' COMMENT '活跃值(点击次数+登陆次数+积分)',
  `loginCount` int(5) NOT NULL DEFAULT '1' COMMENT '登陆次数',
  `FriendClass` tinyint(1) NOT NULL DEFAULT '1' COMMENT '系统好友默认分组（1，我的好友，2陌生人,3黑名单）',
  `LastIP` varchar(15) NOT NULL COMMENT '最后一次登录ip',
  `isOpen` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1不开放；2开放；',
  `isIDcard` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是2  否1通过实名认证',
  `IdcardFiles` varchar(100) NOT NULL COMMENT '实名认证附件地址',
  `Addfriendbs` tinyint(1) NOT NULL DEFAULT '1' COMMENT '添加好友验证设置0为不允许任何人把我列为好友  1为需要身份认证才能把我列为好友2为允许任何人把我列为好友',
  `Emailcode` varchar(32) NOT NULL COMMENT '邮件验证码',
  `Ismobile` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是1  否2需要手机认证',
  `BindTF` tinyint(1) NOT NULL DEFAULT '2' COMMENT '是 1   否2 捆绑了手机',
  `avatar` varchar(100) NOT NULL COMMENT '头像地址',
  `avatarwidth` tinyint(3) NOT NULL COMMENT '头像的宽度',
  `avatarheight` tinyint(3) NOT NULL COMMENT '头像的高度',
  `sightml` varchar(300) NOT NULL COMMENT '个信签名；',
  `groupterms` varchar(10) NOT NULL COMMENT '用户组有效期（会员类型：年会员）',
  `authstr` varchar(20) NOT NULL COMMENT '用户激活码(时间限制)',
  `limit_reply` tinyint(1) NOT NULL DEFAULT '1' COMMENT '限制回复2  默认1',
  `limit_attention` tinyint(1) NOT NULL DEFAULT '1' COMMENT '限制关注2  默认1',
  `limit_say` tinyint(1) NOT NULL DEFAULT '1' COMMENT '限制发言2  默认1',
  `constellation` varchar(10) NOT NULL COMMENT '星座名称',
  PRIMARY KEY (`id`),
  KEY `city` (`city`),
  KEY `age` (`id`,`gender`,`age`),
  KEY `hits` (`ePoint`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='会员详细表' ;

# 数据库表：mxczhyk_member_spaces 结构信息
DROP TABLE IF EXISTS `mxczhyk_member_spaces`;
CREATE TABLE `mxczhyk_member_spaces` (
  `spaces_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '空间id',
  `member_id` int(11) NOT NULL,
  `style` varchar(20) NOT NULL COMMENT '空间风格',
  `description` varchar(120) NOT NULL COMMENT '内容描述',
  `layout` varchar(200) NOT NULL COMMENT '布局层设置',
  `side` tinyint(1) NOT NULL COMMENT '布局侧边设置（0=双侧边 1=左侧边 2＝右侧边）',
  PRIMARY KEY (`spaces_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人空间设置表' ;

# 数据库表：mxczhyk_menu 结构信息
DROP TABLE IF EXISTS `mxczhyk_menu`;
CREATE TABLE `mxczhyk_menu` (
  `menu_id` int(4) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL COMMENT '链接地址',
  `menu_name` varchar(20) NOT NULL COMMENT '菜单名称',
  `parentid` int(6) NOT NULL DEFAULT '0' COMMENT '父id',
  `rank` int(6) NOT NULL,
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1首页导航栏；',
  `target` varchar(20) NOT NULL COMMENT '范围',
  `sort` tinyint(1) NOT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='菜单表' ;

# 数据库表：mxczhyk_message 结构信息
DROP TABLE IF EXISTS `mxczhyk_message`;
CREATE TABLE `mxczhyk_message` (
  `message_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '信息id',
  `SendID` int(10) NOT NULL COMMENT '发送人id',
  `RecID` int(10) NOT NULL COMMENT '回复人id',
  `adder_name` varchar(200) NOT NULL,
  `adder_email` varchar(200) NOT NULL,
  `type` int(1) NOT NULL COMMENT '1:文章评论,2:留言',
  `content` varchar(200) NOT NULL,
  `add_time` int(11) NOT NULL,
  `PostIP` varchar(15) NOT NULL,
  `IsLock` tinyint(1) NOT NULL COMMENT '是否锁定',
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言信息表' ;

# 数据库表：mxczhyk_mood 结构信息
DROP TABLE IF EXISTS `mxczhyk_mood`;
CREATE TABLE `mxczhyk_mood` (
  `mood_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '发表心情id',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `content` varchar(200) NOT NULL COMMENT '内容详情',
  `create_time` int(11) NOT NULL COMMENT '新建时间；评论时间',
  `parentId` int(11) NOT NULL DEFAULT '0' COMMENT '父子段为0指的是本心情评论；其他会员id ',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为开启；2为禁止',
  `username` varchar(20) NOT NULL COMMENT '会员姓名',
  `sort` smallint(5) NOT NULL COMMENT '排序',
  PRIMARY KEY (`mood_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='会员发表心情表（个人状态）' ;

# 数据库表：mxczhyk_node 结构信息
DROP TABLE IF EXISTS `mxczhyk_node`;
CREATE TABLE `mxczhyk_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '项目，模块，操作的名称',
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL COMMENT '从属关系，某一个模块是属于哪个项目，某个操作属于哪个模块。',
  `level` tinyint(1) unsigned NOT NULL COMMENT '节点的层级； 1 为项目 ,2为模块 ,3操作；项目0（admin）',
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='操作节点' ;

# 数据库表：mxczhyk_notice 结构信息
DROP TABLE IF EXISTS `mxczhyk_notice`;
CREATE TABLE `mxczhyk_notice` (
  `notice_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '资料id',
  `notice_name` varchar(100) NOT NULL COMMENT '公告名称',
  `content` text NOT NULL COMMENT '公告内容',
  `uploadedby` varchar(15) NOT NULL COMMENT '发布者',
  `uploadtime` varchar(11) NOT NULL COMMENT '发布时间',
  `if_admin` tinyint(1) NOT NULL DEFAULT '1' COMMENT '权限判断个人1；管理员2；',
  `IP` varchar(15) NOT NULL COMMENT '发送',
  `PostTime` varchar(11) NOT NULL COMMENT '发送时间',
  `IsLock` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1不锁定 锁定2',
  PRIMARY KEY (`notice_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='公告表' ;

# 数据库表：mxczhyk_onlinetime 结构信息
DROP TABLE IF EXISTS `mxczhyk_onlinetime`;
CREATE TABLE `mxczhyk_onlinetime` (
  `member_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `thismonth` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '这个月的在线时间',
  `total` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '合计在线时间',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `thisday` int(10) NOT NULL COMMENT '这天在线时间',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='在线时间表' ;

# 数据库表：mxczhyk_payment 结构信息
DROP TABLE IF EXISTS `mxczhyk_payment`;
CREATE TABLE `mxczhyk_payment` (
  `payment_id` smallint(2) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员类型id',
  `pay_name` varchar(10) NOT NULL COMMENT '会员权限名称',
  `remark` varchar(100) NOT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1开启 2正常',
  PRIMARY KEY (`payment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='付款方式表' ;

# 数据库表：mxczhyk_payrecord 结构信息
DROP TABLE IF EXISTS `mxczhyk_payrecord`;
CREATE TABLE `mxczhyk_payrecord` (
  `payrecord_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '支付记录id',
  `member_id` bigint(15) NOT NULL COMMENT '会员id',
  `create_time` int(15) NOT NULL COMMENT '支付时间',
  `payment_id` tinyint(2) NOT NULL COMMENT '支付方式',
  `sort` tinyint(1) NOT NULL COMMENT '排序',
  PRIMARY KEY (`payrecord_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='支付财务记录表' ;

# 数据库表：mxczhyk_photo 结构信息
DROP TABLE IF EXISTS `mxczhyk_photo`;
CREATE TABLE `mxczhyk_photo` (
  `photo_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '相册',
  `title` varchar(100) NOT NULL COMMENT '相册名称',
  `intro` varchar(200) NOT NULL COMMENT '相册描述',
  `sort` int(12) NOT NULL COMMENT '按照什么顺序',
  `member_id` int(10) NOT NULL COMMENT '会员的id',
  `add_time` int(11) NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '禁用2；开启1；',
  `whoSee` tinyint(1) DEFAULT '1' COMMENT '相册权限个人见2；全部好友可见1；全部人可见3；',
  PRIMARY KEY (`photo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='个人相册表' ;

# 数据库表：mxczhyk_photo_detail 结构信息
DROP TABLE IF EXISTS `mxczhyk_photo_detail`;
CREATE TABLE `mxczhyk_photo_detail` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `success_id` int(11) NOT NULL COMMENT '成功相册id',
  `photo_id` int(10) NOT NULL,
  `intro` varchar(200) NOT NULL COMMENT '图片描述',
  `image_name` varchar(100) NOT NULL COMMENT '图片名称',
  `link` varchar(200) NOT NULL COMMENT '链接 可有可无',
  `sort` int(12) NOT NULL COMMENT '按照什么顺序',
  `add_time` int(11) NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL COMMENT '禁用2；开启1；',
  `if_top` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是2   否1作为相册的封面',
  `imgsite` varchar(100) DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='基本照片表' ;

# 数据库表：mxczhyk_privatemessage 结构信息
DROP TABLE IF EXISTS `mxczhyk_privatemessage`;
CREATE TABLE `mxczhyk_privatemessage` (
  `message_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '信息id',
  `sender_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发件人id',
  `receiver_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '接受人id',
  `sent_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发生时间',
  `read_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '阅读时间',
  `readed` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '已读 2 未读1 ',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是2  否1 删除',
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '信息标题',
  `message` text NOT NULL COMMENT '信息内容 可以预设',
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`,`receiver_id`),
  KEY `receiver_id` (`receiver_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='个人站内信息表' ;

# 数据库表：mxczhyk_read 结构信息
DROP TABLE IF EXISTS `mxczhyk_read`;
CREATE TABLE `mxczhyk_read` (
  `read_id` bigint(18) unsigned NOT NULL AUTO_INCREMENT COMMENT '看过信息id',
  `reader` int(11) NOT NULL COMMENT '看过人id',
  `beread` int(11) NOT NULL COMMENT '被看过id',
  `create_time` int(15) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`read_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='个人看过记录表' ;

# 数据库表：mxczhyk_role 结构信息
DROP TABLE IF EXISTS `mxczhyk_role`;
CREATE TABLE `mxczhyk_role` (
  `id` smallint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(3) DEFAULT NULL COMMENT '父id  1为超级管理员',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '启用1 ；禁止0',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='权限角色（用户分组）表' ;

# 数据库表：mxczhyk_role_user 结构信息
DROP TABLE IF EXISTS `mxczhyk_role_user`;
CREATE TABLE `mxczhyk_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户和用户分组的对应' ;

# 数据库表：mxczhyk_success_object 结构信息
DROP TABLE IF EXISTS `mxczhyk_success_object`;
CREATE TABLE `mxczhyk_success_object` (
  `success_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `boy_id` int(11) NOT NULL COMMENT '男方id',
  `girl_id` int(11) NOT NULL COMMENT '女方id',
  `create_time` int(15) NOT NULL COMMENT '创建时间',
  `content` text NOT NULL COMMENT '成功介绍，宣言',
  `imageName` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL COMMENT '图片地址',
  `name` varchar(50) NOT NULL COMMENT '故事名称',
  PRIMARY KEY (`success_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='成功牵手表' ;

# 数据库表：mxczhyk_vip_space 结构信息
DROP TABLE IF EXISTS `mxczhyk_vip_space`;
CREATE TABLE `mxczhyk_vip_space` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vuid` int(10) NOT NULL,
  `stime` int(11) NOT NULL,
  `vday` int(4) NOT NULL,
  `vtime` datetime NOT NULL,
  `vgid` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=gbk COMMENT='高级会员表' ;

# 数据库表：mxczhyk_viptype 结构信息
DROP TABLE IF EXISTS `mxczhyk_viptype`;
CREATE TABLE `mxczhyk_viptype` (
  `vip_type_id` smallint(2) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员类型id',
  `vip_name` varchar(10) NOT NULL COMMENT '会员权限名称',
  PRIMARY KEY (`vip_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='会员升级权限类型表' ;

# 数据库表：mxczhyk_vote 结构信息
DROP TABLE IF EXISTS `mxczhyk_vote`;
CREATE TABLE `mxczhyk_vote` (
  `vote_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，投票主题TID',
  `vote_name` varchar(250) NOT NULL DEFAULT '' COMMENT '投票名称',
  `start_time` int(11) unsigned NOT NULL DEFAULT '0',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0',
  `multiple` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '多选1  否则为单项选择',
  `vote_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '投票总数',
  `visible` tinyint(1) NOT NULL DEFAULT '0' COMMENT '提交投票后结果才可见1',
  PRIMARY KEY (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='记录投票信息' ;

# 数据库表：mxczhyk_vote_log 结构信息
DROP TABLE IF EXISTS `mxczhyk_vote_log`;
CREATE TABLE `mxczhyk_vote_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `vote_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '投票主题id',
  `ip_address` varchar(15) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `vote_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '投票时间',
  PRIMARY KEY (`log_id`),
  KEY `vote_id` (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投票记录表' ;

# 数据库表：mxczhyk_vote_option 结构信息
DROP TABLE IF EXISTS `mxczhyk_vote_option`;
CREATE TABLE `mxczhyk_vote_option` (
  `option_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `vote_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `option_name` varchar(50) NOT NULL DEFAULT '' COMMENT '选项名称',
  `option_count` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '选项得票数，记录被选的结果，存放次数',
  `sort` varchar(3) NOT NULL DEFAULT '' COMMENT '选项显示顺序',
  PRIMARY KEY (`option_id`),
  KEY `vote_id` (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投票选项表' ;

# 数据库表：mxczhyk_webinfo 结构信息
DROP TABLE IF EXISTS `mxczhyk_webinfo`;
CREATE TABLE `mxczhyk_webinfo` (
  `website_id` tinyint(1) NOT NULL AUTO_INCREMENT COMMENT '网站id',
  `site_name` varchar(20) NOT NULL COMMENT '网站名称',
  `domain_name` varchar(20) NOT NULL COMMENT '域名',
  `keyword` text NOT NULL COMMENT '网站关键字',
  `description` varchar(200) NOT NULL COMMENT '网站描述',
  `logo_name` varchar(20) NOT NULL COMMENT 'logo自定义名称',
  `copyright` text NOT NULL COMMENT '版权信息',
  `reg_agreement` text NOT NULL COMMENT '注册协议',
  `logo_site` varchar(100) NOT NULL COMMENT '缩略图地址',
  `fax` varchar(20) NOT NULL COMMENT '传真电话',
  `service_tel` varchar(50) NOT NULL COMMENT '客服电话',
  `service_email` varchar(20) NOT NULL COMMENT '客服邮箱',
  `icp` varchar(50) NOT NULL COMMENT 'ICP备案',
  `version` varchar(20) NOT NULL COMMENT '版本',
  `postcode` int(7) NOT NULL COMMENT '邮政编码',
  PRIMARY KEY (`website_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='网站配置' ;

# 数据库表：mxczhyk_words 结构信息
DROP TABLE IF EXISTS `mxczhyk_words`;
CREATE TABLE `mxczhyk_words` (
  `word_id` mediumint(7) unsigned NOT NULL AUTO_INCREMENT COMMENT '词语id',
  `adminName` varchar(10) NOT NULL COMMENT '管理员用户名',
  `find` varchar(255) NOT NULL COMMENT '被过滤的词',
  `replacement` varchar(255) NOT NULL COMMENT '被替换的词',
  PRIMARY KEY (`word_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='词语过滤表' ;



# 数据库表：mxczhyk_access 数据信息
INSERT INTO `mxczhyk_access` VALUES ('3','14','2','1','');
INSERT INTO `mxczhyk_access` VALUES ('3','13','3','4','');
INSERT INTO `mxczhyk_access` VALUES ('3','12','3','4','');
INSERT INTO `mxczhyk_access` VALUES ('3','11','3','4','');
INSERT INTO `mxczhyk_access` VALUES ('3','10','3','4','');
INSERT INTO `mxczhyk_access` VALUES ('3','4','2','1','');
INSERT INTO `mxczhyk_access` VALUES ('3','9','3','3','');
INSERT INTO `mxczhyk_access` VALUES ('3','8','3','3','');
INSERT INTO `mxczhyk_access` VALUES ('3','7','3','3','');
INSERT INTO `mxczhyk_access` VALUES ('3','3','2','1','');
INSERT INTO `mxczhyk_access` VALUES ('3','6','3','2','');
INSERT INTO `mxczhyk_access` VALUES ('3','5','3','2','');
INSERT INTO `mxczhyk_access` VALUES ('3','2','2','1','');
INSERT INTO `mxczhyk_access` VALUES ('3','1','1','0','');
INSERT INTO `mxczhyk_access` VALUES ('4','7','3','3','');
INSERT INTO `mxczhyk_access` VALUES ('4','3','2','1','');
INSERT INTO `mxczhyk_access` VALUES ('4','6','3','2','');
INSERT INTO `mxczhyk_access` VALUES ('4','5','3','2','');
INSERT INTO `mxczhyk_access` VALUES ('4','2','2','1','');
INSERT INTO `mxczhyk_access` VALUES ('4','1','1','0','');
INSERT INTO `mxczhyk_access` VALUES ('2','31','3','26','');
INSERT INTO `mxczhyk_access` VALUES ('2','30','3','26','');
INSERT INTO `mxczhyk_access` VALUES ('2','29','3','26','');
INSERT INTO `mxczhyk_access` VALUES ('2','28','3','26','');
INSERT INTO `mxczhyk_access` VALUES ('2','27','3','26','');
INSERT INTO `mxczhyk_access` VALUES ('2','26','2','1','');
INSERT INTO `mxczhyk_access` VALUES ('2','15','3','14','');
INSERT INTO `mxczhyk_access` VALUES ('2','14','2','1','');
INSERT INTO `mxczhyk_access` VALUES ('2','10','3','4','');
INSERT INTO `mxczhyk_access` VALUES ('2','4','2','1','');
INSERT INTO `mxczhyk_access` VALUES ('2','7','3','3','');
INSERT INTO `mxczhyk_access` VALUES ('2','3','2','1','');
INSERT INTO `mxczhyk_access` VALUES ('2','6','3','2','');
INSERT INTO `mxczhyk_access` VALUES ('2','5','3','2','');
INSERT INTO `mxczhyk_access` VALUES ('2','2','2','1','');
INSERT INTO `mxczhyk_access` VALUES ('2','1','1','0','');


# 数据库表：mxczhyk_activity 数据信息
INSERT INTO `mxczhyk_activity` VALUES ('1','活动测试1','2','123','0000-00-00 00:00:00','0000-00-00 00:00:00','中北大学','1','1','12','23','中北大学','切尔去玩儿撒发生的假发是快递费那时就考虑到非那时快家里电脑发生考虑到放假阿斯顿你家阿斯顿几年级啊','1','');
INSERT INTO `mxczhyk_activity` VALUES ('2','测试饿','2','123','0000-00-00 00:00:00','0000-00-00 00:00:00','2134','2','1','1234','0','','123423按时发生安瑟AFS发生AFS安瑟','1','');


# 数据库表：mxczhyk_activityapply 数据信息


# 数据库表：mxczhyk_admin 数据信息
INSERT INTO `mxczhyk_admin` VALUES ('1','超级管理员','admin@qq.com','9a0e23021a6eabc8a321c650d6223bc7','1','我是超级管理员 哈哈~~','','1395405387','1');
INSERT INTO `mxczhyk_admin` VALUES ('4','','857773627@qq.com','9a0e23021a6eabc8a321c650d6223bc7','1','管理员测试','','1397909151','1');


# 数据库表：mxczhyk_advertisement 数据信息
INSERT INTO `mxczhyk_advertisement` VALUES ('2','无','0','无','按规定法规和','1','','0','0','','2','0','','');
INSERT INTO `mxczhyk_advertisement` VALUES ('3','无','0','无','大概是','1','','0','0','','2','0','','');


# 数据库表：mxczhyk_article 数据信息
INSERT INTO `mxczhyk_article` VALUES ('1','1','0','1','','的收到qwer','','','撒旦法卡阿斯顿凉快asdfasdf 放假阿里SD卡反馈来看车V迷在，小处女，走出校门，mcz.cvnz,.cxmvnz.kklldfkjjdshkljhkllhkhhghhghgghghhghghgghhghghhghhhhhhhhhhhhhhhhhhhhhhhh','1390561008','1390561028','0','1','');
INSERT INTO `mxczhyk_article` VALUES ('2','32','0','0','','关于我们','','','<div id="container" class="container_l" style="color:#333333;font-family:arial;font-size:medium;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	<div id="content_left">
		<div class="result-op c-container xpath-log" id="1" style="font-size:13px;">
			<span id="ala_img_desc" class="c-showurl" style="color:#008000;font-size:13px;"><span class="c-showurl" style="color:#008000;font-size:13px;">image.baidu.com<span class="Apple-converted-space">&nbsp;</span></span><span class="c-tools" id="tools_4225564250133887482"></span>&nbsp;-&nbsp;<a target="_blank" href="http://image.baidu.com/i?tn=baiduimage&amp;ct=201326592&amp;lm=-1&amp;cl=2&amp;fr=ala1&amp;word=%B9%D8%D3%DA%CE%D2%C3%C7%D2%B3%C3%E6%C9%E8%BC%C6">查看全部3,870,000张图片</a></span>
		</div>
		<div class="result c-container " id="2" style="font-size:13px;">
			<h3 class="t" style="font-weight:normal;font-size:medium;">
				<a href="http://www.baidu.com/link?url=mhoLeQCnYt6kVFUKBt4Sdp7-xf_ScKT4UiRbWCu7K6YmeEH12jvC_L0DvHAV1Cmf" target="_blank"><em>关于我们页面</em>截图欣赏 - 苏打苏塔<em>设计</em>量贩铺</a>
			</h3>
			<div class="c-row c-gap-top-small">
				<div class="general_image_pic c-span6">
					<a class="c-img6" href="http://www.baidu.com/link?url=mhoLeQCnYt6kVFUKBt4Sdp7-xf_ScKT4UiRbWCu7K6YmeEH12jvC_L0DvHAV1Cmf" target="_blank"><img src="http://i7.baidu.com/it/u=474851940,3191778597&amp;fm=96&amp;s=2A62DD12191E7ECC5E40C9410300A0F3" style="border:0px;height:75px;" /></a>
				</div>
				<div class="c-span18 c-span-last">
					<div class="c-abstract" style="font-size:13px;">
						在这一篇文章中,我们收集了一些“<em>关于我们</em>”的单<em>页面设计</em>,希望你会喜欢!通过“<em>关于我们</em>”页面,你可以了解到网站的主要信息,也可以通过这个页面,看到整个站点的风格...
					</div>
					<div class="f13" style="font-size:13px;">
						<span class="g" style="color:#008000;">sudasuta.com/abo...&nbsp;2013-05-06&nbsp;</span><span class="c-icons-outer" style="vertical-align:bottom;"><span class="c-icons-inner"></span></span>&nbsp;-&nbsp;<a href="http://cache.baiducontent.com/c?m=9d78d513d9d431a44f9b9e697b17c0106a4381132ba6a70209d4843992732a44506793ac51220774d2d20d6616d84d4beb8021033c1457bd8cb8f95dacbf866f6fd6286e365ac45613a004b28a01739261d71cbab81990ebad6d8efd828e981244ca25423b97f0fd1853419d78f0636ba5f9c7&amp;p=8e3ed616d9c111a05bec90681e078b&amp;newp=827ac95f85cc43b119bd9b7d0c1280231610db2151d3d1176195&amp;user=baidu&amp;fm=sc&amp;query=%B9%D8%D3%DA%CE%D2%C3%C7%D2%B3%C3%E6%C9%E8%BC%C6&amp;qid=&amp;p1=2" target="_blank" class="m">百度快照</a>
					</div>
				</div>
			</div>
		</div>
		<div class="result c-container " id="3" style="font-size:13px;">
			<h3 class="t" style="font-weight:normal;font-size:medium;">
				<a href="http://www.baidu.com/link?url=oTNODrkPDf0tMASahIOByqv25vlyEAQbDcO2zSRvUwcn9pzFsilSSt9RYAPL78klgOqFt5fgc7QduXLpof38GXBnoTt4XooZqHU3qUvI4VJ8f4-kIXEGtD54R7cK3FJI" target="_blank"><em>关于我们页面</em><span class="Apple-converted-space">&nbsp;</span>|<span class="Apple-converted-space">&nbsp;</span><em>设计</em>达人</a>
			</h3>
			<div class="c-row c-gap-top-small">
				<div class="general_image_pic c-span6">
					<a class="c-img6" href="http://www.baidu.com/link?url=oTNODrkPDf0tMASahIOByqv25vlyEAQbDcO2zSRvUwcn9pzFsilSSt9RYAPL78klgOqFt5fgc7QduXLpof38GXBnoTt4XooZqHU3qUvI4VJ8f4-kIXEGtD54R7cK3FJI" target="_blank"><img src="http://i8.baidu.com/it/u=2056618361,2259684230&amp;fm=96&amp;s=2D60FB063DD63DF14E7D1D9A030010C0" style="border:0px;height:75px;" /></a>
				</div>
				<div class="c-span18 c-span-last">
					<div class="c-abstract" style="font-size:13px;">
						网站<em>关于页面</em>是用来介绍你的网站相关信息,当用户需想要进一步了解你网站的时候,都会去浏览下<em>关于页面</em>,所以about页面是必不可少的,下面为大家分享20+<em>关于页面设计</em>,...
					</div>
					<div class="f13" style="font-size:13px;">
						<span class="g" style="color:#008000;">www.shejidaren.c...&nbsp;2012-08-23&nbsp;</span><span class="c-icons-outer" style="vertical-align:bottom;"><span class="c-icons-inner"></span></span>&nbsp;-&nbsp;<a href="http://cache.baiducontent.com/c?m=9f65cb4a8c8507ed4fece763105392230e54f7226680884e2987d31fcf735b36163bbca661714519c4b27b700ba85e2cebe74174207353a091bf9f3dd9ac982238832423071a913162c46adedc312ed653934d99a80e90b1e739e5b9a1d3cb110e8a050a6df0fb9c2c0a03bc6ee76242f4a7e95f642807cced2714fe4e062c882230a131f9f7426f10f0f7ca2b48d42ba076609cb842ba2962c404d51b&amp;p=8e57c05393904ead13bd9b7d0b1d8f&amp;newp=9c6af95e85cc43ee08e2977806509e231610db2151d2d4143e&amp;user=baidu&amp;fm=sc&amp;query=%B9%D8%D3%DA%CE%D2%C3%C7%D2%B3%C3%E6%C9%E8%BC%C6&amp;qid=&amp;p1=3" target="_blank" class="m">百度快照</a>
					</div>
				</div>
			</div>
		</div>
		<div class="result c-container " id="4" style="font-size:13px;">
			<h3 class="t" style="font-weight:normal;font-size:medium;">
				<a href="http://www.baidu.com/link?url=6ht5eokql38QA4x8osNwF9UDk14lfB6nUajn_8iLQDKe3A76nnQliwTg7tcZqmjw" target="_blank">10个创意的“<em>关于我们</em>”的<em>页面设计</em><span class="Apple-converted-space">&nbsp;</span>| 创意悠悠花园</a>
			</h3>
			<div class="c-row c-gap-top-small">
				<div class="general_image_pic c-span6">
					<a class="c-img6" href="http://www.baidu.com/link?url=6ht5eokql38QA4x8osNwF9UDk14lfB6nUajn_8iLQDKe3A76nnQliwTg7tcZqmjw" target="_blank"><img src="http://i9.baidu.com/it/u=3275766159,1444958045&amp;fm=96&amp;s=92ACF904642FF14D1823804B0300D0D9" style="border:0px;height:75px;" /></a>
				</div>
				<div class="c-span18 c-span-last">
					<div class="c-abstract" style="font-size:13px;">
						<em>关于我们</em>好像现在已经成为一个网站必不可少的页面之一,作用基本上都是在介绍一下个人或者网站的相关信息和内容。今天收集分享10个创意的“<em>关于我们</em>”的<em>页面设计</em>。
					</div>
					<div class="f13" style="font-size:13px;">
						<span class="g" style="color:#008000;">uuhy.com/html/13...&nbsp;2010-05-24&nbsp;</span><span class="c-icons-outer" style="vertical-align:bottom;"><span class="c-icons-inner"></span></span>&nbsp;-&nbsp;<a href="http://cache.baiducontent.com/c?m=9f65cb4a8c8507ed4fece7631051903c524380146d8a8f082592cc168e675a404664f4bb5078565b8dd1393a41f9464b9afb21043d1456b68cbefb5ddccb8559589f5134676d875663d60eaebb5153c137e05bfede18f0cdf42592dec5a2d44324c044750b97818f&amp;p=c67ec64ad4d511a05beb943b1c5ecd&amp;newp=847dc30e85cc43ed08e297780d0e8b231610db2151d7d057&amp;user=baidu&amp;fm=sc&amp;query=%B9%D8%D3%DA%CE%D2%C3%C7%D2%B3%C3%E6%C9%E8%BC%C6&amp;qid=&amp;p1=4" target="_blank" class="m">百度快照</a>
					</div>
				</div>
			</div>
		</div>
		<div class="result c-container " id="5" style="font-size:13px;">
			<h3 class="t" style="font-weight:normal;font-size:medium;">
				<a href="http://www.baidu.com/link?url=Gb1O37tD4SQWSnYITLpilJxcqWBtTNGb85OaHcNujvHnqF4FrTCbQe1u2UlMhRCAbs0sxtpVx48vCVhJPGk17K" target="_blank">13个“<em>关于我们</em>”<em>页面设计</em>欣赏_网站设计_梦想设计</a>
			</h3>
			<div class="c-abstract" style="font-size:13px;">
				29个创意404错误<em>页面设计</em><span class="Apple-converted-space">&nbsp;</span>- 网站设计 17个漂亮的<em>关于</em>(About)<em>页面设计</em><span class="Apple-converted-space">&nbsp;</span>- 网站设计 17个漂亮的<em>关于</em>(About)<em>页面设计</em><span class="Apple-converted-space">&nbsp;</span>Caitlin WickerBox CleverandCultureMolly &amp; ...
			</div>
			<div class="f13" style="font-size:13px;">
				<span class="g" style="color:#008000;">www.itdream.com....&nbsp;2014-03-17&nbsp;</span><span class="c-icons-outer" style="vertical-align:bottom;"><span class="c-icons-inner"></span></span>&nbsp;-&nbsp;<a href="http://cache.baiducontent.com/c?m=9f65cb4a8c8507ed4fece763105392230e54f7387a8190422c8b8448e435061e506694ea7b3f555383d27c1157f80807bfac2b72350026b59ad58c4fdcbe913f2fff7d722f4292044f934fa0dc362ed6569a4d9fae0e91c9e733e3b9a3a4c82253dd22046df1f59c5b7003bc6fe76430f4d7985f625b07bb9d2714f44e0023885331a136fd&amp;p=896fc54ad2c55af60be296385242&amp;newp=9e7ad35bba934eab5ea9c7710f0592695803ed6039d5d351&amp;user=baidu&amp;fm=sc&amp;query=%B9%D8%D3%DA%CE%D2%C3%C7%D2%B3%C3%E6%C9%E8%BC%C6&amp;qid=&amp;p1=5" target="_blank" class="m">百度快照</a>&nbsp;-&nbsp;<a href="http://www.baidu.com/tools?url=http%3A%2F%2Fwww.baidu.com%2Flink%3Furl%3DGb1O37tD4SQWSnYITLpilJxcqWBtTNGb85OaHcNujvHnqF4FrTCbQe1u2UlMhRCAbs0sxtpVx48vCVhJPGk17K&amp;jump=http%3A%2F%2Fkoubei.baidu.com%2Fwomc%2Fp%2Fsentry%3Ftitle%3D%0113%01%E4%B8%AA%01%E2%80%9C%02%E5%85%B3%E4%BA%8E%01%E6%88%91%E4%BB%AC%03%E2%80%9D%02%E9%A1%B5%E9%9D%A2%01%E8%AE%BE%E8%AE%A1%03%E6%AC%A3%E8%B5%8F%01_%01%E7%BD%91%E7%AB%99%01%E8%AE%BE%E8%AE%A1%01_%01%E6%A2%A6%E6%83%B3%01%E8%AE%BE%E8%AE%A1%01%26q%3D%B9%D8%D3%DA%CE%D2%C3%C7%D2%B3%C3%E6%C9%E8%BC%C6&amp;key=surl" target="_blank" class="m">评价</a>
			</div>
		</div>
		<div class="result c-container " id="6" style="font-size:13px;">
			<h3 class="t" style="font-weight:normal;font-size:medium;">
				<a href="http://www.baidu.com/link?url=wAs_Y8oeZgAu_t3CQc4ODEDPazbU8XFVVZqYMYcmNAESktSWDLgLx84HLGNoEJbSTHScCXPlkc0suo4UqDtIQqVpiXVyjRVrP5zH85X1-tS" target="_blank">25个创意的<em>关于我们页面</em>的<em>设计</em><span class="Apple-converted-space">&nbsp;</span>- 稳稳的稳稳的幸福的日志 - 网易...</a>
			</h3>
			<div class="c-abstract" style="font-size:13px;">
				每个正式一点的网站都应该会有“关于我们”这个页面内容的,那么今天就分享:25个创意的<em>关于我们页面</em>的<em>设计</em>,希望其中有你喜欢的,或者可以给你带来灵感的Miki Mottes ...
			</div>
			<div class="f13" style="font-size:13px;">
				<span class="g" style="color:#008000;">blog.163.com/wan...&nbsp;2011-09-09&nbsp;</span><span class="c-icons-outer" style="vertical-align:bottom;"><span class="c-icons-inner"></span></span>&nbsp;-&nbsp;<a href="http://cache.baiducontent.com/c?m=9d78d513d9d431a44f9b9e697b17c0106a4381132ba6a70209d4843992732a44506793ac51220774d2d20d6616d84d4beb8021033c1457bd8cb8f95dacbf866f6fd6286e365ac45613a004b29b18789437902deaab18f0ba8763cef1cf968c08068f04597f85f38147504a973aed5577b0e0c219085c13b9ee3b67f45f7c299d2043bc4cfce5346d0d87f7c0&amp;p=aa759a4fd39c57e003be9b7c5a0c&amp;newp=9e7e8d3785cc43b11abd9b74087a92695803ed603ddcd60b3d&amp;user=baidu&amp;fm=sc&amp;query=%B9%D8%D3%DA%CE%D2%C3%C7%D2%B3%C3%E6%C9%E8%BC%C6&amp;qid=&amp;p1=6" target="_blank" class="m">百度快照</a>&nbsp;-&nbsp;<a href="http://www.baidu.com/tools?url=http%3A%2F%2Fwww.baidu.com%2Flink%3Furl%3DwAs_Y8oeZgAu_t3CQc4ODEDPazbU8XFVVZqYMYcmNAESktSWDLgLx84HLGNoEJbSTHScCXPlkc0suo4UqDtIQqVpiXVyjRVrP5zH85X1-tS&amp;jump=http%3A%2F%2Fkoubei.baidu.com%2Fwomc%2Fp%2Fsentry%3Ftitle%3D%0125%01%E4%B8%AA%01%E5%88%9B%E6%84%8F%01%E7%9A%84%02%E5%85%B3%E4%BA%8E%01%E6%88%91%E4%BB%AC%01%E9%A1%B5%E9%9D%A2%03%E7%9A%84%02%E8%AE%BE%E8%AE%A1%03%20%01-%01%20%01%E7%A8%B3%E7%A8%B3%01%E7%9A%84%01%E7%A8%B3%E7%A8%B3%01%E7%9A%84%01%E5%B9%B8%E7%A6%8F%01%E7%9A%84%01%E6%97%A5%E5%BF%97%01%20%01-%01%20%01%E7%BD%91%E6%98%93%01...%26q%3D%B9%D8%D3%DA%CE%D2%C3%C7%D2%B3%C3%E6%C9%E8%BC%C6&amp;key=surl" target="_blank" class="m">评价</a>
			</div>
			<div class="extquery" style="padding:3px 0px 0px;">
				<a href="http://www.baidu.com/s?usm=1&amp;f=3&amp;wd=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1+%E7%BD%91%E6%98%93&amp;ie=utf-8&amp;rsv_crq=1" target="_blank">查看更多关于“<em>关于我们页面设计 网易</em>”的内容 &gt;&gt;</a>
			</div>
		</div>
		<div class="result c-container " id="7" style="font-size:13px;">
			<h3 class="t" style="font-weight:normal;font-size:medium;">
				<a href="http://www.baidu.com/link?url=93l1U41TCRbhFOS6q1ImWoJEoi0vn1tuqYf3hG1YCJANnHA6HpsEbVhfT4p-DA_8QHeiqH7FWXkpzxpGiPNBcq" target="_blank">25个出色的"<em>关于我们</em>"<em>页面设计</em>展示 &gt;&gt;网页作品欣赏&gt;&gt;顶尖创意&gt;&gt;...</a>
			</h3>
			<div class="c-row c-gap-top-small">
				<div class="general_image_pic c-span6">
					<a class="c-img6" href="http://www.baidu.com/link?url=93l1U41TCRbhFOS6q1ImWoJEoi0vn1tuqYf3hG1YCJANnHA6HpsEbVhfT4p-DA_8QHeiqH7FWXkpzxpGiPNBcq" target="_blank"><img src="http://i7.baidu.com/it/u=462167405,606871064&amp;fm=96&amp;s=EDC3E1066D8B3CC864F40D160300C0C2" style="border:0px;height:75px;" /></a>
				</div>
				<div class="c-span18 c-span-last">
					<div class="c-abstract" style="font-size:13px;">
						<span class="m" style="color:#666666;">2011年8月12日&nbsp;-&nbsp;</span><span class="Apple-converted-space">&nbsp;</span>在这篇文章中,<em>我们</em>收集了25个来自<em>设计</em>师、艺术家、插画家和开发人员网站中的“<em>关于</em>我”<em>页面</em>,<em>设计</em>十分精美,希望给您带来更多灵感启发!相关阅读 ·64...
					</div>
					<div class="f13" style="font-size:13px;">
						<span class="g" style="color:#008000;">www.bobd.cn/desi...&nbsp;2011-08-12&nbsp;</span><span class="c-icons-outer" style="vertical-align:bottom;"><span class="c-icons-inner"></span></span>&nbsp;-&nbsp;<a href="http://cache.baiducontent.com/c?m=9d78d513d9d431a44f9b9e697b17c0106a4381132ba6a70209d4843992732a44506793ac51220774d2d20d6616d84d4beb8021033c1457bd8cb8f95dacbf866f6fd6286e365ac45613a004b28e0360d620e70ab4ff4ff0ba8763cfb384849e0f06964e402dd0edce07404d8b72f01632e0a49355125d10beef276588033176c1&amp;p=aa3dc816d9c111a05bed9128514b8d&amp;newp=ce6d8f16d9c111a05bed913a4b00a5231610db2151d0d616&amp;user=baidu&amp;fm=sc&amp;query=%B9%D8%D3%DA%CE%D2%C3%C7%D2%B3%C3%E6%C9%E8%BC%C6&amp;qid=&amp;p1=7" target="_blank" class="m">百度快照</a>
					</div>
				</div>
			</div>
		</div>
		<div class="result c-container " id="8" style="font-size:13px;">
			<h3 class="t" style="font-weight:normal;font-size:medium;">
				<a href="http://www.baidu.com/link?url=g7jbZOYxApHsElxxw8vzudC4dEoqSC0kKUfx7VWz2-kwGcBplSCUc4U_qzd79kBDAsdkNEx84Marx0Axhu0_Va" target="_blank">“<em>关于我们</em>”<em>页面</em>的<em>设计</em>范例和趋势</a>
			</h3>
			<div class="c-row c-gap-top-small">
				<div class="general_image_pic c-span6">
					<a class="c-img6" href="http://www.baidu.com/link?url=g7jbZOYxApHsElxxw8vzudC4dEoqSC0kKUfx7VWz2-kwGcBplSCUc4U_qzd79kBDAsdkNEx84Marx0Axhu0_Va" target="_blank"><img src="http://i8.baidu.com/it/u=2555577020,3564468966&amp;fm=96&amp;s=6500D11B4B376488506D20DB000080B3" style="border:0px;height:75px;" /></a>
				</div>
				<div class="c-span18 c-span-last">
					<div class="c-abstract" style="font-size:13px;">
						<span class="m" style="color:#666666;">2012年8月8日&nbsp;-&nbsp;</span><span class="Apple-converted-space">&nbsp;</span>在所有员工对于公司价值巨大的行业里,你基本都会看到一个明显的“关于”<em>页面</em>,里面包含了员工的一些信息。“<em>关于我们</em>”的<em>页面</em>在Web<em>设计</em>和其他的一些创新...
					</div>
					<div class="f13" style="font-size:13px;">
						<span class="g" style="color:#008000;">www.wuseyun.com/...&nbsp;2013-08-01&nbsp;</span><span class="c-icons-outer" style="vertical-align:bottom;"><span class="c-icons-inner"></span></span>&nbsp;-&nbsp;<a href="http://cache.baiducontent.com/c?m=9d78d513d9d431a44f9b9e697b17c0106a4381132ba6a70209d4843992732a44506793ac51220774d2d20d6616d84d4beb8021033c1457bd8cb8f95dacbf866f6fd6286e365ac45613a004b28e0360d620e71faeee4eacfdac2593d9838e8049098c0c5b2cd3b6d8475c438f2eed162ce4ad9a4a134810cdb7763aa1&amp;p=8b2a971d82865dbe1abd9b7d0d1389&amp;newp=8b2a971f8e9711a05bed91641b52c9231610db2151d7d210258cc7&amp;user=baidu&amp;fm=sc&amp;query=%B9%D8%D3%DA%CE%D2%C3%C7%D2%B3%C3%E6%C9%E8%BC%C6&amp;qid=&amp;p1=8" target="_blank" class="m">百度快照</a>
					</div>
				</div>
			</div>
		</div>
		<div class="result c-container " id="9" style="font-size:13px;">
			<h3 class="t" style="font-weight:normal;font-size:medium;">
				<a href="http://www.baidu.com/link?url=ZOPNSNT1k60jugIOSqSmCu3X6JvLoSP9nYtIcnHqe0t0RA5EvDMhWPUoFfSvVUiiUQ02DKDkvqh3CV5FVo1kB1KL79CuEZ4_LT6-iT9Gfba" target="_blank">如何让“<em>关于我们</em>”的<em>页面设计</em>会讲故事 | 应酷爱<em>网页设计</em></a>
			</h3>
			<div class="c-row c-gap-top-small">
				<div class="general_image_pic c-span6">
					<a class="c-img6" href="http://www.baidu.com/link?url=ZOPNSNT1k60jugIOSqSmCu3X6JvLoSP9nYtIcnHqe0t0RA5EvDMhWPUoFfSvVUiiUQ02DKDkvqh3CV5FVo1kB1KL79CuEZ4_LT6-iT9Gfba" target="_blank"><img src="http://i9.baidu.com/it/u=3527160668,1783563900&amp;fm=96&amp;s=E6E29056D6E0790158D811600300A0F3" style="border:0px;height:75px;" /></a>
				</div>
				<div class="c-span18 c-span-last">
					<div class="c-abstract" style="font-size:13px;">
						创造出类似于“团队面对面”或者“<em>关于我们</em>的一切”的<em>网页</em>要耗费一定的时间和...Pingback: 小故事大门道:教你如何<em>设计</em>好<em>关于我们</em><span class="Apple-converted-space">&nbsp;</span>_ 人人都是产品经理 ...
					</div>
					<div class="f13" style="font-size:13px;">
						<span class="g" style="color:#008000;">blog.enqoo.com/b...&nbsp;2012-11-28&nbsp;</span><span class="c-icons-outer" style="vertical-align:bottom;"><span class="c-icons-inner"></span></span>&nbsp;-&nbsp;<a href="http://cache.baiducontent.com/c?m=9d78d513d9d431a44f9b9e697b17c0106a4381132ba6a70209d4843992732a44506793ac51220774d2d20d6616d84d4beb8021033c1457bd8cb8f95dacbf866f6fd6286e365ac45613a004b29b18789437902dbef35abae7e732e4ff8f8cc2040d9706187a82f38b470317d76ffa0962b3fbde0e025f66fdac2765891b247cc83440c011aea1693b5b9c&amp;p=85769a4786cc42a853abc239544c83&amp;newp=882a9642dd9905fc57efdb3a1c5496231610db2151d7d51e2590&amp;user=baidu&amp;fm=sc&amp;query=%B9%D8%D3%DA%CE%D2%C3%C7%D2%B3%C3%E6%C9%E8%BC%C6&amp;qid=&amp;p1=9" target="_blank" class="m">百度快照</a>
					</div>
				</div>
			</div>
		</div>
		<div class="result c-container " id="10" style="font-size:13px;">
			<h3 class="t" style="font-weight:normal;font-size:medium;">
				<a href="http://www.baidu.com/link?url=8wA29-YB4QORVodReVOKp2hm3p7KQDMBEfkjR14374ZyJa1KJDH7A0619F4jZblsmIgqnoTG-iHnJE92WpQtGq" target="_blank">13个“<em>关于我们</em>”<em>页面设计</em>欣赏_设友公社</a>
			</h3>
			<div class="c-abstract" style="font-size:13px;">
				13个“<em>关于我们</em>”<em>页面设计</em>欣赏来源: | 2014-04-06 16:04 | 已关注 次 上一篇:国外<em>网页设计</em>欣赏——明亮和鲜艳色彩的使用 下一篇:色彩鲜艳跳跃的<em>网页设计</em>欣赏...
			</div>
			<div class="f13" style="font-size:13px;">
				<span class="g" style="color:#008000;">www.uuuu.cc/xins...&nbsp;2014-04-06&nbsp;</span><span class="c-icons-outer" style="vertical-align:bottom;"><span class="c-icons-inner"></span></span>&nbsp;-&nbsp;<a href="http://cache.baiducontent.com/c?m=9d78d513d9d431a44f9b9e697b17c0106a4381132ba6a70209d4843992732a44506793ac51220774d2d20d6616d84d4beb8021033c1457bd8cb8f95dacbf866f6fd6286e365ac45613a004b28e0360d620e71daee85ef0ba8763c2b39888831509990f5067d8abd8075a538b35a74c6afeac9c4e155907ba9a6a23a007&amp;p=8d3bdd0c86cc45af0fbe9b7c5152&amp;newp=8b2a970188dd1eff57e994391e4c92695803ed633fd2db5121cacc&amp;user=baidu&amp;fm=sc&amp;query=%B9%D8%D3%DA%CE%D2%C3%C7%D2%B3%C3%E6%C9%E8%BC%C6&amp;qid=&amp;p1=10" target="_blank" class="m">百度快照</a>&nbsp;-&nbsp;<a href="http://www.baidu.com/tools?url=http%3A%2F%2Fwww.baidu.com%2Flink%3Furl%3D8wA29-YB4QORVodReVOKp2hm3p7KQDMBEfkjR14374ZyJa1KJDH7A0619F4jZblsmIgqnoTG-iHnJE92WpQtGq&amp;jump=http%3A%2F%2Fkoubei.baidu.com%2Fwomc%2Fp%2Fsentry%3Ftitle%3D%0113%01%E4%B8%AA%01%E2%80%9C%02%E5%85%B3%E4%BA%8E%01%E6%88%91%E4%BB%AC%03%E2%80%9D%02%E9%A1%B5%E9%9D%A2%01%E8%AE%BE%E8%AE%A1%03%E6%AC%A3%E8%B5%8F%01_%01%E8%AE%BE%01%E5%8F%8B%01%E5%85%AC%E7%A4%BE%01%26q%3D%B9%D8%D3%DA%CE%D2%C3%C7%D2%B3%C3%E6%C9%E8%BC%C6&amp;key=surl" target="_blank" class="m">评价</a>
			</div>
		</div>
	</div>
	<p id="page" style="font-size:14px;font-style:normal;font-weight:normal;font-family:arial;">
		<strong><span class="fk fk_cur"></span><span class="pc" style="line-height:36px;">1</span></strong><a href="http://www.baidu.com/s?wd=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;pn=10&amp;oq=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;ie=utf-8&amp;f=3&amp;usm=1"><span class="fk fkd"></span><span class="pc">2</span></a><a href="http://www.baidu.com/s?wd=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;pn=20&amp;oq=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;ie=utf-8&amp;f=3&amp;usm=1"><span class="fk"></span><span class="pc">3</span></a><a href="http://www.baidu.com/s?wd=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;pn=30&amp;oq=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;ie=utf-8&amp;f=3&amp;usm=1"><span class="fk fkd"></span><span class="pc">4</span></a><a href="http://www.baidu.com/s?wd=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;pn=40&amp;oq=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;ie=utf-8&amp;f=3&amp;usm=1"><span class="fk"></span><span class="pc">5</span></a><a href="http://www.baidu.com/s?wd=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;pn=50&amp;oq=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;ie=utf-8&amp;f=3&amp;usm=1"><span class="fk fkd"></span><span class="pc">6</span></a><a href="http://www.baidu.com/s?wd=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;pn=60&amp;oq=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;ie=utf-8&amp;f=3&amp;usm=1"><span class="fk"></span><span class="pc">7</span></a><a href="http://www.baidu.com/s?wd=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;pn=70&amp;oq=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;ie=utf-8&amp;f=3&amp;usm=1"><span class="fk fkd"></span><span class="pc">8</span></a><a href="http://www.baidu.com/s?wd=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;pn=80&amp;oq=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;ie=utf-8&amp;f=3&amp;usm=1"><span class="fk"></span><span class="pc">9</span></a><a href="http://www.baidu.com/s?wd=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;pn=90&amp;oq=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;ie=utf-8&amp;f=3&amp;usm=1"><span class="fk fkd"></span><span class="pc">10</span></a><a href="http://www.baidu.com/s?wd=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;pn=10&amp;oq=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;ie=utf-8&amp;f=3&amp;usm=1&amp;rsv_page=1" class="n">下一页&gt;</a><span class="nums" style="font-size:12px;color:#999999;vertical-align:text-bottom;line-height:36px;">百度为您找到相关结果约100,000,000个</span>
	</p>
</div>
<div id="rs" style="background-color:#FFFFFF;padding:8px 0px;margin:20px 0px 0px 15px;color:#333333;font-family:arial;font-size:medium;font-style:normal;font-weight:normal;text-align:start;">
	<table style="border:0px;" cellpadding="0">
		<tbody>
			<tr>
				<th rowspan="2" class="tt" style="font-family:arial;font-size:14px;font-weight:bold;text-align:left;vertical-align:top;">
					相关搜索
				</th>
				<th style="font-family:arial;font-size:14px;font-weight:normal;text-align:left;vertical-align:top;">
					<a href="http://www.baidu.com/s?wd=%E7%BD%91%E7%AB%99%E8%AE%BE%E8%AE%A1%E9%80%9F%E6%88%90&amp;rsp=0&amp;f=1&amp;oq=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;ie=utf-8&amp;f=3&amp;usm=1&amp;rsv_ers=xn1&amp;rs_src=1">网站设计速成</a>
				</th>
				<td style="font-family:arial;font-size:9pt;">
					<br />
				</td>
				<th style="font-family:arial;font-size:14px;font-weight:normal;text-align:left;vertical-align:top;">
					<a href="http://www.baidu.com/s?wd=%E6%AC%A7%E7%BE%8E%E9%A3%8E%E6%A0%BC%E7%BD%91%E7%AB%99%E8%AE%BE%E8%AE%A1&amp;rsp=1&amp;f=1&amp;oq=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;ie=utf-8&amp;f=3&amp;usm=1&amp;rsv_ers=xn1&amp;rs_src=1">欧美风格网站设计</a>
				</th>
				<td style="font-family:arial;font-size:9pt;">
					<br />
				</td>
				<th style="font-family:arial;font-size:14px;font-weight:normal;text-align:left;vertical-align:top;">
					<a href="http://www.baidu.com/s?wd=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC&amp;rsp=2&amp;f=1&amp;oq=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;ie=utf-8&amp;f=3&amp;usm=1&amp;rsv_ers=xn1&amp;rs_src=0">关于我们</a>
				</th>
				<td style="font-family:arial;font-size:9pt;">
					<br />
				</td>
				<th style="font-family:arial;font-size:14px;font-weight:normal;text-align:left;vertical-align:top;">
					<a href="http://www.baidu.com/s?wd=%E8%AE%BE%E8%AE%A1%E5%85%AC%E5%8F%B8&amp;rsp=3&amp;f=1&amp;oq=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;ie=utf-8&amp;f=3&amp;usm=1&amp;rsv_ers=xn1&amp;rs_src=0">设计公司</a>
				</th>
				<td style="font-family:arial;font-size:9pt;">
					<br />
				</td>
				<th style="font-family:arial;font-size:14px;font-weight:normal;text-align:left;vertical-align:top;">
					<a href="http://www.baidu.com/s?wd=%E8%81%94%E7%B3%BB%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;rsp=4&amp;f=1&amp;oq=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;ie=utf-8&amp;f=3&amp;usm=1&amp;rsv_ers=xn1&amp;rs_src=0">联系我们页面设计</a>
				</th>
			</tr>
			<tr>
				<th style="font-family:arial;font-size:14px;font-weight:normal;text-align:left;vertical-align:top;">
					<a href="http://www.baidu.com/s?wd=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2&amp;rsp=5&amp;f=1&amp;oq=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;ie=utf-8&amp;f=3&amp;usm=1&amp;rsv_ers=xn1&amp;rs_src=0">关于我们页面</a>
				</th>
				<td style="font-family:arial;font-size:9pt;">
					<br />
				</td>
				<th style="font-family:arial;font-size:14px;font-weight:normal;text-align:left;vertical-align:top;">
					<a href="http://www.baidu.com/s?wd=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E6%80%8E%E4%B9%88%E5%86%99&amp;rsp=6&amp;f=1&amp;oq=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;ie=utf-8&amp;f=3&amp;usm=1&amp;rsv_ers=xn1&amp;rs_src=0">关于我们怎么写</a>
				</th>
				<td style="font-family:arial;font-size:9pt;">
					<br />
				</td>
				<th style="font-family:arial;font-size:14px;font-weight:normal;text-align:left;vertical-align:top;">
					<a href="http://www.baidu.com/s?wd=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E6%A8%A1%E6%9D%BF&amp;rsp=7&amp;f=1&amp;oq=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;ie=utf-8&amp;f=3&amp;usm=1&amp;rsv_ers=xn1&amp;rs_src=0">关于我们页面模板</a>
				</th>
				<td style="font-family:arial;font-size:9pt;">
					<br />
				</td>
				<th style="font-family:arial;font-size:14px;font-weight:normal;text-align:left;vertical-align:top;">
					<a href="http://www.baidu.com/s?wd=%E6%87%92%E4%BA%BA%E5%9B%BE%E5%BA%93&amp;rsp=8&amp;f=1&amp;oq=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;ie=utf-8&amp;f=3&amp;usm=1&amp;rsv_ers=xn1&amp;rs_src=0">懒人图库</a>
				</th>
				<td style="font-family:arial;font-size:9pt;">
					<br />
				</td>
				<th style="font-family:arial;font-size:14px;font-weight:normal;text-align:left;vertical-align:top;">
					<a href="http://www.baidu.com/s?wd=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%20%E8%8B%B1%E6%96%87&amp;rsp=9&amp;f=1&amp;oq=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;ie=utf-8&amp;f=3&amp;usm=1&amp;rsv_ers=xn1&amp;rs_src=0">关于我们 英文</a>
				</th>
			</tr>
		</tbody>
	</table>
</div>
<div id="search" style="font-size:12px;padding:35px 0px 16px 35px;color:#333333;font-family:arial;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	<span class="bg s_ipt_wr" style="vertical-align:top;"></span><span class="bg s_btn_wr" style="vertical-align:top;"></span><span class="s_help">&nbsp;&nbsp;&nbsp;<a href="http://www.baidu.com/s?wd=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC%E9%A1%B5%E9%9D%A2%E8%AE%BE%E8%AE%A1&amp;tn=baidufir">结果中找</a>&nbsp;&nbsp;&nbsp;<a href="http://help.baidu.com/question" target="_blank">帮助</a>&nbsp;&nbsp;&nbsp;<a id="feedback" href="http://qingting.baidu.com/" target="_blank">反馈意见</a>&nbsp;&nbsp;&nbsp;<a href="http://www.baidu.com/search/jubao.html" target="_blank">举报</a>&nbsp;&nbsp;&nbsp;<a href="http://www.baidu.com/gaoji/advanced.html">高级搜索</a></span>
</div>','0','0','0','1','');


# 数据库表：mxczhyk_article_class 数据信息
INSERT INTO `mxczhyk_article_class` VALUES ('1','1','爱情攻略');
INSERT INTO `mxczhyk_article_class` VALUES ('2','1','行业新闻');
INSERT INTO `mxczhyk_article_class` VALUES ('3','1','机构动态');
INSERT INTO `mxczhyk_article_class` VALUES ('4','1','信托渠道');
INSERT INTO `mxczhyk_article_class` VALUES ('5','1','行业研究');
INSERT INTO `mxczhyk_article_class` VALUES ('6','0','PE');
INSERT INTO `mxczhyk_article_class` VALUES ('7','6','行业动态');
INSERT INTO `mxczhyk_article_class` VALUES ('8','6','募资资讯');
INSERT INTO `mxczhyk_article_class` VALUES ('9','6','上市资讯');
INSERT INTO `mxczhyk_article_class` VALUES ('10','6','大佬语录');
INSERT INTO `mxczhyk_article_class` VALUES ('11','6','投资人物');
INSERT INTO `mxczhyk_article_class` VALUES ('12','6','投资人生');
INSERT INTO `mxczhyk_article_class` VALUES ('13','0','阳光私募');
INSERT INTO `mxczhyk_article_class` VALUES ('14','13','私募动态');
INSERT INTO `mxczhyk_article_class` VALUES ('15','13','私募人物');
INSERT INTO `mxczhyk_article_class` VALUES ('16','13','私募视点');
INSERT INTO `mxczhyk_article_class` VALUES ('17','13','私募研究');
INSERT INTO `mxczhyk_article_class` VALUES ('18','0','债券');
INSERT INTO `mxczhyk_article_class` VALUES ('19','18','债券要闻');
INSERT INTO `mxczhyk_article_class` VALUES ('20','18','债市研究');
INSERT INTO `mxczhyk_article_class` VALUES ('21','18','债券公告');
INSERT INTO `mxczhyk_article_class` VALUES ('22','0','银行');
INSERT INTO `mxczhyk_article_class` VALUES ('23','22','行业动态');
INSERT INTO `mxczhyk_article_class` VALUES ('24','22','理财资讯');
INSERT INTO `mxczhyk_article_class` VALUES ('25','22','观点评论');
INSERT INTO `mxczhyk_article_class` VALUES ('26','22','监管动态');
INSERT INTO `mxczhyk_article_class` VALUES ('27','0','券商');
INSERT INTO `mxczhyk_article_class` VALUES ('28','27','行业动态');
INSERT INTO `mxczhyk_article_class` VALUES ('29','27','研究动态');
INSERT INTO `mxczhyk_article_class` VALUES ('30','27','行业研究');
INSERT INTO `mxczhyk_article_class` VALUES ('31','6','收购并购');
INSERT INTO `mxczhyk_article_class` VALUES ('32','0','网站简介');


# 数据库表：mxczhyk_article_discuss 数据信息
INSERT INTO `mxczhyk_article_discuss` VALUES ('1','1','安顿规范的灯光下长白菜价不能，m.lk/lk/','122223334','2');


# 数据库表：mxczhyk_attention 数据信息


# 数据库表：mxczhyk_business 数据信息
INSERT INTO `mxczhyk_business` VALUES ('1','中北飞软工作室','中北大学','090051','18235146620','857773627','合作内容：设计到网站建设，软件开发，ui设计，网站维护等等','123344455','无');


# 数据库表：mxczhyk_code 数据信息
INSERT INTO `mxczhyk_code` VALUES ('1','阿迪发送到法第三方阿斯蒂芬安瑟安瑟阿斯蒂芬','343223333','1');


# 数据库表：mxczhyk_failedlogin 数据信息
INSERT INTO `mxczhyk_failedlogin` VALUES ('::1','','0','1393934057');


# 数据库表：mxczhyk_findpass 数据信息
INSERT INTO `mxczhyk_findpass` VALUES ('1','10','60','1170601084');


# 数据库表：mxczhyk_gift 数据信息
INSERT INTO `mxczhyk_gift` VALUES ('3','1','礼品名称1','0.00','','','0','0','0','2');


# 数据库表：mxczhyk_gift_record 数据信息


# 数据库表：mxczhyk_gift_type 数据信息
INSERT INTO `mxczhyk_gift_type` VALUES ('1','蛋糕','1','134555444','123456');
INSERT INTO `mxczhyk_gift_type` VALUES ('2','蛋糕1','2','2452345455','345667');
INSERT INTO `mxczhyk_gift_type` VALUES ('3','礼服','0','0','0');


# 数据库表：mxczhyk_guestbook 数据信息


# 数据库表：mxczhyk_invites 数据信息


# 数据库表：mxczhyk_label 数据信息
INSERT INTO `mxczhyk_label` VALUES ('1','高级会员','1','','2','2');
INSERT INTO `mxczhyk_label` VALUES ('2','特级会员','1','','3','1');
INSERT INTO `mxczhyk_label` VALUES ('3','钻石级会员','1','','4','1');
INSERT INTO `mxczhyk_label` VALUES ('4','白富美','1','','1','1');
INSERT INTO `mxczhyk_label` VALUES ('5','高富帅','1','','6','1');
INSERT INTO `mxczhyk_label` VALUES ('6','有房','1','','5','1');


# 数据库表：mxczhyk_link 数据信息
INSERT INTO `mxczhyk_link` VALUES ('1','baadsf','baidu','','百度','1','');
INSERT INTO `mxczhyk_link` VALUES ('2','阿斯顿','asf','','','1','');
INSERT INTO `mxczhyk_link` VALUES ('3','','俺的沙发','','','1','');
INSERT INTO `mxczhyk_link` VALUES ('4','','阿斯顿发','','','1','');
INSERT INTO `mxczhyk_link` VALUES ('5','','阿斯顿发','','','1','');
INSERT INTO `mxczhyk_link` VALUES ('6','','发鬼地方','','','1','');
INSERT INTO `mxczhyk_link` VALUES ('7','','后大发光火','','','1','');
INSERT INTO `mxczhyk_link` VALUES ('9','','家法规和','','','1','');
INSERT INTO `mxczhyk_link` VALUES ('10','','法规和','','','1','');
INSERT INTO `mxczhyk_link` VALUES ('11','','号紧固件','','','1','');
INSERT INTO `mxczhyk_link` VALUES ('12','','飞规划局','','','1','');
INSERT INTO `mxczhyk_link` VALUES ('13','','高合金钢','','','1','');
INSERT INTO `mxczhyk_link` VALUES ('14','','投影仪','','','1','');
INSERT INTO `mxczhyk_link` VALUES ('15','','的复合肥','','','1','');
INSERT INTO `mxczhyk_link` VALUES ('16','','地方很多','','','1','');
INSERT INTO `mxczhyk_link` VALUES ('17','','儿童','','','1','');
INSERT INTO `mxczhyk_link` VALUES ('18','','人体艺术','','','1','');
INSERT INTO `mxczhyk_link` VALUES ('19','','道非道','','','1','');
INSERT INTO `mxczhyk_link` VALUES ('20','','的规范化的','','','1','');
INSERT INTO `mxczhyk_link` VALUES ('21','','地方','','','1','');
INSERT INTO `mxczhyk_link` VALUES ('22','','到法国','','','1','');
INSERT INTO `mxczhyk_link` VALUES ('23','','是','','','1','');


# 数据库表：mxczhyk_marriage_term 数据信息
INSERT INTO `mxczhyk_marriage_term` VALUES ('1','2','银川','宁夏','20-25','1234344432','160以上','无','afsggg','回族','中国','经济与管理学院');
INSERT INTO `mxczhyk_marriage_term` VALUES ('2','3','无','无','12','98675444','0','rsc','该机构','维吾尔','健康和刻录机','合计');


# 数据库表：mxczhyk_member 数据信息
INSERT INTO `mxczhyk_member` VALUES ('4','mxc','mxc@qq.com','e10adc3949ba59abbe56e057f20f883e','个人用户','4','1393325255','1394897769','1','0','2','0','','0');
INSERT INTO `mxczhyk_member` VALUES ('5','马晓成','857773627@qq.com','3f2fbdadc51d569e2f82265c87404470','个人用户','4','1394786078','1394786078','0','0','1','0','','0');
INSERT INTO `mxczhyk_member` VALUES ('6','maxiaocheng','maxiaocheng@qq.com','e10adc3949ba59abbe56e057f20f883e','个人用户','4','1394970409','1394970409','0','0','1','0','','0');
INSERT INTO `mxczhyk_member` VALUES ('7','admin','123@qq.com','e10adc3949ba59abbe56e057f20f883e','','0','2014-05-16 22:15:37','2014-05-16 22:15:37','0','0','2','1','::1','0');
INSERT INTO `mxczhyk_member` VALUES ('8','admin1','admin@qq.com','827ccb0eea8a706c4c34a16891f84e7b','','0','1400330265','1400330265','1','0','2','1','0.0.0.0     ','0');
INSERT INTO `mxczhyk_member` VALUES ('9','admin2','123@qq.com','e10adc3949ba59abbe56e057f20f883e','','0','1400330723','1400330723','1','0','2','1','0.0.0.0','0');
INSERT INTO `mxczhyk_member` VALUES ('10','安顿','1@w.f','827ccb0eea8a706c4c34a16891f84e7b','','0','1400422185','1400422185','1','2147483647','2','1','0.0.0.0','0');
INSERT INTO `mxczhyk_member` VALUES ('11','mayu','123@1.d','e10adc3949ba59abbe56e057f20f883e','','0','1400745525','1400745525','1','12333333','2','1','0.0.0.0','1');
INSERT INTO `mxczhyk_member` VALUES ('12','安顿234','123@w.e','e10adc3949ba59abbe56e057f20f883e','','0','1400748530','1400748530','1','1233333','2','1','0.0.0.0','1');
INSERT INTO `mxczhyk_member` VALUES ('13','马晓清','857773627@qq.com','e10adc3949ba59abbe56e057f20f883e','','0','1401159124','1401159124','1','2147483647','2','1','0.0.0.0','1');
INSERT INTO `mxczhyk_member` VALUES ('14','运用','123333@qq.com','e10adc3949ba59abbe56e057f20f883e','','0','1401501549','1401501549','1','2147483647','2','1','0.0.0.0','1');
INSERT INTO `mxczhyk_member` VALUES ('15','12333333','123333@qq.com','e10adc3949ba59abbe56e057f20f883e','','0','1401501778','1401501778','1','2147483647','2','1','0.0.0.0','1');
INSERT INTO `mxczhyk_member` VALUES ('16','123333334','44444@qq.g','e10adc3949ba59abbe56e057f20f883e','','0','1401501898','1401501898','1','2147483647','2','1','0.0.0.0','1');
INSERT INTO `mxczhyk_member` VALUES ('17','运用1','1233332@qq.com','e10adc3949ba59abbe56e057f20f883e','','0','1401502135','1401502135','1','2147483647','2','1','0.0.0.0','1');


# 数据库表：mxczhyk_member_detail 数据信息
INSERT INTO `mxczhyk_member_detail` VALUES ('1','2','sean','张明','1','汉族','中北大学','经济与管理学院','1','1','0','','','1','1','中国','shanxi','memberd','0','20','173','0','0','','0','0','0','0','0','0','','0','无','34','1','345554333','34532453','34534322','23','12','0','0','0','1','','2','0','','1','','1','2','','0','0','','','','0','1','1','');
INSERT INTO `mxczhyk_member_detail` VALUES ('2','3','adfa','','1','汉族','发的萨菲','','0','1','0','','','1','1','中国','','','0','0','0','0','0','','0','0','0','0','0','0','','0','无','0','1','','','','0','0','0','0','0','1','','2','0','','1','','1','2','','0','0','','','','0','1','1','');
INSERT INTO `mxczhyk_member_detail` VALUES ('3','4','adfa','','1','汉族','','','0','1','0','','','1','1','中国','','','0','0','0','0','0','','0','0','0','0','0','0','','0','无','0','1','','','','0','0','0','0','0','1','','2','0','','1','','1','2','','0','0','','','','0','1','1','');
INSERT INTO `mxczhyk_member_detail` VALUES ('4','10','','安顿','1','汉族','','','0','1','0','','','1','1','中国','','','0','0','0','0','0','','0','0','0','0','0','0','','0','无','0','1','','','','0','0','0','0','1','1','','2','0','','1','','1','2','','0','0','','','','0','1','1','');
INSERT INTO `mxczhyk_member_detail` VALUES ('5','11','','mayu','1','汉族','','','0','1','0','','','1','1','中国','','','0','0','0','0','0','','0','0','0','0','0','0','','0','无','0','1','','','','0','0','0','1','1','1','','2','1','','1','','1','2','','0','0','','','','1','1','1','');
INSERT INTO `mxczhyk_member_detail` VALUES ('6','12','','安顿234','1','汉族','','','0','1','0','','','1','1','中国','','','0','0','0','0','0','','0','0','0','0','0','0','','0','无','0','1','','','','0','0','0','1','1','1','','2','1','','1','','1','2','','0','0','','','','1','1','1','');
INSERT INTO `mxczhyk_member_detail` VALUES ('7','13','','马晓清','1','汉族','','','0','1','0','','','1','1','中国','','','0','0','0','0','0','','0','0','0','0','0','0','','0','无','0','1','','','','0','0','0','1','1','1','','2','1','','1','','1','2','','0','0','','','','1','1','1','');
INSERT INTO `mxczhyk_member_detail` VALUES ('8','14','','运用','1','汉族','','','0','1','0','','','1','1','中国','','','0','0','0','0','0','','0','0','0','0','0','0','','0','无','0','1','','','','0','0','0','1','1','1','','2','1','','1','','1','2','','0','0','','','','1','1','1','');
INSERT INTO `mxczhyk_member_detail` VALUES ('9','15','','12333333','1','汉族','','','0','1','0','','','1','1','中国','','','0','0','0','0','0','','0','0','0','0','0','0','','0','无','0','1','','','','0','0','0','1','1','1','','2','1','','1','','1','2','','0','0','','','','1','1','1','');
INSERT INTO `mxczhyk_member_detail` VALUES ('10','16','','123333334','1','汉族','','','0','1','0','','','1','1','中国','','','0','0','0','0','0','','0','0','0','0','0','0','','0','无','0','1','','','','0','0','0','1','1','1','','2','1','','1','','1','2','','0','0','','','','1','1','1','');
INSERT INTO `mxczhyk_member_detail` VALUES ('11','17','','运用1','1','汉族','','','0','1','0','','','1','1','中国','','','0','0','0','0','0','','0','0','0','0','0','0','','0','无','0','1','','','','0','0','0','1','1','1','','2','1','','1','','1','2','','0','0','','','','1','1','1','');


# 数据库表：mxczhyk_member_spaces 数据信息


# 数据库表：mxczhyk_menu 数据信息
INSERT INTO `mxczhyk_menu` VALUES ('1','Index/index','首页','0','0','1','','1');
INSERT INTO `mxczhyk_menu` VALUES ('2','Recommend/index','站长推荐','0','0','1','','2');
INSERT INTO `mxczhyk_menu` VALUES ('3','Member/index','同校恋爱','0','0','1','','3');
INSERT INTO `mxczhyk_menu` VALUES ('4','City/index','同城恋爱','0','0','1','','4');
INSERT INTO `mxczhyk_menu` VALUES ('5','Nation/index','民族恋情','0','0','1','','5');
INSERT INTO `mxczhyk_menu` VALUES ('6','Article/index','爱情之语','0','0','1','','6');
INSERT INTO `mxczhyk_menu` VALUES ('7','Success/index','牵手恋人','0','0','1','','7');
INSERT INTO `mxczhyk_menu` VALUES ('8','PersonSpace/index','个人中心','0','0','1','','8');


# 数据库表：mxczhyk_message 数据信息


# 数据库表：mxczhyk_mood 数据信息
INSERT INTO `mxczhyk_mood` VALUES ('1','2','阿迪发送到法第三方阿斯蒂芬安瑟安瑟阿斯蒂芬','343223333','0','1','成哥','0');
INSERT INTO `mxczhyk_mood` VALUES ('2','3','阿斯顿发撒撒旦','348973474','0','1','','0');
INSERT INTO `mxczhyk_mood` VALUES ('3','4','阿斯顿发生阿斯顿发生发送','344444445','0','1','','0');
INSERT INTO `mxczhyk_mood` VALUES ('4','5','春风不解风情','99555733','0','1','','0');


# 数据库表：mxczhyk_node 数据信息
INSERT INTO `mxczhyk_node` VALUES ('1','Admin','1','网站后台管理项目','10','0','1');
INSERT INTO `mxczhyk_node` VALUES ('2','Index','1','123123','1','1','2');
INSERT INTO `mxczhyk_node` VALUES ('3','Member','1','','3','1','2');
INSERT INTO `mxczhyk_node` VALUES ('4','Webinfo','1','','4','1','2');
INSERT INTO `mxczhyk_node` VALUES ('5','index','1','','5','2','3');
INSERT INTO `mxczhyk_node` VALUES ('6','myInfo','1','','6','2','3');
INSERT INTO `mxczhyk_node` VALUES ('7','index','1','','7','3','3');
INSERT INTO `mxczhyk_node` VALUES ('8','index','1','','8','14','3');
INSERT INTO `mxczhyk_node` VALUES ('9','addAdmin','1','','9','14','3');
INSERT INTO `mxczhyk_node` VALUES ('10','index','1','','10','4','3');
INSERT INTO `mxczhyk_node` VALUES ('11','setEmailConfig','1','','12','4','3');
INSERT INTO `mxczhyk_node` VALUES ('12','testEmailConfig','1','','0','4','3');
INSERT INTO `mxczhyk_node` VALUES ('13','setSafeConfig','1','','0','4','3');
INSERT INTO `mxczhyk_node` VALUES ('14','Access','1','权限管理，为系统后台管理员设置不同的权限','0','1','2');
INSERT INTO `mxczhyk_node` VALUES ('15','nodeList','1','节点列表信息','0','14','3');
INSERT INTO `mxczhyk_node` VALUES ('16','roleList','1','角色列表查看','0','14','3');
INSERT INTO `mxczhyk_node` VALUES ('17','addRole','1','','0','14','3');
INSERT INTO `mxczhyk_node` VALUES ('18','editRole','1','','0','14','3');
INSERT INTO `mxczhyk_node` VALUES ('19','opNodeStatus','1','','0','14','3');
INSERT INTO `mxczhyk_node` VALUES ('20','opRoleStatus','1','','0','14','3');
INSERT INTO `mxczhyk_node` VALUES ('21','editNode','1','','0','14','3');
INSERT INTO `mxczhyk_node` VALUES ('22','addNode','1','','0','14','3');
INSERT INTO `mxczhyk_node` VALUES ('23','addAdmin','1','','0','14','3');
INSERT INTO `mxczhyk_node` VALUES ('24','editAdmin','1','','0','14','3');
INSERT INTO `mxczhyk_node` VALUES ('25','changeRole','1','','0','14','3');
INSERT INTO `mxczhyk_node` VALUES ('26','News','1','','0','1','2');
INSERT INTO `mxczhyk_node` VALUES ('27','index','1','','0','26','3');
INSERT INTO `mxczhyk_node` VALUES ('28','category','1','','0','26','3');
INSERT INTO `mxczhyk_node` VALUES ('29','add','1','','0','26','3');
INSERT INTO `mxczhyk_node` VALUES ('30','edit','1','','0','26','3');
INSERT INTO `mxczhyk_node` VALUES ('31','del','0','','0','26','3');
INSERT INTO `mxczhyk_node` VALUES ('32','SysData','1','包含数据库备份、还原、打包等','0','1','2');
INSERT INTO `mxczhyk_node` VALUES ('33','index','1','','0','32','3');
INSERT INTO `mxczhyk_node` VALUES ('34','backup','1','','0','32','3');
INSERT INTO `mxczhyk_node` VALUES ('35','restore','1','','0','32','3');
INSERT INTO `mxczhyk_node` VALUES ('36','restoreData','1','','0','32','3');
INSERT INTO `mxczhyk_node` VALUES ('37','delSqlFiles','1','','0','32','3');
INSERT INTO `mxczhyk_node` VALUES ('38','sendSql','1','','0','32','3');
INSERT INTO `mxczhyk_node` VALUES ('39','zipSql','1','','0','32','3');
INSERT INTO `mxczhyk_node` VALUES ('40','zipList','1','','0','32','3');
INSERT INTO `mxczhyk_node` VALUES ('41','unzipSqlfile','1','','0','32','3');
INSERT INTO `mxczhyk_node` VALUES ('42','delZipFiles','1','','0','32','3');
INSERT INTO `mxczhyk_node` VALUES ('43','downFile','1','','0','32','3');
INSERT INTO `mxczhyk_node` VALUES ('44','repair','1','','0','32','3');
INSERT INTO `mxczhyk_node` VALUES ('45','Photo','1','新增模块','5','1','2');
INSERT INTO `mxczhyk_node` VALUES ('46','aa','1','fdsa ','5','32','3');


# 数据库表：mxczhyk_notice 数据信息
INSERT INTO `mxczhyk_notice` VALUES ('1','asdf','1啊啊法撒旦法撒旦发顺丰DasdSDASD','','1399213205','1','','','2');
INSERT INTO `mxczhyk_notice` VALUES ('2','fadfas','阿斯顿发撒旦法安瑟的发生','','','1','','','2');


# 数据库表：mxczhyk_onlinetime 数据信息
INSERT INTO `mxczhyk_onlinetime` VALUES ('1','10','60','1170601084','0');


# 数据库表：mxczhyk_payment 数据信息
INSERT INTO `mxczhyk_payment` VALUES ('1','高级会员','','1');
INSERT INTO `mxczhyk_payment` VALUES ('2','特级会员','','1');
INSERT INTO `mxczhyk_payment` VALUES ('3','钻石级会员','','1');


# 数据库表：mxczhyk_payrecord 数据信息


# 数据库表：mxczhyk_photo 数据信息


# 数据库表：mxczhyk_photo_detail 数据信息


# 数据库表：mxczhyk_privatemessage 数据信息


# 数据库表：mxczhyk_read 数据信息


# 数据库表：mxczhyk_role 数据信息
INSERT INTO `mxczhyk_role` VALUES ('1','超级管理员','0','1','系统内置超级管理员组，不受权限分配账号限制');
INSERT INTO `mxczhyk_role` VALUES ('2','管理员','1','1','拥有系统仅此于超级管理员的权限');
INSERT INTO `mxczhyk_role` VALUES ('3','领导','1','1','拥有所有操作的读权限，无增加、删除、修改的权限');
INSERT INTO `mxczhyk_role` VALUES ('4','测试组','1','1','测试');
INSERT INTO `mxczhyk_role` VALUES ('5','测试组','1','1','这是一个马晓成增加的测试组');
INSERT INTO `mxczhyk_role` VALUES ('6','','1','0','');


# 数据库表：mxczhyk_role_user 数据信息
INSERT INTO `mxczhyk_role_user` VALUES ('2','4');


# 数据库表：mxczhyk_success_object 数据信息


# 数据库表：mxczhyk_vip_space 数据信息
INSERT INTO `mxczhyk_vip_space` VALUES ('2','1','1259550575','60','2009-11-30 11:09:35','1');


# 数据库表：mxczhyk_viptype 数据信息
INSERT INTO `mxczhyk_viptype` VALUES ('1','高级会员');
INSERT INTO `mxczhyk_viptype` VALUES ('2','特级会员');
INSERT INTO `mxczhyk_viptype` VALUES ('3','钻石级会员');
INSERT INTO `mxczhyk_viptype` VALUES ('4','普通会员');
INSERT INTO `mxczhyk_viptype` VALUES ('5','');


# 数据库表：mxczhyk_vote 数据信息


# 数据库表：mxczhyk_vote_log 数据信息


# 数据库表：mxczhyk_vote_option 数据信息


# 数据库表：mxczhyk_webinfo 数据信息
INSERT INTO `mxczhyk_webinfo` VALUES ('1','中北大学研究生院就业信息网','http://grs.nuc.edu.c','中北大学,就业,研究生,研究生就业网','','','<div>© 中北大学研究生院&nbsp;&nbsp;&nbsp;&nbsp;版权所有&nbsp;&nbsp;&nbsp;&nbsp;中北大学研究生院就业信息网</div>
		<div>地址：山西省太原市学院路3号中北大学主楼6层600室&nbsp;&nbsp;&nbsp;&nbsp;邮编：030051</div>
		<div><a href="http://www.feiruan.net" target="_blank">中北飞软工作室制作</a></div>','<h4 align="center">
	《中北大学研究生院就业信息网学生用户协议》
</h4>
<p>
	欢迎您！<br />
请仔细阅读下面的协议，只有接受协议才能继续进行注册。<br />
1．服务条款的确认和接纳<br />
中北大学研究生院就业信息网工作处用户服务的所有权和运作权归 中北大学研究生院就业信息网工作处拥有。 中北大学研究生院就业信息网工作处所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与 中北大学研究生院就业信息网工作处达成协议并接受所有的服务条款。<br />
2．服务简介<br />
用户同意： <br />
1)提供及时、详尽及准确的个人资料。 <br />
2)不断更新资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 <br />
3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下， 中北大学研究生院就业信息网工作处合理地认为用户的行为可能违反上述法律、法规， 中北大学研究生院就业信息网工作处可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。<br />
3． 服务条款的修改<br />
中北大学研究生院就业信息网工作处会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。<br />
4． 服务修订<br />
中北大学研究生院就业信息网工作处保留随时修改或中断服务而不需知照用户的权利。 中北大学研究生院就业信息网工作处行使修改或中断服务的权利，不需对用户或第三方负责。<br />
5． 用户隐私制度<br />
尊重用户个人隐私是 中北大学研究生院就业信息网工作处的 基本政策。 中北大学研究生院就业信息网工作处不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或 中北大学研究生院就业信息网工作处在诚信的基础上认为透露这些信息在以下三种情况是必要的： <br />
1)遵守有关法律规定，遵从合法服务程序。 <br />
2)保持维护 中北大学研究生院就业信息网工作处的商标所有权。 <br />
3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 <br />
4)符合其他相关的要求。 <br />
6．用户的帐号，密码和安全性<br />
一旦激活成功成为 中北大学研究生院就业信息网工作处用户，如果您不保管好自己的帐号信息安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知 中北大学研究生院就业信息网工作处。<br />
7． 免责条款<br />
用户明确同意网站服务的使用由用户个人承担风险。 <br />
中北大学研究生院就业信息网工作处不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过 中北大学研究生院就业信息网工作处服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 <br />
8．有限责任<br />
中北大学研究生院就业信息网工作处对任何直接、间接、偶然、特殊及继起的损害不负责任。<br />
9． 不提供零售和商业性服务 <br />
用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经 中北大学研究生院就业信息网工作处同意，不能利用网站服务进行销售或其他商业用途。<br />
10．用户责任 <br />
用户单独承担传输内容的责任。用户必须遵循： <br />
1)从中国境内向外传输技术性资料时必须符合中国有关法规。 <br />
2)使用网站服务不作非法用途。 <br />
3)不干扰或混乱网络服务。 <br />
4)不在论坛BBS或留言簿发表任何与政治相关的信息。 <br />
5)遵守所有使用网站服务的网络协议、规定、程序和惯例。<br />
6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。<br />
7)不得利用本站制作、复制和传播下列信息： <br />
1、煽动抗拒、破坏宪法和法律、行政法规实施的；<br />
2、煽动颠覆国家政权，推翻社会主义制度的；<br />
3、煽动分裂国家、破坏国家统一的；<br />
4、煽动民族仇恨、民族歧视，破坏民族团结的；<br />
5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；<br />
6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；<br />
7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；<br />
8、损害国家机关信誉的；<br />
9、其他违反宪法和法律行政法规的；<br />
10、进行商业广告行为的。<br />
用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款， 中北大学研究生院就业信息网工作处将取消用户服务帐号。<br />
11．网站内容的所有权<br />
中北大学研究生院就业信息网工作处定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容； 中北大学研究生院就业信息网工作处为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在 中北大学研究生院就业信息网工作处和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。<br />
12．附加信息服务<br />
用户在享用 中北大学研究生院就业信息网工作处提供的免费服务的同时，同意接受 中北大学研究生院就业信息网工作处提供的各类附加信息服务。<br />
13．解释权<br />
本激活协议的解释权归 中北大学研究生院就业信息网工作处所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。
</p>','','','','','','','0');


# 数据库表：mxczhyk_words 数据信息
