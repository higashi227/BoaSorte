
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Account"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList, java.util.List"%>


<!DOCTYPE html>



<html lang="ja">

<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte--管理者ページ" />
</jsp:include>

<body>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.2.0/chart.min.js"
		integrity="sha512-VMsZqo0ar06BMtg0tPsdgRADvl0kDHpTbugCBBrL55KmucH6hP9zWdLIWY//OTfMnzz6xWQRxQqsUFefwHuHyg=="
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns@next/dist/chartjs-adapter-date-fns.bundle.min.js"></script>
	<table border="1">
		<caption>ユーザー検索</caption>
		<thead>
			<tr>
				<th scope="auto">ID</th>
				<th scope="auto">メールアドレス</th>
				<th scope="auto">パスワード</th>
				<th scope="auto">氏名</th>
				<th scope="auto">郵便番号</th>
				<th scope="auto">住所</th>
				<th scope="auto">生年月日</th>
				<th scope="auto">電話番号</th>
			</tr>
		</thead>
		<tbody>
			<%
			List<Account> userList = (List<Account>) request.getAttribute("userList");
			if (userList != null && !userList.isEmpty()) {
				for (Account user : userList) {
			%>
			<tr>
				<td><%=user.getAccountId()%></td>
				<td><%=user.getMailAddress()%></td>
				<td><%=user.getPassword()%></td>
				<td><%=user.getName()%></td>
				<td><%=user.getPostnum()%></td>
				<td><%=user.getAddress()%></td>
				<td><%=user.getBirthday()%></td>
				<td><%=user.getTelephone()%></td>
				<%-- <td><%=user.getRecognition()%></td>
				<td><%=user.isOkDm() ? "はい" : "いいえ"%></td>
				<td><%=user.getCreatedAt()%></td>--%>
			</tr>
			<%
			}
			} else {
			%>
			<tr>
				<td colspan="11">該当するユーザーが見つかりませんでした。</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>


</body>
</html>