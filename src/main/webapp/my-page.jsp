<%--マイページ--%>

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
		<table>
			<tr>
				<td>名前</td>
				<td></td>
			</tr>
			<tr>
				<td>住所</td>
				<td></td>
			</tr>
			<tr>
				<td>電話番号</td>
				<td></td>
			</tr>
			<tr>
				<td>メールアドレス</td>
				<td></td>
			</tr>
			<tr>
				<td>パスワード</td>
				<td></td>
			</tr>
			<tr>
				<td>DMの有無</td>
				<td></td>
			</tr>
		</table>
		ギフト先情報
		<table>
			<tr>
				<td>名前</td>
				<td></td>
			</tr>
			<tr>
				<td>住所</td>
				<td></td>
			</tr>
		</table>


	</main>
	<footer> </footer>
</body>
</html>