<?php

namespace app\admin\model;

use think\Model;

class Leibie extends Model
{
    // 表名
    protected $name = 'leibie';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [
        'status_text',
        'pid_text',
        'add_time_text'
    ];
    

    
    public function getStatusList()
    {
        return ['0' => '正常','1' => '作废'];
    }     

    
    public function getStatusTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['status'];
        $list = $this->getStatusList();
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

    public function getList(){
        $condition = [
            'status' =>0
        ];
        $rs = $this->where($condition)->column('id,name');
        return $rs;
    }
    public function getPidTextAttr($value,$data){
        $value =$value ? $value : $data['pid'];
        $list = $this->getList();
        return isset($list[$value]) ? $list[$value] : '默认';
    }

}
