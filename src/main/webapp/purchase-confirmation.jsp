<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
    <jsp:param name="pageTitle" value="BoaSorte--購入内容確認" />
</jsp:include>
<body>
	<jsp:include page="header.jsp" />
	<main>
		 <table border="1">
            <caption>【購入内容確認】</caption>
            <thead>
                <tr>
                    <th scope="auto">アイテムID</th>
                    <th scope="auto">アイテム名</th>
                    <th scope="auto">価格</th>
                    <th scope="auto">数量</th>
                    <th scope="auto">小計</th>
                    <th scope="auto">コーヒーの状態</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cartItem" items="${cartItems}">
                    <tr>
                        <td>${cartItem.itemId}</td>
                        <td>${cartItem.name}</td>
                        <td>${cartItem.price}</td>
                        <td>${cartItem.quantity}</td>
                        <td>${cartItem.price * cartItem.quantity}</td>
                        <td>${cartItem.coffeeStatus}</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="4">送料</td>
                    <td colspan="2">${shippingFee}</td>
                </tr>
                <tr>
                    <td colspan="4">合計金額</td>
                    <td colspan="2">${totalPrice}</td>
                </tr>
            </tbody>
        </table>
		<p>配送日: <strong>${deliveryDate}</strong></p>
		 <p>支払い方法: <strong>${paymentMethod}</strong></p>
		<form action="FinalizePurchaseServlet" method="post">
            <c:forEach var="cartItem" items="${cartItems}" varStatus="status">
                <input type="hidden" name="item_${status.index}_itemId" value="${cartItem.itemId}">
                <input type="hidden" name="item_${status.index}_quantity" value="${cartItem.quantity}">
                <input type="hidden" name="item_${status.index}_price" value="${cartItem.price}">
                <input type="hidden" name="item_${status.index}_isCoffee" value="${cartItem.isCoffee}">
                <c:choose>
                    <c:when test="${cartItem.isCoffee == 1}">
                        <input type="hidden" name="item_${status.index}_coffeeStatus" value="${cartItem.coffeeStatus}">
                    </c:when>
                </c:choose>
            </c:forEach>
            <input type="hidden" name="shippingFee" value="${shippingFee}">
            <input type="hidden" name="deliveryDate" value="${deliveryDate}">
            <input type="hidden" name="paymentMethod" value="${paymentMethod}">

            <input type="submit" value="購入確定" class="button-inline">
        </form>
		<form action="PurchaseServlet">
			<input type="submit" value="戻る" />
		</form>
	</main>
</body>
</html>