<?php

namespace app\admin\model;

use think\Model;

class Sale extends Model
{
    // 表名
    protected $name = 'sale';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    
    // 追加属性
    protected $append = [
        'realname',
        'storage_text',
    ];

    protected $realnameList = null;
    
    public function getRealnameAttr($value, $data){
        $value = $data['member_id'];
        $list = $this->getRealnameList();
        return isset($list[$value]) ? $list[$value] : '';
    }

    public function getRealnameList(){
        if(!cache('realnameList')){
            $list = model('Member')->column('id,mobile');
            $list = collection($list)->toArray();
            cache('realnameList',$list,60);

        }
        return cache('realnameList');
    }

     public function getStorageTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['storage_id'];
        $list =  model('Storage')->getList();
        return isset($list[$value]) ? $list[$value] : '';
    }

  
}
