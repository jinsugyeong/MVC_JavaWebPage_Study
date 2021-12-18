<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	String upw = request.getParameter("upw");
	String uname = request.getParameter("uname");
	String uphone = request.getParameter("uphone");
	String uemail = request.getParameter("uemail");
	String ulevel = request.getParameter("ulevel");
	
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
	System.out.println(conn.getClass());
	
	//3단계: 쿼리문
	pstmt = conn.prepareStatement("UPDATE tb_user SET u_pw=?, u_level=?, u_name=?, u_phone=?, u_email=? WHERE u_id=?");
	pstmt.setString(1, upw);
	pstmt.setString(2, ulevel);
	pstmt.setString(3, uname);
	pstmt.setString(4, uphone);
	pstmt.setString(5, uemail);
	pstmt.setString(6, uid);
	
	System.out.print(pstmt + " <-- 완성된 update문");
	
	
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
	
%>