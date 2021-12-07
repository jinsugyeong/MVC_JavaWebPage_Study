<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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

	<!-- Begin Wrapper -->
	<div id="wrapper">

		<!-- Begin Header -->
		<div id="header">

			상단 메뉴 <br /> <br /> 
			<a href="<%=request.getContextPath()%>/user/user_insert_form.jsp">01회원가입</a>
			<a href="<%=request.getContextPath()%>/user/user_list.jsp">02전체회원조회</a>
			<a href="#">03상품등록</a>
			<a href="#">04상품검색</a>

		</div>
		<!-- End Header -->

		<!-- Begin Left Column -->
		<div id="leftcolumn">
			왼쪽 메뉴
		</div>
		<!-- End Left Column -->

		<!-- Begin Right Column -->
		<div id="rightcolumn">
			회원수정 화면<br/>
			<form action="<%=request.getContextPath()%>/user/user_list_update.jsp" method="post">
				아이디: <input type="text" name="uid" value="id002" readonly>	<br/>
				비번: <input type="password" name="upw" value="pw002">	<br/>
				이름: <input type="text" name="uname" value="이길동">	<br/>
				전화번호: <input type="text" name="uphone" value="010-0000-0002">	<br/>
				이메일: <input type="text" name="uemail" value="email02@email.com">	<br/>
				<input type="submit" name="회원수정버튼" value="회원수정버튼">	<br/>
			</form>

		</div>
		<!-- End Right Column -->

		<!-- Begin Footer -->
		<div id="footer">

			하단 메뉴<br /> 
			한국스마트정보교육원 063-717-1008 ksmart.or.kr

		</div>
		<!-- End Footer -->

	</div>
	<!-- End Wrapper -->

</body>
</html>