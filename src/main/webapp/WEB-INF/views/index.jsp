<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="common/head.jsp"%>
</head>
<body>
    <%@ include file="common/header_nav.jsp"%>
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////HomePage///////////////////////-->
	<!--//////////////////////////////////////////////////-->
	<div id="page-content" class="home-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<!-- Carousel -->
					<div id="carousel-example-generic" style="height: auto" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators hidden-xs">
                            <c:forEach items="${requestScope.banners}" varStatus="status">
                                <li data-target="#carousel-example-generic" data-slide-to="${status.index}" class="<c:if test="${status.index==0}">active</c:if>"></li>
                            </c:forEach>
						</ol>
						<!-- Wrapper for slides -->
						<div class="carousel-inner">
                            <c:forEach items="${requestScope.banners}" var="banner" varStatus="status">
                                <div class="item <c:if test="${status.index == 0}"> active</c:if>">
									<a href="${ctx}/${banner.href}"><img src="${ctx}/${banner.img}" alt="First slide"></a>
                                    <!-- Static Header -->
                                    <div class="header-text hidden-xs">
                                        <div class="col-md-12 text-center">
                                        </div>
                                    </div><!-- /header-text -->
                                </div>
                            </c:forEach>
						</div>
						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</a>
						<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div><!-- /carousel -->
				</div>
			</div>
			<div class="row">
				<div class="banner">
					<div class="col-sm-4">
						<img src="${ctx}/static/images/sub-banner1.png" />
					</div>
					<div class="col-sm-4">
						<img src="${ctx}/static/images/sub-banner2.png" />
					</div>
					<div class="col-sm-4">
						<img src="${ctx}/static/images/sub-banner3.png" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="heading"><h2>特价商品</h2></div>
					<div class="products">
                        <c:forEach items="${requestScope.products}" var="product">
                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <div class="product">
                                    <div class="image"><a href="${ctx}/product?pid=${product.pid}"><img src="${ctx}/${product.img_url}" /></a></div>
                                    <div class="buttons">
                                        <a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart" title="加入购物车"></span></a>
                                        <a class="btn wishlist" href="#"><span class="glyphicon glyphicon-credit-card" title="立即购买"></span></a>
                                    </div>
                                    <div class="caption">
                                        <div class="name"><a href="${ctx}/product?pid=${product.pid}" title="${product.name}">${product.name}</a></div>
                                        <div class="name"><a href="${ctx}/product?pid=${product.pid}" title="${product.description}">${product.description}</a></div>
                                        <div class="price">￥${product.price}<span>￥${product.original_price}</span></div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="banner">
					<div class="col-sm-6">
						<img src="${ctx}/static/images/sub-banner4.jpg" />
					</div>
					<div class="col-sm-6">
						<img src="${ctx}/static/images/sub-banner5.png" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="heading"><h2>畅销商品</h2></div>
					<div class="products">
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="product">
								<div class="image"><a href="product.jsp"><img src="${ctx}/static/images/iphone.png" /></a></div>
								<div class="buttons">
									<a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a>
									<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>
									<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>
								</div>
								<div class="caption">
									<div class="name"><h3><a href="product.jsp">Aliquam erat volutpat</a></h3></div>
									<div class="price">$122<span>$98</span></div>
									<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="product">
								<div class="image"><a href="product.jsp"><img src="${ctx}/static/images/galaxy-s4.jpg" /></a></div>
								<div class="buttons">
									<a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a>
									<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>
									<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>
								</div>
								<div class="caption">
									<div class="name"><h3><a href="product.jsp">Aliquam erat volutpat</a></h3></div>
									<div class="price">$122<span>$98</span></div>
									<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span><span class="glyphicon glyphicon-star-empty"></span></div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="product">
								<div class="image"><a href="product.jsp"><img src="${ctx}/static/images/galaxy-note.jpg" /></a></div>
								<div class="buttons">
									<a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a>
									<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>
									<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>
								</div>
								<div class="caption">
									<div class="name"><h3><a href="product.jsp">Aliquam erat volutpat</a></h3></div>
									<div class="price">$122<span>$98</span></div>
									<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span><span class="glyphicon glyphicon-star-empty"></span><span class="glyphicon glyphicon-star-empty"></span></div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="product">
								<div class="image"><a href="product.jsp"><img src="${ctx}/static/images/z1.png" /></a></div>
								<div class="buttons">
									<a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a>
									<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>
									<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>
								</div>
								<div class="caption">
									<div class="name"><h3><a href="product.jsp">Aliquam erat volutpat</a></h3></div>
									<div class="price">$122<span>$98</span></div>
									<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="common/footer.jsp"%>
</body>
</html>
