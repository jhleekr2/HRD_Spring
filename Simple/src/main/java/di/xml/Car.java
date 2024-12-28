package di.xml;

import di.tire.Tire;

public class Car {

	private Tire tire;
	
	public Car() {}

	public Car(Tire tire) {
		super();
		this.tire = tire;
	}

	public String getInfo() {
		return tire.getProduct() + " 장착!";
	}
	
	public Tire getTire() {
		return tire;
	}

	public void setTire(Tire tire) {
		this.tire = tire;
	}
	
	
}
