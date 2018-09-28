<?php

namespace app\admin\model;

use think\Model;

class Buy extends Model
{
    // 表名
    protected $name = 'buy';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [
        'state_text',
        'supplier_text',
        'add_time_text'
    ];
    

    
    public function getStateList()
    {
        return ['0' => '未到货','1' => '已到货','2' => '已入库','3' => '已作废','4' => '已退货'];
    }     


    public function getStateTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['state'];
        $list = $this->getStateList();
        return isset($list[$value]) ? $list[$value] : '';
    }

    public function getSupplierTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['supplier'];
        $list = model('supplier')->getList();
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

    public function goodsxin(){
        return $this->belongsTo('Goodsxin', 'res','goods_xinid','goodsxin','left')->setEagerlyType(0);
    }

}
