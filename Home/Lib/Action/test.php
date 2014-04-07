<?php
/*
 * 在模板文件中的时间比较
 *     Action: 
    $this->t = time();
    $this->publishTime = $result['publishTime'];
    模板：
    <if condition="($t - $publishTime) lt 10">发表于{$t - $publishTime}内
        <elseif condition="($t - $publishTime) lt 24*3600" />发表于一天内
        <else />老早了
    </if>
 */
/*
 * 
 *   $link = mysql_connect('hostname','dbuser','dbpassword'); 
if (!$link) { 
	die('Could not connect to MySQL: ' . mysql_error()); 
} 
echo 'Connection OK'; mysql_close($link); */

/* 2012-03-23 09:54
PHP时间戳与时间相互转换(精确到毫秒)*/

/** 获取当前时间戳，精确到毫秒 */

/* function microtime_float()
{
	list($usec, $sec) = explode(" ", microtime());
	return ((float)$usec + (float)$sec);
} */

/** 格式化时间戳，精确到毫秒，x代表毫秒 */

/* function microtime_format($tag, $time)
{
	list($usec, $sec) = explode(".", $time);
	$date = date($tag,$usec);
	return str_replace('x', $sec, $date);
} */ 

