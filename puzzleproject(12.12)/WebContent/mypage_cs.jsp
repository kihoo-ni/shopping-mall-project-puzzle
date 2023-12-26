<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="LoginCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/layout.css" />
<link rel="stylesheet" href="./resources/css/mypage-left.css">
<link rel="stylesheet" href="./resources/css/mypage-right.css">
<link rel="stylesheet" href="./resources/css/mypage_cs.css">
<script type="text/javascript" src="./resources/js/memberedit.js"></script>

<title>마이페이지_상품후기</title>
</head>
<body>

	<%@include file="top-menu.jsp"%>
	<div>
		<div style="display: flex;">
			<div class="left-menu-bar-wrapper">
				<%@include file="mypage-left-menu.jsp"%>
			</div>
			<div class="myPage-right-box-wrapper">
				<div class="myPage-right-box" style="width: 900px;">
					<h2 style="line-height: 2em; margin: 2%">고객센터 문의글</h2>
					<c:forEach var="dto" items="${replylist }" varStatus="i">
						<div style="display: flex;">
							<div class="question" id="que-${i.count}">
								<div class="Q-01">
									<div class="w90">
										<div class="w15">민원번호</div>
										${dto.csnum}
									</div>
									<div class="w90">
										<div class="w15">문의 제목</div>
										${dto.title}
									</div>
									<div class="w90">
										<div class="w15">상품 ID</div>
										${dto.productId}
									</div>
									<div class="w90">
										<div class="w15">문의 내용</div>
										<textarea style="width: 600px; height: 100px;">${dto.content}</textarea>
									</div>
									<div class="w90">
										<div class="w15">문의 일시</div>
										${dto.created}
									</div>
								</div>
								<div class="Q-02">
									<button class="btu">
										<a href="deleteGuestCs.guest?csnum=${dto.csnum }">문의취소</a>
									</button>
								</div>
							</div>
						</div>
						<c:forEach var="sellerlist" items="${dto.replylist }">
							<div class="answer" id="ans-${i.count}">
								<div class="w90">
									<div class="w15">민원번호</div>
									${sellerlist.guest_csnum}
								</div>
								<div class="w90">
									<div class="w15">답변 제목</div>
									${sellerlist.sel_title}
								</div>
								<div class="w90">
									<div class="w15">상품 ID</div>
									${dto.productId}
								</div>
								
								<div class="w90">
									<div class="w15">답변 내용</div>
									<div class="break-all">${sellerlist.content}</div>
								</div>
								
								<div class="w90">
									<div class="w15">답변 일시</div>
									${sellerlist.sel_created}
								</div>
							</div>
						</c:forEach>

					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>

	<script>
	  	const items = document.querySelectorAll('.question');
	
	  	function openCloseAnswer() {
	    const answerId = this.id.replace('que', 'ans');
	
	    if(document.getElementById(answerId).style.display === 'block') {
	      document.getElementById(answerId).style.display = 'none';
	    } else {
	      document.getElementById(answerId).style.display = 'block';
	    }
	  }
	
	  items.forEach(item => item.addEventListener('click', openCloseAnswer));
</script>

</body>
</html>
