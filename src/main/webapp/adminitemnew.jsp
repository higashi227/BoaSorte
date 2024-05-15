<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Item"%>
<html lang="ja">
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte--管理者ページ" />
</jsp:include>
<body>
	
	<br>
	<h2>新規登録</h2>
	<form action="AdminItemAddServlet" method="post">

		<label for="name">商品名:</label> <input type="text" id="name"
			name="name"><br> <br> <label for="price">価格:</label>
		<input type="text" id="price" name="price"><br> <br>
		<label for="is_coffee">コーヒー</label> <input type="checkbox"
			id="is_coffee" name="is_coffee" value="1"><br> <br>
		
		
		<input type="submit" value="保存">
	</form>
	
	 <form action="ItemListServlet" method="get">
        <input type="submit" value="戻る">
    </form>
	
	

</body>

</html>


