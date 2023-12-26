<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근본 상품</title>
<link rel="icon" href="./resources/images/favicon.PNG" type="image/x-icon">
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/viewed_goods.css">
</head>
<body>
<div>
   	 <%@include file="top-menu.jsp" %>
   	<div>
		<div style="display: flex;">
			<div class="left-menu-bar-wrapper">
				<%@include file="left-menu.jsp" %>
			</div>
			<div style="min-width: 82%;">
				<!-- 최근 본 상품 정렬 창크기 맞춰서 알아서 정렬됨 -->
				<div class="viewed-goods-wrapper">
					<div class="title">
						<h3>최근 본 상품</h3>
					</div>
					<ul class="viewed-goods-ul">
						<li><p>${warning }</p></li>
						<c:forEach var="products" items="${products }">
						<li class="viewed-goods-li">
							<a href="./view.search?productId=${products.productId }" class="img-block">
								<img src="resources/images/${products.productImage }" alt="item" >
							</a>
							<a href="#" class="brand">${products.productBrand }</a>
							<a href="#" class="name">${products.productName }</a>
							<div class="price">
								<em class="sale"><fmt:formatNumber value="${products.productUnitPrice }" pattern="#,###"/>원</em>
							</div>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp" %>
   	 
</div>
</body>
</html>