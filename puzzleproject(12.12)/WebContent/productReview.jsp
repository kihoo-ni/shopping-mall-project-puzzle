<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매후기</title>
</head>
<body>
	 <c:forEach var="reviews" items="${# }">
				<div>유저이름/ 글쓴날짜</div>
				<div><img src="resources/images/${#}" alt="item" /></div>
				<div>구매후기</div>
   	</c:forEach>
</body>
</html>