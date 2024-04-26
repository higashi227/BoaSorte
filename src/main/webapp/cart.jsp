<%--カートページ--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Cart"%>
<!DOCTYPE html>
<html>

<body>
	<% List<Cart> cartItems = (List<Cart>) request.getAttribute("cartItems");
        if (cartItems != null) {
            for (Cart item : cartItems) {
    %>
    <p>Item ID: <%= item.getItemId() %>, Quantity: <%= item.getQuantity() %></p>
    <%      }
        } else {
    %>
    <p>Your cart is empty.</p>
    <%  }
    %>
	<jsp:include page="header.jsp" />

</body>
</html>