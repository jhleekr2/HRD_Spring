package tx.service.face;

public interface TxService {

	/**
	 * 트랜잭션 테스트 메소드
	 * 
	 * 전달된 deptno를 이용하여 DB INSERT를 수행한다
	 * 
	 * 수행할 기능 (트랜잭션)
	 * 1. deptno+1 를 PK로 설정하여 dept테이블에 INSERT
	 * 2. deptno 를 PK로 설정하여 deptno테이블에 INSERT
	 * 
	 * @param deptno
	 */
	public void test(int deptno);
	
	/**
	 * 트랜잭션없이 단독 DML 테스트
	 * 
	 * @param deptno
	 */
	public void test2(int deptno);

}
