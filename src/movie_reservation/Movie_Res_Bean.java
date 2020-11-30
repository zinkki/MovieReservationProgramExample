package movie_reservation;

public class Movie_Res_Bean extends MovieBean{

	int peo_num;
	String res_seat;
	int res_price;
	
	public int getPeo_num() {
		return peo_num;
	}
	public void setPeo_num(int peo_num) {
		this.peo_num = peo_num;
	}
	public String getRes_seat() {
		return res_seat;
	}
	public void setRes_seat(String res_seat) {
		this.res_seat = res_seat;
	}
	public int getRes_price() {
		return res_price;
	}
	public void setRes_price(int res_price) {
		this.res_price = res_price;
	}
	
	
}
