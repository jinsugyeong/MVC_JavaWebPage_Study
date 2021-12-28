<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="kr.or.ksmart.dao.Udao" %>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="u" class="kr.or.ksmart.dto.User" />
<jsp:setProperty name="u" property="*" />
<%
	Udao udao = new Udao();
	udao.uUpdate(u);
	
	response.sendRedirect(request.getContextPath()+"/user/user_search_list.jsp");
%>