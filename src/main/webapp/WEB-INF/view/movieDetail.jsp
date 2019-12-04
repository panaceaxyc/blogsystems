<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html>
<head>
    <title>于初电影推荐 `${movie.movietitle}</title>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="keywords" content="个人博客,于云阔个人博客,个人博客系统,于初博客,于云阔">
    <meta name="description" content="于初博客系统，一个站在java开发之路上的草根程序员个人博客网站。">
    <LINK rel="Bookmark" href="favicon.ico">
    <LINK rel="Shortcut Icon" href="favicon.ico"/>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="${ctx }/staticRes/js/html5shiv.js"></script>
    <script type="text/javascript" src="${ctx }/staticRes/js/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="${ctx }/plugin/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/plugin/Hui-iconfont/1.0.8/iconfont.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/plugin/pifu/pifu.css"/>
    <!--[if lt IE 9]>
    <link href="/staticRes/lib/h-ui/css/H-ui.ie.css" rel="stylesheet" type="text/css"/>
    <![endif]-->
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    }

    function showSide() {
        $('.navbar-nav').toggle();
    }</script>
</head>
<body>
<!--导入 header 并且传入参数movie-->
<jsp:include page="comm/header.jsp">
    <jsp:param value="movie" name="tip"/>
</jsp:include>

<!--导航条-->
<nav class="breadcrumb">
    <div class="container">
        <i class="Hui-iconfont">&#xe67f;</i><a href="index.html" class="c-primary">首页</a>
        <span class="c-gray en">&gt;</span> <a href="article.html" class="c-primary">学无止尽</a>
        <span class="c-gray en">&gt;</span> <span class="c-gray"><i class="Hui-iconfont">&#xe64b;</i> nginx</span>
    </div>
</nav>

<section class="container">
    <!--left-->
    <div class="col-sm-9 col-md-9 mt-20">
        <!--article list-->
        <div class="panel panel-default  mb-20">
            <div class="panel-body pt-10 pb-10">
                <div class="desc"></div>

                <!--显示博客 -->
                <h2 class="c_titile">${movie.movietitle}</h2>
                <p class="box_c"><span class="d_time">发布时间 ：<fmt:formatDate
                        value="${movie.createdate}"></fmt:formatDate></span><span>编辑：<a
                        href="mailto:wfyv@qq.com">${movie.username}</a></span></p>
                <ul class="infos">
                    <p>${movie.moviecontent}</p>
                </ul>
                <!--关键字-->
                <div class="keybq">
                    <p><span>分类</span>：<a class="label label-default">${movie.categoryname}</a></p>
                </div>
            </div>
        </div>
    </div>

    <!--right-->
    <div class="col-sm-3 col-md-3 mt-20">
        <!--导航-->
        <div class="panel panel-primary mb-20">
            <div class="tab-category">
                <a href=""><strong>电影分类</strong></a>
            </div>

            <div class="panel-body">
                <c:forEach items="${categoryies}" var="cate">
                    <c:if test="${movie.categoryid == cate.id}">
                        <button class="btn btn-primary radius nav-btn" type="button" onclick="javascript:window.location.href='${ctx }/searchMovieByCategoryId?categoryId=${cate.id}&categoryName=${cate.categoryname}'" value="${cate.id}">${cate.categoryname}</button>
                    </c:if>
                    <c:if test="${movie.categoryid != cate.id}">
                        <button onclick="javascript:window.location.href='${ctx }/searchMovieByCategoryId?categoryId=${cate.id}&categoryName=${cate.categoryname}'" class="btn btn-primary-outline radius nav-btn" type="button"
                                value="${cate.id}">${cate.categoryname}</button>
                    </c:if>
                </c:forEach>
            </div>
        </div>


        <!--图片-->
        <div class="bg-fff box-shadow radius mb-20">
            <div class="tab-category">
                <a href=""><strong>打赏于初</strong></a>
            </div>
            <div class="tab-category-item">
                <img data-original="${ctx}/temp/gg.jpg" class="img-responsive lazyload" alt="响应式图片">
            </div>
        </div>


        <!--标签 (动态获取)-->
        <div class="bg-fff box-shadow radius mb-20">
            <div class="tab-category">
                <a href=""><strong>标签云</strong></a>
            </div>
            <div class="tab-category-item">
                <div class="tags">
                    <c:forEach items="${lables}" var="lable">
                        <a href="${lable.lableUrl}" target="_blank">${lable.lableName}</a>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="comm/footer.jsp"/>

<script type="text/javascript" src="${ctx }/plugin/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/plugin/layer/3.0/layer.js"></script>
<script type="text/javascript" src="${ctx }/plugin/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${ctx }/plugin/pifu/pifu.js"></script>
<script type="text/javascript" src="${ctx }/js/common.js"></script>
<script> $(function () {
    $(window).on("scroll", backToTopFun);
    backToTopFun();
}); </script>
<script>
    $(function () {
//标签
        $(".tags a").each(function () {
            var x = 9;
            var y = 0;
            var rand = parseInt(Math.random() * (x - y + 1) + y);
            $(this).addClass("tags" + rand)
        });

        $("img.lazyload").lazyload({failurelimit: 3});
    });

</script>
</body>
</html>
