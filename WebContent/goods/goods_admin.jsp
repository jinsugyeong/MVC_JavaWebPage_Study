<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main2.css" /> 
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
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String id = (String)session.getAttribute("S_ID"); //로그인 아이디
String sq = "SELECT * FROM tb_goods AS g JOIN tb_member AS m ON g.m_id=m.m_id where m.m_id=?";

//1단계 드라이버로딩
Class.forName("com.mysql.jdbc.Driver");


//2단계 DB연결
String jdbcDriver = "jdbc:mysql://localhost:3306/dev42db?" +
			"useUnicode=true&characterEncoding=euckr";
String dbUser = "dev42id";
String dbPass = "dev42pw";
	
conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

//3단계
//조건은 로그인한 사람 아이디, 정렬을 order by로 check box한 문자열 가져와야함
if(sort != null){
	sq += " order by ";
	for(int i=0; i<sort.length; i++){
		if(sort.length==1){
			sq += sort[i];
		}else{
			sq += (i!=sort.length-1) ? sort[i]+"," : sort[i];
		}
	}
	
}
pstmt = conn.prepareStatement(sq);
pstmt.setString(1, id);
System.out.println(pstmt + " <--쿼리문 확인");

//4단계 쿼리실행
rs = pstmt.executeQuery();

while(rs.next()){
	%>
	<tr>
		<td><%= rs.getString("g_cate")%></td>
		<td><%= rs.getString("g_name")%></td>
		<td><%= rs.getString("g_price")%></td>
		<td><%= rs.getString("g_color")%></td>
		<td><%= rs.getString("g_size")%></td>
		<td><%= rs.getString("g_date")%></td>
		<td><a href="<%= request.getContextPath() %>/goods/goods_update_action.jsp?send_id=<%= rs.getString("m_id")%>">수정</a></td>
		<td><a href="<%= request.getContextPath() %>/goods/goods_delete_action.jsp?send_id=<%= rs.getString("m_id")%>">삭제</a></td>	
	</tr>
	<%
}
%>

  
</table>
<%@ include file="/module/hadan.jsp" %>		 
</body>
</html>