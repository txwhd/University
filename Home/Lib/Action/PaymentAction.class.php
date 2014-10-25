<?php
/*
 * name:支付管理
* aothor:
*/
class PaymentAction extends CommonAction {
	//显示增加支付记录
	public function index(){
		$this->display();
	}
	public function addRecord(){
		$this->display();

	}
	//在线支付
	public function setPayLine(){
		$this->display();

	}
	//币种管理
	public function coinType(){
		$model=M('Coin_type');
		$result=$model->select();
		$this->assign('list',$result);
		$this->display();
	}
	/* ********删除币种******* */
	public function delCoinType(){
		$model=M('Coin_type');
		$where['coin_type_id']=$_GET['id'];
		$result=$model->where($where)->delete();
		if ($result) {
			$this->success('删除成功！');
		}else{
			$this->error('删除失败！');
		}
	}
	//点数购买设置
	public function setPoint(){
		$this->display();
	}
	//充值卡管理
	public function cardManager(){
		$this->display();

	}
	//增加支付方式
	public function add(){
		$this->display();

	}
	/*
	 * 币种编辑与增加
	*/
	public function addCoin(){
		$model=M('Coin_type');
		if ($_POST['type']=='3') {
			$data=$model->create();
			if(false === $data){
				$this->error($model->getError());
			}
			if (empty($_POST['coin_type_id'])) {
				$result=$model->add($data);
				if ($result) {
					$this->success('增加成功！');
				}else{
					$this->error('增加失败！');
				}
			}else{
				$where1['coin_type_id']=$_POST['coin_type_id'];
				$result=$model->where($where1)->save($data);
				if ($result) {
					$this->success('编辑成功！');
				}else{
					$this->error('编辑失败！');
				}
			}
		} elseif ($_GET['type']=='2') {
			$where['coin_type_id']=$_GET['id'];
			$this->assign("info", $model->where($where)->select());
			$this->display();
		}else {
			$this->display();
		}
	}
	//支付记录列表
	public function payRecord(){
		$this->display();

	}
	//积分换点数设置
	public function Integral(){
		$this->display();

	}
	//有效期管理设置
	public function PointChange(){
		$this->display();

	}

}