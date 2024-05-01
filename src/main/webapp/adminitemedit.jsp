<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Item"%>

<html lang="ja">
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte--管理者編集ページ" />
</jsp:include>
	<body>
	
    	<h2>商品編集</h2>
    	
    	<form action="AdminItemAddServlet" method="post">
    	
        	<label for="name">商品名:</label>
        		<input type="text" id="name" name="name"><br><br>
        		
        	<label for="price">価格:</label>
        		<input type="text" id="price" name="price"><br><br>
        		
        	<label for="is_coffee">コーヒー</label>
        		<input type="checkbox" id="is_coffee" name="is_coffee"><br><br>
				
    	</form>
    	
    	<form action="AdminItemAddServlet" method="post" class="form-inline">
    	<input type="submit" value="保存">


	</body>

</html>


