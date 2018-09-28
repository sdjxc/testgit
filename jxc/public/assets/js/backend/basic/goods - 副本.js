define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'basic/goods/index',
                    add_url: 'basic/goods/add',
                    edit_url: 'basic/goods/edit',
                    del_url: 'basic/goods/del',
                    multi_url: 'basic/goods/multi',
                    table: 'goods',
                }
            });

            var table = $("#table");

            // 初始化表格
                table.on('post-common-search.bs.table', function (event, table) {
                var form = $("form", table.$commonsearch);
                $("select", form).addClass("selectpicker").data("live-search", "true");
                Form.events.cxselect(form);
                Form.events.selectpicker(form);
                $("form").addClass('nice-validator n-default');
                $("select[name=storage]").on("change",function(){
                    var storage = $("select[name=storage]").val();
                    $.ajax({
                        url: 'basic/location/index',
                        data: {
                            sort: 'id',
                            order: 'desc',
                            offset: 0,
                            filter: JSON.stringify({storage: storage}),
                            op: JSON.stringify({storage: "="}),
                        },
                        dataType: 'json',
                        type: 'get',
                        success: function(rs){
                            $("select[name=location]").html('<option value="">请选择</option>');
                            $.each(rs.rows,function(i,val){
                                $("select[name=location]").append('<option value="' + val.id + '">' + val.name + '</option>');
                            });
                            $("select[name=location]").selectpicker('refresh')
                        }
                    });
                });
            });
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate},
                        {field: 'id', title: __('Id'), operate:false},
                        {field: 'sn', title: __('Sn')},
                        {field: 'name', title: __('Name')},
                        {field: 'category', title: __('Category'),visible:false, searchList: Config.pid},
                        {field: 'category_text', title: __('Category'), operate:false},
                        {field: 'price', title: __('Price'), operate:'BETWEEN'},
                        {field: 'storage', title: __('Storage'),visible:false, searchList: Config.storage},
                        {field: 'storage_text', title: __('Storage'), operate:false},
                        {field: 'location', title: __('Location'), visible:false, searchList: []},
                        {field: 'location_text', title: __('Location'), operate:false},
                        {field: 'supplier', title: __('Supplier'),visible:false, searchList: Config.supplier},
                        {field: 'supplier_text', title: __('Supplier'), operate:false},
                        {field: 'spec', title: __('Spec')},
                        {field: 'unit', title: __('Unit'),visible:false, searchList: Config.unit},
                        {field: 'unit_text', title: __('Unit'), operate:false},
                        {field: 'status', title: __('Status'), visible:false, searchList: {'0':'正常','1':'作废'}},
                        {field: 'status_text', title: __('Status'), operate:false},
                        {field: 'add_time', title: __('Add_time'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
                $("#c-storage").on('change',function(){
                    $("#c-location").html('');
                    $.ajax({
                        url: 'basic/location/index',
                        type: 'GET',
                        data: {
                            sort: 'id',
                            order: 'desc',
                            offset: 0,
                            filter: JSON.stringify({storage: $("#c-storage").val()}),
                            op: JSON.stringify({storage: "="}),
                        },
                        dataType: 'json',
                        success: function(rs){
                            $("#c-location").append("<option value=''></option>");
                            $.each(rs.rows, function(i,val){
                                $("#c-location").append("<option value='" + val.id + "'>" + val.name + "</option>");
                            });
                            $("#c-location").selectpicker('refresh');
                        },  
                    });
                });
            }
        }
    };
    return Controller;
});