define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'inventory/yisun/index',
                    add_url: 'inventory/yisun/add',
                    multi_url: 'inventory/yisun/multi',
                    table: 'yisun',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate,
                        buttons: [
                               {name: 'xgkc', text: '修改库存', title: '修改库存', classname: 'btn btn-xs btn-danger btn-ajax', confirm: '确定要修改库存吗', url: 'inventory/yisun/xgkc', success: function(){table.bootstrapTable('refresh', {});}},
                            ],
                            events: Table.api.events.operate, formatter: Table.api.formatter.operate,
                                formatter:function(value,row,index){
                                var that = $.extend({}, this);
                                var table = $(that.table).clone(true);
                                switch(row.status){
                                    case 0://未入库    
                                        break;
                                    case 1://已入库
                                        $(table).data("operate-xgkc", null);
                                        break;
                                }
                                that.table = table;
                                return Table.api.formatter.operate.call(that, value, row, index);
                            },
                            },
                        {field: 'type', title: __('Type'), visible:false, searchList: {'0':'报损','1':'报溢'}},
                        {field: 'type_text', title: __('Type'),operate:false},
                        {field: 'name', title: __('Goods_id'),operate:false},
                        {field: 'category_text', title: __('Category'),operate:false},
                        {field: 'storage_text', title: __('Storage_id'),operate:false},
                        {field: 'num', title: __('Num')},
                        {field: 'unit_text', title: __('Unit'),operate:false},
                        {field: 'jinjia', title: __('Jinjia')},
                        {field: 'jine', title: __('Jine')},
                        {field: 'barcode', title: __('Barcode')},
                        {field: 'status', title: __('Status'), visible:false, searchList: {'0':'未入库','1':'已入库'}},
                        {field: 'status_text', title: __('Status'),operate:false},
                        {field: 'add_time', title: __('Add_time'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                      
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
            }
        }
    };
    return Controller;
});