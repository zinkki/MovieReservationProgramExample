package movie_reservation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class Movie_Res_DAO extends MovieDAO{

	
	
	//영화예매내역 뽑아보기 sql문 잘못됨(mem_id로 조회해야되는데 mov_code=?로 해놨음..)
	//그리고 순서잘못정했음.. insert먼저 하고 정보뽑아야되는데 든것도없음서 뽑으려고해서 안됨..
	//글고 vector타입 int mov_code로 돼있는데 mem_id로 받아와야됨... 할거 많다..
	//그러려면...일단 id에 세션값설정해서 예매할때 다 하나씩 넣어줘야됨.하...
	public Vector<Movie_Res_Bean> res_Confirm(int mov_code) {
		
		Vector<Movie_Res_Bean> v = new Vector<>();
		getCon();
		try {
			String sql = "SELECT * FROM mov_reservation WHERE mov_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mov_code);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Movie_Res_Bean resbean = new Movie_Res_Bean();
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
}
