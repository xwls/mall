<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="common/head.jsp"%>
    <script src="${path}/static/layer/layer.js" type="text/javascript"></script>
	<script type="text/javascript">
        $(function () {
           $(".cart-del").click(function () {
               var pid = $(this).next("input[name='pid']").val();
               layer.confirm("确定删除吗？",
                   {btn:["确定","取消"]},
                    function () {
                        $.ajax({
                            url:"${path}/user/del_cart?pid="+pid,
                            type:"GET",
                            success:function (result) {
                                if(result.result == "success"){
                                    location.reload();
                                }else {
                                    layer.msg(result.msg);
                                }
                            }
                        });
                    });
               return false;
           });
        });
    </script>
</head>
<body>
<%@ include file="common/header_nav.jsp"%>
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
						<li><a href="${path}/user/cart">购物车</a></li>
					</ul>
				</div>
			</div>
			<c:forEach items="${requestScope.total.carts}" var="cart">
                <div class="row">
                    <div class="product well">
                        <div class="col-md-2">
                            <div class="image">
                                <img src="${path}/${cart.img_url}" />
                            </div>
                        </div>
                        <div class="col-md-10">
                            <div class="caption">
                                <div class="name"><h3><a href="${path}/product?pid=${cart.pid}">${cart.name}</a></h3></div>
                                <%--<div class="info">
                                    <ul>
                                        <li>Brand: text</li>
                                        <li>ID: 0122222</li>
                                    </ul>
                                </div>--%>
                                <div class="price">${cart.price}</div>
                                <label>数量: </label><span class="btn-icon fa fa-lg fa-minus-circle"></span><input readonly class="form-inline quantity" type="text" value="${cart.quantity}"/><span class="btn-icon fa fa-lg fa-plus-circle"></span>
                                <hr>
                                <a href="#" class="btn btn-2 pull-right cart-del">删除</a>
                                <input type="hidden" name="pid" value="${cart.pid}">
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </c:forEach>
			<%--<div class="row">
				<div class="col-md-4 col-md-offset-8 ">
					<center><a href="#" class="btn btn-1">Continue To Shopping</a></center>
				</div>
			</div>--%>
			<div class="row">
				<div class="pricedetails">
					<div class="col-md-4 col-md-offset-8">
						<table>
							<h6>价格明细</h6>
							<tr>
								<td>商品数量</td>
								<td>${requestScope.total.total_quantity}</td>
							</tr>
							<%--<tr>
								<td>Discount</td>
								<td>-----</td>
							</tr>--%>
							<%--<tr>
								<td>Delivery Charges</td>
								<td>100.00</td>
							</tr>--%>
							<tr style="border-top: 1px solid #333">
								<td><h5>总价</h5></td>
								<td><h5>${requestScope.total.total_price}</h5></td>
							</tr>
						</table>
						<center><a href="#" class="btn btn-1">提交订单</a></center>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="common/footer.jsp"%>
</body>
</html>
