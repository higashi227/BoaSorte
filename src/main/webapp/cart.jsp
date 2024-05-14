<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ja">
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte--カートページ" />
</jsp:include>
<body>
	<jsp:include page="header.jsp" />
	<main>
	<table border="1">
		<caption>【カート】</caption>
		<thead>
			<tr>
				
                <th scope="auto">アイテム名</th>
                <th scope="auto">価格</th>
                <th scope="auto">数量</th>
                <th scope="auto">小計</th>
                <th scope="auto">コーヒーの状態</th>
                <th scope="auto">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:set var="totalPrice" value="0" />
			<c:forEach var="cartItem" items="${cartItems}">
				<tr>
					
                    <td>${cartItem.name}</td>
                    <td>${cartItem.price}</td>
                    <td>
						<form action="UpdateCartServlet" method="post">
							<input type="hidden" name="itemId" value="${cartItem.itemId}">
							<input type="hidden" name="coffeeStatus" value="${cartItem.coffeeStatus}">
							<input type="number" name="quantity" value="${cartItem.quantity}" min="1">
							<input type="submit" value="更新">
						</form>
					</td>
					<td>
						<c:set var="subtotal" value="${cartItem.price * cartItem.quantity}" />
						<c:set var="totalPrice" value="${totalPrice + subtotal}" />
						${subtotal}
					</td>
					<td>
					 <c:choose>
                            <c:when test="${cartItem.coffeeStatus != null}">
                                ${cartItem.coffeeStatus}
                            </c:when>
                            <c:otherwise>
                                <span>お菓子</span>
                            </c:otherwise>
                        </c:choose>
					</td>
					<td>
						<form action="RemoveFromCartServlet" method="post">
							<input type="hidden" name="itemId" value="${cartItem.itemId}">
								<input type="hidden" name="coffeeStatus" value="${cartItem.coffeeStatus}">
							<input type="submit" value="削除">
						</form>
					</td>
				</tr>
			</c:forEach>
			 <!-- 税計算 -->
           <c:set var="taxDecimal" value="${totalPrice * 0.1}" />
			<c:set var="tax" value="${fn:substringBefore(taxDecimal, '.')}" />
			 <tr>
                <td colspan="4" style="text-align: right;"><strong>税（10%）:</strong></td>
                <td><strong>${tax}</strong></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: right;"><strong>合計金額:</strong></td>
                <td><strong>${totalPrice + tax}</strong></td>
                <td></td>
            </tr>
        </tbody>
    </table>
    <form action="PurchaseServlet" method="post" class="form-inline">
    	<input type="hidden" name="tax" value="${tax}">
        <input type="submit" value="購入手続き" class="button-inline">
    </form>
    <form action="MinServlet">
        <input type="submit" value="商品一覧へ" />
    </form>
    </main>
</body>
</html