# -----------------------------------------------------------
# 邀99大学恋爱网管理数据库
# Blog: http://www.feiruan.net
# Type: 系统自动备份
# Description:当前SQL文件包含了表：mxczhyk_access、mxczhyk_activity、mxczhyk_activityapply、mxczhyk_admin、mxczhyk_advertisement、mxczhyk_article、mxczhyk_article_class、mxczhyk_article_discuss、mxczhyk_attention、mxczhyk_business、mxczhyk_code、mxczhyk_failedlogin、mxczhyk_findpass、mxczhyk_gift、mxczhyk_gift_record、mxczhyk_gift_type、mxczhyk_guestbook、mxczhyk_invites、mxczhyk_label、mxczhyk_link、mxczhyk_marriage_term、mxczhyk_member、mxczhyk_member_detail、mxczhyk_member_spaces、mxczhyk_menu、mxczhyk_message、mxczhyk_mood、mxczhyk_node、mxczhyk_notice、mxczhyk_onlinetime、mxczhyk_payment、mxczhyk_payrecord、mxczhyk_photo、mxczhyk_photo_detail、mxczhyk_privatemessage、mxczhyk_read、mxczhyk_role、mxczhyk_role_user、mxczhyk_success_object、mxczhyk_vip_space、mxczhyk_viptype、mxczhyk_vote、mxczhyk_vote_log、mxczhyk_vote_option、mxczhyk_webinfo、mxczhyk_words的结构信息，表：mxczhyk_access、mxczhyk_activity、mxczhyk_activityapply、mxczhyk_admin、mxczhyk_advertisement、mxczhyk_article、mxczhyk_article_class、mxczhyk_article_discuss、mxczhyk_attention、mxczhyk_business、mxczhyk_code、mxczhyk_failedlogin、mxczhyk_findpass、mxczhyk_gift、mxczhyk_gift_record、mxczhyk_gift_type、mxczhyk_guestbook、mxczhyk_invites、mxczhyk_label、mxczhyk_link、mxczhyk_marriage_term、mxczhyk_member、mxczhyk_member_detail、mxczhyk_member_spaces、mxczhyk_menu、mxczhyk_message、mxczhyk_mood、mxczhyk_node、mxczhyk_notice、mxczhyk_onlinetime、mxczhyk_payment、mxczhyk_payrecord、mxczhyk_photo、mxczhyk_photo_detail、mxczhyk_privatemessage、mxczhyk_read、mxczhyk_role、mxczhyk_role_user、mxczhyk_success_object、mxczhyk_vip_space、mxczhyk_viptype、mxczhyk_vote、mxczhyk_vote_log、mxczhyk_vote_option、mxczhyk_webinfo、mxczhyk_words的数据
# Time: 2014-06-06 15:34:07
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='活动表' ;

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
  `apv` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='文章详细表' ;

