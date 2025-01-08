package interceptor.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import interceptor.dao.face.InterceptorDao;
import interceptor.dto.User;
import interceptor.service.face.InterceptorService;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class InterceptorServiceImpl implements InterceptorService {
	@Autowired private InterceptorDao interceptorDao;
	
	@Override
	public boolean login(User loginParam) {
	
		if( interceptorDao.selectCntByIdPw(loginParam) > 0 )
			return true;
		return false;
	}

	@Override
	public User info(User loginParam) {
		return interceptorDao.selectById(loginParam);
	}

}
