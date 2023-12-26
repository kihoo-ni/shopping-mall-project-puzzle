<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@include file="LoginCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="icon" href="./resources/images/favicon.PNG" type="image/x-icon">
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/list.css">
<link rel="stylesheet" href="resources/css/button.css">
</head>
<body>
<%-- <jsp:include page="/menu.jsp"/> --%>
<jsp:include page="/top-menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3" style="text-align: center; margin-top: 20px;">커뮤니티</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="main">
		<form class="main-form" action="<c:url value = "./BoardListAction.list"/>" method="post">
			<div>
				<div class="text-right">
					<span class="badge badge-success"> 전체 ${total_record}건</span>
				</div>
			<div class="main-size">
			<div style="padding:30px">	
				<div class="list-row">
					<div class="w10">번호</div>
					<div class="w30">제목</div>
					<div class="w20">글쓴이</div>
					<div class="w10">조회수</div>
					<div class="w10">추천수</div>
					<div class="w25">작성일</div>
				</div>
					<div class="line-b"></div>
				<c:forEach var="list" items="${boardlist}" varStatus="loop">
				<div class="list-row">
					
					<div class="w10">${list.virtualNum}</div>
					<%-- <div class="w10"> ${list.num}</div> --%>
					<div class="w30"><a href="./BoardViewAction.list?num=${list.num}&pageNum=${pageNum}">${list.title}</a></div>
					<div class="w20">${list.nickname}</div>
					<div class="w10">${list.hit}</div>
					<div class="w10">${list.recommend}</div>
					<div class="w25"><fmt:formatDate value="${list.created}" pattern="yyyy-MM-dd" /></div>
				</div>
				<div class="line"></div>
				</c:forEach>
			</div>
			</div>
		</div>
		<div align="left">
			<div class="serch">
				<div width="100%" align="left">&nbsp;&nbsp;
					<select name="items" class="txt" style="height: 31.5px; border: 2px solid;" >
						<option value="title">제목</option>
						<option value="nickname">글쓴이</option>
					</select>
					<input name="text" type="text">
					<input type="submit" class="submit_css" value="검색">
				</div>
					<div width="100%" align="right"> 
						<button class="button_color" type="button" onclick="location.href='write.jsp'">작성</button>
				</div>
			</div>
		</div>
			<div align="center">
				<c:if test="${begin != 1}">
					<a href="BoardListAction.list?pageNum=${begin-1}">이전</a>
				</c:if>
				<c:forEach var="i" begin="${begin}" end="${end}">
					<a href="<c:url value = './BoardListAction.list?pageNum=${i}'/>">
						<c:choose>
							<c:when test="${pageNum==i}">
								<font color="gray"><b>[${i}]</b></font>
							</c:when>
							<c:otherwise>
								<font color="black"><b>[${i}]</b></font>
							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>
				<c:if test="${end < total_page}">
					<a href="BoardListAction.list?pageNum=${end+1}">다음</a>
				</c:if>
			</div>		
			

		

		
		
		
		
		</form>
		</div>
	</div>
	<jsp:include page="/footer.jsp"/>

</body>
</html>