package login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import login.dto.Login;
import login.service.face.LoginService;
import lombok.extern.slf4j.Slf4j;

//로그 객체를 정의하지 않고 사용하기 위해서 롬복의 @Slf4j annotation을 사용하고
//기존 logger.info 대신 log.info 형태로 바꿔서 사용한다

@Controller
@Slf4j
@RequestMapping("/login")
public class LoginController {

//	//로그 객체
//	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//서비스 객체
//	private LoginService loginService = new LoginServiceImpl();
	//스프링 프레임워크에게 의존성 주입을 다음과 같이 맡긴다
	@Autowired private LoginService loginService;
	
//	@RequestMapping(value = "/forward", method = RequestMethod.GET)
//	@GetMapping("URLPattern")
	@GetMapping("/main")
	public void main() {
		log.info("/login/main [GET]");
	}
	
	@GetMapping("/login")
	public void login() {
		log.info("/login/login [GET]");
	}
	
	@PostMapping("/login")
	public String loginProc(Login param, HttpSession session) {
		log.info("login param : {}", param);
		
		//로그인 인증 처리 (ID/Password 확인)
		boolean isLogin = loginService.loginProcess( param );
		log.info("isLogin : " + isLogin);
		
		if( isLogin ) {
			log.info("로그인 성공");
			
			int loginno = loginService.getLoginno( param );
			log.info("PK loginno : {}", loginno);
			
			//세션에 로그인 정보 넣기
			// ** 세션에 너무 많은 정보를 넣으면 안된다(특히 세션에 비밀번호를 저장해서는 안됨)
			session.setAttribute("islogin", isLogin); //로그인 여부
			session.setAttribute("loginno", loginno); //PK
		
		} else {
			log.info("로그인 실패");
			
			//로그인 실패 시 로그인 정보 삭제하기
			session.invalidate();
		}
		
		return "redirect:./main";
	}
	
	@GetMapping("/join")
	public void join() {
		log.info("/login/join [GET]");
		
	}
	
	@PostMapping("/join")
	public String joinProc(Login param) {
		log.info("/login/join [POST]");
		log.info("join param : {}", param);
		
		// 스프링 프레임워크가 회원가입 전달 파라미터 추출 부분까지 자동화해준다
		
		//회원가입 처리
		loginService.memberJoin( param );
		
		//메인 화면으로 이동
		return "redirect:./main";
	}
	
	@RequestMapping("/mypage")
	public void mypage(@SessionAttribute("loginno") int no, Model model) {
		log.info("loginno : {}", no);
		
		Login loginInfo = loginService.info(no);
		log.info("info : {}", loginInfo);
		
		//모델값에 조회된 회원정보 전달
		model.addAttribute("info", loginInfo);
	}
	
	
	//로그아웃 - 세션을 바로 받아와서 invalidate하면 더 간단하게 해결
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		log.info("/login/logout [GET]");

		//세션 정보 삭제
		session.invalidate();
		
		//로그아웃 후 메인 페이지로 리다이렉트
		return "redirect:./main";
	}
}
