package web.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Boardfile {

	private int fileNo;
	private int boardNo;
	private String originName;
	private String storedName;
	private MultipartFile file;
}
