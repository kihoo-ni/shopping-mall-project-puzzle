<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
<link rel="icon" href="./resources/images/favicon.PNG" type="image/x-icon">
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/write.css">
</head>
<body>
<div>
	<%@include file="LoginCheck.jsp" %>
	
	<jsp:include page="/top-menu.jsp" />
	<h3 class="display-3" style="text-align: center; margin-top: 20px;">게시글 수정</h3>
	<div class="container">
		<form action="./BoardUpdateAction.list?num=${param.num}&pageNum=${param.pageNum}" method="post" enctype="multipart/form-data">
			<div class="main">
			
				<div>
					<input name="id" type="hidden" value="${board.id}" readonly />
				</div> <!-- 아이디 -->
				
				<div>
					<input name="nickname" type="text" value="${userdto.nickname}" style="width: 525px;" readonly/>
				</div>
			
				<div>
					제목<input name="title" type="text" value="${param.title}" style="width: 525px;" required/>
				</div>
			
				<div>내용
					<textarea class="area" name="content" rows="30" cols="72" required>${param.content}</textarea>
					<%-- <input name="content" type="text" value="${param.content}" required/> --%>
				</div>
			
				<div>첨부파일
					<img class="#" src="./resources/images/${param.photo}" alt="사진 없음" width="150px" height="150px"/>
					<input name="photo" type="file" />
				</div>
			
				<div class="btn_flex">
						<input class="submit_css" type="submit" value="수정">
						<%-- <a href="./BoardListAction.list?pageNum=${param.pageNum}" class="submit_css">취소</a> 목록가기 --%>
						<a href="./BoardViewAction.list?num=${param.num}&pageNum=${param.pageNum}" class="submit_css cancel_btn">취소</a>
						
				</div>
			
			
			</div>
		</form>
	</div>
	
</div>
</body>
</html>