define(['jquery', 'bootstrap', 'backend', 'table', 'form', 'keyboard', 'printThis'], function ($, undefined, Backend, Table, Form, keyboard, printThis) {

    var Controller = {
        //首页进入事件
        index: function () {
            //初始化下边要用的变量
            var table = $("#table");
            var member = {
                id: 0,
                mobile: '',
                memberLevel: {
                    discount:10,
                },
            };
            var storage = '';
            var storage_id = 0;
            var data = [];
            var thiz = this;
            var price = 0;
            var money = 0;
            var goods_count = 0;
            var goods_type_count = 0;
            Table.api.init({
                extend: {
                    table: 'table',
                }
            });
            // 初始化表格
            table.bootstrapTable({
                data: data,
                search: false,
                showExport: false,
                commonSearch: false,
                showToggle: false,
                showColumns: false,
                columns: [
                    [
                        {field: 'sn', title: __('商品编号'), operate:false},
                        {field: 'name', title: __('商品名称')},
                        {field: 'spec', title: __('规格')},
                        {field: 'number', title: __('数量')},
                        {field: 'price', title: __('单价')},
                        {field: 'discount', title: __('折扣')},
                        {field: 'money', title: __('金额')},
                        {field: 'operate', title: __('Operate'), table: table,
                            buttons:[
                                {name: 'remove', text: __('删除'), title: __('删除'), classname: 'btn btn-xs btn-danger btn-remove'},
                            ],
                            events: Table.api.events.operate, formatter: Table.api.formatter.operate,
                        },
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);

            
            //选择会员按钮点击事件
            $("#setMember").on('click',function(){
                var that = this;
                //打开dialog弹窗，绑定选择会员的回调事件
                Fast.api.open('cashregister/setmember/mobile/' + member.mobile,'选择会员',{
                    callback: function(rs){
                        //回调：按照选择结果修改当前选择的会员，并清空表格
                        $(that).html('<i class="fa fa-user"></i>会员:' + rs.realname);
                        member = rs;
                        data = [];
                        table.bootstrapTable('removeAll');
                        table.bootstrapTable('append', data);
                        
                    },
                });
            });

            //选择仓库按钮点击事件
            $("#setStorage").on('click',function(){
                var that = this;
                //打开dialog弹窗，绑定选择仓库的回调事件
                Fast.api.open('cashregister/setstorage/storage/' + storage,'选择仓库',{
                    callback: function(rs){
                        //回调：按照选择结果修改当前选择的仓库，并清空表格
                        $(that).html('<i class="fa fa-university"></i>仓库:' + rs.name);
                        storage_id = rs.id;
                        storage = rs.sn;
                        data = [];
                        table.bootstrapTable('removeAll');
                        table.bootstrapTable('append', data);
                    },
                });
            });

            //添加商品按钮点击事件
            $("#addGood").on('click',function(){
                //如果没选仓库则提示先选仓库
                if(storage_id == 0){
                    Toastr.error('请先选择出货仓库');
                    return;
                }
                //打开dialog弹窗，绑定添加商品的回调事件
                Fast.api.open('cashregister/addgood/storage_id/' + storage_id,'添加商品',{
                    callback: function(rs){
                        //如果表格里已经有这个商品了，就给这个商品数量+1，否则就新添加一条
                        var isOld = false;
                        $.each(data,function(i,row){
                            if(row.id == rs.id){
                                row.number = Number(row.number) + 1;
                                row.money = Number(row.money) + (row.price * row.discount * 0.1);
                                isOld = true;
                            }
                        });
                        if(isOld == false){
                            rs.number = 1;
                            rs.discount = member.memberLevel.discount;
                            rs.money = rs.price * rs.discount * 0.1;
                            data.push(rs); 
                        }
                                               
                        table.bootstrapTable('removeAll');
                        table.bootstrapTable('append', data);
                    },
                });
            });

            //已添加商品列表里的删除按钮点击事件
            $(document).on('click',".btn-remove",function(){
                //根据按钮所在对象，获取当前是第几条数据
                var index = $(this).data('rowIndex');
                //如果只有一个了，就整个元素删掉，否则（大于1个）就给数量-1
                if(data[index].number == 1){
                    data.splice(index,1);
                }else{
                    data[index].money = data[index].money - (data[index].money / data[index].number);
                    data[index].number -= 1;

                }
                table.bootstrapTable('removeAll');
                table.bootstrapTable('append', data);
            });

            //条码输入框按回车的事件（扫码完成添加商品）
            $("#c-barcode").on('keydown',function(event){
                if(event.keyCode == 13){//回车码是13
                    //如果没有选择仓库，提示先选仓库
                    if(storage_id == 0){
                        Toastr.error('请先选择出货仓库');
                        return;
                    }
                    //根据仓库id和条码去找商品
                    $.ajax({
                        url: 'inventory/stock/index',
                        data: {
                            sort: 'id',
                            order: 'desc',
                            offset: '0',
                            limit: 1,
                            filter: JSON.stringify({"barcode": $("#c-barcode").val(),"storage_id": storage_id}),
                            op: JSON.stringify({"barcode": "=","storage_id": "="})
                        },
                        type: 'GET',
                        dataType: 'JSON',
                        success: function(rs){
                            if(rs.total == 0){
                                Toastr.error('未在该仓库找到指定商品');
                                return false;
                            }
                            rs = rs.rows[0];
                            //如果列表里已经有，就给数量+1，否则就新添一条
                            var isOld = false;
                            $.each(data,function(i,row){
                                if(row.id == rs.id){
                                    row.number = Number(row.number) + 1;
                                    row.money = Number(row.money) + (row.price * row.discount * 0.1);
                                    isOld = true;
                                }
                            });
                            if(isOld == false){
                                rs.number = 1;
                                rs.discount = member.memberLevel.discount;
                                rs.money = rs.price * rs.discount * 0.1;
                                data.push(rs); 
                            }
                            //刷新表格
                            table.bootstrapTable('removeAll');
                            table.bootstrapTable('append', data);
                        }
                    });
                    //清空条码框
                    $("#c-barcode").val('');
                }
            });

            //挂单点击事件
            $("#hangUp").on('click',function(){
                //打开dialog弹窗，输入手牌号，绑定回调事件
                Fast.api.open('cashregister/hangup','挂单',{
                    callback: function(rs){
                        //把手牌号、当前页面的所有信息（会员、仓库、表格内容）全部递交给后台
                        $.ajax({
                            url: 'cashregister/hangup',
                            data: {
                                data: data,
                                code: rs,
                                member_id: member.id,
                                storage_id: storage_id,
                                price: price,
                                money: money,
                                remark: $("#remark").val(),
                            },
                            type: 'POST',
                            dataType : 'JSON',
                            success: function(result){
                                //保存成功之后，清空当前页面
                                data = [];
                                member = {
                                    id: 0,
                                    mobile: '',
                                    memberLevel: {
                                        discount:10,
                                    },
                                };
                                storage_id = 0;
                                storage = '';
                                table.bootstrapTable('removeAll');
                                $("#setMember").html('<i class="fa fa-user"></i> 选择会员');
                                $("#setStorage").html('<i class="fa fa-university"></i> 选择仓库');
                                $("#remark").val('');
                            }
                        });
                    }
                });
            });

            //未完成订单点击事件
            $("#notCompleted").on('click',function(){
                var that = this;
                //打开dialog弹窗，绑定选择的回调事件
                Fast.api.open('cashregister/notCompleted','未完成订单',{
                    callback: function(rs){
                        //回调：按照选择结果修改当前选择的页面，并刷新表格
                        //设置data
                        data = JSON.parse(rs.data);
                        //根据会员id获取会员详细信息，存入变量、显示到页面上
                        if(rs.member_id > 0){
                            $.ajax({
                                url: 'member/index',
                                type: 'GET',
                                dataType: 'JSON',
                                data: {
                                    filter: JSON.stringify({"id": rs.member_id}),
                                    op: JSON.stringify({"id": "="})
                                },
                                success: function(result){
                                    member = result.rows[0];
                                    $("#setMember").html('<i class="fa fa-user"></i>会员:' + result.rows[0].realname);
                                }
                            });
                        }
                        
                        //根据仓库id获取仓库详细信息，存入变量、显示到页面上
                        $.ajax({
                            url: 'basic/storage/index',
                            type: 'GET',
                            dataType: 'JSON',
                            data: {
                                filter: JSON.stringify({"id": rs.storage_id}),
                                op: JSON.stringify({"id": "="})
                            },
                            success: function(result){
                                storage = result.rows[0].sn;
                                storage_id = result.rows[0].id;
                                $("#setStorage").html('<i class="fa fa-university"></i>仓库:' + result.rows[0].name);
                            }
                        });

                        //删除这个挂单的订单
                        $.ajax({
                            url: 'inventory/sale/del',
                            type: 'GET',
                            dataType: 'JSON',
                            data: {
                                ids: rs.id
                            }
                        });
                        //刷新表格
                        table.bootstrapTable('removeAll');
                        table.bootstrapTable('append', data);
                    },
                });
            });


            //清空按钮点击事件
            $("#removeAll").on('click',function(){
                Layer.confirm('确定要清空吗', function (index) {
                    data = [];
                    member = {
                        id: 0,
                        mobile: '',
                        memberLevel: {
                            discount:10,
                        },
                    };
                    storage_id = 0;
                    storage = '';
                    table.bootstrapTable('removeAll');
                    $("#setMember").html('<i class="fa fa-user"></i> 选择会员');
                    $("#setStorage").html('<i class="fa fa-university"></i> 选择仓库');
                    $("#remark").val('');
                    Layer.close(index);
                });
            });
            
            //结账点击事件
            $("#submit").on('click',function(){
                var sub_price = 0;
                var sub_money = 0;
                var sub_goods_count = 0;
                var sub_goods_type_count = 0;
                $.each(data,function(i,o){
                    sub_price = Number(sub_price) + Number(o.price) * Number(o.number);
                    sub_money = Number(sub_money) + Number(o.money);
                    sub_goods_count = Number(sub_goods_count) + Number(o.number);
                    sub_goods_type_count = Number(sub_goods_type_count) + 1;
                });
                price = sub_price;
                money = sub_money;
                goods_count = sub_goods_count;
                goods_type_count = sub_goods_type_count;
                if(goods_count == 0){
                    Toastr.error('未选择商品');
                    return false;
                }
                //console.log(money);
                Fast.api.open('cashregister/submit/money/' + money + "/member_id/" + member.id,'结账',{
                    callback: function(rs){
                        rs.data = data;
                        rs.money = money;
                        rs.member_id = member.id;
                        rs.remark = $("#remark").val();
                        $.ajax({
                            url: 'cashregister/submit',
                            type: 'POST',
                            dataType: 'JSON',
                            data: rs,
                            success: function(result){
                                //console.log(result);
                                if(result.code == 1){
                                    Toastr.success('结账成功');
                                    //打印小票
                                    if(rs.ticket == true){
                                        $.ajax({
                                        url: Config.__PUBLIC__ + 'assets/libs/ticket/ticket.html',
                                        type: 'GET',
                                        dataType: 'text',
                                        success: function(ticket){
                                            $("#d-ticket").html(ticket);
                                            $("#t-order_id").html(result.data.id);
                                            $("#t-order_price").html(result.data.price);
                                            $("#t-member_mobile").html(member.mobile);
                                                $("#t-member_credit2").html(result.data.credit2);
                                                $("#t-time").html(result.data.time);
                                                $("#t-price").html(price);
                                                $("#t-money").html(money);
                                                $.each($.parseJSON(result.data.data),function(i,o){
                                                    //console.log(o);
                                                    var html =  "<div>"
                                                                +   "<li>" + o.sn + "</li>"
                                                                +   "<li>" + o.number + "</li>"
                                                                +   "<li>" + o.price + "</li>"
                                                                +   "<li>" + o.money + "</li>"
                                                                + "</div>"
                                                                + "<div>" + o.name + "</div>";
                                                    $(html).insertAfter("#t-goods");
                                                });
                                                $("#d-ticket").printThis();
                                                

                                            }
                                        });
                                    }
                                    
                                    //清空
                                    data = [];
                                    member = {
                                        id: 0,
                                        mobile: '',
                                        memberLevel: {
                                            discount:10,
                                        },
                                    };
                                    storage_id = 0;
                                    storage = '';
                                    table.bootstrapTable('removeAll');
                                    $("#setMember").html('<i class="fa fa-user"></i> 选择会员');
                                    $("#setStorage").html('<i class="fa fa-university"></i> 选择仓库');
                                    $("#remark").val('');   
                                }else{
                                    Toastr.error('结账失败');
                                }
                            }

                        });
                    }
                });
                
            });

            //绑定控制器事件
            Controller.api.bindevent();

            //设置定时器，如果当前没有dialog打开，就周期性的给条码的输入框获取焦点，方便扫码
            setInterval(function(){
                if($(".layui-layer-fast").html() == undefined){//没有dialog打开
                    if($("#c-barcode").is(":focus") == false){//条码框没有被选中
                        if($("#remark").is(":focus") == false){//备注框没有被选中
                            $("#c-barcode").focus();
                        }
                    }
                }
                price = 0;
                money = 0;
                goods_count = 0;
                goods_type_count = 0;
                $.each(data,function(i,o){
                    price = Number(price) + Number(o.price) * Number(o.number);
                    money = Number(money) + Number(o.money);
                    goods_count = Number(goods_count) + Number(o.number);
                    goods_type_count = Number(goods_type_count) + 1;
                });
                $("#price").html(price);
                $("#money").html(money);
                $("#goods_count").html(goods_count);
                $("#goods_type_count").html(goods_type_count);
                $(".pagination-info").remove();
            },2000);
        },
        setmember: function (){
            Table.api.init({
                extend: {
                    index_url: 'member/index',
                    table: 'table',
                }
            });
            var table = $("#table");
            var flag = true;
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                search: false,
                showExport: false,
                commonSearch: false,
                showToggle: false,
                showColumns: false,
                columns: [
                    [
                        {field: 'realname', title: __('Realname')},
                        {field: 'mobile', title: __('Mobile')},
                    ]
                ]
            });
            table.on('click-row.bs.table',function(object,row,element) {
                Fast.api.close(row);
            });
            $("#c-mobile").on('change',function(){
                if(flag == false){
                    return false;
                }
                flag = false;
                var options = table.bootstrapTable('getOptions');
                options.pageNumber = 1;
                options.queryParams = function (params) {
                    params.filter = JSON.stringify({'mobile|membermobile|weixin': $("#c-mobile").val()});
                    params.op = JSON.stringify({'mobile|membermobile|weixin': 'LIKE'});
                    return params;
                };
                table.bootstrapTable('refresh', {});
                table.one('load-success.bs.table',function(){
                    flag = true;
                });
            });
            Controller.api.bindevent();
            $("#c-mobile").trigger('change');
        },
        setstorage: function (){

            Table.api.init({
                extend: {
                    index_url: 'basic/storage/index',
                    table: 'table',
                }
            });
            var table = $("#table");
            var flag = true;
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                search: false,
                showExport: false,
                commonSearch: false,
                showToggle: false,
                showColumns: false,
                columns: [
                    [
                        {field: 'sn', title: __('Sn')},
                        {field: 'name', title: __('Name')},
                        {field: 'phone', title: __('Phone')},
                    ]
                ]
            });
            table.on('click-row.bs.table',function(object,row,element) {
                Fast.api.close(row);
            });
            $("#c-storage").on('change',function(){
                if(flag == false){
                    return false;
                }
                flag = false;
                var options = table.bootstrapTable('getOptions');
                options.pageNumber = 1;
                options.queryParams = function (params) {
                    params.filter = JSON.stringify({'sn|phone': $("#c-storage").val()});
                    params.op = JSON.stringify({'sn|phone': 'LIKE'});
                    return params;
                };
                table.bootstrapTable('refresh', {});
                table.one('load-success.bs.table',function(){
                    flag = true;
                });
            });
            Controller.api.bindevent();
            $("#c-storage").trigger('change');
        },
        addgood: function (){
            Table.api.init({
                extend: {
                    index_url: 'inventory/stock/index',
                    table: 'table',
                }
            });
            var table = $("#table");
            var flag = true;
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                search: false,
                showExport: false,
                commonSearch: false,
                showToggle: false,
                showColumns: false,
                columns: [
                    [
                        {field: 'name', title: __('商品名称'),operate:false},
                        {field: 'category_text', title: __('商品类别'),operate:false},
                        {field: 'supplier_text', title: __('供应商'),operate:false},
                        {field: 'price', title: __('价格'),operate:false},
                        {field: 'nums', title: __('数量'),operate:false},
                        {field: 'unit_text', title: __('单位'),operate:false},
                    ]
                ]
            });
            table.on('click-row.bs.table',function(object,row,element) {
                Fast.api.close(row);
            });
            $("#c-good").on('change',function(){
                if(flag == false){
                    return false;
                }
                flag = false;
                var options = table.bootstrapTable('getOptions');
                options.pageNumber = 1;
                options.queryParams = function (params) {
                    params.filter = JSON.stringify({'sn|barcode': $("#c-good").val(),'storage_id': Config.storage_id});
                    params.op = JSON.stringify({'sn|barcode': 'LIKE','storage_id': '='});
                    return params;
                };
                table.bootstrapTable('refresh', {});
                table.one('load-success.bs.table',function(){
                    flag = true;
                });
            });
            Controller.api.bindevent();
            $("#c-good").trigger('change');
        },
        notcompleted: function(){
            Table.api.init({
                extend: {
                    index_url: 'inventory/sale/index',
                    del_url: 'inventory/sale/del',
                    table: 'pandian',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                showExport: false,
                commonSearch: false,
                showToggle: false,
                showColumns: false,
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                queryParams: function (params) {
                    params.filter = JSON.stringify({'status': 1});
                    params.op = JSON.stringify({'status': '='});
                    return params;
                },
                columns: [
                    [
                        {field: 'code', title: __('Code')},
                        {field: 'realname', title: __('Realname')},
                        {field: 'price', title: __('Price')},
                        {field: 'money', title: __('Money')},
                        {field: 'remark', title: __('Remark')},
                        {field: 'operate', title: __('Operate'), table: table,
                            buttons:[
                                {name: 'check', text: __('选择'), title: __('选择'), classname: 'btn btn-xs btn-success btn-check'},
                            ],
                            events: Table.api.events.operate, formatter: Table.api.formatter.operate,
                        },
                    ]
                ]
            });

            //未完成列表点击选择事件
            $(document).on('click',".btn-check",function(){
                //根据按钮所在对象，获取当前是第几条数据
                var index = $(this).data('rowIndex');
                var data = table.bootstrapTable('getData', 'useCurrentPage');
                Fast.api.close(data[index]);
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        submit: function(){
            var pay = ['cash'];
            var join = false;
            var ticket = true;
            var moneyList = new Object();
            $("#pay_ul li i").hide();
            $(".active i").show();
            $("#credit2").html(Number($("#credit2").html()));
            $("#pay_ul li").on('click',function(){
                //如果点击的是联合支付按钮  联合支付样式响应
                if($(this).data('pay') == 'join'){
                    if(join == false){
                        join = true;
                        $(this).addClass('join')
                        $(this).find("i").show();
                    }else{
                        join = false;
                        $(this).removeClass('join');
                        $(this).find("i").hide();
                        //如果取消联合支付，就把所有的其他选项都取消选中
                        $(this).siblings().removeClass('active');
                        $(this).siblings().find("i").hide();
                        $(".div-money").hide();
                        pay = [];
                    }
                }else{
                    var divId = "d-" + $(this).data('pay');
                    //如果不是联合支付，就关掉别的
                    if(join == false){
                        $(this).siblings().removeClass('active');
                        $(this).siblings().find("i").hide();
                        $(".div-money").hide();
                        pay = [];
                    }else{//如果是联合支付，支持反选
                        var i = $.inArray($(this).data('pay'),pay);
                        if(i >= 0){
                            $(this).removeClass('active');
                            $(this).find("i").hide();
                            pay.splice(i,1);
                            $("#" + divId).hide();

                            return;
                        }
                    }
                    $("#" + divId).show();
                    $(this).addClass('active')
                    $(this).find("i").show();
                    pay.push($(this).data('pay'));
                }
                
            });
            $("#b-ticket").on('click',function(){
                if(ticket == true){
                    ticket = false;
                    $(this).removeClass('btn-info');
                    $(this).find('i').hide();
                }else{
                    ticket = true;
                    $(this).addClass('btn-info');
                    $(this).find('i').show();
                }
            });
            $(".btn-callback").on('click',function(){
                $.each($(".div-money:visible").find('input'),function(i,o){
                    var name = $(o).attr('name');
                    var value = $(o).val();
                    eval("moneyList." + name + " = value;");
                });
                
                Fast.api.close({
                    ticket: ticket,
                    moneyList: moneyList
                });

            });
            
            setInterval(function(){
                var allMoney = 0;
                $.each($(".div-money:visible").find('input'),function(i,o){
                    allMoney = Number(allMoney) + Number($(o).val());
                });
                $("#c-change").val(allMoney - $("#money").val());
            },500);

        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
                
            },
        }
    };
    return Controller;
});