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
	Goods g = null;
	
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
	
	//delete
	public void gDelete(String send_gcode) throws ClassNotFoundException, SQLException {
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		
		pstmt = conn.prepareStatement("delete from tb_goods where g_code=?");
		pstmt.setString(1, send_gcode);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	
	//gUdateSelete
	public Goods gUpdateSelete(String send_gcode) throws SQLException, ClassNotFoundException {
		
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		
		pstmt = conn.prepareStatement("select * from tb_goods where g_code=?");
		pstmt.setString(1, send_gcode);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			g = new Goods();			
			g.setG_code(rs.getString("g_code"));
			g.setG_name(rs.getString("g_name"));
			g.setG_cate(rs.getString("g_cate"));
			g.setG_price(rs.getString("g_price"));
			g.setG_color(rs.getString("g_color"));
			g.setG_size(rs.getString("g_size"));
			g.setG_desc(rs.getString("g_desc"));			
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return g;
	}
	
	//gUdate
	public void gUpdate(Goods g) throws ClassNotFoundException, SQLException {
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		
		pstmt = conn.prepareStatement("update tb_goods set g_name=?, g_cate=?, g_price=?, g_color=?, g_size=?, g_desc=? where g_code=?");
		pstmt.setString(1, g.getG_name());
		pstmt.setString(2, g.getG_cate());
		pstmt.setString(3, g.getG_price());
		pstmt.setString(4, g.getG_color());
		pstmt.setString(5, g.getG_size());
		pstmt.setString(6, g.getG_desc());
		pstmt.setString(7, g.getG_code());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	
}
