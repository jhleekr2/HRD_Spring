package login.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import login.dao.face.LoginDao;
import login.dto.Login;
import login.service.face.LoginService;
import lombok.extern.slf4j.Slf4j;

//스프링 프레임워크의 서비스 어노테이션은 인터페이스에 써서는 안된다

@Service
@Slf4j
public class LoginServiceImpl implements LoginService {
	
	//로그 객체
//	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//DAO 객체
	@Autowired private LoginDao loginDao;
	
	@Override
	public boolean loginProcess(Login param) {
		//DAO 호출 후 DB로 연결하여 조회한 값을 반환
//		return loginDao.selectLogin( param );
		log.debug("login param : {}", param);
		
		int result = loginDao.selectCntByIdPw( param );
		log.debug("login result : {}", result);
		if ( result > 0 )
			return true;
		return false;
	}

	@Override
	public int getLoginno(Login param) {
		//로그인 회원번호 알아내기
		return loginDao.selectNoById( param );
	}

	@Override
	public void memberJoin(Login param) {
		log.info("memberJoin 호출");
		//회원가입 처리
		loginDao.joinMember( param );
	}

	@Override
	public Login info(int no) {
		//회원정보 조회하기
		return loginDao.selectByNo( no );
	}

}
