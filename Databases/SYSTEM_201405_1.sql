# -----------------------------------------------------------
# 邀99大学恋爱网管理数据库
# Blog: http://www.feiruan.net
# Type: 系统自动备份
# Description:当前SQL文件包含了表：mxczhyk_access、mxczhyk_activity、mxczhyk_activityapply、mxczhyk_admin、mxczhyk_advertisement、mxczhyk_article、mxczhyk_article_class、mxczhyk_article_discuss、mxczhyk_attention、mxczhyk_business、mxczhyk_failedlogin、mxczhyk_gift、mxczhyk_gift_record、mxczhyk_gift_type、mxczhyk_guestbook、mxczhyk_invites、mxczhyk_link、mxczhyk_marriage_term、mxczhyk_member、mxczhyk_member_detail、mxczhyk_member_spaces、mxczhyk_menu、mxczhyk_message、mxczhyk_mood、mxczhyk_node、mxczhyk_notice、mxczhyk_onlinetime、mxczhyk_photo、mxczhyk_photo_detail、mxczhyk_privatemessage、mxczhyk_read、mxczhyk_role、mxczhyk_role_user、mxczhyk_successobject、mxczhyk_vip_space、mxczhyk_viptype、mxczhyk_vote、mxczhyk_vote_log、mxczhyk_vote_option、mxczhyk_webinfo、mxczhyk_words的结构信息，表：mxczhyk_access、mxczhyk_activity、mxczhyk_activityapply、mxczhyk_admin、mxczhyk_advertisement、mxczhyk_article、mxczhyk_article_class、mxczhyk_article_discuss、mxczhyk_attention、mxczhyk_business、mxczhyk_failedlogin、mxczhyk_gift、mxczhyk_gift_record、mxczhyk_gift_type、mxczhyk_guestbook、mxczhyk_invites、mxczhyk_link、mxczhyk_marriage_term、mxczhyk_member、mxczhyk_member_detail、mxczhyk_member_spaces、mxczhyk_menu、mxczhyk_message、mxczhyk_mood、mxczhyk_node、mxczhyk_notice、mxczhyk_onlinetime、mxczhyk_photo、mxczhyk_photo_detail、mxczhyk_privatemessage、mxczhyk_read、mxczhyk_role、mxczhyk_role_user、mxczhyk_successobject、mxczhyk_vip_space、mxczhyk_viptype、mxczhyk_vote、mxczhyk_vote_log、mxczhyk_vote_option、mxczhyk_webinfo、mxczhyk_words的数据
# Time: 2014-05-10 16:13:24
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限分配表' ;

