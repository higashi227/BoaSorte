<%@ page import="java.util.List, java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Integer accountId = (Integer) session.getAttribute("account_id");
%>


<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte--ギフト先登録" />
</jsp:include>

<body>
	<jsp:include page="header.jsp" />

	<main>
		<div class="main-container">
			<form action="gift-register" method="post">
				<h2>ギフト先登録</h2>
				<dl>
					<dt><label for="gname">名前</label></dt>
					<dd><input type="text" id="gname" name="gname" required /></dd>
				</dl>
				
				<dl>
				<dt><label for="gpostnum">郵便番号</label></dt>
				<dd><input type="text" id="gpostnum" name="gpostnum" required onblur="getAddressFromPostcode()" required /></dd>
				</dl>
				
				<dl>
				<dt><label for="gaddress">住所</label></dt>
				<dd><input type="text" id="gaddress" class="inpw" name="gaddress" required /></dd>
				</dl>
				
				<div class="btncenter">
					<input type="submit" class="btn1" value="登録" />&nbsp;
					<button class="btn2" onclick="window.location.href='./gift-list';">戻る</button>
				</div>
			</form>
		</div>
	</main>

	<footer> </footer>
	<script src="js/gpostnum.js"></script>
</body>
</html>
