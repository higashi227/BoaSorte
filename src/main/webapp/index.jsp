<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte" />
</jsp:include>
	<body>
		<jsp:include page="header.jsp" />
		<div class="main-visual">
			<div class="main-logo">	
				<h2>BoaSorte<br>Online Shop.</h2>
			</div>
		</div>
		
		<main>
		
		<jsp:include page="all-items.jsp" />
		
		</main>
	
		<footer> </footer>

	<script src="js/all-items.js"></script>
	</body>
</html>