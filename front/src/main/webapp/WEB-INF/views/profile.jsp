<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人资料 - Mobile Shop</title>
    <%@ include file="common/head.jsp"%>
</head>
<body>
    <%@ include file="common/header_nav.jsp"%>
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
                    XXX
                </div>
            </div>
        </div>
    </div>
    <%@ include file="common/footer.jsp" %>
</body>
</html>
