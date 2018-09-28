<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:66:"D:\www\jxc\public/../application/admin\view\inventory\buy\add.html";i:1528084342;s:53:"D:\www\jxc\application\admin\view\layout\default.html";i:1525765390;s:50:"D:\www\jxc\application\admin\view\common\meta.html";i:1525765390;s:52:"D:\www\jxc\application\admin\view\common\script.html";i:1525765390;}*/ ?>
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
                                <form id="add-form" class="form-horizontal" role="form" data-toggle="validator" method="POST" action="">

    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Sn'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-sn" class="form-control" name="row[sn]" type="text"  readonly value="保存后自动生成">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Buyer'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-buyer" class="form-control" name="row[buyer]" type="text" value="">
        </div>
    </div>
    <div class="form-group">
        <label for="c-supplier" class="control-label col-xs-12 col-sm-2"><?php echo __('Supplier'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <select id="c-supplier" data-rule="required" class="form-control selectpicker" name="row[supplier]" value="" >
                <option value="" >请选择</option>
                <?php if(is_array($supplierList) || $supplierList instanceof \think\Collection || $supplierList instanceof \think\Paginator): if( count($supplierList)==0 ) : echo "" ;else: foreach($supplierList as $k=>$v): ?>
                    <option value="<?php echo $k; ?>"><?php echo $v; ?></option>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </select>
        </div>
    </div>
    <table class="table table-striped table-bordered table-hover dataTable no-footer" align="center" style="width: 66%;">
        <thead>
            <tr role="row">
                <th></th>
                <th class="sorting_disabled" rowspan="1" colspan="1">
                    产品名称
                </th>
                <th class="sorting_disabled" rowspan="1" colspan="1">
                    采购数量
                </th>
                 <th class="sorting_disabled" rowspan="1" colspan="1">
                    进价
                </th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <tr role="row" class="odd order-list">
                <td>
                <a href="javascript:void(0);" class="btn btn-success btn-add" title="增加" onclick="add_list(this)" style="position: relative; z-index: 1;">增加</a>
                </td>
                <td style="width: 25%;"> 
                    <select name="goods[]" class="form-control">
                        <?php if(is_array($goodsList) || $goodsList instanceof \think\Collection || $goodsList instanceof \think\Paginator): $i = 0; $__LIST__ = $goodsList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                        <option value="<?php echo $vo['id']; ?>_<?php echo $vo['sn']; ?>_<?php echo $vo['name']; ?>_<?php echo $vo['price']; ?>_<?php echo $vo['unit']; ?>"><?php echo $vo['name']; ?></option>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </select> 
                </td>
                <td><input type="text" class="form-control" value="" name="num[]"></td>
                <td><input type="text" class="form-control" value="" name="purchase[]"></td>
                <td>
                <a href="javascript:void(0)" class="btn btn-sm btn-danger btn-remove" title="删除" onclick="del_list(this)">删除</a>
                </td>
            </tr>

        </tbody>
    </table>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Desc'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <textarea id="c-desc" class="form-control " rows="5" name="row[desc]" cols="50"></textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Add_time'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-add_time" class="form-control datetimepicker" data-date-format="YYYY-MM-DD HH:mm:ss" data-use-current="true" name="row[add_time]" type="text" value="<?php echo date('Y-m-d H:i:s'); ?>">
        </div>
    </div>
    <div class="form-group layer-footer">
        <label class="control-label col-xs-12 col-sm-2"></label>
        <div class="col-xs-12 col-sm-8">
            <button type="submit" class="btn btn-success btn-embossed disabled"><?php echo __('OK'); ?></button>
            <button type="reset" class="btn btn-default btn-embossed"><?php echo __('Reset'); ?></button>
        </div>
    </div>
</form>
<script>

function add_list(obj){
    $(obj).parent().parent().clone().appendTo( $(obj).parent().parent().parent() );
}

function del_list(obj){
    $(obj).parent().parent().remove();
}

</script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="/jxc/public/assets/js/require<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js" data-main="/jxc/public/assets/js/require-backend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js?v=<?php echo $site['version']; ?>"></script>
    </body>
</html>