package login.service.face;

import login.dto.Login;

public interface LoginService {

	/**
	 * 로그인 인증 처리
	 * @param param 로그인 ID, PW
	 * @return 로그인 성공/실패 여부
	 */

	public boolean loginProcess(Login param);

	/**
	 * PK값인 loginno 찾아오기
	 * 
	 * 로그인 폼으로 전달된 id를 활용한다
	 * 
	 * @param param - no를 찾는 데 사용할 id
	 * @return 조회된 no
	 */

	public int getLoginno(Login param);

	/**
	 * 회원가입 처리하기
	 * @param param 회원가입에 필요한 정보
	 */

	public void memberJoin(Login param);

	/**
	 * 사용자 정보 조회하기
	 * @param no - 조회할 PK
	 * @return 조회된 정보
	 */

	public Login info(int no);
}
