<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Item"%>
<%@ page import="java.util.Iterator"%>


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





	<form action="AdminItemEditServlet" method="post">
		<input type="hidden" name="edit" value="true"> <input
			type="submit" value="商品編集・削除">
	</form>
	
	<%
    List<Object[]> referralCounts = (List<Object[]>) request.getAttribute("referralCounts");
    if (referralCounts != null && !referralCounts.isEmpty()) {
        for (Object[] data : referralCounts) {
            String recognition = (String) data[0];
            int count = (int) data[1];
%>
            <p>Recognition: <%= recognition %>, Count: <%= count %></p>
<%
        }
    } else {
%>
        <p>No referral counts available.</p>
<%
    }
%>

	<%--// サイトを知ったかの集計結果を円グラフで表示
	<div style="width: 400px">
		<canvas id="mychart-pie"></canvas>
	</div>

	 <script>
		var ctx = document.getElementById('mychart-pie');
		var myChart = new Chart(ctx, {
			type : 'pie',
			data : {
				labels : [ 'Red', 'Green', 'Blue' ],
				datasets : [ {
					data : [ 10, 20, 30 ],
					backgroundColor : [ '#f88', '#484', '#48f' ],
					weight : 100,
				} ],
			},
		});
	</script>
	
	// 商品の購入回数の集計結果を棒グラフで表示
	<div style="width: 400px">
		<canvas id="mychart-bar"></canvas>
	</div>

	<script>
		var ctx = document.getElementById('mychart-bar');
		var myChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ 'Sun', 'Mon', 'Tue' ],
				datasets : [ {
					label : 'Red',
					data : [ 25, 35, 40 ],
					backgroundColor : '#f88',
				}, {
					label : 'Green',
					data : [ 20, 10, 30 ],
					backgroundColor : '#484',
				}, {
					label : 'Blue',
					data : [ 30, 20, 15 ],
					backgroundColor : '#48f',
				} ],
			},
		});
	</script>
	
	//商品の購入を地域別に表示

	<div style="width: 400px">
		<canvas id="mychart"></canvas>
	</div>

	<script>
		var ctx = document.getElementById('mychart');
		var myChart = new Chart(ctx, {
			type : 'line',
			data : {
				labels : [ 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat' ],
				datasets : [ {
					label : 'Red',
					data : [ 20, 35, 40, 30, 45, 35, 40 ],
					borderColor : '#f88',
				}, {
					label : 'Green',
					data : [ 20, 15, 30, 25, 30, 40, 35 ],
					borderColor : '#484',
				}, {
					label : 'Blue',
					data : [ 30, 25, 10, 5, 25, 30, 20 ],
					borderColor : '#48f',
				} ],
			},
			options : {
				y : {
					min : 0,
					max : 60,
				},
			},
		});
	</script>



	<%-- <div style="" "400" height="400">
		<canvas id="referralChart"></canvas>
		<script>
		// サイトを知ったかの集計結果を円グラフで表示
    	var referralCounts = <c:out value="${referralCounts}" />;
    	var referralLabels = [];
    	var referralData = [];
    	for (var i = 0; i < referralCounts.length; i++) {
        	referralLabels.push(referralCounts[i][0]);
        	referralData.push(referralCounts[i][1]);
    	}

    	var referralChartCanvas = document.getElementById('referralChart').getContext('2d');
    	var referralChart = new Chart(referralChartCanvas, {
        	type: 'pie',
        	data: {
            	labels: referralLabels,
            	datasets: [{
                	data: referralData,
                	backgroundColor: [
                    	'rgba(255, 99, 132, 0.5)',
                    	'rgba(54, 162, 235, 0.5)',
                    	'rgba(255, 206, 86, 0.5)',
                    	'rgba(75, 192, 192, 0.5)',
                    	'rgba(153, 102, 255, 0.5)',
                    	'rgba(255, 159, 64, 0.5)'
                	],
                	borderWidth: 1
            	}]
        	},
        	options: {
            	responsive: true
        	}
    	});</script>
    	
	</div>

	<div style="" "400" height="400">
		<canvas id="purchaseChart" width="400" height="400"></canvas>
		<script>
		// 商品の購入回数の集計結果を棒グラフで表示
    	var purchaseCounts = <c:out value="${purchaseCounts}" />;
    	var purchaseLabels = [];
    	var purchaseData = [];
    	for (var i = 0; i < purchaseCounts.length; i++) {
        	purchaseLabels.push(purchaseCounts[i][0]);
        	purchaseData.push(purchaseCounts[i][1]);
    	}

    	var purchaseChartCanvas = document.getElementById('purchaseChart').getContext('2d');
    	var purchaseChart = new Chart(purchaseChartCanvas, {
        	type: 'bar',
        	data: {
            	labels: purchaseLabels,
            	datasets: [{
                	label: '購入回数',
                	data: purchaseData,
                	backgroundColor: 'rgba(54, 162, 235, 0.5)',
                	borderColor: 'rgba(54, 162, 235, 1)',
                	borderWidth: 1
            	}]
        	},
        	options: {
            	responsive: true,
            	scales: {
                	y: {
                    	beginAtZero: true
                	}
            	}
        	}
    	});</script>
		
	</div>

	<div style="" "400" height="400">
		<canvas id="regionChart" width="400" height="400"></canvas>
		
		<script>
    	

    	
 		// サーブレットから受け取った regionCounts を JavaScript 変数に設定
    	var regionCounts = <c:out value="${regionCounts}" />;
    	var labels = [];
    	var data = [];
    	for (var i = 0; i < regionCounts.length; i++) {
        	labels.push(regionCounts[i][1]);  // 地域名
        	data.push(regionCounts[i][2]);    // 購入回数
    		}

    	var ctx = document.getElementById('regionChart').getContext('2d');
    	var myChart = new Chart(ctx, {
        	type: 'bar',
        	data: {
            	labels: labels,
            	datasets: [{
                	label: '購入回数',
                	data: data,
                	backgroundColor: 'rgba(255, 99, 132, 0.5)',
                	borderColor: 'rgba(255, 99, 132, 1)',
                	borderWidth: 1
            	}]
        	},
        	options: {
            	responsive: true,
            	scales: {
                	y: {
                    	beginAtZero: true
                	}
            	}
        	}
    	});
	</script>
	</div>--%>



</body>
</html>