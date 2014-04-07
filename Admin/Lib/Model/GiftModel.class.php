<?php
/*
 * 礼品管理
 */
class GiftModel extends Model {
	public function listNews($firstRow = 0, $listRows = 20) {
		$M = M("Gift");
		$list = $M->limit("$firstRow , $listRows")->select();
		return $list;
	}
}