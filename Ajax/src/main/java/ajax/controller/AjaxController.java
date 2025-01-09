package ajax.controller;

import java.io.IOException;
import java.io.Writer;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ajax.dto.ResultData;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/ajax")
public class AjaxController {

	// 1. 응답 출력 스트림으로 JSON Text를 직접 응답하기
	// -> 아주 간단하고 형식적인 응답을 보내야 할 때만 사용
	@RequestMapping("/test01")
	public void ajaxTest01() {}
	
	//컨트롤러 메소드 - URL이 매핑
	//AJAX의 응답 데이터는 주소값으로 직접 들어갔을 때랑 같다
	//단지, 응답 데이터가 화면에 직접 표시되지 않을 뿐이다
	
	//응답 데이터는 브라우저에 출력하지 않고 XHR로 보관하는데
	//이 보관하는 것을 AJAX라고 부른다
	//여기서는 test01.jsp의 res객체에 들어있다
	//test01_ok.jsp 만들지 않은 상태에서는 AJAX가 실패했다고 뜰텐데,
	//응답 자료의 형태가 일치하지 않거나, 오류 형태로 오기 때문에 실패했다고
	//뜨는 것이다
	@RequestMapping("/test01_ok")
	public void ajaxTest01_ok( Writer out ) {
		//응답 출력부분을 건들면, ViewResolver가 동작하지 않는다
		
		try {
			out.append("{\"msg\": \"response data\"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//------------------------------------------------------------
	
	// 2. @ResponseBody 를 이용하여 객체를 JSON Text로 응답하기
	
	//@ResponseBody 어노테이션
	// ViewResolver 의 도움을 받지 않고 컨트롤러 메소드에서 직접 응답을
	//출력하겠다는 설정이다
	
	//컨트롤러 메소드의 return 값을 응답 데이터로 사용한다
	
	//** JSON Text 로 변환해서 처리해야 한다
	// -> String 타입은 원본 데이터 그대로 응답할 수 있지만
	// 객체(DTO, Map 등) 타입은 응답 데이터로 사용할 수 없다
	// -> Jackson Databind 라이브러리를 이용해야 JSON으로 변환한다
	
	//** Jackson 프로젝트
	// 자바 객체 <-> JSON Text 변환을 도와주는 라이브러리들의 모음
	
	//** Jackson Databind 라이브러리
	// 자바에서 스트림을 이용해 객체를 전송할 때 JSON Text로 데이터를 변환한다
	
	@RequestMapping("/test02")
	public void test02() {}
	
//	@RequestMapping("/test02_ok")
//	@ResponseBody
//	public String ajaxTest02_ok() {
//		
//		return "HIHI";
		//viewName -> HIHI 를 스프링 프레임워크가 ViewResolver의 BeanName을 찾고
		//없으면, InternelResource ViewResolver 에서 찾을 것이다 -> HIHI.jsp를
		//찾아야 한다(이는 servlet-context.xml 파일에 정의되어 있다)
//		return "{\"data\": \"Apple\"}";
//	}
		
	@RequestMapping("/test02_ok")
	@ResponseBody
	public ResultData ajaxTest02_ok() {
	
		//DTO를 @ResponseBody를 적용해 직접 응답 출력하기 -> 오류 발생(406)
		//따라서, DTO는 직접 AJAX로 보낼 수 없고, DTO를 AJAX로 보내는 라이브러리가 존재한다
		// -> Jackson Databind 라이브러리가 자동으로 JSON Text로 변환한다
		return new ResultData("Banana", 98765);
	}
	
	//------------------------------------------------------------

	// 3. JSON 응답을 생성하는 전용 jsonView 사용하기
	
	@RequestMapping("/test03")
	public void test03() {}
	
	@RequestMapping("/test03_ok")
	public String ajaxTest03_ok( Model model ) {
		
		model.addAttribute("rd", new ResultData("Cherry", 74837));
		
		return "jsonView";
	}
	
	//------------------------------------------------------------
	// 4. AJAX의 응답으로 JSP응답(View)을 활용하기
	// -> JSP를 통해 완성된 HTML코드를 응답데이터로 전달한다
	// 이 방식은 웹사이트를 서버에서 렌더링하는 방식이다.
	
	@RequestMapping("/test04")
	public void test04() {}
	
	@RequestMapping("/test04_ok")
	public String ajaxTest04_ok( Model model ) {
		
		model.addAttribute("rd", new ResultData("Durian", 36477));
		return null;
	}

}
