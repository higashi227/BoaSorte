<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
                   
                    <th scope="auto">アイテム名</th>
                    <th scope="auto">価格</th>
                    <th scope="auto">数量</th>
                    <th scope="auto">小計</th>
                    <th scope="auto">アイテムの状態</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cartItem" items="${cartItems}">
                    <tr>
                       
                        <td>${cartItem.name}</td>
                        <td>${cartItem.price}</td>
                        <td>${cartItem.quantity}</td>
                        <td>${cartItem.price * cartItem.quantity}</td>
                        <td>
                        	 <c:choose>
                                <c:when test="${cartItem.isCoffee == 1}">
                                    ${cartItem.coffeeStatus}
                                </c:when>
                                <c:otherwise>
                                    <span>お菓子</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                 <c:set var="taxDecimal" value="${totalPrice * 0.1}" />
				<c:set var="tax" value="${fn:substringBefore(taxDecimal, '.')}" />
				<tr>
                	<td colspan="4" style="text-align: right;"><strong>税（10%）:</strong></td>
                	<td><strong>${tax}</strong></td>
                	<td></td>
            	</tr>
                <tr>
                    <td colspan="4">送料</td>
                    <td colspan="2">${shippingFee}</td>
                </tr>
                <tr>
                    <td colspan="4">合計金額</td>
                    <td colspan="2">${totalPrice + tax}</td>
                </tr>
            </tbody>
        </table>
		<p>配送日: <strong>${deliveryDate}</strong></p>
		<p>支払い方法: <strong>${paymentMethod}</strong></p>
		 <p><strong>選択された配送先情報:</strong> ${selectedAddress}</p>
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
                    <c:otherwise>
                        <input type="hidden" name="item_${status.index}_coffeeStatus" value="お菓子">
                    </c:otherwise>
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