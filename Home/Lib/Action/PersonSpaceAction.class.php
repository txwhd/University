<?php
class PersonSpaceAction extends CommonAction{
	public function index(){
		//姓名分配
		//引进约会功能（引诱）
		$where['vip_type_id']=$_SESSION['vipType'];
		$member_id=$_SESSION[C('USER_AUTH_KEY')];
		$this->assign('Viptype',M('Viptype')->where($where)->select());//确定会员类型
		$this->assign('Headphoto',M('Member')->where($member_id)->select());//头像
		$this->display();
	}
	public function personMain(){
		$this->display();
	}	
	public function ListIntro(){
		//显示基本信息页面
		$this->display();
	}	
	public function ListTerm(){
		//显示择偶条件表
		$this->display();
	}	 
	public function ListMonologue(){
		//显示爱情宣言
		$this->display();
	}	 
	public function ListBelief(){
		//显示信仰
		$this->display();
	}	 
	public function goLove(){
		//显示约会
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
	public function ListActivity(){
		//显示活动
		$where['member_id']=$_SESSION[C('USER_AUTH_KEY')];
		$list=M('Activity')->where($where)->select();
		$this->assign('list',$list);
		$this->display();
	}	
	public function upfileHeadPhoto(){
		$model=M('member');
		try{
			$data=$model->create();
			import('ORG.Net.UploadFile');
			$upload = new UploadFile();// 实例化上传类
			$upload->maxSize = 32922000;//设置上传文件大小
			//设置上传文件类型
			$upload->allowExts = array('swf', 'gif','jpg', 'png' ,'gif','jpeg');
			$upload->saveRule= time();  //上传文件的文件名保存规则(以时间戳为文件名)
			$upload->thumbRemoveOrigin = true;               //是否移除原图
			$upload->thumb = true;                         //是否需要对上传文件进行缩略图处理
			$upload->thumbMaxHeight= "160";      //设置缩略图的最大高度
			$upload->thumbMaxWidth = "700";        //设置缩略图的最大宽度
			$upload_time = date('Y-m-d');
			$savePath = './Public/Upload/HeadPhoto/';  //图片存储路径// 设置附件上传目录
			$thumbPath ='./Public/Uploads/HeadPhoto/thumb/';//缩略图的路径
			$upload->savePath =$savePath;
			$upload->thumbPath = $thumbPath;
			$upload->uploadReplace = true;//存在同名文件是否是覆盖
			$result1=$upload->upload();//保存上传文件，获取上传信息
			if ($result1) {
				$uploadList=$upload->getUploadFileInfo();//获取上传文件成功后的结果
				$data['ad_name']='thumb_'.$uploadList[0]['savename'];//保存系统名称
				$data['image_site']=$savePath;//原图路径headphoto
				$data['image_site_thumb']=$thumbPath;//缩略图路径
			}else{
				$this->error('上传文件不能为空');
			}
			$where['ad_id']=$_GET['id'];
			$result=$model->where($where)->save($data);
				
			$this->success("编辑成功");
		}catch (Exception $e){
			$this->error('编辑失败');
		}
	/* 	
		$savePath = './Public/Upload/HeadPhoto/';  //图片存储路径
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
		print json_encode($rs);
	 */
}
}

