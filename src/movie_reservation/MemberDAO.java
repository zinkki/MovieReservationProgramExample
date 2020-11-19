package movie_reservation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class MemberDAO {
	
	String id="system";
	String pass="1234";
	String url= "jdbc:oracle:thin:@localhost:1521:XE";
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getCon() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, id, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertMember(MemberBean mbean) {
		
		try {
		getCon();
		String sql = "INSERT INTO mov_member VALUES(?,?,?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, mbean.getMem_name());
		pstmt.setString(2, mbean.getMem_id());
		pstmt.setString(3, mbean.getMem_pass1());
		pstmt.setString(4, mbean.getMem_tel());
		pstmt.setString(5, mbean.getMem_email());
		pstmt.setString(6, mbean.getMem_resNum());
		pstmt.executeUpdate();
		con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
