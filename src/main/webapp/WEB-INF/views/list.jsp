<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="common/head.jsp"%>
</head>
<body>
<%@ include file="common/header_nav.jsp"%>
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////Category Page//////////////////-->
	<!--//////////////////////////////////////////////////-->
	<a name="breadcrumb"></a>
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="${ctx}/index">首页</a></li>
                        <c:if test="${requestScope.category != null}">
                            <li><a href="${ctx}/list?cid=${requestScope.category.cid}&page=1">${requestScope.category.name}</a></li>
                        </c:if>
                        <c:if test="${requestScope.brand != null}">
                            <li><a href="${ctx}/list?bid=${requestScope.brand.bid}&page=1">${requestScope.brand.name}</a></li>
                        </c:if>
					</ul>
				</div>
			</div>
			<div class="row">
				<div id="main-content" class="col-md-12">
					<div class="row">
						<div class="col-md-12">
							<div class="products">
								<c:forEach items="${requestScope.result.products}" var="product">
                                    <div class="col-lg-3 col-md-3 col-xs-12">
                                        <div class="product">
                                            <div class="image"><a href="${ctx}/product?pid=${product.pid}"><img src="${ctx}/${product.img_url}" /></a></div>
                                            <div class="buttons">
                                                <a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart" title="加入购物车"></span></a>
                                                <a class="btn wishlist" href="#"><span class="glyphicon glyphicon-credit-card" title="立即购买"></span></a>
                                            </div>
                                            <div class="caption">
                                                <div class="name"><a href="${ctx}/product?pid=${product.pid}" title="${product.name}">${product.name}</a></div>
                                                <div class="name"><a href="${ctx}/product?pid=${product.pid}" title="${product.description}">${product.description}</a></div>
                                                <div class="price">￥${product.price}<c:if test="${product.original_price != product.price}"><span>￥${product.original_price}</span></c:if></div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
							</div>
						</div>
					</div>
					<div class="row text-center">
						<ul class="pagination">
                            <c:forEach begin="1" end="${requestScope.result.pageNum}" var="page">
                                <li <c:if test="${param.page == page}">class="active"</c:if>>
                                    <a href="${ctx}/list?<c:if test="${requestScope.category != null}">cid=${requestScope.category.cid}</c:if><c:if test="${requestScope.brand != null}">&bid=${requestScope.brand.bid}</c:if><c:if test="${param.name != null}">name=${param.name}</c:if>&page=${page}#breadcrumb">${page}</a>
                                </li>
                            </c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="common/footer.jsp"%>
</body>
</html>
