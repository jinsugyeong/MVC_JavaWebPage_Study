<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet" type="text/css">
<style type="text/css">
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}
</style>
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>

			<h2>04 전체 회원 (삭제 후 1명)</h2>
			<br>
			<table>
				<tr>
					<th>no</th>
					<th>아이디</th>
					<th>비번</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>수정</th>
    				<th>삭제</th>
				</tr>
				<tr>
					<td>01</td>
					<td>id001</td>
					<td>pw001</td>
					<td>일길동</td>
					<td>010-0000-0001</td>
					<td>email01@email.com</td>
					<td><a href="#"><button type="submit" class="btn">수정</button></a></td>
    				<td><a href="#"><button type="submit" class="btn">삭제</button></a></td>
				</tr>

			</table>

<%@ include file="/module/hadan.jsp" %>
</body>
</html>