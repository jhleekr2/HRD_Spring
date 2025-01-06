package login.dao.face;

import login.dto.Login;

public interface LoginDao {

	/**
	 * id, pw 일치하는 행 수 조회하기
	 * 로그인 인증에 사용한다
	 * @param param - 로그인 전달된 id, pw
	 * @return 일치하는 행 수
	 */
	public int selectCntByIdPw(Login param);

	/**
	 * id를 이용하여 no를 알아낸다
	 * @param param - 조회할 id
	 * @return 조회된 no
	 */
	public int selectNoById(Login param);

	/**
	 * 회원 정보 데이터 삽입
	 * 회원 가입에 활용
	 * @param param 전달받은 회원가입 정보
	 */
	public void joinMember(Login param);

	/**
	 * id를 이용하여 no를 알아낸다
	 * 
	 * @param param - 조회할 id
	 * @return 조회된 no
	 */
	public Login selectByNo(int no);

}
