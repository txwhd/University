<?php
/**
 +----------------------------------------------------------
 *公用的foot操作
 *aothor:857773627@qq.com xiaocheng
 +----------------------------------------------------------
 */
class CommfootAction extends CommonAction{
	/**
	 +----------------------------------------------------------
	 * 公共menu
	 +----------------------------------------------------------
	 */
	public function menu(){
		//$model= 查到数据
		$cid=$this->getclass('网站简介','Article');
		$this->assign('menu1',$menu1);
		
		$menu2=$this->getclass('新手入门','Article');
		$this->assign('menu2',$menu2);
		
		$menu3=$this->getclass('用户体验','Article');
		$this->assign('menu3',$menu3);
		
		$menu4=$this->getclass('更多','Article');
		$this->assign('menu4',$menu4);
	}
	/* public function right(){
		//$model= 根据文章id->内容
		
	} */
	/**
	 +----------------------------------------------------------
	 * 服务条款
	 +----------------------------------------------------------
	 */
	public function terms(){
	
	
	}
	/**
	 +----------------------------------------------------------
	 * 关于我们
	 +----------------------------------------------------------
	 */
	public function about(){
		$this->menu();
		//右边内容
		$id=$_GET['id'];
		$m=M('Article');
		$str=$m->getPk ();
		$where[$str]=$id;
		$result=$m->where($where)->select();
		$this->assign('article',$result);
		$this->display();
	
	}
	
	public function aboutmain(){
		$this->display();
	
	}
	/**
	 +----------------------------------------------------------
	 * 公益操作
	 +----------------------------------------------------------
	 */
	public function Nonprofit(){
		$this->display();
	
	}
	/**
	 +----------------------------------------------------------
	 * 权利保护
	 +----------------------------------------------------------
	 */
	public function right(){
		$this->display();
	
	}
	/**
	 +----------------------------------------------------------
	 * 隐私保护
	 +----------------------------------------------------------
	 */
	public function privacy(){
		$this->display();
	
	}
	/**
	 +----------------------------------------------------------
	 * 联系我们
	 +----------------------------------------------------------
	 */
	public function Contact(){
		$this->display();
	
	}
	
}
