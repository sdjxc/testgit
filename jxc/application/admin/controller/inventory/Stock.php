<?php

namespace app\admin\controller\inventory;

use app\common\controller\Backend;

/**
 * 库存查询
 *
 * @icon fa fa-circle-o
 */
class Stock extends Backend
{
    
    /**
     * Stock模型对象
     * @var \app\admin\model\Stock
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Stock');
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
            $total = $this->model->alias('s')->join('fa_goods g','s.goods_id = g.id')->where($where)->field("g.name,g.id,g.category,g.unit,g.price,sum(s.num) as nums,s.supplier_id,s.storage_id,s.jinjia,s.add_time,g.sn,g.spec")->group('g.name')->count();
            $list = $this->model->alias('s')->join('fa_goods g','s.goods_id = g.id')->where($where)->field("g.name,g.id,g.category,g.unit,g.price,sum(s.num) as nums,s.supplier_id,s.storage_id,s.jinjia,s.add_time,g.sn,g.spec")->group('g.name')->select();
            $list = collection($list)->toArray();
            $result = array("total" => $total, "rows" => $list);
            return json($result);
        }
        $this->init_configs();
        return $this->view->fetch();
    }

}
