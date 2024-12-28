package di.dependency;

import di.tire.GoldTire;
import di.tire.Tire;

public class Car {

	private Tire tire;
	//이때 Tire를 GoldTire, SilverTire 등등 타입을 집어넣는 과정에서
	//반드시 프로그램을 껐다 켜야 하는 문제가 있다
	
//	private GoldTire tire;
//	private SilverTire tire;
	//이런 방식은 패치할수록 프로그램이 점점 무거워진다
	
	//따라서 Tire를 인터페이스로 구현한 후 GoldTire, SilverTire 를 구현하는 식으로 처리
	//이때 Car에 비해 덜 중요한 Tire를 추상화된 변수(자료형)으로 넣어준다
	
	//객체지향 프로그래밍에서는 재사용성을 확보하면서도 확장성을 고려해야 한다
	
	public Car() {
		
		//의존성이 발생한다
		this.tire = new GoldTire();
//		this.tire = new GoldTire();
		//의존성 변경을 위해 코드 수정이 발생 -> 좋지 않다!
	}
	
	public String getTire() {
		return tire.getProduct() + "장착함!";
	}
}
