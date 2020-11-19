package movie_reservation;

import java.sql.DriverManager;


public class OracleConnectionEx {

	public static void main(String[] args) {
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "system";
		String pass = "1234";
		
		try {
			Class.forName(driver);
			System.out.println("Loading Success");
			DriverManager.getConnection(url,id,pass);
			System.out.println("Connection Success");
		} catch (Exception e) {
			System.out.println("Connection fail....");
		}
	}

}
