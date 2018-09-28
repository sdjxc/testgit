define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'inventory/xiaoshou/index',
                    add_url: 'inventory/xiaoshou/add',
                    edit_url: 'inventory/xiaoshou/edit',
                    del_url: 'inventory/xiaoshou/del',
                    multi_url: 'inventory/xiaoshou/multi',
                    table: 'xiaoshou',
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
            }
        }
    };
    return Controller;
});