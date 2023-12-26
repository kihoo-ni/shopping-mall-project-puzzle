<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="SellerCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>

 <script>
        function updateSubCategories() {
            var mainCategory = document.getElementById("mainCategory").value;
            var subCategorySelect = document.getElementById("subCategory");

            // 모든 옵션 제거
            subCategorySelect.innerHTML = "";

            // 대분류에 따라 소분류 옵션 추가
            if (mainCategory === "상의") {
            	//첫번째 select(하위), 두번째 value, 세번째 user에게 보여짐
                addOption(subCategorySelect, "니트", "니트");
                addOption(subCategorySelect, "맨투맨", "맨투맨");
                addOption(subCategorySelect, "셔츠", "셔츠");
                addOption(subCategorySelect, "후드티셔츠", "후드티셔츠");
            } else if (mainCategory === "아우터") {
            	addOption(subCategorySelect, "코트", "코트");
                addOption(subCategorySelect, "패딩", "패딩");
                addOption(subCategorySelect, "블루종", "블루종");
                addOption(subCategorySelect, "기타아우터", "기타아우터");
			}
            // 다른 대분류에 대한 소분류 추가는 여기에 계속해서 추가할 수 있습니다.
        }

        function addOption(selectElement, value, text) {
            var option = document.createElement("option");
            option.value = value;
            option.text = text;
            selectElement.add(option);
        }
        
        // 페이지 로드 시 초기화
        document.addEventListener("DOMContentLoaded", function () {
            updateSubCategories();
        });
    </script>
<script type="text/javascript" src="./resources/js/addproduct.js"></script>
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/seller-productadd.css">
</head>
<body>
<%@include file="top-menu.jsp"%>
    <div class="container"  style="margin: 0 auto; height: 1000px; width: 600px;">
        <div class="row">
            <div class="col-lg-3 col-md-2"></div>
            <div class="col-lg-6 col-md-8 login-box">
                <div class="col-lg-12 login-title">
                    상품 등록
                </div>

                <div class="col-lg-12 login-form">
                    <div class="col-lg-12 login-form">
                      <form name="newProduct" action="./addproduct.product" class="#" method="post" enctype="multipart/form-data">
                          
                            <div class="form-group">
                                <label class="form-control-label">상품코드</label>
                                <input type="text" name="productId" class="form-control" required="required">
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">상품명</label>
                                <input type="text" name="productName" class="form-control" required="required">
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">상품가격</label>
                                <input type="text" name="productUnitPrice" class="form-control" required="required" placeholder="숫자만입력하세요" onkeypress="return validateNumberInput(event)">
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">상품설명</label>
                                <input type="text" name="productDescription" class="form-control" required="required">
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">브랜드</label>
                                <input type="text" name="productBrand" class="form-control" required="required">
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">카테고리[대분류]</label>
                                 <div class="#">
						            <select id="mainCategory" name="productCategory1" onchange="updateSubCategories()" required="required">
						                <option value="상의">상의</option>
						                <option value="아우터">아우터</option>
						                <option value="바지">바지</option>
						                <option value="신발">신발</option>
						                <option value="악세사리">악세사리</option>
						            </select>
		       					 </div>
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">카테고리[소분류]</label>
                                 <div class="#">
						            <select id="subCategory" name="productCategory2" required="required">
						                <!-- 소분류 옵션은 JavaScript에서 동적으로 추가됩니다. -->
						            </select>
		       					 </div>
                            </div>
                             <div class="form-group">
                                <label class="form-control-label">재고개수</label>
                                <input type="number"  name="productInStock" class="form-control" required="required" style="border: 1px solid black; width: 40px;" >
                            </div>
                             <div class="form-group">
                                <label class="form-control-label">상품사진</label>
                                <input type="file" name="productImage" class="form-control" required="required"  style="margin-bottom: 12px;"   >
                            </div>
                            
                            <div class="col-lg-12 loginbttm">
                                <div class="col-lg-6 login-btm login-text">
                                      <p style="color: red;">${warn }</p>
                                </div>
                                <div class="col-lg-6 login-btm login-button">
                                    <button type="submit" class="btn btn-outline-primary">등록</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-3 col-md-2"></div>
            </div>
        </div>
	</div>



<%@include file="footer.jsp"%>
</body>
</html>