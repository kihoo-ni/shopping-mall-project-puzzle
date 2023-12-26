<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<link rel="icon" href="./resources/images/favicon.PNG" type="image/x-icon">
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/write.css">
</head>
<body>
	<jsp:include page="/top-menu.jsp" />
	<h3 class="display-3" style="text-align: center; margin-top: 20px;">게시글 작성</h3>


	<div class="container">
		<form action="./BoardWriteAction.list" name="newWrite" method="post" enctype="multipart/form-data">
			<div class="main">
			
				<div class="margin-right">
					<input name="id" type="hidden" value="${id }" />
				</div>
				
				<div class="margin-right">
					<input name="nickname" type="hidden" value="${userdto.nickname }"/>
				</div>
				
				<div class="margin-right">
					제목<input name="title" type="text" size="71" required style="width: 577px;" />
				</div>
				
				<div class="margin-right">
					내용 <textarea class="area" name="content" rows="30" cols="79" required></textarea>
				</div>
				
				<div class="margin-right">
					첨부파일<input name="photo" type="file" />
				</div>
				
				<div class="center">
					<input class="submit_css" type="submit" value="작성">
				</div>
				
			</div>
		</form>
	</div>
	<jsp:include page="/footer.jsp" />
</body>
</html>