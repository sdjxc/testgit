<?php

namespace app\common\model;

use think\Model;

class Returngoods extends Model
{
    // 表名
    protected $name = 'returngoods';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [
        'time_text'
    ];
    

    



    public function getTimeTextAttr($value, $data)
    {
        $value = $value ? $value : $data['time'];
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }

    protected function setTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }


}
