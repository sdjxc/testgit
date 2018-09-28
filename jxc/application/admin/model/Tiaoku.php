<?php

namespace app\admin\model;

use think\Model;

class Tiaoku extends Model
{
    // 表名
    protected $name = 'tiaoku';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [
        'state_text',
        'storage_text',
        'storageru_text',
        'type_text',
        'add_time_text'
    ];
    

    
    public function getStateList()
    {
        return ['0' => '正常','1' => '废弃'];
    }     


    public function getStateTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['state'];
        $list = $this->getStateList();
        return isset($list[$value]) ? $list[$value] : '';
    }
    public function getStorageTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['storage'];
        $list = model('storage')->getList();
        return isset($list[$value]) ? $list[$value] : '';
    }

    public function getStorageruTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['storageru'];
        $list = model('storage')->getList();
        return isset($list[$value]) ? $list[$value] : '';
    }
    public function getTypeTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['type'];
        $list =  model('rutype')->getList();
        return isset($list[$value]) ? $list[$value] : '';
    }

    public function getAddTimeTextAttr($value, $data)
    {
        $value = $value ? $value : $data['add_time'];
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }

    protected function setAddTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }


}
