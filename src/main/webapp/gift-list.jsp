<%@ page import="java.util.List"%>
<%@ page import="model.Gift"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte--ギフト先一覧" />
</jsp:include>
<body>
	<jsp:include page="header.jsp" />
	<main>
    	<h2>ギフト先一覧</h2>
    	<table border="1">
        	<tr>
            	<th>ギフトID</th>
            	<th>名前</th>
            	<th>郵便番号</th>
            	<th>住所</th>
        	</tr>
        	<c:forEach var="gift" items="${gifts}">
            	<tr>
                	<td>${gift.giftId}</td>
                	<td>${gift.gname}</td>
                	<td>${gift.gpostnum}</td>
                	<td>${gift.gaddress}</td>
            	</tr>
        	</c:forEach>
    	</table>
    	<form action="gift-register.jsp">
        	<button type="submit">ギフト先登録</button>
    	</form>
    </main>
</body>
</html>
