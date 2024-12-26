package web.service.face;

import java.util.List;

import javax.servlet.http.HttpSession;

import web.dto.Board;
import web.dto.BoardVO;
import web.dto.Comment;
import web.dto.Paging;
import web.dto.RecommendJson;

public interface BoardService {

	/**
	 * 게시물 전체 항목을 조회한다
	 * @return 조회된 게시물 전체 항목
	 * 추천수 조회를 포함하면서 BoardVO라는 DTO를 새롭게 정의하고
	 * BoardVO형식을 반환할 것이다
	 * 마찬가지로 댓글수 조회를 포함할 때도 DB조회에서 서브쿼리를 추가하고
	 * BoardVO DTO를 수정, 추가하는 형식으로 구현할 수 있다
	 */
	public List<BoardVO> list();

	/**
	 * 페이징을 알아낸다
	 * @param paging 현재 페이징 객체
	 * @return 전체 게시물을 반영한 페이징 객체
	 */
	
	public Paging getPaging(Paging paging);
	/**
	 * 페이징된 게시물 항목을 조회한다
	 * @param paging 현재 페이징 객체(전달안되면 자동으로 1페이지 처리)
	 * @return 조회된 페이징된 게시물 항목
	 */
	public List<BoardVO> list(Paging paging);
	
	/**
	 * 선택된 게시물 항목을 조회한다
	 * @param boardno 선택된 게시물 번호
	 * @return 조건에 맞는 게시물 내용
	 */
	public Board view(int boardno);

	/**
	 * 입력한 게시물을 등록한다
	 * @param param 로그인된 사용자 정보와 입력 내용이 포함된 게시물
	 * @return 게시물 번호 
	 */
	public int write(Board param);

	/**
	 * 게시물을 수정하기 위해 선택된 게시물 항목을 조회한다
	 * @param boardno 선택된 게시물 번호
	 * @return 조건에 맞는 게시물 내용
	 */
	public Board updateView(int boardno);
//	public Board boardView(Board param);

	/**
	 * 게시물을 수정한다
	 * @param param 수정할 게시물의 내용
	 */
	public void boardUpdate(Board param);

	/**
	 * 게시물을 삭제한다
	 * @param param 삭제할 게시물의 내용
	 */
	public void boardDelete(Board param);
	
	/**
	 * 추천 서비스
	 * @param isaction 서비스를 호출했을때 수행할 기능들을 정리한다
	 * 	0 - 추천수만 조회한다(로그아웃 상태에서는 무조건 0으로 동작)
	 * 	1 - 추천수를 조회하고, 본인의 추천여부를 확인한다
	 * 	2 - 추천여부를 업데이트 한다
	 * @param param 추천 서비스를 이용할 게시물
	 * @param session 로그인 세션(사용자 로그인정보를 포함)
	 * @return Json으로 반환할 값
	 */
	public RecommendJson recommend(int isaction, Board param, HttpSession session);

	/**
	 * 댓글 목록을 조회한다
	 * @param param 조회하고자 하는 게시글과 로그인 아이디
	 * @return 조회된 댓글 목록
	 */
	public List<Comment> commentList(Board param);

	/**
	 * 댓글을 추가한다
	 * @param param 추가하려는 댓글 내용
	 */
	public void commentInsert(Comment param);
	
	/**
	 * 댓글을 삭제한다
	 * @param param 삭제하려는 댓글 내용
	 */
	
	public void commentDelete(Comment param);


}
