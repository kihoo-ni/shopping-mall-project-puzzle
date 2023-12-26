<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="./resources/js/idsearch.js"></script>

<title>아이디 찾기</title>
<link rel="icon" href="./resources/images/favicon.PNG" type="image/x-icon">
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/register.css">
</head>
<body>
	<%@include file="top-menu.jsp" %>
	<div class="container-wrapper">
		<section id="contents">
			<div class="join-member">
				<form action="./idsearch.do" method="post" name="frm" onsubmit="return checkValue()">
					<fieldset style="border: 0 none;">
						<h3>아이디 찾기</h3>
						<div class="join-table prl60x">
							
							<div class="text-box mb15">
								<input type="text" id="name" name="name" class="input-login" placeholder="이름">
							</div>
						
							<div class="text-box mb15">
								<input type="text" id="birth" name="birthday" class="input-login" placeholder="생년월일(8자리)">
							</div>
							<div class="text-box mb15 _typeNo">
								<input type="text" id="email" name="email" class="input-login w590x" placeholder="이메일 (example@gmail.com)" style="width: 800px !important;">
							</div>
							<div class="text-box mb15">
								<button id="auth" type="button" class="submit-btn" style="background-color: #404040;" onclick="authEmailChk(document.frm)">이메일 본인인증</button>
								<input  type="hidden" name="emailAuthenticationKey" value="0"/>
							</div>
							<div class="text-box mb15">
								<input type="text"  class="input-login w590x" value="${result }" style="width: 800px !important;">
							</div>
						
						</div>
						<button type="submit" class="submit-btn" style="background-color: #404040;">아이디 찾기</button>
						<button type="button" class="submit-btn"  onclick="goFirstForm()" style="background-color: #404040;">홈으로</button>
					</fieldset>
				</form>
			</div>
		</section>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>