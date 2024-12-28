package di.autowired;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Person {
	public static void main(String[] args) {
		
		//스프링 컨텍스트 객체
		ApplicationContext context = null;
		
		//Bean Configuration XML 파일을 읽어들여 Spring Context를 구성한다
		context = new FileSystemXmlApplicationContext(
				"/src/main/java/di/autowired/di-config.xml");
		//-----------------------------------------------------------------
		
		Car car = context.getBean("car", Car.class);
	
		System.out.println("car : " + car);
		System.out.println( car.getInfo() );
		//Autowired 믿었지만, Autowired가 결과적으로 작동하지 않았다
		// -> NullPointerException
		
		//스프링 프레임워크에서 에러는 반드시 끝까지 읽어봐야 한다
		//Car문제 -> Tire 문제 -> xml설정 문제!
		//쉽게 파악하려면 오히려 뒤에서부터 앞으로 읽어보는 것이 좋다!
	}
}
