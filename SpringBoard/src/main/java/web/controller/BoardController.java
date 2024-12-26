package web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import web.dto.Board;
import web.dto.BoardVO;
import web.dto.Boardfile;
import web.dto.Comment;
import web.dto.FileTest;
import web.dto.Member;
import web.dto.Paging;
import web.dto.RecommendJson;
import web.service.face.BoardService;
import web.service.face.FileService;

@Controller
@Slf4j
@RequestMapping("/board")
public class BoardController {

//	//로그 객체
//	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	// -> 로그 객체 대신에 롬복 라이브러리(외부 라이브러리)의 @Slf4j로 대체함

	// 서비스 객체
//	private DeptService deptService = new DeptServiceImpl();

	// 위의 코드를 쓰는 대신 스프링 프레임워크에게 의존성 주입을 다음과 같이 맡긴다
	@Autowired
	private BoardService boardService;
	// 이때 의존성 주입을 위해 다음의 설정을 해줘야 한다
	// 먼저 servlet-context.xml 파일을 수정해야 한다.
	// <context:component-scan base-package="com.test.www, *.controller, *.service,
	// *.dao" />
	// 를 추가하여 servlet-context.xml파일에 스프링 빈으로 등록을 해야 하며(수정 후 서버 재시작 필요),
	// boardService 인터페이스의 상속을 받는 web.service.impl.BoardServiceImpl 클래스에
	// @Service 어노테이션을 써줘야 한다.
	// 이때, 스프링 프레임워크의 서비스 어노테이션은 인터페이스에 써서는 안된다

	// 파일 처리를 위해 다음의 서비스를 의존성 주입한다
	@Autowired
	private FileService fileService;

	@GetMapping("/list")
	public void list(Paging paging, Model model, HttpSession session) {
		log.info("/board/list [GET]");

		// 전체 목록 조회 - BoardController -> Service -> Dao -> 마이바티스 -> Dao -> Service ->
		// BoardController
//		List<Board> list = boardService.list();
		
		// 추천수를 추가로 보이기 위해 DTO외에 VO를 따로 정의한다
		// -> BoardVO
//		List<BoardVO> list = boardService.list();
		
		// 전달파라미터를 이용하여 현재 페이징 객체 알아내기
		paging = boardService.getPaging( paging );
		
		//페이징 객체를 MODEL값으로 전달
//		req.setAttribute("paging", paging); //스프링 프레임워크에서 알아서 해준다

		//게시글 페이징 리스트 조회
		List<BoardVO> list = boardService.list( paging );
		
		// View로 조회된 모델값 전달
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);

	}

	@GetMapping("/view")
//	boardNo라는 DTO변수명을 유지하면서 주소를 boardno로 쓰기 위한 코드
//	public void boardView( Board param, Model model, @RequestParam("boardno") String boardno ) {
	// 나는 이번에 주소를 boardno로 쓰기 위해 DTO변수명을 바꿔버렸다
	public void boardView(Board param, Model model) {
		log.info("param : " + param);
		log.info("/board/view - boardno : {}", param.getBoardno());
		log.info("model : " + model);

		// 전달받은 boardno에 맞는 게시물 조회
		Board res = boardService.view(param.getBoardno());
		log.info("res : " + res);

		// 조회결과를 모델값에 대입하고 View로 전달
		model.addAttribute("board", res);
		log.info("model : " + model);

		// 업로드된 게시글에 해당하는 파일 리스트 조회하여 파일 정보를 DB에서 호출
		List<FileTest> list = fileService.getFileBoardno(param.getBoardno());
		
		// 게시글을 불러올때 댓글리스트를 추가하여 View에 전달
		List<Comment> commentList = boardService.commentList( param );

		// 아래 두 코드는 실행결과가 같다
		log.info("commentList : {}", commentList);
		log.info("CommentList : " + commentList);

		log.info("filelist : " + list);
		// 조회결과를 모델값에 대입하고 View로 전달
		model.addAttribute("filelist", list);
		// -> 프론트단에서는 filelist라는 이름으로 관련자료 호출해야 한다
		model.addAttribute("commentlist", commentList);
		// -> 프론트단에서는 commentlist라는 이름으로 관련자료 호출해야 한다
	}

//	(아래 코드는 필요 없음이 증명됐기 때문에 삭제 - 개발과정에서 얻어간 것들이 있기에 주석처리로 남겨둠)
//	게시물 수정관련해서 로그인 세션을 활용해야 하기 때문에 session값도 전달
//	public void boardView( Board param, Model model, HttpSession session ) {
	// 로그인된 사용자 아이디를 조회해서 View로 전달
	// 자바스크립트는 약타입 언어라서 Object타입으로 그냥 전달해도 되며
	// 특히, 괜히 toString 따위로 session.getAttribute("loginid")를 형변환했다가
	// NullPointException 따위의 에러가 발생할 수 있기 때문에 그냥 Object 타입으로 두었다.
