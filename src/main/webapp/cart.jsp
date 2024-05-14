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
		<div class="main-container">
			<h2>カート</h2>
			<div class="btncenter">
				<table>
					<thead>
						<tr>
							<th scope="auto">商品名</th>
							<th scope="auto">価格</th>
							<th scope="auto" class="number2">数量</th>
							<th scope="auto">小計</th>
							<th scope="auto">豆の状態</th>
							<th scope="auto"> </th>
						</tr>
					</thead>
					<tbody>
						<c:set var="totalPrice" value="0" />
						<c:forEach var="cartItem" items="${cartItems}">
							<tr>
								
			                    <td>${cartItem.name}</td><!-- 名前 -->
			                    <td class="right">${cartItem.price}</td> <!-- 価格 -->
			                    <td> <!-- 数量 -->
				                    <div class="btnyoko-new">
										<form action="UpdateCartServlet" method="post">
											<input type="hidden" name="itemId" value="${cartItem.itemId}">
											<input type="hidden" name="coffeeStatus" value="${cartItem.coffeeStatus}">
											<input type="number" name="quantity" value="${cartItem.quantity}" min="1" class="inpnum">
											<input type="submit" value="更新" class="btn2">
										</form>
									</div>
								</td>
								<td class="right"><!-- 小計 -->
									<c:set var="subtotal" value="${cartItem.price * cartItem.quantity}" />
									<c:set var="totalPrice" value="${totalPrice + subtotal}" />
									${subtotal}
								</td>
								<td class="center">
								 <c:choose>
			                            <c:when test="${cartItem.coffeeStatus != null}">
			                                ${cartItem.coffeeStatus}
			                            </c:when>
			                            <c:otherwise>
			                                <span>お菓子</span>
			                            </c:otherwise>
			                        </c:choose>
								</td>
								<td class="center">
									<form action="RemoveFromCartServlet" method="post">
										<input type="hidden" name="itemId" value="${cartItem.itemId}">
											<input type="hidden" name="coffeeStatus" value="${cartItem.coffeeStatus}">
										<input type="submit" value="削除" class="btn1">
									</form>
								</td>
							</tr>
						</c:forEach>
						 <!-- 税計算 -->
						<c:set var="taxDecimal" value="${totalPrice * 0.1}" />
						<c:set var="tax" value="${fn:substringBefore(taxDecimal, '.')}" />
						 <tr>
			                <td colspan="4" class="right"><strong>税(10%)</strong></td>
			                <td class="right"><strong>${tax}</strong></td>
			                <td></td>
			            </tr>
			            <tr>
			                <td colspan="4" class="right"><strong>合計金額</strong></td>
			                <td class="right"><strong>${totalPrice + tax}</strong></td>
			                <td></td>
			            </tr>
			        </tbody>
			    </table>
			</div>
			<div class="btncenter">
			    <form action="PurchaseServlet" method="post" class="form-inline">
			        <input type="submit" value="購入手続き" class="btn1">
			    </form>
			    &nbsp;
			    <form action="MinServlet">
			        <input type="submit" value="商品一覧へ" class="btn2" />
			    </form>
		    </div>
	    </div>
    </main>
</body>
</html