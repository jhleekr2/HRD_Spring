package web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO { //추천수를 보여주기 위해 DTO(VO)를 하나 더 정의했다
	private int boardno;
	private String title;
	private String content;
	private String writerId;
	private String writerNick;
	private int hit;
	private Date writeDate;
	private int recommend;

}
