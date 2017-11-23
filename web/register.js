/**
 * Created by Administrator on 2017/6/26.
 */
$(function () {
    $('#defaultForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            input_sname: {
                message: '昵称验证失败',
                validators: {
                    notEmpty: {
                        message: '昵称不能为空'
                    },
                    remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}
                        url: 'checkSname',//验证地址
                        message: '该昵称已被占用',//提示消息
                        delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
                        type: 'POST'//请求方式
                    }
                }
            },
            input_birthday: {
                validators: {
                    date: {
                        format:'YYYY/MM/DD',
                        message: '生日格式不正确'
                    }
                }
            },
            input_pass: {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: '密码长度必须在6到30之间'
                    },
                    identical: {//相同
                        field: 'input_pass', //需要进行比较的input name值
                        message: '两次密码不一致'
                    },
                    regexp:{
                      regexp:/[a-zA-Z0-9_\.]+$/,
                        message:'密码只能运用大小写字母和数字组成'
                    }
                }
            },
            input_repass: {
                validators: {
                    notEmpty: {
                        message: '确认不能为空'
                    },
                    identical:{
                      field:'input_pass',
                        message:'两次密码不一致'
                    }
                }
            },
            input_qname: {
                validators: {
                    notEmpty: {
                        message: '真实姓名不能为空'
                    }
                }
            },
            sex: {
                validators: {
                    notEmpty: {
                        message: '性别不能为空'
                    }
                }
            },
            input_telephone: {
                validators: {
                    notEmpty: {
                        message: '手机号码不能为空'
                    },
                    stringLength: {
                        min: 11,
                        max: 11,
                        message: '请输入11位手机号码'
                    },
                    regexp: {
                        regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                        message: '请输入正确的手机号码'
                    }
                }
            },
            input_email: {
                validators: {
                    notEmpty: {
                        message: '电子邮箱不能为空'
                    },
                    emailAddress: {
                        message: '电子邮箱格式不对'
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
});

