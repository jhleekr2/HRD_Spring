package file.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FileParam {

	private String title;
	private MultipartFile file;
	
}
