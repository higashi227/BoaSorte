<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<caption>【購入履歴】</caption>
        <thead>
            <tr>
                <th scope="auto">商品名</th>
                <th scope="auto">数量</th>
                <th scope="auto">価格</th>
                <th scope="auto">送料</th>
                <th scope="auto">詳細</th>
                <th scope="auto">合計金額</th>
               	<th scope="auto">購入日</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="detail" items="${orderDetails}">
                <tr>
                    <td>${detail.itemName}</td>
                    <td>${detail.quantity}</td>
                    <td>${detail.price}</td>
                    <td>${detail.postage}</td>
                    <td>${detail.coffeeStatus}</td>
                    <td>${detail.totalAmount}</td>
                    <td>${detail.createdAt}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <form action="my-page">
        <input type="submit" value="マイページへ" />
    </form>
    </main>
</body>
</html>