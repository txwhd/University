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
			$topicid = $model->add(); //add方法会返回新添加的记录的主键值
			if($topicid) {
				$this->success('添加成功！');
			}else {
				throw_exception("数据库添加失败");
			}
			$pass=trim($_POST['password']);
			$password_again=trim($_POST['repass']);
			$email=trim($_POST['email']);
			$username=trim($_POST['username']);
		}
		
		/* if(empty($pass)|| empty($password_again)||empty($username)||empty($email)){
			$this->error('请把资料填写完整！',U('Register/showReg'));
		}
		$phone="/^[A-Za-z]{1}[0-9A-Za-z_]{2,29}$/";
		if (!preg_match($pattern1,$email)) {
			$this->error('邮箱格式不对！',U('Register/showReg'));
		}
		if ($pass!=$password_again) {
			$this->error('确认密码与密码不符合',U('Register/showReg'));
		} */
		/* $member=D('member');
		$where['email'] = $email;
		$find=$member->where($where)->find();
		if ($find) {
			$this->error('邮箱已经存在请重新注册！');
		}
		$data['username'] = $username;
		$data['academy_id'] = $academy_id;
		$data['password'] = md5($pass);
		$data['email'] = $email;
		$data['role_id'] = "4";
		$data['status'] = "1";
		$data['role_name'] = '个人用户';
		$data['last_login_time'] = $data["reg_time"] = time();
		$member_id = $member->add($data);
		if (!$member_id){
			redirect('Person/Register/showReg',3,'数据有误，注册失败');
		}else{
			$_SESSION['member_id']=$member_id;//将登陆id存续到session中
			$_SESSION['personName']=$username;//将登陆用户名存续到session中
				
			$applyer=M('Applyer');
			$result=$applyer->create();
			$result['member_id'] = $member_id;
			$result['real_name'] =$username;
			$applyer_id = $applyer->add($result);
			if (!$applyer_id){
				$this->error('注册失败！');
			}else {
				$_SESSION['applyer_id']=$applyer_id;
				$subject=M('Subject');//增加学科信息
				$data1['applyer_id']=$_SESSION['applyer_id'];
				$sub=$subject->add($data1);
				$this->redirect('Person/Index/index',array(),2,'注册成功!');
			}
		} */
	}
	//md5()
	/* private function emailmd5($email){
		return md5($email);
	} */
	//检验验证码是否正确
	public function verifyCheck()
	{
		if (md5($_POST['verifyTest']) != Session::get('verify'))
		{
			die('验证码错误');  //如果验证码不对就退出程序
		}
	}
}