<?php

$config_arr1 = include_once WEB_ROOT . 'Common/config.php';
$DB_PREFIX = $config_arr1['DB_PREFIX'];
$config_arr2 = array(
    'admin_big_menu' => array(
        'Index' => '首页',
        'Member' => '会员管理',
        //'News' => '资讯管理',
        'Notice' => '公告管理',
        'Gift' => '礼品管理',
        'Article' => '文章管理',
        'Link' => '友情链接',
        'Advertisement' => '广告管理',
       'Payment' => '支付管理', 
        'Activity' => '活动管理',
        'Other' => '其他业务',
	     'Webinfo'=>'系统设置',
        'SysData' => '数据管理',
        'Access' => '权限管理',
    ),
    'admin_sub_menu' => array(
        'Common' => array(
            'Index/myInfo' => '修改密码',
            'Index/cache' => '缓存清理',
            'News/add' => '新闻发布',
        ),
        'Webinfo' => array(
            'index' => '站点文本配置',
            'webTableConfig' => '站点数据库配置',
            'setEmailConfig' => '邮箱配置',
            'setSafeConfig' => '安全配置',
            'setFtpConfig' => 'FTP配置',
            'File/index' => '文件管理',
        	'Menu/index' => '首页菜单',
        	'Menu/add' => '增加首页菜单',
        	'Mobile/index' => '移动版管理',
        	'Code/index' => '二维码管理',
        ),
        'File' => array(
            'index' => '文件列表'
        ),
        'Other' => array(
            'index' => '其他业务列表',
            'Label/index' => '标签管理',
        	'Business/index' => '商家入赘'
        ),
        'Code' => array(
            'index' => '二维码列表'
        ),
        'Label' => array(
            'add' => '增加标签',
        ),
        'Mood' => array(
            'index' => '发表心情列表'
        ),
        'Activity' => array(
            'index' => '活动列表',
            'add' => '发布活动'
        ),
        'Member' => array(
            'index' => '注册用户列表',
            'category' => '会员分类管理',
            'vipPrivilege' => '会员权限分配管理',
            'renzheng' => '认证管理',
            'Photo/index' => '相册管理',
            'Mood/index' => '发表心情管理',
        ),
    	'Photo' => array(
    				'index' => '相册列表',
    		),
        'News' => array(
            'index' => '新闻列表',
            'category' => '新闻分类管理',
            'add' => '发布新闻',
        ),
    	 'Payment' => array(
            'index' => '支付方式列表',
    	 	'payRecord'=>'支付记录列表',
            'add' => '增加支付方式',
            'addRecord' => '增加支付记录',
            'cardManager' => '充值卡管理',
            'setPoint' => '点数购买设置',
            'Integral' => '积分换点数设置',
            'PointChange' => '有效期购买设置',
            'setPayLine' => '在线支付设置',
    	 	
        ), 
        'Notice' => array(
            'index' => '公告列表',
            'add' => '发布公告',
        ),
        'Link' => array(
            'index' => '链接列表',
            'add' => '发布链接',
        ),
        'Menu' => array(
            'index' => '首页菜单列表',
            'add' => '增加首页菜单',
        ),
        'Gift' => array(
            'index' => '礼品列表',
            'add' => '发布礼品',
        	'category' => '分类管理',
        ),
        'Business' => array(
            'index' => '商家列表',
        ),
        'Article' => array(
            'index' => '文章列表 ',
            'category' => '文章分类管理',
            'add' => '发布文章',
            'discuss' => '评论文章管理',
        ),
        'Advertisement' => array(
            'index' => '广告列表',
            'category' => '广告分类管理',
            'add' => '增加广告',
        ),
        'SysData' => array(
            'index' => '数据库备份',
            'restore' => '数据库导入',
            'zipList' => '数据库压缩包',
            'repair' => '数据库优化修复'
        ),
        'Access' => array(
            'index' => '后台用户',
            'nodeList' => '节点管理',
            'roleList' => '角色管理',
            'addAdmin' => '添加管理员',
            'addNode' => '添加节点',
            'addRole' => '添加角色',
        ),
    ),
    /*
     * 以下是RBAC认证配置信息
     */
    'USER_AUTH_ON' => true,
    'USER_AUTH_TYPE' => 2, // 默认认证类型 1 登录认证 2 实时认证
    'USER_AUTH_KEY' => 'authId', // 用户认证SESSION标记
    'USER_AUTH_MODEL' => 'Admin', // 默认验证数据表模型
    'AUTH_PWD_ENCODER' => 'md5', // 用户认证密码加密方式encrypt
    'USER_AUTH_GATEWAY' => '/system.php/Public/index', // 默认认证网关
    'NOT_AUTH_MODULE' => 'Public', // 默认无需认证模块
    'REQUIRE_AUTH_MODULE' => '', // 默认需要认证模块
    'NOT_AUTH_ACTION' => '', // 默认无需认证操作
    'REQUIRE_AUTH_ACTION' => '', // 默认需要认证操作
    'GUEST_AUTH_ON' => false, // 是否开启游客授权访问
    'GUEST_AUTH_ID' => 0, // 游客的用户ID
    'RBAC_ROLE_TABLE' => $DB_PREFIX . 'role',
    'RBAC_USER_TABLE' => $DB_PREFIX . 'role_user',
    'RBAC_ACCESS_TABLE' => $DB_PREFIX . 'access',
    'RBAC_NODE_TABLE' => $DB_PREFIX . 'node',
    /*
     * 系统备份数据库时每个sql分卷大小，单位字节
     */
    'sqlFileSize' => 5242880, //该值不可太大，否则会导致内存溢出备份、恢复失败，合理大小在512K~10M间，建议5M一卷
        //10M=1024*1024*10=10485760
        //5M=5*1024*1024=5242880
);
return array_merge($config_arr1, $config_arr2);
?>