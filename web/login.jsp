<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/26
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getContextPath() + "/";
%>
<html>
<head>
    <title>登录</title>
    <jsp:include page="/comm/header.jsp"/>
    <link type="text/css" href="<%=request.getContextPath()%>/static/login.css" rel="stylesheet">
    <script>
        $(function () {
            var msg="${msg}";
            if(msg=="success"){
                layer.alert("注册成功",{icon:6});
            }else if(msg=="loginfail"){
                layer.alert("登录失败",{icon:5})
            }
        })
    </script>
</head>
<body>
<script src="<%=request.getContextPath()%>/comm/js/canvas-nest.min.js" count="200" zindex="-2" opacity="0.5" color="47,135,193" type="text/javascript">
</script>

<div class="login-Container">


    <h1 align="center"> 用户登录</h1>

    <div class="line"></div>
    <form class="form-horizontal" action="<%=request.getContextPath()%>/login" method="post" id="loginForm">
        <div class="form-group">
            <label for="txtUser" class="col-sm-2 control-label">昵&nbsp;称:</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="txtUser" name="usercode" placeholder="输入昵称" >
            </div>
        </div>
        <div class="form-group">
            <label for="txtPwd" class="col-sm-2 control-label">密&nbsp;码:</label>
            <div class="col-sm-9">
                <input type="password"  id="txtPwd" name="userpwd"  placeholder="输入密码" class="form-control" >
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-6">
                <input type="text" class="form-control" id="input_checkCode" name="input_checkCode" placeholder="区分大小写">
            </div>
            <div class="col-sm-5">
                <!-- cursor: pointer;鼠标放上显示手;   title:鼠标放上时显示的文字 -->
                <img id="imageCode" alt="" src="" onclick="checkcode()" style="cursor: pointer;" title="点我更换验证码"/>
            </div>
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
            <div class="col-sm-offset-2 col-sm-4">
                <button type="submit" class="btn btn-primary col-sm-12">登&nbsp;&nbsp;&nbsp;陆</button>
            </div>
            <div class="col-sm-offset-1 col-sm-4">
                <button type="button" class="btn btn-danger col-sm-12" id="linkRegister">注&nbsp;&nbsp;&nbsp;册</button>
            </div>
        </div>
    </form>



</div>

<script type="text/javascript" src="login.js"></script>
</body>
</html>
