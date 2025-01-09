package file.dao.face;

import java.util.List;

import file.dto.FileTest;

public interface FileDao {

	/**
	 * 전달된 요청 파라미터 정보 삽입하기
	 * 폼필드(title)
	 * 파일(file)
	 * 
	 * @param fileTest - 업로드된 요청 정보 
	 */
	public void insert(FileTest fileTest);
	
	/**
	 * 업로드된 전체 데이터를 조회한다
	 * 
	 * @return - 조회된 목록 
	 */
	public List<FileTest> selectAll();
	
	/**
	 * 파일 번호를 이용하여 조회한다
	 * 
	 * @param fileno - 조회할 파일 번호
	 * @return 조회된 파일 정보
	 */
	public FileTest selectByFileno(int fileno);

}
