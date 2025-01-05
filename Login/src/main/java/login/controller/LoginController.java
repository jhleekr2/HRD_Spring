package login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
