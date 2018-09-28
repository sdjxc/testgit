define(['jquery', 'bootstrap', 'backend', 'table', 'form', 'keyboard'], function ($, undefined, Backend, Table, Form, keyboard) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'member/index',
                    table: 'member',
                }

            });

            var table = $("#table");
            table.on('post-common-search.bs.table', function (event, table) {
                var form = $("form", table.$commonsearch);
                $("select", form).addClass("selectpicker").data("live-search", "true");
                Form.events.cxselect(form);
                Form.events.selectpicker(form);
                $("form").addClass('nice-validator n-default');
            });
            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                searchFormVisible: true,
                cardView: false,
                pageList: [10, 25, 50, 100],
                columns: [
                    [
                        {field: 'opreate', title: __('Opreate'), table:table, events: Table.api.events.operate, formatter: Table.api.formatter.operate,
                            buttons: [
                                {name: 'recharge_credit1', text: __('RechargeCredit1'), title: __('RechargeCredit1'), classname: 'btn btn-xs btn-success btn-dialog', url: 'member/recharge_credit1'},
                                {name: 'recharge_credit2', text: __('RechargeCredit2'), title: __('RechargeCredit2'), classname: 'btn btn-xs btn-success btn-dialog', url: 'member/recharge_credit2'},
                            ]
                        },
                        {field: 'realname', title: __('Realname')},
                        {field: 'mobile', title: __('Mobile')},
                        {field: 'createtime', title: __('Createtime'), formatter: Table.api.formatter.datetime, operate: 'BETWEEN',},
                        {field: 'memberGroup.groupname', title: __('Groupname')},
                        {field: 'memberLevel.levelname', title: __('Levelname')},
                        {field: 'credit1', title: __('Credit1')},
                        {field: 'credit2', title: __('Credit2')},
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
            $(".btn-login").removeClass('hide');
            $("input").attr('disabled',true);
            $("#c-mobile").attr('disabled',false);
            $("#c-password").attr('disabled',false);
            $(".btn-login").on('click',function(){
                $.ajax({
                    url: 'member/login',
                    data: {
                        mobile: $("#c-mobile").val(),
                        password: $("#c-password").val()
                    },
                    type: 'POST',
                    dataType: 'JSON',
                    success: function(rs){
                        if(rs.status == 1){
                            Toastr.success('登录成功');
                            $("#c-realname").val(rs.info.realname);
                            $("#c-weixin").val(rs.info.weixin);
                            $("#c-membermobile").val(rs.info.membermobile);
                            $("#c-bank_num").val(rs.info.bank_num);
                            $("#c-bankname").val(rs.info.bankname);
                            $("#c-bank").val(rs.info.bank);
                            $("#c-alipay").val(rs.info.alipay);
                            $("#c-alipayname").val(rs.info.alipayname);
                            $("#c-birthday").val(rs.info.birthday);
                            $('#c-gender').selectpicker('val', rs.info.gender);
                            $.each($("input:radio"),function(i,o){
                                if($(o).val() == rs.info.gender){
                                    $(o).attr('checked','checked');
                                    $(o).addClass('focus');
                                }else{
                                    $(o).attr('checked',false);
                                    $(o).removeClass('focus');
                                }
                            });

                            $("input").attr('disabled',false);
                            $("#c-mobile").attr('readonly',true);
                            $("#c-password").attr('readonly',true);
                            $(".btn-login").addClass('hide');
                        }else{
                            Toastr.error(rs.result);
                        }
                    },
                    error: function(){
                        Toastr.error('登录失败');
                    }
                });
            });
        },
        recharge_credit1: function(){
            Controller.api.bindevent();
        },
        recharge_credit2: function(){
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