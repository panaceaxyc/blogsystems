<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html>
<head>
    <title>于初电影推荐 `一个站在java开发之路上的草根程序员个人博客网站</title>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="keywords" content="个人博客,于云阔个人博客,个人博客系统,于初博客,于云阔">
    <meta name="description" content="于初博客系统，一个站在java开发之路上的草根程序员个人博客网站。">
    <LINK rel="Bookmark" href="${ctx}/favicon.ico">
    <LINK rel="Shortcut Icon" href="${ctx}/favicon.ico"/>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="${ctx}/staticRes/js/html5shiv.js"></script>
    <script type="text/javascript" src="${ctx}/staticRes/js/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="${ctx }/plugin/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/plugin/Hui-iconfont/1.0.8/iconfont.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/plugin/pifu/pifu.css"/>
    <!--[if lt IE 9]>
    <link href="${ctx }/staticRes/lib/h-ui/css/H-ui.ie.css" rel="stylesheet" type="text/css"/>
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

<section class="container pt-20">
    <!--<div class="Huialert Huialert-info"><i class="Hui-iconfont">&#xe6a6;</i>成功状态提示</div>-->
    <!--left-->
    <div class="col-sm-9 col-md-9">
        <!--滚动图-->
        <div class="slider_main">
            <div class="slider">
                <div class="bd">
                    <ul>
                        <li><a href="#" target="_blank"><img src="${ctx }/img/temp/IDEABG_04.jpg"></a></li>
                        <li><a href="#" target="_blank"><img src="${ctx }/img/temp/IDEABG_06.jpg"></a></li>
                    </ul>
                </div>
                <ol class="hd cl dots">
                    <li>1</li>
                    <li>2</li>
                </ol>
                <a class="slider-arrow prev" href="javascript:void(0)"></a>
                <a class="slider-arrow next" href="javascript:void(0)"></a>
            </div>
        </div>

        <div class="mt-20 bg-fff box-shadow radius mb-5">
            <div class="tab-category">
                <a href=""><strong class="current">于初推荐电影</strong></a>
            </div>
        </div>

        <div class="art_content">
            <ul class="index_arc">
                <!-- 如果电影为空 那么提示用户! -->
                <c:if test="${empty pageInfo.list}">
                    <li class="index_arc_item">
                        <p style="font-size: 16px; line-height: 40px;">
                            没有搜索到有关 <span style="color: mediumvioletred">${categoryName}</span> 的电影..请尝试搜索其它的电影!
                        </p>
                    </li>
                </c:if>
                <!-- end 提示用户-->

                <!-- 如果电影不为空 那么显示给用户电影信息 -->
                <c:if test="${not empty pageInfo.list}">
                    <c:forEach items="${pageInfo.list}" var="movie">
                        <li class="index_arc_item">
                            <a href="${ctx}/movieDetail?id=${movie.id}&cateId=${movie.categoryid}" class="pic">
                                <img class="lazyload" src="${ctx}/${movie.photo}" alt="${movie.movietitle}"/>
                            </a>
                            <h4 class="title"><a
                                    href="${ctx}/movieDetail?id=${movie.id}&cateId=${movie.categoryid}">${movie.movietitle}</a>
                            </h4>
                            <div class="date_hits">
                                <span>${movie.username}</span>
                                <span><fmt:formatDate value="${movie.createdate}"></fmt:formatDate></span>
                                <span><a href="/article-lists/10.jsp">${movie.categoryname}</a></span>
                            </div>
                            <div class="desc">${movie.movieinfo}</div>
                        </li>
                    </c:forEach>
                </c:if>
                <!-- end 电影信息-->
            </ul>
            <hr/>
            <!--分页信息  如果电影不为空那么显示分页信息-->
            <c:if test="${not empty pageInfo.list}">

                <div style="float: right;" class="btn-group">
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li  onclick="javascript:window.location.href='${pageContext.request.contextPath}/movie?pn=${pageInfo.pageNum-1}'" class="btn btn-default radius"><span
                        >«</span></li>
                    </c:if>

                    <c:if test="${not pageInfo.hasPreviousPage}">
                        <li style="cursor:not-allowed;" class="btn btn-default radius"><span>«</span></li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum}">
                            <li class="btn btn-primary radius"><span style="color: #fff;"  >${page_Num}</span></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum}">
                            <li onclick="javascript:window.location.href='${pageContext.request.contextPath}/movie?pn=${page_Num}'"
                                class="btn btn-default radius"><span
                            >${page_Num}</span></li>
                        </c:if>
                    </c:forEach>

                    <c:if test="${pageInfo.hasNextPage}">
                        <li onclick="javascript:window.location.href='${pageContext.request.contextPath}/movie?pn=${pageInfo.pageNum+1}'"
                            class="btn btn-default radius"><span
                        >»</span></li>
                    </c:if>

                    <c:if test="${not pageInfo.hasNextPage}">
                        <li class="btn btn-default radius" style="cursor:not-allowed;" class="am-disabled"><span
                        >»</span></li>
                    </c:if>
                </div>
            </c:if>
            <!-- end 分页信息-->
        </div>
    </div>


    <!--right-->
    <div class="col-sm-3 col-md-3 mt-20">
        <!--导航-->
        <div class="tab-category">
            <a href="${ctx }/searchMovieByCategoryId?categoryId="><strong>电影分类</strong></a>
        </div>
        <div class="panel panel-primary mb-20">
            <!--显示 分类按钮-->
            <div class="panel-body">
                <c:forEach items="${categoryies}" var="cate">
                    <!--如果用户传过来的分类ID 等于 当前 分类ID 那么显示被选中状态-->
                    <c:if test="${categoryId == cate.id}">
                        <button class="btn btn-primary radius nav-btn" type="button"
                                value="${cate.id}">${cate.categoryname}</button>
                    </c:if>
                    <!--否则 显示 不加样式的 分类按钮-->
                    <c:if test="${categoryId != cate.id}">
                        <button class="btn btn-primary-outline radius nav-btn" type="button"
                                onclick="javascript:window.location.href='${ctx }/searchMovieByCategoryId?categoryId=${cate.id}&categoryName=${cate.categoryname}'"
                                value="${cate.id}">${cate.categoryname}</button>
                    </c:if>
                </c:forEach>
            </div>
            <!--end 分类按钮-->
        </div>
        <!--图片-->
        <div class="bg-fff box-shadow radius mb-20">
            <div class="tab-category">
                <a href=""><strong>WeChat</strong></a>
            </div>
            <div class="tab-category-item">
                <img data-original="/temp/gg.jpg" class="img-responsive lazyload" alt="WeChat">
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
<script type="text/javascript" src="${ctx }/plugin/jquery.SuperSlide/2.1.1/jquery.SuperSlide.min.js"></script>
<script>
    $(function () {
//幻灯片
        jQuery(".slider_main .slider").slide({
            mainCell: ".bd ul",
            titCell: ".hd li",
            trigger: "mouseover",
            effect: "leftLoop",
            autoPlay: true,
            delayTime: 700,
            interTime: 2000,
            pnLoop: true,
            titOnClassName: "active"
        })
//tips
        jQuery(".slideTxtBox").slide({
            titCell: ".hd ul",
            mainCell: ".bd ul",
            autoPage: true,
            effect: "top",
            autoPlay: true
        });
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
