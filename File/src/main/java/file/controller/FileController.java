package file.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import file.dto.FileParam;
import file.dto.FileTest;
import file.service.face.FileService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/file")
public class FileController {

	@Autowired private FileService fileService;
	
	@GetMapping("/fileup")
	public void fileForm() {}
	
	@PostMapping("/fileup")
	public String fileProc(
			
			String title,
			@RequestParam("title") String t,
			
			MultipartFile file,
			@RequestParam("file") MultipartFile f,
			
			//DTO로 정의해서 사용할 수도 있다
			FileParam param
			
			) {
		
		log.info("title : {}", title);
		//스프링 프레임워크가 자동으로 fileup.jsp의 title 입력값을
		//title로 전달해줬고, 그것을 호출했다.
		
		log.info("t : {}", t);
		//스프링 프레임워크에 fileup.jsp의 title 입력값을 t로 전달해줌
		//(이때 @RequestParam 어노테이션을 이용)
		//전달이 잘 되었는지 호출해보았다.
		
		//기본 req.getParameter(title)로 꺼낼 수 없다 -> null 처리
		//-> servlet-context.xml 설정 변경 후에는 스프링이 알아서 처리해준다
		//(multipartResolver가 처리해준다)
		
		log.info("file : {}", file);
		//file도 title과 마찬가지
		log.info("f : {}", f);

		log.info("isEmpty : {}", file.isEmpty());
		
		//전달 파라미터 name
		log.info("getName : {}", file.getName());
		
		//원본 파일의 이름
		log.info("getOriginalFilename : {}", file.getOriginalFilename());
		
		log.info("getSize : {}", file.getSize());
		log.info("getContentType : {}", file.getContentType());
		
		log.info("-------------------------------------");
		
		log.info("{}", param);
		
		//파일 정보 처리
		fileService.filesave( param );
		return "redirect:./list";		
	}
	
	@GetMapping("/list")
	public void list( Model model ) {
		//파일 목록 페이지 구현
		
		//파일 리스트 조회
		//전체 목록 조회
		List<FileTest> list = fileService.list();
		
		//모델값으로 조회결과 전달
		model.addAttribute("list", list);
		
		//스프링 프레임워크가 모델값 포함해서 view로 포워딩해준다
	}
	
	@RequestMapping("/download")
	public String download( Model model, int fileno ) {
		//FileDownloadView를 이용해서 Http 응답을 파일로 받아서 처리
		
		//본래는 param dto로 받아야 한다
		log.info("fileno : {}", fileno);
		
		//파일 번호(PK)에 해당하는 파일 정보를 DB에서 가져오기
		FileTest file = fileService.getFile( fileno );
		log.info("file : {}", file);
		
		//모델값 전달
		model.addAttribute("downFile", file);
		
		//viewName을 응답용 객체 뷰(스프링 빈)의 이름으로 지정한다
		return "downView";
	}
}
