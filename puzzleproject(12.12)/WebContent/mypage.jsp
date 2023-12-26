<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="./resources/images/favicon.PNG" type="image/x-icon">
<link rel="stylesheet" href="./resources/css/layout.css" />
<link rel="stylesheet" href="./resources/css/mypage-left.css">
<link rel="stylesheet" href="./resources/css/mypage-right.css">
<script type="text/javascript" src="./resources/js/memberedit.js"></script>

<title>마이페이지</title>
</head>
<body>
	<%@include file="LoginCheck.jsp" %>
 	
 	<%@include file="top-menu.jsp" %>
   	<div>
		<div style="display: flex;">
			<div class="left-menu-bar-wrapper">
				<%@include file="mypage-left-menu.jsp" %>
			</div>
			<div class="myPage-right-box-wrapper">
				<div class="myPage-right-box">
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp" %>
 	
</body>
</html>