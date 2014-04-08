<?php
	return array ( 
			'SITE_INFO' => array ( 
					'name' => 'yao99大学恋爱网后台管理', 'keyword' => '内容管理系统', 
					'description' => 'www.yao99.com网站后台管理系统', ), 
			'WEB_ROOT' => 'http://localhost/University/', 'AUTH_CODE' => 'Dvo8LA', 
			'ADMIN_AUTH_KEY' => 'admin@qq.com', 
			//定义固定的文件夹目录
			'TMPL_PARSE_STRING'=>array(
			//'__CSS__'=>__ROOT__.'/Public/Css',
			//'__JS__'=>__ROOT__.'/Public/Js',
			//'__IMAGES__'=>__ROOT__.'/Public/Images',
			'__IMG__'=>__ROOT__.'/Public/Img',			
	),
			
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
			 'TOKEN' => array ( 
			 		'admin_marked' => 'QQ群：102577846', 'admin_timeout' => 3600,
			 		 'member_marked' => 'http://blog.51edm.org', 
			 		//'member_timeout' => 3600, 
			 		), 
			
	);
			 ?>