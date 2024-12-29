package web.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogTestController {
	
	//로그 객체
	private static final Logger logger = LoggerFactory.getLogger(LogTestController.class);
	//정적으로 변수 만들어서 class의 이름을 이용해서 정적인 나 자신을 불러온다.
	
//	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	//일반 멤버필드로 만들어서 this를통해 getClass 불러온다
	
	//위의 방법들은 로그 객체를 꺼내쓰는 두 가지 방법이다
	//이때 Import할 변수들을 골라야하는데 org.slf4j.Logger를 고르면 된다
	
	@RequestMapping("/log/test")
	public void logtest() {
//		System.out.println("/log/test");
		
		logger.info("로그 메시지");
		//앞으로는 성능상 문제 때문에
		//System.out 대신 logger.info를 사용하자
		//--------------------------------------------------------------------
		
		//로그 메시지 레벨
		logger.trace("트레이스");
		logger.debug("디버그");
		logger.info("인포메이션");
		logger.warn("경고");
		logger.error("에러");
		//logger.fatal은 없다.
		
		//--------------------------------------------------------------------
	
		logger.info("-------------------");
		
		Object obj = new Object();
		
		System.out.println(obj); //참조형 출력 가능
		
//		logger.info( obj ); //참조형 사용 불가
		//객체는 그대로 쓸 수 없고, toString() 이나 String.valueOf() 해줘야만 한다
		logger.info( String.valueOf(obj) );
		
		logger.info("-------------------");

		logger.info("{} 중괄호 출력하기");

		//** 두 번째 전달인자를 {}파라미터에 집어 넣는다
		logger.info("{} 중괄호 출력하기", "파라미터");

		logger.info("A: {}, B: {}", 12345, true);
		
		//알아서 obj 참조형을 toString처리하여 출력해준다
		//{}파라미터에 객체를 적용하면 .toString() 결과가 적용된다
		logger.info("{}", obj);
		
		logger.info("-------------------");
		//** 에러, {}파라미터는 2개까지만 허용한다
//		logger.info("{}, {}, {}", 1, 2, 3);
		// -> 파라미터가 2개를 초과할 경우는 배열 형태로 만들어야 한다
		
		Object[] data = {"출력", 1, 2, 3};
		
		logger.info("{}, {}, {}", data);
		logger.info("{}, {}, {}, {}", data);
		logger.info("{}, {}, {}, {}, {}, {}", data);
		//출력, 1, 2, 3, {}, {}
		//중괄호 갯수가 파라미터 갯수를 초과할때는 그냥 {} 출력
		
		Object[] data2 = {"출력", "데이터", "여러 개", "지정", 3564, new Date()};

		logger.info("{}, {}, {}", data2);
		logger.info("{}, {}, {}, {}, {}, {}", data2);

		int idx = 0;
		logger.trace("#{}. 메소드 시작", idx++);
		

		
		
		logger.trace("#{}. 주석대신 사용하기 좋음", idx++);

		logger.trace("#{}. 개발할 때 idx변수를 활용하여", idx++);
		
		logger.trace("#{}. 어디까지 실행됐는지", idx++);
		
		logger.trace("#{}. 로그를 보고 확인할 수 있음", idx++);

		logger.trace("#{}. 메소드 종료", idx++);
		
		//logger.trace 방식으로 개발해서 에러났을때 디버깅을 간소화할 수는 있지만
		//실제로는 디버깅 툴이 더 편하고 좋은 방법인 경우가 많다
		//이클립스에서는 F11누르면 디버깅 모드에 진입할 수 있다
		
		//디버깅 툴 사용 방법
		//어딘가에 한줄 더블클릭 하면 중단지점(Breakpoint)가 걸린다
		//이후 톰캣에서 재생단추 옆의 벌레단추 누르면 디버깅 모드로 진입하고
		//이전에 걸어놓은 중단지점에서 실행이 중단될 것이다

	}
	

}
