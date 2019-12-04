<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html>
<title>留言板 — 一个站在java开发之路上的草根程序员个人博客网站</title>
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
<link rel="stylesheet" type="text/css" href="${ctx }/plugin/wangEditor/css/wangEditor.min.css">

<%--layui--%>
<script src="${ctx}/js/jquery.slim.min.js" ></script>
<script src="${ctx}/js/layer.js"></script>

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
    <jsp:param value="board" name="tip"/>
</jsp:include>


<!--导航条-->
<nav class="breadcrumb">
    <div class="container"><i class="Hui-iconfont">&#xe67f;</i> <a href="${ctx }/index" class="c-primary">首页</a> <span
            class="c-gray en">&gt;</span> <span class="c-gray">留言板</span></div>
</nav>

<section class="container">
    <div class="col-xs-12 col-md-10 col-md-offset-1 mt-20">
        <!--用于评论-->
        <div class="mt-20" id="ct">
            <div id="err"></div>
            <img src="${ctx}/images/board.png" style="width: 50px;height: 50px; border-radius: 50%;"/>抢沙发 <div style="color:#d9534f;float:right; margin-top: 20px;">提示:只有管理员审核通过的留言才会显示在下面o</div>
            <textarea id="textarea1" name="comment" style="height:200px;" placeholder="说点什么吧.."></textarea>
            <div class="text-r mt-10">
                <button onclick="getPlainTxt()" class="btn btn-primary radius"> 发表评论</button>
            </div>
        </div>
        <div class="line"></div>
        <ul class="commentList mt-50">
            <c:forEach items="${boards}" var="board">
                <c:if test="${board.status==1}">
                    <input type="hidden" id="id" value="${board.id}"/>
                    <input type="hidden" id="lc" value="${board.lc}"/>
                    <li class="item cl"><a href="#"><i class="avatar size-L radius">
                        <img src="${ctx}/${board.photo}" style="width: 50px;height: 50px; border-radius: 50%;"/></i></a>
                        <div class="comment-main">
                            <header class="comment-header">
                                <div class="comment-meta"><a class="comment-author" href="#">${board.name} #${board.lc}楼</a>
                                    <time title="${board.date}" datetime="${board.date}" class="f-r">
                                        <fmt:formatDate value="${board.date}"></fmt:formatDate>
                                    </time>
                                </div>
                            </header>
                            <div class="comment-body">
                                    ${board.content}
                            </div>
                        </div>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
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
<script type="text/javascript" src="${ctx }/plugin/wangEditor/js/wangEditor.min.js"></script>
<script>
    function getPlainTxt() {
        if ($("#textarea1").val() == '') {
            $("#err").attr("class", "Huialert Huialert-danger radius").html("请输入评论内容!");
            return false;
        } else {
            $.ajax({
                type:"GET",
               url:"${ctx}/selectMaxLc",
                success:function (result) {
                    //alert(result.info.lc);//弹出
                    var lc = parseInt(result.info.lc);
                    $.ajax({
                        type: "POST",
                        url: "${ctx}/insertBoard",
                        data: {
                            "name": "匿名",
                            "photo": "images/board.png",
                            "content": $("#textarea1").val(),
                            "date": new Date(),
                            "lc": lc + 1,
                            "status":"0"
                        },
                        success: function (result) {
                            if (result.msg == '成功') {
                                $("#err").attr("class", "Huialert Huialert-success radius").html("留言成功!等待管理员审核.");
                                //留言成功!
                                layer.open({
                                    type: 1
                                    ,title: false //不显示标题栏
                                    ,closeBtn: false
                                    ,area: '300px;'
                                    ,shade: 0.8
                                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                                    ,resize: false
                                    ,btn: ['知道了']
                                    ,btnAlign: 'c'
                                    ,moveType: 0 //拖拽模式，0或者1
                                    ,content: '<div style="padding: 30px; line-height: 22px; background-color: #985f0d; color: #fff; font-weight: 300;">留言成功!等待管理员审核.<img src="/static/images/board.png" style="width:30px;height:30px;"/></div>'
                                    ,success: function(layero){
                                        var btn = layero.find('.layui-layer-btn');
                                        btn.find('.layui-layer-btn0').click(function () {
                                            window.location.reload();
                                        });
                                    }
                                });
                            } else {
                                $("#err").attr("class", "Huialert Huialert-danger radius").html("评论失败!");
                                return false;
                            }
                        }
                    })
                }
            });
        }
    }
</script>
<script type="text/javascript" src="${ctx}/js/wangEditor.min.js"></script>
<script type="text/javascript">
    $(function () {
        wangEditor.config.printLog = false;
        var editor1 = new wangEditor('textarea1');
        editor1.config.menus = ['insertcode', '|', 'quote', '|', 'bold', '|','emotion', '|', 'undo', '|', 'fullscreen'];
        editor1.config.emotions = {
            'default': {title: '老王表情', data: 'plugin/wangEditor/emotions1.data'},
            'default2': {title: '老王心情', data: 'plugin/wangEditor/emotions3.data'},
            'default3': {title: '顶一顶', data: 'plugin/wangEditor/emotions2.data'}
        };

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
        $(".cancelReply").on('click', function () {
            $(this).parents(".comment-body").find(".hf").show();
            $(this).parents(".comment-body").find(".comment").remove();
        });
    });

</script>

</body>
</html>
