<%@ page import="java.util.List, java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte--マイページ" />
</jsp:include>


<body>
	<jsp:include page="header.jsp" />
	<main>
		<%
            List<Map<String, String>> accounts = (List<Map<String, String>>)request.getAttribute("accounts");
            System.out.println("リクエストスコープにセットされたアカウント情報: " + accounts);
        %>

		ユーザー情報
		<table border="1">
			<c:forEach var="account" items="${accounts}">
				<tr>
					<th>メールアドレス</th>
					<td>${account.mail_address}</td>
				</tr>
				<tr>
					<th>名前</th>
					<td>${account.name}</td>
				</tr>
				<tr>
					<th>郵便番号</th>
					<td>${account.postnum}</td>
				</tr>
				<tr>
					<th>住所</th>
					<td>${account.address}</td>
				</tr>
				<tr>
					<th>誕生日</th>
					<td>${account.birthday}</td>
				</tr>
				<tr>
					<th>電話番号</th>
					<td>${account.telephone}</td>
				</tr>
				<tr>
					<th>ダイレクトメッセージOK</th>
					<td>        <c:choose>
            <c:when test="${account.ok_dm eq '1'}">
                受け取る
            </c:when>
            <c:otherwise>
                受け取らない
            </c:otherwise>
        </c:choose></td>
				</tr>

				<tr>
					<th>更新日時</th>
					<td>${account.updated_at}</td>
				</tr>

				<tr>
					<form action="edit-account">
						<input type="submit" value="アカウントを編集する" />
					</form>

					<form action="gift-register.jsp">
						<button type="submit">ギフト先登録</button>
					</form>

				</tr>

			</c:forEach>
		</table>
	</main>
	<footer> </footer>
</body>
</html>
