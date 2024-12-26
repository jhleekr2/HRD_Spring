package web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Board {
	private int boardno;
	private String title;
	private String content;
	private String writerId;
	private String writerNick;
	private int hit;
	private Date writeDate;
}
