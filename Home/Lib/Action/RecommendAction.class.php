<?php
/*
 * 站长推荐
 */

class RecommendAction extends  CommonAction{
	public function index(){
		$where['isLock']="1";
		$member_rand = D('member')->where($where)->order('rand(),look_grade asc')->limit(28)->select();
		$this->assign('list',$member_rand);
		$this->display();
	}
}