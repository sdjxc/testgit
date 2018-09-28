<?php

namespace app\admin\controller\inventory;

use app\common\controller\Backend;

/**
 * 
 *
 * @icon fa fa-circle-o
 */
class Tui extends Backend
{
    
    /**
     * Tui模型对象
     * @var \app\admin\model\Tui
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Tui');
        $this->view->assign("stateList", $this->model->getStateList());
        $this->assign('storageList',model('Storage')->getList());
        $this->assign('stockList',model('Stock')->getStockList());
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
    public function details($ids = NULL){
        $row = $this->model->get($ids);
        $where['goods_xinid'] = array('eq',$row['res']);
        $where['type'] =array('eq',1);
        $goodsxin = db("goodsxin")->where($where)->select();
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
        $this->view->assign("goodsxin", $goodsxin);
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }
    /**
     * 打印
     */
    public function prints($ids = NULL){
        $row = $this->model->get($ids);
        $where['goods_xinid'] = array('eq',$row['res']);
        $where['type'] =array('eq',1);
        $goodsxin = db("goodsxin")->where($where)->select();
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
        $this->view->assign("goodsxin", $goodsxin);
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }

}
