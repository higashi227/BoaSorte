<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規登録完了</title>
</head>
<body>
<form action="Login" method="post">
　　<h1>BoaSorte</h1><br>
	メールアドレス<br>
	<input type="email" name="email"><br>
	パスワード<br>
	<input type="password" name="pass"><br>
	<input type="submit" value="ログイン"><br>
	<!-- 新規登録へのリンク -->
	<div class="text"><a href="register.jsp">初めて利用する方はこちら</a></div>
</body>
</html>