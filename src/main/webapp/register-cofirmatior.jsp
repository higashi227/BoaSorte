<%--新規登録確認ページ--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte--登録内容確認" />
</jsp:include>
<body>
<jsp:include page="header.jsp" />
<h1>登録内容確認</h1>
<p>名前：<%= %></p>
<p>パスワード：<%= %></p>
<p>郵便番号：<%= %></p>
<p>住所：<%= %></p>
<p>生年月日：<%= %></p>
<p>電話番号：<%= %></p>
<p>どうやってサイトを知ったか：<%= %></p>
<p>DM有無：<%= %></p>
</body>
</html>