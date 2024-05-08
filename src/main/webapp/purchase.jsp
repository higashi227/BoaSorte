<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
    <jsp:param name="pageTitle" value="BoaSorte--購入手続き" />
</jsp:include>
<body>
	<jsp:include page="header.jsp" />
    <main>
        <table border="1">
            <caption>【購入手続き】</caption>
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
                <c:forEach var="cartItem" items="${cartItems}" varStatus="status">
                    <tr>
                        <td>${cartItem.itemId}</td>
                        <td>${cartItem.name}</td>
                        <td>${cartItem.price}</td>
                        <td>${cartItem.quantity}</td>
                        <td>${cartItem.price * cartItem.quantity}</td>
                        <td>
                        	 <c:choose>
                                <c:when test="${cartItem.isCoffee == 1}">
                                    <input type="hidden" name="item_${status.index}_itemId" value="${cartItem.itemId}">
                                    <input type="hidden" name="item_${status.index}_quantity" value="${cartItem.quantity}">
                                    <input type="hidden" name="item_${status.index}_price" value="${cartItem.price}">
                                    <input type="hidden" name="item_${status.index}_isCoffee" value="${cartItem.isCoffee}">
                                    <input type="hidden" name="item_${status.index}_coffeeStatus" value="${cartItem.coffeeStatus}">
                                    ${cartItem.coffeeStatus}
                                </c:when>
                                <c:otherwise>
                                    <span>コーヒーではありません</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="4" style="text-align: right;"><strong>送料:</strong></td>
                    <td colspan="2"><strong>${shippingFee}</strong></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: right;"><strong>合計金額:</strong></td>
                    <td colspan="2"><strong>${totalPrice}</strong></td>
                </tr>
                <c:if test="${remainingForFreeShipping > 0}">
                    <tr>
                        <td colspan="4" style="text-align: right;"><strong>送料無料まで残り:</strong></td>
                        <td colspan="2"><strong>${remainingForFreeShipping}</strong></td>
                    </tr>
                </c:if>
            </tbody>
        </table>
          <!-- アカウント情報を表示 -->
        <h3>配送先情報</h3>
        <p>郵便番号: <strong>${account.postnum}</strong></p>
        <p>住所: <strong>${account.address}</strong></p>

        <form action="PurchaseConfirmationServlet" method="post">
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

			<!-- 支払い方法選択 -->
            <h3>支払い方法</h3>
            <label><input type="radio" name="paymentMethod" value="クレジットカード" required> クレジットカード</label><br>
            <label><input type="radio" name="paymentMethod" value="代引き"> 代引き</label><br>
            <label><input type="radio" name="paymentMethod" value="銀行振込"> 銀行振込</label><br>

            <!-- 配送日時選択 -->
            <label for="deliveryDate">配送日時:</label>
            <input type="date" name="deliveryDate" id="deliveryDate" required>

            <input type="submit" value="購入内容確認" class="button-inline">
        </form>
        <form action="CartServlet">
			<input type="submit" value="戻る" />
		</form>
    </main>
</body>
</html>