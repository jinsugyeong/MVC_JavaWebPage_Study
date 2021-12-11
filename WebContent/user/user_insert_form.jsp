<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>

			<h2>회원등록화면</h2>
			<br><br>
			<form action="<%=request.getContextPath() %>/user/user_list_insert.jsp" method="post">
				<label><span>아이디 : </span><input type="text" name="uid"></label>
				<label><span>비밀번호 : </span><input type="password" name="upw"></label>
				<label><span>이름 : </span><input type="text" name="uname"></label>
				<label><span>전화번호 : </span><input type="text" name="uphone"></label>
				<label><span>이메일 : </span><input type="text" name="uemail"></label>
				<button type="submit">회원가입</button>
			</form>

<%@ include file="/module/hadan.jsp" %>
</body>
</html>