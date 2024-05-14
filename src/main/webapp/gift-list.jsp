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
    <div class="main-container">
        <h2>ギフト一覧</h2>
        <div class="btncenter">
	        <table>
				<thead>
		            <tr>
		                <th style="display: none;">ギフトID</th>
		                <th>名前</th>
		                <th>郵便番号</th>
		                <th>住所</th>
		                <th>操作</th>
		            </tr>
				</thead>
				<tbody>
		            <c:forEach var="gift" items="${gifts}">
		                <tr>
		                    <td style="display: none;">${gift.giftId}</td>
		                    <td>${gift.gname}</td>
		                    <td>${gift.gpostnum}</td>
		                    <td>${gift.gaddress}</td>
		                    <td>
		                    	<div class="btnyoko">
		                        <form id="editForm${gift.giftId}" method="GET" onsubmit="return false;">
		                            <input type="hidden" name="giftId" value="${gift.giftId}" />
		                            <button type="button" class="btn2" onclick="showEditForm(${gift.giftId},'${gift.gname}','${gift.gpostnum}','${gift.gaddress}')">編集</button>
		                        </form>
		                        <form action="delete-gift" method="POST" onsubmit="return confirm('このギフトを削除しますか？');">
		                            <input type="hidden" name="giftId" value="${gift.giftId}" />
		                            <button type="submit" class="btn1">削除</button>
		                        </form>
		                        </div>
		                    </td>
		                </tr>
		            </c:forEach>
				</tbody>
	        </table>
        </div>
	        <div class="btncenter">
		        <form action="gift-register.jsp">
		            <button type="submit" class="btn1">ギフト登録</button>
		        </form>
		        &nbsp;
		        <button class="btn2" onclick="window.location.href='./my-page';">戻る</button>
	        </div>
        </div>
    </main>

    <!-- 編集フォーム -->
    <div id="editFormContainer" style="display: none;">
    	<div class="main-container">
			<h2>ギフト編集</h2>
	        <form id="editGiftForm" method="POST" action="edit-gift">
	            <input type="hidden" id="editGiftId" name="giftId" value="" />
	            <dl>
		            <dt><label for="editGiftName">名前</label></dt>
		            <dd><input type="text" id="editGiftName" name="gname" required></dd>
	            </dl>
	            
	            <dl>
		            <dt><label for="editGiftPostnum">郵便番号</label></dt>
		            <dd><input type="text" id="editGiftPostnum" name="gpostnum" required></dd>
	            </dl>
	            
	            <dl>
		            <dt><label for="editGiftAddress">住所</label></dt>
		            <dd><input type="text" id="editGiftAddress" name="gaddress" class="inpw" required></dd>
	            </dl>
	            
	            <dic class="btncenter">
	            <button type="submit" class="btn1">更新</button>
	            &nbsp;
	            <button type="button" onclick="hideEditForm()" class="btn2">キャンセル</button>
	            </div>
	        </form>
        </div>
    </div>

    <!-- JavaScript -->
    <script>
        function showEditForm(giftId, gname, gpostnum, gaddress) {
            // 編集フォームを表示する
            var editForm = document.getElementById("editForm" + giftId);
            var editGiftId = document.getElementById("editGiftId");
            var editGiftName = document.getElementById("editGiftName");
            var editGiftPostnum = document.getElementById("editGiftPostnum");
            var editGiftAddress = document.getElementById("editGiftAddress");

            editGiftId.value = giftId;
            editGiftName.value = gname;
            editGiftPostnum.value = gpostnum;
            editGiftAddress.value = gaddress;

            document.getElementById("editFormContainer").style.display = "block";
        }

        function hideEditForm() {
            // 編集フォームを非表示にする
            document.getElementById("editFormContainer").style.display = "none";
        }
    </script>
</body>
</html>
	