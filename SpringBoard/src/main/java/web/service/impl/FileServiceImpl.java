package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.BoardDao;
import web.dao.face.FileDao;
import web.dto.Boardfile;
import web.dto.FileTest;
import web.service.face.FileService;

@Service //Spring Component Bean
@Slf4j
public class FileServiceImpl implements FileService {

	//서비스 객체 연결
	@Autowired private ServletContext context;
	
	//DAO 연결
	@Autowired private FileDao fileDao;
	
	@Override
	public void filesave(Boardfile fileparam) {
		log.info("filesave()" );
		log.info("fileparam : {}" + fileparam );
		
		MultipartFile file = fileparam.getFile();
		
		//------------------------------------------------------
		if( file.isEmpty() || file.getSize() <= 0 ) {
			log.info("파일 업로드 잘못됨, 처리 중단!");
			
			//파일 처리 메소드 filesave() 중단
			return;
		}
		
		//------------------------------------------------------
		//파일의 저장 경로 - Real Path
		String storedPath = context.getRealPath("upload");
		log.info("storedPath : {}", storedPath);
		
		//upload 폴더가 없으면 생성하기
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
			storedName += UUID.randomUUID().toString().split("-")[4]; //UUID 추가
			//랜덤 파일명 만드는 법 - 시간 이용법, UUID 이용법, Count 이용법
			//중복이름 검사는 반드시 해야 한다
			dest = new File( storedFolder, storedName );
		} while ( dest.exists() );
		
		//------------------------------------------------------

		try {
			//업로드된 임시 파일을 upload 폴더로 옮겨 실제 파일을 생성한다
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//------------------------------------------------------
		//DB에 기록하기
		FileTest fileTest = new FileTest();
		
		//이때 업로드된 게시물의 글번호는 마이바티스 설정을
		//조절해서 알아낸 상태이다
		fileTest.setBoardno( fileparam.getBoardNo());
		fileTest.setOriginName(file.getOriginalFilename());
		fileTest.setStoredName(storedName);
		log.info("fileTest : {}", fileTest);
		
		//------------------------------------------------------
		fileDao.insert( fileTest );
	}

	@Override
	public List<FileTest> getFileBoardno(int boardno) {
		//업로드된 파일 정보 조회 및 반환
		return fileDao.getFileBoardNo( boardno );
	}

	@Override
	public FileTest getFile(int fileno) {
		// 다운로드하고자 하는 파일 정보 조회
		return fileDao.selectByFileno( fileno );
	}


	@Override
	public void delete(int fileno) {
		// 선택된 파일 삭제
		log.info("delFileno : {}", fileno );
		
		// 삭제하고자하는 파일 정보 조회
		FileTest upload = fileDao.selectByFileno( fileno );
		
		log.info("delete file : {}", upload);
		// 업로드된 실제 파일 삭제
		File file = new File( context.getRealPath("upload"), upload.getStoredName() );
		file.delete();
		
		// 업로드된 DB정보 삭제
		fileDao.delete( fileno );
	}

	
	
}
