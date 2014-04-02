<?php
class CommonModel extends Model {

	public function listNews($firstRow = 0, $listRows = 20) {
		$name=$this->getModelName();
		$M = M($name);
		$list = $M->limit("$firstRow , $listRows")->select();
		/* $statusArr = array("审核状态", "已发布状态");
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
		} */
		return $list;
	}
	
	public function category() {
		$name=$this->getModelName();
		$M = M($name.'_class');
		if (IS_POST) {
			$act = $_POST[act];
			$data = $_POST['data'];
			$data['name'] = addslashes($data['name']);
			if ($act == "add") { //添加分类
				unset($data[cid]);
				if ($M->where($data)->count() == 0) {
					return ($M->add($data)) ? array('status' => 1, 'info' => '分类 ' . $data['name'] . ' 已经成功添加到系统中', 'url' => U($name.'/category', array('time' => time()))) : array('status' => 0, 'info' => '分类 ' . $data['name'] . ' 添加失败');
				} else {
					return array('status' => 0, 'info' => '系统中已经存在分类' . $data['name']);
				}
			} else if ($act == "edit") { //修改分类
				if (empty($data['name'])) {
					unset($data['name']);
				}
				if ($data['pid'] == $data['cid']) {
					unset($data['pid']);
				}
				return ($M->save($data)) ? array('status' => 1, 'info' => '分类 ' . $data['name'] . ' 已经成功更新', 'url' => U($name.'/category', array('time' => time()))) : array('status' => 0, 'info' => '分类 ' . $data['name'] . ' 更新失败');
			} else if ($act == "del") { //删除分类
				unset($data['pid'], $data['name']);
				return ($M->where($data)->delete()) ? array('status' => 1, 'info' => '分类 ' . $data['name'] . ' 已经成功删除', 'url' => U($name.'/category', array('time' => time()))) : array('status' => 0, 'info' => '分类 ' . $data['name'] . ' 删除失败');
			}
		} else {
		 	$result=$M->select();
			return $result; 
/* 		    import("Category");
			$cat = new Category('Category', array('cid', 'pid', 'name', 'fullname'));
			return $cat->getList();             //获取分类结构
 */		}
	}
	
	public function addNews() {
		$name=$this->getModelName();
		$M = M($name);
		if (false === $M->create ()) {
			$this->error ( $M->getError () );
		}
		$M->create ();
		//保存当前数据对象
		
		/* $data = $_POST['info'];
		$data['published'] = time();
		$data['aid'] = $_SESSION['my_info']['aid'];
		if (empty($data['summary'])) {
			$data['summary'] = cutStr($data['content'], 200);
		} */
		$list=$M->add ();
		if ($list) {
			return array('status' => 1, 'info' => "已经发布", 'url' => U($name.'/index'));
		} else {
			return array('status' => 0, 'info' => "发布失败，请刷新页面尝试操作");
		}
	}
	
	public function edit() {
		$name=$this->getModelName();
		$M = M($name);
		if (false === $M->create ()) {
			$this->error ( $M->getError () );
		}
		$data=$M->create ();
		$list=$M->save();
		/* $M = M("News");
		$data = $_POST['info'];
		$data['update_time'] = time(); */
		
		if ($list) {
			return array('status' => 1, 'info' => "已经更新", 'url' => U($name.'/index'));
		} else {
			return array('status' => 0, 'info' => "更新失败，请刷新页面尝试操作");
		}
	}
	
}