<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

	<header>
		<div class="header_wrapper">
			<h1 class="logo">BoaSorte</h1>
		</div>
		<div class="loginlogo">
			<a href="">ログイン</a>
		</div>

		<nav class="coffee">
			<ul>
				<li><a href="">TOP</a></li>
				<li><a href="">商品一覧</a></li>
				<li><a href="">お問い合わせ</a></li>
			</ul>
		</nav>

	</header>

	<main>

		<form action="login" method="post">
			メールアドレス
			<input type="text" name="name"><br>
			<h2>パスワード</h2>
			<input type="password" name="pass"><br> <input
				type="submit" value="ログイン"><br>



		</form>

	</main>

	<img src="coffee.jpg" alt="コーヒー">
	<footer> </footer>

</body>
</html>