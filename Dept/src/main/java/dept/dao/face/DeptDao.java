package dept.dao.face;

import java.util.List;

import dept.dto.Dept;

public interface DeptDao {

	/**
	 * 전체 부서 정보 조회
	 * 
	 * @return 조회된 부서 목록
	 */
	public List<Dept> selectAll();
	
	/**
	 * 부서 번호를 이용한 부서 정보 조회
	 * 
	 * @param param - 부서 정보(deptno) 객체
	 * @return 조회된 부서 정보
	 */
	public Dept selectByDeptno(Dept param);
}
