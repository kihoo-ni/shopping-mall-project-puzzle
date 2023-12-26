<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="SellerCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="./resources/images/favicon.PNG" type="image/x-icon">
<link rel="stylesheet" href="./resources/css/layout.css" />
<link rel="stylesheet" href="./resources/css/mypage-left.css">
<link rel="stylesheet" href="./resources/css/mypage-right.css">
<link rel="stylesheet" href="./resources/css/mypage_cs.css">
<script type="text/javascript" src="./resources/js/memberedit.js"></script>
<title>민원관리</title>
</head>
<body>

	<%@include file="top-menu.jsp"%>

	<div class="w100">
		<div class="w15"></div>
		<!-- 왼쪽 여백 -->

		<div style="width: 70%">
			<div class="#">
				<h2 class="title_h2">민원관리</h2>

				<div class="w70">
					<!-- 폼으로 질문을 입력하고 서버로 전송 -->
					<form action="./insertSeller_cs.seller" method="post">
						<c:forEach var="dto" items="${list }">
							<div class="question2">
								<div class="w90">
									<div class="w15">민원번호</div>
									${dto.csnum}
								</div>
								<div class="w90">
									<div class="w15">민원인 ID</div>
									${dto.id}
								</div>
								<div class="w90">
									<div class="w15">문의 제목</div>
									${dto.title}
								</div>
								<div class="w90">
									<div class="w15">문의 내용</div>
									<textarea style="width: 600px; height: 100px;">${dto.content}</textarea>
								</div>
								<div class="w90">
									<div class="w15">상품 ID</div>
									${dto.productId}
								</div>
								<div class="w90">
									<div class="w15">문의 일시</div>
									${dto.created}
								</div>
							</div>
							<div class="faq-content"></div>
						</c:forEach>

						<!-- 고객민원번호 제대로 입력 안하면 DB삽입 안됨 -->
						<div class="answer2">
							<div class="ans_flex">
								<div class="p1">민원 번호</div>
								<input type="text" name="guest_csnum" required />
								<div class="p1">답변 제목</div>
								<input type="text" name="sel_title" style="width: 40%" required />
								<div class="p1">작성자</div>
							<input type="text" name="sel_id" value="${id }" readonly="readonly"/>
							</div>
							<div class="ans-line"></div>
							<!-- 판매자 세션 아이디 -->
							<div class="ans_content_flex" style="height: 81px;">
								<div class="p1">답변내용</div>
									<textarea name="content"style="height: 100%; width: 75%;" required></textarea>
									<input class="submit_btn" type="submit" style="height:100%; width: 15%;" value="답변등록" />
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="w15">
			<!-- 오른쪽 여백 -->
		</div>
	</div>
	<%@include file="footer.jsp"%>




</body>
</html>