package in.spring.project.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.spring.project.member.dao.MemberDAO;
import in.spring.project.member.dto.MemberDTO;

@Service
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;
	//회원 전체 검색
	public List<MemberDTO> MemberSelectAll(){
		return memberDAO.MemberSelectAll();
	}
	//특정 회원 정보 검색
	public MemberDTO MemberSelectDetail(String id) {
		return memberDAO.MemberSelectDetail(id);
	}
	//회원 가입
	public void MemberInsert(MemberDTO memberDTO) {
		memberDAO.MemberInsert(memberDTO);
	}
	//회원 정보 수정
	public void MemberUpdate(MemberDTO memberDTO) {
		memberDAO.MemberUpdate(memberDTO);
	}
	//회원 삭제
	public void MemberDelete(String id) {
		memberDAO.MemberDelete(id);
	}
	//아이디 중복 검사
	public int CheckedId(String id) {
		return memberDAO.CheckedId(id);
	}

}
