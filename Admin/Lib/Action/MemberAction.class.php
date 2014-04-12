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
    	$arr[0]=array('姓名','邮箱','手机','民族名称','学校名称','学院','留学生','信仰','性别','国籍','省份','城市','生日','血型','用户爱好','qq','MSN','交友目的','个性签名','星座名称');
    	$num= M()->table("y_dispatsh this0")->join("y_student this1 on this0.student_id=this1.student_id")->where(' this0.corporate_name!=""')->count();
    	$list = M()->table("y_dispatsh this0")->join("y_student this1 on this0.student_id=this1.student_id")->where(' this0.corporate_name!=""')->select();
    	for($i=0;$i<$num;$i++){
    		$arr[$i+1]=array($list[$i]['username'],$list[$i]['email'],$list[$i]['Mobile'],$list[$i]['nationName'],$list[$i]['schoolName'],$list[$i]['academy'],$list[$i]['schoolName'],
    				$list[$i]['if_overseas'],$list[$i]['if_belif'],$list[$i]['gender'],$list[$i]['nationality'],$list[$i]['province'],$list[$i]['city'],
    				$list[$i]['birthday'],$list[$i]['blood'],$list[$i]['UserFan'],$list[$i]['qq'],$list[$i]['msn'],$list[$i]['goal'],
    				$list[$i]['sightml'],$list[$i]['constellation']);
    	}
    	$data =$arr;
    	$xls = new Excel_XML('UTF-8', false, 'My Test Sheet');
    	$xls->addArray($data);
    	$xls->generateXML('new');
    
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
    	$this->display();
    }
    public function show(){
    	//查看会员的全部信息
    	$this->display();
    }
    public function search(){
    	//搜索会员信息
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