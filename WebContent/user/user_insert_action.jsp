<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	
	request.setCharacterEncoding("UTF-8");

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
	
	//3단계: 쿼리 실행을 위한 준비(statement or PreparedStatement 객체 생성)
	pstmt = conn.prepareStatement("INSERT INTO tb_user VALUES (?,?,?,?,?,?)");
	System.out.println(pstmt);
	System.out.println(pstmt.getClass());
	
	
	pstmt.setString(1, uid);
	pstmt.setString(2, upw);
	pstmt.setString(3, ulevel);
	pstmt.setString(4, uname);
	pstmt.setString(5, uphone);
	pstmt.setString(6, uemail);
	System.out.println(pstmt+"값 넣은뒤");
	
	//4단계: 쿼리 실행
	pstmt.executeUpdate();
	
	//5단계: 쿼리 실행결과 사용 (insert의 경우 생략 가능단계)
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