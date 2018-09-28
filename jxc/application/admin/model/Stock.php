<?php

namespace app\admin\model;

use think\Model;

class Stock extends Model
{
    // 表名
    protected $name = 'stock';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [
        'add_time_text',
        'supplier_text',
        'category_text',
        'unit_text',
    ];
    

    
    public function getSupplierTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['supplier_id'];
        $list = model('supplier')->getList();
        return isset($list[$value]) ? $list[$value] : '';
    }
    public function getCategoryTextAttr($value,$data){
        $value =$value ? $value : $data['category'];
        $list = model('leibie')->getList();
        return isset($list[$value]) ? $list[$value] : '';
    }
    
    public function getUnitTextAttr($value,$data){
        $value =$value ? $value : $data['unit'];
        $list = model('unit')->getList();
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
     
    public function getStockList()
    {
        $rs =  $this->alias('s')->join('fa_goods g','s.goods_id = g.id')->field("g.name,g.id,g.category,g.unit,g.price,sum(s.num) as nums,s.supplier_id,s.storage_id,s.jinjia,s.add_time")->group('g.name')->select();
        return $rs;

    }

}
