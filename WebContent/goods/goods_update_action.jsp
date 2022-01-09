<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="kr.or.ksmart.dao.Gdao" %>
<%@ page import="kr.or.ksmart.dto.Goods" %>
<%
request.setCharacterEncoding("UTF-8");
String g_code = request.getParameter("gcode");
String g_name = request.getParameter("gname");
String g_cate = request.getParameter("gcate");
String g_price = request.getParameter("gprice");
String g_color = request.getParameter("gcolor");
String g_size = request.getParameter("gsize");
String g_desc = request.getParameter("gdesc");
	
	Goods g = new Goods();
	g.setG_code(g_code);
	g.setG_name(g_name);
	g.setG_cate(g_cate);
	g.setG_price(g_price);
	g.setG_color(g_color);
	g.setG_size(g_size);
	g.setG_desc(g_desc);
	//System.out.println(g.getG_name());
	
	Gdao gdao = new Gdao();
	gdao.gUpdate(g);
	
	response.sendRedirect(request.getContextPath()+"/goods/goods_admin.jsp");
	
%>