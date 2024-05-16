<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.Order"%>
<%@ page import="java.util.Collections"%>
<%@ page import="java.util.Comparator"%>

<%
List<Order> orderHistory = (List<Order>) request.getAttribute("orderHistory");

// 日付での抽出（検索）
String dateStr = request.getParameter("date");
if (dateStr != null && !dateStr.isEmpty()) {
	List<Order> filteredOrders = new ArrayList<>();
	for (Order order : orderHistory) {
		if (order.getCreatedAt().toString().equals(dateStr)) {
	filteredOrders.add(order);
		}
	}
	orderHistory = filteredOrders;
}

// ユーザーごとの検索
String userName = request.getParameter("userName");
if (userName != null && !userName.isEmpty()) {
	List<Order> filteredOrders = new ArrayList<>();
	for (Order order : orderHistory) {
		if (order.getAccountName().equals(userName)) {
	filteredOrders.add(order);
		}
	}
	orderHistory = filteredOrders;

	// 検索結果が空の場合の処理
	if (filteredOrders.isEmpty()) {
%>
<p>該当するユーザーの注文履歴はありません。</p>
<%
}
}

// 注文履歴を注文日時と注文IDの両方を基準にして逆順にソートする
Collections.sort(orderHistory, new Comparator<Order>() {
	public int compare(Order o1, Order o2) {
		int result = o2.getCreatedAt().compareTo(o1.getCreatedAt()); // 注文日時の降順
		if (result == 0) { // 注文日時が同じ場合は注文IDの降順でソート
	result = Integer.compare(o2.getOrderId(), o1.getOrderId());
		}
		return result;
	}
});
%>

<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
	<jsp:param name="pageTitle" value="BoaSorte--注文履歴" />
</jsp:include>
<body>
	<div class="main-container">
		<h2>注文履歴</h2>
		<div class="center">
			<form method="GET">
				<label for="date">日付で抽出:</label> <input type="date" id="date"
					name="date"> <label for="userName">ユーザー名で抽出:</label> <input
					type="text" id="userName" name="userName">
				<button type="submit">検索</button>
			</form>
		</div>
		<p><br></p>
		<div class="btncenter">
			<table border="1">
				<tr>
					<th>注文日時</th>
					<th>注文ID</th>
					<th>ユーザー名</th>
					<th>商品名</th>
					<th>数量</th>
					<th>合計</th>
					<th>送料</th>
					<th>豆の状態</th>
					<th style="display: none;">更新日時</th>
				</tr>
				<%
				if (!orderHistory.isEmpty()) {
					for (Order order : orderHistory) {
				%>
				<tr>
					<td><%=order.getCreatedAt()%></td>
					<td class="center"><%=order.getOrderId()%></td>
					<td><%=order.getAccountName()%></td>
					<td><%=order.getItemName()%></td>
					<td class="right"><%=order.getQuantity()%></td>
					<td class="right"><%=order.getQuantity() * order.getPrice()%></td> <!-- 合計金額の計算 -->
					<td class="right"><%=order.getPostage()%></td>
					<td class="center"><%=order.getCoffeeStatus()%></td>
					<td style="display: none;"><%=order.getUpdatedAt()%></td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="9">該当する注文はありません。</td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
	</div>
</body>
</html>
