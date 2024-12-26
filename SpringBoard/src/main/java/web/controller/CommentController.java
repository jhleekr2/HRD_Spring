package web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import web.dto.Board;
import web.dto.Comment;
import web.service.face.BoardService;

@Controller
@Slf4j
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private BoardService boardService;

	@ResponseBody //응답값을 뷰페이지 없이 그대로 응답 
	@PostMapping("/insert")
	public int insertProc(Model model, Comment param, HttpSession session) {
		log.info("CommentController.insertProc() 호출");
		log.info("userid : {}", param.getUserid());
		log.info("param : {}", param);
		log.info("session: {}", session);
		
		//댓글 추가 - commentController -> boardService -> commentDao -> DB 순서로 데이터 전달
		boardService.commentInsert( param );
		//앞으로 마이바티스 설정 조정해서 result에 따라 result 값을 조정하는 로직을 추가할 수 있다
		//일단은, 무조건 1을 응답한다
		int result = 1;
		return result;
	}
	
	@ResponseBody //응답값을 뷰페이지 없이 그대로 응답 
	@PostMapping("/delete")
	public int deleteProc(Model model, Comment param, HttpSession session) {
		log.info("CommentController.deleteProc() 호출");
		log.info("userid : {}", param.getUserid());
		log.info("param : {}", param);
		log.info("session: {}", session);
		
		//댓글 삭제
		boardService.commentDelete( param );
		//앞으로 마이바티스 설정 조정해서 result에 따라 result 값을 조정하는 로직을 추가할 수 있다
		//일단은, 무조건 1을 응답한다
		int result = 1;
		return result;
	}
	
	@ResponseBody //응답값을 뷰페이지 없이 그대로 응답
	@GetMapping("/view")
//	public List<Comment> view(Board param, Model model) {
	public List<Comment> view(Board param) {
		log.info("CommentController.view() 호출");
		
		// 게시글을 불러올때 댓글리스트를 추가하여 View로 전달
		List<Comment> resultcomm = boardService.commentList( param );
		log.info("조회 결과");
		return resultcomm;
	}
}
