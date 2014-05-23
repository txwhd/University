<?php
/*
 * 投票功能
 */
class VoteAction extends CommonAction{
	public function show(){
		 //查看详细的投票选项
		$model=M('Vote_option');
		$where['vote_id']=$_GET['id'];
		$list=$model->where($where)->select();
		$this->assign("list", $list);
		$this->display(); 
		
	}
	public function editOption(){
		//查看详细的投票选项
		$model=M('Vote_option');
		$where['option_id']=$_GET['id'];
		$list=$model->where($where)->select();
		$this->assign("info", $list);
		$this->display(); 
		
		
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