<%@ page import="java.util.List"%>
<%@ page import="model.Gift"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
    <jsp:param name="pageTitle" value="BoaSorte--購入手続き" />
</jsp:include>
<body>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        // 今日の日付から2日後の日付を取得
        var today = new Date();
        today.setDate(today.getDate() + 2);
        
        // YYYY-MM-DD の形式にフォーマット
        var year = today.getFullYear();
        var month = ("0" + (today.getMonth() + 1)).slice(-2);
        var day = ("0" + today.getDate()).slice(-2);
        var minDate = year + "-" + month + "-" + day;

        // 配送日入力フィールドに最小日付を設定
        document.getElementById("deliveryDate").setAttribute("min", minDate);
    });

    document.addEventListener("DOMContentLoaded", function() {
        var deliveryAddressRadios = document.querySelectorAll('input[name="deliveryAddress"]');
        deliveryAddressRadios.forEach(radio => {
            radio.addEventListener('change', function() {
                updateHiddenFields(this.value);
            });
        });
    });
    function updateHiddenFields(selectedValue) {
        var fullName, fullPostnum, fullAddress;
        if (selectedValue.startsWith("gift_")) {
            var index = selectedValue.split("_")[1];
            var nameElement = document.getElementById("gift_" + index + "_name");
            var postnumElement = document.getElementById("gift_" + index + "_postnum");
            var addressElement = document.getElementById("gift_" + index + "_address");

            fullName = nameElement ? nameElement.value : '';
            fullPostnum = postnumElement ? postnumElement.value : '';
            fullAddress = addressElement ? addressElement.value : '';
        } else if (selectedValue === "account") {
            fullName = document.getElementById("accountName") ? document.getElementById("accountName").value : '';
            fullPostnum = document.getElementById("accountPostnum") ? document.getElementById("accountPostnum").value : '';
            fullAddress = document.getElementById("accountAddress") ? document.getElementById("accountAddress").value : '';
        } else {
            fullName = '';
            fullPostnum = '';
            fullAddress = '';
        }

        var selectedAddressInput = document.getElementById("selectedAddress");
        if(selectedAddressInput) {
            selectedAddressInput.value = fullName + " (" + fullPostnum + ", " + fullAddress + ")";
        }
    }
