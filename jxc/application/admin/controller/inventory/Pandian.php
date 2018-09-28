<?php

namespace app\admin\controller\inventory;

use app\common\controller\Backend;

/**
 * 库存盘点
 *
 * @icon fa fa-circle-o
 */
class Pandian extends Backend
{
    
    /**
     * Pandian模型对象
     * @var \app\admin\model\Pandian
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Pandian');
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
     * 查看
     */
    public function index()
    {
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax())
        {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField'))
            {
                return $this->selectpage();
            }

            list($where, $sort, $order, $offset, $limit) = $this->buildparams();

            $total = model('stock')->alias('s')->join('fa_goods g','s.goods_id = g.id')->where($where)->field("g.name,g.id,g.category,g.unit,g.price,sum(s.num) as nums,sum(s.pdnum) as pdnum,sum(s.cynum) as cynum,s.supplier_id,s.goods_id,s.storage_id,s.jinjia,s.add_time,g.sn,g.spec,s.stock_id")->group('g.name')->count();
            $list = model('stock')->alias('s')->join('fa_goods g','s.goods_id = g.id')->where($where)->field("g.name,g.id,g.category,g.unit,g.price,sum(s.num) as nums,sum(s.pdnum) as pdnum,sum(s.cynum) as cynum,s.supplier_id,s.goods_id,s.storage_id,s.jinjia,s.add_time,g.sn,g.spec,s.stock_id")->group('g.name')->select();
            $list = collection($list)->toArray();
            $result = array("total" => $total, "rows" => $list);
            return json($result);
        }
        $this->init_configs();
        return $this->view->fetch();
    }
    /**
     * 修改差异数
     */
    public function editnum(){
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        if($this->request->isAjax())
        {
           $pdnum = $this->request->post('pdnum');
           $row = $this->request->post('row/a');
           $cynum =$pdnum - $row['nums'] ;
           $params = [
                'id' => $row['id'],
                'storage_id' => $row['storage_id'],
                'goods_id' => $row['goods_id'],
                'supplier_id' => $row['supplier_id'],
                'jinjia' => $row['jinjia'],
                'num' => $row['nums'],
                'pdnum' => $pdnum,
                'cynum' => $cynum,
                'start_time' => time(),
                'end_time' => time(),
                'add_time' => time(),
           ];
           $xin = $this->model->save($params);
           $where['stock_id'] = array('eq',$row['stock_id']);
           $where['storage_id'] =  array('eq',$row['storage_id']);
           $pdup = [
                'pdnum' => $pdnum,
                'cynum' => $cynum, 
           ];
           $upnum = model('stock')->isUpdate(true)->where($where)->update($pdup);
           if($cynum > 0 ){
                $baoyi =[
                    'type' => 1,
                    'stock_id' => $row['id'],
                    'storage_id' => $row['storage_id'],
                    'goods_id' => $row['goods_id'],
                    'supplier_id' => $row['supplier_id'],
                    'num' => $cynum,
                    'jinjia' =>$row['jinjia'],
                    'jine' => $cynum * $row['jinjia'],
                    'add_time' =>time(),
               ];
               $by = model('yisun')->save($baoyi);
           }else{
                $baosun =[
                    'type' => 0,
                    'stock_id' => $row['id'],
                    'storage_id' => $row['storage_id'],
                    'goods_id' => $row['goods_id'],
                    'supplier_id' => $row['supplier_id'],
                    'num' => $cynum,
                    'jinjia' =>$row['jinjia'],
                    'jine' => $cynum * $row['jinjia'],
                    'add_time' =>time(),
               ];
               $by = model('yisun')->save($baosun);
           }
           return json($xin);
        }
    }

}
