<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者ログイン</title>
</head>
<body>
	<form action="AdminLogin" method="post">
		<h1>管理者ログイン</h1>
		<br> メールアドレス<br> <input type="email" name="mailAddress"><br>
		パスワード<br> <input type="password" name="password"><br> <input
			type="submit" value="ログイン"><br>
	</form>
</body>
</html>