<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="common/head.jsp"%>
</head>

<body>
<%@ include file="common/header_nav.jsp"%>
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////Contact Page///////////////////-->
	<!--//////////////////////////////////////////////////-->
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row msg">
                <h3><span class="fa fa-check-circle-o"></span>商品已成功加入购物车！</h3>
			</div>
            <div class="row product-info">
                <div class="col-md-6">
                    <div class="col-md-4">
                        <div class="image">
                            <img src="${ctx}/${requestScope.product.img_url}">
                        </div>
                    </div>
                    <div class="col-md-8">
                        <h3>${requestScope.product.name}</h3>
                        <h3>数量：${requestScope.quantity}</h3>
                    </div>
                </div>
                <div class="col-md-6 btn-cart">
                    <a href="${ctx}/user/cart" class="btn btn-2">去购物车结算</a>
                    <a href="${ctx}/product?pid=${requestScope.product.pid}" class="btn btn-2">返回查看商品</a>
                </div>
            </div>
		</div>
	</div>
	<%@ include file="common/footer.jsp"%>
</body>
</html>
