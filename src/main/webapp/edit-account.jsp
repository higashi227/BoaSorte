<%@ page import="java.util.List, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
    <jsp:param name="pageTitle" value="BoaSorte--ユーザー編集" />
</jsp:include>

<body>
    <jsp:include page="header.jsp" />
    <main>
    <div class="main-container">
        <form action="update-account" method="post">
            <c:forEach var="account" items="${accounts}">
            	<h2>ユーザー編集</h2>
	                <input type="hidden" name="accountId" value="${account.account_id}" />
	                
	                <dl>
		                <dt><label for="email">メールアドレス</label></dt>
		                <dd><input type="email" id="email" name="email" value="${account.mail_address}" class="inpw" required /></dd>
	                </dl>
	                
	                <dl>
		                <dt><label for="password">パスワード</label></dt>
		                <dd><input type="password" id="password" name="password" value="${account.password}" class="inpw" required /></dd>
	                </dl>
	                
	                <dl>
		                <dt><label for="postnum">郵便番号</label></dt>
		                <dd><input type="text" id="postnum" name="postnum" value="${account.postnum}" required onblur="getAddressFromPostcode()" /></dd>
	                </dl>
	                
	                <dl>
		                <dt><label for="address">住所</label></dt>
		                <dd><input type="text" id="address" name="address" value="${account.address}" class="inpw" required /></dd>
	                </dl>
	                
	                <dl>
		                <dt><label for="telephone">電話番号</label></dt>
		                <dd><input type="tel" id="telephone" name="telephone" value="${account.telephone}" class="inpw" required /></dd>
	                </dl>
	                
	                <dl>
		                <dt><label for="ok_dm">ダイレクトメッセージ</label></dt>
		                <dd><input type="checkbox" id="ok_dm" name="ok_dm" value="1" ${account.ok_dm == '1' ? 'checked' : ''} />受け取る</dd>
	                </dl>
                <div class="btncenter">
                	<input type="submit" class="btn1" value="編集" />
                	&nbsp;
		        	<button class="btn2" onclick="window.location.href='./my-page';">戻る</button>
                </div>

                
            </c:forEach>
        </form>
    </div>
    </main>
    <footer> </footer>
    <script src="js/postnum.js"></script>
</body>
</html>
