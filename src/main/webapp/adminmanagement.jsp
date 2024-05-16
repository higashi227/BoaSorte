
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
	<div class="main-container">
		<h2>商品管理</h2>
		<div class="btncenter">
			<table border="1">

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
						<td class="right"><%=item.getItemId()%></td>
						<td><%=item.getName()%></td>
						<td class="right"><%=item.getPrice()%></td>
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
		</div>
		<div class="btnyoko btncenter">
			<form action="AdminItemNewServlet" method="post">
				<input type="hidden" name="add" value="true"> <input
					type="submit" value="商品新規登録" class="btn1">
			</form>
			&nbsp;
			<form action="AdminItemEditServlet" method="post">
				<input type="hidden" name="edit" value="true"> <input
					type="submit" value="商品編集・削除" class="btn1">
			</form>
			&nbsp;
			<form action="AdminUserServlet" method="get">
				<input type="hidden" name="search" value="true"> <input
					type="submit" value="ユーザー検索" class="btn1">
			</form>
			&nbsp;
			<form action="order-history" method="GET">
				<button type="submit" class="btn1">注文履歴</button>
			</form>


		</div>
		<div class="btnyoko">


			<form action="AdminLogoutServlet" method="post">
				<input type="hidden" name="out" value="true"> <input
					type="submit" value="ログアウト" class="btn2">
			</form>


			</form>
		</div>
	</div>
	</div>
	<br>
	<br>
	<h3>【BoaSorteをどのようにして知ったか】</h3>
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
		<%}
}%>
		
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
<br><br>

<h3>【各商品の購入回数】</h3>
	<%--// 商品の購入回数の集計結果を円グラフで表示--%>
	<div style="width: 300px">
		<canvas id="mychart-purchase"></canvas>
	</div>

	<script type="text/javascript">
    var itemIds = [];
    var purchaseCounts = [];
    <%List<Object[]> purchaseCounts = (List<Object[]>) request.getAttribute("purchaseCounts");
if (purchaseCounts != null && !purchaseCounts.isEmpty()) {
	for (Object[] data : purchaseCounts) {
		long itemId = (long) data[0];
		int count = (int) data[1];%>
                itemIds.push("<%=itemId%>");
                purchaseCounts.push(<%=count%>);
    <%}
}%>
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
<br><br>
<h3>【商品ごとの購入地域割合】</h3>
	<%--//商品の購入を地域別に積み重ね棒グラフで表示--%>
	<div style="width: 300px">
		<canvas id="mychart-region"></canvas>
	</div>
<script type="text/javascript">
    var itemData = {};
    var regions = [];
    <%
        List<Object[]> regionCounts = (List<Object[]>) request.getAttribute("regionCounts");
        if (regionCounts != null && !regionCounts.isEmpty()) {
            for (Object[] data : regionCounts) {
                long itemId = (long) data[0];
                String region = (String) data[1];
                int count = (int) data[2];
    %>
              <%--各data配列にitemId,region,countの値をいれる--%>
                if (!itemData["<%= itemId %>"]) {
                    itemData["<%= itemId %>"] = {};
                }
                if (!itemData["<%= itemId %>"]["<%= region.replaceAll("\"", "\\\"") %>"]) {
                    itemData["<%= itemId %>"]["<%= region.replaceAll("\"", "\\\"") %>"] = 0;
                }
                itemData["<%= itemId %>"]["<%= region.replaceAll("\"", "\\\"") %>"] += <%= count %>;
                if (!regions.includes("<%= region.replaceAll("\"", "\\\"") %>")) {
                    regions.push("<%= region.replaceAll("\"", "\\\"") %>");
                }
    <%
            }
        }
    %>

    // 配列の色を生成する関数
    function getRandomColor() {//ランダムな１６進カラーコードを生成
        var letters = '0123456789ABCDEF';
        var color = '#';
        for (var i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }

    var datasets = [];
    var colors = {}; // 地域ごとの色を格納するオブジェクト

    regions.forEach((region) => {
        colors[region] = getRandomColor(); // 地域ごとに色を生成
    });

    regions.forEach((region) => {
        var data = [];
        for (var itemId in itemData) {
            if (itemData[itemId][region]) {
                data.push(itemData[itemId][region]);
            } else {
                data.push(0);
            }
        }
        datasets.push({
            label: region,
            data: data,
            backgroundColor: colors[region],
        });
    });

    var itemIds = Object.keys(itemData);

    var ctx = document.getElementById('mychart-region').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: itemIds.map(itemId => 'Item ' + itemId), // 商品IDをラベルとして設定
            datasets: datasets,
        },
        options: {
            scales: {
                x: {
                    stacked: true,
                },
                y: {
                    stacked: true,
                },
            },
        },
    });
</script>



	<%-- <script type="text/javascript">
        var itemId = [];
        var regions = [];
        var purchaseCount = [];
        
        <%List<Object[]> regionCounts = (List<Object[]>) request.getAttribute("regionCounts");
if (regionCounts != null && !regionCounts.isEmpty()) {
	for (Object[] data : regionCounts) {
		long itemId = (long) data[0];
		String region = (String) data[1];
		int count = (int) data[2];%>
                itemIds.push("<%=itemId%>");
                regions.push("<%=region.replaceAll("\"", "\\\"")%>");
		purchaseCounts.push(
	<%=count%>
		);
	<%}
}%>
		var ctx = document.getElementById('mychart-region').getContext('2d');
		var myChart = new Chart(ctx,
				{
					type : 'pie',
					data : {
						labels : regions,
						datasets : [ {
							label : '地域',
							data : purchaseCounts,
							backgroundColor : [ '#f88', '#8f8', '#88f', '#ff8',
									'#f8f', ],
						} ],
					},
				});
	</script>--%>

</body>
</html>