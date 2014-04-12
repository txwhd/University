<?php
// 文章模块
class ArticleAction extends CommonAction {
	
	public function _before_index(){
		load('extend');//截取文章标题
	}
}