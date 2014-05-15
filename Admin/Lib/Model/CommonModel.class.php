<?php
class CommonModel extends Model {

	public function listNews($firstRow = 0, $listRows = 20,$where) {
		$name=$this->getModelName();
		$M = M($name);
		$list = $M->where($where)->limit("$firstRow , $listRows")->select();
		return $list;
	}
	public function category() {
		$name=$this->getModelName();
		$M = M($name.'_class');
		if (IS_POST) {
			$act = $_POST[act];
			$data = $_POST['data'];
			//$data['name'] = addslashes($data['name']);
			if ($act == "add") { //添加分类
				unset($data[cid]);
				if ($M->where($data)->count() == 0) {
					return ($M->add($data)) ? array('status' => 1, 'info' => '分类 ' . $data['type_name'] . ' 已经成功添加到系统中', 'url' => U($name.'/category', array('time' => time()))) : array('status' => 0, 'info' => '分类 ' . $data['type_name'] . ' 添加失败');
				} else {
					return array('status' => 0, 'info' => '系统中已经存在分类' . $data['type_name']);
				}
			} else if ($act == "edit") { //修改分类
				if (empty($data['type_name'])) {
					unset($data['type_name']);
				}
				if ($data['pid'] == $data['cid']) {
					unset($data['pid']);
				}
				return ($M->save($data)) ? array('status' => 1, 'info' => '分类 ' . $data['type_name'] . ' 已经成功更新', 'url' => U($name.'/category', array('time' => time()))) : array('status' => 0, 'info' => '分类 ' . $data['type_name'] . ' 更新失败');
			} else if ($act == "del") { //删除分类
				unset($data['pid'], $data['type_name']);
				return ($M->where($data)->delete()) ? array('status' => 1, 'info' => '分类 ' . $data['type_name'] . ' 已经成功删除', 'url' => U($name.'/category', array('time' => time()))) : array('status' => 0, 'info' => '分类 ' . $data['type_name'] . ' 删除失败');
			}
		} else {
			/*分类显示未成功 $result=$M->where('pid=0')->select();
			foreach ($result as $key=>$val){
				
				$result[$key]
			} */
		 	$result=$M->select();
			return $result; 
/* 		    import("Category");
			$cat = new Category('Category', array('cid', 'pid', 'name', 'fullname'));
			return $cat->getList();             //获取分类结构
 */		}
	}
	public function upload(){
		$names=$this->getModelName();
		$M = M($names);
		import('ORG.Net.UploadFile');
		$upload = new UploadFile();// 实例化上传类
		$upload->maxSize = 32922000;//设置上传文件大小
		$upload->allowExts  = array('pdf','txt', 'doc', 'xls','rar','zip','ppt','docx','xlsx','pptx','jpg', 'gif', 'png', 'jpeg','bmp','tiff','svg');// 设置附件上传类型
		$upload->saveRule= time();  //上传文件的文件名保存规则(以时间戳为文件名)
		//$upload_time = date('Y-m-d');
		$savePath='./Public/Uploads/'.$names.'/';// 设置附件上传目录
		$upload->savePath =$savePath;
		$upload->uploadReplace = true;//存在同名文件是否是覆盖
		$result1=$upload->upload();//保存上传文件，获取上传信息
		if($result1){
			$uploadList=$upload->getUploadFileInfo();//获取上传文件成功后的结果
			//修改上传文件信息
			//$data['upload_name']=$_POST['upload_name'];//附件名称
			//$data['attachment_customname']=$uploadList[0]['savename'];//附件系统名称
			$data['upload']=$savePath.'/'.$uploadList[0]['savename'];//附件名称
		}
		return $data;
	}
	/* public function foreverdel(){
		$filename=
		unlink($filename);
	} */
	public function addNews($data) {
		$name=$this->getModelName();
		$M = M($name);
		if (false === $M->create ()) {
			$this->error ( $M->getError () );
		}
		$M->create ();
		//保存当前数据对象
		if($data!==NULL){
			$M->upload=$data['upload'];
			$list=$M->add ();
		}else{
			$list=$M->add ();
		}
		if ($list) {
			return array('status' => 1, 'info' => "已经发布", 'url' => U($name.'/index'));
		} else {
			return array('status' => 0, 'info' => "发布失败，请刷新页面尝试操作");
		}
	}
	
	public function edit($data) {
		$name=$this->getModelName();
		$M = M($name);
		if (false === $M->create ()) {
			$this->error ( $M->getError () );
		}
		$data=$M->create ();
		if($data!==NULL){
			$M->upload=$data['upload'];
			$list=$M->save($data);
		}else{
			$list=$M->save($data);
		}
		
		if ($list) {
			return array('status' => 1, 'info' => "已经更新", 'url' => U($name.'/index'));
		} else {
			return array('status' => 0, 'info' => "更新失败，请刷新页面尝试操作");
		}
	}
	
}