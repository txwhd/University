<?php

class MemberAction extends CommonAction {

    public function index() {
      	 $M = M('Member');//这里用关联
        $tabs = $M->select();
      //计算今天注册人数
        $today=$tabs[0]['reg_time'];
        
        $this->assign("list", $tabs);
        $this->assign("count", count($tabs));
        $this->display();
    }


}