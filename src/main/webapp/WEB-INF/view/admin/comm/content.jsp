<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="row">
    <div class="am-u-lg-3 am-u-md-6 am-u-sm-12">
        <div class="dashboard-stat blue">
            <div class="visual">
                <i class="am-icon-comments-o"></i>
            </div>
            <div class="details">
                <div class="number"> ${articleCount} &nbsp;&nbsp;</div>
                <div class="desc"> 博客数量</div>
            </div>
        </div>
    </div>
    <div class="am-u-lg-3 am-u-md-6 am-u-sm-12">
        <div class="dashboard-stat red">
            <div class="visual">
                <i class="am-icon-bar-chart-o"></i>
            </div>
            <div class="details">
                <div class="number"> ${commentCount} &nbsp;&nbsp;</div>
                <div class="desc"> 评论数量</div>
            </div>
        </div>
    </div>
    <div class="am-u-lg-3 am-u-md-6 am-u-sm-12">
        <div class="dashboard-stat green">
            <div class="visual">
                <i class="am-icon-apple"></i>
            </div>
            <div class="details">
                <div class="number"> ${adminCount} &nbsp;&nbsp;</div>
                <div class="desc"> 用户数量</div>
            </div>
        </div>
    </div>
    <div class="am-u-lg-3 am-u-md-6 am-u-sm-12">
        <div class="dashboard-stat purple">
            <div class="visual">
                <i class="am-icon-android"></i>
            </div>
            <div class="details">
                <div class="number"> ${loginNum} &nbsp;&nbsp;</div>
                <div class="desc"> 登陆次数</div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="am-u-md-12 am-u-sm-6 row-mb">
        <div class="tpl-portlet">
            <div class="tpl-portlet-title">
                <div class="tpl-caption font-green ">
                    <i class="am-icon-bar-chart"></i>
                    <span>基本数据</span>
                </div>

            </div>

            <div class="am-tabs tpl-index-tabs" data-am-tabs>
                <ul class="am-tabs-nav am-nav am-nav-tabs">
                    <li class="am-active"><a href="#tab1">系统统计</a></li>
                    <li><a href="#tab2">系统信息</a></li>
                </ul>

                <div class="am-tabs-bd">
                    <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                        <div id="wrapperA" class="wrapper">
                            <div id="scroller" class="scroller">
                                <ul class="tpl-task-list tpl-task-remind">
                                    <li>
                                        <div class="cosA">
                                                    <span class="cosIco">
                                                        <i class="am-icon-bell-o"></i>
                                                    </span>
                                            <span> 上次登录时间 &nbsp;&nbsp;&nbsp;
                                                        <span class="tpl-label-info">
                                                            ${loginLog.localTime}
                                                            <i class="am-icon-share"></i>
                                                        </span>
                                                    </span>
                                        </div>
                                    </li>


                                    <li>
                                        <div class="cosA">
                                                    <span class="cosIco label-warning">
                                                        <i class="am-icon-bell-o"></i>
                                                    </span>
                                            <span> 上次登录IP &nbsp;&nbsp;&nbsp;
                                                        <span class="tpl-label-info">
                                                            ${loginLog.ip}
                                                            <i class="am-icon-share"></i>
                                                        </span>
                                                    </span>
                                        </div>
                                    </li>


                                    <li>
                                        <div class="cosA">
                                                     <span class="cosIco label-danger">
                                                         <i class="am-icon-bell-o"></i>
                                                    </span>
                                            <span> 本次登录IP &nbsp;&nbsp;&nbsp;
                                                        <span class="tpl-label-info">
                                                            ${clientIp}
                                                            <i class="am-icon-share"></i>
                                                        </span>
                                                    </span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="am-tab-panel am-fade" id="tab2">
                        <div id="wrapperB" class="wrapper">
                            <div id="scroller" class="scroller">
                                <ul class="tpl-task-list tpl-task-remind">
                                    <li>
                                        <div class="cosA">
                                                    <span class="cosIco">
                                                        <i class="am-icon-bell-o"></i>
                                                    </span>
                                            <span> 服务器IP &nbsp;&nbsp;&nbsp;
                                                        <span class="tpl-label-info">
                                                            ${hostIp}
                                                            <i class="am-icon-share"></i>
                                                        </span>
                                                    </span>
                                        </div>
                                    </li>


                                    <li>
                                        <div class="cosA">
                                                    <span class="cosIco label-warning">
                                                        <i class="am-icon-bell-o"></i>
                                                    </span>
                                            <span> 服务器端口 &nbsp;&nbsp;&nbsp;
                                                        <span class="tpl-label-info">
                                                            ${hostPort}
                                                            <i class="am-icon-share"></i>
                                                        </span>
                                                    </span>
                                        </div>
                                    </li>


                                    <li>
                                        <div class="cosA">
                                                     <span class="cosIco label-danger">
                                                         <i class="am-icon-bell-o"></i>
                                                    </span>
                                            <span> 服务器当前时间 &nbsp;&nbsp;&nbsp;
                                                        <span class="tpl-label-info">
                                                             ${date}
                                                            <i class="am-icon-share"></i>
                                                        </span>
                                                    </span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>


</body>
</html>
