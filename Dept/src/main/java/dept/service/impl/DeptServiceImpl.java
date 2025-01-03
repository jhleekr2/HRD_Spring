package dept.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dept.dao.face.DeptDao;
import dept.dto.Dept;
import dept.service.face.DeptService;
import lombok.extern.slf4j.Slf4j;

//스프링 프레임워크의 서비스 어노테이션은 인터페이스에 써서는 안된다
@Service
@Slf4j
public class DeptServiceImpl implements DeptService {
	
	//로그 객체
//	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//DAO 객체
	@Autowired private DeptDao deptDao;
	
	@Override
	public List<Dept> list() {
//		logger.info("list() 호출");
		log.info("list() 호출!!!"); //@Slf4j 추가 필요(롬복)
		return deptDao.selectAll();
	}

	@Override
	public Dept info(Dept param) {
		log.info("info({})", param.getDeptno());
		
		return deptDao.selectByDeptno(param);
	}
}
