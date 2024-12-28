package di.setter;

import di.tire.GoldTire;
import di.tire.SilverTire;

public class Person {
	public static void main(String[] args) {
		
		Car car1 = new Car();
		//클래스 객체는 new로 만드는게 시작
		//이때 tire는 null -> 의존성 없음 -> 이때 발생하는 에러가 NullPointerException
		car1.setTire( new SilverTire() );
		System.out.println( car1.getTire() );
		
		//NullPointerException 자체가 의존성이 없다는 뜻
		
		Car car2 = new Car();
		car2.setTire(new GoldTire() );
		System.out.println( car2.getTire() );
		
//		Spring framework - Tomcat에 의해 실행 -> 설정값 로드 -> 실행
		
	}
}
