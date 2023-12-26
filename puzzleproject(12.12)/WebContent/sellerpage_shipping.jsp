<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="SellerCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>배송관리</title>
<link rel="icon" href="./resources/images/favicon.PNG" type="image/x-icon">
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/seller-productM.css">
</head>
<body>

	<%@include file="top-menu.jsp"%>
	<div style="display: flex;align-items: center;justify-content: center;">
			<div class="item-management-wrapper">
				<div class="title" style="max-width: 100%;">
					<h3>배송관리</h3>
				</div>
				<form method="post" class="item-manage-form">
					<div>
						<table>
							<colgroup>
								<col width="50px">
								<col width="100px">
								<col width="300px">
								<col width="120px">
								<col width="100px">
								<col width="120px">
								<col width="160px">
								<col width="340px">
								<col width="300px">
								<col width="100px">
								<col width="100px">
								<col width="100px">
							</colgroup>
							<thead>
								<tr>
									<th class="product-head">주문번호</th>
									<th class="product-head">상품코드</th>
									<th class="product-head">상품명</th>
									<th class="product-head">상품가격</th>
									<th class="product-head">상품개수</th>
									<th class="product-head">구매자명</th>
									<th class="product-head">구매자ID</th>
									<th class="product-head">배송지</th>
									<th class="product-head">배송메시지</th>
									<th class="product-head">배송상태</th>
									<th class="product-head">배송상태변경</th>
									<th class="product-head"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="products" items="${products }">
									<tr align="center">
										<td><input type="text" name="orderSetNumber" class="no-editing"
											readonly="readonly" value="${ products.orderSetNumber}"></td>
										<td><input type="text" name="productId" class="no-editing"
											readonly="readonly" value="${ products.productId}"></td>
										<td><input type="text" name="productName" class="no-editing"
											readonly="readonly" value="${ products.productName}"></td>
										<td><input type="text" name="productUnitPrice" class="no-editing"
											readonly="readonly" value="${ products.productUnitPrice}"></td>
										<td><input type="text" name="productNumber" class="no-editing"
											readonly="readonly" value="${ products.productNumber}"></td>
										<td><input type="text" name="name" class="no-editing"
											readonly="readonly" value="${ products.name}"></td>
										<td><input type="text" name="id" class="no-editing"
											readonly="readonly" value="${ products.id}"></td>
										<td><input type="text" name="address" class="no-editing"
											readonly="readonly" value="${ products.address}"></td>
										<td><input type="text" name="postmessage" class="no-editing"
											readonly="readonly" value="${ products.postmessage}"></td>
										<td><input type="text" name="status" class="no-editing"
											readonly="readonly" value="${ products.status}"></td>
										<td>
											<select id="shipping" name="shipping" class="no-editing">
								                <option value="배송준비중">배송준비중</option>
								                <option value="배송중">배송중</option>
								                <option value="배송완료">배송완료</option>
								                <option value="배송중지">배송중지</option>
						           			</select>
										</td>
										<td>
											<input class="seller-product-btn" type="submit" value="변경" formaction="shippment.product?paymentNumber=${products.paymentNumber }">
										</td>
									</tr>
								</c:forEach>
									<tr align="center">
											<td><input type="text" name="sum" class="no-editing"
												readonly="readonly" value="결제총액합" style="margin-top: 20px;"></td>
											<td><input type="text" name="sum" class="no-editing"
												readonly="readonly" value="${ sum}" style="margin-top: 20px;"></td>
									</tr>
							</tbody>
						</table>
					</div>
				</form>
			</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>