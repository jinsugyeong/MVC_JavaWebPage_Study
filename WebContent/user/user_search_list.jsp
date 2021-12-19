<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>

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

System.out.println(sk + " <-- 넘어온 sk값 user_search_action.jsp");
System.out.println(sv + " <-- 넘어온 sv값 user_search_action.jsp");

//1 드라이버 로딩
Class.forName("com.mysql.jdbc.Driver");

Connection conn=null;
PreparedStatement pstmt = null;
ResultSet rs = null;
int num = 1;
String selectQuery = "SELECT * FROM tb_user";

try{
	//2 DB연결
	String jdbcDriver ="jdbc:mysql://localhost:3306/db02jsg?" + "useUnicode=true&characterEncoding=utf8";
	String jdbcUser = "dbid02jsg";
	String jdbcPass = "dbpw02jsg";
	
	conn = DriverManager.getConnection(jdbcDriver, jdbcUser, jdbcPass);
	
	
	//3 쿼리실행준비 (쿼리작성)
	if(sk==null && sv==null) {
		System.out.println("1-1 sk와 sv 모두 null 일때");
		//SELECT * FROM tb_user
		pstmt = conn.prepareStatement(selectQuery);
		
	}else if(sk!=null && sv=="") {
		System.out.println("1-2 sk엔 값이 있고 sv는 공백일 때");
		//SELECT * FROM tb_user + 경고창
		pstmt = conn.prepareStatement(selectQuery);
%>
<script type="text/javascript">
	alert('검색할 내용을 입력하세요');
</script>
<%
		
	}else{
		System.out.println("1-3 sk와 sv 모두 null이 아닐때");
		//SELECT * FROM tb_user WHERE u_id=?
		//SELECT * FROM tb_user WHERE u_level=?
		//SELECT * FROM tb_user WHERE u_name=?
		//SELECT * FROM tb_user WHERE u_phone=?
		//SELECT * FROM tb_user WHERE u_email=?
		pstmt = conn.prepareStatement(selectQuery+" WHERE "+sk+"=?");
		pstmt.setString(1, sv);
		
	}
	System.out.println(pstmt + " <--작성된 쿼리문 확인하기");
	
	//4 쿼리 실행
	rs = pstmt.executeQuery();
	
	
	//5 쿼리 실행결과 사용하기
	while(rs.next()){
%>
		<tr>
			<td><%=num%></td>
			<td><%=rs.getString("u_id")%></td>
			<td><%=rs.getString("u_pw")%></td>
			<td><%=rs.getString("u_level")%></td>
			<td><%=rs.getString("u_name")%></td>
			<td><%=rs.getString("u_phone")%></td>
			<td><%=rs.getString("u_email")%></td>
			<td><a href="<%=request.getContextPath()%>/user/user_update_form.jsp?send_id=<%=rs.getString("u_id")%>">수정버튼</a></td>
			<td><a href="<%=request.getContextPath()%>/user/user_delete_action.jsp?send_id=<%=rs.getString("u_id")%>">삭제버튼</a></td>
		</tr>
<%
		num++;
	}
	
} catch (SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	// 6. 사용한 Statement 종료
	if (rs != null) try {rs.close();} catch (SQLException ex) {}
	if (pstmt != null) try {pstmt.close();} catch (SQLException ex) {}

	// 7. 커넥션 종료
	if (conn != null)try {conn.close();} catch (SQLException ex) {}
}


%>
</table>
<%@ include file="/module/hadan.jsp" %>
</body>
</html>

