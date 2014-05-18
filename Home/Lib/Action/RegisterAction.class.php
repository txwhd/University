<?php
/*
 * 注册模块
 */
class RegisterAction extends Action{
	public function index(){
		$model=M('Webinfo');
		$reg=$model->field('reg_agreement')->limit(1)->select();
		$this->assign('reg',$reg);
		$this->display();
	}
	public function ifRegEmail(){
		$where['email']=$_POST['email'];
		$re=M('member')->where($where)->select();
		if($re){
			$exit=1;
		}else{
			$exit=0;
		}
		echo json_encode($exit);
	}
	public function test(){
			if(isset($_GET['ajax']) && $_GET['ajax'] == 1){
			if($_GET['name'] == 'yes'){
				echo 'true';
			}else{
				echo 'false';
			}
			return;
		}
	}
	public  function dealReg(){
		//$md5email=$this->emailmd5($result['email']+time());
		header('Content-Type:text/html; charset=utf-8');//防止出现乱码
		//$this->verifyCheck();//调用本类的函数，
		if($_POST['submit']){
			$model = D("Register");
			$vo = $model->create();
			if(false === $vo) die($model->getError());
			$member_id = $model->add(); //add方法会返回新添加的记录的主键值
			if($member_id) {
				//生成认证条件
        		$map            =   array($vo);
				import ( 'ORG.Util.RBAC' );
				$_SESSION[C('USER_AUTH_KEY')]=$member_id;
				$_SESSION['email']	=$_POST['email'];
				$_SESSION['loginUserName']=$_POST['username'];
				$_SESSION['OnlineTF']="1";//用户在线状态
				//保存会员详细信息
				$member_detail	=	M('member_detail');
				$data['member_id']	=	$member_id;
				$data['username']	=	trim($_POST['username']);
				$member_detail->add($data);
				$this->success('注册成功！','PersonSpace/ListHeadPhoto');
			}else {
				$this->error("注册失败");
			}
		}
	}
	//检验验证码是否正确
	public function verifyCheck()
	{
		if (md5($_POST['verifyTest']) != Session::get('verify'))
		{
			die('验证码错误');  //如果验证码不对就退出程序
		}
	}
}