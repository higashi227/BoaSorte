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
		<h2>ギフト先登録</h2>
		<form action="gift-register" method="post">
			<label for="gname">名前:</label>
			<input type="text" id="gname" name="gname" required /><br>
			
			<label for="gpostnum">郵便番号:</label>
			<input type="text" id="gpostnum" name="gpostnum" required onblur="getAddressFromPostcode()" required /><br>
			
			<label for="gaddress">住所:</label>
			<input type="text" id="gaddress" name="gaddress" required /> <br>
			
			<input type="submit" value="登録する" />
		</form>

	</main>

	<footer> </footer>
	<script src="js/gpostnum.js"></script>
</body>
</html>
