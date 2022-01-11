package kr.or.ksmart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.ksmart.driverdb.DriverDB;
import kr.or.ksmart.dto.User;

public class Udao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//insert 처리
	public void uInsert(User u) throws ClassNotFoundException, SQLException {
		//1,2단계
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		
		//3단계
		pstmt = conn.prepareStatement("INSERT INTO tb_user VALUES (?,?,?,?,?,?)");
		pstmt.setString(1, u.getU_id());
		pstmt.setString(2, u.getU_pw());
		pstmt.setString(3, u.getU_level());
		pstmt.setString(4, u.getU_name());
		pstmt.setString(5, u.getU_phone());
		pstmt.setString(6, u.getU_email());
		System.out.println(pstmt + " <--  완성된 쿼리문 Udao.java");
		
		//4단계
		int result = pstmt.executeUpdate();
		
		
		//5단계
		System.out.println(result + " <--쿼리실행결과  Udao.java");
		
		//6,7단계
		pstmt.close();
		conn.close();
		
	}
	
	//delete 처리
	public void uDelete(String send_id) throws ClassNotFoundException, SQLException {
		//1,2단계
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		
		//3단계
		pstmt = conn.prepareStatement("DELETE FROM tb_user WHERE u_id=?");
		pstmt.setString(1, send_id);
		System.out.println(pstmt + " <--쿼리문 mDelete() Udao.java");
		
		//4단계
		int result = pstmt.executeUpdate();
		
		//5단계
		System.out.println(result + " <--정상 삭제된다면 1값");
		
		//6,7단계
		pstmt.close();
		conn.close();
	}

	//update 화면
	public User uSeleteUpdate(String send_id) throws ClassNotFoundException, SQLException {
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		
		pstmt = conn.prepareStatement("select * from tb_user where u_id=?");
		pstmt.setString(1, send_id);
		
		rs = pstmt.executeQuery();
		User u=null;
		if(rs.next()) {
			u = new User();
			u.setU_id(rs.getString("u_id"));
			u.setU_pw(rs.getString("u_pw"));
			u.setU_level(rs.getString("u_level"));
			u.setU_name(rs.getString("u_name"));
			u.setU_phone(rs.getString("u_phone"));
			u.setU_email(rs.getString("u_email"));
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return u;
		
	}
	
	//update 처리
	public void uUpdate(User u) throws ClassNotFoundException, SQLException {
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		
		pstmt = conn.prepareStatement("UPDATE tb_user SET u_pw=?, u_level=?, u_name=?, u_phone=?, u_email=? WHERE u_id=?");
		pstmt.setString(1, u.getU_id());
		pstmt.setString(2, u.getU_level());
		pstmt.setString(3, u.getU_name());
		pstmt.setString(4, u.getU_phone());
		pstmt.setString(5, u.getU_email());
		pstmt.setString(6, u.getU_id());
		System.out.print(pstmt + " <--쿼리문 uUpdate() Udao.java");
		
		int result = pstmt.executeUpdate();
		System.out.println(result + " <--쿼리 실행시");
		
		 pstmt.close();
		 conn.close();
	}

	//login 조건check
	public int uLoginCheck(String id,String pw) throws ClassNotFoundException, SQLException {
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		
		pstmt = conn.prepareStatement("SELECT * FROM tb_user WHERE u_id=?");
		pstmt.setString(1, id);
		System.out.println(pstmt + " <--쿼리문 uLoginCheck() Udao.java");
		
		rs = pstmt.executeQuery();
		int result =0;
		
		if(rs.next()) {
			System.out.println("1-1아이디일치");
			if(pw.equals(rs.getString("u_pw"))) {
				System.out.println("2-1비번일치");
				result = 1;
			}else {
				System.out.println("2-2비번불일치");
				result = 2;
			}
		}else {
			System.out.println("1-2아이디불일치");
			result = 3;
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	//login 세션줄 대상 찾기
	public User uGetForSession(String id) throws ClassNotFoundException, SQLException {
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		
		pstmt = conn.prepareStatement("SELECT u_id,u_level,u_name FROM tb_user WHERE u_id=?");
		pstmt.setString(1, id);
		System.out.println(pstmt + " <--쿼리문 uLoginCheck() Udao.java");
		
		rs = pstmt.executeQuery();
		
		User u =null;
		if(rs.next()) {
			u = new User();
			u.setU_id(rs.getString("u_id"));
			u.setU_level(rs.getString("u_level"));
			u.setU_name(rs.getString("u_name"));
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return u;
	}

	//search 처리
	public ArrayList<User> uSearch(String sk,String sv) throws ClassNotFoundException, SQLException{
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		ArrayList<User> alu = new ArrayList<>();
		String selectQuery = "SELECT * FROM tb_user";
		
		if(sk==null && sv==null) {
			System.out.println("1-1 sk와 sv 모두 null 일때");
			//SELECT * FROM tb_user
			pstmt = conn.prepareStatement(selectQuery);
			
		}else if(sk!=null && sv=="") {
			System.out.println("1-2 sk엔 값이 있고 sv는 공백일 때");
			pstmt = conn.prepareStatement(selectQuery);
			
		}else{
			System.out.println("1-3 sk와 sv 모두 null이 아닐때");
			pstmt = conn.prepareStatement(selectQuery+" WHERE "+sk+"=?");
			pstmt.setString(1, sv);			
		}
		System.out.println(pstmt + " <--작성된 쿼리문 확인하기");
		
		//4 쿼리 실행
		rs = pstmt.executeQuery();
		User u=null;
		//5단계
		while(rs.next()) {
			u=new User();
			u.setU_id(rs.getString("u_id"));
			u.setU_pw(rs.getString("u_pw"));
			u.setU_level(rs.getString("u_level"));
			u.setU_name(rs.getString("u_name"));
			u.setU_phone(rs.getString("u_phone"));
			u.setU_email(rs.getString("u_email"));
			alu.add(u);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return alu;		
	}
}