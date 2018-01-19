<%--
  Created by IntelliJ IDEA.
  User: kevin.wang
  Date: 2018/1/19 0019
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>成功页面</title>
</head>
<body>
<h4>${requestScope.imgUrl}</h4>
<h4>${requestScope.productName}</h4>
<img src="${requestScope.imgUrl}" alt="">
</body>
</html>
