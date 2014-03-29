<?php
/*
 * 视图模型
继承ViewModel 在视图中结合多个表形成一个虚拟表，然后实例化这个视图，就可以按普通方式查询
class BlogViewModel extends ViewModel {
				public $viewFields=array(
						'Blog'= array('id','name','title'),
								'Category'=array('title'=>'catagory_name','_on'=>'Blog.catagory_id=category.id),
				                 'User'=array('name'=>'username','_on'=>'Blog.user_id=User.id')
						)
				},
					
						//其中_on定义了连接条件
				等同于：
      selct  Blog.id as id,Blog.name as name, Blog.title as title,Category.title as catagory_name,User.name as username,
               from think_blog as Blog JOIN think_category as Category JOIN think_user as User
               where Blog.catagory_id=Category.id and Blog.user_id=User.id
   还可以使用_type来定义左连接或右连接
       'Blog'=array('id','name','title','_type'=>'LEFT'),
				接着就可以使用模型正常操作
				$Model=D("BlogView")
      $Model->field('id,name,title.category_name,username')->where('id>10')->select();
}
 */

