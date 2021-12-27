package kr.or.ksmart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import kr.or.ksmart.dto.Member;

public class Mdao {
	PreparedStatement pstmt = null;
	
	//1-2 입력처리(mInsert : 입력갯수1개) 메서드 선언
	public void mInsert(Member m) {
		System.out.println("1-2 mInsert Mdao.java");
	}
	//1-1 입력처리(mInsert : 입력갯수2개) 메서드 선언
	public void mInsert(Member m, Connection conn) throws SQLException {
		System.out.println("1-1 mInsert Mdao.java");
		System.out.println(m + " <--m mInsert() Mdao.java");
		System.out.println(conn + " <--conn mInsert() Mdao.java");
		pstmt =conn.prepareStatement(
				"INSERT INTO tb_member VALUES (?, ?, ?, ?, ?)");
		System.out.println(pstmt + "<-- pstmt 1");
		pstmt.setString(1, m.getM_id());
		pstmt.setString(2, m.getM_pw());
		pstmt.setString(3, m.getM_level());
		pstmt.setString(4, m.getM_name());
		pstmt.setString(5, m.getM_email());
		System.out.println(pstmt + "<-- pstmt 2");
		
		int result= pstmt.executeUpdate();
		System.out.println(result + " <--result");
		pstmt.close();
		conn.close();
	}
}
