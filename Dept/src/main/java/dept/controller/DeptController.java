package dept.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.Conventions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import dept.dto.Dept;
import dept.service.face.DeptService;
import lombok.extern.slf4j.Slf4j;

//로그 객체를 정의하지 않고 사용하기 위해서 롬복의 @Slf4j annotation을 사용하고
//기존 logger.info 대신 log.info 형태로 바꿔서 사용한다
@Controller
@Slf4j
public class DeptController {

	//로그 객체
//	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//서비스 객체
//	private DeptService deptService = new DeptServiceImpl();
	//스프링 프레임워크에게 의존성 주입을 다음과 같이 맡긴다
	
	@Autowired private DeptService deptService;
	
	@GetMapping("/dept/list")
	public void list( Model model ) {
//		logger.info("dept/list [GET]");
		log.info("dept/list [GET]"); //@Slf4j 추가 필요(롬복)
		
		List<Dept> list = deptService.list();
		
		log.info("list -> {}", Conventions.getVariableName(list));
		//모델값이름을 빼먹고 전달할 때 어떤 형태로 전달될지를 보여준다
		
		model.addAttribute("list", list);
		//여기서는 deptList로 전달된다.
	}
	
	@GetMapping("/dept/info")
	public void info( Dept param, Model model ) {
		log.info("/dept/info - deptno : {}", param.getDeptno());
		
		Dept res = deptService.info(param);
		model.addAttribute("res", res);
		model.addAttribute("dept", res);
		model.addAttribute(res); //모델값 key를 클래스의 첫 글자만 소문자로 바꿔서 전달한다 
		//객체만 전달하는 방법을 사용하면 JSP에서 제대로 출력이 안된다
		//모델값 이름전달을 빼먹는 실수를 저지르지 말자!
		//만일 모델값이름을 빼먹고 전달할 경우에는 데이터타입에서 앞글자만 소문자로 바꿔서 보내준다
		//즉, model.addAttribute(res); == model.addAttribute("dept", res); 를 의미한다
	}
	
}
