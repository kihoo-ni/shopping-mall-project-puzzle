<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="LoginCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료</title>
<link rel="icon" href="./resources/images/favicon.PNG" type="image/x-icon">
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/payment_Result.css">
</head>
<body>
	<%@include file="top-menu.jsp" %>
	
	<div class="cart-wrapper" id="page-cart">
		<div class="cart-top">
			<h2 class="title-page">Order / Payment</h2>
		</div>
		<div class="n-order-state">
			<div class="state">
                <div class="number">주문번호<a href="#">${ordernumber }</a></div>
					<div class="txt font-mss">결제가 정상적으로 완료되었습니다.</div>
					<div class="txt-ship">결제 확인 후 발송됩니다.</div>
                <div class="btn-result">
                    <a href="welcome.jsp" class="btn-home">홈으로 가기</a>
                </div>
            </div>
		</div>
	</div>
	
	<%@include file="footer.jsp" %>
</body>
</html>