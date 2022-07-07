package in.spring.project.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import in.spring.project.reply.dao.ReplyDAO;
import in.spring.project.reply.dto.ReplyDTO;

@Service
public class ReplyService {
	@Autowired
	private ReplyDAO replyDAO;
	
	public List<ReplyDTO> replylist(ReplyDTO replyDTO){
		return replyDAO.replylist(replyDTO);
	}
	
	public void insertReply(ReplyDTO replyDTO) {
		replyDAO.insertReply(replyDTO);
	}
	
	public void deleteReply(int replynum) {
		replyDAO.deleteReply(replynum);
	}
	
	public void updateReply(ReplyDTO replyDTO) {
		replyDAO.updateReply(replyDTO);
	}
}