<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte--登録完了" />
</jsp:include>
<body>
	<jsp:include page="header.jsp" />
	<main>
		<div class="main-container">
			<h2>アカウント登録結果</h2>
			<p class="center">${message}</p>
			<p class="center"><button onclick="window.location.href='./index.jsp'" class="btn2">戻る</button></p>
		</div>
	</main>
</body>
</html>
