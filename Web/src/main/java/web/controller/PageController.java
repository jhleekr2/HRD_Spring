package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/page")
public class PageController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
//		@RequestMapping(value = "/forward")
//		@RequestMapping("URLPattern")

//		@RequestMapping(value = "/forward", method = RequestMethod.GET)
//		@GetMapping("URLPattern")

//		@RequestMapping(value = "/forward", method = RequestMethod.POST)
//		@PostMapping("URLPattern")
	
	@GetMapping("/forward")
	public String forwardPage() {//forwardPage()에 Model, ModelAndView를 매개변수로 넣어봤었다
		logger.info("/page/forward [GET]");
		//-------------------------------------------------------
		
		// 반환된 "viewName"을 이용하여 InternalResourceViewResolver가
		//JSP 파일을 이용하여 포워드한다		
//		return "viewName";
		//-------------------------------------------------------
		
		//지정된 URL경로로 포워드한다
		// -> 다른 컨트롤러나 JSP로 포워드할 수 있다
//		return "forward:URL경로";
//		return "forward:/return/test"; // "/return/test"이 매핑된 컨트롤러 forward
		//(JSP를 포워딩한 것이 아니라는 것에 유의한다)
		
		//JSP포워드 방법
//		req.getRequestDispatcher("/WEB-INF/views/return/test.jsp").forward(req, resp);
		return "forward:/WEB-INF/views/return/test.jsp";
				
	}
	
	@GetMapping("/redirect")
	public String redirectPage() {
		logger.info("/page/redirect [GET]");
		
//		return "redirect:URL경로";
		return "redirect:/return/test2";
	}
	
	@GetMapping("/redirectMav")
	public ModelAndView redirectPageMav(ModelAndView mav) {
		logger.info("/page/redirectMav");
		
		//JSP로 forward
//		mav.setViewName("viewName");
		
		//URL로 forward
//		mav.setViewName("forward:/return/test3");
		//URL은 유지되면서 페이지가 바뀔 것이다
		
		//URL로 redirect
		mav.setViewName("redirect:/return/test3");
		//URL이 변경되면서 페이지가 바뀔 것이다
		
		//아마 JSP forward, URL redirect가 많이 쓰일 것이다
		//URL forward는 가끔 쓰일것으로....
		return mav;
	}

}
