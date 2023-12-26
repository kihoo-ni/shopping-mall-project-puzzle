<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="LoginCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문페이지</title>
<link rel="icon" href="./resources/images/favicon.PNG" type="image/x-icon">
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/order.css">
<link rel="stylesheet" href="resources/css/cart.css">
</head>
<body>
	<%@include file="top-menu.jsp"%>
	<div>
		<div style="display: flex;">
			<div class="left-menu-bar-wrapper">
				<%@include file="left-menu.jsp"%>
			</div>
			<div class="cart-wrapper" id="page-cart" style="width: 100%;">
				<div class="cart-top">
					<h2 class="title-page">Order / Payment</h2>
					<!--cart process-->
				</div>
				<!-- end cart process-->
				<form method="post">
				<script defer src="./resources/js/addressapi.js"></script>
				<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<input type="hidden" name="productId" value="${product.productId }"/>
				<input type="hidden" name="productName" value="${product.productName }"/>
				<input type="hidden" name="productUnitPrice" value="${product.productUnitPrice }"/>
				<input type="hidden"  value="${product.productNumber }" name="productNumber"/>
				<input type="hidden"  value="${product.productImage }" name="productImage"/>
				<div class="section order_product_info">
					<h3 class="order__title">상품 정보</h3>
					<input type="hidden" id="discount_applied_yn" value=""> <input
						type="hidden" id="event_min_pay_amt" value="10000">
					<!--cart products-->
					<table class="table_basic order_cart_table">
						<colgroup>
							<col>
							<col width="50px">
							<col width="100px" class="charge ">
							<col width="100px" class="charge ">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">상품 정보</th>
								<th scope="col">수량</th>
								<th scope="col">배송비</th>
								<th scope="col">주문금액</th>
							</tr>
						</thead>
						<tbody>
							<!-- 반품여부 N : 반품불가 상품 -->
							<tr>
								<td class="td_product">
									<div class="connect_img">
										<img src="./resources/images/${product.productImage }" alt="사진" style="width: inherit;">
									</div>
									<div class="article_info connect_info" style="margin-top:30px;">
										<div class="box_product">
											<span class="list_info">
											<a href="./view.search?productId=${product.productId }">${product.productName }</a>
											</span>
										</div>
									</div>
								</td>
								<td><strong>${product.productNumber }</strong></td>
								<td rowspan="1"><span class="box_normal-dlv-amt"
									data-policy-no="1272"> 무료 </span> 
								</td>
								<td class="price"><strong><fmt:formatNumber pattern="#,###" value="${product.productUnitPrice*product.productNumber }" />원</strong></td>
							</tr>
						</tbody>
					</table>

					<div class="cell_order_form">
						<div>
							<ul class="list_section_type">
								<li>· 구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상계좌 재주문이
									불가합니다.</li>
								<li>· PUZZLE 스토어는 기본적으로 대한민국 내 제주도 및 도서 산간 지역 제외 <span>전
										지역, 전 상품 무료배송</span>입니다.
								</li>
								<li>· 해외 배송 상품이나 일부 업체의 경우, 교환/환불 시 반송료가 다를 수 있으며 상품 페이지에
									별도 표기되어 있습니다.</li>
								<li>· 2개 이상의 브랜드(업체) 상품을 주문하신 경우, 각 개별 배송됩니다.</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="section order__delivery">
					<!-- 주문자 정보 -->
					<div class="order__delivery__inner">
						<h3 class="order__title">주문자 정보</h3>
						<ul class="order__list">
							<li class="order__item order__item--name"><span
								class="order__item__label">이름</span>
								<div class="order__item__area">
									<input type="text" class="order__input" id="name" name="name"
										value="" placeholder="수령인"
										maxlength="20">
								</div>
							</li>
							<li class="order__item order__item--mobile"><span
								class="order__item__label">휴대전화</span>
								<div class="order__item__area">
									<input type="text" id="tel" name="phone" class="order__input" placeholder="휴대폰번호(-제외)">
								</div>
							</li>
						</ul>
					</div>
					<!-- // 주문자 정보 -->

					<!-- 배송지 정보 -->
					<div class="order__delivery__inner">
						<h3 class="order__title">배송 정보</h3>
						<ul class="order__list">
							<li class="order__item delivery__item__info" style="height:160px;">
								<span class="order__item__label">주소</span>
								<div class="order__item__area" id="delivery-addr" style="flex-direction: column;">
									<div class="search" style="margin-bottom: 10px;">
										<input name="address1" id="sample6_postcode" type="text" class="n-input addr1" value="" placeholder="우편번호">
										<button type="button" class="n-btn btn-sm btn-accent addr1-btn" onclick="checkPost()" style="height: 25px; line-height: 25px; min-width: 84px; padding: 0px 8px; border-radius: 3px;">검색</button>
									</div>
									<input name="address2" id="sample6_address" type="text" class="n-input addr2" placeholder="주소" style="margin-bottom:10px;">
									<input name="address3" id="sample6_detailAddress" type="text" class="n-input addr2" placeholder="상세주소">
								</div>
							</li>
							<li class="order__item order__item--overflow delivery__item__info">
								<span class="order__item__label">배송 요청사항</span>
								<div class="order__item__area order__item__area--column">
									<div class="order__select-wrap">
										<input type="text" id="message" name="postmessage" class="#" placeholder="배송메시지">
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="order-btn">
						<button type="submit" class="n-btn btn-sm btn-accent" formaction="./addProductOrderitems.product" style="margin-right: 10px; background: #0078ff; line-height: 33px; padding: 2px 13px;">
						<span id="btn-pay_amt" style="font-size: 20px;">주문하기&nbsp;</span>
						</button>
						<button type="submit" class="n-btn btn-sm btn-accent" formaction="welcome.jsp">주문취소</button>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
		
		
		

</body>
</html>