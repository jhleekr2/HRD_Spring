package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
}
