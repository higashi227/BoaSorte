<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Include the necessary JSP files -->
<div class="main-content">
    <h2>All Items</h2>
    <div class="item-tiles">
        <!-- Iterate through each item and display as a tile -->
        <c:forEach var="item" items="${items}">
            <div class="item-tile">
            	<img src="${item.imagePath}" alt="${item.name}" />

                <div class="item-details">
                    <h2>${item.name}</h2>
                    <p>Price: ${item.price}</p>
                    <p>${item.isCoffee() ? 'Coffee Item' : 'Non-coffee Item'}</p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
