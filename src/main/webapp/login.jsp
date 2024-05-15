<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte -- ログイン" />
</jsp:include>
<body>
	<jsp:include page="header.jsp" />
	<main>
		<div class="main-container center">
			<form action="Login" method="post">
				<h2>ログイン</h2>
				
				<dl>
					<dt>メールアドレス</dt>
					<dd><input type="text" name="mailAddress" class="inpw" placeholder="abcd@sample.jp"></dd>
				</dl>
				
				<dl>
					<dt>パスワード</dt>
					<dd><input type="password" name="password" class="inpw"></dd>
				</dl>
				
				<div class="btncenter">
					<input type="submit" value="ログイン" class="btn1">
				</div>
				<p class="btncenter"><a href="register.jsp">はじめてご利用の方はこちら</a></p>
				
			</form>
		</div>
	</main>
</body>
</html>