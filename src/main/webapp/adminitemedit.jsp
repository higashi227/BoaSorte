<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                <th scope="auto">削除</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${itemList}">
                <tr>
                    <td>${item.itemId}</td>
                    <td>${item.name}</td>
                    <td>${item.price}</td>
                    <td>${item.isCoffee == 1 ? "コーヒー" : "お菓子"}</td>
                    <td>
                        <form action="AdminItemDeleteServlet" method="post">
                            <input type="hidden" name="id" value="${item.itemId}">
                            <input type="submit" value="削除">
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

<h3>商品編集</h3>

<form action="AdminItemUpdateServlet" method="post">
    <label>商品IDを選択：</label>
    <select name="id" onchange="updateForm(this.value)">
        <c:forEach var="item" items="${itemList}">
            <option value="${item.itemId}">${item.itemId}</option>
        </c:forEach>
    </select><br>

    <!-- 選択された商品の情報を保持するhiddenフィールド -->
    <input type="hidden" id="selectedItemId" name="selectedItemId">

    <label for="name">商品名:</label>
    <input type="text" id="name" name="name"><br>

    <label for="price">金額:</label>
    <input type="text" id="price" name="price"><br>

    <label for="is_coffee">コーヒー:</label>
    <input type="checkbox" id="is_coffee" name="is_coffee" value="1"><br>

    <input type="submit" value="更新">
</form>

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


    
    <form action="ItemListServlet" method="get">
        <input type="submit" value="戻る">
    </form>
</body>
</html>
