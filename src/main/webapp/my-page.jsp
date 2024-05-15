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
	<div class="main-container">
		<h2>ユーザー情報</h2>
		<c:forEach var="account" items="${accounts}">
		
			<dl>
				<dt>メールアドレス</dt>
				<dd>${account.mail_address}</dd>
			</dl>
				
			<dl>	
				<dt>名前</dt>
				<dd>${account.name}</dd>
			</dl>
				
			<dl>	
				<dt>郵便番号</dt>
				<dd>${account.postnum}</dd>
			</dl>
				
			<dl>
				<dt>住所</dt>
				<dd>${account.address}</dd>
			</dl>
				
			<dl>	
				<dt>誕生日</dt>
				<dd>${account.birthday}</dd>
			</dl>
			
			<dl>
				<dt>電話番号</dt>
				<dd>${account.telephone}</dd>
			</dl>
				
			<dl>	
				<dt>DM</dt>
				<dd>
					<c:choose>
						<c:when test="${account.ok_dm eq '1'}">
	                		受け取る
						</c:when>
						<c:otherwise>
	                		受け取らない
						</c:otherwise>
					</c:choose>
				</dd>
			</dl>
			
			<dl>				
				<dt>更新日時</dt>
				<dd>${account.updated_at}</dd>
			</dl>
				
		</c:forEach>
	
		<div class="btnyoko btncenter">
			<form action="edit-account">
				<button type="submit" class="btn1">ユーザー編集</button>
			</form>
			&nbsp;
			<form action="gift-list">
				<button type="submit" class="btn1">ギフト先一覧</button>
			</form>
			&nbsp;
			<form action="OrderHistoryServlet">
				<button type="submit" class="btn1">購入履歴一覧</button>
			</form>
			
		</div>
		<div class="btncenter">
			<form action="Logout">
				<button type="submit" class="btn2">ログアウト</button>
			</form>
		</div>
	</div>
	</main>
	<footer> </footer>
</body>
</html>
