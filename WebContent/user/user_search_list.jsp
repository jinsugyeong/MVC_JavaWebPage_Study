<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="kr.or.ksmart.dao.Udao"%>
<%@ page import="kr.or.ksmart.dto.User"%>
<%@ page import="java.util.ArrayList"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<%@ include file="/user/user_search_form.jsp" %>
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
	text-align: center;
}

tr:nth-child(even) {
	background-color: #efefef;
}
</style>
<br><br>
<table>
		<tr>
			<th>no</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>권한</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
<%
request.setCharacterEncoding("UTF-8");
String sk = request.getParameter("sk");
String sv = request.getParameter("sv");

System.out.println(sk + " <-- 넘어온 sk값 user_search_list.jsp");
System.out.println(sv + " <-- 넘어온 sv값 user_search_list.jsp");

int num = 1;
Udao udao = new Udao();
ArrayList<User> alu = udao.uSearch(sk, sv);
System.out.println(alu.size()+" <--검색행 갯수");


for(int i =0; i<alu.size(); i++){
	User u = alu.get(i);
%>
	<tr>
		<td><%=num%></td>
		<td><%=u.getU_id()%></td>
		<td><%=u.getU_pw()%></td>
		<td><%=u.getU_level()%></td>
		<td><%=u.getU_name()%></td>
		<td><%=u.getU_phone()%></td>
		<td><%=u.getU_email()%></td>
		<td><a href="<%=request.getContextPath()%>/user/user_update_form.jsp?send_id=<%=u.getU_id()%>">수정버튼</a></td>
		<td><a href="<%=request.getContextPath()%>/user/user_delete_action.jsp?send_id=<%=u.getU_id()%>">삭제버튼</a></td>
	</tr>
<%
num++;
}
%>

</table>
<%@ include file="/module/hadan.jsp" %>
</body>
</html>