<%@page import="productDTO.productDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="productDAO.productDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	productDAO productdao= new productDAO();
	ArrayList<productDTO> productlist = new ArrayList<productDTO>();
	productlist=productdao.getAllProduct();
	session.setAttribute("productlist", productlist);
	
%>
<link rel="stylesheet" href="resources/css/main-items.css">
<div class="container">
<div class="container-subject">
</div>
<ul class="items-wrapper">
    <c:forEach var="product" items="${productlist}" begin="0" end="4">
       <li class="items" style="padding-left: 30px; padding-right: 30px;">
           <div>
               <div class="item-box">
                   <a href="./view.search?productId=${product.productId}"><img src="resources/images/${product.productImage}" alt="item" /></a>
               </div>
               <p class="brand">${product.productBrand}   
                   <c:if test="${product.productInStock eq 0}">
                       <span style="color: red;"> (품절)</span>
                   </c:if>
               </p>
               <p class="item-name"><a href="./view.search?productId=${product.productId}">${product.productName}</a></p>
               <p class="item-price"><fmt:formatNumber value="${product.productUnitPrice}" pattern="#,###"/>원</p>
           </div>
       </li>
   </c:forEach>
  </ul>
</div>


