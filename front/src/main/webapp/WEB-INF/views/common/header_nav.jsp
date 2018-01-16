<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--Top-->
<nav id="top">
    <div class="container">
        <div class="row">
            <div class="col-xs-6">
                <select class="language">
                    <option value="chinese" selected>中文</option>
                    <option value="english">English</option>
                </select>
            </div>
            <div class="col-xs-6">
                <ul class="top-link">
                    <c:choose>
                        <c:when test="${sessionScope.user != null}">
                            <li><span class="glyphicon glyphicon-user"></span> ${sessionScope.user.uname} <a href="${ctx}/logout">退出</a> </li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="${ctx}/account.jsp"><span class="glyphicon glyphicon-user"></span> 我的账号</a></li>
                        </c:otherwise>
                    </c:choose>
                    <li><a href="${ctx}/contact.jsp"><span class="glyphicon glyphicon-envelope"></span> 联系</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<!--Header-->
<header class="container">
    <div class="row">
        <div class="col-md-4">
            <div id="logo"><a href="${ctx}/index"><img src="${ctx}/static/images/logo.png" /></a></div>
        </div>
        <div class="col-md-4">
            <form class="form-search" action="list" method="get">
                <input type="text" name="keyWord" value="${requestScope.result.keyWord}" class="input-medium search-query" required/>
                <input type="hidden" name="page" value="1"/>
                <button type="submit" class="btn"><span class="glyphicon glyphicon-search"></span></button>
            </form>
        </div>
        <div class="col-md-4">
            <div id="cart"><a class="btn btn-1" href="${ctx}/user/cart"><span class="glyphicon glyphicon-shopping-cart"></span>购物车</a></div>
        </div>
    </div>
</header>
<!--Navigation-->
<nav id="menu" class="navbar">
    <div class="container">
        <div class="navbar-header"><span id="heading" class="visible-xs">产品分类</span>
            <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
        </div>
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav">
                <li><a href="${ctx}/index">首页</a></li>
                <c:forEach items="${applicationScope.cbs}" var="cb">
                    <li class="dropdown"><a href="${ctx}/list?cid=${cb.cid}&page=1" >${cb.name}</a>
                        <div class="dropdown-menu">
                            <div class="dropdown-inner">
                                <ul class="list-unstyled">
                                    <c:forEach items="${cb.brands}" var="brand" varStatus="status">
                                        <li><a href="${ctx}/list?cid=${cb.cid}&bid=${brand.bid}&page=1">${brand.name}</a></li>
                                        <c:if test="${status.count % 4 == 0}">
                                            </ul>
                                            <ul class="list-unstyled">
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </li>
                </c:forEach>
                <li><a href="${ctx}/list?page=1">全部商品</a></li>
            </ul>
        </div>
    </div>
</nav>
