<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.or.ksmart.dto.Goods" %>
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
	String g_code= gdao.getMaxGoodsCode();
	
	Goods g = new Goods();
	g.setG_code(g_code);
	g.setU_id(u_id);
	g.setG_name(g_name);
	g.setG_cate(g_cate);
	g.setG_price(g_price);
	g.setG_color(g_color);
	g.setG_size(g_size);
	g.setG_desc(g_desc);
	
	gdao.gInsert(g);
	response.sendRedirect(request.getContextPath() + "/goods/goods_admin.jsp");
	
%>