package web.dao.face;

import web.dto.Member;

public interface MemberDao {

	/**
	 * id, pw 일치하는 행 수 조회하기
	 * 
	 * 로그인 인증에 사용한다
	 * 
	 * @param param - 로그인 전달된 id, pw
	 * @return 일치하는 행 수
	 */
	public int selectCntByIdPw(Member param);

	/**
	 * 회원 닉네임 조회
	 * @param param - 로그인 전달된 id(, pw)
	 * @return 닉네임 포함한 회원정보
	 */
	public Member checkMemberNick(Member param);
	
	/**
	 * 중복되는 아이디가 있는지 체크하기
	 * 
	 * 회원가입 절차를 진행시킬지 판단한다
	 * @param param - 입력된 회원가입 정보
	 * @return 중복되는 아이디의 수
	 */
	public int checkMemberId(Member param);

	/**
	 * 회원가입 절차 진행하기
	 * @param param - 입력된 회원가입 정보
	 * @return 회원가입 처리결과
	 */
	public int joinMember(Member param);



}
