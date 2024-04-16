<%--新規登録確認ページ--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 String name = request.getParameter("name");
 String pass = request.getParameter("pass");
 String  = request.getParameter(""); //
 String  = request.getParameter("");
 String  = request.getParameter("");
 String  = request.getParameter("");
 String  = request.getParameter("");
 String  = request.getParameter("");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規登録確認画面</title>
</head>
<body>
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