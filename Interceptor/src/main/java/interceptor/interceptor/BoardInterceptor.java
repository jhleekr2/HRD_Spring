package interceptor.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class BoardInterceptor implements HandlerInterceptor {
	
	//로직이 들어가는 처리들을 인터셉터 쓰는 경우가 많다
	//스프링에서는 기존 필터들은 이미 역할이 정해진 API들을
	//적용하는 용도로 사용되는 경우가 많다
	@Autowired private HttpSession session;
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler)
			throws Exception {
		
		log.info("인터셉터 시작");
		
		if( session.getAttribute("isLogin") == null ) {
			log.info("접속 불가 : 로그인 안됨");
			
			resp.sendRedirect("./noLogin"); //비로그인 경고 페이지
			return false;
		}
		
		//인터셉터 구현한 후 인터셉터를 구현해야하는 장소가 늘어나면
		//servlet-context.xml에 mapping만 추가하면 된다
		
		return true; //컨트롤러 접근 허용
	}
}
