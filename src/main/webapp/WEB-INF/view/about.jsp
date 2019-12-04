<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html>
<head>
    <title>关于我 —  一个站在java开发之路上的草根程序员个人博客网站</title>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="keywords" content="个人博客,于云阔个人博客,个人博客系统,于初博客,于云阔">
    <meta name="description" content="于初博客系统，一个站在java开发之路上的草根程序员个人博客网站。">
    <LINK rel="Bookmark" href="favicon.ico" >
    <LINK rel="Shortcut Icon" href="favicon.ico" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="${ctx }/staticRes/js/html5shiv.js"></script>
    <script type="text/javascript" src="${ctx }/staticRes/js/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="${ctx }/plugin/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="${ctx }/plugin/Hui-iconfont/1.0.8/iconfont.min.css" />
    <link rel="stylesheet" type="text/css" href="${ctx }/css/common.css" />
    <link rel="stylesheet" type="text/css" href="${ctx }/plugin/pifu/pifu.css" />
    <!--[if lt IE 9]>
    <link href="${ctx }/staticRes/lib/h-ui/css/H-ui.ie.css" rel="stylesheet" type="text/css" />
    <![endif]-->
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } function showSide(){$('.navbar-nav').toggle();}</script>
</head>
<body>


<!--导入 header 并且传入参数movie-->
<jsp:include page="comm/header.jsp">
    <jsp:param value="about" name="tip"/>
</jsp:include>

<!--导航条-->
<nav class="breadcrumb">
    <div class="container"> <i class="Hui-iconfont">&#xe67f;</i> <a href="${ctx }/index" class="c-primary">首页</a> <span class="c-gray en">&gt;</span>  <span class="c-gray">关于</span> </div>
</nav>

<section class="container">
    <div class="container-fluid">
        <div class="about">
            <h2>Just about me</h2>
            <ul>
                <p>于初是一枚正在努力进步的JavaWeb程序员。专长领域为Web开发、熟悉SpringBoot. SSM 框架搭建web项目，目前正在学习前端:Vue.js等知识啦`  </p>
            </ul>
            <h2>About my blog</h2>
            <ul>
                <p>域  名：xxxx.com 注册于2019年02月02日</p>
                <p>服务器：腾讯云服务器 ，于2017年02月23日完成备案</p>
                <p>备案号：暂无.</p>
                <p>本站定位为IT技术博客站，博客内容主要涉及编程语言、前端开发、服务端开发及一些热门技术等方面，同时分享实用的开发资料。</p>
            </ul>
            <h2>Contact  me</h2>
            <ul>
                <p><i class="Hui-iconfont">&#xe67b;</i>qq : *********暂不公开 : (</p>
                <p><i class="Hui-iconfont">&#xe6d1;</i>git：https://github.com/2609698046</p>
                <p><i class="Hui-iconfont">&#xe63b;</i>email : 2609698046@qq.com</p>
            </ul>
        </div>

    </div>
</section>
<jsp:include page="comm/footer.jsp"/>

<script type="text/javascript" src="${ctx }/plugin/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/plugin/layer/3.0/layer.js"></script>
<script type="text/javascript" src="${ctx }/plugin/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${ctx }/plugin/pifu/pifu.js"></script>
<script type="text/javascript" src="${ctx }/js/common.js"></script>
<script> $(function(){ $(window).on("scroll",backToTopFun); backToTopFun(); }); </script>
</body>
</html>
