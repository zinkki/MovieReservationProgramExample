package movie_reservation;

public class Bean {
	//memberBean
	private String mem_name;//회원이름
	private String mem_resNum;//회원주민번호
	private String mem_tel;//회원전화번호
	private String mem_email;//회원이메일
	private String mem_pass1;//회원비밀번호
	private String mem_pass2;//회원가입시 비번확인용
	String mem_id; //PK 회원아이디
	//movieBean
	String mov_theater; //영화상영관
	String mov_title; //영화제목
	int mov_code; //영화고유코드 //영화table의(PK)
	String mov_genre; //영화장르
	String mov_date; //영화날짜
	String mov_time; //영화시간
	int mov_price; //영화가격
	String mov_img; //영화이미지(jpg,png)
	//movieReservationBean
	int peo_num; //예약시 사람수
	String res_seat; //예약좌석
	int res_price; //예약총가격 (사람수*영화가격)
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_resNum() {
		return mem_resNum;
	}
	public void setMem_resNum(String mem_resNum) {
		this.mem_resNum = mem_resNum;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_pass1() {
		return mem_pass1;
	}
	public void setMem_pass1(String mem_pass1) {
		this.mem_pass1 = mem_pass1;
	}
	public String getMem_pass2() {
		return mem_pass2;
	}
	public void setMem_pass2(String mem_pass2) {
		this.mem_pass2 = mem_pass2;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
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
	public String getMov_img() {
		return mov_img;
	}
	public void setMov_img(String mov_img) {
		this.mov_img = mov_img;
	}
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
		return res_price = peo_num*mov_price;
	}
	public void setRes_price(int res_price) {
		this.res_price = peo_num*mov_price;
	}
	
	
}
