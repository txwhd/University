<?php
// 文章模型
class ArticleModel extends CommonModel {
	protected $_link = array(
			'article_class'=>array(
					'mapping_type'=> HAS_ONE,
					'mapping_name'=> 'article_class',
					'class_name' => 'article_class',
					'foreign_key' => 'cid',
					'as_fields'=>'name,cid'
			),
	);
}