<?php
/*
 * name：会员管理
 * aothor：马晓成857773627@qq.com
 */
class MemberModel extends RelationModel{
	
		public function listNews($firstRow = 0, $listRows = 20) {
		        $M = D("Member");
		        $list = $M->relation(true)->limit("$firstRow , $listRows")->select();
		        return $list;
		  }
		  /*
		   * protected $_link = array(
    '关联表名1'  =>  array(
        '该表的关联方式的属性1' => '定义',
        '该表的关联方式的属性N' => '定义',
    ),
    '关联表名2'  =>  array(
        '该表的关联方式的属性1' => '定义',
        '该表的关联方式的属性N' => '定义',
    ),
    
     protected $autoSaveRelations = true;        // 自动关联保存
    protected $autoDelRelations  = true;        // 自动关联删除
    protected $autoAddRelations  = true;        // 自动关联写入
    protected $autoReadRelations = true;        // 自动关联查询
    ...
);  */
		  protected $_link = array(
		  		'member_detail'=>array(
		  				'mapping_type'=> HAS_ONE,
		  				'mapping_name'=> 'member_detail',
		  				'class_name' => 'member_detail',
		  				'foreign_key' => 'member_id',
		  		),
		  		'marriage_term'=>array(
		  				'mapping_type'=> HAS_ONE,
		  				'mapping_name'=> 'marriage_term',
		  				'class_name' => 'marriage_term',
		  				'foreign_key' => 'member_id',
		  		),
		  		'viptype'=>array(
		  				'mapping_type'=> BELONGS_TO,
		  				'mapping_name'=> 'viptype',
		  				'class_name' => 'viptype',
		  				'foreign_key' => 'vip_type_id',
		  		),
		  		/*  
		  		 * 
		  		 * mapping_type
class_name
mapping_name
foreign_key
condition
mapping_fields
as_fields*/
		  );

}