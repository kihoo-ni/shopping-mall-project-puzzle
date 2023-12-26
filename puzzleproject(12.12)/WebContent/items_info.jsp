<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="./resources/images/favicon.PNG" type="image/x-icon">
<link rel="stylesheet" href="./resources/css/layout.css">
<link rel="stylesheet" href="./resources/css/main.css">
<link rel="stylesheet" href="./resources/css/info_img.css">
<link rel="stylesheet" href="./resources/css/info_layout.css">
<meta charset="UTF-8">
<title>상품 상세보기</title>
</head>
<body>

	<%@include file="top-menu.jsp"%>
	<div>
		<div style="display: flex;">
			<div class="left-menu-bar-wrapper">
				<%@include file="left-menu.jsp"%>
			</div>
			<div class="container">
				<div class="product_box">
					<div class="product_view">
						<form method="post">
							<input type="hidden" name="productId" value="${productdto.productId }"/>
							<input type="hidden" name="productName" value="${productdto.productName }"/>
							<input type="hidden" name="productUnitPrice" value="${productdto.productUnitPrice }"/>
							<input type="hidden" name="productInStock" value="${productdto.productInStock}"/>
							<input type="hidden" name="productImage" value="${productdto.productImage}"/>
							<h2>${productdto.productBrand } - ${productdto.productName }
					          		<c:if test="${productdto.productInStock eq 0}">
				                        <span style="color: red;"> (품절)</span>
				                    </c:if>
							</h2>
							<table>
								<colgroup>
									<col style="width: 180px"/>
									<col />
								</colgroup>
								<tbody>
									<tr>
										<th>판매가</th>
										<td class="product_price"><fmt:formatNumber value="${productdto.productUnitPrice }" pattern="#,###"/>원</td>
									</tr>
									<tr>
										<th>상품 코드</th>
										<td>${productdto.productId }</td>
									</tr>
									<tr>
										<th>브랜드</th>
										<td>${productdto.productBrand }</td>
									</tr>
									<tr>
										<th>구매 수량</th>
										<td>
											<div class="product_length">
												<input type="number" min="1" value="1" name="productNumber"/>
											</div>
										</td>
									</tr>
									<tr>
										<th>배송비</th>
										<td>무료 배송</td>
									</tr>
									<%-- <tr>
										<th>결제 금액</th>
										<td class="total_price"><b><fmt:formatNumber value="${productdto.productUnitPrice }" pattern="#,###"/></b>원</td>
									</tr> --%>
								</tbody>
							</table>
							<p style="color: red; text-align: center; margin-bottom: 5px;">${result }</p>
							<div class="img_box">
								<img class="info_img" src="./resources/images/${productdto.productImage }" alt="상세보기 이미지 예시" />
							</div>
							<c:if test="${not empty id and productdto.productInStock ge 1}">
								<div class="product_btn">
									<button class="basket-btn" type="submit" formaction="./addcart.product">장바구니</button>
									<button class="buy-btn" type="submit"  formaction="./listorder1.product">구매하기</button>
								</div>
							</c:if>
						</form>
					</div>
					
					<!-- 상품 설명 -->
					<div class="right_contents product_info_contents">
						<p class="title-box font-mss">
							Info<span class="korSub">정보</span>
						</p>
						<div class="n-report-wrap">
							<div class="n-report">
								<button type="button" class="btn-report"
									onclick="reportReviewsPop('/app/cs/report_pop/PRO/3480493')">
									<span>PUZZLE은 공정한 경쟁을 통한 신뢰 있는 상품을 제공하고자 합니다. 상품에 문제가 있는
										경우 알려 주세요.</span> <em>신고</em>
								</button>
							</div>
						</div>
						<div class="detail_product_info view-all" id="detail_view">
							<div class="detail_product_info_item">
								<img alt="쿠어(COOR) 하이넥 루프 니트 집업 (월넛브라운)"
									src="./resources/images/헤비웨이트_키홀_케이블_롱.jpg">
							</div>
						</div>
					</div>

					<div class="right_contents product_size_chart">
						<div class="tabBox">
							<h4 class="tit">사이즈 기준표</h4>
							<!-- tab -->
							<div class="tab_size">
								<span class="box-tab-btn tab-btn active" data-for="man">남성
									의류</span> <span class="box-tab-btn tab-btn" data-for="woman">여성
									의류</span> <span class="box-tab-btn tab-btn" data-for="kids">아동
									의류</span> <span class="box-tab-btn tab-btn" data-for="shose">신발일반</span>
								<span class="box-tab-btn tab-btn" data-for="kidsshose">신발아동</span>
							</div>
							<!-- //tab -->

							<!--남성 의류-->
							<div class="tab man active">
								<table class="table_standard">
									<colgroup>
										<col width="14.2%">
										<col width="14.2%">
										<col width="14.2%">
										<col width="14.2%">
										<col width="14.2%">
										<col width="14.2%">
										<col width="14.2%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">XS</th>
											<th scope="col">S</th>
											<th scope="col">M</th>
											<th scope="col">L</th>
											<th scope="col">XL</th>
											<th scope="col">XXL</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">한국</th>
											<td>85</td>
											<td>90</td>
											<td>95</td>
											<td>100</td>
											<td>105</td>
											<td>110</td>
										</tr>
										<tr class="bg">
											<th scope="row" rowspan="2">미국</th>
											<td>85-90</td>
											<td>90-95</td>
											<td>95-100</td>
											<td>100-105</td>
											<td>105-110</td>
											<td>110~</td>
										</tr>
										<tr class="bg">
											<td>14</td>
											<td>15</td>
											<td>15.5-16</td>
											<td>16.5</td>
											<td>17.5</td>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row" rowspan="2">일본</th>
											<td>S</td>
											<td>M</td>
											<td>L</td>
											<td>LL, XL</td>
											<td>-</td>
											<td>-</td>
										</tr>
										<tr>
											<td>36</td>
											<td>38</td>
											<td>40</td>
											<td>42</td>
											<td>44</td>
											<td>46</td>
										</tr>
										<tr class="bg">
											<th scope="row">영국</th>
											<td>0</td>
											<td>1</td>
											<td>2</td>
											<td>3</td>
											<td>4</td>
											<td>5</td>
										</tr>
										<tr>
											<th scope="row">프랑스</th>
											<td>40</td>
											<td>42, 44</td>
											<td>46, 48</td>
											<td>50, 52</td>
											<td>54, 56, 58</td>
											<td>60, 62</td>
										</tr>
										<tr class="bg">
											<th scope="row">유럽</th>
											<td>44-46</td>
											<td>46</td>
											<td>48</td>
											<td>50</td>
											<td>52</td>
											<td>54</td>
										</tr>
									</tbody>
								</table>
								<ul class="info_size">
									<li>인터내셔널 사이즈표입니다. 참고하시길 바랍니다.</li>
								</ul>
							</div>
							<!--//남성 의류-->

							<!--여성 의류-->
							<div class="tab woman"></div>
							<!--//여성 의류-->

							<!--아동 의류-->
							<div class="tab kids"></div>
							<!--//아동 의류-->

							<!--신발일반-->
							<div class="tab shose"></div>
							<!--//신발일반-->

							<!--신발아동-->
							<div class="tab kidsshose"></div>
							<!--//신발아동-->
						</div>
					</div>

					<div id="estimateBox" class="wrap-prd-estimate">
						<h3 class="title-box font-mss" style="font-weight: bold;">
							구매후기
						</h3>
						<div class="tabBox">
							<div class="tab active right_contents">
								<!-- wrap -->
								<div class="wrap review_list_detail" id="wrapEstimateList">
									<!-- //리스트-->
									<div class="review-list-wrap" id="reviewListFragment">
										<c:if test="${not empty id}">
										<form action="addreview.product" method="post" enctype="multipart/form-data" style="margin: 20px; display: flex;">
											<input type="hidden" name="productId" value="${productdto.productId }"/>
											<input type="hidden" name="nickName" value="${userdto.nickname }"/>
											<div>
												<textarea placeholder="후기를 입력해주세요" cols="100" rows="5"  name="reviewContent" class="review-write" required="required"></textarea>
											</div>
											<div style="margin-bottom: 20px;">
												<input type="file" name="reviewImage" class="review-file-upload"  required="required" > 
												<button type="submit" class="review-write-btn" style="margin-left: 25px;" >상품후기등록</button>			
											</div>
							  			</form>
										</c:if>
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
			
												<div style="display: flex;">
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
														    <c:if test="${id eq reviews.id }">
															    <div style="text-align: right;"><a href="deletereview.product?reviewNumber=${reviews.reviewNumber }&productId=${reviews.productId}"><button class="delete-btn" type="button">삭제</button></a></div>
														    </c:if>
														</div>
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
					<c:if test="${not empty id}">
					<div class="cs-box">
						<h3 class="title-box font-mss" style="font-weight: bold; margin-bottom: 20px;">Q&amp;A</h3>
			   			 <form action="./insertGuest_cs.guest" method="post" class="cs-form">
							<input class="cs-title" type="text" name="title" required placeholder="문의 제목">
					        <textarea class="cs-contents" name="content" rows="4" cols="50" required placeholder="문의 내용"></textarea>
					        <input class="cs-item-id" type="text" id="productId"  placeholder="상품 코드" value="상품코드 : &nbsp; ${productdto.productId }" readonly="readonly">
					        <input  type="hidden"  name="productId"  value="${productdto.productId }" >
					        <input class="cs-btn" type="submit" value="질문 등록">
					    </form>
		   			</div>
		   			</c:if>

					<!-- 판매자정보 -->
					<div class="section_sallerinfo_detail">
						<div class="sallerinfo_detail_cont">
							<div class="sallerinfo_detail">
								<div class="sallerinfo_detail_title">판매자정보</div>
								<div class="sallerinfo_detail_section">
									<div class="row">
										<dl>
											<dt>상호 / 대표자</dt>
											<dd>(주) PUZZLE / 이기훈</dd>
										</dl>
										<dl>
											<dt>브랜드</dt>
											<dd>쿠어</dd>
										</dl>
									</div>
									<div class="row">
										<dl>
											<dt>사업자번호</dt>
											<dd>1234567890</dd>
										</dl>
										<dl>
											<dt>통신판매업신고</dt>
											<dd>2023-광주북구-01023</dd>
										</dl>
									</div>
									<div class="row">
										<dl>
											<dt>연락처</dt>
											<dd>02-549-9073</dd>
										</dl>
										<dl>
											<dt>E-mail</dt>
											<dd>puzzle.official@gmail.com</dd>
										</dl>
									</div>
								</div>
								<div class="sallerinfo_detail_section_addr">
									<dl>
										<dt>영업소재지</dt>
										<dd>광주광역시 북구 호동로 6-6</dd>
									</dl>
								</div>
							</div>
							<p class="sallerinfo_detail">본 상품 정보의 내용은 공정거래위원회 ‘상품정보제공고시’
								에 따라 판매자가 직접 등록한 것으로 해당 정보에 대한 책임은 판매자에게 있습니다.</p>
							<div class="sallerinfo_detail">
								<div class="sallerinfo_detail_title">반송지정보</div>
								<div class="sallerinfo_detail_section_addr">
									<dl>
										<dt>교환 / 반품 주소</dt>
										<dd>광주광역시 북구 호동로 6-6 PUZZLE 물류창고</dd>
									</dl>
								</div>
							</div>
						</div>
					</div>
					<!-- //판매자정보 -->

					<!-- cs안내 -->
					<div class="cs-info-section">
						<div class="cs-info-tit">
							<div>
								<span class="txt-info">PUZZLE의 모든제품</span>은 정품으로 안심하시고 구매하셔도 됩니다.
							</div>
							<p>구매를 결정하시기 전 교환 및 환불 규정을 꼭 숙지하신 후 구매하시기 바랍니다.</p>
						</div>
						<div class="cs-info-cont">
							<div class="cs-info-block dlv-info-block">
								<div class="block-tit">
									<strong>배송</strong>관련
								</div>
								<div class="cs-cont">
									<div class="cont-label cont-tit">택배배송</div>
									<div class="cont-info">
										<ul>
											<li>1. PUZZLE은 <strong>전 상품 무료배송(가구 등 일부 상품 제외)</strong>입니다.
											</li>
											<li>2. 브랜드 및 제품에 따라 입점 업체(브랜드) 배송과 PUZZLE 자체 배송으로 나뉩니다.</li>
											<li>3. 결제확인 후 <strong>1~3일 정도 소요</strong>됩니다. (예약상품,
												해외배송 상품은 배송기간이 다를 수 있습니다.)
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="cs-info-block" style="padding-right: 40px;">
								<div class="block-tit">
									<strong>결제</strong>관련<span>각 상품은 카드, PUZZLE 적립금으로
										결제가 가능합니다. </span>
								</div>
								<div class="cs-cont">
									<div class="cont-label">카드결제</div>
									<div class="cont-info">
										<strong>전체 카드사 사용가능</strong> (일부 카드사 무이자 할부)
									</div>
								</div>



							</div>
							<div class="cs-info-block" style="padding-right: 40px;">
								<div class="block-tit">
									<strong>교환/환불</strong>
								</div>
								<div class="cs-cont">
									<div class="cont-tit">택배배송</div>
									<div class="cont-label">
										<strong>자동회수 택배사</strong>
									</div>
									<div class="cont-info">롯데택배</div>
									<div class="cont-label">
										<strong>배송비</strong>
									</div>
									<div class="cont-info">
										<p>왕복 6,000원(지역별 추가배송비(편도) : 제주 3,000원 / 제주 외 도서산간 3,000원)</p>
										<p>교환/환불 요청 상품의 수량에 따라서 상이, 구매자 책임 사유일 경우에만 발생</p>
									</div>
									<div class="cont-label">
										<strong>보내실 곳</strong>
									</div>
									<div class="cont-info">
										61190&nbsp;광주광역시 북구 호동로 6-6&nbsp;PUZZLE 물류창고
										<div class="n-btn-group">
											<a class="n-btn" href="/app/mypage/order_list_opt">교환 /
												환불 접수하기</a>
										</div>
									</div>
									<div class="cont-label">
										교환/환불 시<br>주의 사항
									</div>
									<div class="cont-info">
										<ul class="n-info-txt">
											<li>상품 수령 후 7일 이내 교환/환불을 요청해야 합니다.</li>
											<li>동일 업체일 경우라도 상품별로 반품비용이 상이하게 발생할 수 있습니다.</li>
											<li>교환/환불 시 반품비용은 선결제함으로 동봉하지 마시고, 동봉하여 발송하신 경우 확인 후 반품비
												환불 처리됩니다.</li>
											<li>고객님의 사유로 교환 진행 중인 상품이 품절될 경우, 반품비가 발생될 수 있으며 이를 제외한
												결제금액이 환불 처리됩니다.</li>
											<li>자동회수 접수 시 영업일 기준 2~3일 내에 택배기사님 연락 후 방문하여 회수 진행됩니다.</li>
											<li>자동회수 미지원 업체 및 직접발송의 경우 수령하신 택배사로 착불(신용)로 반품 접수하여 발송
												부탁드리겠습니다.</li>
											<li>수령하신 택배사가 아닌 다른 택배사로 발송하시는 경우(신규 택배 접수 포함) 추가 비용이 발생
												할 수 있습니다.</li>
											<li>반품 주소지는 브랜드(업체)마다 다르므로 확인 후 각각 보내셔야 합니다.</li>
											<li>상품의 내용이 표시, 광고 내용과 다르거나 계약 내용이 다를 경우 상품을 공급받은 날부터
												3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 내 청약 철회를 할 수 있습니다.</li>
											<li>상품을 반환받은 날로부터 영업일 기준 3일 내 지급받은 대금을 환급합니다.</li>
											<li>미성년자가 체결한 계약은 법정대리인이 동의하지 않는 경우 본인 또는 법정대리인이 취소할 수
												있습니다.</li>
											<li>도서산간 지역의 경우 결제하신 기본 교환/환불 배송비 외에 편도 기준 최대 8천원(왕복 기준
												최대 16천원)까지 추가 비용이 발생할 수 있습니다. 택배사, 판매업체, 지역별로 도서산간 발생 금액이
												상이해 구매 시점에서는 정확한 금액 안내가 어렵습니다.</li>

										</ul>
									</div>
									<div class="cont-label">
										교환/환불이<br>불가능한 경우
									</div>
									<div class="cont-info">
										<ul class="n-info-txt">
											<li>반품 요청 기간(수령 후 7일 이내)이 경과한 경우</li>
											<li>상품을 사용(또는 착용, 착화) 혹은 훼손하여 재판매가 어려울 정도로 상품가치가 현저히 감소한
												경우</li>
											<li>상품의 택(Tag) 또는 라벨 제거, 분리, 분실, 훼손하거나<br>세트 구성품을
												누락한 경우
											</li>
											<li>신발 브랜드 박스를 분실하거나 훼손(오염, 테이핑 등)한 경우<br>(상품 확인
												목적으로 단순 개봉한 경우는 제외)
											</li>
											<li>상품을 설치/장착하거나 전원을 연결한 경우(테크, 가전 제품 등)</li>
											<li>고객의 주문에 따라 개별적으로 생산된 상품인 경우(맞춤 주문 제작 상품 등)</li>
										</ul>
										<div class="packing-img"></div>
									</div>
								</div>
							</div>
							<div class="cs-info-block">
								<div class="block-tit">
									<strong>고객센터</strong>
								</div>
								<div class="cs-cont">
									<div class="cont-label font-mss">062-223-0114</div>
									<div class="cont-info">
										<div>
											상품 문의 &gt; 각 상품 Q&amp;A 이용<br>평일 10:00~18:00 / 토,일,공휴일
											휴무
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- //cs안내 -->


				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>

</body>
</html>