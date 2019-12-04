<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html>

<head>
    <title>友情链接管理-于初个人博客后台管理</title>
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
                            <a href="${ctx }/movie_manager?categoryId=&categoryName=" >
                                <i class="am-icon-angle-right"></i>
                                <span>电影列表</span>
                                <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                            </a>
                            <a href="${ctx}/movie_add" >
                                <i class="am-icon-angle-right"></i>
                                <span>发布电影</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <!--end 电影管理 -->

                <!-- 电影分类 -->

                <li class="tpl-left-nav-item">
                    <a href="${ctx}/category_manager" class="nav-link">
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
                            <a href="${ctx}/lable_manager" >
                                <i class="am-icon-angle-right"></i>
                                <span>标签云</span>
                                <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                            </a>

                            <a href="${ctx}/link_manager" class="nav-link active">
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
            友情链接
        </div>
        <ol class="am-breadcrumb">
            <li><a href="${ctx}/admin/main" class="am-icon-home">首页</a></li>
            <li class="am-active">友情链接列表</li>
        </ol>
        <div class="tpl-portlet-components">
            <div class="portlet-title">
                <div class="caption font-green bold">
                    <span class="am-icon-code"></span> 链接
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
                    <div class="am-u-sm-12 am-u-md-6">
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <button  id="add" type="button" class="am-btn am-btn-default am-btn-success"><span
                                        class="am-icon-plus"></span>新增友情链接
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="am-u-sm-12">
                        <table class="am-table am-table-striped am-table-hover table-main">
                            <thead>
                            <tr>
                                <th class="table-id">ID</th>
                                <th class="table-title">友情链接名称</th>
                                <th class="table-author am-hide-sm-only">友情链接地址</th>
                                <th class="table-set">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${links}" var="linkk">
                                <tr>
                                    <td>${linkk.id}</td>
                                    <td><a href="#">${linkk.linkName}</a></td>
                                    <td><a href="#">${linkk.linkUrl}</a></td>
                                    <td>
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                                <button onclick="return updateLink(${linkk.id})" class="am-btn am-btn-default am-btn-xs am-text-secondary">
                                                    <span class="am-icon-edit"></span>编辑
                                                </button>
                                                <button onclick="return delLink(${linkk.id})" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
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
     * 点击添加
     */
    $("#add").click(function () {
        layer.open({
            type: 1
            ,title: false //不显示标题栏
            ,closeBtn: false
            ,shade: 0.8
            ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
            ,resize: false
            ,btn: ['关闭']
            ,btnAlign: 'c'
            ,moveType: 0 //拖拽模式，0或者1
            ,content: '<div style="padding: 30px; line-height: 22px; background-color: #fff; color: #fff; font-weight: 300;">' +
                '<form class="am-form tpl-form-line-form"\n' +
                '                      action="${ctx}/doAddLink" method="post"\n' +
                '                >\n' +
                '\n' +
                '\n' +
                '                    <div class="am-form-group">\n' +
                '                        <label for="title" class="am-u-sm-3 am-form-label">名称<span class="tpl-form-line-small-title">LinkName</span></label>\n' +
                '                        <div class="am-u-sm-9">\n' +
                '                            <input type="text" class="tpl-form-input" id="title" name="linkName"  \n' +
                '                                   placeholder="请输入名称">\n' +
                '                            <small id="categoryname"></small>\n' +
                '                        </div>\n' +
                '                    </div>\n' +
                '\n' +
                '\n' +
                '                    <div class="am-form-group">\n' +
                '                        <label for="user-intro" class="am-u-sm-3 am-form-label">链接<span class="tpl-form-line-small-title">LinkURL</span></label>\n' +
                '                        <div class="am-u-sm-9">\n' +
                '                            <input type="text" class="tpl-form-input" id="title" name="linkUrl"  \n' +
                '                                   placeholder="请输入地址">\n' +
                '                            <small id="deprecated"></small>\n' +
                '                        </div>\n' +
                '                    </div>\n' +
                '\n' +
                '                    <div class="am-form-group">\n' +
                '                        <div class="am-u-sm-9 am-u-sm-push-3">\n' +
                '                            <button type="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success ">添加</button><br/>\n' +
                '                             \n' +
                '                        </div>\n' +
                '                    </div>\n' +
                '                </form></div>'
            ,success: function(layero){
                var btn = layero.find('.layui-layer-btn');
                btn.find('.layui-layer-btn0').click(function () {
                    //window.location.reload();
                    layer.closeAll();
                });
            }
        });
    });


    /**
     * 修改
     * @param id
     */
    function updateLink(id) {
        $.ajax({
            type:"POST",
            url:"${ctx}/editLinkPage",
            data:{
                "id":id
            },
            success:function (result) {
                if(result.msg=='成功'){
                    var id = result.info.links.id;
                    var linkname = result.info.links.linkName;
                    var linkurl = result.info.links.linkUrl;
                    layer.open({
                        type: 1
                        ,title: false //不显示标题栏
                        ,closeBtn: false
                        ,shade: 0.8
                        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                        ,resize: false
                        ,btn: ['关闭']
                        ,btnAlign: 'c'
                        ,moveType: 0 //拖拽模式，0或者1
                        ,content: '<div style="padding: 30px; line-height: 22px; background-color: #fff; color: #fff; font-weight: 300;">' +
                            '<form class="am-form tpl-form-line-form"\n' +
                            '                      action="${ctx}/doEditLink" method="post"\n' +
                            '                >\n' +
                            '\n' +
                            '\n' +
                            '                   <input type="hidden" name="id" value="'+id+'"/> <div class="am-form-group">\n' +
                            '                        <label for="title" class="am-u-sm-3 am-form-label">名称<span class="tpl-form-line-small-title">LinkName</span></label>\n' +
                            '                        <div class="am-u-sm-9">\n' +
                            '                            <input type="text" class="tpl-form-input" id="title" name="linkName" value="'+linkname+'"\n' +
                            '                                   placeholder="请输入分类名称">\n' +
                            '                            <small id="categoryname"></small>\n' +
                            '                        </div>\n' +
                            '                    </div>\n' +
                            '\n' +
                            '\n' +
                            '                    <div class="am-form-group">\n' +
                            '                        <label for="user-intro" class="am-u-sm-3 am-form-label">地址<span class="tpl-form-line-small-title">LinkURL</span></label>\n' +
                            '                        <div class="am-u-sm-9">\n' +
                            '                            <input type="text" class="tpl-form-input" id="title" name="linkUrl"  \n' +
                            '                                value="'+linkurl+'"   placeholder="请输入地址">\n' +
                            '                            <small id="deprecated"></small>\n' +
                            '                        </div>\n' +
                            '                    </div>\n' +
                            '\n' +
                            '                    <div class="am-form-group">\n' +
                            '                        <div class="am-u-sm-9 am-u-sm-push-3">\n' +
                            '                            <button type="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success ">修改</button><br/>\n' +
                            '                             \n' +
                            '                        </div>\n' +
                            '                    </div>\n' +
                            '                </form></div>'
                        ,success: function(layero){
                            var btn = layero.find('.layui-layer-btn');
                            btn.find('.layui-layer-btn0').click(function () {
                                //window.location.reload();
                                layer.closeAll();
                            });
                        }
                    });
                }else{
                    alert("系统错误!");
                }
            }
        })
    }

    /**
     * 删除
     * @param id
     */
    function delLink(id) {
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
            ,content: '<div style="padding: 30px; line-height: 22px; background-color: #a94442; color: #fff; font-weight: 300;">是否要删除该友情链接?</div>'
            ,success: function(layero){
                var btn = layero.find('.layui-layer-btn');
                btn.find('.layui-layer-btn0').click(function () {
                    //layer.closeAll();
                    $.ajax({
                        type: "POST",
                        url: "${ctx}/delLink",
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