<?php
/*前台首页*/
class IndexAction extends CommonAction{
    //首页
	public function index(){
		/* $this->assign('diary',D('Diary')->where('status=1')->order('add_time DESC')->limit(5)->select());
		$top_art = D('Article')->where('status=1')->order('sort DESC')->limit(8)->select();
		foreach ($top_art as $key=>$val){
			$top_art[$key] = $this->changurl($val);
		}
		$this->assign('top_art',$top_art);
		$this->assign('slide',D('Photo')->where('status=1 AND tid=5')->select());//幻灯片调用ID
		$this->assign('video',D('Video')->where('status=1')->find(1));//视频调用ID
		 */
		$this->assign('mood',M('Mood')->where('status=1')->order('create_time DESC')->limit(4)->select());//个人心情语录展示
		$this->assign('label',M('Label')->where('status=1')->order('sort DESC')->limit(10)->select());//标签展示（置顶的永远显示）
		//友情链接
		$this->assign('link',M('Link')->where('status=1')->order('sort DESC')->select());
		//首页活动
		$Activity=M('Activity');
		$this->assign('Activity1',$Activity->where('class=1 AND isLock=1')->limit(5)->order('activity_id desc')->select());
		$this->assign('Activity2',$Activity->where('class=2 AND isLock=1')->limit(5)->order('activity_id desc')->select());
		R('Article/indexBlock');
		$this->display();
    }
    /*  
     *  public function index() {
        import('QRCode');
        $QRCode = new QRCode('',150);
        $img_url = $QRCode->getUrl("http://blog.51edm.org");
        echo '<img src="' . $img_url . '" />';
    }

    public function mail() {
        send_mail("281978297@qq.com", "李欧", "测试邮箱", "测试邮件是否能正常发送");
    }*/
	//站长日记
	public function diary(){
		$Diary = D("Diary"); 
		import("ORG.Util.Page");
		$count = $Diary->count(); 
		$Page = new Page($count,18);
		$show = $Page->show(); 
		$list = $Diary->order('add_time DESC')->limit($Page->firstRow.','.$Page->listRows)->select();
		$this->assign('list',$list);
		$this->assign('page',$show);
		$this->seo('站长日记', C('SITE_KEYWORDS'), C('SITE_DESCRIPTION'), 0);
		$this->display();
	}
	//站内搜索
	public function search(){
		$data = $_POST['words'];
		$r = D('Article')->where("status=1 AND title LIKE '%$data%' OR content LIKE '%$data%'")->select();
		foreach($r as $val){
			$val['title']=str_replace($data,"<font color=red><b>$data</b></font>",$val['title']);
			$val['content']=str_replace($data,"<font color=red><b>$data</b></font>",$val['content']);
			$list[]=$this->changurl($val);
		}
		$this->assign('list',$list);
		$this->seo('搜索'.$data.'结果', C('SITE_KEYWORDS'), C('SITE_DESCRIPTION'), 0);
		$this->display();
	}
}