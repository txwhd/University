<?php
header('Content-Type:text/html; charset=UTF-8');
ob_start();
@set_magic_quotes_runtime();
ini_set('date.timezone', 'Asia/Shanghai');
define('THINK_PATH', './ThinkPHP/');
define('APP_NAME', 'Home');
define('APP_PATH', './Home/');
define('APP_DEBUG', TRUE);
define('SITE_PATH', getcwd());//网站当前路径
define('NO_CACHE_RUNTIME',true); //开发时不进行缓存
define("RUNTIME_PATH", SITE_PATH . "/Cache/Runtime/Home/");
define("WEB_ROOT", dirname(__FILE__) . "/");
//目录安全
define('BUILD_DIR_SECURE',true);
define('DIR_SECURE_FILENAME', 'index.html');
define('DIR_SECURE_CONTENT', 'deney Access!');
//define("WEB_HTML_PATH", reset(explode("/", $_SERVER["DOCUMENT_ROOT"])) . "/Html/");
/* if (!file_exists(WEB_ROOT.'Common/systemConfig.php')) {
    header("Location: install/");
    exit;
} */
require(THINK_PATH . "ThinkPHP.php");

?>