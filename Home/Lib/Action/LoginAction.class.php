<?php
/*
 * 登陆
 */
class LoginAction extends CommonAction{
	public function checkLogin(){
		if ($_POST['username'] == 'admin'){
			$this->ajaxReturn($_POST['username'],'用户名正确~',1);
		}else{
			$this->ajaxReturn('','用户名错误！',0);
		}
	}
}