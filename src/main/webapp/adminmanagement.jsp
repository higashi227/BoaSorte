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
				<td><%= item.getItemId() %></td>
				<td><%= item.getName() %></td>
				<td><%= item.getPrice() %></td>
				<td><%= item.getIsCoffee() == 1 ? "コーヒー" : "お菓子" %></td>
		
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
	 <input type="hidden" name="add" value="true">
	<input type="submit" value="商品新規登録">
	</form> 
	
	
	
	
	
	<form action="AdminItemEditServlet" method="post">
	 <input type="hidden" name="edit" value="true">
	<input type="submit" value="商品編集・削除">
	</form> 
	

	<div style="width:400px">
  <canvas id="mychart"></canvas>
</div>
<script>



var ctx = document.getElementById('mychart');
var myChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: ['検索エンジンで検索', '知人からの紹介', 'テレビ', 'SNS'],
    datasets: [{
      data: [20, 35, 40, 30],
      backgroundColor: ['#f88', '#484', '#48f','#00ff00'],
      weight: 100,
    }], 
    },
});
</script>

</body>
</html>