# 数据库表：mxczhyk_activity 结构信息
DROP TABLE IF EXISTS `mxczhyk_activity`;
CREATE TABLE `mxczhyk_activity` (
  `activity_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '活动',
  `title` varchar(50) NOT NULL COMMENT '活动名称',
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '发起人',
  `cost` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '花费（可有可无）',
  `starttimefrom` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间 年月日 具体时间',
  `starttimeto` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间 年月日 具体时间',
  `place` varchar(40) NOT NULL DEFAULT '' COMMENT '大学具体地址',
  `class` varchar(20) NOT NULL DEFAULT '' COMMENT '活动分类',
  `gender` tinyint(1) NOT NULL DEFAULT '1' COMMENT '性别男1  女2',
  `number` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '人数',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '有效期',
  `schoolName` varchar(30) NOT NULL COMMENT '举办的大学名称',
  `content` varchar(300) NOT NULL COMMENT '活动阐述',
  `isLock` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1开启；2禁止',
  PRIMARY KEY (`activity_id`),
  KEY `uid` (`member_id`,`starttimefrom`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动表' ;

# 数据库表：mxczhyk_activityapply 结构信息
DROP TABLE IF EXISTS `mxczhyk_activityapply`;
CREATE TABLE `mxczhyk_activityapply` (
  `applyid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '活动申请表',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) CHARACTER SET gbk NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` char(200) CHARACTER SET gbk NOT NULL DEFAULT '',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `payment` mediumint(8) NOT NULL DEFAULT '0',
  `contact` char(200) CHARACTER SET gbk NOT NULL,
  PRIMARY KEY (`applyid`),
  KEY `uid` (`uid`),
  KEY `tid` (`tid`),
  KEY `dateline` (`tid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

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
  `ad_id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_link` varchar(100) NOT NULL DEFAULT '无' COMMENT '广告链接地址',
  `if_float` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否浮动  是1 0为不浮动',
  `description` varchar(200) NOT NULL DEFAULT '无' COMMENT '广告描述',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '广告标题',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '广告类型顶部1、中部2、浮动3',
  `code` text NOT NULL COMMENT '广告代码',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `image_site` varchar(100) NOT NULL COMMENT '广告图片地址',
  `available` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为可用；不可用为2；广告可用',
  `displayorder` tinyint(3) NOT NULL COMMENT '广告显示顺序',
  `targets` text NOT NULL COMMENT '广告投放范围',
  `parameters` text NOT NULL COMMENT '广告参数',
  PRIMARY KEY (`ad_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='广告表' ;

# 数据库表：mxczhyk_article 结构信息
DROP TABLE IF EXISTS `mxczhyk_article`;
CREATE TABLE `mxczhyk_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_class_id` int(6) NOT NULL COMMENT '文章类别',
  `member_id` int(10) NOT NULL COMMENT '个人id',
  `title` varchar(120) NOT NULL COMMENT '文章标题',
  `keywords` varchar(120) NOT NULL COMMENT '关键字',
  `description` varchar(200) NOT NULL COMMENT '文章描述',
  `img` varchar(200) NOT NULL COMMENT '图片地址',
  `content` text NOT NULL COMMENT '文章内容',
  `add_time` int(15) NOT NULL,
  `update_time` int(15) NOT NULL,
  `sort` int(15) NOT NULL,
  `islock` tinyint(1) NOT NULL DEFAULT '1' COMMENT '2是1否锁定 默认1',
  `ip` varchar(15) NOT NULL COMMENT '发布ip',
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文章详细表' ;

# 数据库表：mxczhyk_article_class 结构信息
DROP TABLE IF EXISTS `mxczhyk_article_class`;
CREATE TABLE `mxczhyk_article_class` (
  `cid` int(5) NOT NULL AUTO_INCREMENT,
  `pid` int(5) DEFAULT NULL COMMENT 'parentCategory上级分类',
  `name` varchar(20) DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文章分类表' ;

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

# 数据库表：mxczhyk_failedlogin 结构信息
DROP TABLE IF EXISTS `mxczhyk_failedlogin`;
CREATE TABLE `mxczhyk_failedlogin` (
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '登录失败者IP',
  `username` char(32) NOT NULL DEFAULT '' COMMENT '登录失败者',
  `count` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '登录失败次数',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上次登录失败时间',
  PRIMARY KEY (`ip`,`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='登陆失败记录表' ;

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
  `istop` tinyint(1) unsigned DEFAULT '0' COMMENT '是2  否1置顶',
  PRIMARY KEY (`gift_id`),
  KEY `cateid` (`gift_type_id`),
  KEY `flag` (`flag`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ;

# 数据库表：mxczhyk_gift_record 结构信息
DROP TABLE IF EXISTS `mxczhyk_gift_record`;
CREATE TABLE `mxczhyk_gift_record` (
  `recordid` bigint(20) unsigned NOT NULL,
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
  PRIMARY KEY (`recordid`),
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='礼品种类表' ;

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

# 数据库表：mxczhyk_link 结构信息
DROP TABLE IF EXISTS `mxczhyk_link`;
CREATE TABLE `mxczhyk_link` (
  `link_id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL COMMENT '地址',
  `name` varchar(20) NOT NULL COMMENT '链接名称',
  `logo` varchar(100) NOT NULL COMMENT 'logo地址',
  `rank` varchar(50) NOT NULL COMMENT '备注',
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='友情链接' ;

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='婚姻条件表' ;

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
  `ifadmin` varchar(5) NOT NULL DEFAULT '0' COMMENT '是否管理员 是1 否2',
  `Mobile` int(11) NOT NULL COMMENT '手机登陆的时候用',
  `isLock` varchar(5) NOT NULL DEFAULT '2' COMMENT '1表示禁止个人用户；2表示开启个人用户账户',
  `vip_type_id` tinyint(3) NOT NULL DEFAULT '1' COMMENT '会员类型 1普通会员',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='会员表' ;

# 数据库表：mxczhyk_member_detail 结构信息
DROP TABLE IF EXISTS `mxczhyk_member_detail`;
CREATE TABLE `mxczhyk_member_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '每个人详细的id',
  `member_id` int(11) DEFAULT NULL,
  `english_name` varchar(30) NOT NULL COMMENT '英文名称',
  `realName` varchar(20) NOT NULL COMMENT '真实名称',
  `nationName` varchar(50) NOT NULL DEFAULT '汉族' COMMENT '民族名称',
  `schoolName` varchar(30) NOT NULL COMMENT '学校名称',
  `academy` varchar(30) NOT NULL COMMENT '学院',
  `academic` tinyint(1) NOT NULL DEFAULT '0' COMMENT '学历;专科1 本科2 研究生3 博士4',
  `if_overseas` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是 2  否1是留学生',
  `if_belif_object` tinyint(1) NOT NULL COMMENT '1是；2不是  信仰对象要求',
  `belif_state` varchar(300) DEFAULT NULL COMMENT '信仰阐述内容',
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
  `aPoint` int(8) NOT NULL COMMENT '活跃值(点击次数+登陆次数+积分)',
  `loginCount` int(5) NOT NULL COMMENT '登陆次数',
  `OnlineTF` tinyint(1) NOT NULL COMMENT '用户在线状态，1为在线，0为不在线',
  `FriendClass` tinyint(1) NOT NULL DEFAULT '1' COMMENT '系统好友默认分组（1，我的好友，2陌生人,3黑名单）',
  `LastIP` varchar(15) NOT NULL COMMENT '最后一次登录ip',
  `isOpen` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1不开放；2开放；',
  `isIDcard` tinyint(1) NOT NULL COMMENT '是2  否1通过实名认证',
  `IdcardFiles` varchar(100) NOT NULL COMMENT '实名认证附件地址',
  `Addfriendbs` tinyint(1) NOT NULL DEFAULT '1' COMMENT '添加好友验证设置0为不允许任何人把我列为好友  1为需要身份认证才能把我列为好友2为允许任何人把我列为好友',
  `Emailcode` varchar(32) NOT NULL COMMENT '邮件验证码',
  `Ismobile` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是1  否2需要手机认证',
  `BindTF` tinyint(1) NOT NULL DEFAULT '2' COMMENT '是 1   否2 捆绑了手机',
  `attention_id` int(11) NOT NULL COMMENT '关注人',
  `avatar` varchar(100) NOT NULL COMMENT '头像地址',
  `avatarwidth` tinyint(3) NOT NULL COMMENT '头像的宽度',
  `avatarheight` tinyint(3) NOT NULL COMMENT '头像的高度',
  `sightml` varchar(300) NOT NULL COMMENT '个信签名；',
  `groupterms` varchar(10) NOT NULL COMMENT '用户组有效期（会员类型：年会员）',
  `authstr` varchar(20) NOT NULL COMMENT '用户激活码(时间限制)',
  `ifNation` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是2 否1 少数民族',
  `limit_reply` tinyint(1) NOT NULL COMMENT '限制回复2  默认1',
  `limit_attention` tinyint(1) NOT NULL DEFAULT '1' COMMENT '限制关注2  默认1',
  `limit_say` tinyint(1) NOT NULL DEFAULT '1' COMMENT '限制发言2  默认1',
  `constellation` varchar(10) NOT NULL COMMENT '星座名称',
  PRIMARY KEY (`id`),
  KEY `city` (`city`),
  KEY `age` (`id`,`gender`,`age`),
  KEY `hits` (`ePoint`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员详细表' ;

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
  `parentid` int(6) NOT NULL DEFAULT '0',
  `rank` int(6) NOT NULL,
  `type` tinyint(2) NOT NULL,
  `target` varchar(20) NOT NULL COMMENT '范围',
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='菜单表' ;

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
  PRIMARY KEY (`mood_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员发表心情表（个人状态）' ;

# 数据库表：mxczhyk_node 结构信息
DROP TABLE IF EXISTS `mxczhyk_node`;
CREATE TABLE `mxczhyk_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='权限节点表' ;

# 数据库表：mxczhyk_notice 结构信息
DROP TABLE IF EXISTS `mxczhyk_notice`;
CREATE TABLE `mxczhyk_notice` (
  `notice_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '资料id',
  `notice_name` varchar(100) NOT NULL COMMENT '公告名称',
  `content` text NOT NULL COMMENT '公告内容',
  `uploadedby` varchar(15) NOT NULL COMMENT '发布者',
  `uploadtime` varchar(11) NOT NULL COMMENT '发布时间',
  `if_admin` tinyint(1) NOT NULL DEFAULT '1' COMMENT '权限判断个人1；管理员2；',
  `PostIP` varchar(15) NOT NULL COMMENT '发送',
  `PostTime` varchar(11) NOT NULL COMMENT '发送时间',
  `IsLock` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1不锁定 锁定2',
  PRIMARY KEY (`notice_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='公告表' ;

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
  `photo_id` int(10) NOT NULL,
  `intro` varchar(200) NOT NULL COMMENT '图片描述',
  `image_name` varchar(100) NOT NULL COMMENT '图片名称',
  `link` varchar(200) NOT NULL COMMENT '链接 可有可无',
  `sort` int(12) NOT NULL COMMENT '按照什么顺序',
  `add_time` int(11) NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL COMMENT '禁用2；开启1；',
  `if_top` tinyint(1) DEFAULT NULL COMMENT '是否作为相册的封面',
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='权限角色表' ;

# 数据库表：mxczhyk_role_user 结构信息
DROP TABLE IF EXISTS `mxczhyk_role_user`;
CREATE TABLE `mxczhyk_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色表' ;

# 数据库表：mxczhyk_successobject 结构信息
DROP TABLE IF EXISTS `mxczhyk_successobject`;
CREATE TABLE `mxczhyk_successobject` (
  `success_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `boy_id` int(11) NOT NULL COMMENT '男方id',
  `girl_id` int(11) NOT NULL COMMENT '女方id',
  `create_time` int(15) NOT NULL COMMENT '创建时间',
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='会员升级权限类型表' ;

# 数据库表：mxczhyk_vote 结构信息
DROP TABLE IF EXISTS `mxczhyk_vote`;
CREATE TABLE `mxczhyk_vote` (
  `vote_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，投票主题TID',
  `vote_name` varchar(250) NOT NULL DEFAULT '' COMMENT '投票名称',
  `start_time` int(11) unsigned NOT NULL DEFAULT '0',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0',
  `multiple` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '多选1  否则为单项选择',
  `vote_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '投票总数',
  `visible` tinyint(1) DEFAULT '0' COMMENT '提交投票后结果才可见1',
  PRIMARY KEY (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投票表  记录投票信息' ;

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
  `option_name` varchar(250) NOT NULL DEFAULT '' COMMENT '选项名称',
  `option_count` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '选项得票数',
  `option_order` tinyint(3) unsigned NOT NULL DEFAULT '100' COMMENT '选项显示顺序',
  `option_content` varchar(300) NOT NULL COMMENT '选项的内容',
  `voterids` mediumtext NOT NULL COMMENT '投票者UID组（\\t分隔）',
  PRIMARY KEY (`option_id`),
  KEY `vote_id` (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投票选项表' ;

# 数据库表：mxczhyk_webinfo 结构信息
DROP TABLE IF EXISTS `mxczhyk_webinfo`;
CREATE TABLE `mxczhyk_webinfo` (
  `website_id` smallint(2) NOT NULL AUTO_INCREMENT COMMENT '网站id',
  `web_name` varchar(20) NOT NULL COMMENT '网站名称',
  `domain_name` varchar(20) NOT NULL COMMENT '域名',
  `web_title` varchar(100) NOT NULL COMMENT '网站标题',
  `web_key` text NOT NULL COMMENT '网站关键字',
  `web_description` varchar(0) NOT NULL COMMENT '网站描述',
  `logoname` varchar(20) NOT NULL COMMENT 'logoname网站系统名称',
  `copyright` text NOT NULL COMMENT '版权信息',
  `reg_agreement` text NOT NULL COMMENT '注册协议',
  `logosite` varchar(100) NOT NULL COMMENT '网站logo地址',
  `weblogo_site` varchar(100) NOT NULL COMMENT '网站logo 的缩略图地址',
  `workTel` varchar(20) NOT NULL COMMENT '传真电话',
  `kefuTel` varchar(100) NOT NULL COMMENT '客服电话1',
  `kefuEmail` varchar(100) NOT NULL COMMENT '客服邮箱',
  `beian` varchar(200) NOT NULL COMMENT 'ICP备案',
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


# 数据库表：mxczhyk_activityapply 数据信息


# 数据库表：mxczhyk_admin 数据信息
INSERT INTO `mxczhyk_admin` VALUES ('1','超级管理员','admin@qq.com','9a0e23021a6eabc8a321c650d6223bc7','1','我是超级管理员 哈哈~~','','1395405387','1');
INSERT INTO `mxczhyk_admin` VALUES ('4','','academy@qq.com','9a0e23021a6eabc8a321c650d6223bc7','1','管理员测试','','1397909151','1');


# 数据库表：mxczhyk_advertisement 数据信息


# 数据库表：mxczhyk_article 数据信息
INSERT INTO `mxczhyk_article` VALUES ('1','0','1','的收到','萨芬安瑟','','','','1390561008','1390561028','0','0','');


# 数据库表：mxczhyk_article_class 数据信息
INSERT INTO `mxczhyk_article_class` VALUES ('24','22','理财资讯');
INSERT INTO `mxczhyk_article_class` VALUES ('14','13','私募动态');
INSERT INTO `mxczhyk_article_class` VALUES ('1','0','信托计划');
INSERT INTO `mxczhyk_article_class` VALUES ('23','22','行业动态');
INSERT INTO `mxczhyk_article_class` VALUES ('8','6','募资资讯');
INSERT INTO `mxczhyk_article_class` VALUES ('2','1','行业新闻');
INSERT INTO `mxczhyk_article_class` VALUES ('9','6','上市资讯');
INSERT INTO `mxczhyk_article_class` VALUES ('6','0','PE');
INSERT INTO `mxczhyk_article_class` VALUES ('21','18','债券公告');
INSERT INTO `mxczhyk_article_class` VALUES ('15','13','私募人物');
INSERT INTO `mxczhyk_article_class` VALUES ('16','13','私募视点');
INSERT INTO `mxczhyk_article_class` VALUES ('26','22','监管动态');
INSERT INTO `mxczhyk_article_class` VALUES ('13','0','阳光私募');
INSERT INTO `mxczhyk_article_class` VALUES ('17','13','私募研究');
INSERT INTO `mxczhyk_article_class` VALUES ('10','6','大佬语录');
INSERT INTO `mxczhyk_article_class` VALUES ('12','6','投资人生');
INSERT INTO `mxczhyk_article_class` VALUES ('27','0','券商');
INSERT INTO `mxczhyk_article_class` VALUES ('4','1','信托渠道');
INSERT INTO `mxczhyk_article_class` VALUES ('20','18','债市研究');
INSERT INTO `mxczhyk_article_class` VALUES ('18','0','债券');
INSERT INTO `mxczhyk_article_class` VALUES ('25','22','观点评论');
INSERT INTO `mxczhyk_article_class` VALUES ('5','1','行业研究');
INSERT INTO `mxczhyk_article_class` VALUES ('11','6','投资人物');
INSERT INTO `mxczhyk_article_class` VALUES ('28','27','行业动态');
INSERT INTO `mxczhyk_article_class` VALUES ('30','27','行业研究');
INSERT INTO `mxczhyk_article_class` VALUES ('22','0','银行');
INSERT INTO `mxczhyk_article_class` VALUES ('3','1','机构动态');
INSERT INTO `mxczhyk_article_class` VALUES ('7','6','行业动态');
INSERT INTO `mxczhyk_article_class` VALUES ('29','27','研究动态');
INSERT INTO `mxczhyk_article_class` VALUES ('19','18','债券要闻');
INSERT INTO `mxczhyk_article_class` VALUES ('31','6','收购并购');


# 数据库表：mxczhyk_article_discuss 数据信息
INSERT INTO `mxczhyk_article_discuss` VALUES ('1','1','安顿规范的灯光下长白菜价不能，m.lk/lk/','122223334','2');


# 数据库表：mxczhyk_attention 数据信息


# 数据库表：mxczhyk_business 数据信息
INSERT INTO `mxczhyk_business` VALUES ('1','中北飞软工作室','中北大学','090051','18235146620','857773627','合作内容：设计到网站建设，软件开发，ui设计，网站维护等等','123344455','无');


# 数据库表：mxczhyk_failedlogin 数据信息
INSERT INTO `mxczhyk_failedlogin` VALUES ('::1','','0','1393934057');


# 数据库表：mxczhyk_gift 数据信息
INSERT INTO `mxczhyk_gift` VALUES ('1','2','彩色蛋糕','10.00','','这是一个蛋糕','12333333','0','0','0');


# 数据库表：mxczhyk_gift_record 数据信息


# 数据库表：mxczhyk_gift_type 数据信息


# 数据库表：mxczhyk_guestbook 数据信息


# 数据库表：mxczhyk_invites 数据信息


# 数据库表：mxczhyk_link 数据信息
INSERT INTO `mxczhyk_link` VALUES ('1','baadsf','baidu','','百度');


# 数据库表：mxczhyk_marriage_term 数据信息
INSERT INTO `mxczhyk_marriage_term` VALUES ('1','2','银川','宁夏','20-25','1234344432','160以上','无','afsggg','回族','中国','经济与管理学院');
INSERT INTO `mxczhyk_marriage_term` VALUES ('2','3','无','无','12','98675444','0','rsc','该机构','维吾尔','健康和刻录机','合计');


# 数据库表：mxczhyk_member 数据信息
INSERT INTO `mxczhyk_member` VALUES ('1','admin1','admin@qq.com','e10adc3949ba59abbe56e057f20f883e','超级管理员','1','1393157969','1395234808','0','0','1','0');
INSERT INTO `mxczhyk_member` VALUES ('2','张明','academy@qq.com','e10adc3949ba59abbe56e057f20f883e','学院科研社','3','1393157969','1393592012','0','12345556','2','0');
INSERT INTO `mxczhyk_member` VALUES ('3','李华','123@qq.com','e10adc3949ba59abbe56e057f20f883e','学院科研社','3','1393164566','1393164566','0','123455','','0');
INSERT INTO `mxczhyk_member` VALUES ('4','mxc','mxc@qq.com','e10adc3949ba59abbe56e057f20f883e','个人用户','4','1393325255','1394897769','1','0','2','0');
INSERT INTO `mxczhyk_member` VALUES ('5','马晓成','857773627@qq.com','3f2fbdadc51d569e2f82265c87404470','个人用户','4','1394786078','1394786078','0','0','1','0');
INSERT INTO `mxczhyk_member` VALUES ('6','maxiaocheng','maxiaocheng@qq.com','e10adc3949ba59abbe56e057f20f883e','个人用户','4','1394970409','1394970409','0','0','1','0');


# 数据库表：mxczhyk_member_detail 数据信息
INSERT INTO `mxczhyk_member_detail` VALUES ('1','2','sean','张明','汉族','中北大学','经济与管理学院','1','1','0','','','1','1','中国','shanxi','memberd','0','20','173','0','0','','0','0','0','0','0','0','','0','无','34','1','345554333','34532453','34534322','23','12','0','0','0','0','1','','2','0','','1','','1','2','0','','0','0','','','','2','0','1','1','');


# 数据库表：mxczhyk_member_spaces 数据信息


# 数据库表：mxczhyk_menu 数据信息


# 数据库表：mxczhyk_message 数据信息


# 数据库表：mxczhyk_mood 数据信息
INSERT INTO `mxczhyk_mood` VALUES ('1','2','阿迪发送到法第三方阿斯蒂芬安瑟安瑟阿斯蒂芬','343223333','0','1');


# 数据库表：mxczhyk_node 数据信息
INSERT INTO `mxczhyk_node` VALUES ('1','Admin','后台管理','1','网站后台管理项目','10','0','1');
INSERT INTO `mxczhyk_node` VALUES ('2','Index','管理首页','1','','1','1','2');
INSERT INTO `mxczhyk_node` VALUES ('3','Member','注册会员管理','1','','3','1','2');
INSERT INTO `mxczhyk_node` VALUES ('4','Webinfo','系统管理','1','','4','1','2');
INSERT INTO `mxczhyk_node` VALUES ('5','index','默认页','1','','5','2','3');
INSERT INTO `mxczhyk_node` VALUES ('6','myInfo','我的个人信息','1','','6','2','3');
INSERT INTO `mxczhyk_node` VALUES ('7','index','会员首页','1','','7','3','3');
INSERT INTO `mxczhyk_node` VALUES ('8','index','管理员列表','1','','8','14','3');
INSERT INTO `mxczhyk_node` VALUES ('9','addAdmin','添加管理员','1','','9','14','3');
INSERT INTO `mxczhyk_node` VALUES ('10','index','系统设置首页','1','','10','4','3');
INSERT INTO `mxczhyk_node` VALUES ('11','setEmailConfig','设置系统邮件','1','','12','4','3');
INSERT INTO `mxczhyk_node` VALUES ('12','testEmailConfig','发送测试邮件','1','','0','4','3');
INSERT INTO `mxczhyk_node` VALUES ('13','setSafeConfig','系统安全设置','1','','0','4','3');
INSERT INTO `mxczhyk_node` VALUES ('14','Access','权限管理','1','权限管理，为系统后台管理员设置不同的权限','0','1','2');
INSERT INTO `mxczhyk_node` VALUES ('15','nodeList','查看节点','1','节点列表信息','0','14','3');
INSERT INTO `mxczhyk_node` VALUES ('16','roleList','角色列表查看','1','角色列表查看','0','14','3');
INSERT INTO `mxczhyk_node` VALUES ('17','addRole','添加角色','1','','0','14','3');
INSERT INTO `mxczhyk_node` VALUES ('18','editRole','编辑角色','1','','0','14','3');
INSERT INTO `mxczhyk_node` VALUES ('19','opNodeStatus','便捷开启禁用节点','1','','0','14','3');
INSERT INTO `mxczhyk_node` VALUES ('20','opRoleStatus','便捷开启禁用角色','1','','0','14','3');
INSERT INTO `mxczhyk_node` VALUES ('21','editNode','编辑节点','1','','0','14','3');
INSERT INTO `mxczhyk_node` VALUES ('22','addNode','添加节点','1','','0','14','3');
INSERT INTO `mxczhyk_node` VALUES ('23','addAdmin','添加管理员','1','','0','14','3');
INSERT INTO `mxczhyk_node` VALUES ('24','editAdmin','编辑管理员信息','1','','0','14','3');
INSERT INTO `mxczhyk_node` VALUES ('25','changeRole','权限分配','1','','0','14','3');
INSERT INTO `mxczhyk_node` VALUES ('26','News','资讯管理','1','','0','1','2');
INSERT INTO `mxczhyk_node` VALUES ('27','index','新闻列表','1','','0','26','3');
INSERT INTO `mxczhyk_node` VALUES ('28','category','新闻分类管理','1','','0','26','3');
INSERT INTO `mxczhyk_node` VALUES ('29','add','发布新闻','1','','0','26','3');
INSERT INTO `mxczhyk_node` VALUES ('30','edit','编辑新闻','1','','0','26','3');
INSERT INTO `mxczhyk_node` VALUES ('31','del','删除信息','0','','0','26','3');
INSERT INTO `mxczhyk_node` VALUES ('32','SysData','数据库管理','1','包含数据库备份、还原、打包等','0','1','2');
INSERT INTO `mxczhyk_node` VALUES ('33','index','查看数据库表结构信息','1','','0','32','3');
INSERT INTO `mxczhyk_node` VALUES ('34','backup','备份数据库','1','','0','32','3');
INSERT INTO `mxczhyk_node` VALUES ('35','restore','查看已备份SQL文件','1','','0','32','3');
INSERT INTO `mxczhyk_node` VALUES ('36','restoreData','执行数据库还原操作','1','','0','32','3');
INSERT INTO `mxczhyk_node` VALUES ('37','delSqlFiles','删除SQL文件','1','','0','32','3');
INSERT INTO `mxczhyk_node` VALUES ('38','sendSql','邮件发送SQL文件','1','','0','32','3');
INSERT INTO `mxczhyk_node` VALUES ('39','zipSql','打包SQL文件','1','','0','32','3');
INSERT INTO `mxczhyk_node` VALUES ('40','zipList','查看已打包SQL文件','1','','0','32','3');
INSERT INTO `mxczhyk_node` VALUES ('41','unzipSqlfile','解压缩ZIP文件','1','','0','32','3');
INSERT INTO `mxczhyk_node` VALUES ('42','delZipFiles','删除zip压缩文件','1','','0','32','3');
INSERT INTO `mxczhyk_node` VALUES ('43','downFile','下载备份的SQL,ZIP文件','1','','0','32','3');
INSERT INTO `mxczhyk_node` VALUES ('44','repair','数据库优化修复','1','','0','32','3');
INSERT INTO `mxczhyk_node` VALUES ('45','Photo','照片管理','1','新增模块','5','1','2');
INSERT INTO `mxczhyk_node` VALUES ('46','aa','n','1','fdsa ','5','32','3');


# 数据库表：mxczhyk_notice 数据信息
INSERT INTO `mxczhyk_notice` VALUES ('1','公告测试1','&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意&nbsp;请注意','admin','1393161579','1','','1','0');
INSERT INTO `mxczhyk_notice` VALUES ('2','名称测试 1','<p>阿道夫阿斯蒂芬撒旦阿斯蒂芬</p><p>阿道夫阿斯蒂芬撒旦阿斯蒂芬<br /></p><p>阿道夫阿斯蒂芬撒旦阿斯蒂芬<br /></p><p>阿道夫阿斯蒂芬撒旦阿斯蒂芬<br /></p><p>阿道夫阿斯蒂芬撒旦阿斯蒂芬<br /></p><p>阿道夫阿斯蒂芬撒旦阿斯蒂芬<br /></p><p>阿道夫阿斯蒂芬撒旦阿斯蒂芬<br /></p>','admin','1393588224','2','','2','0');
INSERT INTO `mxczhyk_notice` VALUES ('3','测试2','阿道夫阿斯蒂芬撒旦阿斯蒂芬阿道夫阿斯蒂芬撒旦阿斯蒂芬阿道夫阿斯蒂芬撒旦阿斯蒂芬阿道夫阿斯蒂芬撒旦阿斯蒂芬阿道夫阿斯蒂芬撒旦阿斯蒂芬阿道夫阿斯蒂芬撒旦阿斯蒂芬','admin','1393588260','2','','3','0');
INSERT INTO `mxczhyk_notice` VALUES ('4','测试33','阿道夫阿斯蒂芬撒旦阿斯蒂芬阿道夫阿斯蒂芬撒旦阿斯蒂芬阿道夫阿斯蒂芬撒旦阿斯蒂芬阿道夫阿斯蒂芬撒旦阿斯蒂芬','admin','1393588291','2','','3','0');
INSERT INTO `mxczhyk_notice` VALUES ('5','名册测试334','阿道夫阿斯蒂芬撒旦阿斯蒂芬阿道夫阿斯蒂芬撒旦阿斯蒂芬阿道夫阿斯蒂芬撒旦阿斯蒂芬阿道夫阿斯蒂芬撒旦阿斯蒂芬阿道夫阿斯蒂芬撒旦阿斯蒂芬阿道夫阿斯蒂芬撒旦阿斯蒂芬阿道夫阿斯蒂芬撒旦阿斯蒂芬阿道夫阿斯蒂芬撒旦阿斯蒂芬阿道夫阿斯蒂芬撒旦阿斯蒂芬','admin','1393588316','2','','4','0');
INSERT INTO `mxczhyk_notice` VALUES ('6','测试5','大厦内覅蛇年到开发商的卡夫卡','admin','1393588344','2','','3','0');
INSERT INTO `mxczhyk_notice` VALUES ('7','测试6','阿斯蒂芬asf阿斯顿飞阿道夫阿斯蒂芬撒旦阿斯蒂芬阿道夫阿斯蒂芬撒旦阿斯蒂芬阿道夫阿斯蒂芬撒旦阿斯蒂芬阿道夫阿斯蒂芬撒旦阿斯蒂芬阿道夫阿斯蒂芬撒旦阿斯蒂芬','admin','1393588394','2','','3','0');


# 数据库表：mxczhyk_onlinetime 数据信息
INSERT INTO `mxczhyk_onlinetime` VALUES ('1','10','60','1170601084','0');


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


# 数据库表：mxczhyk_successobject 数据信息


# 数据库表：mxczhyk_vip_space 数据信息
INSERT INTO `mxczhyk_vip_space` VALUES ('2','1','1259550575','60','2009-11-30 11:09:35','1');


# 数据库表：mxczhyk_viptype 数据信息
INSERT INTO `mxczhyk_viptype` VALUES ('1','高级会员');
INSERT INTO `mxczhyk_viptype` VALUES ('2','特级会员');
INSERT INTO `mxczhyk_viptype` VALUES ('3','钻石级会员');


# 数据库表：mxczhyk_vote 数据信息


# 数据库表：mxczhyk_vote_log 数据信息


# 数据库表：mxczhyk_vote_option 数据信息


# 数据库表：mxczhyk_webinfo 数据信息
INSERT INTO `mxczhyk_webinfo` VALUES ('1','中北大学研究生院就业信息网','http://grs.nuc.edu.c','中北大学研究生院就业信息网','中北大学,就业,研究生,研究生就业网','','','<div>© 中北大学研究生院&nbsp;&nbsp;&nbsp;&nbsp;版权所有&nbsp;&nbsp;&nbsp;&nbsp;中北大学研究生院就业信息网</div>
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
</p>','','','','','','');


# 数据库表：mxczhyk_words 数据信息
