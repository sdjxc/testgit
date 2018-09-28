<?php

namespace app\admin\controller;

use app\common\controller\Backend;

/**
 * 
 *
 * @icon fa fa-circle-o
 */
class Member extends Backend
{
    
    /**
     * Member模型对象
     * @var \app\admin\model\Member
     */
    protected $model = null;
    protected $cookieFileName;
    protected $shopUrl = 'http://127.0.0.1:83/';
    protected $i = '7393';
    protected $agent_id = 0;
    protected $relationSearch = true;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Member');
        $this->agent_id = session('admin.agent_id');
        $this->cookieFileName = "cookie/" . time() . rand(1000,9999) . ".tmp";
    }
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
            $total = $this->model
                    ->with("member_group,member_level")
                    ->where($where)
                    ->order($sort, $order)
                    ->count();

            $list = $this->model
                    ->with("member_group,member_level")
                    ->where($where)
                    ->order($sort, $order)
                    ->limit($offset, $limit)
                    ->select();
            $list = collection($list)->toArray();
            foreach($list as $k => &$v){
                $v['memberGroup'] = $v['member_group'];
                $v['memberLevel'] = $v['member_level'];
                $v['memberGroup']['groupname'] = $v['member_group']['groupname'] ? $v['member_group']['groupname'] : '无分组';
                $v['memberLevel']['levelname'] = $v['member_level']['levelname'] ? $v['member_level']['levelname'] : '普通会员';
                $v['memberLevel']['discount'] = $v['member_level']['discount'] ? $v['member_level']['discount'] : 10;
            }
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }
    public function before_where($where){
        if($this->request->get('post') != '1'){
            $where[] = ['agentid','=',$this->agent_id];
        }
        return $where;
    }
    public function add(){
        if ($this->request->isPost()){
            $params = $this->request->post("row/a");
            if ($params){
                if ($this->dataLimit && $this->dataLimitFieldAutoFill){
                    $params[$this->dataLimitField] = $this->auth->id;
                }
                try{
                    $rs = $this->reg($params['mobile'],$params['password']);
                    dump($rs);
                    die;
                    if($rs['status'] != 1){
                        $this->error("111",$rs['result']);
                    }

                    $rs = $this->info($params);
                    if($rs['status'] != 1){
                        $this->error("222",$rs['result']);
                    }

                    $rs = $this->info(null,1);
                    if($rs['status'] != 1){
                        dump(2);
                        $this->error("333",$rs['result']);
                    }
                    $rs = $this->model->where('id','=',$rs['result']['member']['id'])->update(['agentid' => $this->agent_id]);
                    if($rs){
                        $this->success("qwe");
                    }else{
                        $this->error("444",$this->model->getError());
                    }
                    
                }
                catch (\think\exception\PDOException $e){
                    $this->error("555",$e->getMessage());
                }
            }
            $this->error("666",__('Parameter %s can not be empty', ''));
        }
        return $this->view->fetch();
    }

    public function edit($ids = null){
        if ($this->request->isPost()){
            $params = $this->request->post("row/a");
            if ($params){
                if ($this->dataLimit && $this->dataLimitFieldAutoFill){
                    $params[$this->dataLimitField] = $this->auth->id;
                }
                try{
                    $rs = $this->login($params['mobile'],$params['password']);
                    if($rs['status'] != 1){
                        $this->error($rs['result']);
                    }
                    $rs = $this->info($params);
                    if($rs['status'] != 1){
                        $this->error($rs['result']);
                    }
                    $this->success();
                }
                catch (\think\exception\PDOException $e){
                    $this->error($e->getMessage());
                }
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
        return $this->view->fetch('add');
    }

    public function reg($mobile,$password){
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->shopUrl . "app/index.php?i=" . $this->i . "&c=entry&p=register&do=member&m=vslai_shop");
        curl_setopt($ch, CURLOPT_POST, 1);//post提交方式
        curl_setopt($ch, CURLOPT_POSTFIELDS, ['mobile' => $mobile,'password' => $password,'nocode' => '1']);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_COOKIEJAR, $this->cookieFileName);
        $data = curl_exec($ch);
        curl_close($ch);
        return json_decode($data,true);
    }

    public function info($data = null,$isajax = 0){
        if(!is_file($this->cookieFileName)){
            return false;
        }
        if($isajax == 0){
            $data['birthyear'] = date("Y",strtotime($data['birthday']));
            $data['birthmonth'] = date("m",strtotime($data['birthday']));
            $data['birthday'] = date("d",strtotime($data['birthday']));
            $postData = [
                "memberdata" => [
                    "realname" => $data['realname'],
                    "membermobile" => $data['membermobile'],
                    "bank" => $data['bank'],
                    "bank_num" => $data['bank_num'],
                    "bankname" => $data['bankname'],
                    "weixin" => $data['weixin'],
                    "gender" => $data['gender'],
                    "birthyear" => $data['birthyear'],
                    "birthmonth" => $data['birthmonth'],
                    "birthday" => $data['birthday'],
                    "alipay" => $data['alipay'],
                    "alipayname" => $data['alipayname'],
                ],
                "mcdata" => [
                    "realname" => $data['realname'],
                    "membermobile" => $data['membermobile'],
                    "gender" => $data['gender'],
                    "birthyear" => $data['birthyear'],
                    "birthmonth" => $data['birthmonth'],
                    "birthday" => $data['birthday'],
                ]
            ];
        }else{
            $postData = ['isajax' => 1];
        }
        $postData = http_build_query($postData);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->shopUrl . "app/index.php?i=" . $this->i . "&c=entry&p=info&do=member&m=vslai_shop");
        curl_setopt($ch, CURLOPT_POST, 1);//post提交方式
        curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_COOKIEFILE, $this->cookieFileName);
        curl_setopt($ch, CURLOPT_COOKIEJAR, $this->cookieFileName);
        $data = curl_exec($ch);
        curl_close($ch);
        dump($data);die;
        return json_decode($data,true);
    }

    public function login($mobile,$password,$id = null){
        $postData = [
            'memberdata' => [
                'mobile' => $mobile,
                'password' => $password,
                'id' => $id
            ]
        ];
        $postData = http_build_query($postData);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->shopUrl . "app/index.php?i=" . $this->i . "&c=entry&p=login&do=member&m=vslai_shop");
        curl_setopt($ch, CURLOPT_POST, 1);//post提交方式
        curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_COOKIEJAR, $this->cookieFileName);
        $data = curl_exec($ch);
        curl_close($ch);
        $data = json_decode($data,true);
        
        $data['info'] = $this->info(null,1);
        if($data['info']['status'] == 1){
            $data['info'] = $data['info']['result']['member'];
        }
        return $data;
    }
    
    public function recharge_credit1($ids = null){

        $row = $this->model->get($ids);
        if (!$row){
            $this->error(__('No Results were found'));
        }
        $adminIds = $this->getDataLimitAdminIds();
        if (is_array($adminIds))
        {
            if (!in_array($row[$this->dataLimitField], $adminIds))
            {
                $this->error(__('You have no permission'));
            }
        }
        $balance = db("balance")->where('agent_id',$this->agent_id)->value('integration');
        if ($this->request->isPost())
        {
            $params = $this->request->post("row/a");
            if ($params){
                try {
                    if(($balance - $params['credit1']) < 0){
                        $this->error("您的店铺余额不足，请联系管理员充值");
                    }
                    $result = $row->setInc('credit1',$params['credit1']);
                    if($row->getData('uid')){
                        $result = model('McMember')->where('uid',$row->getData('uid'))->setInc('credit1',$params['credit1']);
                    }
                    if ($result !== false){
                        $result = model("Balance")->where("agent_id",$this->agent_id)->setDec('integration',$params['credit1']);
                        if ($result !== false){
                            $this->success();
                        } else {
                            $this->error(model("Balance")->getError());
                        }
                    } else {
                        $this->error($row->getError());
                    }
                } catch (\think\exception\PDOException $e){
                    $this->error($e->getMessage());
                }
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
        $this->assign('balance',$balance);
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }


    public function recharge_credit2($ids = null){

        $row = $this->model->get($ids);
        if (!$row){
            $this->error(__('No Results were found'));
        }
        $adminIds = $this->getDataLimitAdminIds();
        if (is_array($adminIds))
        {
            if (!in_array($row[$this->dataLimitField], $adminIds))
            {
                $this->error(__('You have no permission'));
            }
        }
        $balance = db("balance")->where('agent_id',$this->agent_id)->value('money');
        if ($this->request->isPost())
        {
            $params = $this->request->post("row/a");
            if ($params){
                try {
                    if(($balance - $params['credit2']) < 0){
                        $this->error("您的店铺余额不足，请联系管理员充值");
                    }
                    $result = $row->setInc('credit2',$params['credit2']);
                    if($row->getData('uid')){
                        $result = model('McMember')->where('uid',$row->getData('uid'))->setInc('credit2',$params['credit2']);
                    }
                    if ($result !== false){
                        $result = model("Balance")->where("agent_id",$this->agent_id)->setDec('money',$params['credit2']);
                        if ($result !== false){
                            $this->success();
                        } else {
                            $this->error(model("Balance")->getError());
                        }
                    } else {
                        $this->error($row->getError());
                    }
                } catch (\think\exception\PDOException $e){
                    $this->error($e->getMessage());
                }
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
        $this->assign('balance',$balance);
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }

    public function buy($member_id,$moneyList){
        $login = $this->login('','',$member_id);
        $money = 0;
        foreach ($moneyList as $k => $v) {
            if($k != 'balance'){
                $rs = $this->model->where('id',$member_id)->setInc('credit2',$v);
                if($login['info']['uid']){
                    $rs = model('McMember')->where('uid',$login['info']['uid'])->setInc('credit2',$v);
                }
            }
            $money += $v;
        }
        $postData = [
            'op' => 'create',
            'order' => $this->getOrderByMoney($money),
            'ischannelpay' => '',
            'ischannelpick' => '',
            'isyunbipay' => '1',
            'is_live' => '0',
            'isajax' => 1
        ];
        $postData = http_build_query($postData);

        
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->shopUrl . "app/index.php?i=" . $this->i . "&c=entry&do=order&p=confirm&m=vslai_shop");
        curl_setopt($ch, CURLOPT_POST, 1);//post提交方式
        curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_COOKIEFILE, $this->cookieFileName);
        curl_setopt($ch, CURLOPT_COOKIEJAR, $this->cookieFileName);
        $data = curl_exec($ch);
        curl_close($ch);
        $data = json_decode($data,true);
        $this->pay($data['result']['orderid']);
        return $data;
    }
    
    public function pay($order_id){

        $postData = [
            'op' => 'display',
            'orderid' => $order_id,
            'type' => 'credit',
            'isajax' => 1
        ];
        $postData = http_build_query($postData);        
        $ch_display = curl_init();
        curl_setopt($ch_display, CURLOPT_URL, $this->shopUrl . "app/index.php?i=" . $this->i . "&c=entry&do=order&p=pay&m=vslai_shop");
        curl_setopt($ch, CURLOPT_POST, 1);//post提交方式
        curl_setopt($ch_display, CURLOPT_POSTFIELDS, $postData);
        curl_setopt($ch_display, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch_display, CURLOPT_COOKIEFILE, $this->cookieFileName);
        curl_setopt($ch_display, CURLOPT_COOKIEJAR, $this->cookieFileName);
        curl_exec($ch_display);
        curl_close($ch_display);

        $postData = [
            'op' => 'complete',
            'orderid' => $order_id,
            'type' => 'credit',
            'isajax' => 1
        ];
        $postData = http_build_query($postData);        
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->shopUrl . "app/index.php?i=" . $this->i . "&c=entry&do=order&p=pay&m=vslai_shop");
        curl_setopt($ch, CURLOPT_POST, 1);//post提交方式
        curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_COOKIEFILE, $this->cookieFileName);
        curl_setopt($ch, CURLOPT_COOKIEJAR, $this->cookieFileName);
        curl_exec($ch);
        curl_close($ch);
        $rs = model('Order')->where('id',$order_id)->update(['status' => 3]);
        if($rs){
            return true;
        }else{
            return false;
        }
        
    }

    public function getOrderByMoney($money){
        $order = [
            [
                'supplier_uid' => 0,
                'goods' => [],
                'id' => 0,
                'gdid' => 0,
                'diydata' => '',
                'dispatchtype' => 0,
                'fromcart' => 0,
                'cartids' => 0,
                'remark' => '',
                'deduct' => 0,
                'yunbi' => 0,
                'deduct2' => 0,
                'addressid' => 0,
                'couponid' => '',
            ]
        ];
        $num = floor($money / 10000);
        if($num >= 1){
            $order[0]['goods'][] = "137008,0,{$num}";
        }
        $num = substr(floor($money / 1000), -1);
        if($num >= 1){
            $order[0]['goods'][] = "137009,0,{$num}";
        }
        $num = substr(floor($money / 100), -1);
        if($num >= 1){
            $num = substr($num, -1);
            $order[0]['goods'][] = "137010,0,{$num}";
        }
        $num = substr(floor($money / 10), -1);
        if($num >= 1){
            $num = substr($num, -1);
            $order[0]['goods'][] = "137011,0,{$num}";
        }
        $num = substr(floor($money / 1), -1);
        if($num >= 1){
            $num = substr($num, -1);
            $order[0]['goods'][] = "137012,0,{$num}";
        }


        $order[0]['goods'] = implode("|", $order[0]['goods']);
        return $order;
    }
    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */


}
