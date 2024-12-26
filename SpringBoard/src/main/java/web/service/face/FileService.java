package web.service.face;

import java.util.List;

import web.dto.Boardfile;
import web.dto.FileTest;

public interface FileService {

	/**
	 * 파일을 업로드한다
	 * @param fileparam 업로드할 파일 정보 객체
	 */
	public void filesave(Boardfile fileparam);

	/**
	 * 게시물의 번호에 해당하는 업로드된 파일 정보 가져오기
	 * @param boardno 조회하는 게시물 번호
	 * @return 업로드된 파일 정보
	 */
	public List<FileTest> getFileBoardno(int boardno);

	/** 
	 * 다운로드를 위한 파일 정보 가져오기
	 * @param fileno 다운로드받고자 하는 파일 번호
	 * @return 파일 정보
	 */
	public FileTest getFile(int fileno);

	/**
	 * 선택된 파일 삭제
	 * @param fileno 삭제할 파일 번호
	 */
	public void delete(int fileno);

}
