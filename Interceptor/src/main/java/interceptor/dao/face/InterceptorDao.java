package interceptor.dao.face;

import interceptor.dto.User;

public interface InterceptorDao {

	/**
	 * userid, userpw가 일치하는 사용자의 수 조회
	 * -> 로그인 인증에 활용
	 * 
	 * @param loginParam - 조회할 userid, userpw를 가진 객체
	 * @return 조회된 사용자 수
	 */
	public int selectCntByIdPw(User loginParam);

	/**
	 * 사용자의 id를 이용하여 사용자 정보를 조회한다
	 * userpw는 제외한다
	 * 
	 * @param loginParam - 조회할 id를 가진 객체
	 * @return 조회된 정보
	 */
	public User selectById(User loginParam);

}
