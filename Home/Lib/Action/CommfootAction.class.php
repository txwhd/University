<?php
/**
 +----------------------------------------------------------
 *公用的foot操作
 *aothor:857773627@qq.com xiaocheng
 +----------------------------------------------------------
 */
class CommfootAction extends Action{
	/**
	 +----------------------------------------------------------
	 * 公共menu
	 +----------------------------------------------------------
	 */
	public function menu(){
		//$model= 查到数据
		$menu1=$this->FindMenu('网站简介');
		$this->assign('menu1',$menu1);
		
		$menu2=$this->FindMenu('新手入门');
		$this->assign('menu2',$menu2);
		
		$menu3=$this->FindMenu('用户体验');
		$this->assign('menu3',$menu3);
		
		$menu4=$this->FindMenu('更多');
		$this->assign('menu4',$menu4);
	}
	public function FindMenu($data){
		$m=M('Article_class');
		$where['type_name']=$data;
		$result=$m->where($where)->select();
		$where1['cid']=$result[0]['cid'];
		$menu=M('Article')->where($where1)->select();
		return $menu;
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
