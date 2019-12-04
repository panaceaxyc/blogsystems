<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html>
<head>
    <title>于初个人博客 `一个站在java开发之路上的草根程序员个人博客网站</title>
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
    <jsp:param value="index" name="tip"/>
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
                        <li><a href="#" target="_blank"><img src="${ctx }/img/temp/slide2.jpg"></a></li>
                        <li><a href="#" target="_blank"><img src="${ctx }/img/temp/banner8.png"></a></li>
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
                <a href=""><strong class="current">最新发布</strong></a>
            </div>
        </div>
        <div class="art_content">
            <!--显示博客-->
            <ul class="index_arc">
                <c:forEach items="${pageInfo.list}" var="article">
                    <!--如果博客有首页图 那么显示如吓这个样子-->
                    <c:if test="${not empty article.pic}">
                        <li class="index_arc_item">
                            <a href="${ctx}/article?id=${article.id}" class="pic">
                                <img class="lazyload" src="${ctx}/${article.pic}" alt="${article.title}"/>
                            </a>
                            <h4 class="title"><a href="${ctx}/article?id=${article.id}">${article.title}</a></h4>
                            <div class="date_hits">
                                <span>${article.username}</span>
                                <span>${article.localTime}</span>
                                <span><a href="/article-lists/10.jsp">${article.keywords}</a></span>
                                <p class="hits"><i class="Hui-iconfont" title="热度">&#xe6c1;</i> ${article.click}° </p>
                                <p class="commonts"><i class="Hui-iconfont" title="评论">&#xe622;</i> <span
                                        class="cy_cmt_count">20</span></p>
                            </div>
                            <div class="desc">${article.desci}</div>
                        </li>
                    </c:if>
                    <!--如果博客没有首页图 那么显示一下这个样子-->
                    <c:if test="${empty article.pic}">
                        <li class="index_arc_item no_pic">
                            <h4 class="title"><a href="${ctx}/article?id=${article.id}">${article.title}</a></h4>
                            <div class="date_hits">
                                <span>${article.username}</span>
                                <span>${article.localTime}</span>
                                <span><a href="/article-lists/10.jsp">${article.keywords}</a></span>
                                <p class="hits"><i class="Hui-iconfont" title="热度">&#xe6c1;</i> ${article.click} °</p>
                                <p class="commonts"><i class="Hui-iconfont" title="评论">&#xe622;</i> <span
                                        id="sourceId::105" class="cy_cmt_count">20</span></p>
                            </div>
                            <div class="desc">${article.desci}</div>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
        <hr/>
    </div>
    <div style="margin-left:55%;" class="btn-group">
        <c:if test="${pageInfo.hasPreviousPage}">
            <li  onclick="javascript:window.location.href='${pageContext.request.contextPath}/index?pn=${pageInfo.pageNum-1}'" class="btn btn-default radius"><span
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
                <li onclick="javascript:window.location.href='${pageContext.request.contextPath}/index?pn=${page_Num}'"
                    class="btn btn-default radius"><span
                >${page_Num}</span></li>
            </c:if>
        </c:forEach>

        <c:if test="${pageInfo.hasNextPage}">
            <li onclick="javascript:window.location.href='${pageContext.request.contextPath}/index?pn=${pageInfo.pageNum+1}'"
                class="btn btn-default radius"><span
            >»</span></li>
        </c:if>

        <c:if test="${not pageInfo.hasNextPage}">
            <li class="btn btn-default radius" style="cursor:not-allowed;" class="am-disabled"><span
            >»</span></li>
        </c:if>
    </div>

    <!--right-->
    <div class="col-sm-3 col-md-3">
        <!--站点声明-->
        <div class="panel panel-default mb-20">
            <div class="panel-body">
                <i class="Hui-iconfont" style="float: left;">&#xe62f;&nbsp;</i>
                <div class="slideTxtBox">
                    <div class="bd">
                        <ul>
                            <li><a href="javascript:void(0);">于初博客测试版上线，欢迎访问</a></li>
                            <li><a href="javascript:void(0);">内容如有侵犯，请立即联系管理员删除</a></li>
                            <li><a href="javascript:void(0);">本站内容仅供学习和参阅，不做任何商业用途</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>


        <!--博主信息-->
        <div class="bg-fff box-shadow radius mb-20">
            <div class="tab-category">
                <a href=""><strong>博主信息</strong></a>
            </div>
            <div class="tab-category-item">
                <ul class="index_recd">
                    <li class="index_recd_item"><i class="Hui-iconfont">&#xe653;</i>姓名：${bloger.name}</li>
                    <li class="index_recd_item"><i class="Hui-iconfont">&#xe70d;</i>职业：${bloger.zy}</li>
                    <li class="index_recd_item"><i class="Hui-iconfont">&#xe63b;</i>邮箱：<a
                            href="mailto:${bloger.email}">${bloger.email}</a></li>
                    <li class="index_recd_item"><i class="Hui-iconfont">&#xe671;</i>定位：${bloger.address}</li>
                </ul>
            </div>
        </div>


        <!--热门推荐  (动态获取)-->
        <div class="bg-fff box-shadow radius mb-20">
            <div class="tab-category">
                <a href=""><strong>热门推荐</strong></a>
            </div>
            <div class="tab-category-item">
                <ul class="index_recd">
                    <c:forEach items="${hotArticle}" var="hot">
                        <li>
                            <a href="${ctx}/article?id=${hot.id}">${hot.title}</a>
                            <p class="hits"><i class="Hui-iconfont" title="点击量">&#xe6c1;</i> ${hot.click} </p>
                        </li>
                    </c:forEach>
                </ul>
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


        <!--友情链接   (动态获取)-->
        <div class="bg-fff box-shadow radius mb-20">
            <div class="tab-category">
                <a href=""><strong>隔壁邻居</strong></a>
            </div>
            <div class="tab-category-item">
                <c:forEach items="${links}" var="link">
                    <span><i class="Hui-iconfont">&#xe6f1;</i><a href="${link.linkUrl}" target="_blank"
                                                                 class="btn-link">${link.linkName}</a></span>
                </c:forEach>
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
