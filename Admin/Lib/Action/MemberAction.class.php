<?php
/*
 * 模块用处：会员管理
 * aothor：马晓成
 */
class MemberAction extends CommonAction {

  /*   public function index() {
      	 $M = M('Member');//这里用关联
        $count = $M->count();
        import("ORG.Util.Page");       //载入分页类
        $page = new Page($count, 20);
      //计算今天注册人数
        $today_start = strtotime(date( 'Y-m-d')); //返回今天凌晨00:00的时间戳(将年月日转换为时间戳)
        $today_end = $today_start + ( 24*60*60 ); //加上24小时，得出今晚00:00的时间戳
        $where['reg_time']  = array('between','$today_start,$today_end');
        $countToday=$M->where($where)->select();
        $this->assign("list", D("Member")->listNews($page->firstRow, $page->listRows));//分配列出具体值
        $this->assign("count",$count);//合计总会员数
        $this->assign("newCount", count($countToday));//当日合计总会员数
        $this->display();
    } */
}