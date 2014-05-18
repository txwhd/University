<?php
header('Content-Type:text/html; charset=UTF-8');
ob_start();
@set_magic_quotes_runtime();
ini_set('date.timezone', 'Asia/Shanghai');
define('THINK_PATH', './ThinkPHP/');
define('APP_NAME', 'Admin');
define('APP_PATH', './Admin/');
define("WEB_ROOT", dirname(__FILE__) . "/");
define('WEB_CACHE_PATH', WEB_ROOT."Cache/");//网站当前路径
define("RUNTIME_PATH", WEB_ROOT . "Cache/Runtime/Admin/");
define("DatabaseBackDir", WEB_ROOT . "Databases/"); //系统备份数据库文件存放目录
define('APP_DEBUG', TRUE);
//目录安全
define('BUILD_DIR_SECURE',true);
define('DIR_SECURE_FILENAME', 'index.html,default.html,index.htm');
define('DIR_SECURE_CONTENT', 'deney Access!');
require(THINK_PATH . "ThinkPHP.php");

?>