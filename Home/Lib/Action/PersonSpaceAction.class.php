<?php
class PersonSpaceAction extends  CommonAction{
	/* //初始化
	function _initialize(){
		//友情链接全部取出
		//文章取出5条
		//同校活动取出5条
		Load('extend');
		import("ORG.Util.Page");       //载入分页类
	} */
	public function index(){
		//姓名分配
		//引进约会功能（引诱）
		$where['vip_type_id']=$_SESSION['vipType'];
		$member_id=$_SESSION['USER_AUTH_KEY'];
		$this->assign('Viptype',M('Viptype')->where($where)->select());//确定会员类型
		
		$photowhere['member_id']=$member_id;
		$photoresult['headphoto']=M('Member')->where($photowhere)->field('headphoto')->select();
		$this->assign('headphoto',$photoresult['headphoto']);//头像
		//我的状态
		$mymoodmodel=M('Mood');
		$mymood=$mymoodmodel->where($member_id)->order('create_time DESC')->select();
		$mymoodCount=$mymoodmodel->where($member_id)->count();
		$mymoodpage = new Page($mymoodCount, 5);
		$mymoodshowPage = $mymoodpage->show();
		$this->assign("mymoodpage", $mymoodshowPage);
		$this->assign('mymood',$mymood);
		
		//关注好友动态(逻辑没有实现)
		$attentionModel=M('Attention');
		$attMood=M('Mood')->where('status=1')->order('create_time DESC')->select();
		$attCount=$attentionModel->where($member_id)->count();
		$attpage = new Page($attentionModel, 5);
		$myattshowPage = $attpage->show();
		$this->assign("myattshowPag", $mymoodshowPage);
		//jiujiu币(默认10)
		$wherepoint['id']=$member_id;
		$this->assign('mypoint',M('Member_detail')->where($wherepoint)->field('iPoint')->select());
		
		//全部动态
		$Allmodel=M('Mood');
		$allmood=$Allmodel->where('status=1')->order('create_time DESC')->select();
		$countallmood=$Allmodel->where('status=1')->order('create_time DESC')->count();
		$pageallmood = new Page($countallmood, 5);
		$showAllMoodPage = $pageallmood->show();
		$this->assign("allmoodpage", $showAllMoodPage);
		$this->assign("allmood",$allmood);
		
		$this->display();
	}
	//public function allmood(){
		//全部好友状态
		/* $count = M()->table("mxczhyk_mood r")->join("mxczhyk_member s on r.member_id=s.member_id")->where('status=1')->count();
		$mood=M()->table("mxczhyk_mood r")->join("mxczhyk_member s on r.member_id=s.member_id")->where('status=1')->order('create_time DESC')->select(); */
		
	public function personMain(){
		$this->display();
	}	
	public function ListIntro(){
		//显示基本信息页面
		$this->display();
	}	
	public function addMood(){
		$data['content']=$_POST['content'];
		$data['create_time']=time();
		$data['username']=$_SESSION['USER_AUTH_KEY'];
		$data['member_id']=$_SESSION[C('USER_AUTH_KEY')];
		$result=M('Mood')->add($data);
		if($result){
			$exit=success;
		}else{
			$exit=0;
		}
		echo json_encode($exit);
		/* if($result){
			$this->success('发表成功');
		}else {
			$this->error('发表失败！请重新发表！');
		} */
		
	}
	public function qiandao(){
		$model=M('');
	}
	
	public function ListTerm(){
		//显示择偶条件表
		$member_id=$_SESSION['USER_AUTH_KEY'];
		$marriage_term=M('marriage_term');
		if (IS_POST) {
			$data=$marriage_term->create();
			$result=$marriage_term->where($member_id)->save($data);
			if($result){
				$this->success('修改成功');
			}else {
				$this->error('修改失败！请重新修改！');
			}
		}
		$result=$marriage_term->where($member_id)->select();
		$this->assign('list',$result);
		$this->display();
	}	 
	public function ListMonologue(){
		//显示爱情宣言
		$this->display();
	}	 
	public function changePass(){
		//修改密码
		$id  =  $_POST['id'];
        $password = $_POST['password'];
        if(''== trim($password)) {
        	$this->error('密码不能为空！');
        }
        $User = M('User');
		$User->password	=	md5($password);
		$User->id =	$id;
		$result	=	$User->save();
        if(false !== $result) {
            $this->success("密码修改为$password");
        }else {
        	$this->error('重置密码失败！');
        }
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
		$where['member_id']=$_SESSION['USER_AUTH_KEY'];
		$email=M('Member')->where($where)->field('email,emailpass')->select();
		$this->assign('email',$email);//分配注册的邮箱
		
		$this->display();
	}	 
	public function ListHeadPhoto(){
		//显示上传头像页面
		$this->display();
	}	
	public function ListPhoto(){
		//显示相册页面(相册没有完成，只是照片)
		$where['member_id']=$_SESSION['USER_AUTH_KEY'];
		$where['status']="1";
		$photo=M('Photo')->where($where)->select();
		if (!empty($photo)) {
			$wherePhoto['photo_id']=$photo[0]['photo_id'];
			$wherePhoto['status']="1";
			$photo_detail=M('Photo_detail')->where($where)->select();
			$this->assign('photoDetail',$photo_detail);
		}else {
			$this->assign('photoDetail','你的相册中暂时还没有照片，为了让大家尽快认识你，尽快上传啊！');
		}
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
		//显示文章
		$map['islock'] = array('eq',1);			
		//分页取数据
		import("ORG.Util.Page");
		$Article = D("Article");			
		$count = $Article->where($map)->count(); 
		$Page = new Page($count,3);
		$show = $Page->show(); 
		$list = $Article->where($map)->order('sort DESC,update_time DESC')->limit($Page->firstRow.','.$Page->listRows)->select();
		$whereDiscuss['aid']=$list[0]['article_id'];
		$countDiscuss = M('Article_discuss')->where($whereDiscuss)->count();
		$this->assign('list',$list);
		$this->assign('countDiscuss',$countDiscuss);
		$this->assign('keywords',$Article->where($map)->order('sort DESC,update_time DESC')->limit(7)->field('keywords')->select());
		$this->assign('page',$show);
		$this->display();
	}	
	public function ListArticleAdd(){
		//显示增加文章
		$this->display();
	}	
	public function ListActivity(){
		//显示我的活动
		$where['member_id']=$_SESSION['USER_AUTH_KEY'];
		$where['isLock']="1";
		$mylistAct=M('Activity')->where($where)->select();
		$this->assign('mylistAct',$mylistAct);
		//全部活动
		$alllistAct=M('Activity')->where('isLock=1')->select();
		$this->assign('alllistAct',$alllistAct);
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

