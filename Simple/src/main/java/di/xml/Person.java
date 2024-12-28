package di.xml;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import di.tire.Tire;

public class Person {

	public static void main(String[] args) {

		//스프링 컨텍스트 객체
		ApplicationContext context = null;
		
		//Bean Configuration XML 파일을 읽어들여 Spring Context를 구성한다
		context = new FileSystemXmlApplicationContext("/src/main/java/di/xml/spring-config.xml");
		//-----------------------------------------------------------------
		
		// Spring Context에 등록된 "car"라는 이름의 스프링 빈을
		//Car 객체로 사용한다
		Car car = context.getBean("car", Car.class); //최근에는 갈수록 형변환을 줄이는 추세 - 대신 제네릭 활용
		
		car.setTire( context.getBean("gTire", Tire.class) );
		//getBean은 Object반환 setTire는 Object의 자식 -> 형변환 또는 타입 맞춰주기 필요
		
		System.out.println( car );
		System.out.println( car.getInfo() );
		
		System.out.println("--------------------");
		
		//-----------------------------------------------------------------

		Car car1 = context.getBean("car", Car.class);
		car1.setTire( context.getBean("sTire", Tire.class) );
		System.out.println( car1 );
		System.out.println( car1.getInfo() );

		System.out.println("--------------------");

		Car car2 = context.getBean("car", Car.class);
		car1.setTire( context.getBean("gTire", Tire.class) );
		System.out.println( car2 );
		System.out.println( car2.getInfo() );
		
		//이때 스프링에서는 car를 인스턴스 1개만으로 관리했다
		//따라서, 여기서 car는 단 1대일 뿐이다(3대 아님!)
		
		//우리는 컨트롤러와 서비스를 스프링 빈으로 등록할 것이다
		//-----------------------------------------------------------------

		System.out.println("--------------------");

		Car c2 = context.getBean("car2", Car.class);
		Car c3 = context.getBean("car3", Car.class);
		
		System.out.println("c2 : " + c2);
		System.out.println("c3 : " + c3);
		
		System.out.println( c2.getInfo() );
		System.out.println( c3.getInfo() );
	}

}
