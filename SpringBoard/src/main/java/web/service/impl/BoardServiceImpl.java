package web.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.BoardDao;
import web.dao.face.CommentDao;
import web.dto.Board;
import web.dto.BoardVO;
import web.dto.Comment;
import web.dto.Paging;
import web.dto.Recommend;
import web.dto.RecommendJson;
import web.service.face.BoardService;

//스프링 프레임워크의 서비스 어노테이션은 인터페이스에 써서는 안된다
@Service
@Slf4j
public class BoardServiceImpl implements BoardService {

	//로그 객체
//	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	//역시 롬복의 @Slf4j 어노테이션으로 대체
	
	//DAO객체 BoardDao 서비스 등록
//	BoardDao boardDao = new BoardDao();
	//위의 코드를 쓰는 대신 스프링 프레임워크에게 의존성 주입을 다음과 같이 맡긴다
	@Autowired private BoardDao boardDao;
	
	//DAO객체 CommentDao 서비스 등록
	@Autowired private CommentDao commentDao;
	
	@Override
	public List<BoardVO> list() {
		
//		logger.info("list() 호출");
		//롬복의 @Slf4j 어노테이션으로 대체되면서
		log.info("list() 호출"); //와 같이 코드가 변경됨
		
		//마이바티스 이용하여 목록 조회 후 반환
		//** 스프링 프레임워크에 마이바티스 연동하기
		//- 스프링 빈으로 마이바티스 관련 객체를 등록한다
		//- 스프링 프레임워크에 마이바티스 설정이 적용된다
		//-> XML 파일 root-context.xml 파일로 설정한다
		return boardDao.selectAll();
	}

	@Override
	public Paging getPaging(Paging paging) {
		// 전달파라미터 curPage 추출하기
		int curPage = paging.getCurPage();
		
		// 전달파라미터 search 추출하기
		String search = paging.getSearch();
		//아래 코드는 스프링 프레임워크 + 롬복 플러그인때문에 사용X
		//테스트 결과 잘못된 요청이 오면 알아서 스프링 프레임워크에서 자체적으로 요청을 거부한다
		
		//서블릿 게시판 만들때는 추가되어야 하는 코드
//		int curPage = 0;
		
//		if( param != null && !"".equals(param) ) {
//			curPage = Integer.parseInt(param);
//		} else {
//			System.out.println("[경고] BoardService - curPage값이 null이거나 비어있음");
//		}
		
		//총 게시글 수 조회하기
//		int totalCount = boardDao.selectCntAll();
		
		//검색어가 반영된 게시글 수 조회하기(없으면 총 게시글 수 조회한다)
		int totalCount = boardDao.selectCntAll( search );
		
		//페이징 계산하기
//		Paging paging2 = new Paging(curPage, totalCount);
		//검색어가 반영된 페이징 계산하기
		Paging paging2 = new Paging(curPage, totalCount, search);
//		Paging paging = new Paging(curPage, totalCount, 30, 5);
		log.info("BoardService.getPaging() : " + paging);
		
		return paging2;
	}

	@Override
	public List<BoardVO> list(Paging paging) {
		// 페이징된 게시물 목록 조회 후 반환
		return boardDao.selectPaging(paging);
	}

	
	@Override
	public Board view(int boardno) {
		log.info("view() 호출");
//		반환값 매개변수 정의
//		Board param = new Board();
		
		//게시물 조회수 +1 늘리기
		boardDao.hit( boardno );
		
		//조회한 게시물 내용 반환
		return boardDao.select( boardno );
	}

	@Override
	public int write(Board param) {
		log.info("write() 호출");
		
		//게시물 DB에 쓰고 쓴 후에 boardDao 리턴값을 받는다
		//리턴값은 파일 업로드 할때 사용될 예정
//		MyBatis INSERT 시 Auto Increment 값 리턴 받기
//
//		MySQL Auto Increment를 적용한 게시글 엔티티를 추가하고, 해당 게시글의 아이디를 FK로 파일 업로드를 구현할 생각이었다.
//		현재 환경은 MyBatis를 사용하고 있었고, 기본적으로 Mybatis는 DML 쿼리에 대해 return 값이 없었기 때문에 A.I로 생성한 PK 값을 가져오는 방법을 찾아보았다.
//
//		해결 방법
//		Mapper.xml에서 useGeneratedKeys 속성을 사용하여 생성된 키 값을 받아올 수 있다.
//		아래와 같이 useGeneratedKeys를 true로 주고, 값을 받아올 필드를 keyProperty 속성으로 지정해 줄 수 있다.
//		<insert id="insertBoard" parameterType="boardVO" 
//				useGeneratedKeys="true" keyProperty="id" keyColumn="id">
//				//INSERT Query	
//			</insert>
//
//		주의 사항
//		단, 이때 아래와 같이 리턴을 받으면 안된다.
//		MyBatis의 INSERT 쿼리의 리턴 값은 INSERT 된 값의 개수를 리턴한다. 즉, 1이라는 값을 반환하게 된다.
//		long id = boardService.insertBoard(boardVO);
//		 
//		위 예시의 keyProperty에 대해 설명할 때 값을 받아올 필드라고 했다.
//		그 말은 INSERT한 VO 객체의 해당 필드에 값이 주입된다는 뜻이다.
//		따라서 아래와 같이 ID 값을 받아올 수 있다.
//
//		boardService.insertBoard(boardVO);
//		Long id = boardVO.getId();
		//출처: https://bbogle2.tistory.com/entry/MyBatis-INSERT-%EC%8B%9C-Auto-Increment-%EA%B0%92-%EB%A6%AC%ED%84%B4-%EB%B0%9B%EA%B8%B0
		boardDao.write( param );
		log.info("boardno : {}" + param.getBoardno());
		
		//추가된 게시물 번호 반환
		return param.getBoardno();
	}

