package kr.or.ksmart.driverdb;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverDB {
	public Connection driverDbcon() throws ClassNotFoundException,SQLException {
		System.out.println("01단계: driver loading  driverDbcon DriverDB.java");
		System.out.println("02단계: db 연결  driverDbcon DriverDB.java");
		
		Connection return_conn=null;
	
		//1단계
		Class.forName("com.mysql.jdbc.Driver");
		
		//2단계
		String jdbcDriver = "jdbc:mysql://localhost:3306/dev42db?"+"useUnicode=true&characterEncoding=euckr";
		String jdbcId = "dev42id";
		String jdbcPass = "dev42pw";
		return_conn = DriverManager.getConnection(jdbcDriver, jdbcId, jdbcPass);
		System.out.println(return_conn + " <-- return_conn");

		return return_conn;
		
	}
}
