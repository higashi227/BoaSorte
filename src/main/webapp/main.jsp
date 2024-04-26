<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="utils.DBUtil" %>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte -- TOPページ" />
</jsp:include>
<body>
	
	<form action="AddToCartServlet" method="post">
<table border="1">
    <tr>
        <th>商品名</th>
        <th>価格</th>
        <th>コーヒー</th>
        <th>数量</th>
         <th>カートに追加</th>
    </tr>

    <% 
    try {
        Connection conn = DBUtil.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM boasorte.item");

        while (rs.next()) {
        	 int id = rs.getInt("item_id");
            String name = rs.getString("name");
            int price = rs.getInt("price");
            int isCoffee = rs.getInt("is_coffee");
    %>
    <tr>
        <td><%= name %></td>
        <td><%= price %></td>
        <td><%= (isCoffee == 1) ? "はい" : "いいえ" %></td>
       <td>
       		<input type="number" name="quantity_<%= id %>" min="1" value="1">
       </td>
       <td>
            <button type="submit" name="item_id" value="<%= id %>">カートに追加</button>
       </td>
    </tr>
    <% 
        }
        rs.close();
        stmt.close();
        DBUtil.closeConnection(conn);
    } catch (SQLException e) {
        e.printStackTrace();
    }
    %>

</table>
</form>

</body>
</html>