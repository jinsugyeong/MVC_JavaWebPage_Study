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
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	String upw = request.getParameter("upw");
	String uname = request.getParameter("uname");
	String uphone = request.getParameter("uphone");
	String uemail = request.getParameter("uemail");
	
	System.out.println(uid + "<-- uid  user_update_form.jsp");
	System.out.println(upw + "<-- upw  user_update_form.jsp");
	System.out.println(uname + "<-- uname  user_update_form.jsp");
	System.out.println(uphone + "<-- uphone  user_update_form.jsp");
	System.out.println(uemail + "<-- uemail  user_update_form.jsp");
%>

			회원수정 화면<br/>
			<form action="<%=request.getContextPath()%>/user/user_list_update.jsp" method="post">
				아이디: <input type="text" name="uid" value="<%=uid %>" readonly>	<br/>
				비번: <input type="password" name="upw" value="<%=upw %>">	<br/>
				이름: <input type="text" name="uname" value="<%=uname %>">	<br/>
				전화번호: <input type="text" name="uphone" value="<%=uphone %>">	<br/>
				이메일: <input type="text" name="uemail" value="<%=uemail %>">	<br/>
				<input type="submit" name="회원수정버튼" value="회원수정버튼">	<br/>
			</form>
<%@ include file="/module/hadan.jsp" %>
</body>
</html>