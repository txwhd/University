<?php
/*
 * 投票功能
 */
class VoteAction extends CommonAction{
	/**
	 +----------------------------------------------------------
	 * 查看详细的投票选项
	 +----------------------------------------------------------
	 */
	public function show(){
		$model=M('Vote_option');
		$where['vote_id']=$_GET['id'];
		$list=$model->where($where)->select();
		$this->assign("list", $list);
		$this->display(); 
	}
	/**
	 +----------------------------------------------------------
	 * 删除投票选项
	 +----------------------------------------------------------
	 */
	public function delOption(){
		$model=M('Vote_option');
		$where['option_id']=$_GET['id'];
		$list=$model->where($where)->delete();
		if ($list) {
			$this->success('删除成功！');
		}else{
			$this->error('删除失败！');
		}
	}
	public function editOption(){
		if($_POST['formType']=="1"){
			//处理编辑投票选项
			$model=M('Vote_option');
			$data=$model->create();
			$where['optopn_id']=$_POST['option_id'];
			$result=$model->save($data);
			if($result){
				$this->success('修改成功！',U('Vote/editOption/',array('id'=>$_POST['option_id'])));
			}else{
				$this->error('修改失败！',U('Vote/editOption/',array('id'=>$_POST['option_id'])));
			}
			}
			else {
			//显示编辑投票选项
			$model=M('Vote_option');
			$where['option_id']=$_GET['id'];
			$list=$model->where($where)->select();
			$this->assign("info", $list);
			$this->display();
		    }
	 }
	public function addOption(){
		if ($_POST['formType']=="1") {
			$model=M('Vote_option');
			$data=$model->create();
			$where['vote_id']=$_POST['vote_id'];
			$result=$model->add($data);
			if($result){
				$this->success('增加成功！',U('Vote/show/',array('id'=>$_POST['vote_id'])));
			}else{
				$this->error('增加失败！',U('Vote/show/',array('id'=>$_POST['vote_id'])));
			}
		}elseif ($_GET['type']=="1"){
			$this->assign('list',$_GET['id']);
			$this->display();
		}
	}
}