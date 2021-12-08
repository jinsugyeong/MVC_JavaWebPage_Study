<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css" />
<!-- 
절대경로 사용시 
ip주소,도메인, port 번호, 프로토콜 등이 바뀌면 경로를 모두 수정해야한다.
 -->
</head>

<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
			회원가입 화면<br/>
			<form action="<%=request.getContextPath()%>/user/user_list_insert.jsp" method="post">
				아이디: <input type="text" name="uid">	<br/>
				비번: <input type="password" name="upw">	<br/>
				이름: <input type="text" name="uname">	<br/>
				전화번호: <input type="text" name="uphone">	<br/>
				이메일: <input type="text" name="uemail">	<br/>
				<input type="submit"  value="회원가입버튼">	<br/>
			</form>
<%@ include file="/module/hadan.jsp" %>
</body>
</html>