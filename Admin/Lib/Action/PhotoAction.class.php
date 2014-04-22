<?php
// 相册管理
class PhotoAction extends CommonAction {
	public function _before_index(){
		load('extend');//截取文章标题
	}
	public function photo_detail(){
		if (IS_POST) {
			//$this->checkToken();
			echo json_encode(D("Photo")->photo_detail());
		} else {
		$id=$_GET['id'];
		$m=M('photo_detail');
		$list=$m->where('photo_id='.$id)->select();
		$count=count($list);
		$i=0;
		$j=0;
		foreach ($list as $k => $v){
			if($k%6!==0||$k==0){
				$data[$j][$i++]['list']=$list[$k];
			}else {
				$j++;
				$i=0;
				$data[$j][$i++]['list']=$list[$k];
			}
		}
	   /*  dump($data);
		exit();   */
		$this->assign('list',$data);
		$this->display();
		}
	}
	//列出图片可用分类
	public function _before_add() {
		$model	=	M("Category");
		$list	=	$model->where('status=1 AND module="Photo" AND pid!=0')->select();
		$this->assign('list',$list);
	}
	//列出图片可用分类
	public function _before_edit() {
		$model	=	M("Category");
		$list	=	$model->where('status=1 AND module="Photo" AND pid!=0')->select();
		$this->assign('list',$list);
	}
	//添加图片
	public function _before_insert() {
		if(!empty($_FILES['img']['name'])){
			import("ORG.Net.UploadFile");
			$upload = new UploadFile();
			$upload->maxSize  = 3145728 ; 
			$upload->allowExts  = array('jpg', 'gif', 'png', 'jpeg'); 
			$upload->savePath =  './Public/Upload/photo/';
			$upload->saveRule = 'uniqid';
			$upload->thumb = true;
			$upload->thumbMaxWidth = 150;
			$upload->thumbMaxHeight = 120;
			$upload->uploadReplace = true;
			$upload->thumbPrefix = 'thumb_';
			if(!$upload->upload()) { 
				$this->error($upload->getErrorMsg());
			}else{
				$imgs = $upload->getUploadFileInfo(); echo 'a';
				$_POST['img'] = $imgs[0]['savename'];
				echo 
				'<script type="text/javascript">
				var response = {
					"statusCode":"1",
					"message":"\u64cd\u4f5c\u6210\u529f",
					"navTabId":"Photo",
					"forwardUrl":"",
					"callbackType":"closeCurrent"
				};
				if(window.parent.donecallback) {
					 window.parent.donecallback(response);
				}
			   </script>';
			}
		}
	}
	//删除图片
	public function _before_foreverdelete() {
		if($_GET['id']){
			$id = $_GET['id'];			
			$src = './Public/Upload/photo/'.D('Photo')->where('id='.$id)->getField('img');
			if(is_file($src)) unlink($src);
			$src = './Public/Upload/photo/thumb_'.D('Photo')->where('id='.$id)->getField('img');
			if(is_file($src)) unlink($src);
		}
	}	
}