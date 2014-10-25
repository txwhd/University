<?php
/*
 * 站长推荐
 */

class RecommendAction extends  CommonAction{
	public function index(){
		$nationwhere['islock']="2";
		$nationfield=array('username,r.member_id,nationName,schoolName,age,height,cPoint,headphoto,OnlineTF,loginCount');
		$member_rand = M()->table("mxczhyk_member r")->join("mxczhyk_member_detail s on r.member_id=s.member_id")->where($nationwhere)->field($nationfield)->order('rand(),look_grade asc')->limit(20)->select();
		$count =  M()->table("mxczhyk_member r")->join("mxczhyk_member_detail s on r.member_id=s.member_id")->where($nationwhere)->count();
		$page = new Page($count, 20);
		$showPage = $page->show();
		$this->assign("page", $showPage);
		$this->assign('Recommend',$member_rand);
		$this->display();
	}
}