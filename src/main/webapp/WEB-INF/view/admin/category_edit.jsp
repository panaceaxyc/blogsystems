<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>电影分类编辑-于初个人博客后台管理</title>
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
                      action="${ctx}/doEditCategory" method="post"
                       >

                    <input type="hidden" value="${cate.id}" name="id">

                    <div class="am-form-group">
                        <label for="title" class="am-u-sm-3 am-form-label">分类名称<span class="tpl-form-line-small-title">CategoryName</span></label>
                        <div class="am-u-sm-9">
                            <input type="text" class="tpl-form-input" id="title" name="categoryname" value="${cate.categoryname}"
                                   placeholder="请输入分类名称">
                            <small id="categoryname"></small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="user-intro" class="am-u-sm-3 am-form-label">分类描述<span class="tpl-form-line-small-title">Deprecated</span></label>
                        <div class="am-u-sm-9">
                            <textarea class="" rows="3" id="desci" name="deprecated" id="user-intro"
                                      placeholder="请输入分类描述">${cate.deprecated}</textarea>
                            <small id="deprecated"></small>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <div class="am-u-sm-9 am-u-sm-push-3">
                            <button type="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success ">更新分类</button>
                            <input type="reset" id="reset" class="am-btn am-btn-primary tpl-btn-bg-color-success"
                                   value="重新填写"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="${ctx}/assets/js/jquery.min.js"></script>
<script src="${ctx}/assets/js/amazeui.min.js"></script>
<script src="${ctx}/assets/js/app.js"></script>
</body>
</html>