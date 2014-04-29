<?php
/*
 * 二维码管理
 */
class CodeAction extends CommonAction {
	public function top(){
		//置顶操作
		$where['gift_id']=$_GET['id'];
		$model=M("gift");
		$data['istop'] = '2';
		$result=$model->where($where)->save($data);
		if($result){
			$this->success('置顶成功！');
		}else{
			$this->error("置顶失败！");
		}
	}
	public function cancelTop(){
		//取消置顶操作
		$where['gift_id']=$_GET['id'];
		$model=M("gift");
		$data['istop'] = '1';
		$result=$model->where($where)->save($data);
		if($result){
			$this->success('取消置顶成功！');
		}else{
			$this->error("取消置顶失败！");
		}
	}
	
	
}