<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html>

<head>
    <title>留言管理-于初个人博客后台管理</title>
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

    <script src="${ctx}/js/jquery.slim.min.js"></script>
    <script src="${ctx}/js/layer.js"></script>
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
                    <a href="${ctx}/boardCheck" class="nav-link active">
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
            留言列表
        </div>
        <ol class="am-breadcrumb">
            <li><a href="${ctx}/admin/main" class="am-icon-home">首页</a></li>
            <li class="am-active">留言列表</li>
        </ol>
        <div class="tpl-portlet-components">
            <div class="portlet-title">
                <div class="caption font-green bold">
                    <span class="am-icon-code"></span> 留言板
                </div>
                <div class="tpl-portlet-input tpl-fz-ml">
                    <div class="portlet-input input-small input-inline">
                        <div class="input-icon right">
                            <i class="am-icon-search"></i>
                            <input type="text" class="form-control form-control-solid" placeholder="搜索..."></div>
                    </div>
                </div>


            </div>
            <div class="tpl-block">
                <div class="am-g">
                    <div class="am-u-sm-12">
                        <table class="am-table am-table-striped am-table-hover table-main">
                            <thead>
                            <tr>
                                <th class="table-id">ID</th>
                                <th class="table-title">留言人名称</th>
                                <th class="table-author am-hide-sm-only">留言日期</th>
                                <th class="table-date am-hide-sm-only">所属楼层</th>
                                <th class="table-date am-hide-sm-only">留言状态</th>
                                <th class="table-set">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${pageInfo.list}" var="board">
                                <tr>
                                    <td>${board.id}</td>
                                    <td><a href="#">${board.name}</a></td>
                                    <td class="am-hide-sm-only">
                                        <fmt:formatDate value="${board.date}"></fmt:formatDate>
                                    </td>
                                    <td class="am-hide-sm-only"># ${board.lc} 楼</td>
                                    <td class="am-hide-sm-only">${board.status=='0'?'未通过审核':'已通过审核'}</td>
                                    <td>
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                                <button onclick="return eye('${board.id}','${board.name}')"
                                                        class="am-btn am-btn-default am-btn-xs am-hide-sm-only">
                                                    <span class="am-icon-eye"></span> 查看
                                                </button>
                                                <button onclick="return check(${board.id})" class="am-btn am-btn-default am-btn-xs am-text-secondary">
                                                    <span class="am-icon-archive"></span>审核
                                                </button>
                                                <button onclick="return deleteBoard(${board.id})" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
                                                    <span class="am-icon-trash-o"></span> 删除
                                                </button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <!--分页信息-->
                        <div class="am-cf">
                            <div class="am-fr">
                                <ul class="am-pagination tpl-pagination">

                                    <c:if test="${pageInfo.hasPreviousPage}">
                                        <li><a href="${ctx}/boardCheck?pn=${pageInfo.pageNum-1}">«</a></li>
                                    </c:if>

                                    <c:if test="${not pageInfo.hasPreviousPage}">
                                        <li style="cursor:not-allowed;" class="am-disabled"><a
                                                href="${ctx}/boardCheck?pn=${pageInfo.pageNum-1}">«</a></li>
                                    </c:if>

                                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                                        <c:if test="${page_Num == pageInfo.pageNum}">
                                            <li class="am-active"><a href="#">${page_Num}</a></li>
                                        </c:if>
                                        <c:if test="${page_Num != pageInfo.pageNum}">
                                            <li><a href="${ctx}/boardCheck?pn=${page_Num}">${page_Num}</a></li>
                                        </c:if>
                                    </c:forEach>


                                    <c:if test="${pageInfo.hasNextPage}">
                                        <li><a href="${ctx}/boardCheck?pn=${pageInfo.pageNum+1}">»</a></li>
                                    </c:if>

                                    <c:if test="${not pageInfo.hasNextPage}">
                                        <li style="cursor:not-allowed;" class="am-disabled"><a
                                                href="${ctx}/boardCheck?pn=${pageInfo.pageNum+1}">»</a></li>
                                    </c:if>

                                </ul>
                            </div>
                        </div>

                        <hr>
                    </div>

                </div>
            </div>
            <div class="tpl-alert"></div>
        </div>
    </div>
</div>


<script>

    /**
     * 查看
     * @param id
     * @param name
     */
    function eye(id, name) {
        $.ajax({
            type: "POST",
            url: "${ctx}/getBoardById",
            data: {
                "id": id
            },
            success: function (result) {
                layer.open({
                    type: 1
                    ,
                    title: "来自" + name + "的用户" //不显示标题栏
                    ,
                    closeBtn: false
                    ,
                    area: '300px;'
                    ,
                    shade: 0.8
                    ,
                    id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,
                    btn: ['好的']
                    ,
                    btnAlign: 'c'
                    ,
                    moveType: 1 //拖拽模式，0或者1
                    ,
                    content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">' + result.info.board.content + '</div>'
                    ,
                    success: function (layero) {
                        var btn = layero.find('.layui-layer-btn');
                        btn.find('.layui-layer-btn0').click(function () {
                             layer.closeAll();
                        });
                    }
                });
            }
        });
    }

    /**
     * 审核
     * @param id
     */
    function check(id) {
        layer.open({
            type: 1
            ,title: false //不显示标题栏
            ,closeBtn: false
            ,area: '300px;'
            ,shade: 0.8
            ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
            ,resize: false
            ,btn: ['审核','不审核']
            ,btnAlign: 'c'
            ,moveType: 0 //拖拽模式，0或者1
            ,content: '<div style="padding: 30px; line-height: 22px; background-color: #3c3c3c; color: #fff; font-weight: 300;">是否要通过留言?</div>'
            ,success: function(layero){
                var btn = layero.find('.layui-layer-btn');
                btn.find('.layui-layer-btn0').click(function () {
                    //layer.closeAll();
                    $.ajax({
                        type: "POST",
                        url: "${ctx}/checkBoard",
                        data: {
                            "id": id,
                            "status": 1
                        },
                        success: function (result) {
                            if (result.msg == '成功') {
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
                                    ,content: '<div style="padding: 30px; line-height: 22px; background-color: #00CC99; color: #fff; font-weight: 300;">审核通过!</div>'
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
                                    ,content: '<div style="padding: 30px; line-height: 22px; background-color: #d9534f; color: #fff; font-weight: 300;">审核未通过!</div>'
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
    }

    /**
     * 删除
     * @param id
     */
    function deleteBoard(id) {
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
            ,content: '<div style="padding: 30px; line-height: 22px; background-color: #a94442; color: #fff; font-weight: 300;">是否要该删除留言?</div>'
            ,success: function(layero){
                var btn = layero.find('.layui-layer-btn');
                btn.find('.layui-layer-btn0').click(function () {
                    //layer.closeAll();
                    $.ajax({
                        type: "POST",
                        url: "${ctx}/deleteBoard",
                        data: {
                            "id": id
                        },
                        success: function (result) {
                            if (result.msg == '成功') {
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
    }
</script>

<script src="${ctx}/assets/js/jquery.min.js"></script>
<script src="${ctx}/assets/js/amazeui.min.js"></script>
<script src="${ctx}/assets/js/app.js"></script>
</body>
</html>