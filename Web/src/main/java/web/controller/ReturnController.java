package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/return")
public class ReturnController {

	private static final Logger logger
	= LoggerFactory.getLogger(ReturnController.class);
	
	// 컨트롤러에 공통되는 URL 부분(1 depth) 적고 메소드에는
	//상세 페이지에 대한 URL 부분(2 depth)만 적을 수 있다.

//	@RequestMapping("/return/test")
	@RequestMapping("/test")
	public void returnTest1(Model model) {
		logger.info("/return/test 접속");
		
		//viewName:		"return/test"
		//view:			/WEB-INF/views/return/test.jsp
		
		//모델 값 전달하기
//		model.addAttribute("모델값이름", 모델값데이터);
		
		model.addAttribute("title", "void 반환 타입");
		model.addAttribute("data", "MODEL DATA");
	}
	
//	@RequestMapping("/return/test2")
	@RequestMapping("/test2")
	public String returnTest2(Model model) {
		logger.info("/return/test2 접속");
		//------------------------------------------------------------
		
		//모델 값 전달하기
		
		model.addAttribute("title", "String 반환 타입");
		model.addAttribute("data", "MODEL DATA 2");
		
		//------------------------------------------------------------
		//void반환과 같은 방식으로 처리한다
//		return null;
		
		//viewName을 ""빈문자열로 사용한다
//		return "";
		//빈문자열.jsp가 실제 없기 때문에 사용해선 안된다
		
		//viewName을 직접 지정한다
		return "return/test";
	}
	
//	@RequestMapping("/return/test3")
	@RequestMapping("/test3")
	public ModelAndView returnTest3( ModelAndView mav ) {//의존성 주입해서 사용하기
		logger.info("/return/test3 접속");
		//------------------------------------------------------------
		
		//응답 Body 를 비우겠다는 뜻
		// -> 브라우저에 아무 데이터도 없는 하얀 화면이 나온다
//		return null;
		
		//------------------------------------------------------------
		
		//직접 생성해서 사용하기
//		ModelAndView mav = new ModelAndView();
		
		//viewName 지정하기
//		mav.setViewName(null); //void반환과 동일
//		mav.setViewName(""); //viewName=""
		mav.setViewName("return/test");
		
		//MODEL값 지정하기
		mav.addObject("title", "ModelAndView 반환");
		mav.addObject("data", "MODEL DATA 3");
		
		//내부적으로는 ModelAndView방식으로 합성되어 보여준다
		return mav;
	}
}
