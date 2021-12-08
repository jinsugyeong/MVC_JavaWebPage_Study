<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String S_LEVEL2 = (String)session.getAttribute("S_LEVEL");
	
	if(S_LEVEL2 == "최고관리자") {
		%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css" />
</head>

<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>

			superadmin_index.jsp 메인 화면<br /> 

<%@ include file="/module/hadan.jsp" %>
</body>
</html>
		<%
	}else {
		%>
<script type="text/javascript">
	alert('접근할 수 없습니다');
	location.href='<%=request.getContextPath() %>/index.jsp';
</script>		
		<%
	}
%>