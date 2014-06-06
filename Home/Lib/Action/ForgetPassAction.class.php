<?php
class  ForgetPassAction extends Action{
	public function findPwd() {
		$M = M("Admin");
		if (IS_POST) {
			$this->checkToken();
			echo json_encode(D("Public")->findPwd());
		} else {
			setcookie("$this->loginMarked", NULL, -3600, "/");
			unset($_SESSION["$this->loginMarked"], $_COOKIE["$this->loginMarked"]);
			$cookie = $this->_get('code');
			$shell = substr($cookie, -32);
			$aid = (int) str_replace($shell, '', $cookie);
			$info = $M->where("`aid`='$aid'")->find();
			if ($info['status'] == 2) {
				$this->error("你的账号被禁用，有疑问联系管理员吧", __APP__);
			}
			if (md5($info['find_code']) == $shell) {
				$this->assign("info", $info);
				$_SESSION['aid'] = $aid;
				$systemConfig = include WEB_ROOT . 'Common/systemConfig.php';
				$this->assign("site", $systemConfig);
				$this->display("Common:findPwd");
			} else {
				$this->error("验证地址不存在或已失效", __APP__);
			}
		}
	}
	public function password($data=0){
		//点击修改密码的链接之后情况
		$data=$_GET['md5email'];
		$model = M("Member");
		$result=$model->where(array('md5email'=>$data))->select();
		if ($result) {
			$this->assign('result',$result[0]['member_id']);
			$this->display();
		}else {
			$this->error('链接有误！');
		}
	}
	public function Foget(){
		$this->assign('shenfen',$_GET['id']);
		$this->display();
	}
	public function findPass(){
		//找回企业学生密码
		$m=M('Member');
		$where['email']=$_POST['email'];
		$result=$m->where($where)->find();
		/* echo $shenfen=$_POST['shenfen'];
		exit();
		if($shenfen="1"){
			//学生
			$where['role_id']="3";
			$result=$m->where($where)->find();
		}elseif ($shenfen ="2"){
			//企业
			$where['role_id']="4";
			$result=$m->where($where)->find();
		}else{
			//教师
			$where['role_id']="2";
			$result=$m->where($where)->find();
		}
		 */
		if($result){
			$md5email=$this->emailmd5($result['email']+time());
			$data['md5email']=$md5email;
			 $data['expired']=time()+86400;
			$list=$m->where(array('email'=>$_POST['email']))->save($data);
			$this->think_send_mail($result['member_id']);
		}else{
			$this->error('邮箱不存在！请注册后重新登录！');
		}
	}
	
	function think_send_mail($data){
		$model = D("Member");
		$result = $model->where(array("member_id"=>$data))->find();
		$config = C('THINK_EMAIL');
		//vendor('PHPMailer.class#phpmailer'); //从PHPMailer目录导class.phpmailer.php类文件
		$mail             = new PHPMailer(); //PHPMailer对象
		$mail->CharSet    = 'UTF-8'; //设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置，否则乱码
		$mail->IsSMTP();  // 设定使用SMTP服务
		$mail->SMTPDebug  = 1;                     // 关闭SMTP调试功能
		$mail->SMTPAuth   = true;                  // 启用 SMTP 验证功能
		$mail->SMTPSecure = 'ssl';                 // 使用安全协议
		$mail->Host       = $config['SMTP_HOST'];  // SMTP 服务器
		$mail->Port       = $config['SMTP_PORT'];  // SMTP服务器的端口号
		$mail->Username   = $config['SMTP_USER'];  // SMTP服务器用户名
		$mail->Password   = $config['SMTP_PASS'];  // SMTP服务器密码
		$mail->SetFrom($config['FROM_EMAIL'], $config['FROM_NAME']);
		$replyEmail       = $config['REPLY_EMAIL']?$config['REPLY_EMAIL']:$config['FROM_EMAIL'];
		$replyName        = $config['REPLY_NAME']?$config['REPLY_NAME']:$config['FROM_NAME'];
		$mail->AddReplyTo($replyEmail, $replyName);
		$mail->Subject    = "研究生管理中心";
		$mail->Body = "<a href='http://grs.nuc.edu.cn/yjob/index.php/Home/ForgetPass/password?md5email=".$result['md5email']."'>"."点击找回密码</a>";//邮件内容
		//$mail->Body = "<a href='http://localhost/yjob/index.php/Home/ForgetPass/password?md5email=".$result['md5email']."'>"."点击找回密码</a>";//邮件内容
		//$mail->MsgHTML($body);
		$mail->AddAddress($_POST['email']);
		if(!$mail->Send()) {
			echo "发送失败: " . $mail->ErrorInfo;
			$this->error('发送失败，请重新操作！',U('Home/Index/index'));
		} else {
			$this->success('找回密码信息已经成功发送，请及时查收！',U('Home/Index/index'));
		}
	}
	//md5()
	private function emailmd5($email){
		return md5($email);
	}
	public function editPass(){
		//修改密码
		$m=M('Member');
		//print_r($_POST);
		$where['member_id']=$_POST['member_id'];
		$pass=trim($_POST['password']);
		$repass=trim($_POST['repassword']);
		if ($pass!=$repass) {
			$this->error('前后两次输入密码不一样！');
		}
		$data['password']=md5($pass);
		$re=$m->where($where)->save($data);
		if ($re) {
			$this->success('密码找回成功！请返回前台登陆',U('Home/Index/index'));
		}else {
			$this->error('密码找回失败，请重新找回！');
		}
	}
}
