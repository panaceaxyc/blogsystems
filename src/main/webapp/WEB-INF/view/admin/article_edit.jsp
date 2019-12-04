<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>博客编辑-于初个人博客后台管理</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="keywords" content="个人博客,于云阔个人博客,个人博客系统,于初博客,于云阔">
    <meta name="description" content="于初博客系统，一个站在java开发之路上的草根程序员个人博客网站。">
    <LINK rel="Bookmark" href="favicon.ico">
    <LINK rel="Shortcut Icon" href="favicon.ico"/>
    <link rel="apple-touch-icon-precomposed" href="${ctx}/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="stylesheet" href="${ctx}/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${ctx}/assets/css/admin.css">
    <link rel="stylesheet" href="${ctx}/assets/css/app.css">
    <script src="${ctx}/js/jquery.slim.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/wangEditor.min.js"></script>
</head>

<body>

<div class="tpl-portlet-components">

    <div class="tpl-block">
        <div class="am-g">
            <div class="tpl-form-body tpl-form-line">
                <form class="am-form tpl-form-line-form"
                      action="${pageContext.request.contextPath}/admin/article/edit/do" method="post"
                      enctype="multipart/form-data">

                    <input type="hidden" value="${article.id}" name="id">


                    <div class="am-form-group">
                        <label for="title" class="am-u-sm-3 am-form-label">文章标题 <span class="tpl-form-line-small-title">Title</span></label>
                        <div class="am-u-sm-9">
                            <input type="text" class="tpl-form-input" id="title" name="title" value="${article.title}"
                                   placeholder="请输入文章标题">
                            <small>请填写标题文字10-20字左右。</small>
                        </div>
                    </div>
                     <%--<div class="am-form-group">
                        <label for="user-email" class="am-u-sm-3 am-form-label">发布时间 <span class="tpl-form-line-small-title">Time</span></label>
                        <div class="am-u-sm-9">
                            <input type="text" class="am-form-field tpl-form-no-bg" placeholder="发布时间"
                                   value=" <fmt:formatDate value="${article.time}"/>"/>
                                   data-am-datepicker="" name="time"/>
                            <small>发布时间为必填</small>
                        </div>
                    </div>--%>
                    <div class="am-form-group">
                        <label for="catalogId" class="am-u-sm-3 am-form-label">栏目 <span
                                class="tpl-form-line-small-title">Author</span></label>
                        <div class="am-u-sm-9">
                            <select data-am-selected="{searchBox: 1}" id="catalogId" name="catalogId">
                                <option value="0" <c:if test="${article.catalogId==0}">selected="selected"</c:if>>学习
                                </option>
                                <option value="1" <c:if test="${article.catalogId==1}">selected="selected"</c:if>>生活
                                </option>
                            </select>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">关键字 <span
                                class="tpl-form-line-small-title">KeyWords</span></label>
                        <div class="am-u-sm-9">
                            <input type="text" id="keywords" name="keywords" value="${article.keywords}"
                                   placeholder="输入关键字">
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="user-intro" class="am-u-sm-3 am-form-label">文章简介</label>
                        <div class="am-u-sm-9">
                            <textarea class="" rows="7" id="desci" name="desci" id="user-intro"
                                      placeholder="请输入文章简介">${article.desci}</textarea>
                        </div>
                    </div>

                    <%--<div class="am-form-group">
                        <label for="user-weibo" class="am-u-sm-3 am-form-label">添加分类 <span class="tpl-form-line-small-title">Type</span></label>
                        <div class="am-u-sm-9">
                            <input type="text" id="user-weibo" placeholder="请添加分类用点号隔开">
                            <div>

                            </div>
                        </div>
                    </div>--%>

                    <%--<div class="am-form-group">
                        <label for="user-intro" class="am-u-sm-3 am-form-label">隐藏文章</label>
                        <div class="am-u-sm-9">
                            <div class="tpl-switch">
                                <input type="checkbox" class="ios-switch bigswitch tpl-switch-btn" checked />
                                <div class="tpl-switch-btn-view">
                                    <div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>--%>

                    <div class="am-form-group">
                        <label for="user-intro" class="am-u-sm-3 am-form-label">文章内容 <span
                                class="tpl-form-line-small-title">Content</span></label>
                        <div id="div1" style="width: 74%;float: right;">
                            ${article.content}
                        </div>
                        <textarea id="content" name="content" style="display: none"></textarea>
                    </div>

                    <!--
                        显示 wangediter
                    -->
                    <div class="am-form-group">
                        <label for="user-weibo" class="am-u-sm-3 am-form-label">封面图 <span
                                class="tpl-form-line-small-title">Images</span></label>
                        <div class="am-u-sm-9">
                            <div class="am-form-group am-form-file">
                                <div class="tpl-form-file-img">
                                    <img src="${ctx}/${article.pic}" id="img" alt="">
                                </div>
                                <button type="button" class="am-btn am-btn-warning am-btn-sm">
                                    <i class="am-icon-cloud-upload"></i> 更换封面图片
                                </button>
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
                            <button type="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success ">更新博客</button>
                            <input type="reset" id="reset" class="am-btn am-btn-primary tpl-btn-bg-color-success"
                                   value="重新填写"/>
                        </div>
                    </div>
                </form>
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
            var url = result.data;
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