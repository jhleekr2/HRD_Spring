package dept.service.face;

import java.util.List;

import dept.dto.Dept;

public interface DeptService {

	/**
	 * 전체 부서 목록 조회
	 * 
	 * @return 조회된 전체 부서 목록
	 */
	public List<Dept> list();
	
	/**
	 * 지정된 deptno에 맞는 사원 정보 조회
	 * 
	 * @param param - 조회할 deptno를 가진 DTO객체
	 * @return 조회된 부서 정보
	 */
	public Dept info(Dept param);
}
