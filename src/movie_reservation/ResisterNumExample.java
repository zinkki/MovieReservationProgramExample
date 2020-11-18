package movie_reservation;
import java.util.Scanner;

//주민번호 유효성검사!
public class ResisterNumExample {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("주민번호를 입력해주세요 ex)000000-0000000");
		String resNum = sc.next();
		
		int [] checkNum = {2,3,4,5,6,7,8,9,2,3,4,5};
		String sc1 = resNum.replace("-","").trim();
		int sum = 0;
		for(int i=0; i<checkNum.length;i++) {
			int tmp=(sc1.charAt(i)-48)*checkNum[i];
			sum += tmp;
		}
		int pin = 11-(sum%11);
		if(pin >=10) pin= pin-10;
		
		if((sc1.charAt(12)-48)==pin) {
			System.out.println("유효한 주민번호 입니다.");
		}else {
			System.out.println("유효하지 않은 주민번호입니다.");
		}
	}

}
