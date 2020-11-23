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
			pstmt.setInt(5, mbean.getMov_price());
			pstmt.setString(6, mbean.getMov_date());
			pstmt.setString(7, mbean.getMov_time());
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
				mbean.setMov_date(rs.getString(6));
				mbean.setMov_title(rs.getString(3));
				v.add(mbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return v;
	}
	
	//영화등록리스트에서 선택한 영화의 정보를 볼수있당!
	public Vector<MovieBean> movieInfo(int mov_code){
		
		Vector<MovieBean> v = new Vector<>();
		
		getCon();
		
		try {
			String sql = "SELECT * FROM movie WHERE mov_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mov_code);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MovieBean mbean = new MovieBean();
				mbean.setMov_code(rs.getInt(1));
				mbean.setMov_theater(rs.getString(2));
				mbean.setMov_title(rs.getString(3));
				mbean.setMov_genre(rs.getString(4));
				mbean.setMov_price(rs.getInt(5));
				mbean.setMov_date(rs.getString(6));
				mbean.setMov_time(rs.getString(7));
				v.add(mbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return v;
	}
	
	//(관리자)영화삭제하기
	public void deleteMovie(int mov_code) {
		
		getCon();
		
		try {
			String sql = "DELETE FROM movie WHERE mov_code =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mov_code);
			pstmt.executeUpdate();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//(관리자)영화 정보수정하기!
	public void updateMovieInfo(MovieBean mbean) {
		
		getCon();
		
		try {
			String sql = "UPDATE movie SET mov_genre=?, mov_title=?, mov_theater=?, mov_date=?, mov_time=?, mov_price=? WHERE mov_code=?"; 
			pstmt = con.prepareStatement(sql);
						
			pstmt.setString(1, mbean.getMov_genre());
			pstmt.setString(2, mbean.getMov_title());
			pstmt.setString(3, mbean.getMov_theater());
			pstmt.setString(4, mbean.getMov_date());
			pstmt.setString(5, mbean.getMov_time());
			pstmt.setInt(6, mbean.getMov_price());
			pstmt.setInt(7, mbean.getMov_code());
			
			pstmt.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
	
	
	
	
}
