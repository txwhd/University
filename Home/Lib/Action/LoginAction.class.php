<?php
/*
 * 登陆
 */
class LoginAction extends CommonAction{
	public $loginMarked;
	public function checkLogin() {
		if (isset($_COOKIE[$this->loginMarked])) {
			$cookie = $_COOKIE[$this->loginMarked];
		} else {
			$this->redirect("Public/index");
		}
		return TRUE;
	}/*  
	先判断是否登录过cookies是否存在，存在级登陆
	*1.提交判断什么登陆类型
	*2.是否记住密码类型
	*3.验证用户
	*4.记录信息
	*/
	public function index(){
		if(empty($_SESSION['loginUserName'])){
			//session为空
			if(empty($_COOKIE['email']) || empty($_COOKIE['password'])){
				//cookies为空
				
			}else{
				//用户选择了记住登录状态
				$user =$this->getUserInfo($_COOKIE['email'],$_COOKIE['password']); //去取用户的个人资料
				if(!empty($user)){
					//直接cookies登录
					import ( 'ORG.Util.RBAC' );
					//$_SESSION[C('USER_AUTH_KEY')]=$result[0]['member_id'];
					$_SESSION['email']	=$_COOKIE['email'];
					$_SESSION['password']	=MD5($_COOKIE['password']);
					$_SESSION['loginUserName']=$_POST['username'];
					$_SESSION['OnlineTF']="1";//用户在线状态
					$_SESSION['memberType']="普通用户";//用户在线状态
				}else{
					//正常登录代码：
					$model = D("Login");
					$vo = $model->create();
					if(false === $vo){
						$this->error($model->getError());
					}
					$email=$_POST['email'];
					$password=$_POST['password'];
					$where['email']=$email;
					$where['password']=md5($password);
					$result = $model->where($where)->select();
					if (!$result) {
						$this->error('登录账户和密码不符合！');
					}
					if ($result[0]['isLock']=="1") {
						$this->error('您的账户没有通过审核，请核对后重新登录或者等待审核！');
					}
					//保存会员登录信息
					$model->where($where)->save();
					if ($model) {
						if ($_POST['remember']=="1") {
							//检查用户是否愿意记住密码,保存登录cookies
							$_COOKIE['email']=$email;
							$_COOKIE['password']=$password;
						}
						$this->success('邀99大学生恋爱网欢迎登录成功！');
					}
				}				
			}
		}else{
			
		}
	}
	public function getUserInfo($email,$password){
		$member=M('Member');
		$where['email']=$email;
		$where['password']=md5($password);
		$result=$member->where($where)->select();
		return $result;
	}
	/* public function formType($form_type){
		if ($form_type=="email") {
			$result="";
		}elseif ($form_type=="mobile"){
			
		} 
		$result=$member->where($where)->select();
		return $result;
	} */
	public function loginOut() {
		setcookie("$this->loginMarked", NULL, -3600, "/");
		unset($_SESSION["$this->loginMarked"], $_COOKIE["$this->loginMarked"]);
		if (isset($_SESSION[C('USER_AUTH_KEY')])) {
			unset($_SESSION[C('USER_AUTH_KEY')]);
			unset($_SESSION);
			session_destroy();
		}
		$this->redirect("Index/index");
	}
}