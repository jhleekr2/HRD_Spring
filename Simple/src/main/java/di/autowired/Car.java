package di.autowired;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import di.tire.Tire;

public class Car {

	@Autowired
//	@Resource
//	@Inject
	@Qualifier("gTire")
	private Tire tire;
	//우리는 그냥 Autowired(의존성 주입)을 멤버필드에 주입할 것이다
	
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
