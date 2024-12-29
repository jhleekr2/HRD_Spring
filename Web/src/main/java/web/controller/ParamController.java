package web.controller;

import java.io.Reader;
import java.io.Writer;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import web.dto.User;

@Controller
@RequestMapping("/param")
public class ParamController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/requestParam")
	public String paramForm() {
		logger.info("/param/requestParam [GET]");
		
		return "param/paramForm";
	}
	
	@PostMapping("/requestParam")
	public void paramResult(
			
			//전달 파라미터를 처리(추출)하는 변수
			String username,
//			String userage
			int userage,
			//int형으로 지정해주면 알아서 숫자로 형변환해주긴 하지만
			//숫자가 아닌 문자를 넣으면 문제가 생긴다
			//특히, int형일 때에는 null값(입력안했을때)도 문제가 생긴다
			
			//annotation의 기본값은 value이지만, 역할이 그때그때 다르다
			@RequestParam(value = "username") String test1,
			@RequestParam(name = "userage") String test2,
			//username의 값이 test1에, userage의 값이 test2에 저장된다
			
			@RequestParam(value = "username") String test3,
			@RequestParam(name = "userage") String test4
			) {
		
		logger.info("/param/requestParam [POST]");
//		viewname: 	"param/requestParam"
//		view:		/WEB-INF/views/param/requestParam.jsp
		
		logger.info("username : {}", username);
		logger.info("userage : {}", userage);
		
		//한글이 깨지는데, 서블릿 필터나 Dispatcher Servlet에서 한글 설정해줘야 한다
		//Spring으로 넘어가기 전에 web.xml 파일에서 설정

		//Spring으로 넘어간 후의 설정은 servlet-context.xml + root-context.xml

		logger.info("test1 : {}", test1);
		logger.info("test2 : {}", test2);
		
		logger.info("test3 : {}", test3);
		logger.info("test4 : {}", test4);
	}
	
	@RequestMapping("/required")
	public void paramRequired(
			
			String data1,//필수X
			@RequestParam String data2, //필수O
			
			@RequestParam(required = false) String data3, //필수X
			@RequestParam(required = true) String data4 //필수O
		
			) {
		logger.info("/param/required");
		
		//주소 뒤에 ?data1=Apple넣거나
//		data1 = "Apple";
//		하면 data1에 Apple이 출력될 것이다
		
		//주소 뒤에 ?data1= 하면
//		data1 뒤에 빈칸 출력될 것이다
		
		logger.info("data1 : {}", data1);
		logger.info("data2 : {}", data2);
		
		logger.info("data3 : {}", data3);
		logger.info("data4 : {}", data4);
			
	}
	
	
	@GetMapping("/list")
	public void boardlist(
			
			//페이징에서 사용하는 현재 페이지번호(curPage)는 int형이다
//			String curPage
			
			//curPage 파라미터가 필수가 아니기 때문에 null이 전달될 수 있다
			// -> int형으로 변환하면서 에러 발생한다
//			int curPage
			
			//필수 전달값으로 지정을 되지만, null 또는 ""전달을 막을 수 없다
//			@RequestParam(required = true) int curPage

			//전달값이 null 또는 ""일 경우 "0"으로 대체한다
			// -> int형 변수로 "0"이 전달되어 정수 0으로 변환된다
			@RequestParam(defaultValue = "0") int curPage
			) {
		logger.info("/param/list [GET]");
		logger.info("curPage : {}", curPage);	
	}
	
	@GetMapping("/map")
	public void paramMapForm() {}
	
	@PostMapping("/map")
	public String paramMapResult(
			
			//일반 해시맵 객체 선언
			// -> 전달 파라미터를 추출하지 않는다
			HashMap<String, String> map,
			
			//전달 파라미터를 추출하는 해시맵 선언
			// -> @RequestParam 적용 필수
			@RequestParam HashMap<String, String> paramMap
			//이런식으로 파라미터 추출이 가능하다면, DTO를 만들 필요가 없어진다.
			//-> HashMap이 DTO의 역할을 대신해서 DTO의 문제점을 상당부분 해결할 수 있다.
			//이미 프로젝트에서 HashMap을 적극적으로 사용한 바 있으나, HashMap 자체적인
			//문제점도 많이 있다.
			
			//모델값 객체
			, Model model
			) {
		logger.info("/param/map [POST]");
		
//		HashMap<String, String> map = new 할 필요가 없음.
		// Spring Framework가 알아서 의존성 주입을 해준다.
		logger.info("map: {}", map);
		logger.info("paramMap: {}", paramMap);
		//-----------------------------------------------------------
		
		//모델값 전달 - 객체를 모델값으로 전달한다
		model.addAttribute("m", paramMap); // -> 묶음으로 1개 전달
		
		//모델값 전달 - 맵 객체 내부의 키=값 쌍을 각각의 모델값으로 전달한다
		model.addAllAttributes(paramMap); // -> 6개 전달
		//가끔 세션이랑 헷갈릴 수 있으므로 주의한다!
		//-----------------------------------------------------------
		return "param/result"; //WEB-INF/view/param/result.jsp
	}
	
	@GetMapping("/dto")
	public void paramDtoForm() {}
	
	@PostMapping("/dto")
	public String paramDtoResult(
			
			//** 커맨드 객체(Command Object)
			// -> 전달파라미터 추출 객체
			
			User user,
			@ModelAttribute User user2,
			@ModelAttribute("u3")User user3
			
			//** @ModelAttribute 어노테이션
			// -> DTO객체의 멤버 필드에 맞게 전달 파라미터를 추출한다
			// -> 모델값으로 지정하여 객체를 View에 전달한다
			//(가급적으로 이 방법으로 쓰지 않는 것을 권장)
			
			) {
		
		logger.info("{}",user);
		logger.info("{}",user2);
		logger.info("{}",user3);
		
//		User test = new User("aaaa", "1111");
		User u = new User();
		//롬복 빌더를 이용한 생성
		//(Builder Pattern)
//		User user1 = User.builder()
//					.userage("33")
//					.username("Clare")
//					.build();
		return "param/dtoResult";
	}
	
	@RequestMapping("/sample")
	public void paramTest(
			
			HttpServletRequest req,
			HttpServletResponse resp,
			
			Reader reader,
			Writer writer,
			
			HttpSession session,
			
			@SessionAttribute("name") String data,
			
			@SessionAttribute(value="login", required = false) boolean login
//			,@SessionAttribute(value="loginno", required = false) int loginno
			,@SessionAttribute(value="loginno", required = false) Integer loginno
			) {
		
//		logger.info("{}", req.getParameter("test"));
//		//서블릿에서 했던 getParameter 사용하는 방법
//		
//		try {
//			req.setCharacterEncoding("UTF-8");
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}
//		//서블릿에서 했던 인코딩 설정 변경방법
//		
//		try {
//			req.getRequestDispatcher("JSP").forward(req, resp);
//		} catch (ServletException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		//서블릿에서 했던 getRequestDispatcher 사용하는 방법
		
		//------------------------------------------------------------
		
//		try {
//			resp.sendRedirect("URL");
//			Writer out = resp.getWriter();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		//스프링 프레임워크에서는 try/catch를 안해도 되도록 만들어놨는데
		//스프링 프레임워크에서 서블릿 방식 사용하면 try/catch 해야 하기 때문에
		//좋지 않다
		
		session.setAttribute("name", "value");
		
		logger.info("{}", session.getAttribute("name"));
		
		logger.info("data : {}", data);
		logger.info("login : {}", login);
		logger.info("loginno : {}", loginno);
	}
}
