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
	
	public void insertMovie(Bean mbean) {
		
		try {
			getCon();
			String sql = "INSERT INTO movie VALUES(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mbean.getMov_code());
			pstmt.setString(2, mbean.getMov_theater());
			pstmt.setString(3, mbean.getMov_title());
			pstmt.setString(4, mbean.getMov_genre());
			pstmt.setInt(5, mbean.getMov_price());
			pstmt.setString(6, mbean.getMov_date());
			pstmt.setString(7, mbean.getMov_time());
			pstmt.setString(8, mbean.getMov_img());
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//영화리스트 불러오기
	public Vector<Bean> movieRegistrationList() {
		
		Vector<Bean> v = new Vector<>();
		getCon();
		try {
			String sql = "SELECT * FROM movie ORDER BY mov_code asc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Bean mbean = new Bean();
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
	public Bean movieInfo(int mov_code){
		
		Bean mbean = new Bean();		
		getCon();
		
		try {
			String sql = "SELECT * FROM movie WHERE mov_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mov_code);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				mbean.setMov_code(rs.getInt(1));
				mbean.setMov_theater(rs.getString(2));
				mbean.setMov_title(rs.getString(3));
				mbean.setMov_genre(rs.getString(4));
				mbean.setMov_price(rs.getInt(5));
				mbean.setMov_date(rs.getString(6));
				mbean.setMov_time(rs.getString(7));
				mbean.setMov_img(rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mbean;
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

	//(관리자)영화 정보수정하기! >>다 되긴 하는데 이미지경로 바꿔야될듯...이미지만 안나옴..경로문제ㅠ
	public void updateMovieInfo(Bean mbean) {
		
		getCon();
		
		try {
			String sql = "UPDATE movie SET mov_genre=?, mov_title=?, mov_theater=?, mov_date=?, mov_time=?, mov_price=?, mov_img=? WHERE mov_code=?"; 
			pstmt = con.prepareStatement(sql);
						
			pstmt.setString(1, mbean.getMov_genre());
			pstmt.setString(2, mbean.getMov_title());
			pstmt.setString(3, mbean.getMov_theater());
			pstmt.setString(4, mbean.getMov_date());
			pstmt.setString(5, mbean.getMov_time());
			pstmt.setInt(6, mbean.getMov_price());
			pstmt.setString(7, mbean.getMov_img());
			pstmt.setInt(8, mbean.getMov_code());
			
			pstmt.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//이미지불러와지는지...확인하기ㅜ
	public Vector<Bean> imgList(){
		
		Vector<Bean> v = new Vector<>();
		getCon();
		
		try {
		String sql = "SELECT mov_img,mov_genre,mov_title,mov_date,mov_time,mov_theater,mov_price,mov_code FROM movie ORDER BY mov_code ASC";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Bean bean = new Bean();
			bean.setMov_img(rs.getString(1));
			bean.setMov_genre(rs.getString(2));
			bean.setMov_title(rs.getString(3));
			bean.setMov_date(rs.getString(4));
			bean.setMov_time(rs.getString(5));
			bean.setMov_theater(rs.getString(6));
			bean.setMov_price(rs.getInt(7));
			bean.setMov_code(rs.getInt(8));
			v.add(bean);
		}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return v;
	}
	
	
	
	
	
	
	
	
	
	
}
