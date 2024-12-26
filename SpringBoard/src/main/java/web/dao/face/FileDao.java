package web.dao.face;

import java.util.List;

import web.dto.FileTest;

public interface FileDao {

	/**
	 * DB에 업로드된 파일 명단을 기록
	 * @param fileTest 업로드된 파일의 정보
	 */
	public void insert(FileTest fileTest);

	/**
	 * 게시물 번호에 맞는 파일 목록 조회
	 * @param boardno 게시물 번호
	 * @return 조건에 맞는 파일 정보
	 */
	public List<FileTest> getFileBoardNo(int boardno);

	/**
	 * 파일 번호를 이용하여 조회한다
	 * 
	 * @param fileno - 조회할 파일 번호
	 * @return 조회된 파일 정보
	 */
	public FileTest selectByFileno(int fileno);

	/**
	 * 파일 정보 삭제
	 * @param fileno - 삭제할 파일 번호
	 */
	public void delete(int fileno);

}
