<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="utils.DBUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品一覧</title>
</head>
<body>

<h1>商品一覧</h1>

<table border="1">
    <tr>
        <th>商品名</th>
        <th>価格</th>
        <th>コーヒー</th>
    </tr>

    <% 
    try {
        Connection conn = DBUtil.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM boasorte.item");

        while (rs.next()) {
            String name = rs.getString("name");
            int price = rs.getInt("price");
            int isCoffee = rs.getInt("is_coffee");
    %>
    <tr>
        <td><%= name %></td>
        <td><%= price %></td>
        <td><%= (isCoffee == 1) ? "はい" : "いいえ" %></td>
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

</body>
</html>