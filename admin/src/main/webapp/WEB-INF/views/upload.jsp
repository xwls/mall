<%--
  Created by IntelliJ IDEA.
  User: kevin.wang
  Date: 2018/1/19 0019
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件上传</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/test/fileUpload" method="post" enctype="multipart/form-data">
    <input type="text" name="productName" placeholder="输入商品名"/><br/>
    <input type="file" name="file"/><br/>
    <input type="submit" value="上传"/>
</form>
</body>
</html>
