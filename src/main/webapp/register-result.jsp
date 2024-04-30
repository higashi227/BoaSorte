<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte--登録完了" />
</jsp:include>
<body>
	<jsp:include page="header.jsp" />
    <h2>アカウント登録結果</h2>
    <p>${message}</p>
    <a href="index.jsp">ホームページに戻る</a>
</body>
</html>
