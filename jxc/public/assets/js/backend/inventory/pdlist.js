define(['jquery', 'bootstrap', 'backend', 'table', 'form','printThis'], function ($, undefined, Backend, Table, Form, printThis) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'inventory/pdlist/index',
                    multi_url: 'inventory/pdlist/multi',
                    table: 'pdlist',
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
                        // {checkbox: true},
                        {field: 'storage_id', title: __('Storage_id'),visible:false,searchList: Config.storage},
                        {field: 'name', title: __('Goods_id'),operate:false},
                        {field: 'category_text', title: __('Category'),operate:false},
                        {field: 'supplier_text', title: __('Supplier_id'),operate:false},
                        {field: 'jinjia', title: __('Jinjia'),operate:false},
                        {field: 'price', title: __('Price'),operate:false},
                        {field: 'unit_text', title: __('Unit'),operate:false},
                        {field: 'num', title: __('Num'),operate:false},
                        {field: 'pdnum', title: __('Pdnum'),operate:false},
                        {field: 'cynum', title: __('Cynum'),operate:false},
                        {field: 'start_time', title: __('Start_time'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'end_time', title: __('End_time'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'add_time', title: __('Add_time'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime}
                       
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
                $('.btn-print').on('click',function(){
                $("#table").printThis({
                    debug: false,               // show the iframe for debugging
                    importCSS: true,            // import page CSS
                    importStyle: false,         // import style tags
                    printContainer: true,       // grab outer container as well as the contents of the selector
                    //loadCSS: "path/to/my.css",  // path to additional css file - use an array [] for multiple
                    pageTitle: "",              // add title to print page
                    removeInline: false,        // remove all inline styles from print elements
                    printDelay: 333,            // variable print delay; depending on complexity a higher value may be necessary
                    header: null,               // prefix to html
                    footer: null,               // postfix to html
                    base: false ,               // preserve the BASE tag, or accept a string for the URL
                    formValues: true,           // preserve input/form values
                    canvas: false,              // copy canvas elements (experimental)
                    doctypeString: "...",       // enter a different doctype for older markup
                    removeScripts: false,       // remove script tags from print content
                    copyTagClasses: false       // copy classes from the html & body tag
                });

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