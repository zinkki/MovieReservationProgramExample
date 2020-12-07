package movie_reservation;

import java.util.Vector;

public class Movie_Res_DAO extends MovieDAO{

	//main페이지로그인후 movieReservation버튼눌렀을때 정보보여주기
	public Vector<Bean> main_Reservation(String id) {
		
		Vector<Bean> v = new Vector<>();
		getCon();
		try {
		String sql = "SELECT * FROM movie WHERE mem_id=?";
		
		} catch (Exception e) {

		}
		return v;
	}
	//영화예매
	public void movieReservation(Bean resbean) {
		try {
		getCon();
		Bean bean = new Bean();
		String sql = "INSERT INTO mov_reservation(res_num,mem_id,mov_code,res_seat,res_price) VALUES(res_num.nextval,?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, resbean.getMem_id());
		pstmt.setInt(2, resbean.getMov_code());
		pstmt.setString(3, resbean.getRes_seat());
		pstmt.setInt(4, resbean.getRes_price());
		pstmt.executeUpdate();
		con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//영화예매후 뜨는 영화예매확인페이지
	public Vector<Bean> res_Confirm(int mov_code) {
		
		Vector<Bean> v = new Vector<>();
		getCon();
		try {
			String sql = "SELECT * FROM mov_reservation WHERE mov_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mov_code);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Bean resbean = new Bean();
				resbean.setMov_code(rs.getInt(1));
				resbean.setMov_title(rs.getString(2));
				resbean.setMov_img(rs.getString(3));
				resbean.setMov_date(rs.getString(4));
				resbean.setMov_time(rs.getString(5));
				resbean.setMov_theater(rs.getString(6));
				resbean.setRes_seat(rs.getString(7));
				resbean.setRes_price(rs.getInt(8));
				v.add(resbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	public Vector<Bean> res_Mypage(String mem_id) {
		
		Vector<Bean> v = new Vector<>();
		getCon();
		try {
			String sql = "select movie.mov_date,movie.mov_time,movie.mov_title,mov_reservation.res_seat,mov_reservation.res_price from movie,mov_reservation where mov_reservation.mov_code=movie.mov_code and mov_reservation.mem_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,mem_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Bean bean = new Bean();
				bean.setMov_date(rs.getString(1));
				bean.setMov_time(rs.getString(2));
				bean.setMov_title(rs.getString(3));
				bean.setMem_id(rs.getString(4));
				v.add(bean);
			}
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	
	
	
	
	
	
}
