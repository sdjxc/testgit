<?php

namespace app\admin\model;

use think\Model;

class Member extends Model
{
    // 表名
    protected $name = 'member';

    protected $connection = [
        // 数据库类型
        'type'        => 'mysql',
        // 服务器地址
        'hostname'    => '127.0.0.1',
        // 数据库名
        'database'    => 'jxcfast',
        // 数据库用户名
        'username'    => 'root',
        // 数据库密码_
        'password'    => 'root',
        // 数据库编码默认采用utf8
        'charset'     => 'utf8',
        // 数据库表前缀
        'prefix'      => 'fa_',
        // 数据库调试模式
        'debug'       => true,
    ];

    public function memberGroup(){
        return $this->belongsTo('MemberGroup', 'groupid','id','memberGroup','left')->setEagerlyType(0);
    }
    public function memberLevel(){
        return $this->belongsTo('MemberLevel', 'level','id','memberLevel','left')->setEagerlyType(0);
    }
    public function getCredit($member,$credit = 'credit1'){
        if(!is_array($member)){
            $member = $this->where("id",$member)->find();
        }
        if($member['uid']){
            $mc_member = model('McMember')->where('uid',$member['uid'])->find();
        }else{
            $mc_member = [];
        }
        return $mc_member[$credit] ? $mc_member[$credit] : $member[$credit];
    }
}
