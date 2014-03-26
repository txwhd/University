<?php
/*  
 * 前台下面的配置
 * */
$config_arr1 = include_once WEB_ROOT . 'Common/config.php';
$config_arr2 = array(
		//'配置项'=>'配置值'
		'DB_TYPE'		=>	'mysql',// 数据库类型
		'DB_HOST'		=>	'localhost',// 数据库服务器地址
		'DB_NAME'		=>	'mxczhang_forlove',// 数据库名称
		'DB_USER'		=>	'root',// 数据库用户名
		'DB_PWD'		=>	'yzz',// 数据库密码
		'DB_PREFIX'		=>	'mxczhyk_',// 数据表前缀
		'DB_CHARSET'	=>	'utf8',// 网站编码
		'DB_PORT'		=>	'3306',// 数据库端口
		'APP_DEBUG'     =>  TRUE,// 开启调试模式
		'SHOW_PAGE_TRACE'=>true,//显示页面trace信息
		'URL_CASE_INSENSMVE'=>true,//显示url访问不再区分大小写
   
);
return array_merge($config_arr1, $config_arr2);
?>