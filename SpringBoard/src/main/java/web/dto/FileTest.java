package web.dto;

import lombok.Data;

//파일 처리를 위해 DTO를 두개나 만들었다
//-> DTO의 단점!
//하지만, 프로젝트 규모가 작은 지금은 문제가 없다
//DB용 컬럼 origin_name(언더스코어) -> 자바용 멤버필드 originName(camel case)형태 임에 유의
@Data
public class FileTest {

	private int fileno;
	private int boardno;
	private String originName;
	private String storedName;
}