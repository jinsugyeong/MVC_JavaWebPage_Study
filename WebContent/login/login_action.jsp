<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
System.out.println(id + "<--id  login_action.jsp");
System.out.println(pw + "<--pw  login_action.jsp");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;


String dbid =null;
String dbpw = null;

String dbname = null;
String level = null;

String alert = null;


//1. 드라이버 로딩
Class.forName("com.mysql.jdbc.Driver");

try {

	//2. DB연결
	String jdbcDriver = "jdbc:mysql://localhost:3306/db02jsg?" 
						+ "useUnicode=true&characterEncoding=euckr";
	String dbUser = "dbid02jsg";
	String dbPass = "dbpw02jsg";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	
	//3 쿼리작성
	pstmt = conn.prepareStatement("SELECT * FROM tb_user WHERE u_id=?");
	pstmt.setString(1, id);
	
	//쿼리실행
	rs = pstmt.executeQuery();
	
	/* 아이디일치불일치조건비교 */
	if(rs.next()) {
		System.out.println("1-1 아이디 일치");
		dbid =rs.getString("u_id");
		dbpw = rs.getString("u_pw");
		dbname = rs.getString("u_name");
		level = rs.getString("u_level");
		System.out.println(dbid + " <-- dbid 확인");
		System.out.println(dbpw + " <-- dbpw 확인");
		System.out.println(dbname + " <-- dbname 확인");
		System.out.println(level + " <-- level 확인");
		
		if(pw.equals(dbpw)){ 
			System.out.println("2-1 비밀번호 일치");
			
			session.setAttribute("S_ID",dbid);
			session.setAttribute("S_NAME",dbname);
			session.setAttribute("S_LEVEL",level);
			
			//response.sendRedirect(request.getContextPath() + "/index.jsp");
			
			alert = "로그인 성공";
		}else {
			System.out.println("2-2 비밀번호 불일치");
			
			alert = "비밀번호를 확인하세요";		
		}	
	}else {
		System.out.println("1-2 아이디 불일치");
		alert = "아이디를 확인하세요";
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

<script type="text/javascript">
	alert('<%=alert %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>