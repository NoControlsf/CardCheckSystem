<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/29
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>小屋论坛</title>

    <meta http-equiv="x-ua-compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="renderer" content="webkit" >
    <!-- Bootstrap -->
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/img/14.ico" media="screen" />
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap-table/bootstrap-table.css">
    <link type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet"/>
    <link type="text/css" href="<%=request.getContextPath()%>/js/skin/layer.css" rel="stylesheet"/>
    <link type="text/css" href="<%=request.getContextPath()%>/bootstrapValidator/css/bootstrapValidator.min.css" rel="stylesheet"/>
    <%-- sidebar --%>
    <link href="<%=request.getContextPath()%>/Flat-UI/css/flat-ui.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/sidebar.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/htmleaf-demo.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Flat-UI/css/flat-ui.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/font-awesome-4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/animate.css/animate.min.css">
    <!--[if lt IE 9]-->
    <%--<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>--%>
    <!--[endif]-->
    <script src="<%=request.getContextPath()%>/js/jquery-2.1.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/layer.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrapValidator/js/bootstrapValidator.min.js"></script>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">

    <style>
        /*表格记录部分白色*/
        .pagination-info {
            background-color: #FFFFFF;
        }
    </style>
    <script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap-table/bootstrap-table.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap-table/bootstrap-table-zh-CN.js"></script>
    <script type="text/javascript" src="bbsHPage.js"></script>
</head>
<body>
<script src="<%=request.getContextPath()%>/comm/js/canvas-nest.min.js" count="200" zindex="-2" opacity="0.5" color="47,135,193" type="text/javascript">
</script>
<div class="htmleaf-container">
    <header class="htmleaf-header">
        <h1>NoControl's 小屋论坛 <span>Hut  Tribune</span></h1>
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
                <a href="#"><i class="fa fa-fw fa-commenting-o"></i> 小屋论坛</a>
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
                    <li><a href="<%=request.getContextPath()%>/views/learningnotes/learningnotesPage.jsp" class="fa fa-fw fa-tag"> 学习笔记</a></li>
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
                    <%--系统根目录--%>
                    <input id="txtRootPath" type="hidden" value="<%=request.getContextPath()%>">
                    <%--工具栏--%>
                    <nav class="navbar nabar-default" id="toolbar">
                        <div class="container-fluid">
                            <button id="btnAdd" class="navbar-btn btn btn-default"><i class="fa fa-fw fa-plus"></i> 发帖</button>
                            <button id="btnDel" class="navbar-btn btn btn-default"><i class="fa fa-fw fa-trash"></i> 删帖</button>
                        </div>
                    </nav>

                    <%--主贴内容--%>
                    <table id="mainArticle_table"></table>
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
