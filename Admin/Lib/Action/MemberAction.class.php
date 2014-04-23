<?php
/*
 * 模块用处：会员管理
 * aothor：马晓成
 */
class MemberAction extends CommonAction {
  public function _before_index() {
      	 $count = M()->table("mxczhyk_member r")->join("mxczhyk_member_detail s on r.member_id=s.member_id")->count();
        import("ORG.Util.Page");//载入分页类
        $page = new Page($count, 20);
        $showPage = $page->show();
      //计算今天注册人数
        $today_start = strtotime(date( 'Y-m-d')); //返回今天凌晨00:00的时间戳(将年月日转换为时间戳)
        $today_end = $today_start + ( 24*60*60 ); //加上24小时，得出今晚00:00的时间戳
        $where['reg_time']  = array('between','$today_start,$today_end');
        $countToday=M()->where($where)->select();
        $this->assign("page", $showPage);
        $this->assign("list",D('Member')->listNews($page->firstRow, $page->listRows));//分配列出具体值
        $this->assign("count",$count);//合计总会员数
        $this->assign("newCount", count($countToday));//当日合计总会员数
    } 
    public function forbidden(){
    	//禁止会员状态
    	$where['member_id']=$_GET['id'];
    	$model=M("Member");
    	$data['isLock'] = '1';
    	$result=$model->where($where)->save($data);
    	if($result){
    		$this->success('已经禁用该会员！');
    	}else{
    		$this->error("禁用失败！");
    	}
    }
    public function checkPass(){
    	//通过会员审核
    	$where['member_id']=$_GET['id'];
    	$model=M("Member");
    	$data['isLock'] = '2';
    	$result=$model->where($where)->save($data);
    	if($result){
    		$this->success('已经开启该会员！');
    	}else{
    		$this->error("开启失败！");
    	}
    }
    public function showMarriage(){
    	//查看择偶信息
    	$where['member_id']=(int)$_GET['id'];
    	$M=D('Marriage_term');
    	$marriage  =  $M->where($where)->select();
    	$this->assign('info',$marriage);
    	$this->display();
    }
    public function show(){
    	//查看会员的全部信息
    	$M = D('Member');
    	$where['member_id']=(int)$_GET['id'];
    	$list   =  $M->relation(true)->where($where)->select();
    	$this->assign('info',$list);
    	$this->display();
    }
    public function _before_search(){
    	//搜索会员信息
    	$M = D('Member');
    	// 构造查询条件
  		$condition = array();
    	$condition['schoolName'] = !empty($_POST['schoolName']) ?  trim($_POST['schoolName']) : '';
    	$condition['gender'] =! empty($_POST['gender']) ?   $_POST['gender'] : '';
    	$condition['vip_type_id'] = !empty($_POST['type']) ?   $_POST['type'] : '';
    	$condition['ifNation'] =! empty($_POST['ifNation']) ? $_POST['ifNation'] : '';
    	$condition['if_overseas'] = !empty($_POST['if_overseas']) ? $_POST['if_overseas'] : '';
		//组合条件
    	$wherelist = array();
    	$wherelist[] = "schoolName like '%{$condition['schoolName']}%'";
    	$wherelist[] = "gender = '{$condition['gender']}'";
    	$wherelist[] = "vip_type_id = '{$condition['vip_type_id']}'";
    	$wherelist[] = "ifNation = '{$condition['ifNation']}'";
    	$wherelist[] = "if_overseas = '{$condition['if_overseas']}'";
    	//组装存在的查询条件
    	if(count($wherelist) > 0){
    		$where = " where ".implode(' AND ' , $wherelist);
    	}
    	$where = isset($where) ? $where : '';
    	$count = $M->where($where)->count();
    	// 导入分页类
    	import("ORG.Util.Page");
    	// 实例化分页类
    	$page = new Page($count, 10);
    	// 获取查询参数
    	foreach($condition as $key=>$val) {
    		$page->parameter .= "$key=".urlencode($val)."&";
    	}
    	// 分页显示输出
    	$showPage = $page->show();
    	// 当前页数据查询
    	$list = $M->where($where)->limit($p->firstRow.','.$p->listRows)->select();
    }
    public function category(){
    	//会员类别显示
    	$m=M('Viptype');
    	$list=$m->select();
    	$this->assign('list',$list);
    	$this->display();
    }
    public function vipPrivilege(){
    	//会员类别权限显示
    	$m=M('Viptype');
    	$list=$m->select();
    	$this->assign('list',$list);
    	$this->display();
    }
    public function dealVipPrivilege(){
    	//处理会员类别权限（未写）
    	$m=M('Viptype');
    	$list=$m->select();
    	$this->assign('list',$list);
    	$this->display();
    }
    public function _before_del(){
    	//删除多个表操作
    	/* DELETE
FROM tabe1,table2,table3
WHERE tabe1.userid=1782
AND tabe2.userid=tabe1.userid
AND tabe3.userid=tabe1.userid */
    	/* $member_id=$_GET['id'];
    	$sql="DELETE FROM mxczhyk_member_detail,mxczhyk_marriage_term,mxczhyk_member WHERE tabe1.userid=$member_id AND tabe2.userid=tabe1.userid AND tabe3.userid=tabe1.userid ";
    	$Model = new Model();
    	$Model->query($sql); */
    	$M = D('Member');
    	$where['member_id']=(int)$_GET['id'];
    	$list   =  $M->relation(true)->where($where)->delete();
	    if($list){
	    		$this->success('已经从择偶信息表，会员总表和会员详细信息表中删除该记录！');
	    	}else{
	    		$this->error("删除失败！");
	    	}
    }
}