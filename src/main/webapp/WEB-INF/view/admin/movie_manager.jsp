<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${ctx}"/>
<!doctype html>
<html>
<head>
    <title>电影管理-于初个人博客后台管理</title>
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
                    <a href="${ctx}/admin/article/search?word=" class="nav-link tpl-left-nav-link-list">
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
                            <a href="${ctx }/movie_manager?categoryId=&categoryName=" class="nav-link active">
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
            Blog`于初电影推荐
        </div>

        <ol class="am-breadcrumb">
            <li><a href="${ctx}/admin/main" class="am-icon-home">首页</a></li>
            <li><a href="${ctx}/admin/article/search?word=">电影管理</a></li>
        </ol>

        <div class="tpl-portlet-components">

            <div class="portlet-title">
                <div class="caption font-green bold">
                    <span class="am-icon-tasks"></span> 电影列表
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
                    <div class="am-u-sm-12 am-u-md-3">
                        <div class="am-form-group">
                            <select  data-am-selected="{btnSize: 'sm'}" id="category" onchange="return sea()">
                                <option value="110">所有分类</option>
                                <c:forEach items="${categoryies}" var="cate">
                                    <option <c:if test="${categoryId eq cate.id}"> selected </c:if>value="${cate.id}">${cate.categoryname}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="am-g">
                    <div class="tpl-table-images">
                        <!--从这 开始 -->
                        <c:if test="${empty pageInfo.list}">
                            没有搜到关于 <span style="color: #d9534f;">${categoryName}</span> 的电影.请重新搜索下试试呢?
                        </c:if>
                        <c:forEach items="${pageInfo.list}" var="movie">
                            <div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
                                <div class="tpl-table-images-content">

                                    <div class="tpl-table-images-content-i-time">发布时间：<fmt:formatDate value="${movie.createdate}"></fmt:formatDate>
                                        <span style="float: right;" > <a class="btn btn-warning">${movie.categoryname}</a> </span>
                                    </div>

                                    <div class="tpl-i-title">
                                            ${fn:substring(movie.movietitle, 0, 18).concat("...")}
                                    </div>
                                    <a href="javascript:;" class="tpl-table-images-content-i">
                                            <img style="height: 180px;" src="${ctx}/${movie.photo}"   alt="${movie.movietitle}">
                                    </a>
                                    <div class="tpl-table-images-content-block">
                                        <div class="tpl-i-font">
                                                ${fn:substring(movie.movieinfo, 0, 15).concat("...")}
                                        </div>
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs tpl-edit-content-btnttn">
                                                <button style="float: left;" type="button"  onclick="fullScreen('《${movie.movietitle}》|更新','${ctx}/movie_edit?id=${movie.id}')"
                                                        class="am-btn am-btn-default am-btn-secondary"><span
                                                        class="am-icon-edit"></span> 编辑
                                                </button>
                                                <button style="float: right;" onclick="ifdelete('${movie.id}','${movie.movietitle}') "
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

<script>
    function sea(){
        var categoryId = parseInt($("#category").val());
        if(categoryId == 110) {
            window.location.href='${ctx }/movie_manager?categoryId=&categoryName='
        }else{
            window.location.href="${ctx }/movie_manager?pn=&categoryId="+categoryId;
        }
    }
</script>

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
        layer.confirm('确定删除该文章吗?', {
            btn: ['确定','取消'] //按钮
        }, function(){
            $.ajax({
                type: 'POST',
                url: '${ctx}/delMovie',
                datatype:'json',
                data:{"id":id},
                success: function(data){
                    if(data.msg=='成功'){
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

        });
    }
</script>
<script src="${ctx}/assets/js/jquery.min.js"></script>
<script src="${ctx}/assets/js/amazeui.min.js"></script>
<script src="${ctx}/assets/js/app.js"></script>
</body>
</html>