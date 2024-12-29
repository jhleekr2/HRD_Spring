package web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	//컨트롤러 안에다가 일반 메소드 작성
	
	//클래스에 있는 Controller annotation과 반드시 짝으로 쓰인다
//	@RequestMapping(value = "요청 URL-Pattern", method = RequestMethod.요청메소드)
//	public void method() {
//	}
	//----------------------------------------------------------------

	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public void list() {
		System.out.println("/board/list [GET]");
		//스프링이 알아서 포워딩까지 해주었다

	}
	@RequestMapping(value = "/board/list", method = RequestMethod.POST)
	public void listProc() {
		System.out.println("/board/list [GET]");
		//스프링이 알아서 포워딩까지 해주었다
	}

	//----------------------------------------------------------------
	
	//** method 속성을 지정하지 않으면 모든 요청 메소드 방식을 처리할 수 있다
	
	//** 같은 URL Pattern에 지정된 메소드 처리 방식이 있다면
	// 해당 메소드를 제외한 나머지 요청 메소드를 처리한다
	
	//POST메소드를 제외한 모든 요청 처리
	@RequestMapping(value = "/board/write")
	public void write() {
		System.out.println("/board/write");
	}
	
	//POST 메소드일 경우에만 실행된다
	@RequestMapping(value = "/board/write", method = RequestMethod.POST)	
	public void writeProc() {
		System.out.println("/board/write [POST]");
	}
	
	//----------------------------------------------------------------
	
	//** 어노테이션에서 value 속성만 단독으로 정의하는 경우
	//  value="속성값" 를 생략하고 "속성값"만 적용할 수 있다
	
	//** 단, 다른 속성값을 설정할 수 없다
	//  (method 속성을 함께 지정할 수 없다)	
	
//	@RequestMapping(value = "/board/update")
//	@RequestMapping("/board/update", method="") - 이 형태는 불가능
	@RequestMapping("/board/update")
	public void update() {
		System.out.println("/board/update");
	}
	
	//----------------------------------------------------------------
	
	@RequestMapping("/board/delete")
	public void delete() {}
	//알아서 URL따라서 delete.jsp 찾고 포워딩되어 화면까지 띄울 것이다	
}
