<?php
/*
 *民族恋情操作 
 *
 */
class NationAction extends CommonAction{
	public function index(){
		$where['if_shaoNation']="2";
		$model=M('Member_detail');
		$list=$model->where($where)->order('nationName')->select();
		$this->assign("list",$list);
		$this->display();
	}
}
