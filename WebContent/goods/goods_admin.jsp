<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="kr.or.ksmart.dao.Gdao" %>
<%@ page import="kr.or.ksmart.dto.Goods" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" /> 
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
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>	
<form action="<%=request.getContextPath() %>/goods/goods_admin.jsp" method="post">
	<b>정렬기준</b>
	<label><input type="checkbox" name="sort" value="g.g_date" checked>등록날짜</label>
	<label><input type="checkbox" name="sort" value="g.g_cate">카테고리</label>
	<label><input type="checkbox" name="sort" value="g.g_name">이름</label>
	<label><input type="checkbox" name="sort" value="g.g_price">가격</label>
	<input type="submit" value="정렬">
</form>
<br>
<table border="1" width="100%">
  <tr>
    <th>카테고리</th>
    <th>상품명</th>
    <th>가격</th>
    <th>색상</th>
    <th>사이즈</th>
    <th>등록날짜</th>
    <th>수정</th>
    <th>삭제</th>    
  </tr>
  
<%
String[] sort = request.getParameterValues("sort");
String id = (String)session.getAttribute("S_ID"); //로그인 아이디
Gdao gdao = new Gdao();
ArrayList<Goods> alu = gdao.gAdmin(sort, id);

for(int i=0; i<alu.size(); i++){
	Goods g = alu.get(i);
	%>
	<tr>
		<td><%=g.getG_cate() %></td>
		<td><%=g.getG_name() %></td>
		<td><%=g.getG_price() %></td>
		<td><%=g.getG_color() %></td>
		<td><%=g.getG_size() %></td>
		<td><%=g.getG_date() %></td>
		<td><a href="<%= request.getContextPath() %>/goods/goods_update_form.jsp?send_gcode=<%=g.getG_code()%>">수정</a></td>
		<td><a href="<%= request.getContextPath() %>/goods/goods_delete_action.jsp?send_gcode=<%=g.getG_code()%>">삭제</a></td>	
	</tr>
	<%
}
%>

  
</table>
<%@ include file="/module/hadan.jsp" %>		 
</body>
</html>