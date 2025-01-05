package login.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// 이 프로젝트는 롬복 플러그인을 사용한다
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class Login {

	private int no;
	private String id;
	private String pw;
	private String email;
	private String phone;
}
