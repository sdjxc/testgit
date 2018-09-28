<?php

namespace app\admin\controller;

use app\common\controller\Backend;

/**
 * 
 *
 * @icon fa fa-circle-o
 */
class Cashregister extends Backend
{
    
    /**
     * Member模型对象
     * @var \app\admin\model\Member
     */
    protected $model = null;
    
    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Member');

    }
    public function setmember($mobile = ''){

        $this->assign('mobile',$mobile);
        return $this->view->fetch();
    }
    public function setstorage($storage = ''){

        $this->assign('storage',$storage);
        return $this->view->fetch();
    }
    public function addgood($storage_id = 0){
        $this->assignconfig('storage_id',$storage_id);
        return $this->view->fetch();
    }

    //挂单
    public function hangup(){
        if($this->request->isAjax()){
            $code = $this->request->post('code');
            $data = $this->request->post('data/a');
            $member_id = $this->request->post('member_id');
            $storage_id = $this->request->post('storage_id');
            $price = $this->request->post('price');
            $money = $this->request->post('money');
            $remark = $this->request->post('remark');
            $params = [
                'code' => $code,
                'data' => json_encode($data),
                'status' => 1,
                'member_id' => $member_id,
                'storage_id' => $storage_id,
                'price' => $price,
                'money' => $money,
                'remark' => $remark,
            ];
            $rs = model('Sale')->save($params);
            return json(['code' => $rs]);
        }
        return $this->view->fetch();
    }

    public function notcompleted(){
        return $this->view->fetch();
    }
    //结账
    public function submit($money,$member_id){
        $money = (float)$money;
        $member = model('member')->find($member_id);
        if($this->request->isAjax()){
            //根据传过来的数据列表重新计算一遍金额
            $trueMoney = 0;
            $price = 0;
            $data = $this->request->post('data/a');
            $remark = $this->request->post('remark');
            foreach($data as $k => $v){
                //return json($data);
                $trueMoney += (float)$v['money'];
                $price += (float)$v['price'];
                $stock = model('Stock')->where('goods_id',$v['id'])->where('storage_id',$v['storage_id'])->value('num');
                $storage_id = $v['storage_id'];
                //检查库存
                if($stock < $v['number']){
                    return json(['code' => -1,'msg' => '库存不足']);
                }
            }
            //根据传过来的支付列表重新计算一遍支付金额
            $payMoney = 0;
            $moneyList = $this->request->post('moneyList/a');
            foreach($moneyList as $k => $v){
                $payMoney += (float)$v;
            }
            if($money != $trueMoney){
                return json(['code' => -1,'msg' => '结账金额与实际货品金额不符，请稍候再试']);
            }
            if($money > $payMoney){
                return json(['code' => -1,'msg' => '支付金额与实际货品金额不符，请稍候再试']);
            }
            if(isset($moneyList['balance'])){
                if($member['credit2'] < $moneyList['balance']){
                    return json(['code' => -1,'msg' => '余额不足，请稍候再试']);
                }
            }
            $params = [
                'code' => 0,
                'data' => json_encode($data),
                'status' => 2,
                'member_id' => $member_id,
                'storage_id' => $storage_id,
                'price' => $price,
                'money' => $trueMoney,
                'remark' => $remark ? $remark : '',
            ];
            $rs = model('Sale')->save($params);
            $params['id'] = model('Sale')->getLastInsID();
            $params['credit2'] = 0;
            $params['time'] = date('Y-m-d H:i:s');
            foreach($data as $k => $v){
                model("Stock")->where('goods_id',$v['id'])->where('storage_id',$v['storage_id'])->setDec('num',$v['number']);
            }

            if($member_id){
                $memberController = controller('Member');
                $rs = $memberController->buy($member_id,$moneyList);
                $params['credit2'] = model('Member')->getCredit($member_id,'credit2');
            }
            
            return json(['code' => 1,'data' => $params]);
        }
        
        $this->assign('money',(float)$money);
        $this->assign('member',$member);
        return $this->view->fetch();
    }

    
    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */


}
