package web.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//@NoArgsConstructor	//디폴트 생성자
//@AllArgsConstructor	//모든 멤버필드를 이용한 생성다
//@ToString				//toString()
//@Getter				//Getter Field
//@Setter				//Setter Field
//@EqualsAndHashCode	//equals(), hashcode()

//@Data
//상단 어노테이션들 중에서 @AllArgsConstructor 를 제외한 나머지 통합

//롬복 자동완성에 뭔가 문제가 있는데, 디폴트 생성자를 살리면서 Builder 쓰기가 조금 난해하다
//이때는 디폴트 생성자를 살리고 디폴트가 아닌 생성자에만 Builder 사용

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class User {

	private String username;
	private String userage;
	
//	public User() {} //롬복 플러그인의 @NoArgsConstructor 로 대체 가능
	
//	public User(String username, String userage) {
//		super();
//		this.username = username;
//		this.userage = userage;
//	} //롬복 플러그인의 @AllArgsConstructor 로 대체 가능

//	@Override
//	public String toString() {
//		return "User [username=" + username + ", userage=" + userage + "]";
//	} //롬복 플러그인의 @ToString 으로 대체 가능

	//Getter, Setter 또한 롬복 플러그인의 @Getter, @Setter 로 대체 가능
	
	//심지어 @EqualsAndHashCode도 현업에서 추가해서 사용한다
//	public String getUsername() {
//		return username;
//	}
//
//	public void setUsername(String username) {
//		this.username = username;
//	}
//
//	public String getUserage() {
//		return userage;
//	}
//
//	public void setUserage(String userage) {
//		this.userage = userage;
//	}
}
