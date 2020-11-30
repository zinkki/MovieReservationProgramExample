package movie_reservation;

public class MovieBean {

	String mov_theater; //영화상영관
	String mov_title; //영화제목
	int mov_code; //영화고유코드 //영화table의(PK)
	String mov_genre; //영화장르
	String mov_date; //영화날짜
	String mov_time; //영화시간
	int mov_price; //영화가격
	String mov_img; //영화이미지(jpg,png)
	
	/*
	 * int peo_num; //인원수 인원수만큼 예약좌석 선택해야되는데..이거어케함... 
	 * String res_seat; //예약좌석
	 * >배열...?
	 */	
	
	public String getMov_img() {
		return mov_img;
	}
	public void setMov_img(String mov_img) {
		this.mov_img = mov_img;
	}
	
	public String getMov_theater() {
		return mov_theater;
	}
	public void setMov_theater(String mov_theater) {
		this.mov_theater = mov_theater;
	}
	public String getMov_title() {
		return mov_title;
	}
	public void setMov_title(String mov_title) {
		this.mov_title = mov_title;
	}
	public int getMov_code() {
		return mov_code;
	}
	public void setMov_code(int mov_code) {
		this.mov_code = mov_code;
	}
	public String getMov_genre() {
		return mov_genre;
	}
	public void setMov_genre(String mov_genre) {
		this.mov_genre = mov_genre;
	}
	public String getMov_date() {
		return mov_date;
	}
	public void setMov_date(String mov_date) {
		this.mov_date = mov_date;
	}
	public String getMov_time() {
		return mov_time;
	}
	public void setMov_time(String mov_time) {
		this.mov_time = mov_time;
	}
	public int getMov_price() {
		return mov_price;
	}
	public void setMov_price(int mov_price) {
		this.mov_price = mov_price;
	}

	
}
