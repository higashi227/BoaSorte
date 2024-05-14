<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Include the necessary JSP files -->
<div class="main-content main-container">
	<div class="all-items-top">
    	<h2>All Items</h2>
    	<form action="MinServlet">
			<input type="submit" class="btn1" value="購入はこちらから" />
		</form>
	</div>
	
    <div class="item-tiles">
        <c:forEach var="item" items="${items}">
            <div class="item-tile">
            	<img src="${item.imagePath}" alt="${item.name}" />

                <div class="item-details">
                    <h3>${item.name}</h3>
                    <p>Price: ${item.price}円(税別)</p>
                    <p>${item.isCoffee() ? 'Coffee' : 'Foods'}</p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
