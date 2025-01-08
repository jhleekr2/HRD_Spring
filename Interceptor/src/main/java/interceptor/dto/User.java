package interceptor.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

//web.dto.User와 interceptor.dto.User가 서로 마이바티스의 Aliases에서 충돌이 일어난다
//그래서 @Alias()어노테이션으로 마이바티스에서의 충돌을 막는다
@Data
@Alias("InterUser")
public class User {
	private int userno;
	private String userid;
	private String userpw;
	private String usernick;
	
}
