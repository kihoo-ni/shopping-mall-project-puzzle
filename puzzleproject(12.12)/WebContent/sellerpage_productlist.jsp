<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="SellerCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>상품관리</title>
<link rel="icon" href="./resources/images/favicon.PNG" type="image/x-icon">
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/seller-productM.css">
</head>
<body>

	<%@include file="top-menu.jsp"%>
	<div style="display: flex;align-items: center;justify-content: center;">
			<div class="item-management-wrapper">
				<div class="title" style="max-width: 100%;">
					<h3>상품관리</h3>
				</div>
				<form method="post" class="item-manage-form">
					<%-- <div>
						<ul style="display: flex;">
							<li style="width: 6%;" class="product-head">상품코드</li>
							<li style="width: 11%;" class="product-head">상품명</li>
							<li style="width: 10%;" class="product-head">상품가격</li>
							<li style="width: 13.5%;" class="product-head">상품설명</li>
							<li style="width: 13.5%;" class="product-head">브랜드</li>
							<li style="width: 10%;" class="product-head">카테고리<br/>[대분류]</li>
							<li style="width: 10%;" class="product-head">카테고리<br/>[소분류]</li>
							<li style="width: 14%;" class="product-head">재고</li>
						</ul>
						<c:forEach var="Productlist" items="${Productlist }">
						<ul style="display: flex;">
							<li style="width: 6%;"><input type="text" name="productId" class="input-w100"
								readonly="readonly" value="${ Productlist.productId}"></li>
							<li style="width: 11%;"><input type="text" name="productName" class="input-w100"
								value="${ Productlist.productName}"></li>
							<li style="width: 10%;"><input type="text" name="productUnitPrice" class="input-w100"
								value="${ Productlist.productUnitPrice}"></li>
							<li style="width: 13.5%;"><input type="text" name="productDescription"
								class="input-w100" value="${ Productlist.productDescription}"></li>
							<li style="width: 13.5%;"><input type="text" name="productBrand" class="input-w100"
								value="${ Productlist.productBrand}"></li>
							<li style="width: 10%;"><input type="text" name="productCategory1" class="input-w100"
								readonly="readonly" value="${ Productlist.productCategory1}"></li>
							<li style="width: 10%;"><input type="text" name="productCategory2" class="input-w100"
								readonly="readonly" value="${ Productlist.productCategory2}"></li>
							<li style="width: 14%;"><input type="number" name="productInStock" class="input-w100"
								value="${ Productlist.productInStock}"></li>
							<li><input class="seller-product-btn" type="submit" value="변경"
								formaction="editProduct.search"></li>
							<li><input class="seller-product-btn" type="submit" value="삭제"
								formaction="deleteProduct.search"></li>
						</ul>
						</c:forEach>
					</div> --%>
					<div>
						<table>
							<colgroup>
								<col width="120px">
								<col width="120px">
								<col width="120px">
								<col width="120px">
								<col width="120px">
								<col width="120px">
								<col width="120px">
								<col width="120px">
							</colgroup>
							<thead>
								<tr>
									<th class="product-head">상품코드</th>
									<th class="product-head">상품명</th>
									<th class="product-head">상품가격</th>
									<th class="product-head">상품설명</th>
									<th class="product-head">브랜드</th>
									<th class="product-head">카테고리<br/>[대분류]</th>
									<th class="product-head">카테고리<br/>[소분류]</th>
									<th class="product-head">재고</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="Productlist" items="${Productlist }">
									<tr align="center">
										<td><input type="text" name="productId" class="no-editing"
											readonly="readonly" value="${ Productlist.productId}"></td>
										<td><input type="text" name="productName" class="edit"
											value="${ Productlist.productName}" style="width: 300px;"></td>
										<td><input type="text" name="productUnitPrice" class="edit"
											value="${ Productlist.productUnitPrice}"></td>
										<td><input type="text" name="productDescription" style="width: 300px;"
											class="#" value="${ Productlist.productDescription}"></td>
										<td><input type="text" name="productBrand" class="edit" style="width: 200px;"
											value="${ Productlist.productBrand}"></td>
										<td><input type="text" name="productCategory1" class="no-editing"
											readonly="readonly" value="${ Productlist.productCategory1}"></td>
										<td><input type="text" name="productCategory2" class="no-editing"
											readonly="readonly" value="${ Productlist.productCategory2}"></td>
										<td><input type="number" name="productInStock" class="edit"
											value="${ Productlist.productInStock}"></td>
										<td><input class="seller-product-btn" type="submit" value="변경"
											formaction="editProduct.search"></td>
										<td><input class="seller-product-btn" type="submit" value="삭제"
											formaction="deleteProduct.search"></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>


					<div align="right" style="margin-top: 15px; max-width: 1178px;">
						<table>
							<tbody>
								<tr>
									<td style="width: 280px;"><select name="items" class="txt">
											<option value="productId">상품코드</option>
											<option value="productName">상품명</option>
											<option value="productBrand">브랜드</option>
									</select> <input style="width: 120px;" name="text" type="text"> <input type="submit"
										style="width: 50px;" class="seller-product-btn" value="검색" formaction="listProduct.search">
									</td>
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