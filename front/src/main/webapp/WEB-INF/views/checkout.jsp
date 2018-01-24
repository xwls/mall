<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>订单结算页 - Mobile Shop</title>
    <%@ include file="common/head.jsp" %>
</head>

<body>
<%@ include file="common/header_nav.jsp" %>
<!--//////////////////////////////////////////////////-->
<!--///////////////////Contact Page///////////////////-->
<!--//////////////////////////////////////////////////-->
<div id="page-content" class="single-page">
    <div class="container">
        <h5>填写并提交订单信息</h5>
        <div class="row">
            <table class="table table-striped table-hover">
                <caption class="text-left">确认收货地址</caption>
                <thead>
                <tr>
                    <th></th>
                    <th>收件人</th>
                    <th>电话</th>
                    <th>详细地址</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.addresses}" var="address">
                    <c:if test="${address.isDefault == 1}">
                        <c:set var="defaultAddr" value="${address}"/>
                    </c:if>
                    <tr>
                        <td><input type="radio" name="address" value="${address.aid}" <c:if test="${address.isDefault == 1}">checked</c:if>/></td>
                        <td>${address.name}</td>
                        <td>${address.tel}</td>
                        <td>${address.addr}</td>
                        <td><c:if test="${address.isDefault == 1}">默认地址</c:if></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="row">
            <table class="table table-striped table-hover">
                <caption class="text-left">确认订单信息</caption>
                <thead>
                <tr>
                    <th colspan="2">商品信息</th>
                    <th>类型</th>
                    <th>品牌</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>小计</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.products.carts}" var="cart">
                    <tr>
                        <td style="width: 70px"><img class="img-thumbnail" style="padding: 2px" src="${cart.imgUrl}?imageView2/1/w/60/h/60/q/75|imageslim" alt=""></td>
                        <td style="width: 420px">${cart.name}</td>
                        <td>${cart.cname}</td>
                        <td>${cart.bname}</td>
                        <td>￥${cart.price}</td>
                        <td>${cart.quantity}</td>
                        <td>￥${cart.quantity * cart.price}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="row pull-right">
            <p class="text-right">${requestScope.products.total.totalCount}件商品 需付款：<span style="font-size: 42px;font-weight: bold">￥${requestScope.products.total.totalPrice}</span></p>
            <p class="text-right help-block" style="font-size: 14px">寄送至：${defaultAddr.addr}，收货人：${defaultAddr.name} ${defaultAddr.tel}</p>
            <a href="${path}/checkout" class="btn btn-1 pull-right">去付款</a>
        </div>
    </div>
</div>
<%@ include file="common/footer.jsp" %>
</body>
</html>
