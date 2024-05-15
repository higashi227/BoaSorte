<%--新規登録ページ--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte--会員登録" />
</jsp:include>
<body>
	<jsp:include page="header.jsp" />
	<main>
	<div class="main-container">
    	<form action="register" method="post" class="h-adr">
        	<h2>ユーザー登録</h2>
        
	        <dl>
		        <dt>名前</dt>
		        <dd><input type="text" name="name" placeholder="佐藤太郎" class="inpw" required></dd>
	        </dl>
	        
	        <dl>
		        <dt>メールアドレス</dt>
		        <dd><input type="text" name="mail_address" class="inpw" placeholder="abcd@sample.jp" required></dd>
	        </dl>
	        
	        <dl>
		        <dt>パスワード</dt>
		        <dd><input type="password" name="password" id="pass" class="inpw" placeholder="4文字以上" autocomplete="off" minlength="4" required></dd>
	        </dl>
	        
	        <dl>
		        <dt>パスワード</dt>
		        <dd><input type="password" name="pass_confirmation" id="pass_confirmation" 
		        	autocomplete="off" minlength="4" placeholder="確認用" class="inpw" required onkeyup="checkPasswordMatch()"></dd>
		        <p id="confirmMessage"></p>
	        </dl>
	        
	        <dl>
	        <dt>郵便番号</dt>
	        <input type="hidden" class="p-country-name" value="Japan">
	        <input type="text" name="postnum" class="p-postal-code" size="8" 
	        	maxlength="8" placeholder="0001111"><br>
	        </dl>
	        
	        <dl>
		        <dt>住所</dt>
		        <dd><input type="text" name="address" class="inpw p-region p-locality p-street-address p-extended-address"></dd>
	        </dl>
	        
	        <dl>
		        <dt>生年月日(yyyymmdd)</dt>
		        <dd><input type="text" name="birthday" class="inpw" placeholder="19900101" required></dd>
	        </dl>
	        
	        <dl>
		        <dt>電話番号</dt>
		        <dd><input type="text" name="telephone" class="inpw" placeholder="09000000000" required></dd>
	        </dl>
	        
	        <dl>
		        <dt>どこで知りましたか</dt>
		        <dd>
		        	<select name="recognition">
			            <option value="検索エンジン（Google、yahoo!等）で検索した">検索エンジン（Google、yahoo!等）で検索した</option>
			            <option value="知人からの紹介">知人からの紹介</option>
			            <option value="TVで見た">TVで見た</option>
			            <option value="SNSで見た">SNSで見た</option>
		        	</select>
		        </dd>
	       	</dl>
	       	
	       	<dl>
		       	<dt>DM</dt>
				<dd><input type="checkbox" id="ok_dm_checkbox" name="ok_dm" value="1">受け取る</dd>
			</dl>
		     
	        <div class="btncenter">
	        	<input type="submit" value="登録" class="btn1">
        	</div>
    	</form>
    </div>
    </main>
    
    <script src="https://yubinbango.github.io/yubinbango/yubinbango.js" charset="UTF-8"></script>
	<script>
	    function checkPasswordMatch() {
	        var password = document.getElementById("password").value;
	        var confirmPassword = document.getElementById("pass_confirmation").value;
	        var message = document.getElementById("confirmMessage");
	        if (password != confirmPassword) {
	            message.innerHTML = "パスワードが一致しません";
	            message.style.color = "red";
	        } else {
	            message.innerHTML = "";
	        }
	    }
	    
	    function validateForm() {
	        var password = document.getElementById("password").value;
	        var confirmPassword = document.getElementById("pass_confirmation").value;
	        if (password != confirmPassword) {
	            document.getElementById("confirmMessage").innerHTML = "パスワードが一致しません";
	            document.getElementById("confirmMessage").style.color = "red";
	            return false;
	        }
	        return true;
	    }
	</script>
</body>
</html>

