<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="tpl-left-nav tpl-left-nav-hover">
    <div class="tpl-left-nav-title">
        Blog`于初博客
    </div>
    <div class="tpl-left-nav-list">
        <ul class="tpl-left-nav-menu">
            <li class="tpl-left-nav-item">
                <a href="${ctx}/admin/main" class="nav-link active">
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
                <ul class="tpl-left-nav-sub-menu">
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
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>

</body>
</html>
