<%--新規登録ページ--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規登録</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<!-- 郵便番号から住所自動入力のために必要 -->
 <script src="https://yubinbango.github.io/yubinbango/yubinbango.js" charset="UTF-8"></script>
<script>
	//パスワードとパスワード確認の値が一致しない場合にエラーメッセージを表示。
	//onkeyupイベントでpass_confirmationと関連付け。入力の度にエラーがあれば表示される動作。
    function checkPasswordMatch() {
        var password = document.getElementById("pass").value;
        var confirmPassword = document.getElementById("pass_confirmation").value;
        var message = document.getElementById("confirmMessage");
        if (password != confirmPassword) {
            message.innerHTML = "パスワードが一致しません";
            message.style.color = "red";
        } else {
            message.innerHTML = "";
        }
    }
    
	//送信時の確認
	//パスワードとパスワード確認の値が一致しない場合、エラーメッセージを表示→フォームの送信を中止。
	//一致する場合は送信を許可。
    function validateForm() {
        var password = document.getElementById("pass").value;
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
	<form class="h-adr" action="AccountRegister" method="post">
		<h1>新規登録</h1>
		<p>お名前</p>
		<input type="text" id="name" name="name" required>
		<p>メールアドレス</p>
		<input type="email" id="email" name="email" required>
		<p>パスワード（４文字以上）</p>
		<input type="password" name="pass" id="pass" autocomplete="off"
			minlength="4" required>
		<p>パスワード確認（４文字以上）</p>
		<input type="password" name="pass_confirmation" id="pass_confirmation"
			autocomplete="off" minlength="4" required
			onkeyup="checkPasswordMatch()">
		<p id="confirmMessage"></p>
		<p>郵便番号（ハイフンなし半角記入）</p>
		<input type="hidden" class="p-country-name" value="Japan"> <input
			type="text" name="" class="p-postal-code" size="8" maxlength="8"
			placeholder="0001111">
		<p>住所</p>
		<input type="text" name=""
			class="p-region p-locality p-street-address p-extended-address">
		<p>生年月日</p>
		<input type="date">
		<p>電話番号（ハイフンなしで半角記入）</p>
		<input type="tel" pattern="[0-9]{11}" placeholder="01012345678">
		<p>どうやってサイトを知ったか</p>
		<label><input type="checkbox" name="check">りんご</label>
		<p>DM有無</p>
		<label><input type="radio" name="radio">有</label> <label><input
			type="radio" name="radio">無</label>
		<p>
			<input type="submit" value="送信">
		</p>
	</form>
</body>
</html>