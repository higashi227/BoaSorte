<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte -- 新規登録完了" />
</jsp:include>
<body>
	<jsp:include page="header.jsp" />
	<main>
		<form action="Login" method="post">
			<h2>ログイン</h2>
			<label>メールアドレス</label><br>
			<input type="text" name="mailAddress"><br>
			
			<label>パスワード</label><br>
			<input type="password" name="password"><br>
			
			<input type="submit" value="ログイン">
		</form>
	</main>
</body>
</html>