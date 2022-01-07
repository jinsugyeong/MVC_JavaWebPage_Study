<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="kr.or.ksmart.dao.Gdao" %>
<%
request.setCharacterEncoding("UTF-8");
String u_id = request.getParameter("u_id");
String g_name = request.getParameter("gname");
String g_cate = request.getParameter("gcate");
String g_price = request.getParameter("gprice");
String g_color = request.getParameter("gcolor");
String g_size = request.getParameter("gsize");
String g_desc = request.getParameter("gdesc");

	Gdao gdao = new Gdao();
	
%>