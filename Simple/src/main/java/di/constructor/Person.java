package di.constructor;

import di.tire.GoldTire;
import di.tire.SilverTire;

public class Person {
	public static void main(String[] args) {
//		지금은 메인 메서드가 실행을 하고 있지만, 앞으로는 스프링 프레임워크가
//		메인 메서드의 역할을 하게 될 것이다(제어 역전)
		
		Car car1 = new Car( new GoldTire() );
//		Car입장에선 Person에 의해 GoldTire를 물려받고 Car를 생성하게 된다
//		객체지향은 먼저 실행된 다음에 어떤식으로 흘러가는지에 중점을 둬야 한다
		Car car2 = new Car( new SilverTire() );
		
		System.out.println( car1.getTire() );
		System.out.println( car2.getTire() );
	}
}
