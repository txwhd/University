<?php
/*
 * 同城恋情
 */
class CityAction extends CommonAction{
	public function index(){
		$citywhere['islock']="2";
		$field=array('username,r.member_id,nationName,schoolName,age,height,cPoint,headphoto,OnlineTF,loginCount');
		$city = M()->table("mxczhyk_member r")->join("mxczhyk_member_detail s on r.member_id=s.member_id")->where($citywhere)->field($field)->order('OnlineTF DESC,loginCount DESC,cPoint DESC')->limit(20)->select();
		$count =   M()->table("mxczhyk_member r")->join("mxczhyk_member_detail s on r.member_id=s.member_id")->where($citywhere)->count();
		$page = new Page($count, 20);
		$showPage = $page->show();
		$this->assign("page", $showPage);
		$this->assign('city',$city);
		$this->display();
	}
}