<%--新規登録ページ--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
 <form action="AccountRegister" method="post">
    <h1>新規登録</h1>
    <p>お名前</p>
	<input type="text" id="name" name="name" required>
    <p>パスワード</p>
	<input type="password" name="pass" id="pass"  autocomplete="off" minlength="4" required>
	<p>パスワード確認</p>
	<input type="password" name="pass_confirmation" id="pass_confirmation" autocomplete="off" minlength="4" required onkeyup="checkPasswordMatch()">
	<p id="confirmMessage"></p>
    <p>郵便番号</p>
    <input type="number" name=""  pattern="[0-9]{3}[0-9]{4}" placeholder="000-0000">
    <p>住所</p>
    <input type="text" name="">
    <p>生年月日</p>
    <input type="date">
    <p>電話番号</p>
    <input type="tel" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}">
    <p>どうやってサイトを知ったか</p>
    <label><input type="checkbox" name="check">りんご</label>
    <p>DM有無</p>
    <label><input type="radio" name="radio">有</label>
    <label><input type="radio" name="radio">無</label>
	<p><input type="submit" value="送信"></p>
</form>
</body>
</html>