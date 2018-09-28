<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:68:"D:\www\jxc\public/../application/admin\view\cashregister\submit.html";i:1538095842;s:53:"D:\www\jxc\application\admin\view\layout\default.html";i:1525765390;s:50:"D:\www\jxc\application\admin\view\common\meta.html";i:1525765390;s:52:"D:\www\jxc\application\admin\view\common\script.html";i:1525765390;}*/ ?>
<!DOCTYPE html>
<html lang="<?php echo $config['language']; ?>">
    <head>
        <meta charset="utf-8">
<title><?php echo (isset($title) && ($title !== '')?$title:''); ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="renderer" content="webkit">

<link rel="shortcut icon" href="/jxc/public/assets/img/favicon.ico" />
<!-- Loading Bootstrap -->
<link href="/jxc/public/assets/css/backend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.css?v=<?php echo \think\Config::get('site.version'); ?>" rel="stylesheet">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
<!--[if lt IE 9]>
  <script src="/jxc/public/assets/js/html5shiv.js"></script>
  <script src="/jxc/public/assets/js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
    var require = {
        config:  <?php echo json_encode($config); ?>
    };
</script>
    </head>

    <body class="inside-header inside-aside <?php echo defined('IS_DIALOG') && IS_DIALOG ? 'is-dialog' : ''; ?>">
        <div id="main" role="main">
            <div class="tab-content tab-addtabs">
                <div id="content">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <section class="content-header hide">
                                <h1>
                                    <?php echo __('Dashboard'); ?>
                                    <small><?php echo __('Control panel'); ?></small>
                                </h1>
                            </section>
                            <?php if(!IS_DIALOG): ?>
                            <!-- RIBBON -->
                            <div id="ribbon">
                                <ol class="breadcrumb pull-left">
                                    <li><a href="dashboard" class="addtabsit"><i class="fa fa-dashboard"></i> <?php echo __('Dashboard'); ?></a></li>
                                </ol>
                                <ol class="breadcrumb pull-right">
                                    <?php foreach($breadcrumb as $vo): ?>
                                    <li><a href="javascript:;" data-url="<?php echo $vo['url']; ?>"><?php echo $vo['title']; ?></a></li>
                                    <?php endforeach; ?>
                                </ol>
                            </div>
                            <!-- END RIBBON -->
                            <?php endif; ?>
                            <div class="content">
                                <div class="payment text-center" onselectstart="return false;" style="-moz-user-select: none;">
    <ul id="pay_ul">
        <li data-pay="cash" id="payCash" class="active"><i class="fa fa-check"></i>&nbsp;现金</li>
        <li data-pay="balance" id="payBalance"><i class="fa fa-check"></i>&nbsp;余额</li>
        <li data-pay="bank" id="payBank" ><i class="fa fa-check"></i>&nbsp;银行卡</li>
        <li data-pay="alipay" id="payAlipay" ><i class="fa fa-check"></i>&nbsp;支付宝</li>
        <li data-pay="wechat" id="payWeChat"><i class="fa fa-check"></i>&nbsp;微信</li>
        <li data-pay="join" id="joinPay" style="border-right: 0px solid #2b9ac9;"><i class="fa fa-check"></i>&nbsp;联合支付</li>
    </ul>
</div>
<form id="form" class="form-horizontal form-ajax" role="form" data-toggle="validator" method="POST" action="" >
    <div class="form-group" style="margin-top:20px;">
        <label class="control-label col-xs-12 col-sm-2">应付金额:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="money" class="form-control" type="text" value="<?php echo $money; ?>" readonly>
        </div>
    </div>
    <div class="form-group div-money" id="d-cash">
        <label for="c-cash" class="control-label col-xs-12 col-sm-2">现金:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-cash" name="cash" class="form-control" type="text" value="<?php echo $money; ?>">
        </div>
    </div>
    <div class="form-group div-money" id="d-balance" style="display: none;">
        <label for="c-balance" class="control-label col-xs-12 col-sm-2">余额:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-balance" name="balance" class="form-control" type="text" value="<?php echo $money; ?>">
            <span>当前余额：</span><span style="color: red" id="credit2"><?php echo $member['credit2']; ?></span>
        </div>
    </div>
    <div class="form-group div-money" id="d-bank" style="display: none;">
        <label for="c-bank" class="control-label col-xs-12 col-sm-2">银行卡:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-bank" name="bank" class="form-control" type="text" value="<?php echo $money; ?>">
        </div>
    </div>
    <div class="form-group div-money" id="d-alipay" style="display: none;">
        <label for="c-alipay" class="control-label col-xs-12 col-sm-2">支付宝:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-alipay" name="alipay" class="form-control" type="text" value="<?php echo $money; ?>">
        </div>
    </div>
    <div class="form-group div-money" id="d-wechat" style="display: none;">
        <label for="c-wechat" class="control-label col-xs-12 col-sm-2">微信:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-wechat" name="wechat" class="form-control" type="text" value="<?php echo $money; ?>">
        </div>
    </div>
    <div class="form-group" id="d-change" >
        <label for="c-change" class="control-label col-xs-12 col-sm-2">找零:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-change" class="form-control" type="text" value="0" readonly>
        </div>
    </div>
    
    <div class="form-group hidden layer-footer">
        <label class="control-label col-xs-12 col-sm-2"></label>
        <div class="col-xs-12 col-sm-8">
            <button type="reset" class="btn btn-primary btn-embossed btn-close" onclick="Layer.closeAll();"><?php echo __('Close'); ?></button>
            <button type="button" class="btn btn-success btn-callback"><?php echo __('保存'); ?></button>
            <button type="button" class="btn btn-info" id="b-ticket"><i class="fa fa-check"></i>&nbsp;<?php echo __('打印小票'); ?></button>
        </div>
    </div>
</form>

<style type="text/css">
    .payment {
        border: 1px solid #2b9ac9;
        height: 40px;
        width: 63%;
        background: #f1f1f1;
        line-height: 39px;
        font-size: 14px;
        margin-left:18%;
    }
    .text-center {
        text-align: center;
    }
    ul, li {
        list-style: none;
        padding: 0;
        margin: 0;
    }
    .payment ul li.active {
        color: #fff;
        border-right: 1px solid #2b9ac9;
        background: #2b9ac9;
    }
    .payment ul li.join {
        color: #fff;
        border-right: 1px solid #2b9a19;
        background: #2b9a19;
    }
    .payment ul li {
        padding: 0;
        cursor: pointer;
        float: left;
        width: 16.66%;
        text-align: center;
        border-right: 1px solid #2b9ac9;
    }
</style>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="/jxc/public/assets/js/require<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js" data-main="/jxc/public/assets/js/require-backend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js?v=<?php echo $site['version']; ?>"></script>
    </body>
</html>