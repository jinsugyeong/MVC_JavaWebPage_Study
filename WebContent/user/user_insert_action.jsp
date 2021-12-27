<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.Connection" %>
<%@page import="kr.or.ksmart.driverdb.DriverDB" %>
<%@page import="kr.or.ksmart.dao.Mdao" %>

<%request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="m" class="kr.or.ksmart.dto.Member"/>
<jsp:setProperty name="m" property="*"/>
<%
	Connection conn = null;
	DriverDB db=new DriverDB();
	conn=db.driverDbcon();	
	Mdao mdao = new Mdao();
	mdao.mInsert(m, conn);
		
	response.sendRedirect(request.getContextPath() + "/msearch/m_search_list.jsp");


%>