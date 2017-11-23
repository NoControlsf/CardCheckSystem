<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/26
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getContextPath() + "/";
%>
<html>
<head>
    <title>注册</title>
    <jsp:include page="/comm/header.jsp"/>
</head>
<body>
<script src="http://open.sojson.com/common/js/canvas-nest.min.js" count="200" zindex="-2" opacity="0.5" color="47,135,193" type="text/javascript">
</script>
<div class="container">
    <div class="row">
        <div class="col-md-10" role="main">
            <div class="doc-section">
                <h2 class="page-header">会员注册</h2>
            </div>
            <form id="defaultForm"  method="post" class="form-horizontal" action="<%=request.getContextPath()%>/register" >
                <div class="form-group">
                    <label class="col-md-2 control-label">用户昵称</label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" id="input_sname" name="input_sname" placeholder="请取个喜欢的名字吧">
                    </div>
                    <label class="col-md-2 control-label">生日：</label>
                    <div class="col-md-3">
                        <input type="date" class="form-control" id="input_birthday" name="input_birthday" placeholder="请输入出生日期">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">密码：</label>
                    <div class="col-md-3">
                        <input type="password" class="form-control" id="input_pass" name="input_pass" placeholder="请输入密码">
                    </div>
                    <label class="col-md-2 control-label">确认密码：</label>
                    <div class="col-md-3">
                        <input type="password" class="form-control" id="input_repass" name="input_repass" placeholder="请再次输入密码">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">真实姓名：</label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" id="input_qname" name="input_qname" placeholder="请输入真实姓名">
                    </div>
                    <label class="col-md-2 control-label">性别：</label>
                    <div class="col-md-3">
                        <div class="radio">
                            <label>
                                <input type="radio" name="sex" value="男性" />男
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="sex" value="女性" />女
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">手机号码：</label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" id="input_telephone" name="input_telephone" placeholder="请留下手机号码">
                    </div>
                    <label class="col-md-2 control-label">邮箱：</label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" id="input_email" name="input_email" placeholder="邮箱填写">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">验证码：</label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" id="input_checkCode" name="input_checkCode" placeholder="区分大小写">
                    </div>
                <!-- cursor: pointer;鼠标放上显示手;   title:鼠标放上时显示的文字 -->
                <img id="imageCode" alt="" src="" onclick="checkcode()" style="cursor: pointer;" title="点我更换验证码"/>
                <script type="text/javascript">
                    var basePath = "<%=basePath%>";
                    $(function(){
                        checkcode();
                    });
                    function checkcode(){
                        var XMLHttp = null;
                        if (window.XMLHttpRequest) {
                            XMLHttp = new XMLHttpRequest()
                        } else if (window.ActiveXObject) {
                            XMLHttp = new ActiveXObject("Microsoft.XMLHTTP");
                        }
                        XMLHttp.onreadystatechange = function() {
                            if (XMLHttp.readyState == 4) {
                                document.getElementById("imageCode").src = basePath
                                    + "getImage?" + new Date();//改变验证码图片
                            }
                        }
                        //将请求发送出去
                        //加上new Date()防止浏览器缓存，不重新发送请求
                        XMLHttp.open("GET", basePath + "getImage?" + new Date(), true);
                        XMLHttp.send(null);
                    }
                </script>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-5 col-md-10">
                        <button type="submit" class="btn btn-primary" id="register">注册</button>
                    </div>
                </div>
            </form>
        </div>
    </div>


</div>
<script type="text/javascript" src="register.js"></script>
</body>
</html>
