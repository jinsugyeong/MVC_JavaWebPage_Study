<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String ss = (String) session.getAttribute("S_LEVEL");
%>
<!DOCTYPE html>
<!-- Begin Wrapper -->
<div id="wrapper">
	<!-- Begin Left Column -->
	<div id="leftcolumn">
		왼쪽메뉴
		<br><br>
		<%
			if(ss =="관리자" || ss =="최고관리자") {
		%>
		<h2><a href="<%=request.getContextPath() %>/superadmin/superadmin_index.jsp" style="color:#999; border-bottom:4px solid #F2F2E6; width: 170px; ">05최고관리자메뉴</a></h2>
		<%
			} 
		%>
	</div>
	<!-- End Left Column -->

	<!-- Begin Contents -->
	<div id="Contents">