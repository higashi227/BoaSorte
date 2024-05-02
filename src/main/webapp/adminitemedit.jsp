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
	<table border="1">
		<caption>【商品編集】</caption>
		<thead>
			<tr>
				<th scope="auto">品番</th>
				<th scope="auto">商品名</th>
				<th scope="auto">金額</th>
				<th scope="auto">商品内容</th>
				<th scope="auto">編集</th>
				<th scope="auto">削除</th>
			</tr>
		</thead>
		<tbody>
			<% 
                List<Item> itemList = (List<Item>) request.getAttribute("itemList");
                if (itemList != null && !itemList.isEmpty()) {
                    for (Item item : itemList) {
            %>
			<tr>
				<td><%= item.getItemId() %></td>
				<td><%= item.getName() %></td>
				<td><%= item.getPrice() %></td>
				<td><%= item.getIsCoffee() == 1 ? "コーヒー" : "お菓子" %></td>
				<td><button onclick="editRow(this)">編集</button></td>
				<td><button onclick="deleteRow(this)">削除</button></td>
			</tr>
			<% 
                    }
                } else {
            %>
			<tr>
				<td colspan="4">商品情報がありません</td>
			</tr>
			<% 
                }
            %>
		</tbody>
	</table>

	<br>
	<h3>新規登録</h3>
	<form action="AdminItemAddServlet" method="post">

		<label for="name">商品名:</label> <input type="text" id="name"
			name="name"><br> <br> <label for="price">価格:</label>
		<input type="text" id="price" name="price"><br> <br>
		<label for="is_coffee">コーヒー</label> <input type="checkbox"
			id="is_coffee" name="is_coffee" value="1"><br> <br>
		<input type="submit" value="保存">
	</form>
	
	<h3>商品編集</h3>
	


	<script type="text/javascript">
	//行を編集
		function editRow(button) {
			var row = button.parentNode.parentNode;
			var cells = row.getElementsByTagName('td');

			// 各セルについて編集可能なフィールドに変更
			for (var i = 1; i < cells.length -2; i++) { 
			var value =cells[i].innerText;
			cells[i].innerHTML = '<input type="text" value="' + value + '">';
			}

		// 編集ボタンを「保存」ボタンに切り替え
		button.innerText = '保存';
		button.setAttribute('onclick', 'saveRow(this)');

		function saveRow(button) {
				var row = button.parentNode.parentNode;
			var inputs = row.getElementsByTagName('input');
		}
		//行の削除
			function deleteRow(button) {
				var row = button.parentNode.parentNode;
		    	row.remove();
				}
	}

	</script>



</body>

</html>


