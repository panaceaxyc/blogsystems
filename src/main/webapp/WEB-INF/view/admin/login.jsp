<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="keywords" content="个人博客,于云阔个人博客,个人博客系统,于初博客,于云阔">
    <meta name="description" content="于初博客系统，一个站在java开发之路上的草根程序员个人博客网站。">
    <LINK rel="Shortcut Icon" href="favicon.ico"/>
    <link rel="apple-touch-icon-precomposed" href="${ctx}/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="stylesheet" href="${ctx}/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${ctx}/assets/css/admin.css">
    <link rel="stylesheet" href="${ctx}/assets/css/app.css">


    <%--弹出框--%>
    <script src="/js/mdialog.js" type="text/javascript"></script>
    <script src="/js/zepto.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="/css/mdialog.css" />


    <title>于初个人博客`后台登录</title>
</head>
<body data-type="login">

<div class="am-g myapp-login">
    <div class="myapp-login-logo-block  tpl-login-max">
        <div class="myapp-login-logo-text">
            <div class="myapp-login-logo-text">
                于初个人博客<span> 后台登录</span> <img src="${ctx}/images/board.png" style="height: 40px;width:40px;"/>
            </div>
        </div>
        <div class="am-u-sm-10 login-am-center">
            <div class="am-form">
                <fieldset>
                    <div class="am-form-group">
                        <input type="text" class="" name="id" id="adminId" placeholder="用户名`">
                    </div>
                    <div class="am-form-group">
                        <input type="password" class="" name="passwd" id="passwd" placeholder="密码`">
                    </div>
                    <div class="am-form-group-code">
                        <input style="width: 75%; float:left;" type="text" class="" ame="confirmlogo" id="confirmlogo"
                               placeholder="验证码`">
                        <img src="${ctx}/verificationcodeimg" id="code" onclick="reloadcode()"
                             style="cursor: pointer; float:right; border-radius: 0px 0px 6px 6px; width: 25%;height: 47px;"
                             alt="看不清楚,换一张">
                    </div>
                    <div class="am-form-group">
                        <%--提示信息--%>
                        <center><p style="color: red;" id="info"></p></center>
                    </div>
                    <p>
                        <button type="button" id="loginButton"  class="am-btn am-btn-default">登录后台</button>
                    </p>
                </fieldset>
            </div>
        </div>
    </div>
</div>
<script>
    function reloadcode() {
        var verify = document.getElementById('code');
        verify.setAttribute("src", "${pageContext.request.contextPath}/verificationcodeimg?it=" + Math.random());
    }

    $("#adminId").keyup(
        function () {
            if (isNaN($("#adminId").val())) {
                $("#info").text("提示:账号只能为数字");
            }
            else {
                $("#info").text("");
            }
        }
    )

    $(document).on('keydown', function() {
        if (event.keyCode == 13) {
            $("#loginButton").click();
        }
    });


    $("#loginButton").click(function () {
        if ($("#adminId").val() == '' && $("#passwd").val() == '' && $("#confirmlogo").val() == '') {
            // $("#info").text("提示:账号,密码和验证码不能为空");
            new TipBox({type: "tip", str: "账号,密码和验证码不能为空", clickDomCancel: true, setTime: 10000500, hasBtn: true});
            return false;
        }
        else if ($("#adminId").val() == '') {
            // $("#info").text("提示:账号不能为空");
            new TipBox({type: "tip", str: "账号不能为空", clickDomCancel: true, setTime: 10000500, hasBtn: true});
            return false;
        }
        else if ($("#passwd").val() == '') {
            //$("#info").text("提示:密码不能为空");
            new TipBox({type: "tip", str: "密码不能为空", clickDomCancel: true, setTime: 10000500, hasBtn: true});
            return false;
        } else if ($("#confirmlogo").val() == '') {
            //$("#info").text("提示:验证码不能为空");
            new TipBox({type: "tip", str: '验证码不能为空', clickDomCancel: true, setTime: 10000500, hasBtn: true});
            return false;
        } else if (isNaN($("#adminId").val())) {
            //$("#info").text("提示:账号必须为数字");
            new TipBox({type: "tip", str: '账号必须为数字', clickDomCancel: true, setTime: 10000500, hasBtn: true});
            return false;
        }
        else {
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/api/loginCheck",
                data: {
                    id: $("#adminId").val(),
                    password: $("#passwd").val(),
                    confirmlogo: $("#confirmlogo").val()
                },
                dataType: "json",
                success: function (data) {
                    if (data.stateCode.trim() == "0") {
                        //$("#info").text("提示:该用户不存在");
                        new TipBox({type: 'error', str: '该用户不存在!', hasBtn: true});
                        return false;
                        return reloadcode();
                    } else if (data.stateCode.trim() == "1") {
                        //$("#info").text("提示:密码错误");
                        new TipBox({type: 'error', str: '密码错误', hasBtn: true});
                        return false;
                        return reloadcode();
                    } else if (data.stateCode.trim() == "2") {
                        //$("#info").text("提示:验证码错误");
                        new TipBox({type: 'error', str: '验证码错误', hasBtn: true});
                        return false;
                        return reloadcode();
                    } else if (data.stateCode.trim() == "3") {
                        $("#info").text("登陆成功,跳转中...");
                        window.location.href = "${ctx}/admin/main";
                    }
                }
            });
        }
    })
</script>
<script src="${ctx}/assets/js/jquery.min.js"></script>
<script src="${ctx}/assets/js/amazeui.min.js"></script>
<script src="${ctx}/assets/js/app.js"></script>
</body>
</html>
