package file.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import file.dao.face.FileDao;
import file.dto.FileParam;
import file.dto.FileTest;
import file.service.face.FileService;
import lombok.extern.slf4j.Slf4j;

@Service //스프링 구성요소 빈
@Slf4j
public class FileServiceImpl implements FileService {
	
	//서비스 객체 연결
	@Autowired private ServletContext context;
	
	//DAO 연결
	@Autowired private FileDao fileDao;
	@Override
	public void filesave(FileParam param) {

		MultipartFile file = param.getFile();
		
		//-----------------------------------------------------------
		if( file.isEmpty() || file.getSize() <= 0 ) {
			log.info("파일 업로드 잘못됨, 처리 중단!");
			
			//파일 처리 메소드 filesave() 중단
			return;
		}
		
		//-----------------------------------------------------------
		//파일의 저장 경로 - Real Path
		String storedPath = context.getRealPath("upload");
		log.info("storedPath : {}", storedPath);
		
		//upload폴더가 없으면 생성하기
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		
		//업로드된 파일이 저장되는 이름
		String storedName = null;
		
		//파일을 저장시킬 객체
		File dest = null;
		
		//매우 낮은 확률로 이전 파일을 덮어씌울 수 있기 때문에 안전장치로 넣어둔 코드
		//저장될 파일명이 중복되지 않도록 반복한다
		do {
			storedName = file.getOriginalFilename(); //원본 파일명
			storedName = UUID.randomUUID().toString().split("-")[4]; //UUID로 변환
			//랜덤 파일명 만드는 법 - 시간 이용법, UUID 이용법, Count 이용법
			//중복이름 검사는 반드시 해야 한다
			dest = new File( storedFolder, storedName );
		} while (dest.exists() );

		//-----------------------------------------------------------

		try {
			//업로드된 임시 파일을 upload 폴더로 옮겨 실제 파일을 생성한다
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//-----------------------------------------------------------
		//DB에 기록하기
		
		FileTest fileTest = new FileTest();
		
		fileTest.setTitle( param.getTitle() );
		fileTest.setOriginName( file.getOriginalFilename());
		fileTest.setStoredName(storedName);
		log.info("fileTest : {}", fileTest);
		
		//-----------------------------------------------------------
		fileDao.insert( fileTest );
	}

	@Override
	public List<FileTest> list() {
		// 업로드된 파일 목록을 조회한다
//		List<FileTest> param = new ArrayList();
//		param = fileDao.selectAll();
//		return param;
		//위의 코드를 다음과 같이 간소화할 수 있다
		return fileDao.selectAll();
		//딱히 서비스단에서 큰 역할 없이 MVC패턴에 맞춰서 그냥 
		//자료들만 전달 주고받기하고 끝
		//** 신입으로 들어가면 첫 1-3년정도는 그냥 자료들만 전달 주고받고만 한다
		//실제 프로젝트 개발시 서비스단에서 큰 역할이 없었었다.
	}

	@Override
	public FileTest getFile(int fileno) {
		return fileDao.selectByFileno(fileno);
	}

}
