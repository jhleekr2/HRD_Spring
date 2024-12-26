package web.service.face;

import web.dto.Member;

public interface MemberService {

	/**
	 * 입력받은 회원정보를 바탕으로 로그인 과정을 처리한다
	 * @param param 입력받은 회원정보
	 * @return 로그인 성공/실패
	 */
	public boolean loginProcess(Member param);

	/**
	 * 입력받은 회원정보를 바탕으로 회원 가입과정을 처리한다
	 * @param param 입력받은 회원정보
	 * @return 회원가입 성공/실패
	 */
	public boolean joinProcess(Member param);

	/**
	 * 로그인된 아이디를 바탕으로 회원의 닉네임 정보를 조회한다
	 * @return 회원의 닉네임 정보가 포함된 조회결과
	 */
	public Member nick(Member param);


}
