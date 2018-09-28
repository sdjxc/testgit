<?php

namespace app\admin\controller\inventory;

use app\common\controller\Backend;

/**
 * 采购订单
 *
 * @icon fa fa-circle-o
 */
class Buy extends Backend
{
    
    /**
     * Buy模型对象
     * @var \app\admin\model\Buy
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Buy');
        $this->view->assign("stateList", $this->model->getStateList());
        $this->assign('storageList',model('Storage')->getList());
        $this->assign('supplierList',model('Supplier')->getList());
        $this->assign('goodsList',model('Goods')->getGoodsList());
        $this->assign('rutypeList',model('Rutype')->getList());
    }
    
    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */
     /**
     * 添加
     */
    public function add()
    {
        if ($this->request->isPost())
        {
            $params = $this->request->post("row/a");
            $params['goods'] = $_POST['goods'];
            $params['num'] = $_POST['num'];
            $params['purchase'] = $_POST['purchase'];
            if ($params)
            {
                if ($this->dataLimit && $this->dataLimitFieldAutoFill)
                {
                    $params[$this->dataLimitField] = $this->auth->id;
                }
                try
                {
                    //是否采用模型验证
                    if ($this->modelValidate)
                    {
                        $name = basename(str_replace('\\', '/', get_class($this->model)));
                        $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.add' : true) : $this->modelValidate;
                        $this->model->validate($validate);
                    }
                    //获取数据
                    $ruku =array();
                    $ruku['sn'] = $this->getCode();
                    $ruku['desc'] = $params['desc'];
                    $ruku['buyer'] = $params['buyer'];
                    $ruku['supplier'] = $params['supplier'];
                    $ruku['add_time'] = $params['add_time'];
                    $ruku['res'] = uniqid();
                    foreach ($params['goods'] as $k=>$v) {
                        $vv = explode('_',$v);
                        $temp =  [
                            'goods_id'=> $vv[0],
                            'goods_sn' =>$vv[1],
                            'goods_num' => $params['num'][$k],
                            'goods_purchase' => $params['purchase'][$k],
                            'goods_name' => $vv[2],
                            'goods_price' => $vv[3],
                            'goods_unit' => $vv[4],
                            'goods_xinid' => $ruku['res'],
                         ];
                        $goodsxin = db('goodsxin')->insert($temp);
                       // dump($goodsxin);echo db('goodsxin')->getlastsql();
                    }
                   // die;
                    $result = $this->model->allowField(true)->save($ruku);
                    if ($result !== false)
                    {
                        $this->success();
                    }
                    else
                    {
                        $this->error($this->model->getError());
                    }
                }
                catch (\think\exception\PDOException $e)
                {
                    $this->error($e->getMessage());
                }
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
        return $this->view->fetch();
    }
    /**
     * 未到货 
     */
    public function details($ids = NULL){
        $row = $this->model->get($ids);
        $where['goods_xinid'] = array('eq',$row['res']);
        $goodsxin = db('goodsxin')->where($where)->select();
        if (!$row)
            $this->error(__('No Results were found'));
        $adminIds = $this->getDataLimitAdminIds();
        if (is_array($adminIds))
        {
            if (!in_array($row[$this->dataLimitField], $adminIds))
            {
                $this->error(__('You have no permission'));
            }
        }
        if ($this->request->isPost())
        {
            $params = $this->request->post("row/a");
            if ($params)
            {
                try
                {
                    //是否采用模型验证
                    if ($this->modelValidate)
                    {
                        $name = basename(str_replace('\\', '/', get_class($this->model)));
                        $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.edit' : true) : $this->modelValidate;
                        $row->validate($validate);
                    }
                    $result = $row->allowField(true)->save($params);
                    if ($result !== false)
                    {
                        $this->success();
                    }
                    else
                    {
                        $this->error($row->getError());
                    }
                }
                catch (\think\exception\PDOException $e)
                {
                    $this->error($e->getMessage());
                }
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
        $row->data('supplier',$this->getSupplierById($row->getData('supplier')));
        $this->view->assign("goodsxin", $goodsxin);
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }
     /**
     * 已到货，修改 
     */
     public function edit($ids = NULL){
        $row = $this->model->get($ids);
        $where['goods_xinid'] = $row['res'];
        $goodsxin = db('goodsxin')->where($where)->select();
        if (!$row)
            $this->error(__('No Results were found'));
        $adminIds = $this->getDataLimitAdminIds();
        if (is_array($adminIds))
        {
            if (!in_array($row[$this->dataLimitField], $adminIds))
            {
                $this->error(__('You have no permission'));
            }
        }
        if ($this->request->isPost())
        {
            $params = $this->request->post("row/a");
            $params['goods'] = $_POST['goods'];
            $params['num'] = $_POST['num'];
            $params['purchase'] = $_POST['purchase'];
            if ($params)
            {
                try
                {
                    //是否采用模型验证
                    if ($this->modelValidate)
                    {
                        $name = basename(str_replace('\\', '/', get_class($this->model)));
                        $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.edit' : true) : $this->modelValidate;
                        $row->validate($validate);
                    }
                     //获取数据
                    $updata =array();    
                    $updata['desc'] = $params['desc'];
                    foreach ($params['goods'] as $k=>$v) {
                        $vv = explode('_',$v);
                        $temp =  [
                            'goods_id' =>$vv[0],
                            'goods_sn' =>$vv[1],
                            'goods_num' => $params['num'][$k],
                            'goods_purchase' => $params['purchase'][$k],
                            'goods_name' =>$vv[2],
                            'goods_price'=>$vv[3],
                            'goods_unit'=>$vv[4],
                            'type' => 0,
                         ];
                        
                         $xin['goods_xinid'] = array('eq',$params['res']);
                         $xin['goods_id']= array('eq',$vv[0]);
                         $upxin = db('goodsxin')->where($xin)->update($temp);
                        // dump($upxin);echo db('goodsxin')->getlastsql();
                    }
                   // die;
                   // $updata['res'] = json_encode($temp);
                    $result = $row->allowField(true)->save($updata);
                    if ($result !== false)
                    {
                        $this->success();
                    }
                    else
                    {
                        $this->error($row->getError());
                    }
                }
                catch (\think\exception\PDOException $e)
                {
                    $this->error($e->getMessage());
                }
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
        $row->data('supplier',$this->getSupplierById($row->getData('supplier')));
        $this->view->assign('goodsxin',$goodsxin);
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }
     /**
     * 已到货，入库
     */
     public function ruku($ids = NULL){
        $row = $this->model->get($ids);
        $where['goods_xinid'] = array('eq',$row['res']);
        $goodsxin = db('goodsxin')->where($where)->select();
        $upid = $row['id'];
        if (!$row)
            $this->error(__('No Results were found'));
        $adminIds = $this->getDataLimitAdminIds();
        if (is_array($adminIds))
        {
            if (!in_array($row[$this->dataLimitField], $adminIds))
            {
                $this->error(__('You have no permission'));
            }
        }
        if ($this->request->isPost())
        {
            $params = $this->request->post("row/a");
            $params['goods'] = $_POST['goods'];
            $params['num'] = $_POST['num'];
            $params['purchase'] = $_POST['purchase'];
            if ($params)
            {
                try
                {
                    //是否采用模型验证
                    if ($this->modelValidate)
                    {
                        $name = basename(str_replace('\\', '/', get_class($this->model)));
                        $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.edit' : true) : $this->modelValidate;
                        $row->validate($validate);
                    }
                   //获取数据
                    $ruku =array();
                    $ruku['sn'] = $this->getCode();
                    $ruku['type'] = $params['type'];
                    $ruku['desc'] = $params['desc'];
                    $ruku['storage'] = $params['storage'];
                    $ruku['supplier'] = $params['supplier'];
                   // $ruku['location'] = $params['location'];
                    $ruku['author'] = $params['author'];
                    $ruku['add_time'] = $params['add_time'];
                    $ruku['res'] = $params['res'];
                    foreach ($params['goods'] as $k=>$v) {
                        $vv = explode('_',$v);
                        $temp =  [
                            'goods_id' =>$vv[0],
                            'goods_sn' =>$vv[1],
                            'goods_num' =>$params['num'][$k],
                            'goods_purchase' =>$params['purchase'][$k],
                            'goods_name' =>$vv[2],
                            'goods_price' =>$vv[3],
                            'goods_unit' =>$vv[4],
                            'goods_xinid' =>$params['res'],
                            'type' => 2,
                         ];
                        $upruku = db('goodsxin')->insert($temp);
                        $stock_data[] = array('storage_id' => $params['storage'], 'supplier_id' => $params['supplier'],'goods_id' => $vv[0],'num' => $params['num'][$k],'jinjia' =>$params['purchase'][$k],'add_time' => time());          
                    }
                    $stock =model('stock')->isUpdate(false)->saveAll($stock_data);
                    // echo db('stock')->getlastsql();
                    // die;
                   
                    $result = model('ruku')->allowField(true)->save($ruku);
                    if ($result !== false)
                    { 
                        $upstate = db('buy')->where('id',$upid)->setField('state',2);
                        //echo db('buy')->getlastsql();die;
                        $this->success();
                    }
                    else
                    {
                        $this->error($row->getError());
                    }
                }
                catch (\think\exception\PDOException $e)
                {
                    $this->error($e->getMessage());
                }
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
        $this->view->assign('goodsxin',$goodsxin);
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }
    /**
     * 作废
     */
    public function cancel($ids){
        $rs = $this->model->where('id','in',$ids)->update(['state' => 3]);
        if($rs){
            $this->success("作废成功"); 
        }else{
            $this->error("作废失败");
        }
    }
    /**
     * 未到货，采购退货
     */
     public function tui($ids = NULL){
        $row = $this->model->get($ids);
        $where['goods_xinid'] = array('eq',$row['res']);
        $goodsxin = db('goodsxin')->where($where)->select();
        $upid = $row['id'];
        if (!$row)
            $this->error(__('No Results were found'));
        $adminIds = $this->getDataLimitAdminIds();
        if (is_array($adminIds))
        {
            if (!in_array($row[$this->dataLimitField], $adminIds))
            {
                $this->error(__('You have no permission'));
            }
        }
        if ($this->request->isPost())
        {
            $params = $this->request->post("row/a");
            $params['goods'] = $_POST['goods'];
            $params['num'] = $_POST['num'];
            $params['purchase'] = $_POST['purchase'];
           // dump($params);die;
            if ($params)
            {
                try
                {
                    //是否采用模型验证
                    if ($this->modelValidate)
                    {
                        $name = basename(str_replace('\\', '/', get_class($this->model)));
                        $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.edit' : true) : $this->modelValidate;
                        $row->validate($validate);
                    }
                   //获取数据
                    $tui =array();
                    $tui['sn'] = $this->getCode();
                    $tui['type'] = $params['type'];
                    $tui['desc'] = $params['desc']; 
                    $tui['supplier'] = $params['supplier'];
                    $tui['buyer'] = $params['buyer'];
                    $tui['author'] = $params['author'];
                    $tui['add_time'] = $params['add_time'];
                    $tui['res'] = $params['res'];
                    foreach ($params['goods'] as $k=>$v) {
                        $vv = explode('_',$v);
                        $temp=  [
                            'goods_id' =>$vv[0],
                            'goods_sn' =>$vv[1],
                            'goods_num' =>$params['num'][$k],
                            'goods_purchase' =>$params['purchase'][$k],
                            'goods_name' => $vv[2],
                            'goods_price' =>$vv[3],
                            'goods_unit' =>$vv[4],
                            'type' => 1,
                            'goods_xinid' => $params['res'],
                         ];
                        $uptype = db('goodsxin')->insert($temp);
                       //  $stock_data[] = array('storage_id' => $params['storage'], 'location_id' => $params['location'],'supplier_id' => $params['supplier'],'goods_id' => $vv[0],'num' => $params['num'][$k],'jinjia' =>$params['purchase'][$k],'add_time' => time());          
                    }
                  //  $stock =model('stock')->isUpdate(false)->saveAll($stock_data);
                    // echo db('stock')->getlastsql();
                    // die;
                  
                    //dump($tui);die;
                    $result = model('tui')->allowField(true)->save($tui);
                    if ($result !== false)
                    { 
                        $upstate = db('buy')->where('id',$upid)->setField('state',$params['state']);
                        //echo db('buy')->getlastsql();die;
                        $this->success();
                    }
                    else
                    {
                        $this->error($row->getError());
                    }
                }
                catch (\think\exception\PDOException $e)
                {
                    $this->error($e->getMessage());
                }
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
        $row->data('supplier',$this->getSupplierById($row->getData('supplier')));
        $this->view->assign("goodsxin",$goodsxin);
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }
  
}
