<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
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
	<label><input type="checkbox" name="sort" value="g_date" checked>등록날짜</label>
	<label><input type="checkbox" name="sort" value="g_cate">카테고리</label>
	<label><input type="checkbox" name="sort" value="g_name">이름</label>
	<label><input type="checkbox" name="sort" value="g_price">가격</label>
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
    <th>상세설명</th>
    <th>수정</th>
    <th>삭제</th>    
  </tr>
  
<%
String[] sort = request.getParameterValues("sort");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String id = (String)session.getAttribute("S_ID");
String sq = "SELECT * FROM tb_goods join tb_member on tb_goods.m_id=tb_member.m_id where tb_member.m_id=?";



//1단계 드라이버로딩
Class.forName("com.mysql.jdbc.Driver");

try{
	//2단계 DB연결
	String jdbcDriver = "jdbc:mysql://localhost:3306/dev42db?" +
				"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev42id";
	String dbPass = "dev42pw";
		
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	
	//3단계
	//조건은 로그인한 사람 아이디, 정렬을 order by로 check box한 문자열 가져와야함
	
	
	if(sort == null){
		System.out.println("그냥");
		pstmt = conn.prepareStatement(sq);
		pstmt.setString(1, id);
	}
	
	
	
	System.out.println(pstmt + " <--쿼리문 확인");
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
					<td><%= rs.getString("g_desc")%></td>
					<td>
		<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?send_id=<%= rs.getString("m_id")%>">수정</a>			
					</td>
					<td>
		<a href="<%= request.getContextPath() %>/mdelete/m_delete_action.jsp?send_id=<%= rs.getString("m_id")%>">삭제</a>			
					</td>	
				</tr>
		<%		
			}
	
}catch(SQLException ex){
	out.println(ex.getMessage());
	ex.printStackTrace();
}finally{
	// 6단계 사용한 Statement 종료
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	
	// 7. 커넥션 종료
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
  
</table>
<%@ include file="/module/hadan.jsp" %>		 
</body>
</html>