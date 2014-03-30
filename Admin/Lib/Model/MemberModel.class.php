<?php
/*
 * name：会员管理
 * aothor：马晓成857773627@qq.com
 */
class MemberModel extends Model {
	
		public function listNews($firstRow = 0, $listRows = 20) {
		        $M = M("Member");
		        $list = $M->limit("$firstRow , $listRows")->select();
		        return $list;
		  }


}