<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="LoginCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="./resources/images/favicon.PNG" type="image/x-icon">
<link rel="stylesheet" href="./resources/css/layout.css" />
<link rel="stylesheet" href="./resources/css/mypage-right.css">
<link rel="stylesheet" href="./resources/css/info_layout.css" />
<script type="text/javascript" src="./resources/js/memberedit.js"></script>

<title>마이페이지_상품후기</title>
</head>
<body>
	<%@include file="top-menu.jsp" %>
   	<div>
		<div style="display: flex;">
			<div class="left-menu-bar-wrapper">
				<%@include file="mypage-left-menu.jsp" %>
			</div>
			<div class="myPage-right-box-wrapper">
				
				<div id="estimateBox" class="wrap-prd-estimate">
						<h3 class="title-box font-mss" style="font-weight: bold;">
							구매후기
						</h3>
						<div class="tabBox">
							<div class="tab active right_contents">
								<!-- wrap -->
								<div class="wrap review_list_detail" id="wrapEstimateList">
									<!-- //리스트-->
									<div class="review-list-wrap" id="reviewListFragment" style="border-top: none;">
										<c:forEach var="reviews" items="${reviews }">
										 <div class="review-list" style="border-top: 1px solid #ddd;">
												<div class="review-profile">
													<div class="review-profile__text-wrap">
														<div class="review-profile__text">
															<p class="review-profile__name">${reviews.nickName }</p>
															<p class="review-profile__date">${reviews.reviewcreated }</p>
														</div>
													</div>
												</div>
			
												<div class="review-goods-information">
													<div class="review-goods-information__thumbnail">
														<a href="#"
															class="review-goods-information__link"> <img style="width: -webkit-fill-available;" src="resources/images/${reviews.reviewImage }" alt="item" />
														</a>
													</div>
												</div>
			
												<div class="review-contents" review_type="goods_estimate"
													data-review-no="51674208" data-goods-no="3480493">
													<div class="review-contents__text"><textarea rows="3" cols="120" class="review-text" style="resize: none; overflow: inherit;" readonly>${reviews.reviewContent }</textarea><br>
													    <div style="text-align: right;"><a href="deletereview.product?reviewNumber=${reviews.reviewNumber }&productId=${reviews.productId}"><button class="delete-btn" type="button">삭제</button></a></div>
													</div>
												</div>
											</div>
							   			</c:forEach>
										
										<!-- //paging -->
										<div class="nslist_bottom">
											<div class="box_page_msg">1 페이지 중 1 페이지</div>
											<div class="pagination textRight">
												<div class="wrapper">
													<a class="paging-btn btn first" href="javascript:void(0);"
														onclick="ReviewPage.goFistPage(1, 1); return false;">&lt;&lt;</a>
													<a class="paging-btn btn prev" href="javascript:void(0);"
														onclick="ReviewPage.goPreviousPage(1, 1); return false;">&lt;</a>
													<a href="javascript:void(0);" class="paging-btn btn active"
														onclick="ReviewPage.goPage(1); return false;">1</a> <a
														class="paging-btn btn next" href="javascript:void(0)"
														onclick="ReviewPage.goNextPage(null, 1, 1); return false;">&gt;</a>
													<a class="paging-btn btn last"
														onclick="ReviewPage.goLastPage(1, 1, 1); return false;"
														href="javascript:void(0)">&gt;&gt;</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				<%-- <div class="myPage-right-box">
					<c:forEach var="reviews" items="${reviews }">
					 <div>
					 	<div>${reviews.nickName }_${reviews.reviewcreated }</div>
						<div><img src="resources/images/${reviews.reviewImage }" alt="item" /></div>
						<div>${reviews.reviewContent }</div>
						<div><a href="deletereviewfromMypage.product?reviewNumber=${reviews.reviewNumber }&productId=${reviews.productId}"><button type="button">삭제</button></a></div>
					 </div>
	   				</c:forEach>
				</div> --%>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>
