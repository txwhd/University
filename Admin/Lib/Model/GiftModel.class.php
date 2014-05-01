<?php
/*
 * 礼品管理
 */
class GiftModel extends CommonModel {
	public function listNews($firstRow = 0, $listRows = 20) {
		$list = M()->table("mxczhyk_gift r")->join("mxczhyk_gift_type s on r.gift_type_id=s.gift_type_id")->select();
		return $list;
	}
}