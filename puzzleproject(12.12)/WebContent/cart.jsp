<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="LoginCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="icon" href="./resources/images/favicon.PNG" type="image/x-icon">
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/cart.css">
</head>
<body>

	<%@include file="top-menu.jsp"%>
	<div>
		<div style="display: flex;">
			<div class="left-menu-bar-wrapper">
				<%@include file="left-menu.jsp"%>
			</div>
			<div class="cart-wrapper" id="page-cart" style="min-width: 83%;">
				<div class="cart-top">
					<h2 class="title-page">Order / Payment</h2>
				</div>
				<form style="margin-top: 20px;"  method="post">
					<div class="order-cart">
						<div class="order-contents">
						
							<!--cart products-->
							<table class="table-basic cart-table n-cart-table">
								<colgroup>
									<col width="25%">
									<col width="5%">
									<col width="11%">
									<col width="9%">
									<col width="12%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">상품명(옵션)</th>
										<th scope="col">판매가</th>
										<th scope="col">수량</th>
										<th scope="col">주문관리</th>
										<th scope="col">배송비/배송 형태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="products" items="${products }">
									<tr class="cart-group">
										<td colspan="9" class="cart-cont">
											<table class="table-basic cart-table n-cart-table">
												<colgroup>
													<col width="25%">
													<col width="5%">
													<col width="11%">
													<col width="9%">
													<col width="12%">
												</colgroup>
												<tbody>
													<tr class="cart-list-no" data-cart-no="954615759">
														<td>
															<div class="connect-img">
																<a href="./view.search?productId=${products.productId}" class="img-block"> 
																<img src="./resources/images/${products.productImage }" alt="사진">
																</a>
															</div>
															<div class="article-info connect-info">
																<p class="txt-brand"></p>
																<p class="list-info ">
																	<a href="./view.search?productId=${products.productId}">${products.productName }</a>
																</p>
																<p class="last"></p>
															</div>
														</td>
														<td class="td-price">
															<div class="td-price-wrap"><fmt:formatNumber value="${products.productUnitPrice*products.productNumber }" pattern="#,###"/></div>
														</td>
														<td>
															 <div style="display: flex; justify-content: center;">
												                <input style="width: 50px;" type="number" name="productNumber" id="productNumber_${products.productId}" value="${products.productNumber}">
												                <!-- id를 각 상품별로 고유하게 만들어줌 -->
												                <a id="updateLink_${products.productId}" class="plain-btn btn" onclick="updateHrefWithProductNumber('${products.productId}')">수량변경</a>
												            </div> 
														</td>
														<td class="flex-col" style="padding-top: 40px;">
															<a href="delectCartItem.product?productId=${products.productId }" class="plain-btn btn">삭제하기</a>
														</td>
														<td>택배배송 <br> <strong>배송비무료</strong>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="section-contents section-discount-cont">
								<ul class="final-payment">
									<li>
										<p class="final-payment-ti">최종 결제 금액</p>
										<p class="final-payment-price">
											<span id="pay-amt"><fmt:formatNumber value="${sum }" pattern="#,###"/> </span>원
										</p>
									</li>
								</ul>
							</div>

							<!--cart button-->
							<div class="n-btn-group n-btn-order">
								<p style="line-height: 3;  color: red;">${warnInstock}</p>
								<c:if test="${empty warnInstock}">
								<button type="submit" formaction="listorder2.product"  style="background: #0078ff;"
									class="n-btn btn-lg btn-accent" id="btn-order">
									주문하기 <span class="n-btn-order-sm-txt"></span>
								</button>
								</c:if>
							</div>
							
							<!--//cart products-->
							<div class="box-explain-cart">
								<ul class="n-info-txt">
									<li>퍼즐은 제주/도서산간 지역 제외 전 지역, 전 상품 무료 배송입니다.</li>
									<li>주문완료 후 출고 전 배송지 변경은 동일 권역(일반, 제주, 제주 외 도서산간 지역) 내에서만
										가능합니다.</li>
									<li>2개 이상의 브랜드를 주문하신 경우, 개별 배송됩니다.</li>
									<li>결제 시 각종 할인 적용이 달라질 수 있습니다.</li>

									<li>해외배송 상품은 배송료가 추가로 발생될 수 있습니다.</li>
									<li>장바구니 상품은 최대 1년 보관(비회원 2일)되며 담은 시점과 현재의 판매 가격이 달라질 수
										있습니다.</li>
									<li>장바구니에는 최대 100개의 상품을 보관할 수 있으며, 주문당 한번에 주문 가능한 상품수는
										100개로 제한됩니다.</li>

									<li>구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상계좌 재주문이 불가합니다.</li>
									<li>수량 제한 상품의 경우, 가상계좌를 통한 주문은 최대 2건까지만 가능합니다.(미입금 주문 기준,
										기존 주문 합산)</li>
								</ul>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
 <script>
    function updateHrefWithProductNumber(productId) {
        // 해당 상품의 input 태그에서 값을 가져옴
        var productNumber = document.getElementById("productNumber_" + productId).value;

        // 앵커 태그의 href 속성을 업데이트
        var anchorTag = document.getElementById("updateLink_" + productId);
        anchorTag.href = "updateCartProductNum.product?productNumber=" + productNumber + "&productId=" + productId;

        // 앵커 태그를 클릭하여 페이지 이동 또는 작업 수행
        // anchorTag.click(); // 클릭 시 페이지 이동
        console.log("Product ID: " + productId);
        console.log("Product Number: " + productNumber);
    }
</script>

</body>
</html>