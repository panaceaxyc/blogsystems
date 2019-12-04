<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String tip = request.getParameter("tip");

%>
<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container cl">
            <a class="navbar-logo hidden-xs" href="index.jsp">
                <img class="logo" src="img/logo.png" alt="于初博客`"/>
            </a>
            <a class="logo navbar-logo-m visible-xs" href="index.jsp">于初博客</a>
            <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:void(0);"
               onclick="showSide();">&#xe667;</a>
            <nav class="nav navbar-nav nav-collapse w_menu" role="navigation">
                <ul class="cl">
                    <%
                        if (tip.equals("index") || tip.equals("")) {
                    %>
                    <li class="active"><a href="${ctx}/index" data-hover="首页">首页</a></li>
                    <li><a href="${ctx }/about" data-hover="关于我">关于我</a></li>
                    <li><a href="${ctx }/mood" data-hover="碎言碎语">碎言碎语</a></li>
                    <li><a href="${ctx }/searchMovieByCategoryId?categoryId=&categoryName="
                                          data-hover="于初电影">于初电影</a>
                    <li><a href="${ctx }/board" data-hover="留言板">留言板</a></li>
                    </li>
                    <%
                    } else if (tip.equals("about")) {
                    %>
                    <li><a href="${ctx}/index" data-hover="首页">首页</a></li>
                    <li class="active"><a href="${ctx }/about" data-hover="关于我">关于我</a></li>
                    <li><a href="${ctx }/mood" data-hover="碎言碎语">碎言碎语</a></li>
                    <li class="active"><a href="${ctx }/searchMovieByCategoryId?categoryId=&categoryName="
                                          data-hover="于初电影">于初电影</a>
                    <li><a href="${ctx }/board" data-hover="留言板">留言板</a></li>
                    <%
                    } else if (tip.equals("mood")) {
                    %>
                    <li><a href="${ctx}/index" data-hover="首页">首页</a></li>
                    <li><a href="${ctx }/about" data-hover="关于我">关于我</a></li>
                    <li class="active"><a href="${ctx }/mood" data-hover="碎言碎语">碎言碎语</a></li>
                    <li class="active"><a href="${ctx }/searchMovieByCategoryId?categoryId=&categoryName="
                                          data-hover="于初电影">于初电影</a>
                    <li><a href="${ctx }/board" data-hover="留言板">留言板</a></li>
                    <%
                    } else if (tip.equals("movie")) {
                    %>
                    <li><a href="${ctx}/index" data-hover="首页">首页</a></li>
                    <li><a href="${ctx }/about" data-hover="关于我">关于我</a></li>
                    <li><a href="${ctx }/mood" data-hover="碎言碎语">碎言碎语</a></li>
                    <li class="active"><a href="${ctx }/searchMovieByCategoryId?categoryId=&categoryName="
                                          data-hover="于初电影">于初电影</a>
                    <li><a href="${ctx }/board" data-hover="留言板">留言板</a></li>
                    <%
                    } else {
                    %>
                    <li><a href="${ctx}/index" data-hover="首页">首页</a></li>
                    <li><a href="${ctx }/about" data-hover="关于我">关于我</a></li>
                    <li><a href="${ctx }/mood" data-hover="碎言碎语">碎言碎语</a></li>
                    <li><a href="${ctx }/searchMovieByCategoryId?categoryId=&categoryName=" data-hover="于初电影">于初电影</a>
                    <li class="active"><a href="${ctx }/board" data-hover="留言板">留言板</a></li>
                    <%
                        }
                    %>
                </ul>
            </nav>
            <nav class="navbar-nav navbar-userbar hidden-xs hidden-sm " style="top: 0;">
                <ul class="cl">
                    <li class="userInfo dropDown dropDown_hover">
                        <!--<a href="javascript:;" ><img class="avatar radius" src="${ctx }/img/40.jpg" alt="丶似浅 "></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="/app/loginOut">退出</a></li>
                        </ul>-->
                        <c:if test="${not empty admin}">
                            <a href="${ctx}/admin/main" onclick="layer.msg('进入后台..', {icon:16, shade: 0.1, time:0})"><img src="${ctx}/images/board.png" style="height: 30px;width:32px;"/>进入后台</a>

                        </c:if>
                        <c:if test="${empty admin}">
                            <a href="${ctx}/login" onclick="layer.msg('登录..', {icon:16, shade: 0.1, time:0})"><img src="${ctx}/images/board.png" style="height: 30px;width:32px;"/>登入</a>
                        </c:if>
                        <%--<iframe style="float: right;" width="320" scrolling="no" height="50" frameborder="0" allowtransparency="false" src="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=5"></iframe>--%>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
</body>
</html>
