<?php
/*
 * name:支付管理
 * aothor:caoding 
 */
class PaymentAction extends CommonAction {
	//显示增加支付记录
	public function addRecord(){
		$this->display();
		
	}
	//在线支付
	public function setPayLine(){
		$this->display();
		
	}
	//点数购买设置
	public function setPoint(){
		$this->display();
	}	
	//充值卡管理
	public function cardManager(){
		$this->display();
		
	}
	//增加支付方式
	public function add(){
		$this->display();
		
	}
	//支付记录列表
	public function payRecord(){
		$this->display();
		
	}
	//积分换点数设置
	public function Integral(){
		$this->display();
		
	}
	//有效期管理设置
	public function PointChange(){
		$this->display();
		
	}
	
}