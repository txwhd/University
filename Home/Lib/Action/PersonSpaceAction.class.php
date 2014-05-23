<?php
class PersonSpaceAction extends CommonAction{
	public function index(){
		//姓名，
		$this->display();
	}
	public function personMain(){
		$this->display();
	}	
	public function ListIntro(){
		//显示基本信息页面
		$this->display();
	}	
	public function ListApprove(){
		//显示诚信认证页面
		$this->display();
	}	
	public function ListHeadPhoto(){
		//显示上传头像页面
		$this->display();
	}	
	public function ListPhoto(){
		//显示相册页面
		$this->display();
	}	
	public function ListVipUpgrade(){
		//显示相册页面
		$this->display();
	}	
	public function ListFriend(){
		//显示交友特权
		$this->display();
	}	
	public function ListPay(){
		//显示账户充值
		$this->display();
	}	
	public function VipUpgrade(){
		//处理升级管理
	}
	public function ListArticle(){
		//显示推荐文章
		$this->display();
	}	
	public function ListArticleAdd(){
		//显示增加文章
		$this->display();
	}	
	public function upfileHeadPhoto(){
		//上传头像处理 现在不成功
		$savePath = './';  //图片存储路径
$savePicName = time();  //图片存储名称
$file_src = $savePath.$savePicName."_src.jpg";
$filename162 = $savePath.$savePicName."_162.jpg"; 
$filename48 = $savePath.$savePicName."_48.jpg"; 
$filename20 = $savePath.$savePicName."_20.jpg";    
$src=base64_decode($_POST['pic']);
$pic1=base64_decode($_POST['pic1']);   
$pic2=base64_decode($_POST['pic2']);  
$pic3=base64_decode($_POST['pic3']);  
if($src) {
	file_put_contents($file_src,$src);
}
file_put_contents($filename162,$pic1);
file_put_contents($filename48,$pic2);
file_put_contents($filename20,$pic3);
$rs['status'] = 1;
$rs['picUrl'] = $savePath.$savePicName;

print json_encode($rs);
	}	
	
}

