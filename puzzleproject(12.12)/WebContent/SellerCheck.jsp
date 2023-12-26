<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	if(session.getAttribute("id") == null ){
			JSFunction.alertLocation("로그인 후 이용하세요", "login.jsp", out);
			return;
		} else if( !session.getAttribute("id").equals("seller")){
			JSFunction.alertLocation("판매자만 접근가능합니다.", "welcome.jsp", out);
			return;
		}
	
	
%> 
