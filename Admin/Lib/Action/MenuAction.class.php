<?php
/*
 * name:菜单管理
 * aothor:
 */
class MenuAction extends CommonAction {
	public function forbidden(){
		//禁止状态
		$where['mood_id']=$_GET['id'];
		$model=M("Mood");
		$data['status'] = '2';
		$result=$model->where($where)->save($data);
		if($result){
			$this->success('已经禁用心情记录！');
		}else{
			$this->error("禁用失败！");
		}
	}
	public function checkPass(){
		//通过会员审核
		$where['mood_id']=$_GET['id'];
		$model=M("Mood");
		$data['status'] = '1';
		$result=$model->where($where)->save($data);
		if($result){
			$this->success('已经开启心情记录！');
		}else{
			$this->error("开启失败！");
		}
	}
	
}