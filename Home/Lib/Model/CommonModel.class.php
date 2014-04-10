<?php
class CommonModel extends Model {
	public function getPosition($id){
		$type = D('Category')->where('status=1')->find($id);
		if($type['pid']==0){
			$position = $id;
		}else{
			$position = $type['pid'];
		}
		return $position;
	}
	public function getCategoryMap($id){
		$type = D('Category')->where('status=1')->find($id);
		if($type['pid']==0){
			$types = D('Category')->where('status=1 AND pid='.$type['id'])->select();
			if(is_array($types)){
					foreach($types as $val) $ary[]=$val['id'];
			}
			$map['tid']	= array('in',$ary);
		}else{
			$map['tid'] = array('eq',$id);
		}
		return $map;		
	}
}