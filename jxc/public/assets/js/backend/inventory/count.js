define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init();
            
            //绑定事件
            $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                var panel = $($(this).attr("href"));
                if (panel.size() > 0) {
                    Controller.table[panel.attr("id")].call(this);
                    $(this).on('click', function (e) {
                        $($(this).attr("href")).find(".btn-refresh").trigger("click");
                    });
                }
                //移除绑定的事件
                $(this).unbind('shown.bs.tab');
            });
            
            //必须默认触发shown.bs.tab事件
            $('ul.nav-tabs li.active a[data-toggle="tab"]').trigger("shown.bs.tab");
        },
        table: {
            first: function () {
                // 表格1
                var table1 = $("#table1");
                table1.bootstrapTable({
                    url: 'inventory/count/table1',
                    toolbar: '#toolbar1',
                    sortName: 'id',
                    search: false,
                    columns: [
                        [
                            {field: 'id', title: __('Id'), operate:false},
                            {field: 'sn', title: __('Sn')},
                            {field: 'buyer', title: __('Buyer')},
                            {field: 'goodsxin.goods_name', title: __('Goods_name')},
                            {field: 'goodsxin.goods_purchase', title: __('Goods_purchase')},
                            {field: 'goodsxin.goods_price', title: __('Goods_price')},
                            {field: 'goodsxin.goods_num', title: __('Goods_num')},
                            {field: 'supplier', title: __('Supplier'),visible:false, searchList: Config.supplier},
                            {field: 'supplier_text', title: __('Supplier'), operate:false},
                            {field: 'state', title: __('State'), visible:false, searchList: {'0':'未到货','1':'已到货','2':'已入库','3':'已作废','4':'已退货'}},
                            {field: 'state_text', title: __('State'), operate:false},
                            {field: 'add_time', title: __('Add_time'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime}
                        ]
                    ]
                });

                // 为表格1绑定事件
                Table.api.bindevent(table1);
            },
            second: function () {
                // 表格2
                var table2 = $("#table2");
                table2.bootstrapTable({
                    url: 'inventory/count/table2',
                    extend: {
                        index_url: '',
                        add_url: '',
                        edit_url: '',
                        del_url: '',
                        multi_url: '',
                        table: '',
                    },
                    toolbar: '#toolbar2',
                    sortName: 'id',
                    search: false,
                    columns: [
                        [
                            {field: 'id', title: __('Id'), operate:false},
                            {field: 'sn', title: __('Sn')},
                            {field: 'buyer', title: __('Buyer')},
                            {field: 'goodsxin.goods_name', title: __('Goods_name')},
                            {field: 'goodsxin.goods_purchase', title: __('Goods_purchase')},
                            {field: 'goodsxin.goods_price', title: __('Goods_price')},
                            {field: 'goodsxin.goods_num', title: __('Goods_num')},
                            {field: 'supplier', title: __('Supplier'),visible:false, searchList: Config.supplier},
                            {field: 'supplier_text', title: __('Supplier'), operate:false},
                            {field: 'state', title: __('State'), visible:false, searchList: {'0':'未到货','1':'已到货','2':'已入库','3':'已作废','4':'已退货'}},
                            {field: 'state_text', title: __('State'), operate:false},
                            {field: 'add_time', title: __('Add_time'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime}
                        ]
                    ]
                });

                // 为表格2绑定事件
                Table.api.bindevent(table2);
            },
            third: function () {
                // 表格3
                var table3 = $("#table3");
                table3.bootstrapTable({
                    url: 'inventory/count/table3',
                    extend: {
                        index_url: '',
                        add_url: '',
                        edit_url: '',
                        del_url: '',
                        multi_url: '',
                        table: '',
                    },
                    toolbar: '#toolbar3',
                    sortName: 'id',
                    search: false,
                    columns: [
                        [
                            {field: 'id', title: __('Id'), operate:false},
                            {field: 'sn', title: __('Sn')},
                            {field: 'buyer', title: __('Buyer')},
                            {field: 'goodsxin.goods_name', title: __('Goods_name')},
                            {field: 'goodsxin.goods_purchase', title: __('Goods_purchase')},
                            {field: 'goodsxin.goods_price', title: __('Goods_price')},
                            {field: 'goodsxin.goods_num', title: __('Goods_num')},
                            {field: 'supplier', title: __('Supplier'),visible:false, searchList: Config.supplier},
                            {field: 'supplier_text', title: __('Supplier'), operate:false},
                            {field: 'state', title: __('State'), visible:false, searchList: {'0':'未到货','1':'已到货','2':'已入库','3':'已作废','4':'已退货'}},
                            {field: 'state_text', title: __('State'), operate:false},
                            {field: 'add_time', title: __('Add_time'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime}
                        ]
                    ]
                });

                // 为表格3绑定事件
                Table.api.bindevent(table3);
            },
            fourth: function () {
                // 表格4
                var table4 = $("#table4");
                table4.bootstrapTable({
                    url: 'inventory/count/table4',
                    extend: {
                        index_url: '',
                        add_url: '',
                        edit_url: '',
                        del_url: '',
                        multi_url: '',
                        table: '',
                    },
                    toolbar: '#toolbar4',
                    sortName: 'id',
                    search: false,
                    columns: [
                        [
                        {field: 'storage_id', title: __('Storage_id'),visible:false,searchList: Config.storage},
                        {field: 'goods.name', title: __('Goods_id'),operate:false},
                        {field: 'goods.category', title: __('Category'),operate:false},
                        {field: 'supplier_text', title: __('Supplier_id'),operate:false},
                        {field: 'jinjia', title: __('Jinjia'),operate:false},
                        {field: 'goods.price', title: __('Price'),operate:false},
                        {field: 'goods.unit', title: __('Unit'),operate:false},
                        {field: 'num', title: __('Num'),operate:false},
                        {field: 'pdnum', title: __('Pdnum'),operate:false},
                        {field: 'cynum', title: __('Cynum'),operate:false},
                        {field: 'start_time', title: __('Start_time'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'end_time', title: __('End_time'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        ]
                    ]
                });

                // 为表格4绑定事件
                Table.api.bindevent(table4);
            }
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
            },
        }
    };
    return Controller;
});