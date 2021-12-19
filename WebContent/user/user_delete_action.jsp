<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%
	request.setCharacterEncoding("utf-8");
	String send_id = request.getParameter("send_id");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	//1단계: java.sql 패키지 import해주고 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver");

	String jdbcDriver="jdbc:mysql://localhost:3306/db02jsg?" +
			"useUnicode=true&characterEncoding=UTF8";
	String dbUser = "dbid02jsg";
	String dbPass = "dbpw02jsg";
	
	try{
	//2단계: Connection 객체로 DB연결
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn);
	
	//3단계: 쿼리문
	pstmt = conn.prepareStatement("DELETE FROM tb_user WHERE u_id=?");
	pstmt.setString(1, send_id);
	
	System.out.print(pstmt + " <-- 완성된 delete문");
	
	
	//4단계: 쿼리실행
	pstmt.executeUpdate();
	
	//5단계: 생략
	
	}catch(SQLException ex){
		out.println(ex.getMessage());
		ex.printStackTrace();
	}finally{
		//06단계 :statement 또는 prepareStatement객체 종료(close())
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		//07단계 :Connection 객체 종료(close())
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
	//response.sendRedirect(request.getContextPath()+"/user/user_list.jsp");
	response.sendRedirect(request.getContextPath()+"/user/user_search_list.jsp");
%>