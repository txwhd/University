<?php
/*图片相册类*/
class PhotoAction extends CommonAction {
	//列表
	public function index(){
		$id = $this->router();
		$type = D('Category')->where('status=1')->find($id); 
		$map = D('Common')->getCategoryMap($id);
		$map['status'] = array('eq',1);
		
		//分页取数据
		import("ORG.Util.Page");
		$Photo = D("Photo");			
		$count = $Photo->where($map)->count(); 
		$Page = new Page($count,20);
		$show = $Page->show(); 
		$list = $Photo->where($map)->order('sort DESC,add_time DESC')->limit($Page->firstRow.','.$Page->listRows)->select();
		foreach ($list as $key=>$val){
			$list[$key]=$this->changurl($val);
		}		
		$types = D('Category')->where('status=1 AND pid!=0 AND module="Photo"')->order('sort DESC')->select();
		foreach ($types as $key=>$val){
			$types[$key]=$this->changurl($val);
		}
		$this->assign('types',$types);
		$this->assign('list',$list);
		$this->assign('page',$show);
		$this->seo($type['title'], $type['keywords'], $type['description'], D('Common')->getPosition($id));
		$this->choosetpl($type);
	}
}