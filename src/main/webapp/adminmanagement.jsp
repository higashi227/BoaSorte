
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Item"%>
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
	<table border="1">
		<caption>【商品管理】</caption>
		<thead>
			<tr>
				<th scope="auto">品番</th>
				<th scope="auto">商品名</th>
				<th scope="auto">金額</th>
				<th scope="auto">商品内容</th>
			</tr>
		</thead>
		<tbody>
			<%
			List<Item> itemList = (List<Item>) request.getAttribute("itemList");
			if (itemList != null && !itemList.isEmpty()) {
				for (Item item : itemList) {
			%>
			<tr>
				<td><%=item.getItemId()%></td>
				<td><%=item.getName()%></td>
				<td><%=item.getPrice()%></td>
				<td><%=item.getIsCoffee() == 1 ? "コーヒー" : "お菓子"%></td>

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

	<form action="AdminItemNewServlet" method="post">
		<input type="hidden" name="add" value="true"> <input
			type="submit" value="商品新規登録">
	</form>

<p>

	<form action="AdminItemEditServlet" method="post">
		<input type="hidden" name="edit" value="true"> <input
			type="submit" value="商品編集・削除">
	</form>
	
	<p>
	
	<form action="AdminLogoutServlet" method="post">
		<input type="hidden" name="edit" value="true"> <input
			type="submit" value="ログアウト">
	</form>


	<%--サイトを知ったかの集計結果を円グラフで表示--%>
	<div style="width: 300px">
		<canvas id="mychart-referral"></canvas>
	</div>

	<script type="text/javascript">
		var recognition = [];
		var count = [];
		
		<%List<Object[]> referralCounts = (List<Object[]>) request.getAttribute("referralCounts");
			if (referralCounts != null && !referralCounts.isEmpty()) {
			for (Object[] data : referralCounts) {
			String recognition = (String) data[0];
			int count = (int) data[1];%>
			
            recognition.push("<%=recognition.replaceAll("\"", "\\\"")%>");
			count.push(<%=count%>);
		<%}}%>
		
		var ctx = document.getElementById('mychart-referral').getContext('2d');
		var myChart = new Chart(ctx, {
			type : 'pie',
			data : {
				labels : recognition,
				datasets : [ {
					data : count,
					backgroundColor :  ['#f88','#8f8','#88f','#ff8','#f8f',],
					weight : 100,
				} ],
			},
		});
	</script>

	<%--// 商品の購入回数の集計結果を円グラフで表示--%>
	<div style="width: 300px">
		<canvas id="mychart-purchase"></canvas>
	</div>

	<script type="text/javascript">
    var itemIds = [];
    var purchaseCounts = [];
    <%
        List<Object[]> purchaseCounts = (List<Object[]>) request.getAttribute("purchaseCounts");
        if (purchaseCounts != null && !purchaseCounts.isEmpty()) {
            for (Object[] data : purchaseCounts) {
                long itemId = (long) data[0];
                int count = (int) data[1];
    %>
                itemIds.push("<%= itemId %>");
                purchaseCounts.push(<%= count %>);
    <%
            }
        }
    %>
		var ctx = document.getElementById('mychart-purchase').getContext('2d');
		var myChart = new Chart(ctx, {
			type : 'pie',
			data : {
				labels : itemIds,
				datasets : [ {
					label : '個数',
					data : purchaseCounts,
					backgroundColor : ['#f88','#8f8','#88f','#ff8','#f8f',],
				} ],
			},
		});
		
	</script>
	
	<%--//商品の購入を地域別に円グラフで表示--%>

	<div style="width: 300px">
		<canvas id="mychart-region"></canvas>
	</div>

	
    <script type="text/javascript">
        var itemId = [];
        var regions = [];
        var purchaseCount = [];
        
        <%
        List<Object[]> regionCounts = (List<Object[]>) request.getAttribute("regionCounts");
        if (regionCounts != null && !regionCounts.isEmpty()) {
            for (Object[] data : regionCounts) {
                long itemId = (long) data[0];
                String region = (String) data[1];
                int count = (int) data[2];
    %>
                itemIds.push("<%= itemId %>");
                regions.push("<%= region.replaceAll("\"", "\\\"") %>");
                purchaseCounts.push(<%= count %>);
    <%
            }
        }
    %>


	var ctx = document.getElementById('mychart-region').getContext('2d');
	var myChart = new Chart(ctx, {
		type : 'pie',
		data : {
			labels : regions,
			datasets : [ {
				label : '地域',
				data : purchaseCounts,
				backgroundColor : ['#f88','#8f8','#88f','#ff8','#f8f',],
			} ],
		},
	});
    </script>
   
</body>
</html>