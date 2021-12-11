<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String admin = (String) session.getAttribute("S_LEVEL");
	
if(admin == "최고관리자") {		
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/superadmin_contents.jsp" %>
<%
} else if (admin == "관리자") {
%>
<script type="text/javascript">
				alert('접근권한이 없습니다.');
				location.href='<%=request.getContextPath()%>/index.jsp';
</script>
<%
}
%>
