define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'return goods/index',
                    add_url: 'return goods/add',
                    edit_url: 'return goods/edit',
                    del_url: 'return goods/del',
                    multi_url: 'return goods/multi',
                    table: 'return goods',
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
                        {field: 'id', title: __('Id')},
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'goods.id', title: __('Goods.id')},
                        {field: 'goods.barcode', title: __('Goods.barcode')},
                        {field: 'goods.sn', title: __('Goods.sn')},
                        {field: 'goods.name', title: __('Goods.name')},
                        {field: 'goods.nbsn', title: __('Goods.nbsn')},
                        {field: 'goods.cjsn', title: __('Goods.cjsn')},
                        {field: 'goods.category', title: __('Goods.category')},
                        {field: 'goods.storage', title: __('Goods.storage')},
                        {field: 'goods.location', title: __('Goods.location')},
                        {field: 'goods.unit', title: __('Goods.unit')},
                        {field: 'goods.supplier', title: __('Goods.supplier')},
                        {field: 'goods.customer', title: __('Goods.customer')},
                        {field: 'goods.spec', title: __('Goods.spec')},
                        {field: 'goods.price', title: __('Goods.price'), operate:'BETWEEN'},
                        {field: 'goods.num', title: __('Goods.num')},
                        {field: 'goods.status', title: __('Goods.status')},
                        {field: 'goods.desc', title: __('Goods.desc')},
                        {field: 'goods.add_time', title: __('Goods.add_time'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
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