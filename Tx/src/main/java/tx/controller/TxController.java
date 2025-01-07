package tx.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import tx.service.face.TxService;

@Controller
@Slf4j
public class TxController {

	@Autowired private TxService txService;
	
	@RequestMapping("/tx/test")
	public void txTest(int deptno) {
		log.info("/tx/test - deptno : {}", deptno);
		
		txService.test(deptno);
	}
	
	@RequestMapping("/tx/test2")
	public void txTest2(int deptno) {
		log.info("/tx/test2 - deptno : {}", deptno);
		
		txService.test2(deptno);
	}
	
}
