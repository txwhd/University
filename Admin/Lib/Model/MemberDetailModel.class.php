<?php
/*
 * name：会员管理
 * aothor：马晓成857773627@qq.com
 */
class Member_detailModel extends RelationModel{
	
	  protected $_link = array(
        'viptype'=>array(
             'mapping_type'=> BELONGS_TO,
             'mapping_name'=> 'viptype',
             'class_name' => 'viptype',
             'foreign_key' => 'vip_type_id',
        ),
    );

}