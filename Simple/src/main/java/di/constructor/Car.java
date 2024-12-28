package di.constructor;

import di.tire.Tire;

public class Car {

	private Tire tire;
	
	public Car( Tire tire ) {
		
		//생성자 의존성 주입(Constructor DI)
		this.tire = tire;
		//Car 입장에서는 생성자에 의해 의존성이 주입당했다
	}
	
	public String getTire() {
		return tire.getProduct() + " 장착했음!";
	}
}
