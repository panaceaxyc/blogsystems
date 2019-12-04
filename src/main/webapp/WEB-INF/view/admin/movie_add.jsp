<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>博客添加-于初个人博客后台管理</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="keywords" content="个人博客,于云阔个人博客,个人博客系统,于初博客,于云阔">
    <meta name="description" content="于初博客系统，一个站在java开发之路上的草根程序员个人博客网站。">
    <LINK rel="Bookmark" href="favicon.ico" >
    <LINK rel="Shortcut Icon" href="favicon.ico" />
    <link rel="apple-touch-icon-precomposed" href="${ctx}/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="${ctx}/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="${ctx}/assets/css/admin.css">
    <link rel="stylesheet" href="${ctx}/assets/css/app.css">
    <script src="${ctx}/js/jquery.slim.min.js" ></script>
    <script type="text/javascript" src="${ctx}/js/wangEditor.min.js"></script>
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
                            <a href="${ctx}/movie_add" class="nav-link active">
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
            发布电影`
        </div>
        <ol class="am-breadcrumb">
            <li><a href="${ctx}/admin/main" class="am-icon-home">首页</a></li>
            <li><a href="${ctx}/admin/article/search?word=">电影管理</a></li>
            <li class="am-active">发布电影</li>
        </ol>
        <div class="tpl-portlet-components">
            <div class="portlet-title">
                <div class="caption font-green bold">
                    <span class="am-icon-code"></span> 发布
                </div>
                <div class="tpl-portlet-input tpl-fz-ml">
                    <div class="portlet-input input-small input-inline">
                        <div class="input-icon right">
                            <i class="am-icon-search"></i>
                            <input type="text" class="form-control form-control-solid" placeholder="搜索..."> </div>
                    </div>
                </div>


            </div>

            <div class="tpl-block">

                <div class="am-g">
                    <div class="tpl-form-body tpl-form-line">
                        <form class="am-form tpl-form-line-form" action="${pageContext.request.contextPath}/doAddMovie" method="post" enctype="multipart/form-data">
                            <div class="am-form-group">
                                <label for="title" class="am-u-sm-3 am-form-label">电影标题 <span class="tpl-form-line-small-title">Title</span></label>
                                <div class="am-u-sm-9">
                                    <input type="text" class="tpl-form-input" id="title" name="movietitle"  placeholder="请输入电影标题">
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="catalogId" class="am-u-sm-3 am-form-label">类型 <span class="tpl-form-line-small-title">Category</span></label>
                                <div class="am-u-sm-9">
                                    <select data-am-selected="{searchBox: 1}" id="catalogId" name="categoryid">
                                        <c:forEach items="${categoryies}" var="category">
                                            <option value="${category.id}">${category.categoryname}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-intro" class="am-u-sm-3 am-form-label">电影简介</label>
                                <div class="am-u-sm-9">
                                    <textarea class="" rows="7"  id="desci"  name="movieinfo"  id="user-intro" placeholder="请输入电影简介"></textarea>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-intro" class="am-u-sm-3 am-form-label">文章内容 <span class="tpl-form-line-small-title">Content</span></label>
                                    <div id="div1" style="width: 74%;float: right;">
                                    </div>
                                    <textarea id="content" name="moviecontent" style="display: none"></textarea>
                            </div>

                            <!--
                                显示 wangediter
                            -->
                            <div class="am-form-group">
                                <label for="user-weibo" class="am-u-sm-3 am-form-label">电影封面图 <span class="tpl-form-line-small-title">Images</span></label>
                                <div class="am-u-sm-9">
                                    <div class="am-form-group am-form-file">
                                        <div class="tpl-form-file-img">
                                            <img src="${ctx}/assets/img/a5.png" id="img" alt="">
                                        </div>
                                        <button type="button" class="am-btn am-btn-danger am-btn-sm">
                                            <i class="am-icon-cloud-upload"></i> 添加电影图片</button>
                                        <input type="file" name="file" accept="" id="file">
                                    </div>
                                </div>


                                <script>
                                    $("#file").change(function (e) {
                                        var files = e.target.files[0];
                                        if (!/image\/\w+/.test(files.type)) {
                                            alert("请上传图片");
                                            return;
                                        }
                                        var reader = new FileReader();
                                        reader.readAsDataURL(files);
                                        reader.onload = function () {
                                            var url = this.result;
                                            $("#img").attr('src', url);
                                            $(".photo>p").html(' ');
                                        };
                                        console.log(e.target.files[0])
                                    })
                                </script>
                            </div>


                            <div class="am-form-group">
                                <div class="am-u-sm-9 am-u-sm-push-3">
                                    <button type="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success ">发表电影</button>
                                    <input type="reset" id="reset" class="am-btn am-btn-primary tpl-btn-bg-color-success" value="重新填写" />
                                </div>
                            </div>


                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#div1')
    var $text1 = $('#content')
    editor.customConfig.onchange = function (html) {
        // 监控变化，同步更新到 textarea
        $text1.val(html)
    }
    //开启debug模式
    editor.customConfig.debug = true;
    // 关闭粘贴内容中的样式
    editor.customConfig.pasteFilterStyle = false
    // 忽略粘贴内容中的图片
    editor.customConfig.pasteIgnoreImg = true
    // 使用 base64 保存图片
    //editor.customConfig.uploadImgShowBase64 = true

    // 上传图片到服务器
    editor.customConfig.uploadFileName = 'myFileName'; //设置文件上传的参数名称
    editor.customConfig.uploadImgServer = '${ctx}/admin/uploadImg'; //设置上传文件的服务器路径
    editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024;
    editor.customConfig.uploadImgMaxLength = 5;
    editor.customConfig.uploadFileName = 'myFileName';
    editor.customConfig.uploadImgHooks = {
        customInsert: function (insertImg, result, editor) {
            // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
            // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果
            // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
            var url =result.data;
            insertImg(url);
            // result 必须是一个 JSON 格式字符串！！！否则报错
        }
    }
    editor.create();
    // 初始化 textarea 的值
    $text1.val(editor.txt.html());
    $("#reset").click(function () {
        editor.txt.clear();
    });
</script>
<script src="${ctx}/assets/js/jquery.min.js"></script>
<script src="${ctx}/assets/js/amazeui.min.js"></script>
<script src="${ctx}/assets/js/app.js"></script>
</body>
</html>