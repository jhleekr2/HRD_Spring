package web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import web.dto.Member;
import web.service.face.MemberService;

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberController {
	
//	//로그 객체
//	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//서비스 객체
//	private MemberService memberService = new MemberServiceImpl();
	//스프링 프레임워크에게 의존성 주입을 다음과 같이 맡긴다
	@Autowired private MemberService memberService;

	@GetMapping("/login")
	public void login() {
		log.info("/member/login [GET]");

	}
	
	@PostMapping("/login")
	public String loginProc(Member param, HttpSession session) {
		log.info("/member/login [POST]");
		log.info("member param : {}", param);
		
		//로그인 인증 처리 (ID/PASS 확인)
		boolean isLogin = memberService.loginProcess( param );
		log.info("isLogin : " + isLogin);
		
		if( isLogin ) {
			log.info("로그인 성공");
			
			String loginid = param.getId();
			log.info("PK loginid : {}", loginid);
			
			//회원 닉네임 조회
			param = memberService.nick( param );
			String loginnick = param.getNick();
			
			//세션에 로그인 정보 넣기
			//** 세션에 너무 많은 정보를 넣지 말자!(특히 비밀번호는 넣지 말자)
			session.setAttribute("islogin", isLogin); //로그인 상태
			session.setAttribute("loginid", loginid); //PK
			session.setAttribute("loginnick", loginnick); //닉네임
		
		} else {
			log.info("로그인 실패");
			//로그인 실패했을때 로그인 정보 삭제
			session.invalidate();	
		}
		
		return "redirect:./main";
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		log.info("/member/logout [POST]");
		
		//세션 삭제(로그아웃)
		session.invalidate();
		
		//로그아웃 후 메인 페이지로 리다이렉트
		return "redirect:./main";
	}
	
	@GetMapping("/join")
	public void join() {
		log.info("/member/join [GET]");
	}
	
	@PostMapping("/join")
	public String joinProc(Member param) {
		log.info("/member/join [POST]");
		log.info("member param : {}", param);
		
		//회원가입 처리
		boolean isJoin = memberService.joinProcess( param );
		
		log.info("member isJoin : {}", isJoin);
		
		if(isJoin != true) { //회원가입 실패
			return "redirect:./join";
		} else {
			//회원가입 후 메인 페이지로 리다이렉트
			return "redirect:./main";
		}
	}
	@GetMapping("/main")
	public void main() {
		log.info("/member/main [GET]");
	}
}
