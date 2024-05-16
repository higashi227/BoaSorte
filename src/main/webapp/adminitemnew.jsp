<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Item"%>
<html lang="ja">
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte--商品追加" />
</jsp:include>
<body>
	<div class="main-container">
		<h2>商品登録</h2>
		<div class="btncenter btnyoko">
			<form action="AdminItemAddServlet" method="post">
				<dl>
					<dt>
						<label for="name">商品名</label>
					</dt>
					<dd>
						<input type="text" id="name" name="name">
					</dd>
				</dl>
				<dl>
					<dt>
						<label for="price">価格</label>
					</dt>
					<dd>
						<input type="text" id="price" name="price">
					</dd>
				</dl>
				<dl>
					<dt>
						<label for="is_coffee">コーヒー</label>
					</dt>
					<dd>
						<input type="checkbox" id="is_coffee" name="is_coffee" value="1">
					</dd>
				</dl>
				<div class="center">
					<input type="submit" value="追加" class="btn1">
				</div>
			</form>
		</div>
		<div class="btncenter">
			<form action="ItemListServlet" method="get">
				<input type="submit" value="戻る" class="btn2">
			</form>
		</div>

	</div>

</body>

</html>


