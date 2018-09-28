<?php

namespace app\admin\model;

use think\Model;

class McMember extends Model
{
    // 表名
    protected $name = 'members';

    protected $connection = [
        // 数据库类型
        'type'        => 'mysql',
        // 服务器地址
        'hostname'    => '127.0.0.1',
        // 数据库名
        'database'    => 'fenxiao',
        // 数据库用户名
        'username'    => 'root',
        // 数据库密码
        'password'    => 'root',
        // 数据库编码默认采用utf8
        'charset'     => 'utf8',
        // 数据库表前缀
        'prefix'      => 'ims_mc_',
        // 数据库调试模式
        'debug'       => true,
    ];

}
