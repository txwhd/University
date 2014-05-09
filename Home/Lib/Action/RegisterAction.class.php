<?php
/*
 * 注册模块
 */
class RegisterAction extends CommonAction{
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
	public  function addPersonReg(){
		//增加个人用户
		header('Content-Type:text/html;charset=utf-8');
		$pass=trim($_POST['password']);
		$academy_id=trim($_POST['academy_id']);
		$password_again=trim($_POST['password_again']);
		$email=trim($_POST['email']);
		$username=trim($_POST['username']);
		if(empty($pass)|| empty($password_again)||empty($username)||empty($email)){
			$this->error('请把资料填写完整！',U('Register/showReg'));
		}
		$pattern1="/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/";
		if (!preg_match($pattern1,$email)) {
			$this->error('邮箱格式不对！',U('Register/showReg'));
		}
		if ($pass!=$password_again||strlen($pass)<5||strlen($pass)>12) {
			$this->error('确认密码与密码不符合,或者长度不是5-12位！',U('Register/showReg'));
		}
		$member=M('member');
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
		}
	}
}