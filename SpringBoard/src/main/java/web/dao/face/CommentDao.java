package web.dao.face;

import java.util.List;

import web.dto.Board;
import web.dto.Comment;

public interface CommentDao {

	/**
	 * 게시글의 댓글목록을 조회한다
	 * @param param 조회하고자 하는 게시글
	 * @return 조회된 댓글
	 */
	public List<Comment> selectCommentByBoardNo(Board param);

	/**
	 * 게시글의 댓글을 추가한다
	 * @param param 추가하고자 하는 댓글
	 */
	
	public void insertComment( Comment param );
	
	/**
	 * 게시글의 댓글을 삭제한다
	 * @param param 삭제하고자 하는 댓글
	 */
	
	public void deleteComment( Comment param );
	
	/**
	 * 게시글을 삭제할때 게시글의 모든 댓글을 삭제한다
	 * @param param 삭제하고자 하는 게시물 번호
	 */
	
	public void deleteCommentWhenRemovingBoard(Board param);
}
