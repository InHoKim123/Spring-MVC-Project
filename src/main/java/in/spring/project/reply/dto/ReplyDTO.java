package in.spring.project.reply.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Setter
@Getter
@ToString
public class ReplyDTO {

	private int pnum; //글 번호
	private int replynum; //댓글 번호
	private String replycontent; //댓글 내용
	private String replywriter; //댓글 작성자
	private String replyday; //댓글 작성일
}