//	Object user = session.getAttribute("loginid");
//	String user = session.getAttribute("loginid").toString(); //NullPointerException 발생

	// 물론, 굳이 타입 맞추려면 조건식으로 null같은 경우를 거르고 타입 변환하면 되긴 하다
//	model.addAttribute("user", user);
//}

	@GetMapping("/write")
	public String write(Member param, HttpSession session) {
		log.info("/board/write [GET]");
		// 세션 값 전달하여 세션에 유효한 로그인 정보가 있으면 글쓰기에 활용하고
		// 없으면 로그인으로 이동한다
		log.info("login ? " + session.getAttribute("islogin"));
		if (session.getAttribute("islogin") != null) {
			// 유효한 로그인 정보 있을 때
			return "./board/write";
		} else {
			// 유효한 로그인 정보 없을 때
			return "redirect:../member/login";
		}
		// 로그인 세션 관련 처리를 인터셉터를 통하도록 설계 변경할 수 있다
	}

	@PostMapping("/write")
	public String writeProc(

			@RequestParam("title") String title, @RequestParam("content") String content, MultipartFile file,
			// 제목과 내용 입력이 DTO와 다르기 때문에 RequestParam이 필요하며
			// 아이디와 닉네임은 세션에 있는 아이디와 닉네임정보를 꺼내 쓴다
			// 이때 파일자체는 MultipartFile file로 꺼내오고
			// 파일관련 Param을 DTO fileparam으로 따로 정의해서 사용한다
			Board param, Boardfile fileparam, Model model, HttpSession session) {
		log.info("/board/write [POST]");
		log.info("param : {}", param);
		log.info("model : {}", model);
		log.info("title : {}", title);
		log.info("content : {}", content);
		// 기본 req.getParameter(title)로 꺼낼 수 없다 -> null 처리
		// -> servlet-context.xml 설정 변경 후에는 스프링이 알아서 처리해준다
		// (multipartResolver가 처리해줌)

		// 여기서 한글이 깨지는 문제가 발생했다!
		// 한글 깨짐 문제 해결 필요!
		// -> web.xml 파일을 수정해야 한다.

		// 입력된 제목과 내용을 param에 넣는다
		param.setContent(content);
		param.setTitle(title);

		// 세션 아이디와 닉네임정보를 param에 넣는다.
//		session.setAttribute("loginid", loginid); //PK
//		session.setAttribute("loginnick", loginnick); //닉네임
//		param.setWriterId(session.getAttribute("loginid").toString());
//		param.setWriterNick(session.getAttribute("loginnick").toString());

		// 혹시모를 NullPointerException 막기위해서
		param.setWriterId(String.valueOf(session.getAttribute("loginid")));
		param.setWriterNick(String.valueOf(session.getAttribute("loginnick")));

		log.info("writerId: {}", param.getWriterId());
		log.info("writerNick: {}", param.getWriterNick());

		// 그리고, param 내용을 DB에 반영하여 글을 등록하고
		param.setBoardno(boardService.write(param));
		// 이때 업로드한 글의 번호를 마이바티스를 통해 반환해 왔고
		// 그것을 param에 넣었다

		log.info("file : {}", fileparam);

		// 파일관련 param에 마이바티스에서 반환된 업로드된 글번호를
		// 넣었다
		fileparam.setBoardNo(param.getBoardno());

		// 파일처리 DB를 따로 만들어서 연결한다
		log.info("file : {}", file);

		// 파일이 비어있는지 확인
		log.info("isEmpty : {}", file.isEmpty());

		// 전달 파라미터 name
		log.info("getName : {}", file.getName());

		// 원본 파일의 정보
		log.info("getOriginalFilename : {}", file.getOriginalFilename());
		log.info("getSize : {}", file.getSize());
		log.info("getContentType : {}", file.getContentType());

		log.info("file : {}", fileparam);

		// 파일 정보 처리
		fileService.filesave(fileparam);

		return "redirect:../board/list";
	}

	@GetMapping("/update")
	public String update(Board param, Model model, HttpSession session) {
		log.info("/board/update [GET]");
		// 세션 값 전달하여 세션에 유효한 로그인 정보와 글쓴이가 일치한지 확인하여
		// 일치하지 않다면, 해당 글의 수정을 거부하고 글 목록으로 돌아간다
		log.info("loginid ? " + session.getAttribute("loginid"));

		Board res = boardService.updateView(param.getBoardno());
//		Board res = boardService.boardView( param );
		log.info(res.getWriterId());
		log.info(String.valueOf(session.getAttribute("loginid")));

		log.info("작성자 id와 로그인 id 비교 : " + res.getWriterId().equals(String.valueOf(session.getAttribute("loginid"))));

		if (res.getWriterId().equals(String.valueOf(session.getAttribute("loginid")))) {
			// 작성자 ID와 로그인 ID가 같을 때

			// 조회결과를 모델값에 대입하고 View로 전달
			model.addAttribute("board", res);
			log.info("model : " + model);

			// 업로드된 게시글에 해당하는 파일 리스트 조회하여 파일 정보를 DB에서 가져온다
			List<FileTest> list = fileService.getFileBoardno(param.getBoardno());

			log.info("filelist : " + list);
			// 조회결과를 모델값에 대입하고 View로 전달
			model.addAttribute("filelist", list);
			// -> 프론트단에서는 filelist라는 이름으로 관련자료 호출해야 한다

			return "./board/update";
		} else {
			// 작성자 ID와 로그인 ID가 다를 때 목록으로 돌아간다
			return "redirect:../board/list";
		}
		// 여기서 로그인되지 않았을때 에러가 발생할 수 있는데
		// 추가 로직을 짜거나, 인터셉터 등의 기능을 이용해서 페이지
		// 접근을 막는 등의 방법으로 회피할 수 있다

	}

	@PostMapping("/update")
	public String updateProc(@RequestParam("title") String title, @RequestParam("content") String content,
			@RequestParam(value = "delCheck", required = false) List<String> delFiles, // 삭제할 파일 번호
			MultipartFile file, // 새로 업로드할 파일
			Board param, Boardfile fileparam, Model model, HttpSession session) {
		log.info("/board/update [POST]");

		// 이 부분의 코드는 게시글 작성 때와 유사
		log.info("param : {}", param);
		log.info("model : {}", model);
		log.info("title : {}", title);
		log.info("content : {}", content);

		// 입력된 제목과 내용을 param에 넣는다
		param.setContent(content);
		param.setTitle(title);

		// 세션 아이디와 닉네임정보를 param에 넣는다.
//		param.setWriterId(session.getAttribute("loginid").toString());
//		param.setWriterNick(session.getAttribute("loginnick").toString());
		// 혹시모를 NullPointerException 막기위해서
		param.setWriterId(String.valueOf(session.getAttribute("loginid")));
		param.setWriterNick(String.valueOf(session.getAttribute("loginnick")));

		log.info("writerId: {}", param.getWriterId());
		log.info("writerNick: {}", param.getWriterNick());

		// 그리고, param 내용을 DB에 반영하여 글을 수정하고
		boardService.boardUpdate(param);

		// 이때 업로드한 글의 번호를 마이바티스를 통해 반환해 왔고
		// 그것을 param에 넣었다
		// 글 등록 부분은 비활성화

		log.info("file : {}", fileparam);

		// 파일관련 param에 마이바티스에서 반환된 업로드된 글번호를
		// 넣었다
		// 여기서는 파일관련 param에 마이바티스에서 반환된 업로드된 글번호를 넣는 것이 아니라
		// param에 있는 글 번호를 파일관련 param에 넣어주면 된다
		// 단, 이러나저러나 코드상으로는 같다
		fileparam.setBoardNo(param.getBoardno());

		// 기존 파일 삭제처리

		// 삭제할 파일 번호
		log.info("delFiles : {}", delFiles);

		// file관련 루틴
		if (delFiles != null) {
			for (String fileno : delFiles) {
				log.info("Deleting file with fileno: {}", fileno);
				fileService.delete(Integer.parseInt(fileno)); // fileno를 정수로 변환하여 삭제 메서드 호출
			}
		}
		// 파일처리 DB를 따로 만들어서 연결한다
		log.info("file : {}", file);

		// 파일이 비어있는지 확인
		log.info("isEmpty : {}", file.isEmpty());

		// 전달 파라미터 name
		log.info("getName : {}", file.getName());

		// 원본 파일의 정보
		log.info("getOriginalFilename : {}", file.getOriginalFilename());
		log.info("getSize : {}", file.getSize());
		log.info("getContentType : {}", file.getContentType());

		log.info("file : {}", fileparam);

		// 파일 정보 처리(기존파일 업로드 부분을 재사용)
		fileService.filesave(fileparam);

		return "redirect:../board/list";

	}

	@GetMapping("/delete")
	public String delete(Board param, Model model, HttpSession session) {
		log.info("/board/delete [GET]");
		// 세션 값 전달하여 세션에 유효한 로그인 정보와 글쓴이가 일치한지 확인하여
		// 일치하지 않다면, 해당 글의 삭제를 거부하고 글 목록으로 돌아간다
		log.info("loginid ? " + session.getAttribute("loginid"));

		Board res = boardService.updateView(param.getBoardno());
//		Board res = boardService.boardView( param );
		log.info(res.getWriterId());
		log.info(String.valueOf(session.getAttribute("loginid")));

		log.info("작성자 id와 로그인 id 비교 : " + res.getWriterId().equals(String.valueOf(session.getAttribute("loginid"))));

		if (res.getWriterId().equals(String.valueOf(session.getAttribute("loginid")))) {
			// 작성자 ID와 로그인 ID가 같을 때

			// 조회결과를 모델값에 대입하고 View로 전달
			model.addAttribute("board", res);
			log.info("model : " + model);

			// 업로드된 게시글에 해당하는 파일 리스트 조회하여 파일 정보를 DB에서 가져온다
			List<FileTest> list = fileService.getFileBoardno(param.getBoardno());

			log.info("filelist : " + list);

			// 조회된 파일들을 전부 삭제한다
			for (FileTest file : list) {
				log.info("Deleting file with fileno: {}", file.getFileno());
				fileService.delete(file.getFileno()); // 각 파일의 fileno로 삭제
			}

			// 게시글에 포함된 댓글도 삭제하는 로직이 필요하다 - BoardServiceImpl에서 구현!
			
			
			// 게시글 삭제
			boardService.boardDelete(param);
			

		}
		// 작성자 ID와 로그인 ID가 다를 때는 위의 로직을 건너뛴다
		//
		return "redirect:../board/list";
	}

	@RequestMapping("/download")
	public String download(Model model, int fileno) {
		// FileDownloadView를 이용해서 Http 응답을 파일로 받아서 처리

		// 본래는 param dto로 받아야 한다
		log.info("fileno : {}", fileno);

		// 파일 번호(PK)에 해당하는 파일 정보를 DB에서 가져오기
		FileTest file = fileService.getFile(fileno);
		log.info("file : {}", file);

		// 모델값 전달
		model.addAttribute("downFile", file);

		// viewName을 응답용 객체 뷰(스프링 빈)의 이름으로 지정한다
		return "downView";
	}

	@ResponseBody //응답값을 뷰페이지 없이 그대로 응답 
	@GetMapping("/recommend")
	public RecommendJson recommend(
			@RequestParam("isaction") int isaction, //AJAX에서 매개변수 추가하여 변수 여부에 따라 다르게 동작
			Board param, Model model, HttpSession session) {
		//추천수 관리를 위해서 Recommend라는 DTO를 추가로 정의(실제로 Recommend 테이블이 존재)
		log.info("recommend() [GET]");
		log.info("model : {}", model);
		log.info("session : {}", session);
		log.info("isaction : {}", isaction);
		
		log.info("param : {}", param);
		
		//컨트롤러가 너무 비대화된 탓에, 지나치게 길어진 컨트롤러를 서비스로 분리하는 방침을 세웠다.
		//현재는 로그인된 사용자만 추천이 정상적으로 작동하며, 앞으로 로그인안됐을때는 로그인하라는
		//알림창을 띄우는 방향으로 기능 개선도 고려해볼수있다
		RecommendJson forward = boardService.recommend(isaction, param, session);
		//추천수 관리하는 Recommend DTO 변수 새로 만듬
		
		log.info("forward : {}", forward);
		return forward;
	}
	
	//선택게시물삭제기능 - AI의 도움을 받았으며, 추후 분석 예정!
	@PostMapping("/listdelete")
	@ResponseBody
	public ResponseEntity<String> listdelete(@RequestBody Map<String, List<Integer>> request) {
		List<Integer> ids = request.get("ids"); // 체크된 게시물 ID 목록을 가져옵니다.
		
	    if (ids != null && !ids.isEmpty()) {
	        // 게시물 삭제 서비스 호출
	    	
	        for (Integer id : ids) {
	        	Board param = new Board();
	        	param.setBoardno(id);
	        	
				// 업로드된 게시글에 해당하는 파일 리스트 조회하여 파일 정보를 DB에서 가져온다
				List<FileTest> list = fileService.getFileBoardno(param.getBoardno());

				log.info("filelist : " + list);

				// 조회된 파일들을 전부 삭제한다
				for (FileTest file : list) {
					log.info("Deleting file with fileno: {}", file.getFileno());
					fileService.delete(file.getFileno()); // 각 파일의 fileno로 삭제
				}
	        	
	        	boardService.boardDelete(param); // 각 ID로 삭제 메서드 호출
	        }
	        return ResponseEntity.ok("삭제되었습니다."); // 성공 응답
	    } else {
	        return ResponseEntity.badRequest().body("삭제할 게시물이 없습니다."); // 실패 응답
	    }
	}
}
