<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
  String pageTitle = request.getParameter("pageTitle");
%>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title><%= pageTitle %></title>
		<link rel="stylesheet" href="css/style.css">
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="js/style.js"></script>
	</head>