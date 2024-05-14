<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte--管理者ログイン" />
</jsp:include>
<body>
	<div class="main-container">
		<form action="AdminLogin" method="post">
			<h2>管理者ログイン</h2>
			<dl class="center">
				<dt>メールアドレス</dt>
				<dd><input type="email" name="mailAddress"></dd>
			</dl>
			
			<dl class="center">
				<dt>パスワード</dt>
				<dd><input type="password" name="password"></dd>
			</dl>
			<div class="btncenter">
				<input type="submit" value="ログイン" class="btn1">
			</div>
		</form>
	</div>
</body>
</html>