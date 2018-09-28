define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'basic/storage/index',
                    add_url: 'basic/storage/add',
                    edit_url: 'basic/storage/edit',
                    del_url: 'basic/storage/del',
                    multi_url: 'basic/storage/multi',
                    table: 'storage',
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
                                {name: 'cancellation', text: '作废', title: '作废', classname: 'btn btn-xs btn-danger btn-ajax', confirm: '确定要作废吗', url: 'cost/bill/cancellation', success: function(){table.bootstrapTable('refresh', {});}},
                            ],
                            formatter:function(value,row,index){
                                var that = $.extend({}, this);
                                var table = $(that.table).clone(true);
                                if(row.table_id > 0 || row.enabled == 0){
                                    return '';
                                }else{
                                    that.table = table;
                                    return Table.api.formatter.operate.call(that, value, row, index);
                                }
                            }
                        },
                        {field: 'id', title: __('Id'),operate:false},
                        {field: 'sn', title: __('Sn')},
                        {field: 'name', title: __('Name')},
                        {field: 'contact', title: __('Contact')},
                        {field: 'phone', title: __('Phone')},
                        {field: 'address', title: __('Address')},
                        {field: 'status', title: __('Status'), visible:false, searchList: {'0':'正常','1':'废弃'}},
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
            }
        }
    };
    return Controller;
});