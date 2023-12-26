<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="LoginCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="./resources/images/favicon.png" type="image/x-icon">
<link rel="stylesheet" href="./resources/css/layout.css" />
<link rel="stylesheet" href="./resources/css/mypage-left.css">
<link rel="stylesheet" href="./resources/css/mypage-right.css">
<script type="text/javascript" src="./resources/js/memberdelete.js"></script>

<title>마이페이지_회원탈퇴</title>
</head>
<body>

	<%@include file="top-menu.jsp" %>
   	<div>
		<div style="display: flex;">
			<div class="left-menu-bar-wrapper">
				<%@include file="mypage-left-menu.jsp" %>
			</div>
			<div class="myPage-right-box-wrapper" style="margin: 30px auto;">
				<div class="myPage-right-box" style="width: 900px;">
					<form action="./memberdelete.do" class="delete-frm" method="post" name="frm" onsubmit="return checkValue()">
						<div class="flex_between" style="margin-bottom: 20px;">
							<div>
								<h2>${userdto.name }님,&nbsp;&nbsp; 회원탈퇴 하시겠습니까?</h2>
							</div>
						</div>
						<div class="flex_between" style="margin-bottom: 20px;">
							<div style="display: flex; flex-direction: column;">
								<input style="height: 30px;   width: 400px;   border: 1px solid lightgray;" type="text" name="email" value="${userdto.email }" maxlength="50" readonly="readonly"/>
								<input  type="hidden" name="id" value="${userdto.id }" maxlength="50"/>
								<button id="auth" type="button" class="mypage-btn" style="height: 30px;" onclick="authEmailChk(document.frm)">이메일 본인인증 하기</button>
							<!-- <div class = "email-btn-box">
								<input id="auth" type="button" value="이메일 본인인증 하기" onclick="authEmailChk(document.frm)"/>
							</div> -->
							<input  type="hidden" name="emailAuthenticationKey" class="member-input" value="0"/>
							</div>
						</div>
						<div class = "btn-box">
							<button type="submit" id = "edit_btn" class="mypage-btn" style="padding:8px 16px;">탈퇴하기</button>
							<button type="button" id = "delete_btn" class="mypage-btn" style="padding:8px 16px;" onclick="goMypage()">돌아가기</button>
							<!-- <input type="submit" id = "edit_btn" value="탈퇴하기"/>
							<input type="button" id = "delete_btn" value="돌아가기" onclick="goMypage()"/> -->
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp" %>

</body>
</html>