<%--カートページ--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="utils.DBUtil" %>
<%@ page import="model.Cart"%>
<%@ page import="dao.CartDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
				 <th scope="auto">アイテムID</th>
                 <th scope="auto">アイテム名</th>
                 <th scope="auto">価格</th>
                 <th scope="auto">数量</th>
                 <th scope="auto">小計</th>
                 <th scope="auto">操作</th>
            <tr>
			</tr>
			</thead>
			<tbody>
				<c:set var="totalPrice" value="0" />
				<c:forEach var="cartItem" items="${cartItems}">
					<tr> 
		    			<td>${cartItem.itemId}</td>
                		<td>${cartItem.name}</td>
                		<td>${cartItem.price}</td>
                		<td>
 							<form action="UpdateCartServlet" method="post">
                                <input type="hidden" name="itemId" value="${cartItem.itemId}">
                                <input type="number" name="quantity" value="${cartItem.quantity}" min="1">
                                <input type="submit" value="更新">
                            </form>
						</td>
						<td>
                            <c:set var="subtotal" value="${cartItem.price * cartItem.quantity}"/>
                            <c:set var="totalPrice" value="${totalPrice + subtotal}"/>
                            ${subtotal}
                        </td>
                		<td>
                			<form action="RemoveFromCartServlet" method="post">
                    			<input type="hidden" name="itemId" value="${cartItem.itemId}">
                        		<input type="submit" value="削除">
                    		</form>
               			</td>
					</tr>
				</c:forEach>
				 <tr>
                    <td colspan="4" style="text-align: right;"><strong>合計金額:</strong></td>
                    <td><strong>${totalPrice}</strong></td>
                    <td></td>
                </tr>
			</tbody>
	</table>
	<form action="purchase.jsp" method="post" class="form-inline">
		<input type="submit" value="購入" class="button-inline">
	</form> 
	<form action="MinServlet">
		<input type="submit" value="商品一覧へ" />
	</form>
	</main> 
</body>
</html>
