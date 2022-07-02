package in.spring.project.post.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Setter
@Getter
@ToString
public class PostDTO {
	private int postnum;
	private String postname;
	private String postpasswd;
	private String postcontent;
	private String postwriter;
	private String postwriteday;
	private int views;
	private String postkind;
	private String attachedfile;
}
