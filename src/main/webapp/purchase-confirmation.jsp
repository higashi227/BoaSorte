<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte--購入内容確認" />
</jsp:include>
<body>
	<jsp:include page="header.jsp" />
	<main>
		<div class="main-container">
			<h2>購入内容確認</h2>
			<div class="btncenter">
				<table border="1">
					<thead>
						<tr>
							<th scope="auto">商品名</th>
							<th scope="auto">価格</th>
							<th scope="auto">数量</th>
							<th scope="auto">小計</th>
							<th scope="auto">豆の状態</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cartItem" items="${cartItems}">
							<tr>
								<td>${cartItem.name}</td>
								<td class="right">${cartItem.price}</td>
								<td class="right">${cartItem.quantity}</td>
								<td class="right">${cartItem.price * cartItem.quantity}</td>
								<td class="center"><c:choose>
										<c:when test="${cartItem.isCoffee == 1}">
                                    ${cartItem.coffeeStatus}
                                </c:when>
										<c:otherwise>
											<span> -- </span>
										</c:otherwise>
									</c:choose></td>
							</tr>
						</c:forEach>
						<tr class="right">
							<td colspan="4"><strong>税(10%)</strong></td>
							<td><strong>${tax}</strong></td>
						</tr>
						<tr class="right">
							<td colspan="4">送料</td>
							<td colspan="2">${shippingFee}</td>
						</tr>
						<tr class="right">
							<td colspan="4">合計金額</td>
							<td colspan="2">${totalAmount}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="center">
				<h3>配送日</h3>
				<p>${deliveryDate}</p>
				
				
				<h3>支払い方法</h3>
				<p>${paymentMethod}</p>
				
				<h3>選択された配送先情報</h3>
				<p>${selectedAddress}</p>
			</div>
			<div class="center">
				<form action="FinalizePurchaseServlet" method="post">
					<c:forEach var="cartItem" items="${cartItems}" varStatus="status">
						<input type="hidden" name="item_${status.index}_itemId"
							value="${cartItem.itemId}">
						<input type="hidden" name="item_${status.index}_quantity"
							value="${cartItem.quantity}">
						<input type="hidden" name="item_${status.index}_price"
							value="${cartItem.price}">
						<input type="hidden" name="item_${status.index}_isCoffee"
							value="${cartItem.isCoffee}">
						<c:choose>
							<c:when test="${cartItem.isCoffee == 1}">
								<input type="hidden" name="item_${status.index}_coffeeStatus"
									value="${cartItem.coffeeStatus}">
							</c:when>
							<c:otherwise>
								<input type="hidden" name="item_${status.index}_coffeeStatus"
									value="お菓子">
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<input type="hidden" name="shippingFee" value="${shippingFee}">
					<input type="hidden" name="deliveryDate" value="${deliveryDate}">
					<input type="hidden" name="paymentMethod" value="${paymentMethod}"><br>
					<div class="btnyoko">
						<input type="submit" value="購入確定" class="btn1">&nbsp;
						<button class="btn2" onclick="window.history.back();">戻る</button>
					</div>
				</form>
				
			</div>
		</div>
	</main>
</body>
</html>