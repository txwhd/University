<?php
/*
 * name:
 * aothor:caoding 
 */
class AdvertisementAction extends CommonAction {
	/* public function _before_add() {
		//调用upload方法
	}
	

	
	public function _before_edit() {
		//编辑调用upload方法
	}
	
	public function _before_del() {
		//删除,调用永久删除的方法
	
	} */
	public function forbidden(){
		//禁止会员状态
		$where['advertisement_id']=$_GET['id'];
		$model=M("Advertisement");
		$data['available'] = 2;
		$result=$model->where($where)->save($data);
		if($result){
			$this->success('已经禁用该广告！');
		}else{
			$this->error("禁用失败！");
		}
	}
	public function checkPass(){
		//通过会员审核
		$where['advertisement_id']=$_GET['id'];
		$model=M("Advertisement");
		$data['available'] = 1;
		$result=$model->where($where)->save($data);
		if($result){
			$this->success('已经开启该广告！');
		}else{
			$this->error("开启失败！");
		}
	}
	
	
}