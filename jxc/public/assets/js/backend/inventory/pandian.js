define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'inventory/pandian/index',
                    add_url: 'inventory/pandian/add',
                    edit_url: 'inventory/pandian/edit',
                    del_url: 'inventory/pandian/del',
                    multi_url: 'inventory/pandian/multi',
                    table: 'pandian',
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
                        {field: 'stock_id', title: __('Id'),operate:false},
                        {field: 'storage_id', title: __('Storage_id'),visible:false,searchList: Config.storage},
                        {field: 'category_text', title: __('Category'),operate:false},
                        {field: 'name', title: __('Goods_id'),operate:false},
                        {field: 'unit_text', title: __('Unit'),operate:false},
                        {field: 'price', title: __('Price'),operate:false},
                        {field: 'nums', title: __('Num'),operate:false},
                        {field: 'pdnum', title: __('Pdnum'),operate:false},
                        {field: 'cynum', title: __('Cynum'),operate:false},
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
             table.on('click-cell.bs.table',function(u,field,value,row,td){
                if($(td).data('input') == true){
                    return;
                }
                $(td).html('<input id="pdnum"  value="' + $(td).html() + '"/>');
                $(td).data('input',true);
                $('#pdnum').on('blur', function() {  
                    var pdnum = $('#pdnum').val();    
                    $.ajax({
                        url: 'inventory/pandian/editnum',
                        data: {
                            pdnum : pdnum,
                            row :row
                        },
                        dataType: 'json',
                        type: 'POST',
                        success: function(rs){
                             //刷新表格
                            table.bootstrapTable( "refresh");
                        }
                    });
                });  
                // console.log($(td).html());
            });
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