# 数据库表：mxczhyk_article_class 结构信息
DROP TABLE IF EXISTS `mxczhyk_article_class`;
CREATE TABLE `mxczhyk_article_class` (
  `cid` mediumint(5) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `pid` int(5) NOT NULL COMMENT 'parentCategory上级分类',
  `type_name` varchar(20) NOT NULL COMMENT '分类名称',
  `sys_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1非系统；2系统',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文章分类表' ;

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='标签表' ;

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
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='友情链接' ;

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
INSERT INTO `mxczhyk_activity` VALUES ('1','中北大学模特大赛','2','123','0000-00-00 00:00:00','0000-00-00 00:00:00','中北大学','1','1','12','23','中北大学','切尔去玩儿撒发生的假发是快递费那时就考虑到非那时快家里电脑发生考虑到放假阿斯顿你家阿斯顿几年级啊','1','');
INSERT INTO `mxczhyk_activity` VALUES ('2','山西财经大学交谊舞大赛','2','123','0000-00-00 00:00:00','0000-00-00 00:00:00','2134','2','1','1234','0','','123423按时发生安瑟AFS发生AFS安瑟','1','');
INSERT INTO `mxczhyk_activity` VALUES ('3','街舞比赛','0','0','0000-00-00 00:00:00','0000-00-00 00:00:00','','','1','0','0','','','1','');
INSERT INTO `mxczhyk_activity` VALUES ('4','草坪音乐节','0','1000','2014-06-04 17:02:32','2014-06-02 17:02:26','草坪公园','交友','1','532','0','广州大学','','1','');
INSERT INTO `mxczhyk_activity` VALUES ('5','爱情漂流瓶','0','500','2014-05-02 17:05:22','2014-05-14 17:05:27','中央大道','爱情许愿','1','300','0','中北大学','','1','');
INSERT INTO `mxczhyk_activity` VALUES ('6','三行情诗','0','1200','2014-02-02 17:07:41','2014-02-27 17:07:46','中央大道','情书','1','1000','0','中北大学','','1','');


# 数据库表：mxczhyk_activityapply 数据信息


# 数据库表：mxczhyk_admin 数据信息
INSERT INTO `mxczhyk_admin` VALUES ('1','超级管理员','admin@qq.com','9a0e23021a6eabc8a321c650d6223bc7','1','我是超级管理员 哈哈~~','','1395405387','1');
INSERT INTO `mxczhyk_admin` VALUES ('4','','857773627@qq.com','9a0e23021a6eabc8a321c650d6223bc7','1','管理员测试','','1397909151','1');


# 数据库表：mxczhyk_advertisement 数据信息
INSERT INTO `mxczhyk_advertisement` VALUES ('2','无','0','无','按规定法规和','1','','0','0','','2','0','','');
INSERT INTO `mxczhyk_advertisement` VALUES ('3','无','0','无','大概是','1','','0','0','','2','0','','');


# 数据库表：mxczhyk_article 数据信息
INSERT INTO `mxczhyk_article` VALUES ('1','1','0','1','爱情技巧','I Love You','恋爱宝典，教会你怎么恋爱','','　一、 每天至少对她说一遍 <span>" I Love You" </span>。 <br />
<br />
　　二、 在她的朋友或同事面前表现出你对他的热情。 <br />
<br />
　　三、 让她看见你把她的照片放在你的皮钱夹里。 <br />
<br />
　　四、 学真笔大哥，帮她洗洗头发。 <br />
<br />
　　五、 听她说话时，看着她的眼睛，偶尔用手温柔地抚摸一下她的头发。 <br />
<br />
　　六、 不时买小礼物给她，哪怕是一个发卡。 <br />
<br />
　　七、 牵手时，不要让她觉得你的手软弱无力。 <br />
<br />
　　八、 晚上约会时，多穿一件衣服，可以随时给美丽"冻"人的她披上带有你体温的外套，自己又不至于感冒。 <br />
<br />
　　九、不时给她点小惊喜，比如在她家楼下打电话说你不能去看好了，然后就跑上楼摁门铃。 <br />
<br />
　　十、看到报纸（短信）上有她感兴趣的内容，大声读出来或剪下来给她。就作出欢天喜地的样子 。','1390561008','1390561028','0','1','','0');
INSERT INTO `mxczhyk_article` VALUES ('2','5','0','0','网站介绍','关于我们','这是邀99团队介绍','','<div class="right_main about">
	<p>
		中国电子科技集团公司第五十四研究所始建于1952年，是新中国成立的第一个电信技术研究所，是我国目前电子信息领域专
业覆盖面最宽、规模最大的综 
合性骨干研究所之一，相继参与完成了“两弹一星”、“载人航天”、“国防电子信息系统”、“嫦娥探月”、“北斗卫星导航系统”、“上海天文台65米射电望
 远镜天线项目”等数百项国家和国防重大工程建设，是国家授权的电子工程甲级设计单位、电子工程专业承包壹级资质单位和工程咨询甲级资格单位。。
	</p>
	<p>
		<img alt="" src="http://www.cti.ac.cn/uploads/allimg/130718/1_130718160857_1.jpg" border="0" height="130" width="598" /> 
	</p>
	<p>
		五 
十四所位于河北省省会石家庄市，工作区占地面积约960亩，全所目前从业人员7000余人，其中科技人员4800余人，博士、硕士研究生1200余人。科
技人员中有工程院士1人，研究员和高级工程师1000余人，国家级突出贡献专家5人，省部级突出贡献专家19人，享受政府特殊津贴人员85人。所里建有具
 有硕士学位授予权的教育学院和省内规模最大的博士后工作站，自主培养高端科技人才。
	</p>
	<p>
		<img alt="" src="http://www.cti.ac.cn/uploads/allimg/130718/1_130718160911_1.jpg" border="0" height="37" width="337" /> 
	</p>
	<p>
		五十四所技术实力雄厚，专业覆盖面广。所内下设 
9个事业部，5个国家级和部级研发中心，1个国家重点实验室，主要从事通信、卫星导航定位、航天航空测控、通信与信息对抗、航天电子信息系统与综合应用等
前沿领域的技术研发和系统集成。建所以来，已取得包括我国第一台千门级数字程控交换机、第一个15米数字式卫星通信地球站、第一套北斗导航卫星数据分发系
 统在内的重大科研成果4034项，获得国家授权专利512项，其中有200余项成果达到国际先进水平，有108项成果获得国家科技进步奖。
	</p>
	<p style="text-align:center;">
		<img alt="" src="http://www.cti.ac.cn/uploads/allimg/130726/1_130726164000_1.jpg" border="0" height="525" width="700" /> 
	</p>
	<p>
		凭借多专业综合优势和强大的技术创新能力，五十四所不断加大产品开发和技术应用的力度，先后在石家庄、北京等地组建了河北远东、中华通信、中电信
息、远东哈里斯等多家高科技企业，产品覆盖国防安全、能源、交通、信息、金融、应急抢险等国民经济各领域，行销全球十多个国家和地区。
	</p>
	<p>
		以“兴电子信息伟业，振国防科技雄风”为己任，五十四所坚持用一流的产品和质量服务于社会，靠不断创新和讲求诚信实现与用户共同发展，将在新的征途上不断创造新的辉煌。
	</p>
	<p>
		<br />
	</p>
</div>','0','0','0','1','','0');
INSERT INTO `mxczhyk_article` VALUES ('3','2','0','0','恋爱故事','恋爱杂想','美丽的爱情故事多多少少总让人留恋！','','多年之后，你会轻易忘记谁？当你听到谁的名字会为之颤动？当你忙里抽闲整理自己的行李时，发现多年前TA送你的礼物。从TA离开你的世界开始，那些
可以珍藏很久的纪念，随之留在那个只属于我们的过去。什么时候起，那个你送我的第一个礼物，却夹在我衬衫里那么久，我呆呆的反思了很久，那些誓言还能泛滥
吗？也许唯一那么一次，对一个女生说了无法兑现的承诺，也是最后一次不再说那些。没有真正心动过得人，是不懂得若即若离的相思之痛，没有彼此信任，是无法
顶住绝望的崩溃。<br />
　　<br />
　　如果有人问我:你还会追悔那个被你伤害的女生吗？我想:也许当最好的朋友收获<a href="http://www.jj59.com/zti/xingfu/" class="keywordlink">幸福</a>时，我会想起那个被自己毁灭的两个人世界，而不会后悔曾经的决定，我想也许她也这么认为，毕竟那步不是一个人迈出的。如今自己还可以停留大学，聆听<a href="http://www.jj59.com/zti/qingchun/" class="keywordlink">青春</a>最甜的蜜语。学院街旁，总是伫立着许多焦急等候之人，TA们相互独立，似乎没有交集，可目的都是一样的。也许这种等候的<a href="http://www.jj59.com/xinqingsuibi/" class="keywordlink">心情</a>，复杂而又期许。<br />
　　<br />
　　我听过一首歌，歌名是“当爱在靠近时”，刚开始我未能体会到，大学让我<a href="http://www.jj59.com/zti/jiyi/" class="keywordlink">记忆</a>犹新的是一起早起吃早餐，虽然屈指可数的早餐，但对于未能有勇气起来的我们，是一件需要毅力坚持下去，而现在的我们，怎么也摆脱不了邋遢与懒惰。我一直坚信<a href="http://www.jj59.com/30/" class="keywordlink">恋爱</a>可以让一个成熟起来，甚至能让你有勇气面对一个属于两个人怎样的未来（一场真爱），恋爱需要改变彼此，是一个完善自我的过程，有时朋友，甚至家人都没法让你改变的臭毛病，也许一场恋爱，你会尝试正视自己身上的问题。我听说，当自己心情不好时，眺望远方，去看<a href="http://www.jj59.com/zti/dahai/" class="keywordlink">大海</a>，能给自己很多莫名的力量，也许有时自己缺乏的是远见，记得2012年6月，当自己最后一次去大学，突然觉得压抑起来，望着列车前进的方向，<a href="http://www.jj59.com/zheliwenzhang/" class="keywordlink">人生</a>是无法重来的里程，窗外景<a href="http://www.jj59.com/zti/se/" class="keywordlink">色</a>在退后，可是自己的目的地从未改变，没有理由说服自己退后。我和TA分手半年后，毕业典礼合影那天，我从镜头外观察了她，也许关于她的一切与纪念，恐怕除了那时的记忆，什么都没有了。<br />
　　<br />
　　美丽的错误，留给青春，才能让我渐步成长，如果下段<a href="http://www.jj59.com/zti/ganqing/" class="keywordlink">感情</a>开始的话，我不希望对方还有<a href="http://www.jj59.com/zti/chulian/" class="keywordlink">初恋</a>情结，我不想给一位女生上恋爱课，特别拿自己做实验。初恋充满着那么多盲目色彩，虽然有些人最终还会义无反顾的选择初衷，但为了找回那份失而复得的“拥有”，不合适终究难逃分开的审判。记得当初有句话，<a href="http://www.jj59.com/zti/diyici/" class="keywordlink">第一次</a>听到让我<a href="http://www.jj59.com/ganrengandong/" class="keywordlink">感动</a>很久，“如果全世界都背叛了你，我都不会抛弃你”，这句话，就似一句谎言里的誓言，第一次我会深信不疑，甚至笃信至今，第二次，也许对于某类人，我可能还会相信，第三次，会对某个人，相信……这样是不是很傻，寻找幸福的路，有些人历经<a href="http://www.jj59.com/" class="keywordlink">九九</a>八十一难，有些人被安排幸福，有些人注定做错了需要负责，有些人在幸福门外徘徊，有些人在拼命争取...这个世界就是这样-矛盾，不可理喻。我们都在寻求自己喜欢的，不留余地，不委屈自己，如果一旦放低标准，或多或小会便宜另一种标准之人。<br />
　　<br />
　　不过，只要记得喜欢、无悔就好。关于内涵与外貌问题，长相是天生的，丑小鸭变天鹅的<a href="http://www.jj59.com" class="keywordlink">故事</a>肯定有，但也有天鹅变丑小鸭的，每个人外貌随<a href="http://www.jj59.com/zti/time/" class="keywordlink">时间</a>成长，衰老。最美年华不过短暂十余年。这样说，不代表我强调内涵，每个人最先表现的具体客观得的外貌，决定第一印象如何，内涵用语言<a href="http://www.jj59.com" class="keywordlink">文字</a>恐
怕很难定位，而且媒介不会得到一个最真实得人，不加修饰的人，在这个时代恐怕难以立位。内涵修养相比外貌重要，是大部分人认为，甚至决定一个人，或者多个
人的幸福，内涵外在表现可以是性格，脾气，价值观，为人处事的行为能力……有人说，拿学历去鉴定一个修养高低是否正确？不能说全错，毕竟学习知识就是提高
修养的最佳途径，但毕竟一个人的人生会经历过什么样遭遇，促使怎样的性格形成也是关键，社会上也会出现高级犯罪人物！<br />
　　<br />
　　现在有个同学，他问我，看见别人恋爱成本怎么如此高啊，比他每天吃零食、上网都高，我也不能嘲笑他，也许他是局外人，不懂情有可原，我的回答自然简单
“那是考验你愿不愿为她花钱？”。也许拿某种动物形容大部分女生性情，我觉得猫比较合适，因为猫吃软不吃硬，顺着好说话，哄着她才乖，而且猫的第六感也很
准，生气喜欢挠人。记得转载过一篇<a href="http://www.jj59.com" class="keywordlink">日志</a>，当<a href="http://www.jj59.com/zti/nvren/" class="keywordlink">女人</a>失
去猫性时，你就可以决定离开她了，我结合实际反思这个问题，这样理解，也许能说服我自己，当女人都像李宇春时，你就可以果断离开她了。有个朋友问我，你会
期待什么样的恋爱，我告诉他“我没有期待的时间，何种形式的恋爱，我相信，那个人就快出现，因为明天我和她就在一起……”。
<p>
	关于恋爱的成长，其实，在这里，没有值得分享的，有些空白是让<a href="http://www.jj59.com" class="keywordlink">伤感</a>埋没了很久。我渐渐的也从记忆的轮回中惊醒，每年光棍节，我都会很开心的与结识的朋友会餐，也是这一天，我“祭奠”那些过客与美丽的错误，也是那天，我习惯性的买啤酒喝，随未一醉解千愁，但内心坦然许多。不知道有一天“脱光”了，我会告诉她，那天我很<a href="http://www.jj59.com/zti/kuaile/" class="keywordlink">快乐</a>，因为那天，我会告诉那些我喜欢过的人，我很想念你们。记得有个异性朋友问我“是不是舍不得摆脱单身”，我说“我在等一个人的回答，她答应了，我就过<a href="http://www.jj59.com/zti/qingrenjie/" class="keywordlink">情人节</a>！”关于分手之后的<a href="http://www.jj59.com/zti/shenghuo/" class="keywordlink">生活</a>，大学恋爱与社会恋爱不同的是，大学恋爱造成的心理阴影很大，也许懵懂的心，会将错误的一半归咎自己，这样因人而异的进行缓解，最好的办法就是去一座陌生城市，给心情放假，随着时间的推移，对某个人的追忆就会不知不觉中淡忘。
</p>
我想，释然与豁达，必经缠绵纠葛。当你想不开时，就仰望天空，世界留在你脚下，星宇尽在你眼中，你拥有了一切，你只是抛弃了这世界的一部分而已。当
我翻来那些极有眼缘的女生照片时，对照今日的变化，发现自己当初的只看外貌的习惯延续到现在，对于漂亮的趋之若鹜，算是情理之中的吧！也许自己没有被漂亮
欺骗过，电影“画皮”正揭示了这个道理，漂亮能降低人的判断与提防能力，毕竟哲学上说“感性认识不可靠”，但感性认识也需要积累。人生百态，事事善变，也
许等候与主动都会历经属于自己的<a href="http://www.jj59.com/qinggantiandi/" class="keywordlink">情感</a>的追问，也许你心灵清澈见底，或许你备受拷问，再者你历经沧桑迁变..','0','0','0','1','','0');
INSERT INTO `mxczhyk_article` VALUES ('4','2','0','0','爱情故事','寻找千年前的记忆','当你来到一个陌生的地方时，有时候你是否感觉到似曾相识？或许那就是你前世的记忆','','&nbsp;&nbsp;&nbsp; 今天早上外面下起了鹅毛大雪，这是今年绥芬河下的第一场雪，我像往常一样拿着素描本和铅笔去学画画，老师说：“你们的基本功已经很扎实了，今天咱们要练习人物速写，你们可以画<a href="http://www.puresky.org/news/wang/" target="_blank">自己</a>最爱的人，或者最值得你尊敬的人，当然也可以画我了。”
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	我们在底下“呵呵”地笑起来。老师继续说：“但是我不给你们参照物，只能凭你们的记忆来画出你心中的人，好了，画吧，一会画好了就来找我。”说完，他坐在椅子上等着我们的作品。
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	我把本放在架子上，手里拿着笔，随心画着，整只右手好像不听使唤一样它<a href="http://www.puresky.org/news/wang/" target="_blank">自己</a>有灵性的在纸上画着，不一会，我发现我画出了一位古代的女子，她面目清秀，圆脸，长着一双大眼睛。虽然还没有画完但是我能看出来这是一位古代的女子。不一会，我把本子递给老师，他提了提眼镜。此时我的心好紧张，害怕因为我画的不好被他臭骂一顿。但是却出乎我的意料，他笑了笑说：“不错，你进步挺快，这是你在电视剧上看的吧！”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“嗯……”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“那部电视剧叫什么名字啊？”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“啊……”就在这时我却不知道该怎么说，我总不能说我随便画的吧，如果那样他不得把我当神经病了。
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“呵呵，忘了？”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“啊……是啊……可能是小时候看的吧。”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	他把本子放在一边，抬头说：“我能感觉到这是你刚才随便画的，其实你也不知道她是谁，对吧！”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	我愣住了，居然被他猜到了，他继续说道：“其实这是在你脑子里的一个记忆碎片，她或许是你小时候看的电视剧、做的梦或者是杂志封面上看到了，只是你忘了，有时候我们会看到什么东西干道似曾相识这就是因为在你记忆边缘的缘故，那只是你在哪里见过但是又忘了才会产生的现象。”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	我被老师说的不知该说什么好，放学时回来的路上我总在回忆老师说过的话，到家里也在想、吃饭、睡觉都在想那句话。
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	直到一天早上，一位<a href="http://www.puresky.org/news/friend/" target="_blank">朋友</a>帮我请来一位牧师，他和一位教徒来到我家，我让他们坐在客厅了，先给他们倒一杯茶，这位牧师一张娃娃脸，穿着一身整洁的西服，他说：“我听你<a href="http://www.puresky.org/news/friend/" target="_blank">朋友</a>说你每天都心神不正你在想什么？告诉我，我会帮你的。”我把那天的事情都说给他听，他笑了笑说：“没想到这你都能想到，既然你都想到了那我就让你知道你的过去。”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	我的过去？我知道这个“过去”绝对不是一般的“过去。”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“其实很多人都会对我说什么想起前世的经过什么的，那么我让你回到你的前生怎么样？”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	我说：“我笑了笑，骗子都是这样骗人的，你是不是骗子啊？”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“无可奉告，是，也可能不是。”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“那要不要花钱啊？”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“花，也可能不花。”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“那对我没有伤害吗？”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“有，也可能没有。”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	我一下站起来怒斥：“你到底是来胡闹还是来听<a href="http://www.puresky.org/news/known/" target="_blank">故事</a>的？”他被我吓的一哆嗦，拿出一个十字架，“躺在沙发上，看着它，现在就让你回到了几千年前，你会知道一切的，这是免费的。”我看着那十字架，渐渐的有一种想睡觉的感觉。他说：“到了那里你没有手机、没有人民币总之现代有的到那里你什么都没有。”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“那我什么时候完事啊？”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“这我说了算，你要好好珍惜这次机会。”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“顺便问一下，你叫什么啊？”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“我叫柯北，既是牧师也是一名侦探。”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“啊？你真的不是柯南吗？”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“你先别管，专心看着它。“
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	随后一股刺眼的光芒覆盖了我整个人，仿佛穿越了一条无底的隧道，顿时感到一阵眩晕……
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	不知过了多久，当我睁开眼睛时发现我在一片雪地里，四周白茫茫的，这里没有高楼大厦，空气惊人的清晰。
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	我沿着一条被人踩平的草地走，不一会只听见“叽叽喳喳”的声音，我一眼望去——我竟然回到了唐朝！公元761年！那些人穿着和古装片里一模一样的衣服。突然，我听见不远处有求救声，我立即跑了过去，原来是个小<a href="http://www.puresky.org/news/qingchun/" target="_blank">男孩</a>落水了，周围没有一个人干下去，况且水面已经结冰了，不能见死不救，我没来得及脱衣服就跳下去了，水冷得刺骨，还好我水性很好一把拉住那个孩子的手，奋力往岸边游，到了岸边发现他还没有昏过去，只是咳嗽了两声就醒了，但是他睁开眼睛却是惊讶的目光。
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	原来他是当地高家的少爷才六岁，高家人很热情，他们把我安排到一间屋里，换上唐装，但是穿上唐装感觉很不合适，穿了半个小时也没穿上，旁边的那几个小<a href="http://www.puresky.org/news/friend/" target="_blank">朋友</a>也都笑话我，不一会来了一位丫鬟帮我穿上了衣服，我看着她，她和我画的那幅画一模一样，于是我问：“ 能问一下你叫什么名字吗？”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“小女子名叫方小英，今年十七岁。”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	晚上吃饭时院里人声鼎沸，我和高太太做在一起，她问：“看你这身打扮不是本国人吧。”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“恩，应该说是和你们一个国的，只不过我是从一千多年前来到这的。”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	旁边的几个丫鬟忍不住笑了一下，她继续问：“那和我们一个过的问什么穿洋装啊？”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“这不叫洋装，其实到我们那个年代的人都穿这种衣服。”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“那你来这里干什么啊。”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“我……我只是来找回我曾经的记忆的，时间一到我还要回去。”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“曾经的记忆？”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“我从小就不知道为什么，脑子里都是些乱七八糟的记忆碎片，后来我一个<a href="http://www.puresky.org/news/friend/" target="_blank">朋友</a>给我介绍过来一位牧师，是那个牧师让我来到这的。”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	“哦，”她看了看另一桌吃饭的方小英，“你是不是看上我家的小英了？”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	我一愣!她笑了笑说：“没准你找的就是她，我从你的眼睛了看得出来你<a href="http://www.puresky.org/news/qingchun/" target="_blank">喜欢</a>她，这样吧，明天我让她和你一起去山看看风景，顺便也让你恢复一些记忆。其实，我相公早早的就死了，就留下我这个老婆子和这个丫头，这些年来她一直跟着我，从没让我失望过。”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	早上，外面下了好大的雪，我刚走出屋小英就走过来说：“老妇人叫我和你去山上。”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	我和她走在山上，她是个很内向很腼腆的家伙，这一路上来都没说几句话，还是我先起的头：“喂，这山上有什么好看的？”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	她说：“我是带你去看看我以前生活的地方。”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	我只好跟着她走，雪越下越大，她突然说：“喂，你看——”我顺着她指着的方向望去，那是一个破旧的小木屋，我跟着她走了过去，她说：“这就是我以前生活的地方，你来下。”我和她来到了房后，那里赫然立着几座坟，她指着说：“这是我娘的，这是我爹的，还有这个，这是我相公的。”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	我蹲下来，看到她所说的相公的坟墓——宏盛！我想起来了。
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	她的眼睛里已满是泪水：“我把他们都葬在我家的后面，小时候，我和宏盛约好了张大要做一对夫妻，因为我们的关系太好了，直到那年，马贼要屠杀我们村子，一夜之间村里就死了几百人，我被埋在私人对了整整一天一夜，后来我便流浪街头，有一天，我饿得实在不行了，幸好遇见了贵人，她肯收留我，她就是高夫人，在他身边当了十多年的丫鬟了，我没有收她一分银子，我把他们都葬在我家的后面，有时间我就会过来和他们聊天，还有这个。”她从她相公的坟墓后面拿出一把笛子：“有时候我还会吹笛子给我的相公听，小时候我最<a href="http://www.puresky.org/news/qingchun/" target="_blank">喜欢</a>听他吹笛子了，但是长大了却再也听不到了。”
</p>
<p style="font-size:12px;color:#333333;font-family:Simsun;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;">
	那天马贼血洗整个村庄，我记得他们在村子里烧杀抢掠夺，无数的金银首饰都落在他们手里了，后来我躲在了一口井里，到了晚上本以为他们都走了，可是没走几步一把刀当头砍了过来，幸好我躲得及时，我回头就跑，没跑多远，一把短刀刺进了身体里，随后那人轻轻一挥动手指我整个身体就四分五裂了，看着她哭得那么<a href="http://www.puresky.org/news/sorrow/" target="_blank">伤心</a>我不知道是否该告诉她我就是陈宏盛……”
</p>
<br />','0','0','0','1','','0');
INSERT INTO `mxczhyk_article` VALUES ('5','1','0','0','爱情技巧','女生恋爱技巧','男生可以追自己的喜欢的人，女生一样可以！','','<p style="color:#333333;font-family:tahoma, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;">
	女生谈<a href="http://love.heima.com/html/c36/" target="_blank">恋爱</a>也要讲究技巧的!要注意(不是紧盯)男生的眼神，理智地判断男生的<a href="http://love.heima.com/html/test/" target="_blank">心理</a>，但是又不能让心仪的男生对你敬而远之，这里教你一些恋爱中比较实用的小技巧，保准儿能让<a href="http://love.heima.com/NanRenNvRen/" target="_blank">男人</a>为你神魂颠倒!但是千万记住要把握分寸哦!
</p>
<p style="color:#333333;font-family:tahoma, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;">
	1、学会职业性的微笑，穿职业女装和他见面，意思是告诉他，我不是小孩子，而且我和你不是太随便的。往往这么一件衣服可以改变一个人。
</p>
<p style="color:#333333;font-family:tahoma, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;">
	2、要学会害羞，这个是一定的哦，即使你不会害羞，也要在某些时候双手捂脸，一个扭头，讨厌了!尽管这个词很酸，但是依旧要用的。
</p>
<p style="color:#333333;font-family:tahoma, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;">
	3、知道是他打来的电话，要等到铃声响了8遍以后再接听，不要太焦急，哪怕你是那么地想听他的声音。
</p>
<p style="color:#333333;font-family:tahoma, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;">
	4、吃饭时，适当的AA制几回，偶尔也要请他吃一些东西，比如，冰激凌，瓜子，薯条什么的，在吃的时候，给他纸巾，但不要为他擦嘴。
</p>
<p style="color:#333333;font-family:tahoma, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;">
	5、托着自己的腮帮子不说话，与他在公园<a href="http://love.heima.com/html/c36/" target="_blank">约会</a>时，看看星星，或者云彩，做沉思状，男人往往对有思想有深度的<a href="http://love.heima.com/NanRenNvRen/" target="_blank">女人</a>爱而且敬之。
</p>
<p style="color:#333333;font-family:tahoma, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;">
	6、学习在他面前弯腰拣东西，相隔不要太近，也不要太远，以一米到一米五为最佳，不要小看这个动作，这是个很<a href="http://love.heima.com/html/c51/" target="_blank">性感</a>的动作，略带了那么一点诱惑，其他的都是他的事了，与你无关。
</p>
<p style="color:#333333;font-family:tahoma, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;">
	7、在约会的时候迟迟到，但是不要形成习惯，而且不要迟到的时间太长，5到10分钟为最佳，到了以后记得有一句，对不起，我来晚了。
</p>
<p style="color:#333333;font-family:tahoma, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;">
	8、可以吵架。生活里不仅仅是甜，也要有别的风味，要不怎能感觉到甜呢?偶尔的不讲理，撒娇埋怨，最后负气离开，切记一点啊，优雅地转身离开。
</p>
<p style="color:#333333;font-family:tahoma, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;">
	9、挣他的怀抱，顺便帮他打打衣服或者扫一扫肩膀上的灰尘，哪怕身上一点都不脏，也要虚晃?这是我们的刚柔并济。
</p>
<p style="color:#333333;font-family:tahoma, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;">
	10、接吻时要拒绝一下，尤其是湿吻，能不让吻就别吻，但是还要安慰他一下，吻一下他的脸，不必太重，点到为止。
</p>
<p style="color:#333333;font-family:tahoma, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;">
	11、亲热的举动从牵手开始，至拥抱，再到接吻，但是不要再往下了。
</p>
<p style="color:#333333;font-family:tahoma, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;">
	12、记得关注他，不仅仅只是陪他玩，关键是要关心他的事业，工作，身体，<a href="http://love.heima.com/HunYinJiaTing/" target="_blank">家庭</a>等等，要让他知道，你是可以对他很有帮助的人。
</p>
<p style="color:#333333;font-family:tahoma, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;">
	13、约会的地点不要总是在一些光线不够好或者不够幽雅的地方，约他去音乐厅，展览馆之类的。
</p>
<p style="color:#333333;font-family:tahoma, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;">
	14、准备一些口香糖或者含片之类的，在他对你提出过分要求时，给他塞一片，调皮地却又不失尊严，而且有一种不可侵犯的感觉。
</p>
<p style="color:#333333;font-family:tahoma, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;">
	15、不必什么都跟他讲，要有一种神秘的感觉，永远给他一个迷惑。
</p>
<p style="color:#333333;font-family:tahoma, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;">
	16、天冷的时候可以把你的冰冷的小手塞进他的衣服里取暖，但是记得是上半身，而不是下半身，不要塞到牛仔裤的后袋里，男人的下半身容易燃烧。
</p>
<p style="color:#333333;font-family:tahoma, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;">
	17、在面对面的时候不要说太过于亲昵的话，目光也飘忽一点，亲热的话在电话里说，约会时尽量保持一个端正的姿态，不要躺，不要倒，多站立，不要让自己处于一种被动的沦陷状态。
</p>
<p style="color:#333333;font-family:tahoma, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;">
	18、要永远会说一句话：对不起，还不是时候。这句是公理。
</p>','0','0','0','1','','0');
INSERT INTO `mxczhyk_article` VALUES ('6','1','0','0','文字随便','我属于谁','我穿过山川树林，只想知道我属于谁！','','<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	我走过大山，山中的小溪对我说，那<a href="http://www.duanwenxue.com/diary/jimo/">寂寞</a>且峥嵘的山岩是孤独的伙伴。林涛滚滚是空寂的发泄。空荡荡的山谷中，我仿佛听到了蚂蚁行走时的脚步声。
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	我属于林涛，还是属于山岩？
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	我走过草原，草原上的百灵鸟对我说，草原很辽阔，但只有一季的美丽。草原也很苍凉，也很空旷。蓝天上那只苍鹰，无奈的划破长空的寂寥，我仿佛听到了小草生长时拔节的声音。荒草地上，只有鹰的影子孤单地掠过。
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	我属于苍鹰，还是属于寂寥的长空？
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	我也走过许多大都市，光怪陆离的霓红灯，如雪片纷飞的广告对我说，那座摩天楼的拐角处和立交桥下很清静，但是，那里又潮湿，又阴冷，很少有人去过，在这喧啸的都市中，那里是孤独和寂寞的天堂，我仿佛听到了霓红灯光刺破夜空的呼啸。
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	我属于摩天大楼的拐角处，还是属于立交桥下？
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	我也去过乡村，崎岖不平的乡间小路，黄昏中袅袅如薄雾的炊烟对我说，乡村的原野很空旷，农夫还是踏着朝阳去，披着晚霞归。远远地望去，那条老黄牛，仍然吃力地拉着那付古老的弯犁。没有节奏强烈的歌厅，更没有什么细语缠绵的公园，我仿佛听到了落叶划破秋天的声音。
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	我属于空旷的原野，还是属于乡间小路？
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	仰天长望，那<a href="http://www.duanwenxue.com/jingdian/ganwu/">人生</a>最残酷的末日，向我频频招手，我在死亡的边缘徘徊，挣扎，一滴老泪如流星一样疾速滑落。
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	但我远远地看到：
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	你来了，带着三月里的轻风，带着暖暖的白云，抚平了我脸上苍桑的皱纹，让我重新获得了青春的面庞。
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	假如你是山中小溪边的那朵春花，我属于谁，只有小溪知道。
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	你来了，带着三月里淡淡的花香，带着嫩嫩的绿色，浸透我的肺腑，让我的全身焕然一新。
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	假如你是小草边的那枝野百合，我属于谁，只有小草知道。
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	你来了，如一只南来的紫燕，飞过摩天大楼的拐角处，穿过立交桥下，轻轻地落在我的肩上，对着我的耳畔喃喃地讲着清新而缠绵的<a href="http://www.duanwenxue.com/qinggan/gushi/">故事</a>，来安慰我那颗快要破败的灵魂。
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	假如你是五彩缤纷的霓红灯，我属于谁，只有那刺破夜空的灯光知道。
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	你来了，如上帝送给我的天使，沿着那条乡间小路走来，带着迷人微笑着向我走来，带着温情和无尽的欢乐，让我的眼前豁然一亮，世界充满了温暖的阳光。
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	假如你是那条小路上的脚印，我属于谁，只有那条乡间的小路知道。
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	你爱抚的安慰，就是我永远的归宿。
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	于是，我欣喜若狂，象年少的顽童手舞足蹈，天真浪漫。
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	是你为风炷残年的我，注满了新鲜的灯油，使我重新燃起了希望之火，那欲念的火苗又爆起迷人的灯花。
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	在你放飞我的<a href="http://www.duanwenxue.com/qinggan/">情感</a>时，深知那只风筝的骨架有些疏松，但却还能顽强地在风雨中飞翔。那条细细的风筝线上，有你的温柔和力量。
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	当你放飞我的情感时，请不要在意我的过去。过去我情感的风筝早已破碎，不能再飞上天空。
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	拾起今天的日子，那张崭新的日历上，有你永远的微笑陪伴着我。也许，这个微笑会陪伴着我走到生命的尽头。
</p>','0','0','0','1','','0');
INSERT INTO `mxczhyk_article` VALUES ('7','1','0','0','文字随便','执手千年，与你相约','你还记得千年前的约定吗？','','<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	往事如风，挥不去那一缕情愁，今夜，谁会流连在你的梦中？谁又是你一生的惟一？那一尾清凉的月光下飘飞的长发，舞动着谁悠长的叹息？碧海无尘，问遍星宿，又是谁在寻觅着你的足迹？凝眸深处，唯有那一帘幽梦与飘零的花瓣，凄凄漓漓，在每一个盛开的季节，低眉轻泣。把这一份曾经淡却的美丽，萦于指尖，守于心间，回忆，一抹轻愁，写在眉间，一纸素笺，遥寄天涯，我的<a href="http://www.duanwenxue.com/diary/sinian/">思念</a>与千年的执守，你可知否？
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	爱，无关风月，无关季节，驱逐了薄凉，安暖了心扉，心底，涌动着一丝丝暖意，夜未映，情难寐，此时此刻，不问今生，不问来世，放飞激情，许千年之约，许流年无悔，为心中的爱，为心底的你，剪一段时光，倚岁月的门楣，与你独享……
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	绝美的爱，徜徉在风轻云淡的恬静里，噬骨的情怀倾诉者心语，笔尖流淌着<a href="http://www.duanwenxue.com/diary/kuaile/">快乐</a>的音符，字里行间流露着一颗心对另一颗心的牵念与眷恋。那是<a href="http://www.duanwenxue.com/jingdian/ganwu/">人生</a>如初见的曼妙，那是岁月渐远滞留在心底的暖意，忆起，恬然而静美，清爽而惬意，宛如尘世间缓缓流传的美妙音符。
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	许诺千年，等待，是遥远的风景，可望而不可及。遥思，依然沁暖心灵，清欢于流年的烟雨斜阳。夏夜不暖，浓缩的情怀，回暖一城的萧瑟，那句“爱，就是千百年来最深的爱，不爱，就早早离开”，回荡在耳畔，爱，已执守千年，又怎能说不爱就不爱，除非根本就没爱过，否则，又怎能坦然离开？逝水流年，音韵婉转，千千阙歌滴落琴弦，音韵四射，就在此时，就在此刻，一下子惊醒了彼此的世界，缘，真是妙不可言，一念，一生相牵，柔柔相思情，滴滴相思泪，绵软了记忆，温暖了曾经，岁月的长廊，因了几许懂得，尽笑开颜。
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	心音声声慢，一点一点，暖了生命的和弦，缤纷呈现，暖了流光，醉了自己。一段一段的如初图景，雀跃在眼前，青涩的回忆，甜美静然，千年的约定，天涯的守候，生命与你我，痴守，无怨无悔，无论风华正茂，还是风烛残年，一如既往，可否？
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	许是爱的太深，要求的更多，醋意滋生，温柔了岁月，迷失了自我。我把咸湿的情怀独揽，写满了对你的眷恋，那些真实与幻觉，都深深嵌入了生命，月落红尘漫漫，我把执念轻轻安放在你的枕边，让它陪你在梦中安暖，那么多年的执守苦恋，我不允许记忆走远，两情相暖，又怎能会走失容颜？亲爱，岁月未走远，又怎能万事休？可知，一个个深沉的夜，无法入眠，次次都是用心临摹你的轮廓，灵魂深处的来来往往，妥帖了绝美的眷恋，用心聆听，心湖，荡漾着曾经的欢喜和惆怅，追逐万千，缱绻了多少相思无限？灵魂的浅遇深藏，早已浸染了生命。始终坚信，今日重逢，再也不会走散，即使偶尔迷失，也会很快找到原来的路。庭院深深，烟雨蒙蒙，丝丝阑珊，在低眉间私语流年，一枚枚暖色的时光，任心绪涂鸦流放，堆积在岁月的窗棂，那些暖，覆盖了季节的萧条，暗香盈袖，沉淀了岁月的枯荣。
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	丝丝情怀，游荡在心底，温润了沧桑，时而沉寂，时而澎湃，不增不减，幽深的夜晚，那些爱，静静的滋长。一缕缕眷念，在岁月的栈桥上翘望，千年之约，我在此等候，等着你，等着一个个春天，等着一场花事与你婉约，你能否如约而赴？
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	或许，我的底蕴不足，灵感的火花燃不起如初的激情：或许，我的沟通方式欠佳，让你深感负累，可我心底的眷念，始终不会湮灭于红尘。那些爱，那些暖，那么深，那么长……期待，如昨的时光，凝聚的都是向上的力量，婉约的亦是生命的篇章，风干的过往，真的不能久远珍藏么？
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	剪一段时光，珍藏，静坐也繁华。我知道，爱是千百年来最深的爱，所以，我坚信，你不会背弃我而去，亲爱，如你所说，相信你就是相信自己，我再也不会轻易言弃。静静地打开心结，蓦然，心底的暖意，明媚了记忆，那些悸动与渴望，在年华里静静的蔓延、蔓延！
</p>
<p style="text-indent:2em;color:#000000;font-family:tahoma, arial, 宋体;font-size:14px;font-style:normal;font-weight:normal;text-align:start;background-color:#FFFFFF;">
	天籁之外，我心独明，安暖的时光，盛开着美丽和欢喜，还有那份不老的牵念，流年的<a href="http://www.duanwenxue.com/diary/">心情</a>，就这样，被记忆打湿，柔情绵软，欣喜若狂。此时，夜，深沉，梦，阑珊，我与你执守千年，婉约如昨，不悔当初，不悔曾经……
</p>','0','0','0','1','','0');
INSERT INTO `mxczhyk_article` VALUES ('8','4','0','0','回族','中华民族之回族','不一样的名族有不一样的精彩！','','<div class="hd line mb-10">
	<span class="answer-title h2 grid"><br />
</span> 
</div>
<div id="answer-531901472" class="bd answer">
	<div class="line content">
<pre id="recommend-content-531901472" class="recommend-text mb-10">回族使用汉语汉文,其语言基本上保持西北各省方言特色,由于地缘与宗教关系，还夹杂有<a class="inner-link decor-none" href="/search?word=%E5%A1%94%E5%9F%8E&fr=qb_search_exp&ie=utf8" target="_blank">塔城</a>方言和少量阿拉伯、波斯语，以及维吾尔、<a class="inner-link decor-none" href="/search?word=%E5%93%88%E8%90%A8%E5%85%8B&fr=qb_search_exp&ie=utf8" target="_blank">哈萨克</a>词语及宗教词汇。有些回族人兼通维吾尔族、<a class="inner-link decor-none" href="/search?word=%E5%93%88%E8%90%A8%E5%85%8B%E6%97%8F&fr=qb_search_exp&ie=utf8" target="_blank">哈萨克族</a>等 民族的语言、文字。

饮食：回族人只食牛、羊、驼、鸡、鸭、鱼肉，家庭日常饭食，一般有蒸馍、花卷、包子、饺子、<a class="inner-link decor-none" href="/search?word=%E9%A6%84%E9%A5%A8&fr=qb_search_exp&ie=utf8" target="_blank">馄饨</a>、揪片（汤面）等。回族人的<a class="inner-link decor-none" href="/search?word=%E9%A3%8E%E5%91%B3%E5%B0%8F%E5%90%83&fr=qb_search_exp&ie=utf8" target="_blank">风味小吃</a>拌面、烩 面、<a class="inner-link decor-none" href="/search?word=%E7%82%92%E9%9D%A2&fr=qb_search_exp&ie=utf8" target="_blank">炒面</a>、凉粉、面皮子、粉汤、清汤牛（羊）肉面、酥馍、<a class="inner-link decor-none" href="/search?word=%E9%BA%BB%E8%8A%B1&fr=qb_search_exp&ie=utf8" target="_blank">麻花</a>等独具风格。 回族喜欢饮茶，各家都备有茶具，来客则以盖碗盅沏茶并加方块糖。

婚姻：回族信奉伊斯兰教，一般限制女性与非伊斯兰教男性及伊斯兰教其亿民族通婚，但回族男性可娶非伊斯兰教女性为妻。哈密回族男性娶非伊斯兰教女性为妻的较多，回族女性嫁给非伊斯兰教男性的一般较少，回族女性嫁给非伊斯兰教男性的一般较少。如果回族与非伊斯兰教的人成婚，一般要求非伊斯兰教一方履行“入教”手续，接受伊斯兰教的约束，尊重回族的风俗习惯。回族一般实行一夫一妻制。但在旧社会的宗教上层人士、地主、富商等阶层中，一夫多妻现象并不鲜见。伊斯兰教义规定一个男子最多可娶四个妻子，在多妻家庭中，无妻妾之分和大小之别，多妻家庭的丈夫，一般在一个妻子处住3天，在这3天中丈夫吃穿均由所住的妻子负责。新中国成立后，这种一夫多妻制被完全取缔，现在回族与我国其他兄弟民族一样，严格执行一夫一妻制度。

回族婚嫁也讲究门当户对。旧时回族婚姻一般都是由父母包办，没有父母的由兄长包办。回族民间有的在订婚前也征求本人意见，但不起决定作用，一般姑娘羞于起齿，只得听天由命。当今回族民间自由恋爱的越来越多，但仍要征得父母的同意，并按照传统的婚姻习俗办理婚姻大事。

新中国成立前，子女婚姻一般都由父母做主，姨表、姑表<a class="inner-link decor-none" href="/search?word=%E8%BF%91%E4%BA%B2%E7%BB%93%E5%A9%9A&fr=qb_search_exp&ie=utf8" target="_blank">近亲结婚</a>较为普遍。从订婚到结婚，<a class="inner-link decor-none" href="/search?word=%E8%81%98%E7%A4%BC&fr=qb_search_exp&ie=utf8" target="_blank">聘礼</a>繁多。新中国成立后，废除包办、买卖婚姻，提倡自由恋爱，但仍保留某些旧婚姻礼法。男女恋爱后，仍要由男方差<a class="inner-link decor-none" href="/search?word=%E5%AA%92%E4%BA%BA&fr=qb_search_exp&ie=utf8" target="_blank">媒人</a>提亲，送“开口礼”（糖、茶、核桃、枣各一包，又称四色礼），女方留下礼品便意味着同意成亲，便可送大礼、会大亲（双方家长互相邀请），领取结婚证书，订日子完婚。成亲时，在农村有请阿訇念“<a class="inner-link decor-none" href="/search?word=%E5%B0%BC%E5%8D%A1&fr=qb_search_exp&ie=utf8" target="_blank">尼卡</a>哈”（结婚词）的习俗。3天“<a class="inner-link decor-none" href="/search?word=%E5%9B%9E%E9%97%A8&fr=qb_search_exp&ie=utf8" target="_blank">回门</a>”，女方父母和亲戚还要在新娘、新郎临走时赠礼品。

回族反对离婚，认为离婚是一种罪恶。在哈密回族中，如果一方连说三次离婚，这个婚姻就被认为是死亡了的婚姻，另一方必须同意离婚，连复婚的机会也没有了。 <a class="inner-link decor-none" href="/search?word=%E4%B8%A7%E8%91%AC&fr=qb_search_exp&ie=utf8" target="_blank">丧葬</a>：回族人的<a class="inner-link decor-none" href="/search?word=%E4%B8%A7%E8%91%AC&fr=qb_search_exp&ie=utf8" target="_blank">丧葬</a>按伊斯兰教规施行<a class="inner-link decor-none" href="/search?word=%E5%9C%9F%E8%91%AC&fr=qb_search_exp&ie=utf8" target="_blank">土葬</a>。一般晨亡午葬，午亡次日晨葬，葬礼简朴 。

节庆：回族主要传统节日有“大尔吉”（又称“开斋”节，即肉孜节）。和 “小尔吉”（又称“宰牲节”，即<a class="inner-link decor-none" href="/search?word=%E5%8F%A4%E5%B0%94%E9%82%A6%E8%8A%82&fr=qb_search_exp&ie=utf8" target="_blank">古尔邦节</a>）。 其他习俗：回族青年见了老人要问好、许对长辈恶声浪气；宴请安，言谈要和蔼，不允席上，老人坐上方，老人先动筷；行路，让老人走在前面。回族禁食猪、驴、骡、狗等肉，马肉非禁食，但许多回族也不吃；此外，还忌食残暴的、巨齿的、形奇状陋的、吃生肉或同类相食的凶禽猛兽，以及动物血。

哈密回族节日习俗：回族每年要过<a class="inner-link decor-none" href="/search?word=%E5%BC%80%E6%96%8B%E8%8A%82&fr=qb_search_exp&ie=utf8" target="_blank">开斋节</a>、<a class="inner-link decor-none" href="/search?word=%E5%8F%A4%E5%B0%94%E9%82%A6%E8%8A%82&fr=qb_search_exp&ie=utf8" target="_blank">古尔邦节</a>、<a class="inner-link decor-none" href="/search?word=%E5%9C%A3%E7%BA%AA%E8%8A%82&fr=qb_search_exp&ie=utf8" target="_blank">圣纪节</a>3个大节。除3个大节外，哈密回族<a class="inner-link decor-none" href="/search?word=%E7%A9%86%E6%96%AF%E6%9E%97&fr=qb_search_exp&ie=utf8" target="_blank">穆斯林</a>还过法图麦节、登霄节、<a class="inner-link decor-none" href="/search?word=%E9%98%BF%E8%88%92%E6%8B%89%E8%8A%82&fr=qb_search_exp&ie=utf8" target="_blank">阿舒拉节</a>3个小节以及盖德尔夜、白拉台夜2个纪念日。 <a class="inner-link decor-none" href="/search?word=%E5%BC%80%E6%96%8B%E8%8A%82&fr=qb_search_exp&ie=utf8" target="_blank">开斋节</a>是哈密回族对阿拉伯语“尔德.菲图尔“的习惯称呼，也称肉孜节。 <a class="inner-link decor-none" href="/search?word=%E5%9C%A3%E7%BA%AA%E8%8A%82&fr=qb_search_exp&ie=utf8" target="_blank">圣纪节</a>是纪念伊斯兰教创始人<a class="inner-link decor-none" href="/search?word=%E7%A9%86%E7%BD%95%E9%BB%98%E5%BE%B7&fr=qb_search_exp&ie=utf8" target="_blank">穆罕默德</a>的诞辰和归真的纪念日。相传，<a class="inner-link decor-none" href="/search?word=%E7%A9%86%E7%BD%95%E9%BB%98%E5%BE%B7&fr=qb_search_exp&ie=utf8" target="_blank">穆罕默德</a>生于伊斯兰教历前51年3月12日（571年4月21日），逝于伊斯兰教历11年3月12日（632年6月8日）。因为<a class="inner-link decor-none" href="/search?word=%E7%A9%86%E7%BD%95%E9%BB%98%E5%BE%B7&fr=qb_search_exp&ie=utf8" target="_blank">穆罕默德</a>的诞生和归真巧合在伊斯兰教历的3月12日，回族合称“圣纪“，同时纪念穆罕默德的诞辰和归真，而国外一些伊斯兰教徒都把这一天定为圣诞节，为穆罕默德的诞生而庆贺。

法图麦节的时间在斋月开始后的第14天，即伊斯兰教历9月14日，为纪念穆罕默德的女儿，伊斯兰教的四大哈里法之一阿里的妻子，名叫法图麦，故为法图麦节。 <a class="inner-link decor-none" href="/search?word=%E9%98%BF%E8%88%92%E6%8B%89%E8%8A%82&fr=qb_search_exp&ie=utf8" target="_blank">阿舒拉节</a>在伊斯兰教历正月10日举行。阿舒拉，希伯来文，意为第10天。

登霄节，登霄，阿拉伯语，“米尔拉吉“的意译，原意为阶梯。因伊斯兰教是回族的全民性宗教，在长斯的宗教活动中，这些宗教纪念活动，已完全演变成为民族的节日习俗。尽管回族使用汉文，讲述汉语，但它不像其他使用汉语少数民族，一不过汉族人的春节、中秋节之类的汉族节日，二不像汉族人那样纪念先贤如屈原等先贤节日。回族人的节日，完全蕴含着伊斯兰教的浓烈气氛，由此可知，伊斯兰对回族人影响的深远。

白拉台夜，白拉台，阿拉伯语，意为赦免。伊斯兰教历8月15日夜晚，为白拉台夜。

盖德尔夜，伊斯兰教历9月27日夜晚，即为盖德尔夜。

回族饮食有自己独特的民族特色。回族和信仰伊斯兰教的民族一样，饮食要清真。

哈密回族的<a class="inner-link decor-none" href="/search?word=%E9%A3%8E%E5%91%B3%E5%B0%8F%E5%90%83&fr=qb_search_exp&ie=utf8" target="_blank">风味小吃</a>，丰富多彩，花样繁多。例如凉拌牛肉、热羊蹄、腊羊骨头、<a class="inner-link decor-none" href="/search?word=%E9%BA%BB%E8%BE%A3%E9%B8%A1&fr=qb_search_exp&ie=utf8" target="_blank">麻辣鸡</a>、粉汤、羊羔肉、凉皮子、油塔子、黄面等等都是哈密回族的<a class="inner-link decor-none" href="/search?word=%E9%A3%8E%E5%91%B3%E5%B0%8F%E5%90%83&fr=qb_search_exp&ie=utf8" target="_blank">风味小吃</a>，制作精良，历史悠久，富有独特的回族风格。

回族家庭饭食，一般有<a class="inner-link decor-none" href="/search?word=%E6%8B%89%E6%9D%A1%E5%AD%90&fr=qb_search_exp&ie=utf8" target="_blank">拉条子</a>、揪片子、面要、哨子面、大米饭、抓饭、蒸馍、香豆花卷等，菜肴有炒菜、烩菜、凉拌菜等，回族节日食品除各种各样干果外，油炸馓子、各种油果、油饼、香酥条、木梳旦旦等等都很有代表性。

回族清真糕点，有大八件和小八件，以及品种繁多的饼干、桃酥、浆米条等等，共30多个品种，深受哈密各族人民欢迎。

大、小八件也称什锦点心。所谓大八件、小八件，是指点心的馅是由八种原料配合的，点心块大一点的叫大八件，小八件重量一般为50克，或75克左右。

哈密回族的茶俗，饮茶，是哈密回族人生活习俗之一。在一般家庭中，茶料以茯砖茶为主，辅以糖、红枣、沙枣、葡萄干、杏仁、核桃仁、蜂蜜、果干、杏干等。

哈密回族居住习俗：哈密回族一般都是围绕清真寺，形成一个独立的聚居区，清真寺是回族人生活和宗教活动的中心。回族清真寺互不隶属，不管清真寺的大小以及坊民的多少，每一个清真寺，都是一个独立的宗教活动单位，即一个独立的回民活动中心。

哈密回族服饰服饰习俗：哈密回族服饰的特点主要体现在头饰上，男人们喜戴白色圆帽，一种是圆顶的，一种是六棱形的。讲究的人要在帽顶和帽围绣上花饰，图案多为花卉，也有一些几何图案。回族妇女喜戴盖头，老年妇女的盖头多为黑色，庄重高雅；青年妇女的盖头多为绿色，清新美丽。哈密回族偏爱白色，认为白色是祥和、纯洁的象征，婴儿要用白布包裹，成年人穿白衬衫，戴白帽，无常后要用白色克番。

哈密回族命名习俗：回族了除了一个官名外，都有一个经名。官名一般是请有文化的人起的，不举行什么仪式，有的孩子在上学时才起官名，由于回族长期以来受到汉文化熏陶和儒学的影响，很重视官名的用字，所以在哈密的回族中，官名重复的相当多。

哈密回族<a class="inner-link decor-none" href="/search?word=%E8%A7%81%E9%9D%A2%E7%A4%BC&fr=qb_search_exp&ie=utf8" target="_blank">见面礼</a>与待客礼俗：互相见面，互致祝安词，已成为哈密回族人的良好习惯。谚语“回回见面三分亲”，就十分显明的反映了哈密回族这一良好的习惯。据说在穆罕默德传教的时候，互祝“色俩目”的习惯就已普遍流行了</pre>
	</div>
</div>','0','0','0','1','','0');
INSERT INTO `mxczhyk_article` VALUES ('9','4','0','0','青海民族,藏族风情','中华民族之藏族','青海的民族，有你想不到的精彩！','','<p>
	<span><strong>姓氏与命名　</strong></span>
</p>
<p>
	<span> 关于藏族姓氏问题，有的人认为“藏族自古有姓”；也有的人则认为藏族原本无姓。事实上，就青海地区的藏族而言，大都有姓。如有些人名前往往冠以本家族名称；有的家族头人因效忠朝廷，受封赐姓，其后裔承袭之，沿用至今。也有人取名字的第一音节的谐音为姓氏。后者自然不属姓氏范畴，但前者显然是家族系统的称号，不应否认它是藏族的姓氏。<br />
藏族人名的命名一般由活佛、喇嘛，或本家族中德高望重的老人及父母等来承担。许多命名与佛教密切相关，也有以自然物等命名的。就命名时借用的事物而言，可分为：（1）以佛、菩萨、保护神的名号命名。如南色（天子）、先巴（弥勒）、卓玛（度母）等；（2）以佛教术语命名。如宗哲（精进）、散木旦（禅定）等。（3）以佛教法器等命名。如多杰（金刚）、坚参（法幢）等。（4）以吉祥语命名。如扎西（吉祥）、才让（长寿）、达杰（昌盛）等。（5）日月星辰命名。如南卡（天空）、达哇（月亮）、尼玛（太阳）等。（6）以动植物命名。如梅朵（鲜花）等。</span>
</p>
<p>
	<span> 用上述事物名称命名，有时单独运用。有时复合出现；僧名一般采用复合命名，且以四个音节者为多。而俗名则多采用二、三音节，名后多缀以“嘉”（胜利）、“太”（解脱）等。性别在藏族人名上反映得比较鲜明。女性名多缀有“玛”（如才玛）、“毛”（如周毛）、“措”（如仁增措）、“吉”（如柔桑吉）、“先”（如拉毛先）等。使人一看就知道是女性。此外，藏族人各有昵称和敬称之分。当母或其他长辈对晚辈表示钟爱时，往往在人名的第一音节后缀以“洛”、“科”、“波”等。如“扎西”昵称“扎洛”、或“扎科”、“扎波”。年青人称呼长辈是时，忌直呼其名，而在人名前加“阿柯”（叔叔）、“阿尼”（婶婶）、“阿米”（爷爷）、“阿伊”（奶奶）等。俗人一般尊称僧人为“阿卡”。</span>
</p>
<p>
	<span><strong>帐篷·庄廓·碉房·碉楼</strong></span>
</p>
<p>
	<span> 青海藏族居住的地方，大都在海拔3000米至6000米的高寒地区，所以被人们称为“高原上的强者”。藏族的居住因地而宜，各不相同。以游牧为主的藏族一般都住用牛毛织成的黑色的藏帐，个别地方也住用毡做的毡房。帐房结构简单，轻巧方便，中间用一根长而细的木梁，两头支上八根短而硬的木杆，四周再架几根小柱，然后将牛毛帐搭在上面，周围用木桩钉在地上即可。这种帐房雨水不渗，风雪不侵，冬暖夏凉，宜于搬迁，是游牧民族的理想住所。帐房内中央是泥巴垒成的锅灶，两侧是住宿的地方，一般是男右，女左，正中供奉佛像及经典，陈以铜、银制成的净水碗和酥油灯。地上多铺牛羊毛织成的毡毯及皮张等。待客时，男客一般坐右上侧，女客坐左上侧，主人坐左右下侧，便于招待客人。以农业为主的藏族同汉、回、土族等民族一样，一般以自然村为单位聚居在一起，住居同汉族的庄廓相同，只是内部装饰、摆设略有不同。如房顶上、墙头上或院内挂印有麻尼经的白、蓝布小旗。在玉树、果洛、黄南等一些峡谷地带的小块农业区，有一种称之为“碉房”的房屋。这种房屋的内外墙全部用片石和泥巴垒砌而成，外墙用石，其厚度都在一米左右。房屋多系两层的平顶建筑，个别也有三层的。下层为牛、马、羊等牲畜圈和杂用房，上层则为人的住室。房屋门窗很小，象碉堡的枪口，因而室内光线暗淡。房屋的椽檐、窗户及大门，施以重彩，颜色鲜艳，平时窗户外挂有白底黑边的帘子，富有民族色彩。碉房大都依山就势而建，高低错落，左右参差，远望犹如层层堡垒，颇为壮观。而在果洛班玛一带，当地藏族群众却居住着独具一格的楼房──碉楼。这种房屋大都修建在向阳的山坡或山顶上，上下分为三层，多用石头和木料砌筑而成。一楼主要用于圈养牲畜，或存放烧柴，二楼为居室，三楼一般贮藏东西。有趣的是，从楼下到楼上，每层都有一个形似天井的方孔，楼梯是一种用圆木做成的独木梯，圆木上砍有一个个可以踩脚的台阶，供上下走动。楼房四周全部用石料砌筑，并留有小窗，房内光线暗淡，比较阴森。只有二楼和三楼朝阳的一面建有一块不大的阳台，阳台周围筑有半米多高的围墙。平时，家里人都在阳台上休憩，或者用来晾晒东西。这种碉楼造型奇特，独具一格。</span>
</p>
<p>
	<span><strong>女性成人仪式</strong></span>
</p>
<p>
	<span> 在青海藏区，姑娘15岁前，一般都要举行成人仪式，表示她已经结束少女的生涯，步入成年人的行列。<br />
贵德、尖扎等地在举行成人仪式前，一般要由宁玛派（红教）僧侣根据姑娘的生辰等选定吉日。吉日前一二天，在宁玛派僧侣的主持下，进行梳头分发仪式，一般由姑娘的母亲或其他女性长辈将发辫解开，梳成若干条辫子（梳齿必须是奇数），用辫套套住，再戴上达合尼（一种镶有海螺等物的长条刺绣物，共三条，中间一条较长且宽，上端接脑后发辫，垂于腰背。两边的短条悬于胸前）。分辫后，亲友们都来邀请姑娘到自己家做客，并赠送盛有糖、枣等物的龙碗，以示祝贺。<br />
到选定的吉日，同家族和近邻都来祝贺，并帮助张罗。早晨，要派人携带酒、哈达等物在途中迎接阿香（舅舅）。当阿香骑马来到门口，则进行“数下马礼”（藏语称“巴丹”），在印有“雍仲”（万字纹）的白毛毡上，置放盛满青稞的升子。上插系有哈达的箭。升子四方的毛毡上将硬币摞起，一边摞，一边高声喊：“一……十……五百……八千……一万……”（实际为虚数），请阿香下马。阿香下马后，同村的女歌手们双人联唱。阿香则要送钱物，否则，难进家门。来到堂屋，宾主按一定的次序各入其座。阿香规劝姑娘的父母，要精心照管，教育好姑娘，使她生活愉快、幸福、并向姑娘送礼。其他亲邻这天也来送礼。尔后，在僧侣主持下，用净水为姑娘洗脸，污水倒入盛有灰土的木盘内，连同姑娘的鼻涕、唾痰等一起按规定的方向撒泼。最后，宾主一起同饮共欢，尽情歌唱，直至天亮方毕。<br />
乐都等地流行“戴天头”习俗，这也是一种成人仪式。这种仪式要求在僧侣主持下进行宗教洗礼（用柏叶水或奶汁洗脸，用花翎蘸净水洒向姑娘的头身、屋内等处），打醋炭（将烧红的三个拳头大小的河光石放入桶中，加入柏叶、茶叶、头发，注入陈醋，加上开水，用蒸气熏洗），都属于洁身清垢，洗去邪念的方式。由于步入成人行列，便和其他青年人一样，可以独立支配生活，同时，也享有选择恋人，追求爱情的自由。</span>
</p>
<p>
	<span><strong>婚    礼</strong></span>
</p>
<p>
	<span> 青海的藏族男女青年婚前交往自由，但婚嫁一般都要经过媒妁之口。据说，这是从吐蕃赞普松赞干布托媒向唐朝求婚后遣留下来的风俗，所以沿袭至今。一般都是男家托媒到女家求婚，女家应允后，媒人即回去复命，然后从男家拿几瓶酒，到女家同其父母及亲房叔伯等同饮，算是定婚，并当场议定财礼。过去送财礼，都是以牲口为主。男家根据家境情况，或成百只牛羊，或几十，或几只都可以，择吉日，先送一半，临娶时再送一半。女家回送马、氆氇、狐皮帽、牛皮靴、红布腰带、头巾等礼物。现在大部分聘礼都是布料、现金、衣物等。<br />
在藏族地区，青年男女多为自由恋爱，父母亲友一般不加干涉。至于求爱方式，或袒露，或隐晦，因人因地而异。有的以歌抒情，互吐衷肠；有的地方则抢姑娘的帽子、戒指、头巾等物（若姑娘不愿与其相好，可直接或托人要回。如默不作声，或直言相约，则是愿意结交朋友）。得到姑娘的应允后，小伙子可到姑娘处赴约。承受着频繁的约会，双方的感情不断深化，互赠信物，并向自己的父母表明心愿。在得到双方父母应允后，才能送聘礼，商定婚期。如不同意婚事，青年男女可私奔他处，等说服父母后，男方只向女方家送上奶牛、羊，便得到承认。在有些农牧区青年男女的婚姻，一般以“父母之命，媒妁之言”为主要形式。当男青年看中姑娘后，便请媒人带酒、哈达等物前去说媒，女方同意婚事，则饮其酒，受其礼；否则，婚事告吹。女方允亲后，媒人再次带酒等去女方家商定聘礼。聘礼多寡不一，但一般不宜太多，以免近邻亲友议论。送过聘礼，可根据男女双方生辰选定吉日，准备成亲。也有的地区盛行由男女双方私下约定，出走成婚的习俗，但近年来逐渐减少。<br />
婚期前一天，男方派婚使和媒人携带酒、哈达等物（乐都地区则带一支系有哈达的箭）到女方家迎娶新娘。是夜，女方家则为姑娘进行宗教洗礼，梳妆打扮。有的地区还有骂媒人、戏婚使等习俗。次日，新娘拜过家神、祖先及父母，伴娘搀扶新娘上马。新娘在伴娘的陪伴下哭嫁，然后随送亲者、媒人及婚使等一同起程。<br />
在新娘一行到达男家之前，男方派人在离家不远的地方设路席，敬酒致意（玉树地区则举行交接新人马缰仪式，路旁横拉彩带，双方歌手以歌竞赛，若迎亲者唱不过对方，则敬酒致意。直到最后说服，这才剪彩，新娘下马）。当新娘来到门前，男方将撒有青稞、羊毛的新白毡铺在新娘马前，为媒人、送亲者献哈达，敬酒。妇女们扶新人下马，用奶汁为新娘洗脸，打醋炭（玉树地区过“燎火”），以洁身清垢，除灾避邪。入门后，喇嘛诵经祈祷，新娘新郎拜天地、家神及父母。礼毕，新娘入洞房，宾客入宴席。东部农业区宴席多设在羊圈，人们席地而坐（地上铺有草、毡等）喝奶茶，吃油果。有的地区端上面食，讥讽宾客，因是习俗，宾客全不介意。饭后，举行谢媒，女方为婆婆献“九毛救拉”（手工缝制的棉长袍）。最后宾主暖酒畅饮，双方歌手尽献歌技，歌声笑语彻夜不绝。从次日起，男方家属轮换宴请宾客，馈送礼物，延续三两日方毕。<br />
在有的地方还存在不同形式的“抢亲”习俗。在藏族古老的传统中，以为姑娘出嫁不经过一番抢劫，说明姑娘相貌不出众，或没人要。因此，要经过象征性的“抢亲”，来显示姑娘身价不凡。</span>
</p>
<p>
	<span><strong>节    日　</strong></span>
</p>
<p>
	<span> 藏族的传统节日主要有藏历新年、六月欢乐节、拉伊会、亮宝会、雪顿节、萨噶达瓦节、汲桑介曼曲、鲁热节、插箭节、祭拉卜孜、祭佛节、望果节、赛马节和塔尔寺四大观经会（又称如来四大经节，在农历正月、四月、五月、九月、）、酥油灯会（灯节）、晒佛节、燃灯节等，有的地区也过端午节和八月中秋节。<br />
藏历新年是藏族人民一年之中最隆重的节日。为了欢渡佳节，人们从旧历年十月初就开始作各种准备工作，如磨炒面，打酥油，炸果子，做新衣，办年货等。农业区藏胞还要扫房整院，粉刷墙壁，张贴年画等。除夕之夜，藏族人家也吃团圆饭。这顿饭须全家人（除非远走在外）都到齐了才能吃。有的地方过年还兴吃面团或煮饺。<br />
大年初一，多数藏族人家不相互串门拜年，而是从一大早起来，就换上新衣，洗梳打扮之后，全家坐到一起关门道吉，互致敬意，祝愿吉祥如意。也有的地方的人们，吃过早饭后，怀揣酒瓶，成群结队，走家串户，去给全村人和亲朋好友去拜年。<br />
欢乐节，一般都在农历六月中旬欢度。这时，草原上水草丰美，牛羊肥壮，气候宜人。藏族牧民身着盛装，带上食品，驮上帐篷到草原上安营扎帐，举行对歌、射箭、赛马、赛牦牛，摔跤、拔河、登山等具有民族特色的文体活动。</span>
</p>
<p>
	<span><strong>禁   忌</strong></span>
</p>
<p>
	<span> 历史上，藏民族受到佛家思想的长期熏陶。因此，许多禁忌与佛教有着密切的关系，有的甚至是世俗化了佛教教规。例如，青海广大藏区都有神山，在人们心目中，是山神的皈依之地，神圣不可侵犯。因此禁止在神山挖药材、狩猎、砍柴等。果洛、玉树等地有放生神牛之俗，禁止人们驱赶、出卖和宰杀。由于神佛是人们的保护者、救世主，因此农牧业区家家必设神龛，虔诚敬奉，吃饭、饮酒时，总要先敬神佛。禁止用煨桑的火和酥油灯接火烟、燃蜡烛等。在藏族地区，人们睡觉时，脚不能伸向上方，因为那里一般都供有神龛。人们认为世间万物皆由天神轮巡治理，神又分凶神和吉神，于是便有了吉日和凶日之分。当进行一些重大事情，如搬家、盖房、婚娶时，往往事先求神卜算，择取吉日。在人们看来，泉为江河之源。而江河则为龙王辖域。因此，禁忌挖泉引水。否则，将受到龙王的惩罚，或涝或旱。<br />
在旧社会，藏族妇女的地位一直十分低下，因而她们生活中的禁忌则更多。人们认为妇女是不洁之物，煨桑、点灯、集体祭祀等场合一般不让妇女参加，寺院规定妇女只能在一定范围出入。妇女遇见僧侣要躬身屈膝，不能仰视。妇女不能与男人同坐一席，更不能在上方就坐。公共场合，禁止妇女饮酒、吸烟。寡妇不能参加婚嫁仪式。<br />
由于游牧生活的需要，牧区家家养有藏狗，用以帮助人们放牧、守夜。人们对狗是十分敬重的，倘若有人打狗，便被认为是对主人的侮辱，因而会受到谴责，甚至报复。不能用枪射击秃鹫和老鹰，不能在拴牛套马的地方或羊圈里大小便。进帐篷或家门，忌讳抢门或不让而进。用水时，须用藏家的勺子舀水，并不得反舀反倒。忌用手随意抚摸男子头颅和帽子。忌用印有藏文的纸擦东西、当手纸。“家有家主，灶有灶神”，农牧业区都忌讳用脚踩灶或往灶中扔骨头等。藏族有着尊老爱幼的好风尚，鄙夷歧视、虐待老人的行为。年轻人接受或向长辈递送物品时，一般忌讳单手递接，否则，便认为是不礼貌的。在长辈面前，青年人不能戏闹、高声喧哗、谈情说爱，更不能唱“拉伊”。日常生活中忌讳对着客人咳嗽等。在饮食上，藏族一般不吃奇蹄类、爪类和鳞类动物。<br />
藏族家中有人生病或有产妇，一般在大门外或帐篷前堆有柴火堆，或白天把帐篷门帘放下来，禁忌生人进入。主人同意者则可以例外。</span>
</p>
<p>
	<span><strong>服饰和发式</strong></span>
</p>
<p>
	<span> 现在，除农业区和半农半牧区的青年多着汉装外，青海藏族不分男女老幼，一年四季均穿藏袍。藏袍一般都具有长袖、大襟、宽腰、无兜等特点。根据用料的不同，可分为羔皮藏袍、皮毛藏袍和布料藏袍三种。皮毛藏袍用鞣好的老羊皮缝制，衣边饰以布条。果洛等地的男袍用一掌宽的黑布缝边，再镶缝一寸宽的白布。而女袍则用大红和黑布缝两道边，大襟下摆用同色布块镶成旗角。玉树地区则用黑缎子或布缝边，并镶以氆氇、红布等。羔皮藏袍是走亲访友、节日集会的礼服。一般都配上黑、褐等色的缎面，下摆及大襟等处镶以水獭边、锦缎等。皮制藏袍的衣领大都用羔皮、豹子皮等质地较好的皮子缝制。牧业区地高气寒，因此毛皮藏袍四季皆用。而农业区则一般穿布料藏袍。布料藏袍有单、棉两种，根据气候变化更换。穿着藏袍时，将衣领高高提起，腰间系上腰带，使怀与腰背都形成大行囊。袍内配穿一件黄、白、咖啡等色的衬衫。天气暖和，或参加劳动时，则脱去衣袖，束在腰间，极为方便。　　<br />
夏天，青海藏族都戴礼帽。礼帽边宽，既可遮日，又能防雨，一物多用。少女、少妇则喜欢在帽沿上插束彩绸花。冬天一般戴羔皮帽和狐皮帽。狐皮帽呈喇叭形圆筒，后开叉，帽沿上翻，皮毛外露。帽顶用各色彩缎做成。果洛地区用大红、黄、绿等色的毛呢做成大小层次分明的圆顶。<br />
藏靴式样不分男女，一般用黑牛皮做靴面。靴腰则用红牛皮或氆氇、石羊皮等缝制。毛毡做靴里，也有用双层布料做靴里的。玉树地区靴腰前有中缝，镶以锦缎，中缝两侧用红黄、绿等色线编织花纹，十分考究。<br />
东部农业区藏族男子不蓄长发。玉树、果洛、黄南等地则有蓄发之俗。发梢续以红、黑红穗子，梳成独辫，盘在头顶，辫穗垂于右子侧。藏族妇女均蓄长发，梳成若干小辫（农业区盛行双辫），辫梢用辫套套住，垂于背后，或压在腰带下。辫套镶有银盾、银碗、琥珀等装饰品。<br />
青海藏族，尤其是牧业区，不分男女，十分讲究装饰品。男性腰间都佩带精制的藏刀，刀鞘饰以白银、鎏金，刀柄镶有玛瑙等，多为骨柄。此外，随身携带精制的钱包、火镰等。果洛、玉树等地男女都戴手镯及镶有玛瑙的银戒指。妇女戴耳环（也有男性佩戴者）和项链。无论男女，胸前都佩戴精制的银质方形护符，盒内装有经文、佛像等。期望以此避邪消灾，平安幸福。</span>
</p>
<p>
	<span><strong>欢乐的草原盛会</strong></span>
</p>
<p>
	<span> 藏族是一个能歌善舞、热情奔放、喜爱运动的民族。藏族人民除了平时利用放牧或节假日唱歌跳舞、自乐自娱外，还在每年的夏秋季节，在草原上水草丰美、牲畜膘肥体壮的时候，举行各种欢乐的草原盛会。届时，人们选择地势平衍、水草茂盛、环境优美、交通便利的“神山宝地”作为会场，然后合家老少带上帐篷，赶上牛羊、骑上骏马，从四面八方汇聚到一起，参加各种活动。<br />
由于受宗教信仰和传统风俗习惯的影响，藏族人民的草原盛会大都带有浓厚的宗教色彩和地方特色。会上，人们除了举行种种宗教活动，如祭海、朝山，煨桑，敬佛之外，还要进行丰富多彩的文化娱乐和体育比赛，象赛马、射击、拔河、登山、摔跤、赛牦牛等。其中比较著名的有：海北州门源县和青海湖草原的赛马会，玉树结古草原的歌舞会，果洛大武一带的朝山会，玛多草原的献花会，乐都南山的射箭比赛等。<br />
青海湖草原的赛马会多在夏季举行。这时，青海湖两岸的草原草青花繁，牛羊肥壮，气候宜人。环湖周围的牧民们纷纷汇聚到这里参加声势浩大的赛马会。比赛有精彩的马上骑射，有惊心动魄的马术表演，有情趣盎然的赛走马等。马上骑射就是骑手跃马横枪，一边奔跑，一面射击，看谁马跑得快，枪打得准；马术表演则是骑手们在马背上表演各种复杂惊险的动作，如蹬里藏身、翻身倒地、拾哈达等；赛走马是专门比赛马的竞走速度，看谁的马走得快，走得稳。赛走马很象田径运动员的竞走，看谁的马走得快，走得稳，要求马既要行进速度快，又不能狂奔乱跳，因此，颇为精彩。赛马结束时，人们向优胜者献上哈达、美酒、茯茶等，以示祝贺。获胜的马还要披红挂彩，以示荣耀。<br />
果洛大武等地的朝山会多在每年初夏举行。届时，人们在山上筑一高台，将酥油、糌粑、曲拉、青稞、茶叶、烧酒等堆积在台上，用柏树枝等柴禾点燃，然后由男性牧民乘牛骑马，簇拥着绕山而行，颂祝神佛，祈祷平安。继而举行赛牦牛、赛马等活动。赛牦牛同赛马不大一样。因为牦牛体态笨拙，腰粗背宽，奔走疾速，加之性情凶悍，跑起来忽左忽右，忽东忽西，时而狂奔，时而腾跃，很难驾驭。因此，赛牦牛比赛马更需要高超的骑术和顽强的意志。否则，很容易从牛背上掉下来。谁最先到达终点，谁就是冠军，最后要给予重赏。<br />
玉树结古草原的歌舞盛会，一般在每年7月底或8月初举行。这时，结古草原山青水秀，百花盛开，芳草迷目，风光无限。结古镇和周围的草原牧民一起带着帐篷来到附近的扎西科草滩安营扎帐，赛歌赛舞。玉树素有“歌舞之乡”的美称。玉树藏族的歌舞旋律激越，节奏明快，舞姿优美，动作豪放，具有鲜明的地方和民族特色。尤其是玉树特有的舞蹈音乐“卓”和“依”，欢快优美，动听悦耳，令人陶醉。歌舞会设在地势平坦、水草丰美的草地上围成圆圈，边歌边舞。歌舞中有优美动人的袖舞，有风趣别致的对舞，还有欢乐如狂的群舞，气氛异常热闹。歌舞会同时也是赛马会和物资交流会。人们在歌舞之余，赛马、赛牛、整个会场一片欢乐。<br />
乐都县南山的射箭比赛，一般与“花儿会”、物资交流会等同时举行。其中以射箭最为引人。赛前，各地的射箭手们精心用牛角和木杆铁簇羽尾制做拉力大、弹性强而醒目美观的弓箭。赛时，他们跨骏马，着盛装，蹬皮靴，拈弓搭箭，各显身手。万千观众或凝神静气，或欢声雷动，热闹非凡。获胜者则披红戴花，骑高头大马，被亲友簇拥而边饮敬酒，喜上眉梢，春风得意。得胜的小伙子倍受姑娘们的青睐，他们发出的是中的之箭，接受的却是爱神之箭。赛后，又各选歌手以射箭为题材对唱“花儿”，再显高低。人们载歌载舞，直到深夜。</span>
</p>','0','0','0','1','','0');
INSERT INTO `mxczhyk_article` VALUES ('10','7','0','0','如何注册会员','如何注册会员','','','<div style="color:#000000;font-family:Simsun;font-size:12px;font-style:normal;font-weight:normal;text-align:left;">
	<strong><span>一、登录后显示</span></strong>&nbsp;
</div>
<div style="color:#000000;font-family:Simsun;font-size:12px;font-style:normal;font-weight:normal;text-align:left;">
	&nbsp;<span><span style="font-family:'Times New Roman';">姓氏文章浏览-------可以查看本姓氏所有的文章<br />
文章发布管理-------可以发布文章、修改自己发布的文章<span class="Apple-converted-space">&nbsp;</span><br />
注册会员信息-------可以查看到本姓氏注册会员部分信息<span class="Apple-converted-space">&nbsp;</span><br />
友情链接申请-------可以向本姓氏网站提供友情链接，由站长批准加入。<br />
家谱入网申请-------可以向本姓氏网站提供家谱信息<span class="Apple-converted-space">&nbsp;</span><br />
个人资料修改-------修改个人的资料、密码、邮箱变更<span class="Apple-converted-space">&nbsp;</span><br />
站长版务管理-------站长有权进入管理<br />
退出系统管理------- 退出<br />
</span></span>
</div>','0','0','0','1','','0');


# 数据库表：mxczhyk_article_class 数据信息
INSERT INTO `mxczhyk_article_class` VALUES ('1','0','爱情攻略','1');
INSERT INTO `mxczhyk_article_class` VALUES ('2','0','爱情故事','1');
INSERT INTO `mxczhyk_article_class` VALUES ('3','0','文学随便','1');
INSERT INTO `mxczhyk_article_class` VALUES ('4','0','民族风情','1');
INSERT INTO `mxczhyk_article_class` VALUES ('5','0','网站简介','2');
INSERT INTO `mxczhyk_article_class` VALUES ('6','0','更多','2');
INSERT INTO `mxczhyk_article_class` VALUES ('7','0','新手入门','2');
INSERT INTO `mxczhyk_article_class` VALUES ('8','0','用户体验','2');


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
INSERT INTO `mxczhyk_label` VALUES ('7','假温柔','1','','7','1');
INSERT INTO `mxczhyk_label` VALUES ('8','只如初见','1','','8','1');
INSERT INTO `mxczhyk_label` VALUES ('9','生死相随','1','','9','1');
INSERT INTO `mxczhyk_label` VALUES ('10','失恋光荣','1','','10','1');


# 数据库表：mxczhyk_link 数据信息
INSERT INTO `mxczhyk_link` VALUES ('1','www.baidu.com','百度','','百度','1','');
INSERT INTO `mxczhyk_link` VALUES ('24','www.google.com.hk','谷歌','','','1','');
INSERT INTO `mxczhyk_link` VALUES ('19','www.jiayuan.com','世纪佳缘','','','1','');
INSERT INTO `mxczhyk_link` VALUES ('20','www.baihe.com','百合网','','','1','');
INSERT INTO `mxczhyk_link` VALUES ('22','www,zhenai.com','珍爱网','','','1','');
INSERT INTO `mxczhyk_link` VALUES ('23','www.jiaoyou.com','交友网','','','1','');


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
INSERT INTO `mxczhyk_mood` VALUES ('1','2','今天的天气不错呢，心情不错哦！','343223333','0','1','成哥','0');
INSERT INTO `mxczhyk_mood` VALUES ('2','3','今天遇见一个让我心动的女神，生活充满阳光！','348973474','0','1','','0');
INSERT INTO `mxczhyk_mood` VALUES ('3','4','今天下雨了，不想出去，求帅哥送饭！','344444445','0','1','','0');
INSERT INTO `mxczhyk_mood` VALUES ('4','5','今天见到一个很帅的人，心里有些小激动！','99555733','0','1','','0');


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
