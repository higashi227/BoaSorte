<%--管理者画面--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>管理者ページ</title>
</head>
<body>

	<table border="1">

		<caption>【商品管理】</caption>

		<thead>
			<tr>
				<th scope="auto">品番</th>
				<th scope="auto">商品名</th>
				<th scope="auto">金額</th>
				<th scope="auto">商品内容</th>
			</tr>

			<% for (Item item : itemList) {%>
			<tr>
				<%-- 商品ID --%>
				<td><%= item.getItemId()%></td>
				<%-- 商品名 --%>
				<td><%= item.getItemName()%></td>
				<%-- 価格 --%>
				<td><%= item.getPrice()%></td>
				<%-- 数量（在庫） --%>
				<td><%= item.getis_coffee()%></td>
			<tr>
				<th>&nbsp;</th>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</thead>
</body>
</html>