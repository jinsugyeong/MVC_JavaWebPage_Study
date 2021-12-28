<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="kr.or.ksmart.dao.Udao" %>
<%
	String send_id = request.getParameter("send_id");
	
	Udao udao = new Udao();
	udao.uDelete(send_id);
	
	response.sendRedirect(request.getContextPath()+"/user/user_search_list.jsp");
%>