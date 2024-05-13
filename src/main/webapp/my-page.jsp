<%@ page import="java.util.List, java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte--マイページ" />
</jsp:include>

<body>
	<jsp:include page="header.jsp" />
	<main>
		<%
            List<Map<String, String>> accounts = (List<Map<String, String>>) request.getAttribute("accounts");
            System.out.println("リクエストスコープにセットされたアカウント情報: " + accounts);
        %>

		<h2>ユーザー情報</h2>
			<c:forEach var="account" items="${accounts}">
				<label>メールアドレス</label><br>
				${account.mail_address}
				<br>
				
				<label>名前</label><br>
				${account.name}
				<br>
				
				<label>郵便番号</label><br>
				${account.postnum}
				<br>
				
				<label>住所</label><br>
				${account.address}
				<br>
				
				<label>誕生日</label><br>
				${account.birthday}
				<br>

				<label>電話番号</label><br>
				${account.telephone}
				<br>

				<label>DM</label><br>
				<c:choose>
					<c:when test="${account.ok_dm eq '1'}">
                		受け取る
					</c:when>
					<c:otherwise>
                		受け取らない
					</c:otherwise>
				</c:choose>
				<br>
				
				<label>更新日時</label><br>
				${account.updated_at}
				<br>
				
			</c:forEach>
			
		<form action="edit-account">
			<button type="submit">アカウント編集</button>
		</form>

		<form action="gift-list">
			<button type="submit">ギフト先一覧</button>
		</form>
				
		<form action="MinServlet">
			<button type="submit">商品一覧へ</button>
		</form>
		
		<form action="OrderHistoryServlet">
			<button type="submit">購入履歴一覧へ</button>
		</form>
		
		<form action="Logout">
			<button type="submit">ログアウト</button>
		</form>
		
	</main>
	<footer> </footer>
</body>
</html>
