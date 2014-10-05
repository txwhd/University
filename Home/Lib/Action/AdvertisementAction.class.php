<?php
/*
 * 广告管理
 *   */
class AdvertisementAction extends  CommonAction{
	
	public function topAd(){
		//顶部管理
		$ad=M('advertisement');
		$where['ad_type']=1;
		$rt=$ad->where($where)->limit(1)->select();
		$this->assign('ad1',$rt);
		/* dump($rt);
		exit(); */
	}
	public function midAd(){
		//中部管理
		$ad=M('advertisement');
		$where['ad_type']=2;
		$rt=$ad->where($where)->limit(1)->select();
		$this->assign('ad2',$rt);
	}
	
	public function floatAd(){
		//浮动广告
		$ad=M('advertisement');
		$where['ad_type']=3;
		$rt=$ad->where($where)->limit(1)->select();
		$this->assign('ad3',$rt);
	}
	
	
}