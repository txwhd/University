<?php
class TestAction extends Action{
	//换一换ajax调用
	//权限判断 个人中心；
	//测试文件
	public function index(){
		$ip = get_client_ip();
		echo $this->_server('REMOTE_ADDR');//访问者外部的ip
		echo '<br>';
		echo $this->_server('SERVER_ADDR');//当前服务器的ip
		echo '<br>';
		echo $ip;
	}
		public function photoupload(){
	
			session_start();
			$user = M('User_photo');
			$con0 = $user->query("select COUNT(id) as CON from cup_user_photos where
	
	
user_id='".session('user_id')."'");
			if($con0[0]['CON']>=5){
				echo "10101";
			}else{
				import("ORG.Net.UploadFile");
	
	
				$upload = new UploadFile();// 实例化上传类
	
	
				$upload->maxSize  = 3145728 ;// 设置附件上传大小
				$upload->saveRule = time();
				$upload->thumb = true;
				$upload->thumbMaxWidth = "1024";
				$upload->thumbMaxHeight = "768";
				$upload->thumbRemoveOrigin = true;
				$upload->allowExts  = array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
				$upload_file="public/image/".date('Ymd')."/".session('username')."/";
				$upload_dir=create_folders($upload_file);
				$upload->savePath = $upload_dir;// 设置附件上传目录
				//给图片加水印
				import('ORG.Util.Image');
				$Image = new Image();
				$uploadfile='/'.$info[0]['savepath'].'thumb_'.$info[0]['savename'];
				$Image->water($uploadfile,'/public/image/1336954430057.png');
				if(!$upload->upload()) {// 上传错误提示错误信息
					$this->error($upload->getErrorMsg());
				}else{// 上传成功 获取上传文件信息
					$info =$upload->getUploadFileInfo();
					//给m_缩略图添加水印, Image::water('原文件名','水印图片地址')
					//给图片加水印
					$uploadfile='/'.$info[0]['savepath'].'thumb_'.$info[0]['savename'];
					echo $uploadfile;
				}
			}
	
	
		}
}
/*
 * 停留在原来的状态：
 * [php]
XXXXX
session_start();
$_SESSION['now_page'] == $_SERVER['SCRIPT_NAME'];
XXX
[/php]


登陆成功页面：
[php]
session_start();
if (isset($_SESSION['now_page'])){
        header("Location:".$_SESSION['now_page']);
}
[/php]



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

