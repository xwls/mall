<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="common/head.jsp" %>
    <%--<script src="${path}/static/layer/layer.js" type="text/javascript"></script>--%>
    <script type="text/javascript">
        $(function () {
            $(".cart-del").click(function () {
                var that = $(this);
                var id = that.next("input[name='id']").val();
                layer.confirm("确定删除吗？", function () {
                    layer.load(1);
                    $.ajax({
                        url: "${path}/cart/delete/" + id,
                        method: "get",
                        success: function (res) {
                            console.log(res);
                            that.parent().parent().parent().parent().remove();
                            $("#totalPrice").text("￥" + res.total.totalPrice);
                            $("#totalCount").text(res.total.totalCount);
                            if (res.total.totalCount == 0){
                                location = "${path}/cart/list";
                            }
                            layer.closeAll('loading');
                            layer.closeAll('dialog');
                        }
                    });
                });
                return false;
            });
            $(".btn-icon").click(function () {
                var url;
                var quantityInput = $(this).siblings("input[name='quantity']");
                var quantity = quantityInput.val();
                var id = $(this).parent().next("div").children("input:hidden").val();
                if ($(this).hasClass("fa-minus-circle")) {
                    if (quantity == 1) {
                        layer.alert("不能再减了", {icon: 0});
                        return;
                    }
                    url = "${path}/cart/minus/" + id;
                    --quantity;
                } else {
                    url = "${path}/cart/plus/" + id;
                    ++quantity;
                }
                layer.load(1);
                $.ajax({
                    url: url,
                    method: "get",
                    success: function (res) {
                        if (res.success) {
                            quantityInput.val(quantity);
                            $("#totalPrice").text("￥" + res.total.totalPrice);
                            layer.closeAll('loading');
                        }
                    }
                });
            });
        });
    </script>
</head>
<body style="height: 100%">
<%@ include file="common/header_nav.jsp" %>
<!--//////////////////////////////////////////////////-->
<!--///////////////////Cart Page//////////////////////-->
<!--//////////////////////////////////////////////////-->
<div id="page-content" class="single-page">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <a name="cart"></a>
                <ul class="breadcrumb">
                    <li><a href="${path}/index">首页</a></li>
                    <li><a href="${path}/cart/list">购物车</a></li>
                </ul>
            </div>
        </div>
        <c:choose>
            <c:when test="${fn:length(requestScope.carts) > 0}">
                <div class="row">
                    <c:forEach items="${requestScope.carts}" var="cart">
                        <div class="product well" style="padding: 6px">
                            <div class="pull-left" style="width: 120px;height: 120px">
                                <div class="image img-thumbnail" style="margin-top: 5px">
                                    <img src="${cart.imgUrl}?imageView2/1/w/110/h/110/q/75|imageslim"/>
                                </div>
                            </div>
                            <div style="padding: 10px 10px 0 140px">
                                <div class="caption">
                                    <div class="name"><h3><a href="${path}/product?pid=${cart.pid}">${cart.name}</a></h3></div>
                                    <div class="price">￥：${cart.price}</div>
                                    <div>
                                        <label>数量: </label>
                                        <span class="btn-icon fa fa-lg fa-minus-circle"></span>
                                        <input readonly name="quantity" class="form-inline quantity" type="text"
                                               value="${cart.quantity}"/>
                                        <span class="btn-icon fa fa-lg fa-plus-circle"></span>
                                    </div>
                                    <div>
                                        <a class="label label-default" href="${path}/list?bid=${cart.bid}">${cart.bname}</a>
                                        <a class="label label-default" href="${path}/list?cid=${cart.cid}">${cart.cname}</a>
                                        <a href="#" class="btn btn-2 pull-right cart-del">删除</a>
                                        <input type="hidden" name="id" value="${cart.id}">
                                    </div>
                                    <hr style="margin-bottom: 0px;margin-top: 0px">
                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </c:forEach>
                </div>
                <div class="row">
                    <div class="pricedetails">
                        <div class="col-md-4 col-md-offset-8">
                            <table>
                                <h6>价格明细</h6>
                                <tr>
                                    <td>商品数量：</td>
                                    <td id="totalCount">${requestScope.total.totalCount}</td>
                                </tr>
                                <tr style="border-top: 1px solid #333">
                                    <td><h5>总价：</h5></td>
                                    <td><h5 id="totalPrice">￥${requestScope.total.totalPrice}</h5></td>
                                </tr>
                            </table>
                            <center><a href="${path}/checkout" class="btn btn-1">去结算</a></center>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <h3>购物车是空的</h3>
                <div class="row">
                    <div class="col-md-4 col-md-offset-8 ">
                        <center><a href="${path}/index" class="btn btn-1">继续购物</a></center>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>



    </div>
</div>
<%@ include file="common/footer.jsp" %>
</body>
</html>
