<?php
// 文章模型
class ArticleModel extends CommonModel {
	public function listNews($firstRow = 0, $listRows = 20) {
		$list =  M()->table("mxczhyk_article r")->join("mxczhyk_article_class s on s.cid=r.cid")->select();
		return $list;
	}
}