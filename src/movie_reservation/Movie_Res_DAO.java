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
		String sql = "INSERT INTO mov_reservation(res_num,mem_id,mov_code,res_seat,peo_num,res_price) VALUES(res_num.nextval,?,?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, resbean.getMem_id());
		pstmt.setInt(2, resbean.getMov_code());
		pstmt.setString(3, resbean.getRes_seat());
		pstmt.setInt(4, resbean.getPeo_num());
		pstmt.setInt(5, resbean.getRes_price());
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
	//로그인후 마이페이지눌렀을때 내가 예매한 영화목록뜨게하기 + detail버튼눌렀을때 정보뜨게하기!
	public Vector<Bean> res_Mypage(String mem_id) {
		
		Vector<Bean> v = new Vector<>();
		getCon();
		try {
			String sql = "select movie.mov_date, movie.mov_time, movie.mov_title, "
					+ "movie.mov_price,mov_reservation.res_seat, mov_reservation.peo_num, "
					+ "mov_reservation.res_num from movie,mov_reservation "
					+ "where mov_reservation.mov_code=movie.mov_code "
					+ "and mov_reservation.mem_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,mem_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Bean bean = new Bean();
				bean.setMov_date(rs.getString(1));
				bean.setMov_time(rs.getString(2));
				bean.setMov_title(rs.getString(3));
				bean.setMov_price(rs.getInt(4));
				bean.setRes_seat(rs.getString(5));
				bean.setPeo_num(rs.getInt(6));
				bean.setRes_num(rs.getInt(7));
				v.add(bean);
			}
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	//mypage에서 delete버튼 눌렀을때 예약한영화 예약취소하기
	public void deleteMyMovie(int res_num) {
		getCon();
		
		try {
			String sql = "DELETE FROM mov_reservation WHERE res_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, res_num);
			pstmt.executeUpdate();
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
}
