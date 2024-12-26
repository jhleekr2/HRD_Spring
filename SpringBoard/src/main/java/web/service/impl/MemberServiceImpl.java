package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.MemberDao;
import web.dto.Member;
import web.service.face.MemberService;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService {

	//DAO 객체
	@Autowired private MemberDao memberDao;
	
	@Override
	public boolean loginProcess(Member param) {
		log.debug("login param : {}", param);
		//DAO 호출 후 DB로 연결해서 조회한 값을 반환
		
		int result = memberDao.selectCntByIdPw( param );
		log.debug("login result : {}", result);
		if( result > 0 )
			return true;
		return false;
	}

	@Override
	public Member nick(Member param) {
		log.debug("nick param : {}", param);
		//DAO 호출 후 DB로 연결해서 닉네임 조회하고 반환
		return memberDao.checkMemberNick( param );
	}

	@Override
	public boolean joinProcess(Member param) {
		log.debug("join param : {}", param);
		//DAO 호출 후 DB로 연결해서 회원가입 시도하고 실패하면 false 반환
		
		//아이디 중복 체크
		int result = memberDao.checkMemberId( param ); //중복이 있으면 1, 없으면 0 반환한다
		if (result > 0 ) //중복되는 아이디가 있을때 회원가입 절차 중단
			return false;
		else { //중복되는 아이디가 없을때 회원가입 절차 진행
			result = memberDao.joinMember( param ); //성공하면 1, 실패하면 0 반환한다
			log.debug("join result : {}", result);
			if(result <= 0) { //회원가입 절차 실패
				return false;
			}
			return true;
		}
	}

}
