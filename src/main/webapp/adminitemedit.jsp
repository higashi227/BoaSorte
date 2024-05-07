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
		<caption>【商品編集】</caption>
		<thead>
			<tr>
				<th scope="auto">品番</th>
				<th scope="auto">商品名</th>
				<th scope="auto">金額</th>
				<th scope="auto">商品内容</th>
				<th scope="auto">削除</th>
				
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
				<td>
					<form action="AdminItemDeleteServlet" method="post">
            			<input type="hidden" name="id" value="<%= item.getItemId() %>">
            			<input type="submit" value="削除">
					</form>
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

	<h3>商品編集</h3>

	<form action="AdminItemUpdateServlet" method="post">
	
		<label>商品IDを選択：</label>
		
    		<select name="id">
        		<% for (Item item : itemList) { %>
            		<option value="<%= item.getItemId() %>"><%= item.getItemId() %></option>
        		<% } %>
    		</select><br>
    		
        <label for="name">商品名:</label>
        
        <input type="text" id="name" name="name" value="${item.name}">
        <br>
        
        <label for="price">金額:</label>
        
        <input type="text" id="price" name="price" value="${item.price}">
        <br>
        
        <label for="is_coffee">コーヒー:</label>
        
        <input type="checkbox" id="isCoffee" name="isCoffee" ${item.isCoffee ? 'checked' : ''}>
        <br>
        
        <input type="submit" value="更新">
	
			
	</form>
	
	<form action="ItemListServlet" method="get">
        <input type="submit" value="戻る">
    </form>






</body>

</html>


