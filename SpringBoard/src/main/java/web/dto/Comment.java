package web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Comment {
	private int commentno;
	private int boardno;
	private String userid;
	private String content;
	private Date writeDate;
}
