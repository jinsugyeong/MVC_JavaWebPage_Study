<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet"
	type="text/css">
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
	<%@ include file="/module/top.jsp"%>
	<%@ include file="/module/left.jsp"%>
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
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int num = 1;

			//1. 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");

			try {

				//2. DB연결
				String jdbcDriver = "jdbc:mysql://localhost:3306/db02jsg?" 
									+ "useUnicode=true&characterEncoding=euckr";
				String dbUser = "dbid02jsg";
				String dbPass = "dbpw02jsg";

				conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
				System.out.println(conn + " <-- conn   user_list.jsp");

				
				//3. select쿼리
				pstmt = conn.prepareStatement("select * from tb_user");
				System.out.println(pstmt + " <-- pstmt   user_list.jsp");

				//4. 쿼리 실행
				rs = pstmt.executeQuery();
				System.out.println(rs + " <-- rs   user_list.jsp");
				
				
				//System.out.println(rs.next() + " <-- rs.next()   user_list.jsp");


				//5. 쿼리 실행 결과 사용
				while (rs.next()) {
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
	<%@ include file="/module/hadan.jsp"%>
</body>
</html>