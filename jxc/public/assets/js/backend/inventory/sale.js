define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'inventory/sale/index',
                    add_url: 'inventory/sale/add',
                    edit_url: 'inventory/sale/edit',
                    del_url: 'inventory/sale/del',
                    multi_url: 'inventory/sale/multi',
                    table: 'sale',
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
                        {field: 'member_id', title: __('Member_id'), visible:false},
                        {field: 'realname', title: __('Member_id'), operate:false},
                        {field: 'storage_id', title: __('Storage_id'),visible:false,searchList: Config.storage},
                        {field: 'storage_text', title: __('Storage_id'), operate:false},
                        {field: 'price', title: __('Price'), operate:false},
                        {field: 'money', title: __('Money'), operate:false},
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'updatetime', title: __('Updatetime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
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