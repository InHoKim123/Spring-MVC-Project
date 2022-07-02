package in.spring.project.login.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import in.spring.project.member.dto.MemberDTO;

@Repository
public class LoginDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//로그인
	public int Login(MemberDTO memberDTO) {
		return sqlSessionTemplate.selectOne("Login", memberDTO);
	}
	
	//관리자 번호 
	public int Mannum(String id) {
		return sqlSessionTemplate.selectOne("Mannum", id);
	}
	
	//닉네임
	public String Nicname(String id) {
		return sqlSessionTemplate.selectOne("NicName", id);
	}
	
}
