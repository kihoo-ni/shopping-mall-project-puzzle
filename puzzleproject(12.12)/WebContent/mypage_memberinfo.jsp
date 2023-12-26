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
<script type="text/javascript" src="./resources/js/memberedit.js"></script>

<title>마이페이지_회원정보변경</title>
</head>
<body>

	<%@include file="top-menu.jsp" %>
   	<div>
		<div style="display: flex;">
			<div class="left-menu-bar-wrapper">
				<%@include file="mypage-left-menu.jsp" %>
			</div>
			<div class="myPage-right-box-wrapper" style="margin: 30px auto;">
				<div class="myPage-right-box" style="border: 1px solid lightgray;">
					<form action="./memberedit.do" method="post" name="frm" onsubmit="return checkValue()">
					<script defer src="./resources/js/addressapi.js"></script>
					<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<ul>
							<li class="member-info-list">
								<label>아이디</label>
								<input  type="text" name="id" class="member-input" value="${userdto.id }" readonly="readonly"/>
							</li>
							<li class="member-info-list">
								<label>비밀번호</label>
								<input type="password" name="pw" class="member-input" size=60 placeholder="비밀번호는 최소 8자 최대 16자, 영문자, 숫자 및 특수 문자를 포함" />
							</li>
							<li class="member-info-list">
								<label>비밀번호 확인</label>
								<input type="password" class="member-input" size=40 name="pwcheck" placeholder="비밀번호 확인" />
							</li>
							<li class="member-info-list" style="width: 511.33px;">
								<div class = "email-btn-box">
									<input   type="hidden" name="email" value="${userdto.email }"/>
									<!-- <input id="auth" type="button" value="이메일 본인인증 하기" onclick="authEmailChk(document.frm)"/> -->
									<button id="auth" class="email-check mypage-btn" type="button" onclick="authEmailChk(document.frm)" style="padding: 6px 10px;">이메일 본인인증 하기</button>
								</div>
								<input  type="hidden" name="emailAuthenticationKey" class="member-input" value="0"/>
							</li>
							<li class="member-info-list">
								<label>이름</label>
								<input type="text"  name="name" class="member-input" value="${userdto.name}"  readonly="readonly"/>
							</li>
							<li class="member-info-list">
								<label>닉네임</label>
								<div class = "nikname-box" style="display: flex;">
									<input type="text" class = "nikname-txt" name="nickname" value="${userdto.nickname}" style="width: 338.42px;"/>
									<!-- <input  type="button" class = "nikname-btn" value="중복확인" onclick="opennicknameChk(document.frm)"/> -->
									<button type="button" class = "nick-btn mypage-btn" onclick="opennicknameChk(document.frm)" style="padding: 0 5px;">중복확인</button>
								</div>
								<input  type="hidden" name="nicknameDuplication" class="member-input" value="${userdto.nickname }"/>
							</li>
							<li class="member-info-list">
								<label>생년월일</label>
								<input type="text" name="birthday" class="member-input" maxlength="8" value="${userdto.birthday}"  readonly="readonly" />
							</li>
							<li class="member-info-list">
								<label>주소</label>
								<div>
									<div class = "address-box1" style="display: flex;">
										<input style="width: 309px;" type="text" name="address1" id="sample6_postcode" placeholder="우편번호">
										<!-- <input type="button" class = "address-btn" onclick="checkPost()" value="우편번호 찾기"> -->
										<button type="button" class = "address-btn mypage-btn" onclick="checkPost()" style="padding: 6px">우편번호 찾기</button>
									</div>
									<div class = "address-box2" style="width: 411px;">
										<input type="text" name="address2" id="sample6_address" placeholder="주소" style="width: -webkit-fill-available;">
									</div>
									<div class = "address-box3" style="width: 411px;">
										<input type="text" name="address3" id="sample6_detailAddress" placeholder="상세주소" style="width: -webkit-fill-available;">
									</div>
								</div>
							</li>
							<li class="member-info-list">
								<label>휴대폰번호</label>
								<div class = "phone-txt-box" style="width: 411px;">
									<input type="text" name="phone" maxlength="11" placeholder="휴대폰번호(-제외)"  style="width: -webkit-fill-available;"/>
								</div>
							</li>
						</ul>
						<div class = "btn-box" style="text-align: center;">
							<button type="submit" id = "edit_btn" class="mypage-btn" style="padding: 6px 12px;">수정하기</button>
							<button type="button" id = "delete_btn" class="mypage-btn" onclick="goMypage()" style="padding: 6px 12px;">돌아가기</button>
							<!-- <input type="submit" id = "edit_btn" value="수정하기"/> -->
							<!-- <input type="button" id = "delete_btn" value="돌아가기" onclick="goMypage()"/> -->
						</div>
						<%-- <div class="flex_between">
							<label>아이디</label>
							<div>
								<input  type="text" name="id" class="member-input" value="${userdto.id }" readonly="readonly"/>
							</div>
						</div>
						
						<div class="flex_between">
							<label>비밀번호</label>
							<input type="password" name="pw" class="member-input" size=60 placeholder="비밀번호는 최소 8자 최대 16자, 영문자, 숫자 및 특수 문자를 포함" />
						</div>
						
						<div class="flex_between">
							<label>비밀번호 확인</label>
							<input type="password" class="member-input" size=40 name="pwcheck"/>
						</div>
						
						<div class="flex_between">
							<div></div>
							<div class = "email-btn-box">
								<input   type="hidden" name="email" value="${userdto.email }"/>
								<input id="auth" type="button" value="이메일 본인인증 하기" onclick="authEmailChk(document.frm)"/>
							</div>
							<input  type="hidden" name="emailAuthenticationKey" class="member-input" value="0"/>
						</div>
						
						<div class="flex_between">
							<label>이름</label>
							<input type="text"  name="name" class="member-input" value="${userdto.name}"  readonly="readonly"/>
						</div>
						
						<div class="flex_between">
							<label>닉네임</label>
							<div class = "nikname-box">
							<input type="text" class = "nikname-txt" name="nickname" value="${userdto.nickname}"/>
							<input  type="button" class = "nikname-btn" value="중복확인" onclick="opennicknameChk(document.frm)"/>
							</div>
							<input  type="hidden" name="nicknameDuplication" class="member-input" value="${userdto.nickname }"/>
						</div>
						
						<div class="flex_between">
							<label>생년월일</label>
							<input type="text" name="birthday" class="member-input" maxlength="8" value="${userdto.birthday}"  readonly="readonly" />
							
						</div>
						
						<div class="flex_between">
							<label>주소</label>
							<div class = "address-box1">
								<input type="text" name="address1" id="sample6_postcode" placeholder="우편번호">
								<input type="button" class = "address-btn" onclick="checkPost()" value="우편번호 찾기"><br>
							</div>
						</div>
							<div class = "address-box2">
								<input type="text" name="address2" id="sample6_address" placeholder="주소"><br>
								<input type="text" name="address3" id="sample6_detailAddress" placeholder="상세주소">
							</div>
						
						<div class="flex_between">
							<label>휴대폰번호</label>
							<div class = "phone-txt-box">
								<input type="text" name="phone" maxlength="11" placeholder="휴대폰번호(-제외)" style="width: 400px"/>
							</div>
						</div> --%>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp" %>

</body>
</html>