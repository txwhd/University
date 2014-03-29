<?php
/*
 * name：会员管理
 * aothor：马晓成857773627@qq.com
 */
class MemberModel extends Model {
	
		public function listNews($firstRow = 0, $listRows = 20) {
		        $M = M("Member");
		        $list = $M->field("`id`,`title`,`status`,`published`,`cid`,`aid`")->order("`published` DESC")->limit("$firstRow , $listRows")->select();
		        $statusArr = array("审核状态", "已发布状态");
		        $aidArr = M("Admin")->field("`aid`,`email`,`nickname`")->select();
		        foreach ($aidArr as $k => $v) {
		            $aids[$v['aid']] = $v;
		        }
		        unset($aidArr);
		        $cidArr = M("Category")->field("`cid`,`name`")->select();
		        foreach ($cidArr as $k => $v) {
		            $cids[$v['cid']] = $v;
		        }
		        unset($cidArr);
		        foreach ($list as $k => $v) {
		            $list[$k]['aidName'] =$aids[$v['aid']]['nickname'] == '' ? $aids[$v['aid']]['email'] : $aids[$v['aid']]['nickname'];
		            $list[$k]['status'] = $statusArr[$v['status']];
		            $list[$k]['cidName'] = $cids[$v['cid']]['name'];
		        }
		        return $list;
		  }


}