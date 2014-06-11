<?php
/**
 * wish操作
 */
class WishModel extends CommonModel{
	// 设置数据表
	protected $tableName = 'Wish';
	//自动验证
	protected $_validate=array(
			//每个字段的详细验证内容
			array("username","require","用户名不能为空"),//默认情况下用正则进行验证
			array("email","require","电子邮箱必须填写"),
			array('email','email','邮箱格式错误！',2),
	);
	//自动填充
	protected $_auto=array(
			array('status','1'),
			array("create_time",'time',3,'function') ,
			array("status",'time',3,'function') ,
			array( 'getIp',"get_client_ip",3,'function') ,
	);
}