<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Item"%>
<html lang="ja">
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte--管理者ページ" />
</jsp:include>
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
			<% 
                List<Item> itemList = (List<Item>) request.getAttribute("itemList");
                if (itemList != null && !itemList.isEmpty()) {
                    for (Item item : itemList) {
            %>
			<tr>
				<td><%= item.getItemId() %></td>
				<td><%= item.getName() %></td>
				<td><%= item.getPrice() %></td>
				<td><%= item.getIsCoffee() == 1 ? "コーヒー" : "お菓子" %></td>
		
			</tr>
			<% 
                    }
                } else {
            %>
			<tr>
				<td colspan="4">商品情報がありません</td>
			</tr>
			<% 
                }
            %>
		</tbody>
	</table>
	
	<form action="AdminItemNewServlet" method="post">
	 <input type="hidden" name="add" value="true">
	<input type="submit" value="商品新規登録">
	</form> 
	
	
	
	
	
	<form action="AdminItemEditServlet" method="post">
	 <input type="hidden" name="edit" value="true">
	<input type="submit" value="商品編集・削除">
	</form> 
	

	

</body>
</html>