<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:75:"D:\www\jxc\public/../application/admin\view\inventory\xiaoshou\collect.html";i:1526438377;s:53:"D:\www\jxc\application\admin\view\layout\default.html";i:1525765390;s:50:"D:\www\jxc\application\admin\view\common\meta.html";i:1525765390;s:52:"D:\www\jxc\application\admin\view\common\script.html";i:1525765390;}*/ ?>
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
                    <div id="toolbar" class="toolbar">
                        <a href="javascript:;" class="btn btn-primary btn-refresh" title="<?php echo __('Refresh'); ?>" ><i class="fa fa-refresh"></i> </a>
                            <form action="<?php echo url('xiaoshou/search'); ?>" method="post"  id="search_form">
                                <div class="pull-right search" style="width: 13%;float: right;">
                                    <input type="text" class="form-control" name="q" id="keyword" value="" placeholder="商品编码/条形码" style="margin-left: -40px;">
                                    <input type="button" value="提交" onclick="if($.trim($('#keyword').val()) != '') $('#sourch_form').submit();">                            
                                </div>  
                            </form>
                    </div>

                    <table id="table" class="table table-striped table-bordered table-hover"  width="100%">
                        <thead>
                        <tr>
                         <th style="text-align: center; vertical-align: middle; " data-field="sn">
                          <div class="th-inner ">
                           商品编号
                          </div>
                          <div class="fht-cell"></div></th>
                         <th style="text-align: center; vertical-align: middle; " data-field="name">
                          <div class="th-inner ">
                           商品名称
                          </div>
                          <div class="fht-cell"></div></th>
                         <th style="text-align: center; vertical-align: middle; " data-field="price">
                          <div class="th-inner ">
                           商品价格
                          </div>
                          <div class="fht-cell"></div></th>
                         <th style="text-align: center; vertical-align: middle; " data-field="num">
                          <div class="th-inner ">
                           商品数量
                          </div>
                          <div class="fht-cell"></div></th>
                         <th style="text-align: center; vertical-align: middle; " data-field="unit_text">
                          <div class="th-inner ">
                           产品单位
                          </div>
                          <div class="fht-cell"></div></th>
                        </tr>
                       </thead>
                       <tbody data-listidx="0">
                        <tr data-index="0"> 
                         <td style="text-align: center; vertical-align: middle; ">20180511001</td> 
                         <td style="text-align: center; vertical-align: middle; ">森马短袖</td> 
                         <td style="text-align: center; vertical-align: middle; ">150.00</td> 
                         <td style="text-align: center; vertical-align: middle; ">1</td> 
                         <td style="text-align : center; vertical-align: middle; ">件</td> 
                        </tr>
                       </tbody>
                      </table>      

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="/jxc/public/assets/js/require<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js" data-main="/jxc/public/assets/js/require-backend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js?v=<?php echo $site['version']; ?>"></script>
    </body>
</html>