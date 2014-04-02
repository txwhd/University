<?php

class NoticeAction extends CommonAction {

   /*  public function index() {
//            die(".............");
        $M = M("Notice");
//        die(".............");
        $count = $M->count();
        import("ORG.Util.Page");       //载入分页类
        $page = new Page($count, 20);
        $showPage = $page->show();
        $this->assign("page", $showPage);
        $this->assign("list", D("Notice")->listNews($page->firstRow, $page->listRows));
        $this->display();
    }
    
    public function category() {
        if (IS_POST) {
            echo json_encode(D("Notice")->category());
        } else {
            $this->assign("list", D("Notice")->category());
            $this->display();
        }
    }

    public function add() {
        if (IS_POST) {
            $this->checkToken();
            echo json_encode(D("Notice")->addNews());
        } else {
            $this->assign("list", D("Notice")->category());
            $this->display();
        }
    }

    public function checkNewsTitle() {
        $M = M("Notice");
        $where = "title='" . $this->_get('title') . "'";
        if (!empty($_GET['id'])) {
            $where.=" And id !=" . (int) $_GET['id'];
        }
        if ($M->where($where)->count() > 0) {
            echo json_encode(array("status" => 0, "info" => "已经存在，请修改标题"));
        } else {
            echo json_encode(array("status" => 1, "info" => "可以使用"));
        }
    }

    public function edit() {
        $M = M("Notice");
        if (IS_POST) {
            //$this->checkToken();
            echo json_encode(D("Notice")->edit());
        } else {
            $info = $M->where("id=" . (int) $_GET['id'])->find();
            if ($info['id'] == '') {
                $this->error("不存在该记录");
            }
            $this->assign("info", $info);
        //  $this->assign("list", D("Notice")->category());   公告不需要分类
            $this->display("add");
        }
    }

    public function del() {
        if (M("Notice")->where("id=" . (int) $_GET['id'])->delete()) {
            $this->success("成功删除");
            echo json_encode(array("status"=>1,"info"=>""));
        } else {
            $this->error("删除失败，可能是不存在该ID的记录");
        }
    }
 */
}