<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.or.ksmart.dao.Udao" %>
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
		<label><span>아이디 : </span><input type="text" name="u_id"><button type="button" onclick="idCheck()">중복검사</button></label>
		<label><span>비밀번호 : </span><input type="password" name="u_pw"></label>
		<span>권한 : </span>
		<label class="radio"><input type="radio" name="u_level" value="구매자"> 구매자</label>
		<label class="radio"><input type="radio" name="u_level" value="판매자"> 판매자</label>		
		<label><span>이름 : </span><input type="text" name="u_name"></label>
		<label><span>전화번호 : </span><input type="text" name="u_phone"></label>
		<label><span>이메일 : </span><input type="text" name="u_email"></label>
		<button type="button" id="joinBtn">회원가입</button>
	</form>

<script type="text/javascript">
	var f = document.getElementById('userform');
	var joinBtn = document.getElementById('joinBtn');
	function idCheck() {
		open('popup.html'
			,'팝업띄우기'
			,'width=300, height=400, left=100, top=100, scrollbar=no'
			);
	}
	
	
	btn.onclick = function(){
		var trimCheck = function(id, message){
			if(id.value.trim()==""){
				alert(message+' 입력하세요');
				id.focus();
				return false;
			}
		}
		
		if(trimCheck(f.u_id, '아이디를')==false)return;
		if(trimCheck(f.u_pw, '비밀번호를')==false)return;
		
		
	}	
<%
	String newId = request.getParameter("u_id");

	Udao udao = new Udao();
	udao.uSeleteUpdate(newId);
	
%>
</script>
<%@ include file="/module/hadan.jsp" %>
</body>
</html>

