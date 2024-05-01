<%--新規登録ページ--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoaSorte--新規登録</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<!-- 郵便番号から住所自動入力のために必要 -->
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
</head>
<body>
	<jsp:include page="header.jsp" />
    <h2>アカウント登録フォーム</h2>
    <form action="register" method="post" class="h-adr">
        <label>名前</label>
        <input type="text" name="name" required><br>
        
        <label>メールアドレス</label>
        <input type="text" name="mail_address" required><br>
        
        <label>パスワード(4文字以上)</label>
        <input type="password" name="password" id="pass" autocomplete="off" minlength="4" required><br>
        
        <label>パスワード(確認)</label>
        <input type="password" name="pass_confirmation" id="pass_confirmation" 
        	autocomplete="off" minlength="4" required onkeyup="checkPasswordMatch()"><br>
        <p id="confirmMessage"></p>
        
        <label>郵便番号</label>
        <input type="hidden" class="p-country-name" value="Japan">
        <input type="text" name="postnum" class="p-postal-code" size="8" 
        	maxlength="8" placeholder="0001111"><br>
        
        <label>住所</label>
        <input type="text" name="address" class="p-region p-locality p-street-address p-extended-address"><br>
        
        <label>生年月日(yyyymmdd)</label>
        <input type="text" name="birthday" required><br>
        
        <label>電話番号</label>
        <input type="text" name="telephone" required><br>
        
        <label>どのようにして知りましたか</label>
        <select name="recognition">
            <option value="検索エンジン（Google、yahoo!等）で検索した">検索エンジン（Google、yahoo!等）で検索した</option>
            <option value="知人からの紹介">知人からの紹介</option>
            <option value="TVで見た">TVで見た</option>
            <option value="SNSで見た">SNSで見た</option>
        </select><br>
       	
       	<label>ダイレクトメッセージの受信を許可する</label>
		<input type="checkbox" id="ok_dm_checkbox" name="ok_dm" value="1"><br>
        
        <input type="submit" value="登録">
    </form>
</body>
</html>

