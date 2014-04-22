<?php
// 图片模型
class PhotoModel extends CommonModel {
	public function photo_detail(){
		$m= M("photo_detail");
		$data = $_POST['data'];
		if ($m->where('id='.$data)->delete()) {
			return array('status' => 1, 'info' => "删除成功", 'url' => U("Photo/index"));
		} else {
			return array('status' => 0, 'info' => "删除失败，请重试");
		}
		}
		
}
