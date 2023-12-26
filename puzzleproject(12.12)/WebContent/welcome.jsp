<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Cookie[] cookies = request.getCookies();
    if(cookies !=null){
        for(Cookie tempCookie : cookies){
            if(tempCookie.getName().equals("id")){
                //쿠키값으로 대신 로그인 처리함
                session.setAttribute("id", tempCookie.getValue());
                
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="./resources/images/favicon.PNG" type="image/x-icon">
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/main.css">

<meta charset="UTF-8">
<title>홈화면</title>
</head>
<body>

	<%@include file="top-menu.jsp" %>
   	<div>
		<div style="display: flex;">
			<div class="left-menu-bar-wrapper">
				<%@include file="left-menu.jsp" %>
			</div>
			<div class="main-image-wrapper">
				<div class="main-image">
					<!-- SampelVideo https://pixabay.com/ko/videos/search/?order=ec 여기서 받았음 -->
					<video id="mainVideo" class="slide-video" role="application" playsinline="playsinline" tabindex="-1" preload="none" muted="muted" onended="handleVideoEnd()">
    					<source src="resources/video/main-video - Trim.mp4" type="video/mp4">
					</video>
					
					<div class="arrow-btn left-arrow" onclick="changeContent(-1)">&lt;</div>
	                <div class="arrow-btn right-arrow" onclick="changeContent(1)">&gt;</div>
	               <img id="mainImage1" class="slide-image" alt="main-image" src="resources/images/메인그림1.png" style="display: none;">
	                <img id="mainImage2" class="slide-image" alt="main-image" src="resources/images/메인그림2.png" style="display: none;">
	                <img id="mainImage3" class="slide-image" alt="main-image" src="resources/images/메인그림3.png" style="display: none;">
					
				</div>
				<%@include file="main-items.jsp" %>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp" %>

<script type="text/javascript">
	var video = document.getElementById("mainVideo");
	var image1 = document.getElementById("mainImage1");
	var image2 = document.getElementById("mainImage2");
	var image3 = document.getElementById("mainImage3");
	var contentArray = [video, image1, image2, image3];
	var currentContentIndex = 0;
	
	// 초기에 비디오를 재생
	video.play();
	
	// 화살표 클릭 시
	function changeContent(offset) {
	    // 현재 컨텐츠를 숨김
	    contentArray[currentContentIndex].style.display = "none";
	
	    // 다음 컨텐츠 인덱스 계산
	    currentContentIndex = (currentContentIndex + offset + contentArray.length) % contentArray.length;
	
	    // 다음 컨텐츠를 보여줌
	    contentArray[currentContentIndex].style.display = "block";
	
	    // 만약 다음 컨텐츠가 비디오라면 재생
	    if (contentArray[currentContentIndex] === video) {
	        video.play();
	    } else {
	        // 이미지인 경우 3초 후에 다음 컨텐츠로 전환
	        setTimeout(function () {
	            changeContent(1);
	        }, 3000);
	    }
	}
	
	// 비디오가 끝나면 바로 이미지로 전환
	video.addEventListener("ended", function() {
	    changeContent(1);
	});
	
	

<!-- 자동으로 넘어가는거 X -->
/* 	var video = document.getElementById("mainVideo");
	var image1 = document.getElementById("mainImage1");
	var image2 = document.getElementById("mainImage2");
	var image3 = document.getElementById("mainImage3");
	var contentArray = [video, image1, image2, image3];
	var currentContentIndex = 0;
	
	function handleVideoEnd() {
	    // 비디오가 끝나면 바로 다음 이미지로 전환
	    changeContent(1);
	}
	
	// 초기에 비디오를 재생
	video.play();
	
	// 화살표 클릭 시
	function changeContent(offset) {
	    // 현재 컨텐츠를 숨김
	    contentArray[currentContentIndex].style.display = "none";
	
	    // 다음 컨텐츠 인덱스 계산
	    currentContentIndex = (currentContentIndex + offset + contentArray.length) % contentArray.length;
	
	    // 다음 컨텐츠를 보여줌
	    contentArray[currentContentIndex].style.display = "block";
	
	    // 만약 다음 컨텐츠가 비디오라면 재생
	    if (contentArray[currentContentIndex] === video) {
	        video.play();
	    }
	} */
	
</script>
</body>
</html>