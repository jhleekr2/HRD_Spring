package aop;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component //스프링 빈(컴포넌트)으로 등록하기, [ component-scan에 패키지 등록 필요, <annotation-driven /> 태그 필요]
@Aspect
@Slf4j
public class LogAspect {

	//포인트컷 설정
//	public java.util.List<dept.dto.Dept> dept.service.impl.DeptServiceImpl.list();
	
//	@Pointcut("execution(public java.util.List<dept.dto.Dept> dept.service.impl.DeptServiceImpl.list())")
	@Pointcut("execution(* dept.service.impl.*ServiceImpl.*(..))")
	private static void logPointCut() {}
	
	//어드바이스 코드 작성
//	@Before("logPointCut()")
	@After("logPointCut()")
	public void logPrint() {
		log.info("!!! AOP 테스트 !!!");
	}
	//위빙은 라이브러리가 알아서 진행할 것이다
	//관점지향 프로그래밍을 사용하기 위해서는 pom.xml 파일에 반드시 aspectjweaver 라이브러리 의존성을 추가해야만 한다
	//그렇지 않으면 NoClassDefFoundError가 발생한다
	
	//----------------------------------------------------------------------
	
	//포인트컷 + 어드바이스 코드 작성(현업에서 일반적으로 사용하는 형태)
	@Before("execution(* dept.service.impl.*ServiceImpl.*(..))")
	public void logPrint2() {
		log.info("@ AOP 테스트 2 @");
	}
	
	//----------------------------------------------------------------------
	
//	@Before("execution(* *..controller..*.*(..))") //모든 컨트롤러의 모든 메소드
//	@Before("execution(* *..service..*.*(..))") //모든 서비스의 모든 메소드
	@Before("execution(* *..controller..*.*(..)) || execution(* *..service..*.*(..))")
	public void log() {
//		log.info("***** Controller AOP LOG *****");
//		log.info("***** Service AOP LOG *****");
//		log.info("***** Controller, Service AOP LOG *****");
	}

	//----------------------------------------------------------------------

	@Before("execution(* *..controller..*.*(..)) || execution(* *..service..*.*(..))")
	public void logMessage( JoinPoint jp ) { //이때 JoinPoint와 Joinpoint 중에서 JoinPoint 사용한다
//		log.info("##### {}", jp);
		
//		log.info("##### {}", jp.getSignature());
		//----------------------------------------------------------------------
		Signature sign = jp.getSignature();
		
//		log.info(">>>>> getName : {}", sign.getName());
//		log.info(">>>>> toString : {}", sign.toString());
		log.info(">>>>> toShortString : {}", sign.toShortString());
//		log.info(">>>>> toLongString : {}", sign.toLongString());
		//현재 실행되는 메소드 구분을 위해 toString, toShortString을 사용한다
		//이전에 개발하면서 매번 실행 확인코드를 적는게 좋다 했는데
		//실행확인코드를 매번 적는 대신에 인터셉터나 관점프로그래밍의 LogAspect기능
		//을 사용할 수 있다
	}

	//----------------------------------------------------------------------

	@Around("execution(* *..controller..*.*(..))")
	public Object aroundTest(ProceedingJoinPoint pjp) {
		//여기서 public void aroundTest 했더니, 나중에 viewName관련해서
		//에러가 발생했다

//		log.info("$ 수행 전, Before $");
		
		Object returnValue = null;
		try {
			
			//Aspect가 적용될 타겟 메소드(Target JoinPoint)를 실행한다
			//타겟 메소드가 실행되는 곳
			returnValue = pjp.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
			
//			log.info("$ 예외 발생 시, AfterThrowing $");
		}
		
//		log.info("$ 수행 후, After $");
//		log.info("$ returnValue : {} $", returnValue);
		
		if( returnValue != null ) {
//			log.info("$ 성공적인 리턴 발생 시, AfterReturning $");
		}
	
		return returnValue;
	}
//	
//	@Around("execution(* dept.service..*.*(..))")
//	public Object primitiveAroundTest(ProceedingJoinPoint pjp) {
//	
//		Object obj = null;
//		try {
//			obj = pjp.proceed();
//		} catch (Throwable e) {
//			e.printStackTrace();
//		}
//		//AOP의 Around 설정과 호출 메소드의 반환타입이 일치해야 한다
//		//일치하지 않으면 반환값을 null로 만든다
//		return obj;
//	}
	
	@Autowired private HttpServletRequest req;
	
	@Before("bean(*Controller)")
//	@Before("bean(deptController)")//DeptController가 스프링 빈에서는 deptController로 등록된다
	public void defaultControllerLog() {
		log.info("{} [{}]", req.getRequestURI(), req.getMethod());
		//URL 로그를 Aspect를 통해 구현
	}
	
//	@Before("bean(*ServiceImpl)")
//	public void defaultServiceLog(JoinPoint jp) {
//		log.info("{}", jp.getSignature().toShortString());
//		//이후로는 클래스이름.메소드이름이 보여질 것이다.
//		//ex) INFO : aop.LogAspect - DeptService.list()
//	}
}
