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
	}
	public function index(){
		//检查用户是否登录
		$username=$_POST['username'];
		$this->loginMarked = md5($username);
		$this->checkLogin();
		
		if(empty($_SESSION['user_info'])){ //检查一下session是不是为空
			if(empty($_COOKIE['username']) || empty($_COOKIE['password'])){ 
				//如果session为空，并且用户没有选择记录登录状
				header("location:login.php?req_url=".$_SERVER['REQUEST_URI']); //转到登录页面，记录请求的url，登录后跳转过去，用户体验好。
			}else{ 
				//用户选择了记住登录状态
				$user = getUserInfo($_COOKIE['username'],$_COOKIE['password']); //去取用户的个人资料
				if(empty($user)){ 
					//用户名密码不对没到取到信息，转到登录页面
					header("location:login.php?req_url=".$_SERVER['REQUEST_URI']);
				}else{
					$_SESSION['user_info'] = $user; //用户名和密码对了，把用户的个人资料放到session里面
				}
			}
			}
		/* if ($_POST['username'] == 'admin'){
			$this->ajaxReturn($_POST['username'],'用户名正确~',1);
		}else{
			$this->ajaxReturn('','用户名错误！',0);
		} */
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