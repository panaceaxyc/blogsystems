<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html>
<head>
    <title>博客管理-于初个人博客后台管理</title>
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
    <link rel="apple-touch-icon-precomposed" href="${ctx}/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="stylesheet" href="${ctx}/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${ctx}/assets/css/admin.css">
    <link rel="stylesheet" href="${ctx}/assets/css/app.css">
    <script src="${ctx}/static/js/jquery.slim.min.js" ></script>
    <script src="${ctx}/js/jquery.slim.min.js" ></script>
    <script src="${ctx}/js/layer.js"></script>

    <%--弹出框--%>
    <script src="${ctx}/js/mdialog.js" type="text/javascript"></script>
    <script src="${ctx}/js/zepto.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/css/mdialog.css" />

</head>

<body data-type="generalComponents">
<!--头部-->
<jsp:include page="comm/header.jsp"/>


<div class="tpl-page-container tpl-page-header-fixed">

    <div class="tpl-left-nav tpl-left-nav-hover">
        <div class="tpl-left-nav-title">
            Blog`于初博客
        </div>
        <div class="tpl-left-nav-list">
            <ul class="tpl-left-nav-menu">
                <li class="tpl-left-nav-item">
                    <a href="${ctx}/admin/main" class="nav-link">
                        <i class="am-icon-home"></i>
                        <span>首页</span>
                    </a>
                </li>
                <li class="tpl-left-nav-item">
                    <a href="${ctx}/admin/article/search?word=" class="nav-link active">
                        <i class="am-icon-file-powerpoint-o"></i>
                        <span>博客管理</span>
                    </a>
                </li>
                <li class="tpl-left-nav-item">
                    <a href="${ctx}/boardCheck" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-comment"></i>
                        <span>留言管理</span>

                        <c:if test="${boardCount !=0}">
                            <i class="tpl-left-nav-content tpl-badge-danger">
                                    ${boardCount}
                            </i>
                        </c:if>
                    </a>
                </li>

                <!-- 电影管理 -->
                <li class="tpl-left-nav-item">
                    <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-group"></i>
                        <span>电影管理</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu" style="display: block;">
                        <li>
                            <a href="${ctx }/movie_manager?categoryId=&categoryName=">
                                <i class="am-icon-angle-right"></i>
                                <span>电影列表</span>
                                <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                            </a>
                            <a href="${ctx}/movie_add">
                                <i class="am-icon-angle-right"></i>
                                <span>发布电影</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <!--end 电影管理 -->


                <!-- 电影分类 -->

                <li class="tpl-left-nav-item">
                    <a href="${ctx}/category_manager" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-reorder"></i>
                        <span>分类管理</span>
                    </a>
                </li>
                <!--end 电影分类 -->

                <li class="tpl-left-nav-item">
                    <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-wpforms"></i>
                        <span>其他</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu" style="display: block;">
                        <li>
                            <a href="${ctx}/lable_manager">
                                <i class="am-icon-angle-right"></i>
                                <span>标签云</span>
                                <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                            </a>

                            <a href="${ctx}/link_manager">
                                <i class="am-icon-angle-right"></i>
                                <span>友情链接</span>
                            </a>
                            <a href="${ctx}/admin/bloger_manager" >
                                <i class="am-icon-angle-right"></i>
                                <span>博主信息</span>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>

    <div class="tpl-content-wrapper">
        <div class="tpl-content-page-title">
            Blog`于初博客
        </div>
        <ol class="am-breadcrumb">
            <li><a href="${ctx}/admin/main" class="am-icon-home">首页</a></li>
            <li><a href="${ctx}/admin/article/search?word=">博客管理</a></li>
        </ol>
        <div class="tpl-portlet-components">
            <div class="portlet-title">
                <div class="caption font-green bold">
                    <span class="am-icon-tasks"></span> 博客列表
                </div>
                <div class="tpl-portlet-input tpl-fz-ml">
                    <div class="portlet-input input-small input-inline">
                        <div class="input-icon right">

                        </div>
                    </div>
                </div>
            </div>
            <div class="tpl-block">
                <div class="am-g">
                    <div class="am-u-sm-12 am-u-md-6">
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <button onclick="javascript:window.location.href='${ctx}/admin/article/add'" type="button" class="am-btn am-btn-default am-btn-success"><span
                                        class="am-icon-plus"></span>发布博客
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="am-u-sm-12 am-u-md-3">
                        <div class="am-input-group am-input-group-sm">
                            <input type="text"  placeholder="搜点什么吧.." id="word" name="word"  class="am-form-field">
                            <span class="am-input-group-btn">
                                <button onclick="return submitSeach()" class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search" type="button"></button>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="am-g">
                    <div class="tpl-table-images">
                        <!--从这 开始 -->

                        <c:if test="${empty pageInfo.list}">
                            没有搜到关于 <span style="color: #d9534f;">${word}</span> 的博客.请重新搜索下试试呢?
                        </c:if>
                        <c:forEach items="${pageInfo.list}" var="article">
                            <div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
                                <div class="tpl-table-images-content">
                                    <div class="tpl-table-images-content-i-time">发布时间：${article.localTime}</div>
                                    <div class="tpl-i-title">
                                            ${fn:substring(article.title, 0, 18).concat("...")}
                                    </div>
                                    <a href="javascript:;" class="tpl-table-images-content-i">
                                        <div class="tpl-table-images-content-i-info">
                                            <span class="ico">
                                                <img src="${ctx}/${article.photo}" alt="">${article.username}
                                            </span>
                                        </div>
                                        <span class="tpl-table-images-content-i-shadow">

                                        </span>
                                        <c:if test="${empty article.pic}">
                                            <img style="height: 180px;" src="${ctx}/assets/img/nonepho.jpg"  alt="">
                                        </c:if>
                                        <c:if test="${not empty article}">
                                            <img  src="${ctx}/${article.pic}"   alt="">
                                        </c:if>
                                    </a>
                                    <div class="tpl-table-images-content-block">
                                        <div class="tpl-i-font">
                                                ${fn:substring(article.desci, 0, 15).concat("...")}
                                        </div>
                                        <div class="tpl-i-more">
                                            <ul>
                                                <li>
                                                    <span class="am-icon-eye am-text-warning"> ${article.click}+</span>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs tpl-edit-content-btnttn">
                                                <button style="float: left;" type="button"  onclick="fullScreen('《${article.title}》|编辑','${pageContext.request.contextPath}/admin/article/edit?id=${article.id}')"
                                                        class="am-btn am-btn-default am-btn-secondary"><span
                                                        class="am-icon-edit"></span> 编辑
                                                </button>
                                                <button style="float: right;" onclick="ifdelete('${article.id}','${article.title}') "
                                                        type="button" class="am-btn am-btn-default am-btn-danger">
                                                    <span class="am-icon-trash-o"></span> 删除
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <!--end 循环-->
                        <div class="am-u-lg-12">
                            <div class="am-cf">
                                <div class="am-fr">
                                    <ul class="am-pagination tpl-pagination">

                                        <c:if test="${pageInfo.hasPreviousPage}">
                                            <li><a href="${ctx}/admin/article/search?word=&pn=${pageInfo.pageNum-1}">«</a></li>
                                        </c:if>

                                        <c:if test="${not pageInfo.hasPreviousPage}">
                                              <li style="cursor:not-allowed;" class="am-disabled"><a  href="${ctx}/admin/article/search?word=&pn=${pageInfo.pageNum-1}">«</a></li>
                                        </c:if>

                                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                                            <c:if test="${page_Num == pageInfo.pageNum}">
                                                <li class="am-active"><a href="#">${page_Num}</a></li>
                                            </c:if>
                                            <c:if test="${page_Num != pageInfo.pageNum}">
                                                <li><a href="${ctx}/admin/article/search?word=&pn=${page_Num}">${page_Num}</a></li>
                                            </c:if>
                                        </c:forEach>


                                        <c:if test="${pageInfo.hasNextPage}">
                                            <li><a href="${ctx}/admin/article/search?word=&pn=${pageInfo.pageNum+1}">»</a></li>
                                        </c:if>

                                        <c:if test="${not pageInfo.hasNextPage}">
                                            <li style="cursor:not-allowed;" class="am-disabled"><a href="${ctx}/admin/article/search?word=&pn=${pageInfo.pageNum+1}">»</a></li>
                                        </c:if>

                                    </ul>
                                </div>
                            </div>
                            <hr>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tpl-alert"></div>
        </div>
    </div>
