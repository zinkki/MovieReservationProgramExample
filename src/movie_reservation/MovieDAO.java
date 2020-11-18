package movie_reservation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;


public class MovieDAO {
	
	String id="system";
	String pass="1234";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getCon() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url,id,pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Vector<MovieBean> movieList() {
		
		Vector<MovieBean> v = new Vector<>();
		getCon();
		try {
			String sql = "SELECT * FROM movie";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MovieBean mbean = new MovieBean();
				mbean.setMov_code(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return v;
	}
	
	
}
