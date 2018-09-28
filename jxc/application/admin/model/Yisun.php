<?php

namespace app\admin\model;

use think\Model;


class Yisun extends Model
{
    // 表名
    protected $name = 'yisun';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [
        'storage_text',
        'supplier_text',
        'category_text',
        'unit_text',
        'type_text',
        'status_text',
        'add_time_text'

    ];

    public function getStatusList()
    {
        return ['0' => '未入库','1' => '已入库'];
    }     


    public function getStatusTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['status'];
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }
     public function getTypeList()
    {
        return ['0' => '报损','1' => '报溢'];
    }     


    public function getTypeTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['type'];
        $list = $this->getTypeList();
        return isset($list[$value]) ? $list[$value] : '';
    }
    public function getStorageTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['storage_id'];
        $list = model('storage')->getList();
        return isset($list[$value]) ? $list[$value] : '';
    }
    
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


}
