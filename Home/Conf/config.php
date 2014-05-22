<?php
$config_arr1 = include_once WEB_ROOT . 'Common/config.php';
$config_arr2 = array(
		//phpmail邮件发送
		'THINK_EMAIL' => array(
				'SMTP_HOST'   => 'smtp.126.com', //SMTP服务器
				'SMTP_PORT'   => '465', //SMTP服务器端口
				'SMTP_USER'   => 'lianaiyao99@126.com', //SMTP服务器用户名
				'SMTP_PASS'   => '85777126', //SMTP服务器密码
				'FROM_EMAIL'  => 'lianaiyao99@126.com', //发件人EMAIL
				'FROM_NAME'   => '研究生就业信息网管理中心', //发件人名称
				'REPLY_EMAIL' => '857773627@qq.com', //回复EMAIL（留空则为发件人EMAIL）
				'REPLY_NAME'  => '研究生', //回复名称（留空则为发件人名称）
		),
		'TMPL_EXCEPTION_FILE'=>'./Home/Tpl/Public/error.html'       // 定义公共错误模板
);
return array_merge($config_arr1, $config_arr2);
