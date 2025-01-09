package file.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import file.dto.FileTest;
import lombok.extern.slf4j.Slf4j;

//기존 JSTL, JSP를 이용한 View 대신 이번에는 파일을 다운로드하기 위한
//새로운 타입의 View를 만들어 본다.
//응답 View가 기존 HTML(JSP)기반, 여기 만든 파일 다운로드 자바 기반,
//외에도 json으로 응답하는 View 형태도 있다.

//-> REST의 사례!

//REST(Representational State Transfer)
//자원을 이름으로 구분하여 해당 자원의 상태를 주고받는 모든 것을 의미
//-> 서버의 응답을 다양한 형태(json, xml, text, css, ..)로 전달하는 개념

//RESTful
//일반적인 REST 원칙을 따르는 시스템

//REST API(Representational State Transfer API)
//REST 원칙을 따르는 API를 의미한다.

@Slf4j
public class FileDownloadView extends AbstractView {

	@Autowired private ServletContext context;
	
	//API이므로 그냥 오버라이딩해서 개발한다.
	
	@Override
	protected void renderMergedOutputModel(
			Map<String, Object> model, 
			HttpServletRequest req,
			HttpServletResponse resp
			
			) throws Exception {
//		Controller -> viewName: String타입 -> 적절한 view 선택
		log.info("파일 다운로드 응답 테스트");
		//-------------------------------------------------------

		//HTML 응답 테스트
//		response.setContentType("text/html;charset=utf-8");
//		response.getWriter().append("<h1>응답 TEST</h1>");
		//-------------------------------------------------------

		//모델값 가져오기
		FileTest downFile = (FileTest) model.get("downFile");
		
		//파일이 저장된 폴더 (upload)
//		String path = req.getServletContext.getRealPath("upload");
		String path = context.getRealPath("upload");
		
		//업로드된 파일의 이름
		String filename = downFile.getStoredName();
		
		//실제 파일 객체
		File src = new File(path, filename);
	
		log.info("서버에 업로드된 파일 : {}", src);
		log.info("존재 여부 : {}", src.exists());
		//-------------------------------------------------------

		//Response Message
		//HEADER 부분
		//BODY 부분
		// 여기까지 Response Message의 BODY 부분을 완성했다
		// 앞으로 HEADER 부분을 만들고, HEADER 부분과 BODY 부분을 채워넣은 다음
		// 직접 응답 메시지로 보내기까지 해야 파일 다운로드가 실행된다
		
		//** HTTP 응답을 직접 구성해서 처리한다
		
		//** HTTP Message의 Response HEADER, BODY를 설정한다
		// -> HEADER : 응답 설정 속성
		// -> BODY : src(파일)
		
		//** 필수 응답 헤더 속성
		// Content-Type
		// Content-Length
		// CHaracterEncoding
		// Content-Disposition
		
		//-------------------------------------------------------
		
		//** 응답 메시지의 HEADER 영역 설정하기
		
		//응답 데이터의 유형(Content Type)을 설정한다
		// -> application/octet-stream : 모든 파일의 형식을 표현한다
		// -> 브라우저는 해당 형식의 데이터를 응답받으면 다운로드 한다
		resp.setContentType("application/octet-stream");
		
		//응답 데이터의 크기 설정
		// -> 브라우저가 응답 데이터의 끝(EOF)을 알 수 있도록 한다
//		resp.setContentLength( (int) src.length() );
		//이 방식은 2GB 이하의 파일 다운로드 때에만 사용 가능
		
		//따라서 int대신 long을 사용하여 다음과 같이 2GB 초과하는 파일
		//다운로드가 가능하도록 처리한다.
		resp.setContentLengthLong( src.length() );
		
		//응답 데이터의 인코딩 설정
		resp.setCharacterEncoding("UTF-8");
		
		//브라우저가 다운로드할 파일의 이름 설정하기
		// -> 응답 헤더는 띄어쓰기와 한글을 제대로 처리하지 못한다
		// -> URL Encoding을 이용하여 원본 형식을 유지하도록 만든다
		// -> UTF-8 한글 인코딩도 유지된다
//		resp.setHeader("Content-Disposition", "attachment; filename=\"파일명\"");
//		String outputName = downFile.getOriginName(); //한글, 띄어쓰기 처리에 문제가 있다.
		String outputName = URLEncoder.encode( downFile.getOriginName(), "UTF-8" );
		outputName = outputName.replace("+", "%20");

		resp.setHeader("Content-Disposition", "attachment; filename=\"" + outputName + "\"");

		//-------------------------------------------------------

		//** 응답 메시지의 BODY영역 설정하기
		//서버 File객체(src) -> FileInputStream 입력 -> HTTP Response OutputStream 출력
		
		//서버의 파일 입력 스트림 객체
		FileInputStream in = new FileInputStream(src);
		
		//클라이언트의 응답 출력 스트림 객체
		OutputStream out = resp.getOutputStream();
	
		//이제 in에서 out으로 read/write 해주면 된다

		//in스트림에서 out스트림으로 복사
		FileCopyUtils.copy(in, out);
		//Spring Framework에서 제공하는 라이브러리인데 내부 구조는 이전에 배웠던
		//자바 파일 처리 코드로 되어 있다
	}

}
