<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="common/head.jsp"%>
	<script type="text/javascript">
		$(function () {
//		    $("#login").click(function () {
//                alert("haha");
//            });
        });
	</script>
</head>

<body>
<%@ include file="common/header_nav.jsp"%>
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////Account Page///////////////////-->
	<!--//////////////////////////////////////////////////-->
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="index.jsp">首页</a></li>
						<li><a href="account.jsp">账号</a></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="heading"><h2>登录</h2></div>
					<form name="form1" id="form-login" method="post" action="${ctx}/login">
						<c:if test='${param.callback != null}'>
                            <input type="hidden" name="callback" value="${param.callback}<c:if test='${param.quantity != null}'>&quantity=${param.quantity}</c:if>">
                        </c:if>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="用户名 :" name="uname" required>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="密码 :" name="upass" required>
						</div>
						<button type="submit" class="btn btn-1" name="login" id="login">登录</button>
						<a href="#">忘记密码？</a>
					</form>
				</div>
				<div class="col-md-6">
					<div class="heading"><h2>新用户？注册一个账号。</h2></div>
					<form name="form2" id="ff2" method="post" action="#">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="用户名 :" name="username" required>
						</div>
						<div class="form-group">
							<input type="tel" class="form-control" placeholder="邮箱 :" name="email" required>
						</div>
						<div class="form-group">
							<input type="tel" class="form-control" placeholder="手机号 :" name="phone" required>
						</div>
						<div class="form-group">
							<input name="gender" type="radio" value="male"> 男 <input name="gender" type="radio" value="female"> 女
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="密码 :" name="password" required>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="确认密码 :" name="repassword" required>
						</div>
						<div class="form-group">
							<input name="agree" id="agree" type="checkbox" > 我已阅读并同意<a href="#">XXX协议</a>！
						</div>
						<button type="submit" class="btn btn-1">注册</button>
					</form>
				</div>
			</div>
		</div>
	</div>
<%@ include file="common/footer.jsp"%>
</body>
</html>