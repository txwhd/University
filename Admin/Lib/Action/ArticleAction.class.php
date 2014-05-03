<?php
// 文章模块
class ArticleAction extends CommonAction {
	public function discuss(){
		//评论列表 关联
		load('extend');//截取文章标题
		$m=M('Article_discuss');
		$list=$m->select();
		$this->assign('list',$list);
		$this->display();
	}
	
}