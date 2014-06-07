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
	
	*1.提交判断什么登陆类型
	*2.是否记住密码类型
	*3.验证用户
	*4.记录信息
	*/
	public function index(){
		//检查用户是否登录
		/* if ($_POST['remember']="1") {
			;
		}
		if ($_POST['form_type']="email") {
			;
		}elseif ($_POST['form_type']="mobile"){
			
		} */
		$email=$_POST['email'];
		$this->loginMarked = md5($email);
		$this->checkLogin();
		if ($result[0]['isLock']=="1") {
			$msn="您的账户没有通过审核，请核对后重新登录或者等待审核！";
			echo json_encode(array('status' => 1, 'info' => $str . $msn, 'url' => __APP__ . '?' . time()));
		}
		if(empty($_SESSION['user_info'])){ 
			//检查一下session是不是为空
			if(empty($_COOKIE['email']) || empty($_COOKIE['password'])){ 
			}else{ 
				//用户选择了记住登录状态
				$user =$this->getUserInfo($_COOKIE['email'],$_COOKIE['password']); //去取用户的个人资料
				if(empty($user)){ 
					//用户名密码不对没到取到信息，转到登录页面
					header("location:login.php?req_url=".$_SERVER['REQUEST_URI']);
				}else{
					$_SESSION['user_info'] = $user; //用户名和密码对了，把用户的个人资料放到session里面
				}
			}
			}
	}
	public function getUserInfo($email,$password){
		$member=M('Member');
		$where['email']=$email;
		$where['password']=md5($password);
		$result=$member->where($where)->select();
		return $result;
	}
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