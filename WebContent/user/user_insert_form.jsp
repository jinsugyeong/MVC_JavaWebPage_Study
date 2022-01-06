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
	<form action="<%=request.getContextPath() %>/user/user_insert_action.jsp" method="post" id="userform">
		<label><span>아이디 : </span><input type="text" name="u_id"></label>
		<label><span>비밀번호 : </span><input type="password" name="u_pw"></label>
		<label class="radio">권한 :
			<input type="radio" name="u_level" value="구매자"> 구매자
			<input type="radio" name="u_level" value="판매자"> 판매자
		 </label>				
		<label><span>이름 : </span><input type="text" name="u_name"></label>
		<label><span>전화번호 : </span><input type="text" name="u_phone"></label>
		<label><span>이메일 : </span><input type="text" name="u_email"></label>
		<button type="submit">회원가입</button>
	</form>

<%@ include file="/module/hadan.jsp" %>
</body>
</html>

