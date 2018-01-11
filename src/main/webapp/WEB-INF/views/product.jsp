<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="common/head.jsp"%>
    <script type="text/javascript">
        $(function () {
           $(".product-btn").click(function () {
               var quantity = $(".quantity").val();
               if($(this).text() == "立即购买"){
                   location = "${ctx}/user/buy?pid=${requestScope.product.pid}&quantity="+quantity;
               }else {
                   location = "${ctx}/user/add_cart?pid=${requestScope.product.pid}&quantity="+quantity;
               }
               return false;
           });
           $(".btn-icon").click(function () {
               var quantity = $(".quantity").val();
               if($(this).hasClass("fa-minus-circle")){
                   $(".quantity").val(--quantity < 1 ? 1 : quantity);
               }else {
                   $(".quantity").val(++quantity);
               }
           });
        });
    </script>
</head>
<body>
	<!--Top-->
    <%@ include file="common/header_nav.jsp"%>
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////ProductDao Page///////////////////-->
	<!--//////////////////////////////////////////////////-->
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="index.jsp">首页</a></li>
						<li><a href="${ctx}/list?cid=${requestScope.product.cid}&page=1">${requestScope.product.cname}</a></li>
						<li><a href="${ctx}/list?bid=${requestScope.product.bid}&page=1">${requestScope.product.bname}</a></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div id="main-content" class="col-md-12">
					<div class="product">
						<div class="col-md-4">
							<div class="image">
								<img src="${ctx}/${requestScope.product.img_url}" />
							</div>
						</div>
						<div class="col-md-8">
							<div class="caption">
								<div class="name">
                                    <h3 title="${requestScope.product.name}">${requestScope.product.name}</h3>
                                    <h4 title="${requestScope.product.description}">${requestScope.product.description}</h4>
                                </div>
								<div class="info">
									<ul>
                                        <li>ID: ${requestScope.product.pid}</li>
                                        <li>品类: <a href="${ctx}/list?cid=${requestScope.product.cid}&page=1">${requestScope.product.cname}</a></li>
                                        <li>品牌: <a href="${ctx}/list?bid=${requestScope.product.bid}&page=1">${requestScope.product.bname}</a></li>
									</ul>
								</div>
								<div class="price">￥${requestScope.product.price}<span>￥${requestScope.product.original_price}</span></div>
								<div class="well" style="width: 50%">
									<label>数量: </label>
									<span class="btn-icon fa fa-lg fa-minus-circle"></span>
									<input class="form-inline quantity" type="text" value="1">
									<span class="btn-icon fa fa-lg fa-plus-circle"></span></div>
								<div class="share ">
									<a href="#" class="btn btn-2 product-btn">立即购买</a>
									<a href="#" class="btn btn-2 product-btn">加入购物车</a>
								</div>
							</div>
						</div>
						<div class="clear"></div>
					</div>	
				</div>
			</div>
		</div>
	</div>
	<%@ include file="common/footer.jsp"%>
	
</body>
</html>
