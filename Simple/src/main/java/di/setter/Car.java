package di.setter;

import di.tire.Tire;

public class Car {

	private Tire tire;
	
	public void setTire(Tire tire) {
		
		//Setter 의존성 주입(Setter DI)
		this.tire = tire;
		//일단 Car를 대충 만든 후 실행하기 전에 뒤늦게 의존성이 주입된다
	}
	
	public String getTire() {
		return tire.getProduct() + " 장착했음!";
	}
}
