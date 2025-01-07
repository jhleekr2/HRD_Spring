package tx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import tx.dao.face.TxDao;
import tx.service.face.TxService;

@Service
@Slf4j
public class TxServiceImpl implements TxService {
	
	@Autowired private TxDao txDao;

	@Override
	@Transactional
	public void test(int deptno) {

		log.info("deptno+1 : {}", deptno + 1);
		log.info("deptno : {}", deptno);

		txDao.insertDeptnoPlus(deptno);
		txDao.insertDeptno(deptno);
		
	}

	@Override
	public void test2(int deptno) {
		log.info("deptno : {}", deptno);
		
		txDao.insertDeptno(deptno);
	}

}
