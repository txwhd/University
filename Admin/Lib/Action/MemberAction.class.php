<?php
/*
 * 模块用处：会员管理
 * aothor：马晓成
 */
class MemberAction extends CommonAction {

  public function index() {
      	 $M = M('Member');//这里用关联
        $count = $M->count();
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
    public function member_excel(){
    	//导出全部信息
    	import('ORG.Util.php-excel');
    	$arr[0]=array('学生名','生源地','单位名称','单位所在地','单位性质','档案机要地址');
    	$num= M()->table("y_dispatsh this0")->join("y_student this1 on this0.student_id=this1.student_id")->where(' this0.corporate_name!=""')->count();
    	$list = M()->table("y_dispatsh this0")->join("y_student this1 on this0.student_id=this1.student_id")->where(' this0.corporate_name!=""')->select();
    	for($i=0;$i<$num;$i++){
    		$arr[$i+1]=array($list[$i]['real_name'],$list[$i]['origin_of_student'],$list[$i]['corporate_name'],$list[$i]['corporate_address'],$list[$i]['corporate_property'],$list[$i]['archives_address']);
    	}
    	$data =$arr;
    	$xls = new Excel_XML('UTF-8', false, 'My Test Sheet');
    	$xls->addArray($data);
    	$xls->generateXML('new');
    
    }
    public function forbidden(){
    	//禁止会员状态
    }
    public function checkPass(){
    	//通过会员审核
    }
    public function showMarriage(){
    	//查看择偶信息
    }
    public function show(){
    	//查看会员的全部信息
    	
    }
    public function search(){
    	//搜索会员信息
    }
    
}