package kr.or.ksmart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.or.ksmart.driverdb.DriverDB;
import kr.or.ksmart.dto.Goods;

public class Gdao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	
	//g_code 찾기
	public String getMaxGoodsCode() throws ClassNotFoundException, SQLException {
		String tempCode = "goods_0";
		String g_code=null;
		int max = 0;
		
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement("select max(cast(substring(g_code,8) as decimal)) from tb_goods");
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			max = rs.getInt(1);
			g_code = tempCode+(max+1);
		}		
		
		return g_code;
	}
	
	//insert
	public void gInsert(Goods g) throws ClassNotFoundException, SQLException {
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		
		pstmt = conn.prepareStatement("insert into tb_goods values (?,?,?,?,?,?,?,now(),?)");
		pstmt.setString(1, g.getG_code());
		pstmt.setString(2, g.getU_id());
		pstmt.setString(3, g.getG_name());
		pstmt.setString(4, g.getG_cate());
		pstmt.setString(5, g.getG_price());
		pstmt.setString(6, g.getG_color());
		pstmt.setString(7, g.getG_size());
		pstmt.setString(8, g.getG_desc());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	
}
