<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="LoginCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="./resources/images/favicon.PNG" type="image/x-icon">
<link rel="stylesheet" href="./resources/css/layout.css" />
<link rel="stylesheet" href="./resources/css/order.css">
<link rel="stylesheet" href="./resources/css/cart.css">
<script type="text/javascript" src="./resources/js/memberedit.js"></script>
<title>마이페이지_주문목록</title>
</head>
<body>
	
	<%@include file="top-menu.jsp" %>
   	<div>
		<div style="display: flex;">
			<div class="left-menu-bar-wrapper">
				<%@include file="mypage-left-menu.jsp" %>
			</div>
			<div class="myPage-right-box-wrapper">
				<div class="myPage-right-box">
					<form  method="post">
						<div class="section order_product_info">
							<!--cart products-->
							<table class="table_basic order_cart_table">
								<colgroup>
									<col>
									<col width="50px">
									<col width="100px" class="charge ">
									<col width="100px" class="charge ">
									<col width="100px">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">상품 정보</th>
										<th scope="col">수량</th>
										<th scope="col">배송비</th>
										<th scope="col">주문금액</th>
										<th scope="col">주문취소</th>
									</tr>
								</thead>
								<tbody>
									<!-- 반품여부 N : 반품불가 상품 -->
									<c:forEach var="products" items="${products }">
									<tr>
										<td class="td_product">
											<div class="connect_img">
												<img src="./resources/images/${products.productImage }" alt="사진" style="width: inherit;">
											</div>
											<div class="article_info connect_info" style="margin-top:30px;">
												<div class="box_product">
													<span class="list_info">
													<a href="./view.search?productId=${products.productId}">${products.productName }</a>
													</span>
												</div>
											</div>
										</td>
										<td><strong>${products.productNumber }</strong></td>
										<td rowspan="1"><span class="box_normal-dlv-amt"
											data-policy-no="1272"> 무료 </span> 
										</td>
										<td class="price"><strong><fmt:formatNumber pattern="#,###" value="${products.productUnitPrice*products.productNumber }" />원</strong></td>
										<td style="padding:0; background: #000000;">
											<a style="color: white; padding: 44px 23px;" href="delectOrderItem.product?productOrderNumber=${products.orderNumber }&productId=${products.productId }&productNumber=${products.productNumber}">
												주문취소
											</a>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="section order_coupon_discount">
									<h3 class="order__title">최종 결제 금액</h3>
									<div class="cell_order_form" style="margin-top: 15px;">
										<div class="discount_contents">
											<ul>
												<li class="cell_discount_tit">상품 금액</li>
												<li class="cell_discount_detail"><strong><fmt:formatNumber pattern="#,###" value="${sum }" />원</strong></li>
											</ul>
											<ul>
												<li class="cell_discount_tit">배송비</li>
												<li class="cell_discount_detail">
													<strong>
														<span class="text_total-normal-dlv-amt_free">
															<em	class="txt_point" style="font-style: normal;">배송비 무료</em>
														</span>
													</strong>
												</li>
											</ul>
										</div>
									</div>
						</div>
						<fieldset>
							<legend>결제수단</legend>
							<h3 class="orderTitle">결제수단</h3>
							<div class="payment">
								<ul>
									<li class="on"><a href="#" 
										data-view="1" id="card">신용카드</a>
									</li>
								</ul>
							</div>
							<div class="paymentinfoWrap">
								<div class="paymentinfo paymentinfo1" style="display: table;">
									<h3>결제안내</h3>
									<div class="text">
										<p class="dot">주문 완료 후 상품 변경(사이즈/컬러)이 불가능합니다.</p>
										<p class="dot">선택하신 결제 정보를 확인해주세요.</p>
										<p class="dot">국내 모든 신용/체크 카드 결제 가능하며 해외에서 발행된 카드는 이용하실 수
											없습니다. (해외배송 불가)</p>
										<p class="dot">청구할인은 카드사에서 제공하며, 결제대금의 청구 시점에 차감 청구되는 할인
											방식입니다.</p>
									</div>
								</div>
							</div>
						</fieldset>
						<div class="btn_wrap order_form__payment-button-wrap">
							<button class="n-btn btn-sm btn-accent" style="font-size: 16px; background: #0078ff; padding: 2px 10px;" type="submit" formaction="addPaymentOrderlist.product"><span id="btn-pay_amt"><fmt:formatNumber pattern="#,###" value="${sum }" />원 결제하기</span></button>
							<button class="n-btn btn-sm btn-accent" style="font-size: 16px; margin-left: 10px;" type="submit" formaction="welcome.jsp">결제취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp" %>
 
</body>
</html>
