<?php

class NoticeAction extends CommonAction {
	Public function show() {
	//在首页显示管理员站内公告列表
        $M = M("Notice");
        $where['notice_id']=$_GET['id'];
        $list=$M->where($where)->field('content')->find();
        $this->assign("vo", $list);
        $this->display();
	}
	public function IsLock(){
		//置顶
		$model=M("Notice");
		switch ($_GET['p']) {
			case 1:
				$data['IsLock'] = '2';
				break;
			case 2:
				$data['IsLock'] = '1';
				break;
		}
		$where['notice_id']=$_GET['id'];
		$result=$model->where($where)->save($data);
		if($result){
			$this->success('操作成功！');
		}else{
			$this->error("操作失败！");
		}
	}
}