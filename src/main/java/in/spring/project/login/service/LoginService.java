package in.spring.project.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.spring.project.login.dao.LoginDAO;
import in.spring.project.member.dto.MemberDTO;

@Service
public class LoginService {
	@Autowired
	private LoginDAO loginDAO;
	//로그인
	public int Login(MemberDTO memberDTO) {
		return loginDAO.Login(memberDTO);
	}
	//관리자 번호
	public int Mannum(String id) {
		return loginDAO.Mannum(id);
	}
	//닉네임
	public String Nicname(String id) {
		return loginDAO.Nicname(id);
	}
}
