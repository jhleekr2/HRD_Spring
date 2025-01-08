package interceptor.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import interceptor.dto.User;
import interceptor.service.face.InterceptorService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/interceptor")
public class InterceptorLoginController {
	@Autowired private InterceptorService interceptorService;
	
	@GetMapping("/login")
	public void loginForm() {}
	
	@PostMapping("/login")
	public String loginProc(User loginParam, HttpSession session) {
		//세션을 이용한 로그인 구현을 위해 HttpSession 추가
		log.info("/interceptor/login [POST]");
		log.info("loginParam : {}", loginParam);
		
		//로그인 인증
		boolean isLogin = interceptorService.login( loginParam );
		log.info("isLogin : {}", isLogin);
		
		if( isLogin ) {
			log.info("로그인 성공");
			
			//no, id, nick 조회하기(pw는 제외!)
			loginParam = interceptorService.info( loginParam );
			log.info("{}", loginParam);
			
			//세션 상태 정보 관리
			session.setAttribute("isLogin", true); //로그인 상태
			session.setAttribute("userno", loginParam.getUserno()); //사용자 식별값
			session.setAttribute("usernick", loginParam.getUsernick()); //닉네임
			
			//관리자 계정 관리 - 기본적으로는 세션을 통해 관리하지만
			//세션 관리가 불안정하고 보안상 취약해서 다른 방법들로 관리할 수도 있다.
			if( "관리자".equals( loginParam.getUsernick() ) ) {
				//관리자 (Admin)
				session.setAttribute("grade", "A");
			} else {
				//일반 사용자 ( apple, banana )
				session.setAttribute("grade", "G");
			}
		} else {
			log.info("로그인 실패");
			
			//강제 로그아웃
			session.invalidate();
		}
		
//		return null;
		return "redirect:./main";
	}
	
	@RequestMapping("/main")
	public void main() {}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:./main";
	}
	
	@RequestMapping("/admin/main")
	public void adminMain() {
		
	}
	
	@RequestMapping("/admin/fail")
	public void adminFail() {
		
	}
}