</script>
	<jsp:include page="header.jsp" />
	<main>
		<div class="main-container">
			<h2>購入手続き</h2>
			<div class="btncenter">
		        <table>
		            <thead>
		                <tr>
		                    
		                    <th scope="auto">商品名</th>
		                    <th scope="auto">価格</th>
		                    <th scope="auto">数量</th>
		                    <th scope="auto">小計</th>
		                    <th scope="auto">豆の状態</th>
		                </tr>
		            </thead>
		            <tbody>
		                <c:forEach var="cartItem" items="${cartItems}" varStatus="status">
		                    <tr>
		                        
		                        <td>${cartItem.name}</td>
		                        <td class="right">${cartItem.price}</td>
		                        <td class="right">${cartItem.quantity}</td>
		                        <td class="right">${cartItem.price * cartItem.quantity}</td>
		                        <td class="center">
		                        	 <c:choose>
		                                <c:when test="${cartItem.isCoffee == 1}">
		                                    <input type="hidden" name="item_${status.index}_itemId" value="${cartItem.itemId}">
		                                    <input type="hidden" name="item_${status.index}_quantity" value="${cartItem.quantity}">
		                                    <input type="hidden" name="item_${status.index}_price" value="${cartItem.price}">
		                                    <input type="hidden" name="item_${status.index}_isCoffee" value="${cartItem.isCoffee}">
		                                    <input type="hidden" name="item_${status.index}_coffeeStatus" value="${cartItem.coffeeStatus}">
		                                    ${cartItem.coffeeStatus}
		                                </c:when>
		                                <c:otherwise>
		                                    <input type="hidden" name="item_${status.index}_itemId" value="${cartItem.itemId}">
		                                    <input type="hidden" name="item_${status.index}_quantity" value="${cartItem.quantity}">
		                                    <input type="hidden" name="item_${status.index}_price" value="${cartItem.price}">
		                                    <input type="hidden" name="item_${status.index}_isCoffee" value="${cartItem.isCoffee}">
		                                    <input type="hidden" name="item_${status.index}_coffeeStatus" value="お菓子">
		                                    <span> -- </span>
		                                </c:otherwise>
		                            </c:choose>
		                        </td>
		                    </tr>
		                </c:forEach>
		                <c:set var="taxDecimal" value="${totalPrice * 0.1}" />
						<c:set var="tax" value="${fn:substringBefore(taxDecimal, '.')}" />
						<tr>
		                	<td colspan="4" class="right"><strong>税(10%)</strong></td>
		                	<td class="right"><strong>${tax}</strong></td>
		            	</tr>
		                 <tr>
		                    <td colspan="4" class="right"><strong>送料</strong></td>
		                    <td colspan="2" class="right"><strong>${shippingFee}</strong></td>
		                </tr>
		                <tr>
		                    <td colspan="4" class="right"><strong>合計金額</strong></td>
		                    <td colspan="2" class="right"><strong>${totalPrice + tax}</strong></td>
		                </tr>
		                <c:if test="${remainingForFreeShipping > 0}">
		                    <tr>
		                        <td colspan="4" class="right"><strong>送料無料まで残り</strong></td>
		                        <td colspan="2" class="right"><strong>${remainingForFreeShipping}</strong></td>
		                    </tr>
		                </c:if>
		            </tbody>
		        </table>
	        </div>
	            <!-- アカウントおよびギフトの配送先情報を表示 -->
	        <h3>配送先情報</h3>
	        <div class="btncenter">
		        <form action="PurchaseConfirmationServlet" method="post">
		            <fieldset>
		                <legend>配送先を選択</legend>
		                <label>
		                    <input type="radio" name="deliveryAddress" value="account">
		                    ${account.name} (${account.postnum}, ${account.address})
		                </label><br>
		          		<c:forEach var="gift" items="${gifts}" varStatus="status">
		    				<label>
		        				<input type="radio" name="deliveryAddress" value="gift_${status.index}">
		        				${gift.gname} (${gift.gpostnum}, ${gift.gaddress})
		        				<input type="hidden" id="gift_${status.index}_name" value="${gift.gname}">
		        				<input type="hidden" id="gift_${status.index}_postnum" value="${gift.gpostnum}">
		        				<input type="hidden" id="gift_${status.index}_address" value="${gift.gaddress}">
		    				</label><br>
						</c:forEach>
		            </fieldset>
		            
		
		            <!-- カート情報を再送信 -->
		            <c:forEach var="cartItem" items="${cartItems}" varStatus="status">
		                <input type="hidden" name="item_${status.index}_itemId" value="${cartItem.itemId}">
		                <input type="hidden" name="item_${status.index}_name" value="${cartItem.name}">
		                <input type="hidden" name="item_${status.index}_quantity" value="${cartItem.quantity}">
		                <input type="hidden" name="item_${status.index}_price" value="${cartItem.price}">
		                <input type="hidden" name="item_${status.index}_isCoffee" value="${cartItem.isCoffee}">
		                <c:choose>
		                    <c:when test="${cartItem.isCoffee == 1}">
		                        <input type="hidden" name="item_${status.index}_coffeeStatus" value="${cartItem.coffeeStatus}">
		                    </c:when>
		                    <c:otherwise>
		                        <input type="hidden" name="item_${status.index}_coffeeStatus" value="お菓子">
		                    </c:otherwise>
		                </c:choose>
		            </c:forEach>
		            
		            <input type="hidden" name="shippingFee" value="${shippingFee}">
		            <input type="hidden" name="tax" value="${tax}">
		            <input type="hidden" name="totalAmount" value="${totalPrice +shippingFee}">
		
		            <!-- 支払い方法選択 -->
		            <h3>支払い方法</h3>
		            <div class="center-block">
						<label><input type="radio" name="paymentMethod" value="クレジットカード" required> クレジットカード</label><br>
						<label><input type="radio" name="paymentMethod" value="代引き"> 代引き</label><br>
						<label><input type="radio" name="paymentMethod" value="銀行振込"> 銀行振込</label><br>
					</div>
	
		
					<!-- 配送先アカウント情報の隠しフィールド -->
					<input type="hidden" id="selectedAddress" name="selectedAddress"  value="${selectedAddress}">
					<input type="hidden" id="accountName" value="${account.name}">
					<input type="hidden" id="accountPostnum" value="${account.postnum}">
					<input type="hidden" id="accountAddress" value="${account.address}">
		
		            <!-- 配送日時選択 -->
		            <h3><label for="deliveryDate">配送日</label></h3>
		            <div class="center">
		            	<input type="date" name="deliveryDate" id="deliveryDate" required><p>&nbsp;</p>
		            <h3><label for="deliveryTime">配送時間帯</label></h3>
					<select name="deliveryTime" id="deliveryTime" required>
    					<option value="9-12">9時から12時</option>
    					<option value="14-16">14時から16時</option>
    					<option value="16-19">16時から19時</option>
    					<option value="19-21">19時から21時</option>
					</select>
		            </div><p>&nbsp;</p>
		            
		            <div class="btncenter btnyoko">
						<input type="submit" value="購入内容確認" class="btn1">&nbsp;
						<button class="btn2" onclick="window.location.href='./CartServlet';">カートページに戻る</button>
					</div>
					
		        </form>
			</div>
    </main>
</body>
</html>