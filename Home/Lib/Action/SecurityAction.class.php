<?php
/*
 * 权利保护********************right
 * 隐私声明********************privacy
 * 服务条款********************terms
 */
class SecurityAction extends CommonAction{
	public function terms(){
		$model=M('Webinfo');
		$list=$model->field('reg_agreement')->limit(1)->select();
		$this->assign('list',$list);
	}
}