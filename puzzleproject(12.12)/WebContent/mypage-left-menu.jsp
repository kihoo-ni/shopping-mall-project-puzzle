<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="resources/css/mypage-left.css">
<script type="text/javascript" src="./resources/js/memberedit.js"></script>

	<div class="left-menu-wraper">
		<div class="left-menu">
			<div class="left-menu-box">
				<div class="left-menu-title">
					<h3 style="font-size: 25px;">${userdto.nickname }님 <br/> 마이페이지</h3>
				</div>
				<ul class="menu-ul">
					<li class="menu-li">
						<a href="mypage_memberinfo.jsp" onclick="handleMenuClick(this)">회원정보변경</a>
					</li>
					<li class="menu-li">
						<a href="orderlist.product" onclick="handleMenuClick(this)">주문목록</a>
					</li>
					<li class="menu-li">
						<a href="paymentlist.product" onclick="handleMenuClick(this)">결제목록</a>
					</li>
					<li class="menu-li">
						<a href="reviewlist.product" onclick="handleMenuClick(this)">상품후기</a>
					</li>
					<li class="menu-li">
						<a href="listGuest_cs.guest" onclick="handleMenuClick(this)">고객센터</a>
					</li>
					<li class="menu-li">
						<a href="mypage_deletemember.jsp" onclick="handleMenuClick(this)">회원탈퇴</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
<script>
	document.addEventListener('DOMContentLoaded', function() {
	  // 페이지 로드 시 저장된 활성 메뉴가 있으면 해당 메뉴에 'active' 클래스 추가
	  const activeMenuItem = sessionStorage.getItem('activeMenuItem');
	  if (activeMenuItem) {
	    const menuElements = document.querySelectorAll('.menu-li a');
	    menuElements.forEach(menuElement => {
	      if (menuElement.innerText.trim() === activeMenuItem) {
	        menuElement.classList.add('active');
	      }
	    });
	  }
	});

	function handleMenuClick(clickedElement) {
	  // 모든 메뉴에서 'active' 클래스 제거
	  const allMenuItems = document.querySelectorAll('.menu-li a');
	  allMenuItems.forEach(item => item.classList.remove('active'));

	  // 클릭된 메뉴에 'active' 클래스 추가
	  clickedElement.classList.add('active');

	  // 클릭한 메뉴 정보를 sessionStorage에 저장
	  const menuName = clickedElement.innerText.trim();
	  sessionStorage.setItem('activeMenuItem', menuName);
	}
</script>