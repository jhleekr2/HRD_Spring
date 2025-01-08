package interceptor.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AdminInterceptor implements HandlerInterceptor {

	//로직이 들어가는 처리들을 인터셉터 쓰는 경우가 많다
	//스프링에서는 기존 필터들은 이미 역할이 정해진 API들을
	//적용하는 용도로 사용되는 경우가 많다
	@Autowired private HttpSession session;
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler)
			throws Exception {

		log.info("인터셉터 시작");
		
		//세션에서 등급(grade) 정보 꺼내기
//		String grade = (String) req.getSession().getAttribute("grade");
		//위의 코드를 스프링에 의해 의존성 주입을 받은 코드로 변경
		String grade = (String) session.getAttribute("grade");
		
		log.info("grade : {}", grade);
		
		if( null == grade ) {
			log.info("비 로그인 상태");
			
			resp.sendRedirect("./fail");
			return false;
		} else if ( "G".equals(grade) ) {
			log.info("일반 사용자 로그인 상태");
			resp.sendRedirect("./fail");
			return false;
		} else if ( "A".equals(grade) ) {
			log.info("관리자 사용자 로그인 상태");
		}
		
	return true; //컨트롤러 접근 허용
//	return false; //컨트롤러 접근 차단
	}
	
	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse resp, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		log.info("인터셉터 종료");
	}
}