	@Override
	public Board updateView(int boardno) {
		log.info("updateView() 호출");
		
		//조회한 게시물 내용 반환
		return boardDao.select( boardno );
	}

	@Override
	public void boardUpdate(Board param) {
		log.info("boardUpdate() 호출");
		
		// 게시물 수정
		boardDao.updateBoard( param );
		
	}

	@Override
	public void boardDelete(Board param) {
		log.info("boardDelete() 호출");
		
		// 삭제하고자 하는 게시글의 모든 댓글 삭제
		commentDao.deleteCommentWhenRemovingBoard( param );
		// 게시물 삭제
		boardDao.deleteBoard( param );
	}

	//추천 서비스
	public RecommendJson recommend(
			int isaction,
			Board param, 
			HttpSession session) {
		log.info("서비스 recommend() 호출");
		log.info("isaction : {}" + isaction);
		log.info("param : {}" + param);
		log.info("session : {}" + session);
		//추천수 관리하는 Recommend DTO 변수 새로 만듬
		Recommend recommParam = new Recommend(); //boardno, userid
		
		//변수값 대입
		recommParam.setUserid(String.valueOf(session.getAttribute("loginid")));
		recommParam.setBoardno(param.getBoardno());
		
		//isaction = 0일때(리스트에서 조회할때 혹은 로그아웃 된상태에서 조회할때)
		//추천수만 조회한다
		//로그아웃 된 상태에서는 프론트에서 isaction != 0 전달받아도 자동으로 설정을 바꾼다
		
		//아울러 JSON방식으로 전송할 DTO를 새로 정의 -> RecommendJson
		RecommendJson forward = new RecommendJson(); //recommnom, isRecommend

		//추천수를 조회
//		int recommno = boardService.boardRecommend( param ); 
		forward.setRecommno(boardDao.checkRecommend( param )); 
		
		log.info("추천수 : {}", forward.getRecommno());
		
		forward.setIsRecommend(0); //추천여부 기본값은 0으로 구현
		if(	session.getAttribute("islogin") == null ) {
			isaction = 0; //로그인 상태가 아니면 추천수만 조회하는 걸로 끝낸다
		}
		
		//isaction = 1또는 2일때 -> 0이 아닐 경우로 조건 구현
		if(isaction != 0 ) {
			//추천수 조회 및 본인의 추천여부 확인(업데이트 여부에 상관없이 작동한다)
			//이때 반환값이 0이면 추천 X, 그렇지 않다면 추천 O
			//반환값은 AJAX로 전송하여 프론트 출력할때 반영할 것이다
			forward.setIsRecommend(boardDao.isRecommend( recommParam ));
			//반환값 0 : 추천 안함
			//반환값이 0 아님 : 추천함
		}

			//isaction = 2일때
			if(isaction == 2) {
				if(forward.getIsRecommend() == 0) {
					//반환값이 0일때 추천수 추가하고 추천수 및 추천여부 업데이트
					boardDao.insertRecommend( recommParam );
					forward.setRecommno(boardDao.checkRecommend( param )); 
					forward.setIsRecommend(boardDao.isRecommend( recommParam ));			
				} else {
					//반환값이 1일때 추천수 삭제하고 추천수 및 추천여부 업데이트
					boardDao.deleteRecommend( recommParam );
					forward.setRecommno(boardDao.checkRecommend( param )); 
					forward.setIsRecommend(boardDao.isRecommend( recommParam));			
				}
			}
	
		return forward;
	
	
	}

	@Override
	public List<Comment> commentList(Board param) {
		// 게시글에 해당하는 댓글목록을 조회한다
		
		List<Comment> commentList = commentDao.selectCommentByBoardNo(param);
		log.info("commentList : {}", commentList);
		return commentList;
	}

	@Override
	public void commentInsert(Comment param) {
		// 게시글을 등록한다
		commentDao.insertComment( param );
		
	}

	@Override
	public void commentDelete(Comment param) {
		// 게시글을 삭제한다
		commentDao.deleteComment( param );
		
	}




		



}
