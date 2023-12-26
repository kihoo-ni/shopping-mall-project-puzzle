<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="./resources/images/favicon.PNG" type="image/x-icon">
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/main-items.css">
<meta charset="UTF-8">
<title>홈화면</title>

</head>
<body>
	<%@include file="top-menu.jsp" %>
   	<div>
		<div style="display: flex;">
			<div class="left-menu-bar-wrapper">
				<%@include file="left-menu.jsp" %>
			</div>
			<div class="main-image-wrapper">
				<div class="container">
				<div class="container-subject">
				</div>
				<ul class="items-wrapper">
				    <c:forEach var="product" items="${productlist}">
				       <li class="items" style="padding-left: 30px; padding-right: 30px;">
				           <div>
				               <div class="item-box">
				                   <a href="./view.search?productId=${product.productId}"><img src="resources/images/${product.productImage}" alt="item" /></a>
				               </div>
				               <p class="brand">${product.productBrand}   
				                   <c:if test="${product.productInStock eq 0}">
				                       <span style="color: red;"> (품절)</span>
				                   </c:if>
				               </p>
				               <p class="item-name"><a href="./view.search?productId=${product.productId}">${product.productName}</a></p>
				               <p class="item-price"><fmt:formatNumber value="${product.productUnitPrice}" pattern="#,###"/>원</p>
				           </div>
				       </li>
				   </c:forEach>
				  </ul>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>











