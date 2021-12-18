<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
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
<%
String send_id = request.getParameter("send_id");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;


String dbid = null;
String dbpw = null;
String dblevel = null;
String dbname = null;
String dbphone = null;
String dbemail = null;

//1. 드라이버 로딩
Class.forName("com.mysql.jdbc.Driver");

try{
	
	//2. DB연결
	String jdbcDriver = "jdbc:mysql://localhost:3306/db02jsg?" +
			"useUnicode=true&characterEncoding=utf8";
	String dbUser = "dbid02jsg";
	String dbPass = "dbpw02jsg";
	
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	
	//3. select 쿼리
	pstmt = conn.prepareStatement("select * from tb_user where u_id=?");
	pstmt.setString(1, send_id);
	System.out.print(pstmt + " <--완성된 쿼리문");
	
	//4. 쿼리 실행
		rs = pstmt.executeQuery();
	
	//5. 쿼리 실행 결과 사용
	if(rs.next()){
		dbid = rs.getString("u_id");
		dbpw = rs.getString("u_pw");
		dblevel = rs.getString("u_level");
		dbname = rs.getString("u_name");
		dbphone = rs.getString("u_phone");
		dbemail = rs.getString("u_email");
	}
	
	
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	// 6. 사용한 Statement 종료
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	
	// 7. 커넥션 종료
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
<h2>회원수정화면</h2>
<br><br>
<form action="<%=request.getContextPath() %>/user/user_update_action.jsp" method="post">
	<label><span>아이디 : </span><input type="text" name="uid" value="<%=dbid%>" readonly></label>
	<label><span>비밀번호 : </span><input type="password" name="upw" value="<%=dbpw%>" ></label>
<%
if(dblevel.equals("구매자")){
	%>
	<label class="radio">권한 :
		<input type="radio" name="ulevel" value="구매자" checked="checked"> 구매자
		<input type="radio" name="ulevel" value="판매자"> 판매자
	 </label>
	<%
}else if(dblevel.equals("판매자")){
	%>
	<label class="radio">권한 :
		<input type="radio" name="ulevel" value="구매자" > 구매자
		<input type="radio" name="ulevel" value="판매자" checked="checked"> 판매자
	 </label>
	<%
}else{
	//최고관리자, 관리자일 경우 수정하지 못하고 읽을수만 잇게
	%>
	<label><span>권한 : </span><input type="text" name="ulevel" value="<%=dblevel%>" readonly></label>
	<%
}
%>
	<label><span>이름 : </span><input type="text" name="uname" value="<%=dbname%>" ></label>
	<label><span>전화번호 : </span><input type="text" name="uphone" value="<%=dbphone%>" ></label>
	<label><span>이메일 : </span><input type="text" name="uemail" value="<%=dbemail%>" ></label>
	<button type="submit">회원수정</button>
</form>
			

<%@ include file="/module/hadan.jsp" %>
</body>
</html>