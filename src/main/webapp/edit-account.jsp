<%@ page import="java.util.List, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
    <jsp:param name="pageTitle" value="BoaSorte--アカウント編集" />
</jsp:include>

<body>
    <jsp:include page="header.jsp" />
    <main>
        <form action="update-account" method="post">
            <c:forEach var="account" items="${accounts}">
                <input type="hidden" name="accountId" value="${account.account_id}" />
                <label for="email">メールアドレス:</label>
                <input type="email" id="email" name="email" value="${account.mail_address}" required /><br>
                <label for="password">パスワード:</label>
                <input type="password" id="password" name="password" value="${account.password}" required /><br>
                <label for="postnum">郵便番号:</label>
                <input type="text" id="postnum" name="postnum" value="${account.postnum}" required onblur="getAddressFromPostcode()" /><br>
                <label for="address">住所:</label>
                <input type="text" id="address" name="address" value="${account.address}" required /><br>
                <label for="telephone">電話番号:</label>
                <input type="tel" id="telephone" name="telephone" value="${account.telephone}" required /><br>
                <label for="ok_dm">ダイレクトメッセージOK:</label>
                <input type="checkbox" id="ok_dm" name="ok_dm" value="1" ${account.ok_dm == '1' ? 'checked' : ''} /><br>
                <input type="submit" value="更新する" />
            </c:forEach>
        </form>
    </main>
    <footer> </footer>
    <script src="js/postnum.js"></script>
</body>
</html>
