<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:67:"D:\www\jxc\public/../application/admin\view\cashregister\index.html";i:1537847819;s:53:"D:\www\jxc\application\admin\view\layout\default.html";i:1525765390;s:50:"D:\www\jxc\application\admin\view\common\meta.html";i:1525765390;s:52:"D:\www\jxc\application\admin\view\common\script.html";i:1525765390;}*/ ?>
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
                                <div class="panel panel-default panel-intro">
    <?php echo build_heading(); ?>
    <div class="panel-body">
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade active in" id="one">
                <div class="widget-body no-padding">
                    <div id="toolbar" class="toolbar" >
                        <a id="setMember" class="btn btn-success <?php echo $auth->check('cashregister/setMember')?'':'hide'; ?>" title="<?php echo __('选择会员'); ?>" ><i class="fa fa-user"></i> <?php echo __('选择会员'); ?></a>
                        <a id="setStorage" class="btn btn-success <?php echo $auth->check('cashregister/setStorage')?'':'hide'; ?>" title="<?php echo __('选择仓库'); ?>" ><i class="fa fa-university"></i> <?php echo __('选择仓库'); ?></a>
                        <a id="addGood" class="btn btn-success <?php echo $auth->check('cashregister/addGood')?'':'hide'; ?>" title="<?php echo __('添加商品'); ?>" ><i class="fa fa-shopping-cart"></i> <?php echo __('添加商品'); ?></a>
                    </div>
                    <div class="pull-right search">
                        <input class="form-control" type="text" id="c-barcode" placeholder="条码">
                    </div>
                    
                    <table id="table" class="table table-striped table-bordered table-hover" width="100%"></table>
                    <div class="row m-t-15 m-b-15">
                        <div class="col-sm-6 col-md-6 col-lg-6 h5" style="font-size: 14px;">共<span class="text-warning bold" id="goods_type_count">0</span>种商品，数量<span class="text-warning bold" id="goods_count">0</span></div>
                        <div class="col-sm-6 col-md-6 col-lg-6 text-right h5" style="font-size: 14px;">合计金额：<span class="text-warning" id="price">0</span></div>
                        <div class="clearfix"></div>
                        <div class="col-sm-12 col-md-4 col-lg-4 text-right h5 p-l-0 pull-right" style="font-size: 14px;">折后金额：<span class="text-warning" id="money">0</span></div>
                        <!-- <div class="clearfix"></div> -->
                        <!-- <div class="col-sm-12 col-md-12 col-lg-12 text-right h5 p-l-0 mfb_Hide" style="font-size: 14px;">合计积分：<span class="text-warning" id="p_hjjf">0</span></div> -->
                        <div class="col-sm-12 col-md-12 col-lg-12 p-r-0" >
                            <div class="h5 col-sm-4 col-md-3 col-lg-1 p-0" style="font-size: 14px;">备　 注：</div>
                            <div class="col-sm-3 col-md-3 col-lg-3 p-l-0">
                                <textarea id="remark" name="remark" rows="2" class="form-control" maxlength="150"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="pull-right">
                        <a id="notCompleted" class="btn btn-danger" title="<?php echo __('未完成订单'); ?>"> <?php echo __('未完成订单'); ?></a>
                        <a id="hangUp" class="btn btn-info" title="<?php echo __('挂单'); ?>" > <?php echo __('挂单'); ?></a>
                        <a id="removeAll" class="btn btn-success" title="<?php echo __('清空'); ?>" > <?php echo __('清空'); ?></a>
                        <a id="submit" class="btn btn-warning" title="<?php echo __('结账'); ?>" > <?php echo __('结账'); ?></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- <input type='text'/>
        <div class="keyboard"></div> -->
    </div>
</div>
<div style="margin-left:200%;">
    <div id="d-ticket" >123123</div>
</div>
<style type="text/css">
.text-warning {
    color: #ff9900;
}
.bold {
    font-weight: bold;
}
.row {
    padding: 1%;
    margin: 1% auto;
    margin-bottom: 1%;
}
textarea.form-control {
    height: 100px;
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