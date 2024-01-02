package himedia.project.alomedia.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private Long id;
	private String name;
	private String password;
	private String phone;
	private String mail;
	private String userType;
	private Date birth;
	private String gender;
	private String address;
	private String curriculum;
}
