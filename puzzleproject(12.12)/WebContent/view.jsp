<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/view.css">
<link rel="stylesheet" href="resources/css/button.css">
</head>
<body>
	<%@include file="LoginCheck.jsp" %>
	<div>
		<jsp:include page="/top-menu.jsp" />

		<div class="container">
			<div class="main">

				<div class="top-title flex">
					<div class="w-5"></div>
					<h2>${board.title}</h2>
				</div>

				<%-- 게시판--%>
				<div class="mid-title">
					<div class="mid-title-top">
						<div class="flex w-85">
							<div class="w-6"></div>
							<div class="margin-right"> ${board.nickname} </div>
							<div class="margin-right"> 조회 수 ${board.hit} </div>
							<div class="margin-right"> 추천 수 ${board.recommend} </div>
							<!-- 댓글 -->
							<div class="margin-right"><fmt:formatDate value="${board.created}" pattern="yyyy-MM-dd" /></div>
						</div>
						<div class="flex-between w-160p">
							<!-- 게시물삭제 -->
							<c:if test="${id eq board.id }">
								<div>
									<button class="button_color" type="button"
										onclick="location.href='BoardDeleteAction.list?num=${param.num}&pageNum=${param.pageNum}&id=${board.id}'">삭제</button>
								</div>
							<!-- /게시물삭제 -->
							<!-- 게시물 수정 -->
							<form action="updateView.jsp" method="get">
								<input name="num" type="hidden" value="${param.num}" /> 
								<input name="pageNum" type="hidden" value="${param.pageNum}" /> 
								<input name="nickname" type="hidden" value="${board.nickname}" /> 
								<input name="title" type="hidden" value="${board.title}" /> 
								<input name="content" type="hidden" value="${board.content}" />
								<input name="photo" type="hidden" value="${board.photo}" />
								<div>  <!-- if문으로 작성한 아이디만 수정 가능  -->
									<input class="submit_css_up" type="submit" value="수정">
								</div>
							</form>
							<!-- /게시물 수정 -->
							</c:if>
						</div>
					</div>
				
				<div class="line"></div>
				
				<div class="bot-content">
					<div class="bot-content-padding">
						<div>${board.content}</div>
					</div>
					<div class="bot-content-padding">
						<c:if test="${not empty board.photo}">
							<img src="${pageContext.request.contextPath}/resources/images/${board.photo}" class="contntPhoto">
						</c:if>
					</div>
				</div>
				<!--  추천하기 버튼 -->
				<div class="liked_main"> 
					<button id="likeButton" class="like" onclick="liked(${board.num})">Like<br><p id="likeCount">${board.recommend}</p></button>  <!-- 추천 누르면 추천수 증가  -->
				</div> 	  
					<div id="recommendWarn" style="text-align: center;" ><!-- 중복추천시 경고  --></div>   
				</div> <!-- 추천하기 닫기 -->
			<!-- 댓글 작성 부분 -->
			<div class="main">
				<!-- <h4 align="center" style="margin-bottom: 2%">댓글 작성</h4> -->
				<form action="./ReplyWriterAction.reply" method="post" class="main-form">
					<input name="id" type="hidden" value="${id}" /> 
					<input name="c_num" type="hidden" value="${board.num}" /> 
					<input name="num" type="hidden" value="${param.num}" /> 
					<input name="pageNum" type="hidden" value="${param.pageNum}" /> 
					<%-- <input name="nickname" type="hidden" value="${userdto.nickname }" /> --%>
					<!-- <div>내용</div> -->
					<div class="area_flex">
					<input name="nickname" type="text" value="&emsp;${userdto.nickname}" style="text-align: right; margin-right: 1%; width: 10%;">
						<textarea class="area" name="content" onkeyup="autoResize(this)" onkeydown="autoResize(this)"  placeholder="댓글을 작성하세요."></textarea> 
						<input class="submit_css" type="submit" value="작성" formaction="./ReplyWriterAction.reply">
					</div>
				</form>
			</div>
			<!-- 댓글 출력 -->
			<div class="main">
			<div class="line"></div>
				<h4 align="left" style="margin-top: 1%">댓글 목록</h4>
				
				<c:forEach var="reply" items="${replylist}">
					<div>  <!-- 댓글, 답글, 답글 작성 전체 묶은 div -->
						<form action="ReplyUpdateAction.reply" method="post">
	        				<input name="pageNum" type="hidden" value="${param.pageNum}" /> 
							<input name="num" type="hidden" value="${param.num}" /> 
							<input name="id" type="hidden" value="${reply.id}" /> 
	        				<input type="hidden" name="r_num" value="${reply.r_num}">
	        				<div class="reply_cs">
	        					<div class="icon1">
		        					<img src="resources/images/reply.png" style="width: 40px">
			        				&ensp;<input class="writeInput" type="text" name="nickname" value="${reply.nickname}&emsp;<fmt:formatDate value="${reply.created}" pattern="yyyy-MM-dd" />" readonly>
		        				</div>
		        				<textarea class="area comment-output writeInput" onkeyup="autoResize(this)" onkeydown="autoResize(this)" name="content">${reply.content}</textarea>
        						<c:if test="${id eq reply.id }">
		        					<div class="side" style="margin-bottom: 2%;">
		        						<div style="width: 150px; display: flex; justify-content: space-between;">
			        						<input class="button_color" type="submit" value="수정" formaction="ReplyUpdateAction.reply"> <!-- if문으로 작성한 아이디만 수정 가능  -->
			        						<input class="submit_css_up" type="submit" value="삭제" formaction="./ReplyDeleteAction.reply">
		        						</div>
	        						</div>
        						</c:if>
	        				</div>
	        				
						</form>
						<!-- 답글 출력 -->
						<!-- <h4 align="left" style="margin: 1%"> 답글</h4> -->
						<c:forEach var="comment" items="${reply.commentList}">
							<form action="./CommentDeleteAction.comment" method="post" class="comment_cs">
								<input type="hidden" name="co_num" value="${comment.co_num}"/>
								<input name="id" type="hidden" value="${comment.id}" /> 
								<input name="num" type="hidden" value="${param.num}" /> 
								<input name="pageNum" type="hidden" value="${param.pageNum}" />
								<div class="reply_cs">
								<div class="icon1">
		        					<img src="resources/images/comment.png" style="width: 40px">
									&ensp;<input class="writeInput" type="text" name="nickname" value="${comment.nickname}&emsp;<fmt:formatDate value="${comment.created}" pattern="yyyy-MM-dd" />" readonly/>
								</div>
								<div class="flex-end">
									<div class="area_flex">
										<div class="area comment-output writeInput">${comment.content}</div>
									</div>
								<c:if test="${id eq comment.id }">
									<input class="submit_css" type="submit" value="X" style="width: 25px">
		        				</c:if>
								</div>
								</div>
							</form>
						</c:forEach>
						<!-- 댓글의 답글 작성  -->
						<form  method="post" action="./CommentWriteAction.comment" class="area_flex">
							<input name="re_num" type="hidden" value="${reply.r_num}">
							<input name="num" type="hidden" value="${param.num}" /> 
							<input name="pageNum" type="hidden" value="${param.pageNum}" />
							<input name="id" type="hidden" value="${id}" />
							<input name="nickname" type="text" value="&emsp;${userdto.nickname}" style="text-align: right; margin-right: 1%; width: 10%;">
							<textarea class="area comment-output" onkeyup="autoResize(this)" onkeydown="autoResize(this)"  name="content" placeholder="답글을 작성하세요."></textarea>
							<input class="submit_css" type="submit" value="작성" >
						</form>
						<div class="line2"></div>
					</div> <!-- 댓글, 답글, 답글 작성 전체 묶은 div 닫기 -->
				</c:forEach>
					
			</div>
				<div class="right">
					<button style= "margin-bottom: 15px" class="button_color" type="button"
						onclick="location.href='BoardListAction.list?num=${param.num}&pageNum=${param.pageNum}'">목록</button>
				</div>
			</div>
		</div>
<!-- 			</div> -->
		<jsp:include page="/footer.jsp" />
	
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
	function liked(num) {
	    var likeButton = $("#likeButton");
	    var likeCount = $("#likeCount");
	    var recommendWarn = $("#recommendWarn");

	    $.ajax({
	        url: "./likedCheck.liked",
	        type: "post",
	        dataType: "json",
	        data: {
	            "likeNum": num,
	        },
	        success: function (data) {
	            if (data.result === "success") {
	                recommendWarn.html(""); // 중복 경고 메시지를 지웁니다.
	                likeCount.html(${board.recommend}+data.likeCount); // 추천 수를 업데이트합니다.
	            } else {
	                recommendWarn.html("이미 추천을 하셨습니다."); // 중복 경고 메시지를 표시합니다.
	            }
	        },
	        error: function (error) {
	            console.error("AJAX 요청 중 오류 발생:", error);
	        }
	    });
	}
	function autoResize(textarea) {
		  textarea.style.height = 'auto';
		  textarea.style.height = textarea.scrollHeight + 'px';
	}
	
	var area = document.querySelectorAll('.area');
	for (var a of area){
		a.style.height = a.scrollHeight + 'px';
	}
	
	
</script>
</body>
</html>