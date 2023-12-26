<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	if(session.getAttribute("id") != null) {
		JSFunction.alertLocation("이미 로그인 하셨습니다.", "welcome.jsp", out);
		return;
	}
%>

<%
//쿠키가져오기
boolean redirectFlag = false;
Cookie[] cookies = request.getCookies();
if(cookies != null){
    for(Cookie tempCookie : cookies){
        if(tempCookie.getName().equals("id")){
            redirectFlag = true;
            break; // 일치하는 쿠키를 찾으면 루프 종료
        }
    }
}

if (redirectFlag) {
    response.sendRedirect("welcome.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="icon" href="./resources/images/favicon.PNG" type="image/x-icon">
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/login.css">

</head>
<body>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
        document.getElementById("id").value = "";
        document.getElementById("pw").value = "";
    });
</script>
<script type="text/javascript">
    window.addEventListener('pageshow', function(event) {
        var historyTraversal = event.persisted || 
                               (typeof window.performance != 'undefined' && 
                                window.performance.navigation.type === 2);
        if (historyTraversal) {
            // 뒤로가기로 페이지가 로드된 경우, 입력 필드 초기화
            document.getElementById("id").value = "";
            document.getElementById("pw").value = "";
        }
    });
</script>
    
<!-- <body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
<script type="text/javascript">
	window.history.forward(); 
	function noBack(){
		window.history.forward();
	} 
</script> -->
	<%@include file="top-menu.jsp" %>
		<div class="container">
		<section class="contents">
			<div class="login-member">
				<form action="./loginprocess.do" method="post" autocomplete="off">
					<fieldset>
					<h3>로그인</h3>
					<div class="input-box1">
						<p style="color: red; text-align: center;">${warning }</p>
						<input class="input-login" id="id" type="text" name="id" placeholder="아이디" />
					</div>
					<div class="input-box2">
						<input class="input-login" id="pw" type="password" name="pw" placeholder="비밀번호" />
					</div>
					<div class="login-check">
						<div class="checkbox-wrapper">
							<input type="checkbox" id="autoLogin" name="autologin">
							<label for="autoLogin" >자동 로그인</label>
						</div>
						<ul class="find-box">
							<li class="fl"><a href="register.jsp">회원가입</a></li>
							<li class="fl"><a href="idsearch.jsp">아이디 찾기</a></li>
							<li class="fl"><a href="pwsearch.jsp">비밀번호를 잊어버리셨나요?</a></li>
						</ul>
					</div>
					<button type="submit" class="login-btn">로그인</button>
				 	<a id="kakao-login-btn" href="javascript:kakaoLogin()">
	  					<img src="./resources/images/kakao_login_large_wide.png" width="500" height="60"
	   						 alt="카카오 로그인 버튼" />
					</a>
					</fieldset>
				</form>
			</div>
		</section>
	</div>

  	<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<!-- <script type="text/javascript">
	    Kakao.init('8e585fec79e50942695f9ebef282d4a3');
	    function kakaoLogin() {
	        Kakao.Auth.login({
	            success: function (response) {
	                Kakao.API.request({
	                    url: '/v2/user/me',
	                    success: function (response) {
	                        alert(JSON.stringify(response))
	                    },
	                    fail: function (error) {
	                        alert(JSON.stringify(error))
	                    },
	                })
	            },
	            fail: function (error) {
	                alert(JSON.stringify(error))
	            },
	        })
	    }
	</script> -->
	<form action="kakaoregisterprocess.do" name="frm" style="display: none;">
		<input type="hidden" name="email">
	</form>
	<script type="text/javascript">
	    Kakao.init('8e585fec79e50942695f9ebef282d4a3');
	    function kakaoLogin() {
	    	window.Kakao.Auth.login({
	    	    scope: 'account_email',
	    	    success: function (authObj) {
	    	        Kakao.API.request({
	    	            url: '/v2/user/me',
	    	            success: function (res) {
	    	                const kakao_account = res.kakao_account;
	    	                document.frm.email.value = kakao_account.email;
	    	                document.frm.submit();
	    	            }
	    	        });
	    	    }
	    	});
	  }
	</script>
	<%@include file="footer.jsp" %>
	
	

</body>
</html>


