<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Item"%>

<html lang="ja">

	<head>
    	<title>商品編集</title>
	</head>

	<body>
	
    	<h1>商品編集</h1>
    	
    	<form action="ItemAddServlet" method="post">
    	
        	<label for="name">商品名:</label>
        		<input type="text" id="name" name="name" value="${product.name}"><br><br>
        		
        	<label for="price">価格:</label>
        		<input type="text" id="price" name="price" value="${product.price}"><br><br>
        		
        	<label for="is_coffee">コーヒーかどうか</label>
        		<input type="checkbox" id="is_coffee" name="is_coffee" value="true"><br><br>
			
        	<input type="submit" value="保存">
    	</form>


	</body>

</html>
