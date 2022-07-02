package in.spring.project.member.dto;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Setter
@Getter
@ToString
public class MemberDTO {
	private String id;
	private String passwd;
	private String name;
	private String email;
	private String nicname;
	private int managernum;
	private String memberday;
	private String membertech;
	private MultipartFile fileName;
	private String attachedfile;
	private String oldfile;
}