</div>
<script type="text/javascript">

    function fullScreen(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            area: ['70%', '70%'],
            content: url,
            maxmin: true
        });
        layer.full(index);
    }

    function ifdelete(id,title) {

        layer.open({
            type: 1
            ,title: false //不显示标题栏
            ,closeBtn: false
            ,area: '300px;'
            ,shade: 0.8
            ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
            ,resize: false
            ,btn: ['确定','取消']
            ,btnAlign: 'c'
            ,moveType: 0 //拖拽模式，0或者1
            ,content: '<div style="padding: 30px; line-height: 22px; background-color: #a94442; color: #fff; font-weight: 300;">确定删除该文章吗?</div>'
            ,success: function(layero){
                var btn = layero.find('.layui-layer-btn');
                btn.find('.layui-layer-btn0').click(function () {
                    //layer.closeAll();
                    $.ajax({
                        type: "POST",
                        url: "${ctx}/api/article/del",
                        data: {
                            "id": id
                        },
                        datatype:'json',
                        success: function (data) {
                            if (data['stateCode']==1) {
                                layer.open({
                                    type: 1
                                    ,title: false //不显示标题栏
                                    ,closeBtn: false
                                    ,area: '300px;'
                                    ,shade: 0.8
                                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                                    ,resize: false
                                    ,btn: ['好的']
                                    ,btnAlign: 'c'
                                    ,moveType: 0 //拖拽模式，0或者1
                                    ,content: '<div style="padding: 30px; line-height: 22px; background-color: #00CC99; color: #fff; font-weight: 300;">删除成功!</div>'
                                    ,success: function(layero){
                                        var btn = layero.find('.layui-layer-btn');
                                        btn.find('.layui-layer-btn0').click(function () {
                                            window.location.reload();
                                        });
                                    }
                                });

                            } else {
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
                                    ,content: '<div style="padding: 30px; line-height: 22px; background-color: #d9534f; color: #fff; font-weight: 300;">删除失败!</div>'
                                    ,success: function(layero){
                                        var btn = layero.find('.layui-layer-btn');
                                        btn.find('.layui-layer-btn0').click(function () {
                                            window.location.reload();
                                        });
                                    }
                                });
                            }
                        }
                    });
                });
            }
        });

        /*layer.confirm('确定删除该文章吗?', {
            btn: ['确定','取消'] //按钮
        }, function(){
            $.ajax({
                type: 'POST',
                url: ' /api/article/del',
                datatype:'json',
                data:{"id":id},
                success: function(data){
                    if(data['stateCode']==1){
                        layer.msg('删除成功!',{icon:1,time:1000});
                        setTimeout("window.location.reload()",1000);
                    }
                    else {
                        layer.msg('删除失败!',{icon:5,time:1000});
                    }
                },
                error:function(data) {
                    console.log('错误...');
                },
            });
        }, function(){

        });*/
    }



    $(document).on('keydown', function() {
        if (event.keyCode == 13) {
            return submitSeach();
        }
    });
    //文章搜索
    function submitSeach() {
        var word = $("#word").val();
        if(word == '') {
            new TipBox({type:'tip',str:'请输入博客信息',clickDomCancel:true,setTime:10000500,hasBtn:true});
            return false;
        }else{
            window.location.href="${pageContext.request.contextPath}/admin/article/search?word="+word;
        }
    }
</script>
<script src="${ctx}/assets/js/jquery.min.js"></script>
<script src="${ctx}/assets/js/amazeui.min.js"></script>
<script src="${ctx}/assets/js/app.js"></script>
</body>

</html>