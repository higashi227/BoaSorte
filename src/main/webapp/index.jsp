<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte" />
</jsp:include>
	<body>
		<jsp:include page="header.jsp" />
		
			<main>
			<form action="Login" method="post">
				メールアドレス <input type="text" name="mailAddress"> パスワード <input
					type="password" name="password"> <input type="submit"
					value="ログイン">
			</form>
	
			<a href="Logout">ログアウト</a>
		</main>
	
		<footer> </footer>
	
	</body>
</html>