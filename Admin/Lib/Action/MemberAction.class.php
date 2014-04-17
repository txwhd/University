<?php
/*
 * 模块用处：会员管理
 * aothor：马晓成
 */
class MemberAction extends CommonAction {
  public function index() {
  /* 	if (function_exists('ob_gzhandler')){
  		echo "ok";
  	}else {
  		echo'faled';
  		
  	} 
  		exit();*/
  
      	 $M = D('Member');
      	 //这里用关联
      	 $list   =  $M->relation(true)->count();
      	// $marriage  =  $M->relation('Marriage_term')->select();
        $count =$M->count();
        import("ORG.Util.Page");       //载入分页类
        $page = new Page($count, 20);
      //计算今天注册人数
        $today_start = strtotime(date( 'Y-m-d')); //返回今天凌晨00:00的时间戳(将年月日转换为时间戳)
        $today_end = $today_start + ( 24*60*60 ); //加上24小时，得出今晚00:00的时间戳
        $where['reg_time']  = array('between','$today_start,$today_end');
        $countToday=$M->where($where)->select();
        $this->assign("list", D("Member")->listNews($page->firstRow, $page->listRows));//分配列出具体值
        $this->assign("count",$count);//合计总会员数
        $this->assign("newCount", count($countToday));//当日合计总会员数
        $this->display();
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
    	$this->assign('list',$list);
    	$this->display();
    }
    public function search(){
    	//搜索会员信息
    	$M = D('Member');
    	// 构造查询条件
  		$condition = array();
    	$condition['schoolName'] = !empty($_GET['schoolName']) ?  trim($_GET['schoolName']) : '';
    	$condition['gender'] = isset($_GET['gender']) ?   $_GET['gender'] : 1;
    	$condition['vip_type_id'] = isset($_GET['vip_type_id']) ?   $_GET['vip_type_id'] : 1;
    	$condition['ifNation'] = !isset($_GET['ifNation']) ?  trim($_GET['ifNation']) : 1;
    	$condition['if_overseas'] = isset($_GET['if_overseas']) ?   $_GET['if_overseas'] : 1;
		//组合条件
    	$wherelist = array();
    	if(!empty($condition['schoolName'])){
    		$wherelist[] = "schoolName like '%{$condition['schoolName']}%'";
    	}
    	if(($condition['gender'])!=''){
    		$wherelist[] = "gender = '{$condition['gender']}'";
    	}
    	if(!$condition['vip_type_id']){
    		$wherelist[] = "vip_type_id = '{$condition['vip_type_id']}'";
    	}
    	if(!$condition['ifNation']){
    		$wherelist[] = "ifNation = '{$condition['ifNation']}'";
    	}
    	if($condition['if_overseas'] != ''){
    		$wherelist[] = "if_overseas = '{$condition['if_overseas']}'";
    	}
    	//组装存在的查询条件
    	if(count($wherelist) > 0){
    		$where = " where ".implode(' AND ' , $wherelist);
    	}
    	$where = isset($where) ? $where : '';
    	//echo $where;
    	//$result = $mysqli->query("SELECT * FROM `hotel_basic` {$where}");
    	$total = $result->num_rows;
    	$page = new page($total,10);
    	//传入控制条件变量
    	if(!empty($condition)){
    		foreach($condition as $key=>$val) {
    			$page->parameter .= "$key=".urlencode($val)."&";
    		}
    	}
    	//$limit = 'limit ('{$page->firstRow}','{$page->listRows}' ) ';
    	//注意limit的写法
    	$limit = "limit ".$page->firstRow.",{$page->listRows}";
    	//$result = $mysqli->query("SELECT * FROM `hotel_basic` {$where} ORDER BY id {$limit}");
    	// echo $limit;
    	
    	//dierge
    	$count = $M->where($condition)->count();
    	// 导入分页类
    	import("ORG.Util.Page");
    	// 实例化分页类
    	$p = new Page($count, 10);
    	// 获取查询参数
    	$map['status'] = $_GET['status'];
    	$map['email'] = $_GET['email'];
    	foreach($map as $key=>$val) {
    		$p->parameter .= "$key=".urlencode($val)."&";
    	}
    	// 分页显示输出
    	$page = $p->show();
    	
    	// 当前页数据查询
    	$list = $M->where($condition)->order('uid ASC')->limit($p->firstRow.','.$p->listRows)->select();
    	
    	// 赋值赋值
    	$this->assign('page', $page);
    	$this->assign('list', $list);
    	
    	$this->display();
    	/*  
    	 * 
 * $condition['email'] = array('like',"%".$_GET['email']."%");

*/
    	
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
    
}