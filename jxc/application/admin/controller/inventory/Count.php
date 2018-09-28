<?php

namespace app\admin\controller\inventory;

use app\common\controller\Backend;

/**
 * 多表格示例
 *
 * @icon fa fa-table
 * @remark 当一个页面上存在多个Bootstrap-table时该如何控制按钮和表格
 */
class Count extends Backend
{

    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
    }

    /**
     * 查看
     */
    public function index()
    {
        $this->loadlang('general/attachment');
        $this->loadlang('general/crontab');
        return $this->view->fetch();
    }

    public function table1()
    {
        $this->model = model('Buy');
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
            $where ='goodsxin . type =2';
            $total = $this->model
                ->with("goodsxin")
                ->where($where)
                ->count();
            $list = $this->model
                ->with("goodsxin")
                ->where($where)
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();
            $zonghe = $this->model
                ->with("goodsxin")
                ->where($where)
                ->sum('goodsxin.goods_num');
            $list[] = ['id'=>'','sn'=>'','buyer'=>'','goodsxin.goods_name'=>'','goodsxin.goods_purchase'=>'','goodsxin.goods_price'=>'','goodsxin.goods_num'=>$zonghe,
                       'supplier'=>'','state'=>'','add_time'=>''
                      ];
              //  dump($list);echo model('buy')->getlastsql(); die;
            $list = collection($list)->toArray();
            $result = array("total" => $total, "rows" => $list);
            return json($result);
        }
        return $this->view->fetch('index');
    }

    public function table2()
    {
        $this->model = model('Buy');
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
            $where ='goodsxin . type =1';
            $total = $this->model
                ->with("goodsxin")
                ->where($where)
                ->count();
            $list = $this->model
                ->with("goodsxin")
                ->where($where)
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();
            $zonghe = $this->model
                ->with("goodsxin")
                ->where($where)
                ->sum('goodsxin.goods_num');
            $list[] = ['id'=>'','sn'=>'','buyer'=>'','goodsxin.goods_name'=>'','goodsxin.goods_purchase'=>'','goodsxin.goods_price'=>'','goodsxin.goods_num'=>$zonghe,
                       'supplier'=>'','state'=>'','add_time'=>''
                      ];

            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch('index');
    }

    public function table3()
    {
        $this->model = model('Ruku');
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
           // $where ='goodsxin . type =1';
            $total = $this->model
                ->with("goodsxin")
                ->where($where)
                ->count();
            $list = $this->model
                ->with("goodsxin")
                ->where($where)
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();
            $zonghe = $this->model
                ->with("goodsxin")
                ->where($where)
                ->sum('goodsxin.goods_num');
            $list[] = ['id'=>'','sn'=>'','buyer'=>'','goodsxin.goods_name'=>'','goodsxin.goods_purchase'=>'','goodsxin.goods_price'=>'','goodsxin.goods_num'=>$zonghe,
                       'supplier'=>'','state'=>'','add_time'=>''
                      ];

            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch('index');
    }
    public function table4()
    {
        $this->model = model('Pandian');
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
            $total = $this->model
                    ->with('goods')
                    ->where($where)
                    ->count();

            $list = $this->model
                    ->with('goods')
                    ->where($where)
                    ->order($sort, $order)
                    ->limit($offset, $limit)
                    ->select();
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch('index');
    }



}
