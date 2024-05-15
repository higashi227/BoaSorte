<%--購入完了ページ--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte--購入完了" />
</jsp:include>
<body>
	<jsp:include page="header.jsp" />
	<main>
		<div class="main-container">
			<h2>購入完了</h2>
			<p class="center">購入が完了しました。</p>
			<br>
			<div class="btncenter">
				<form action="MinServlet">
					<input type="submit" class="btn2" value="商品一覧へ" />
				</form>
			</div>
		</div>
	</main>
</body>
</html>