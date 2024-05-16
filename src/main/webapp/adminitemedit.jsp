<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Item"%>
<html lang="ja">
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte--管理者ページ" />
</jsp:include>
<style>
form {
	margin: 0;
}
</style>
<body>
	<div class="main-container">
		<h2>商品編集</h2>
		<div class="btncenter">
			<table>
				<thead>
					<tr>
						<th scope="auto">品番</th>
						<th scope="auto">商品名</th>
						<th scope="auto">金額</th>
						<th scope="auto">商品内容</th>
						<th scope="auto"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${itemList}">
						<tr>
							<td class="right">${item.itemId}</td>
							<td>${item.name}</td>
							<td class="right">${item.price}</td>
							<td class="center">${item.isCoffee == 1 ? "コーヒー" : "お菓子"}</td>
							<td style="">
								<form action="AdminItemDeleteServlet" method="post">
									<input type="hidden" name="id" value="${item.itemId}">
									<input type="submit" value="削除" class="btn1">
								</form>
							</td>
						</tr>
					</c:forEach>
					<c:if test="${empty itemList}">
						<tr>
							<td colspan="5">商品情報がありません</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
		<h3>商品編集</h3>
		<form action="AdminItemUpdateServlet" method="post">
			<dl>
				<dt>
					<label>商品IDを選択：</label>
				</dt>
				<dd>
					<select name="id" onchange="updateForm(this.value)">
						<c:forEach var="item" items="${itemList}">
							<option value="${item.itemId}">${item.itemId}</option>
						</c:forEach>
					</select>
					<!-- 選択された商品の情報を保持するhiddenフィールド -->
					<input type="hidden" id="selectedItemId" name="selectedItemId">
				</dd>
			</dl>
			<dl>
				<dt>
					<label for="name">商品名:</label>
				</dt>
				<dd>
					<input type="text" id="name" name="name">
				</dd>
			</dl>
			<dl>
				<dt style="margin-bottom:20px;">
					<label for="price">金額:</label>
				</dt>
				<dd>
					<input type="text" id="price" name="price">
				</dd>
				<dl>
					<dt>
						<label for="is_coffee">コーヒー:</label>
					</dt>
					<dd>
						<input type="checkbox" id="is_coffee" name="is_coffee" value="1">
					</dd>
				</dl>
				<div class="center" style="margin-bottom:10px;">
					<input type="submit" value="更新" class="btn1">
				</div>
		</form>

		<div class="center">
			<form action="ItemListServlet" method="get">
				<input type="submit" value="戻る" class="btn2">
			</form>
		</div>

	</div>
	<script>
    function updateForm(itemId) {
        // 選択された商品IDをhiddenフィールドに設定
        document.getElementById("selectedItemId").value = itemId;

        // 選択された商品の情報を取得し、フォームに設定
        var selectedItem = ${itemList.stream().filter(item -> item.getItemId() == itemId).findFirst().orElse(null)};
        if (selectedItem) {
            document.getElementById("name").value = selectedItem.name;
            document.getElementById("price").value = selectedItem.price;
            document.getElementById("is_coffee").checked = selectedItem.isCoffee == 1;
        }
    }
</script>


</body>
</html>
