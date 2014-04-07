<?php
// 链接模型
class LinkModel extends Model {
	public function listNews($firstRow = 0, $listRows = 10) {
		$M = M("advertisement");
		$list = $M->limit("$firstRow , $listRows")->select();
		//$statusArr = array("审核状态", "已发布状态");
		//$aidArr = M("Admin")->field("`aid`,`email`,`nickname`")->select();
	/* 	foreach ($aidArr as $k => $v) {
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
		} */
		return $list;
	}
	public function addNews() {
		$M = M("News");
		$data = $_POST['info'];
		$data['published'] = time();
		$data['aid'] = $_SESSION['my_info']['aid'];
		if (empty($data['summary'])) {
			$data['summary'] = cutStr($data['content'], 200);
		}
		if ($M->add($data)) {
			return array('status' => 1, 'info' => "已经发布", 'url' => U('News/index'));
		} else {
			return array('status' => 0, 'info' => "发布失败，请刷新页面尝试操作");
		}
	}
	public function edit() {
		$M = M("News");
		$data = $_POST['info'];
		$data['update_time'] = time();
		if ($M->save($data)) {
			return array('status' => 1, 'info' => "已经更新", 'url' => U('News/index'));
		} else {
			return array('status' => 0, 'info' => "更新失败，请刷新页面尝试操作");
		}
	}
}