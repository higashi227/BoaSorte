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
		ユーザー情報
    <table border="1">
        <tr>
            <th>メールアドレス</th>
            <th>名前</th>
            <th>郵便番号</th>
            <th>住所</th>
            <th>誕生日</th>
            <th>電話番号</th>
            <th>認識経路</th>
            <th>ダイレクトメッセージOK</th>
            <th>作成日時</th>
            <th>更新日時</th>
            <th>編集</th>
        </tr>
        <c:forEach var="account" items="${accounts}">
            <tr>
                <td>${account.mail_address}</td>
                <td>${account.name}</td>
                <td>${account.postnum}</td>
                <td>${account.address}</td>
                <td>${account.birthday}</td>
                <td>${account.telephone}</td>
                <td>${account.recognition}</td>
                <td>${account.ok_dm}</td>
                <td>${account.created_at}</td>
                <td>${account.updated_at}</td>
                <td><a href="edit?id=${account.account_id}">編集</a></td>
            </tr>
        </c:forEach>
    </table>


	</main>
	<footer> </footer>
</body>
</html>