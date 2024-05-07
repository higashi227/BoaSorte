<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Item" %>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte -- TOPページ" />
</jsp:include>
<body>
	<jsp:include page="header.jsp" />
	<main>
		<table border="1">
		<thead>
        	<tr>       		
				<th scope="auto">品番</th>
				<th scope="auto">商品名</th>
				<th scope="auto">金額</th>
				<th scope="auto">商品内容</th>
        		<th scope="auto">数量</th>
        		<th scope="auto">豆の状態</th>
         		<th scope="auto">カートに追加</th>
    		</tr>
		</thead>
		<tbody>
    		<% 
    			List<Item> itemList = (List<Item>) request.getAttribute("itemList");
    			if (itemList != null && !itemList.isEmpty()) {
        			for (Item item : itemList) {
    		%>
    		<tr>
				<form action="CartServlet" method="post">
					<td><%= item.getItemId() %></td>
					<td><%= item.getName() %></td>
					<td><%= item.getPrice() %></td>
					<td><%= item.getIsCoffee() == 1 ? "コーヒー" : "コーヒーでない" %></td>
					<td>
                		<input type="number" name="quantity" min="1" value="1" />
                		 <input type="hidden" name="itemId" value="<%= item.getItemId() %>" />
            		</td>
            		<td>
                		<% if (item.getIsCoffee() == 1) { %>
                			<select name="coffeeStatus">
                				<option value="豆のまま">豆のまま</option>
                				<option value="細挽き">細挽き</option>
                				<option value="中挽き">中挽き</option>
                				<option value="粗挽き">粗挽き</option>
                			</select>
                		<% } else { %>
                			<span>コーヒーでない</span>
                		<% } %>
            		</td>
            		<td>
                		<button type="submit">決定</button>
            		</td>
            	</form>
			</tr>
			<% 
                    }
                } else {
            %>
			<tr>
				<td colspan="7">商品情報がありません</td>
			</tr>
			<% 
                }
            %>
		</tbody>
		</table>
	</main>
</body>
</html>