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
	
	public void insertMovie(MovieBean mbean) {
		
		try {
			getCon();
			String sql = "INSERT INTO movie VALUES(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mbean.getMov_code());
			pstmt.setString(2, mbean.getMov_theater());
			pstmt.setString(3, mbean.getMov_title());
			pstmt.setString(4, mbean.getMov_genre());
			pstmt.setString(5, mbean.getMov_date());
			pstmt.setString(6, mbean.getMov_time());
			pstmt.setInt(7, mbean.getMov_price());
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//영화리스트 불러오기
	public Vector<MovieBean> movieRegistrationList() {
		
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
