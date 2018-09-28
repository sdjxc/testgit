define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'membe/index',
                    add_url: 'membe/add',
                    edit_url: 'membe/edit',
                    del_url: 'membe/del',
                    multi_url: 'membe/multi',
                    table: 'membe',
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
                        {field: 'user', title: __('User')},
                        {field: 'pass', title: __('Pass')},
                        {field: 'name', title: __('Name')},
                        {field: 'wx', title: __('Wx')},
                        {field: 'yhkh', title: __('Yhkh')},
                        {field: 'khh', title: __('Khh')},
                        {field: 'zfy', title: __('Zfy')},
                        {field: 'zfbname', title: __('Zfbname')},
                        {field: 'sex', title: __('Sex'), visible:false, searchList: {"\u7537":__('\u7537'),"\u5973":__('\u5973')}},
                        {field: 'sex_text', title: __('Sex'), operate:false},
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