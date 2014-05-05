<?php
/*
 * 标签操作
 */
class LabelAction extends CommonAction{
	public function checkPass(){
		//通过审核
		$where['label_id']=$_GET['id'];
		$model=M("Activity");
		$data['status'] = '2';
		$result=$model->where($where)->save($data);
		if($result){
			$this->success('已经开启！');
		}else{
			$this->error("开启失败！");
		}
	}
	public function forbidden(){
		//禁止状态
		$where['label_id']=$_GET['id'];
		$model=M("Label");
		$data['status'] = '1';
		$result=$model->where($where)->save($data);
		if($result){
			$this->success('已经禁用！');
		}else{
			$this->error("禁用失败！");
		}
	}
	public function isTop(){
		//置顶
		$model=M("Label");
		switch ($_GET['p']) {
			case 1:
				$data['isTop'] = '2';
				break;
			case 2:
				$data['isTop'] = '1';
				break;
		}
		$where['label_id']=$_GET['id'];
		$result=$model->where($where)->save($data);
		if($result){
			$this->success('操作成功！');
		}else{
			$this->error("操作失败！");
		}
	}
}