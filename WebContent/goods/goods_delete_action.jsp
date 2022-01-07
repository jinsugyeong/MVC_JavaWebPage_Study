<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="kr.or.ksmart.dao.Gdao" %>
<%
	String send_gcode = request.getParameter("send_gcode");
	
	Gdao gdao = new Gdao();
	gdao.gDelete(send_gcode);
	
	response.sendRedirect(request.getContextPath()+"/goods/goods_admin.jsp");
	
%>