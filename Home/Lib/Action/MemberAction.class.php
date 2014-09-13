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
		$this->display();
	}
}