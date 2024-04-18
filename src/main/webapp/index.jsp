<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoaSorte</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

	<header>
		<h1 class="logo">BoaSorte</h1>
		<nav>
			<ul>
				<li><a href="">TOP</a></li>
				<li><a href="">商品一覧</a></li>
				<li><a href="">お問い合わせ</a></li>
			</ul>
		</nav>
	</header>

	<main>
		<form action="Login" method="post">
			メールアドレス
			<input type="text" name="mailAddress">
			パスワード
			<input type="password" name="password">
			<input type="submit" value="ログイン">
		</form>
		
		<a href="Logout">ログアウト</a>
	</main>

	<footer> </footer>

</body>
</html>