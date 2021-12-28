<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.or.ksmart.dao.Udao" %>
<%@ page import="kr.or.ksmart.dto.User" %>
<%
String send_id = request.getParameter("send_id");

Udao udao = new Udao();
User u = udao.uSeleteUpdate(send_id);

String dbid = u.getU_id();
String dbpw = u.getU_pw();
String dblevel = u.getU_level();
String dbname = u.getU_name();
String dbphone = u.getU_phone();
String dbemail = u.getU_email();

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<h2>회원수정화면</h2>
<br><br>
<form action="<%=request.getContextPath() %>/user/user_update_action.jsp" method="post" id="userform">
	<label><span>아이디 : </span><input type="text" name="u_id" value="<%=dbid%>" readonly></label>
	<label><span>비밀번호 : </span><input type="password" name="u_pw" value="<%=dbpw%>" ></label>
<%
if(dblevel.equals("구매자")){
	%>
	<label class="radio">권한 :
		<input type="radio" name="u_level" value="구매자" checked="checked"> 구매자
		<input type="radio" name="u_level" value="판매자"> 판매자
	 </label>
	<%
}else if(dblevel.equals("판매자")){
	%>
	<label class="radio">권한 :
		<input type="radio" name="u_level" value="구매자" > 구매자
		<input type="radio" name="u_level" value="판매자" checked="checked"> 판매자
	 </label>
	<%
}else{
	//최고관리자, 관리자일 경우 수정하지 못하고 읽을수만 잇게
	%>
	<label><span>권한 : </span><input type="text" name="u_level" value="<%=dblevel%>" readonly></label>
	<%
}
%>
	<label><span>이름 : </span><input type="text" name="u_name" value="<%=dbname%>" ></label>
	<label><span>전화번호 : </span><input type="text" name="u_phone" value="<%=dbphone%>" ></label>
	<label><span>이메일 : </span><input type="text" name="u_email" value="<%=dbemail%>" ></label>
	<button type="submit">회원수정</button>
</form>
			

<%@ include file="/module/hadan.jsp" %>
</body>
</html>