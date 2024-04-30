<%@ page import="java.util.List, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            List<Map<String, String>> accounts = (List<Map<String, String>>)request.getAttribute("accounts");
            System.out.println("リクエストスコープにセットされたアカウント情報: " + accounts);
        %>
        
        ユーザー情報
        <table border="1">
            <c:forEach var="account" items="${accounts}">
                <tr>
                    <th>メールアドレス</th>
                    <td>${account.mail_address}</td>
                    <td><button onclick="showEditForm('mail_address')">編集</button></td>
                </tr>
                <tr>
                    <th>名前</th>
                    <td>${account.name}</td>
                    <td><button onclick="showEditForm('name')">編集</button></td>
                </tr>
                <tr>
                    <th>郵便番号</th>
                    <td>${account.postnum}</td>
                    <td><button onclick="showEditForm('postnum')">編集</button></td>
                </tr>
                <tr>
                    <th>住所</th>
                    <td>${account.address}</td>
                    <td><button onclick="showEditForm('address')">編集</button></td>
                </tr>
                <tr>
                    <th>誕生日</th>
                    <td>${account.birthday}</td>
                </tr>
                <tr>
                    <th>電話番号</th>
                    <td>${account.telephone}</td>
                    <td><button onclick="showEditForm('telephone')">編集</button></td>
                </tr>
                <tr>
                    <th>ダイレクトメッセージOK</th>
                    <td>${account.ok_dm}</td>
                </tr>

                <tr>
                    <th>更新日時</th>
                    <td>${account.updated_at}</td>
                </tr>

            </c:forEach>
        </table>
         <script src="js/editprofile.js"></script>
    </main>
    <footer> </footer>
</body>
</html>
