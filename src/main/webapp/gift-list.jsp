<%@ page import="java.util.List"%>
<%@ page import="model.Gift"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
    <jsp:param name="pageTitle" value="BoaSorte--ギフト一覧" />
</jsp:include>
<body>
    <jsp:include page="header.jsp" />
    <main>
        <h2>ギフト一覧</h2>
        <table border="1">
            <tr>
                <th>名前</th>
                <th>郵便番号</th>
                <th>住所</th>
                <th> </th>
            </tr>
            <c:forEach var="gift" items="${gifts}">
                <tr>
                    <td>${gift.gname}</td>
                    <td>${gift.gpostnum}</td>
                    <td>${gift.gaddress}</td>
                    <td>
                        <form id="editForm${gift.giftId}" method="GET" onsubmit="return false;">
                            <input type="hidden" name="giftId" value="${gift.giftId}" />
                            <button type="button" onclick="showEditForm(${gift.giftId})">編集</button>
                        </form>
                        <form action="delete-gift" method="POST" onsubmit="return confirm('このギフトを削除しますか？');">
                            <input type="hidden" name="giftId" value="${gift.giftId}" />
                            <button type="submit">削除</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>     
        <form action="gift-register.jsp">
            <button type="submit">ギフト登録</button>
        </form>
    </main>

    <!-- 編集フォーム -->
    <div id="editFormContainer" style="display: none;">
        <h2>ギフト編集</h2>
        <form id="editGiftForm" method="POST" action="edit-gift">
            <input type="hidden" id="editGiftId" name="giftId" value="" />
            <label for="editGiftName">名前:</label>
            <input type="text" id="editGiftName" name="gname" required><br><br>
            <label for="editGiftPostnum">郵便番号:</label>
            <input type="text" id="editGiftPostnum" name="gpostnum" required><br><br>
            <label for="editGiftAddress">住所:</label>
            <input type="text" id="editGiftAddress" name="gaddress" required><br><br>
            <button type="submit">更新</button>
            <button type="button" onclick="hideEditForm()">キャンセル</button>
        </form>
    </div>

    <!-- JavaScript -->
    <script>
        function showEditForm(giftId) {
            // 編集フォームを表示する
            var editForm = document.getElementById("editForm" + giftId);
            var editGiftId = document.getElementById("editGiftId");
            var editGiftName = document.getElementById("editGiftName");
            var editGiftPostnum = document.getElementById("editGiftPostnum");
            var editGiftAddress = document.getElementById("editGiftAddress");

            editGiftId.value = giftId;
            editGiftName.value = ""; // 編集前の値を設定する必要があればここで設定
            editGiftPostnum.value = ""; // 編集前の値を設定する必要があればここで設定
            editGiftAddress.value = ""; // 編集前の値を設定する必要があればここで設定

            document.getElementById("editFormContainer").style.display = "block";
        }

        function hideEditForm() {
            // 編集フォームを非表示にする
            document.getElementById("editFormContainer").style.display = "none";
        }
    </script>
</body>
</html>
