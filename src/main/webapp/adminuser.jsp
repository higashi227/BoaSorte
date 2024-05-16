
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Account"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList, java.util.List"%>


<!DOCTYPE html>



<html lang="ja">

<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte--管理者ページ" />
</jsp:include>

<body>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.2.0/chart.min.js"
		integrity="sha512-VMsZqo0ar06BMtg0tPsdgRADvl0kDHpTbugCBBrL55KmucH6hP9zWdLIWY//OTfMnzz6xWQRxQqsUFefwHuHyg=="
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns@next/dist/chartjs-adapter-date-fns.bundle.min.js"></script>
	<div class="main-container" style="width: 100%;">
		<h2>
			<caption>ユーザー検索</caption>
		</h2>
		<div class="center btnyoko" style="margin-bottom: 10px;">
			<!-- 検索ボタン -->
			<button onclick="toggleSearch()" class="btn2">検索</button>
			<!-- 検索バー -->
			<div id="searchBar" style="display: none;">
				<input type="text" id="searchInput" oninput="searchUsers()"
					placeholder="ユーザーを検索...">
			</div>
		</div>
		<div class="btncenter">
			<table border="1">

				<thead>
					<tr>
						<th scope="auto">ID</th>
						<th scope="auto">メールアドレス</th>
						<%--<th scope="auto">パスワード</th>--%>
						<th scope="auto">氏名</th>
						<th scope="auto">郵便番号</th>
						<th scope="auto">住所</th>
						<th scope="auto">生年月日</th>
						<th scope="auto">電話番号</th>
						<th scope="auto"></th>
					</tr>
				</thead>

				<tbody>
					<%
					List<Account> userList = (List<Account>) request.getAttribute("userList");
					if (userList != null && !userList.isEmpty()) {
						for (Account user : userList) {
					%>
					<tr>
						<td><%=user.getAccountId()%></td>
						<td><%=user.getMailAddress()%></td>
						<%--<td><%=user.getPassword()%></td>--%>
						<td><%=user.getName()%></td>
						<td><%=user.getPostnum()%></td>
						<td><%=user.getAddress()%></td>
						<td><%=user.getBirthday()%></td>
						<td><%=user.getTelephone()%></td>
						<td>
							<form action="UserDeleteServlet" method="post">
								<input type="hidden" name="id" value="${user.getAccountId}">
								<input type="submit" value="削除" class="btn1">
							</form>
						</td>

					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="12">該当するユーザーが見つかりませんでした。</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>


		<div class="center" style="margin-top: 10px;">
			<form action="ItemListServlet" method="get">
				<input type="submit" value="戻る" class="btn2">
			</form>
		</div>
	</div>

	<script>
		function toggleSearch() {
			var searchBar = document.getElementById("searchBar");
			searchBar.style.display = searchBar.style.display === "none" ? "block"
					: "none";
		}

		function searchUsers() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("searchInput");
			filter = input.value.toUpperCase();
			table = document.getElementsByTagName("table")[0];
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[2]; // Index 3 corresponds to the name column
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
	</script>


</body>
</html>