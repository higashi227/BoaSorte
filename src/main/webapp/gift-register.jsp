<%@ page import="java.util.List, java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
    <jsp:param name="pageTitle" value="BoaSorte--ギフト先登録" />
</jsp:include>

<body>
    <jsp:include page="header.jsp" />
    
    <main>
        <h2>ギフト先登録</h2>
        <form action="register-gift" method="post">
            <c:forEach var="i" begin="1" end="5">
                <h3>ギフト先${i}</h3>
                <label for="gname${i}">名前:</label>
                <input type="text" id="gname${i}" name="gname${i}" required /><br>
                <label for="gpostnum${i}">郵便番号:</label>
                <input type="text" id="gpostnum${i}" name="gpostnum${i}" required /><br>
                <label for="gaddress${i}">住所:</label>
                <input type="text" id="gaddress${i}" name="gaddress${i}" required /><br>
            </c:forEach>
            <input type="submit" value="登録する" />
        </form>
    </main>
    <footer> </footer>
</body>
</html>
