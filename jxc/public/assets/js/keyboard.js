!(function($) {
    var CapsLockValue = 0; 
    var curEditName;
    var check; 
    $.ajax({
        url: Config.__PUBLIC__ + "assets/libs/keyboard/index.html?v=1",
        type: "get",
        dataType: 'text',
        success: function(rs){
            var first_input = $(".keyboard").siblings("input")[0];
            $(first_input).focus();
            $(".keyboard").html(rs);
            $('input').focus(function(){
                if(!$(this).hasClass('i_button')){
                    $('input').removeClass('focus');
                    $(this).addClass('focus');
                }
            });
            $(document).on('click',".i_button_num,.i_button_zm,.i_button_fh",function(){
                var value = $(this).data('value');
                $(".focus").val($(".focus").val() + value).trigger('change').focus();
            });
            //清空 
            $(".i_btn_clear_value").on('click',function(){
                $(".focus").val("").trigger('change').focus();
            });
            //实现BackSpace键的功能 
            $(".i_button_bs").on('click',function(){
                var longnum = $(".focus").val().length; 
                var nums;
                num = $(".focus").val().substr(0,longnum - 1); 
                $(".focus").val(num).trigger('change').focus();
            });
            $(".i_button_change_panl").on('click',function(){
                var obj = $(this).data("object");
                $("#"+obj).siblings("div").hide();
                $("#"+obj).show();
            });
            //设置是否大写的值 
            $(".i_button_set_caps_lock").on('click',function(){
                if (CapsLockValue == 0){ 
                    CapsLockValue = 1; 
                    $(this).val("小写");
                    $.each($(".i_button_zm"),function(b, c) {  
                      $(c).val($(c).val().toUpperCase());
                      $(c).data('value',$(c).data('value').toUpperCase());
                    });
                }else{ 
                    CapsLockValue = 0; 
                    $(this).val("大写");   
                    $.each($(".i_button_zm"),function(b, c) {  
                      $(c).val($(c).val().toLowerCase());
                      $(c).data('value',$(c).data('value').toLowerCase());
                    });
                }
            });
        }
    });
})(jQuery);
