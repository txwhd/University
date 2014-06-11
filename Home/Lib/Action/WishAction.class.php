<?php
/**
 +----------------------------------------------------------
 *许愿操作
 *aothor:857773627@qq.com xiaocheng
 +----------------------------------------------------------
 */
class WishAction extends CommonAction{
	public function index(){
		$this->display();
	}
	public function add(){
		 	$model=D('Wish');
		 	if (!$model->create()){
		 		// 如果创建失败 表示验证没有通过 输出错误提示信息
		 		$this->error($model->getError());
		 	}else{
		 		// 验证通过 可以进行其他数据操作
		 		$result = $model->add(); //add方法会返回新添加的记录的主键值
		 		if ($result) {
		 			$this->success('许愿成功！');
		 		}else {
		 			$this->error('不要灰心啊，添加出现点问题，重新操作啊！');
		 		}
		 	}
		
	}
	
	
}