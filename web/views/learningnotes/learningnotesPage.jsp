<%--
  Created by IntelliJ IDEA.
  User: NoControl
  Date: 2018/3/9
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学习笔记</title>
    <jsp:include page="/comm/header.jsp"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
<script src="<%=request.getContextPath()%>/comm/js/canvas-nest.min.js" count="200" zindex="-2" opacity="0.5" color="47,135,193" type="text/javascript">
</script>
<div class="htmleaf-container">
    <header class="htmleaf-header">
        <h1>NoControl's 学习笔记 <span>Learning Notes</span></h1>
    </header>
</div>
<div id="wrapper">
    <div class="overlay"></div>

    <!-- Sidebar -->
    <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
        <ul class="nav sidebar-nav">
            <li class="sidebar-brand">
                <a href="<%=request.getContextPath()%>/views/index.jsp">
                    <i class="fa fa-fw fa-home"></i> 首页
                </a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/views/bbs/bbsHPage.jsp"><i class="fa fa-fw fa-commenting-o"></i> 小屋论坛</a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/views/music/musicPage.jsp"><i class="fa fa-fw fa-music"></i> 小屋音乐</a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/views/picture/picturePage.jsp"><i class="fa fa-fw fa-camera"></i> 图片墙</a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/views/bangumi/bangumiPage.jsp"><i class="fa fa-fw fa-film"></i> 小屋追番</a>
            </li>


            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-fw fa-edit"></i> 学习生活 <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li class="dropdown-header" style="display:none;">Dropdown heading</li>
                    <li><a href="#" class="fa fa-fw fa-tag"> 学习笔记</a></li>
                    <li><a href="#" class="fa fa-fw fa-tag"> 生活日记</a></li>
                    <li><a href="#" class="fa fa-fw fa-tag"> 没想好</a></li>
                    <li><a href="#" class="fa fa-fw fa-tag"> 没想好</a></li>
                    <li><a href="#" class="fa fa-fw fa-tag"> 没想好</a></li>
                </ul>
            </li>

            <li>
                <a href="#"><i class="fa fa-fw fa-twitter"></i> 没想好</a>
            </li>
            <li>
                <a href="#"><i class="fa fa-fw fa-twitter"></i> 没想好</a>
            </li>
            <li>
                <a href="#"><i class="fa fa-fw fa-paper-plane-o"></i> 关于我</a>
            </li>
        </ul>
    </nav>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">
        <button type="button" class="hamburger is-closed animated fadeInLeft" data-toggle="offcanvas">
            <span class="hamb-top"></span>
            <span class="hamb-middle"></span>
            <span class="hamb-bottom"></span>
        </button>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    内容
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-content-wrapper -->

</div>
<!-- /#wrapper -->


<script type="text/javascript">
    $(document).ready(function () {
        var trigger = $('.hamburger'),
            overlay = $('.overlay'),
            isClosed = false;

        trigger.click(function () {
            hamburger_cross();
        });

        function hamburger_cross() {

            if (isClosed == true) {
                overlay.hide();
                trigger.removeClass('is-open');
                trigger.addClass('is-closed');
                isClosed = false;
            } else {
                overlay.show();
                trigger.removeClass('is-closed');
                trigger.addClass('is-open');
                isClosed = true;
            }
        }

        $('[data-toggle="offcanvas"]').click(function () {
            $('#wrapper').toggleClass('toggled');
        });
    });
</script>
</body>
</html>
