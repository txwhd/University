<?php
/*
 * name:
 * aothor:caoding 
 */
class AdvertisementAction extends CommonAction {
	public function index() {
		//首页
		$M = M("Advertisement");
		$count = $M->count();
		import("ORG.Util.Page");       //载入分页类
		$page = new Page($count, 10);
		$showPage = $page->show();
		$this->assign("page", $showPage);
		$this->assign("list", D("Advertisement")->listNews($page->firstRow, $page->listRows));
		$this->display();
	}

	
	public function add() {
		//增加
		if (IS_POST) {
			$this->checkToken();
			echo json_encode(D("Advertisement")->addArticle());
		} else {
			$this->assign("list", D("Advertisement")->category());
			$this->display();
		}
	}
	

	
	public function edit() {
		//编辑
		$M = M("Advertisement");
		if (IS_POST) {
			$this->checkToken();
			echo json_encode(D("Advertisement")->edit());
		} else {
			$info = $M->where("id=" . (int) $_GET['id'])->find();
			if ($info['id'] == '') {
				$this->error("不存在该记录");
			}
			$this->assign("info", $info);
			$this->assign("list", D("Advertisement")->category());
			$this->display("add");
		}
	}
	
	public function del() {
		//删除
		if (M("Advertisement")->where("id=" . (int) $_GET['id'])->delete()) {
			$this->success("成功删除");
			//            echo json_encode(array("status"=>1,"info"=>""));
		} else {
			$this->error("删除失败，可能是不存在该ID的记录");
		}
	}
	
	
}