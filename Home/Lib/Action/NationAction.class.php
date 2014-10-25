<?php
/*
 *民族恋情操作 
 *
 */
class NationAction extends CommonAction{
	public function index(){
		$nationwhere['islock']="2";
		$nationwhere['nationName']!="汉族";
		$nationfield=array('username,r.member_id,nationName,schoolName,age,height,cPoint,headphoto,OnlineTF,loginCount');
		$nation = M()->table("mxczhyk_member r")->join("mxczhyk_member_detail s on r.member_id=s.member_id")->where($nationwhere)->field($nationfield)->order('OnlineTF DESC,nationName,cPoint DESC')->limit(20)->select();
		$count =  M()->table("mxczhyk_member r")->join("mxczhyk_member_detail s on r.member_id=s.member_id")->where($nationwhere)->count();
		$page = new Page($count, 20);
		$showPage = $page->show();
		$this->assign("page", $showPage);
		$this->assign('nation',$nation);
		$this->display();
	}
}
