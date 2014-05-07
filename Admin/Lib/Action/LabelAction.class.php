<?php
/*
 * 标签操作
 */
class LabelAction extends CommonAction{
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
	public function checkPass(){
		//置顶
		$model=M("Label");
		switch ($_GET['p']) {
			case 1:
				$data['status'] = '2';
				break;
			case 2:
				$data['status'] = '1';
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