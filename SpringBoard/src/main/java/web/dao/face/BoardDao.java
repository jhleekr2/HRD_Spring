package web.dao.face;

import java.util.List;

import web.dto.Board;
import web.dto.BoardVO;
import web.dto.Paging;
import web.dto.Recommend;

public interface BoardDao {

	/**
	 * 전체 게시판 글 조회
	 * @return 조회된 게시판 글 목록
	 */
	public List<BoardVO> selectAll();

	/**
	 * 전체 게시물의 수 조회
	 * @param search 검색어, 조건에 맞는 글을 조회한다
	 * @return 조회된 게시판 글의 수
	 */
	public int selectCntAll(String search);
	
	/**
	 * 페이징 게시판 글 조회
	 * @param paging 페이징
	 * @return 페이징된 게시판 글 목록
	 */
	public List<BoardVO> selectPaging(Paging paging);
	
	/**
	 * 조회수 증가
	 * @param boardno 조회수를 증가하고자 하는 게시물 번호
	 */
	public void hit(int boardno);

	/**
	 * 선택된 게시글을 조회한다
	 * @param boardno 또는 param 글번호로 게시글 조회
	 * @return 조회된 게시물 내용
	 */
	public Board select(int boardno);
//	public Board selectBoardByBoardNo(Board param);

	/**
	 * 게시글을 등록한다
	 * @param param 등록하고자 하는 게시물
	 */
	public int write(Board param);

	/**
	 * 게시글을 수정한다
	 * @param param 수정하고자 하는 게시물
	 */
	public void updateBoard(Board param);

	/**
	 * 게시글을 삭제한다
	 * @param param 삭제하고자 하는 게시물
	 */
	public void deleteBoard(Board param);

	/**
	 * 게시물 추천수를 확인한다
	 * @param param 확인하고자 하는 게시물 번호
	 * @return 추천수
	 */
	public int checkRecommend(Board param);

	/**
	 * 본인의 추천여부 확인
	 * @param param 추천여부 확인 게시물번호 및 로그인 아이디
	 * @return 추천여부
	 */
	public int isRecommend(Recommend param);

	/**
	 * 추천수를 추가한다
	 * @param param 추천을 추가할 게시물번호및 로그인 아이디
	 */
	public void insertRecommend(Recommend param);

	/**
	 * 추천수를 삭제한다
	 * @param param 추천을 삭제할 게시물번호및 로그인 아이디
	 */
	public void deleteRecommend(Recommend param);




	

	
	
}
