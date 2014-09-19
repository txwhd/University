<?php
class MemberAction extends  CommonAction{
	public function index(){
		$this->display();
	}
	public function _before_detail(){
		//查看会员的全部信息
    	$M = D('Member');
    	$where['member_id']=(int)$_GET['id'];
    	$list   =  $M->relation(true)->where($where)->select();
    	/* dump($list);
    	exit(); */
    	$this->assign('info',$list);
	}
	//约会
	public function appointment(){
		$M = D('Member');
		$where['member_id']=(int)$_GET['id'];
		$list   =  $M->relation(true)->where($where)->field('member_id,headphoto,username,sightml,monologue')->select();
		$this->assign('appointment',$list);
		$this->display();
	}
	public function dateDeal(){
		//约会安排(逻辑有问题)
		$arra=M('arra');
		if (empty($_POST['id'])) {
			$this->error('约会安排必须填写啊，请重新填写吧！');
		}
		$data['from_name']=(int)$_POST['id'];
		$data['arra']=$_POST['arra'];
		$data['create_time']=time();
		$result=$arra->add($data);
		if ($result) {
			$this->success('约会申请已经发出，请耐心等待！');
		}else{
			$this->error('约会申请出现错误，请重新发送！');
		}
		
	}
	public function appointAsk(){
		//约会其他要求
	}
}