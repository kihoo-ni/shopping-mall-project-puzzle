<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="resources/css/top-menu.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
	<nav>
		<div class="nav-top">
        <a href="welcome.jsp" onclick="handleMenuClick(this)"><img alt="PUZZLE" src="./resources/images/Logo3.png" style="width: 450px;"> </a>
        
      	</div>
	      <div class="nav-bottom">
	        <c:choose>
	        	<c:when test="${empty id}">
		        <div class="bottom-left-logout">
					<a href="login.jsp" onclick="handleMenuClick(this)">로그인</a>
					<a href="register.jsp" onclick="handleMenuClick(this)">회원가입</a>
				</div>
				</c:when>
			 	<c:when test="${id eq 'seller'}">
	    	    <div class="bottom-left-login-seller">
					<a href="./logout.do">로그아웃</a>
				</div>
			 	</c:when>
				<c:otherwise>
	    	    <div class="bottom-left-login-customer">
					<a href="./logout.do">로그아웃</a>
					<a href="mypage.jsp" onclick="handleMenuClick(this)">마이페이지</a>
		    	</div>
				</c:otherwise>
			 </c:choose>
			
		
			 
			 <c:choose>
			    <c:when test="${not empty id and id ne 'seller'}">
			        <!-- 일반회원  -->
			        <div class="bottom-right-member">
			            <a href="BoardListAction.list?pageNum=1" onclick="handleMenuClick(this)">커뮤니티</a>
			            <a href="./cartview.product" onclick="handleMenuClick(this)">장바구니</a>
			            <a href="recentItems.search" onclick="handleMenuClick(this)">최근본상품</a>
			        </div>
			    </c:when>
			    <c:when test="${id eq 'seller'}">
			        <!-- 판매자로 로그인한 경우 -->
			        <div class="bottom-right">
			            <a class="#" href='sellerpage_addProduct.jsp' onclick="handleMenuClick(this)">상품등록</a>
			            <a class="#" href='listProduct.search' onclick="handleMenuClick(this)">상품관리</a>
			            <a class="#" href='listCs.seller' onclick="handleMenuClick(this)">고객센터</a>
			            <a class="#" href='shippinglist.product' onclick="handleMenuClick(this)">배송관리</a>
			        </div>
			    </c:when>
			    <c:otherwise>
			        <!-- 비회원 -->
			        <div class="bottom-right-nonMember">
	                  <a href="recentItems.search" onclick="handleMenuClick(this)">최근본상품</a>
			        </div>
			    </c:otherwise>
			</c:choose>
     	 </div>
   	 </nav>
<script>
	document.addEventListener('DOMContentLoaded', function() {
	  // 페이지 로드 시 저장된 활성 메뉴가 있으면 해당 메뉴에 'active' 클래스 추가
	  const activeMenuItem = sessionStorage.getItem('activeMenuItem');
	  if (activeMenuItem) {
	    const menuElements = document.querySelectorAll('.nav-bottom a');
	    menuElements.forEach(menuElement => {
	      if (menuElement.innerText.trim() === activeMenuItem) {
	        menuElement.classList.add('active');
	      }
	    });
	  }
	});

	function handleMenuClick(clickedElement) {
	  // 모든 메뉴에서 'active' 클래스 제거
	  const allMenuItems = document.querySelectorAll('.nav-bottom a');
	  allMenuItems.forEach(item => item.classList.remove('active'));

	  // 클릭된 메뉴에 'active' 클래스 추가
	  clickedElement.classList.add('active');

	  // 클릭한 메뉴 정보를 sessionStorage에 저장
	  const menuName = clickedElement.innerText.trim();
	  sessionStorage.setItem('activeMenuItem', menuName);
	}
</script>