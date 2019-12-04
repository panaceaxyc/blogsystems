<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html>
<head>
    <title>于初个人博客 `一个站在java开发之路上的草根程序员个人博客网站</title>
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
    <link rel="stylesheet" type="text/css" href="${ctx }/plugin/wangEditor/css/wangEditor.min.css">
    <!--[if lt IE 9]>
    <link href="${ctx }/staticRes/lib/h-ui/css/H-ui.ie.css" rel="stylesheet" type="text/css" />
    <![endif]-->
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } function showSide(){$('.navbar-nav').toggle();}</script>
</head>
<body>
<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container cl">
            <a class="navbar-logo hidden-xs" href="index.jsp">
                <img class="logo" src="${ctx}/img/logo.png" alt="于初博客" />
            </a>
            <a class="logo navbar-logo-m visible-xs" href="index.jsp">于初博客</a>
            <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:void(0);" onclick="showSide();">&#xe667;</a>
            <nav class="nav navbar-nav nav-collapse w_menu" role="navigation">
                <ul class="cl">
                    <li class="active"> <a href="${ctx}/index" data-hover="首页">首页</a> </li>
                    <li> <a href="${ctx }/about" data-hover="关于我">关于我</a> </li>
                    <li> <a href="${ctx }/mood" data-hover="碎言碎语">碎言碎语</a> </li>
                    <li><a href="${ctx }/searchMovieByCategoryId?categoryId=" data-hover="于初电影">于初电影</a></li>
                    <li> <a href="board.jsp" data-hover="留言板">留言板</a> </li>
                </ul>
            </nav>
            <nav class="navbar-nav navbar-userbar hidden-xs hidden-sm " style="top: 0;">
                <ul class="cl">
                    <li class="userInfo dropDown dropDown_hover">
                        <c:if test="${not empty admin}">
                            <a href="${ctx}/admin/main" onclick="layer.msg('进入后台..', {icon:16, shade: 0.1, time:0})"><img src="${ctx}/images/board.png" style="height: 30px;width:32px;"/>进入后台</a>

                        </c:if>
                        <c:if test="${empty admin}">
                            <a href="${ctx}/login" onclick="layer.msg('登录..', {icon:16, shade: 0.1, time:0})"><img src="${ctx}/images/board.png" style="height: 30px;width:32px;"/>登入</a>
                        </c:if>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>

<!--导航条-->
<nav class="breadcrumb">
    <div class="container"> <i class="Hui-iconfont">&#xe67f;</i> <a href="${ctx}/index" class="c-primary">首页</a> <span class="c-gray en">&gt;</span>  <span class="c-gray">文章</span> <span class="c-gray en">&gt;</span>  <span class="c-gray">${article.title}</span></div>
</nav>

<section class="container pt-20">

    <div class="row w_main_row">
        <div class="col-lg-9 col-md-9 w_main_left">
            <div class="panel panel-default  mb-20">
                <div class="panel-body pt-10 pb-10">

                   <!--显示博客 -->
                    <h2 class="c_titile">${article.title}</h2>
                    <p class="box_c"><span class="d_time">发布时间：<fmt:formatDate value="${article.time}"></fmt:formatDate></span><span>编辑：<a href="mailto:wfyv@qq.com">${article.username}</a></span><span>点击（${article.click}）</span></p>
                    <ul class="infos">
                        <p>${article.content}</p>
                    </ul>
                    <!--关键字-->
                    <div class="keybq">
                        <p><span>关键字</span>：<a class="label label-default">${article.keywords}</a></p>
                    </div>

                    <!--上一篇 和 下一篇-->
                    <div class="nextinfo">
                        <c:if test="${!empty lastArticle }">
                            <p class="last">上一篇：<a href="${ctx}/article/?id=${lastArticle.id}">${lastArticle.title}</a></p>
                        </c:if>
                        <c:if test="${empty lastArticle }">
                            <p class="last">上一篇：没有更多了.</p>
                        </c:if>

                        <c:if test="${!empty nextArticle }">
                            <p class="next">下一篇：<a href="${ctx}/article/?id=${nextArticle.id}">${nextArticle.title}</a></p>
                        </c:if>

                        <c:if test="${empty nextArticle }">
                            <p class="last">下一篇：没有更多了.</p>
                        </c:if>
                    </div>

                </div>
            </div>

            <div class="panel panel-default  mb-20">
                <div class="tab-category">
                    <a href=""><strong>评论区</strong></a>
                </div>


                <div class="panel-body">
                    <div class="panel-body" style="margin: 0 3%;">
                        <div class="mb-20">

                            <!--博客 评论情况-->
                            <ul class="commentList">

                                <c:forEach items="${comments}" var="comment">
                                    <c:choose>
                                        <c:when test="${! empty comment}">    <!--如果 -->
                                            <li class="item cl"> <a href="#"><i class="avatar size-L radius"><img alt="" src="${ctx}/${comment.photo}"></i></a>
                                                <div class="comment-main">
                                                    <header class="comment-header">
                                                        <div class="comment-meta"><a class="comment-author" href="#">${comment.username}</a>
                                                            <time title="${comment.date}" datetime="${comment.date}" class="f-r">${comment.date}</time>
                                                        </div>
                                                    </header>
                                                    <div class="comment-body">
                                                        <p> ${comment.content}</p>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:when>

                                        <c:otherwise>  <!--否则 -->
                                            <li class="item cl"> <p>暂时还没有评论,赶快抢沙发吧` <img src="${ctx}/img/sf.png"/></p></li>
                                        </c:otherwise>

                                    </c:choose>
                                </c:forEach>

                            </ul>
                        </div>
                        <div class="line"></div>


                        <!--用于评论-->
                        <div class="mt-20" id="ct">
                            <input id="articleId" type="hidden" value="${article.id}" >
                            <div id="err"></div>
                            <textarea id="textarea1" name="content" style="height:200px;" placeholder="说点什么吧.."> </textarea>
                            <div class="text-r mt-10">
                                <button id="plBtn" class="btn btn-primary radius" > 发表评论</button>
                            </div>
                        </div>



                        <!--用于回复-->
                        <div class="comment hidden mt-20">
                            <div id="err2" class="Huialert Huialert-danger hidden radius">成功状态提示</div>
                            <textarea class="textarea" style="height:100px;" > </textarea>
                            <button onclick="hf(this);" type="button" class="btn btn-primary radius mt-10">回复</button>
                            <a class="cancelReply f-r mt-10">取消回复</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!--热门推荐-->
        <div class="col-lg-3 col-md-3">
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

            <!--图片-->
            <div class="bg-fff box-shadow radius mb-20">
                <div class="tab-category">
                    <a href=""><strong>WeChat</strong></a>
                </div>
                <div class="tab-category-item">
                    <img data-original="temp/gg.jpg" class="img-responsive lazyload" alt="WeChat">
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
<script> $(function(){ $(window).on("scroll",backToTopFun); backToTopFun(); }); </script>
<script type="text/javascript" src="${ctx }/plugin/wangEditor/js/wangEditor.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("img.lazyload").lazyload({failurelimit : 3});

        wangEditor.config.printLog = false;
        var editor1 = new wangEditor('textarea1');
        editor1.config.menus = ['insertcode', '|', 'quote', '|', 'bold', '|',  'emotion', '|', 'undo', '|', 'fullscreen'];
        editor1.config.emotions = { 'default': { title: '小于初表情', data: '${ctx }/plugin/wangEditor/emotions1.data'}, 'default2': { title: '小于初心情', data: '${ctx }/plugin/wangEditor/emotions3.data'}, 'default3': { title: '顶一顶', data: '${ctx }/plugin/wangEditor/emotions2.data'}};
        editor1.create();

        //show reply
        $(".hf").click(function () {
            pId = $(this).attr("name");
            $(this).parents(".commentList").find(".cancelReply").trigger("click");
            $(this).parent(".comment-body").append($(".comment").clone(true));
            $(this).parent(".comment-body").find(".comment").removeClass("hidden");
            $(this).hide();
        });
        //cancel reply
        $(".cancelReply").on('click',function () {
            $(this).parents(".comment-body").find(".hf").show();
            $(this).parents(".comment-body").find(".comment").remove();
        });
    });
