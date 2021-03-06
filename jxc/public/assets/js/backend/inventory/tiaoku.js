define(['jquery', 'bootstrap', 'backend', 'table', 'form','printThis'], function ($, undefined, Backend, Table, Form, printThis) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'inventory/tiaoku/index',
                    add_url: 'inventory/tiaoku/add',
                    del_url: 'inventory/tiaoku/del',
                    multi_url: 'inventory/tiaoku/multi',
                    table: 'tiaoku',
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
                               {name: 'prints', text: '打印', title: '打印', classname: 'btn btn-xs btn-success btn-dialog', url: 'inventory/tiaoku/prints'},
                               {name: 'details', text: '查看', title: '查看', classname: 'btn btn-xs btn-success btn-dialog', url: 'inventory/tiaoku/details'},
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
                        {field: 'id', title: __('Id'), operate:false},
                        {field: 'sn', title: __('Sn'), operate:false},
                        {field: 'author', title: __('Author')},
                        {field: 'type_text', title: __('Type'), operate:false},
                        {field: 'storage', title: __('Storage'),visible:false,searchList: Config.storage},
                        {field: 'storage_text', title: __('Storage'), operate:false},
                        {field: 'storageru', title: __('Storageru'),visible:false,searchList: Config.storage},
                        {field: 'storageru_text', title: __('Storageru'), operate:false},
                        {field: 'state_text', title: __('State'), operate:false},
                        {field: 'add_time', title: __('Add_time'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
            $(".btn-tiao").on("click",function(){
                $("#c-type").removeAttr("disabled");
            });
        },
        edit: function () {
            Controller.api.bindevent();
        },
        prints: function () {
            Controller.api.bindevent();
            $('.btn-print').on('click',function(){
                $("#prints-form").printThis({
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
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});