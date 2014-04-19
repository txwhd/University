<?php
/*
 * name:会员发布心情
 * aothor:
 */
class MoodAction extends CommonAction {
	public function _before_index(){
		//管理member表
		$list = M()->table("mxczhyk_mood r")->join("mxczhyk_member s on r.member_id=s.member_id")->select();
		$this->assign('list',$list);
	}
	
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