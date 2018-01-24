<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>收货地址 - Mobile Shop</title>
    <%@ include file="common/head.jsp" %>
    <link type="text/css" rel="stylesheet" href="${path}/static/css/address.css"/>
</head>
<body>
<%@ include file="common/header_nav.jsp" %>
<div id="page-content" class="single-page">
    <div class="container">
        <div class="row">
            <div id="sidebar" class="col-md-2">
                <div class="widget wid-categories">
                    <div class="heading"><h4>个人中心</h4></div>
                    <div class="content">
                        <ul>
                            <li><a href="${path}/profile">个人资料</a></li>
                            <li><a href="${path}/address">收货地址</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-10">
                <div class="row">
                    <form>
                        <fieldset>
                            <legend>添加收货地址</legend>
                            <div class="form-group">
                                <label for="name">收件人:</label>
                                <input id="name" class="input" name="name" type="text" placeholder="输入收件人姓名" required/>
                            </div>
                            <div class="form-group">
                                <label for="tel">电话:</label>
                                <input id="tel" name="tel" type="text" placeholder="输入收件人电话" required/>
                            </div>
                            <div class="form-group">
                                <label for="tel">收货地址:</label>
                                <textarea id="addr" name="addr" rows="3" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-default">提交</button>
                        </fieldset>
                    </form>
                </div>
                <div class="row">
                    <c:forEach items="${requestScope.addresses}" var="address">
                        <div class="col-md-6">
                            <div class="address">
                                <div class="header">
                                    <h4 class="name">${address.name}</h4>
                                    <c:if test="${address.isDefault == 1}">
                                        <span class="tag">默认地址</span>
                                    </c:if>
                                    <i title="删除" class="btn btn-remove glyphicon glyphicon-remove"></i>
                                    <i title="修改" class="btn btn-remove glyphicon glyphicon-edit"></i>
                                </div>
                                <hr>
                                <div class="row item" style="margin: 0">
                                    <span class="col-md-4 col-sm-2 col-xs-4 item-key">收件人：</span>
                                    <span class="col-md-8 col-sm-10 col-xs-8 item-value">${address.name}</span>
                                </div>
                                <div class="row item" style="margin: 0">
                                    <span class="col-md-4 col-sm-2 col-xs-4 item-key">电话：</span>
                                    <span class="col-md-8 col-sm-10 col-xs-8 item-value">${address.tel}</span>
                                </div>
                                <div class="row item" style="margin: 0">
                                    <span class="col-md-4 col-sm-2 col-xs-4 item-key">收货地址：</span>
                                    <span class="col-md-8 col-sm-10 col-xs-8 item-value">${address.addr}</span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="common/footer.jsp" %>
</body>
</html>