</script>
<script>
    $("#plBtn").click(function () {
        var inputComment = $("#textarea1").val();
        if(inputComment == '') {
            // new TipBox({type:"tip",str:'请输入评论内容!',clickDomCancel:true,setTime:10000500,hasBtn:true});
            $("#err").attr("class","Huialert Huialert-danger radius").html("请输入评论内容!");
            return false;
        }else{
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/api/comment/add",
                data:{
                    articleId:$("#articleId").val(),
                    content: $("#textarea1").val()
                },
                dataType: "json",
                success: function(data) {
                    if(data.stateCode.trim() == "1") {
                        //$("#info").text("评论成功,跳转中...");
                        layer.msg('感谢评论', {icon:16, shade: 0.1, time:2.2})
                        window.location.reload();
                    } else if (data.stateCode.trim() == "2") {
                        // new TipBox({type:"tip",str:'请先登录.或者注册!',clickDomCancel:true,setTime:10000500,hasBtn:true});

                        $("#err").attr("class","Huialert Huialert-danger radius").html("请先登录.或者注册!");
                        return false;
                    }else {
                        //$("#info").text("评论失败...");
                        // new TipBox({type:'error',str:'评论失败!',hasBtn:true});
                        $("#err").attr("class","Huialert Huialert-danger radius").html("评论失败!");
                        return false;
                    }
                }
            })
        }
    });
</script>
</body>
</html>
