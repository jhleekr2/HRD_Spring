package file.service.face;

import java.util.List;

import file.dto.FileParam;
import file.dto.FileTest;

public interface FileService {

	/**
	 * 요청 파라미터를 처리한다
	 * 폼필드(title), 파일(file)
	 * 
	 * 파일은 upload폴더에 저장하도록 한다
	 * 
	 * DB에 폼필드 정보와 파일 정보를 저장한다
	 * 파일 정보는 upload폴더에 저장한 이름(stored_name), 원본 이름(origin_name)
	 * 
	 * @param param - 폼필드와 파일을 저장한 객체
	 */
	public void filesave(FileParam param);
	
	/**
	 * 업로드된 정보를 조회한다
	 * 
	 * @return - 조회된 목록
	 */
	public List<FileTest> list();
	
	/**
	 * 파일 번호를 이용하여 업로드된 파일의 정보를 조회한다
	 * 
	 * @param fileno - 조회하려는 파일 번호
	 * @return 조회된 파일 정보 객체
	 */
	public FileTest getFile(int fileno);

}
