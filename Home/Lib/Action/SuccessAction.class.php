<?php
/*
 * 牵手恋人
 */
class SuccessAction extends CommonAction{
	public function index(){
		$model=M('success_object');
		$list=$model->select();
		$this->assign('list',$list);
		$this->display();
	}
}