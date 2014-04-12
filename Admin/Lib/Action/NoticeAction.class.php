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
	public function edit(){
		//编辑页面
		$M = M("Notice");
		$where['notice_id']=$_GET['id'];
		$list=$M->where($where)->select();
		$this->assign("vo", $list);
		$this->display("add");
	}
}