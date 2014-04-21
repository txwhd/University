<?php
/*
 * 礼品管理
 */
class GiftAction extends CommonAction {
	public function _before_index(){
		$M=M('GiftType');
		$result=$M->select();
		$this->assign('type',$result);
		$this->display();
	}
	public function forbidden(){
		//禁止会员状态
		$where['ad_id']=$_GET['id'];
		$model=M("gift");
		$data['available'] = '2';//数据库中没有静止字段
		$result=$model->where($where)->save($data);
		if($result){
			$this->success('已经禁用该广告！');
		}else{
			$this->error("禁用失败！");
		}
	}
	public function checkPass(){
		//通过会员审核
		$where['ad_id']=$_GET['id'];
		$model=M("Advertisement");
		$data['available'] = '1';
		$result=$model->where($where)->save($data);
		if($result){
			$this->success('已经开启该广告！');
		}else{
			$this->error("开启失败！");
		}
	}
	
	
	
}