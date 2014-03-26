<?php
	return array ( 
			'SITE_INFO' => array ( 
					'name' => 'PHP-Amateur通用内容管理系统后台', 'keyword' => '内容管理系统', 
					'description' => '分享自己写的php代码和收藏比较好的php代码，点滴PHP记录提升技术能力', ), 
			'WEB_ROOT' => 'http://localhost/University/', 'AUTH_CODE' => 'Dvo8LA', 
			'ADMIN_AUTH_KEY' => 'admin@qq.com', 
			
			
			//'配置项'=>'配置值'
			'DB_TYPE'		=>	'mysql',// 数据库类型
			'DB_HOST'		=>	'localhost',// 数据库服务器地址
			'DB_NAME'		=>	'mxczhang_forlove',// 数据库名称
			'DB_USER'		=>	'root',// 数据库用户名
			'DB_PWD'		=>	'mxc',// 数据库密码
			'DB_PREFIX'		=>	'mxczhyk_',// 数据表前缀
			'DB_CHARSET'	=>	'utf8',// 网站编码
			'DB_PORT'		=>	'3306',// 数据库端口
			'APP_DEBUG'     =>  TRUE,// 开启调试模式
			'SHOW_PAGE_TRACE'=>true,//显示页面trace信息
			'URL_CASE_INSENSMVE'=>true,//显示url访问不再区分大小写
			/* 'DB_HOST' => '127.0.0.1',
			 'DB_NAME' => 'myphp1', 
			'DB_USER' => 'root',
			 'DB_PWD' => '111', 
			'DB_PORT' => '3306',
			 'DB_PREFIX' => 'pa_', 
			'webPath' => '/University/', */
			 'TOKEN' => array ( 
			 		'admin_marked' => 'QQ群：102577846', 'admin_timeout' => 3600,
			 		 'member_marked' => 'http://blog.51edm.org', 
			 		//'member_timeout' => 3600, 
			 		), 
			
	);
			 ?>