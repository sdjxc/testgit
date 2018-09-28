<?php

namespace app\admin\controller\inventory;

use app\common\controller\Backend;

/**
 * 调库记录
 *
 * @icon fa fa-circle-o
 */
class Tiaoku extends Backend
{
    
    /**
     * Tiaoku模型对象
     * @var \app\admin\model\Tiaoku
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Tiaoku');
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
     * 调库
    */
    public function add()
    {
        if ($this->request->isPost())
        {
            $params = $this->request->post("row/a");
            $params['goods'] = $_POST['goods'];
            $params['num'] = $_POST['num'];
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
                    $tiao =array();
                    $tiao['sn'] = $this->getCode();
                    $tiao['type'] = $params['type'];
                    $tiao['desc'] = $params['desc'];
                    $tiao['storage'] = $params['storage'];
                    $tiao['storageru'] = $params['storageru'];
                    $tiao['author'] = $params['author'];
                    $tiao['add_time'] = $params['add_time'];
                    $temp = [];
                    foreach ($params['goods'] as $k=>$v) {
                        $vv = explode('_',$v);
                        $temp[] =  [
                            $vv[0],
                            $vv[1],
                            $params['num'][$k],
                         ]; 
                        $where = ['storage_id' =>$params['storage'],'goods_id' => $vv[0]];    
                        $upnum = model('stock')->where($where)->setDec('num', $params['num'][$k]);
                        $condition = ['storage_id' =>$params['storageru'],'goods_id' => $vv[0]];  
                        $zjnum = model('stock')->where($condition)->setInc('num', $params['num'][$k]);       
                    }
                    $tiao['res'] = json_encode($temp);
                    $result = $this->model->allowField(true)->save($tiao);
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
     * 查看
     */
    public function details($ids = NULL){
        $row = $this->model->get($ids);
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
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }
    /**
     * 打印
     */
    public function prints($ids = NULL){
        $row = $this->model->get($ids);
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
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }

}
