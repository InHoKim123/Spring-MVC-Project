package in.spring.project.reply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import in.spring.project.reply.dto.ReplyDTO;

@Repository
public class ReplyDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<ReplyDTO> replylist(ReplyDTO replyDTO){
		return sqlSessionTemplate.selectList("Reply", replyDTO);
	}
	
	public void insertReply(ReplyDTO replyDTO) {
		sqlSessionTemplate.insert("ReplyInsert", replyDTO);
	}
	

}
