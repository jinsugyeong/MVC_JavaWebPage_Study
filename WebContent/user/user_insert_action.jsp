<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.Connection" %>
<%@ page import = "kr.or.ksmart.dao.Udao" %>

<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="u" class="kr.or.ksmart.dto.User"/>
<jsp:setProperty name="u" property="*"/>
<%
	Udao udao = new Udao();
	udao.uInsert(u);
		
	response.sendRedirect(request.getContextPath() + "/user/user_search_list.jsp");
%>