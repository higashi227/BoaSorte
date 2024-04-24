<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte -- 新規登録完了" />
</jsp:include>
<body>
	<jsp:include page="header.jsp" />
	<form action="Login" method="post">
		<br> メールアドレス<br> <input type="email" name="email"><br>
		パスワード<br> <input type="password" name="pass"><br> <input
			type="submit" value="ログイン"><br>
		<!-- 新規登録へのリンク -->
		<div class="text">
			<a href="register.jsp">初めて利用する方はこちら</a>
		</div>
</body>
</html>