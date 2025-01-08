package interceptor.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import interceptor.service.face.InterceptorService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/interceptor/board")
public class BoardInterceptorController {

	@Autowired private InterceptorService interceptorService;
	
	@GetMapping("/list")
	public void list() {
		log.info("/interceptor/board/list");
	}
	
	@GetMapping("/write")
	public void write() {
		log.info("/interceptor/board/write");
	}
	
	@GetMapping("/noLogin")
	public void noLogin() {
		log.info("/interceptor/board/noLogin");
	}
}
