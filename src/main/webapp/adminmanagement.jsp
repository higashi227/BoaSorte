<%--管理者画面--%>

<%@ page import="java.util.List"%>
<%@ page import="model.Item"%>

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

		</thead>


		<tbody>

			<c:forEach var="item" items="${item}">
				<tr>
					<td><c:out value="${item.item_id}" /></td>
					<td><c:out value="${item.name}" /></td>
					<td><c:out value="${item.price}" /></td>
					<td><c:out value="${item.is_coffee}" /></td>
				</tr>
			</c:forEach>

			<%--<% List<Item> itemList = (List<Item>) request.getAttribute("items"); %>
			<% for (Item item : itemList) { %>
			<tr>
				<%-- 商品ID --%>
			<%--<td><%= item.getId() --%>
			<%--</td>--%>
			<%-- 商品名 --%>
			<%--<td><%= item.getName() --%>
			<%--</td>--%>
			<%-- 価格 --%>
			<%--<td><%= item.getPrice() %></td>--%>
			<%-- コーヒーかどうか --%>
			<%--<td><%= item.getIs_coffee() %></td>--%>
			<%--</tr>
			<% } %>--%>

		</tbody>
	</table>
</body>

</html>