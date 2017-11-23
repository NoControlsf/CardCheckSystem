/**
 * Created by Administrator on 2017/6/29.
 */
$(function () {
    $("#loginForm").bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            usercode: {
                message: '昵称验证失败',
                validators: {
                    notEmpty: {
                        message: '昵称不能为空'
                    }
                }
            },
            userpwd: {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    }
                }
            },
            input_checkCode: {
                validators: {
                    notEmpty: {
                        message: '验证码不能为空'
                    },
                    remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}
                        url: 'checkCode',//验证地址
                        message: '验证码错误',//提示消息
                        delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
                        type: 'POST'//请求方式
                        /**自定义提交数据，默认值提交当前input value
                         *  data: function(validator) {
                               return {
                                   password: $('[name="passwordNameAttributeInYourForm"]').val(),
                                   whatever: $('[name="whateverNameAttributeInYourForm"]').val()
                               };
                            }
                         */
                    }
                }
            }
        }
    });

    $("#linkRegister").click(function () {
        window.location.href="register.jsp";
    })


})
