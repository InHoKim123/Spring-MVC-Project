package in.spring.project.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import in.spring.project.member.dto.MemberDTO;

@Repository
public class MemberDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//회원 전체 검색
	public List<MemberDTO> MemberSelectAll(){
		return sqlSessionTemplate.selectList("MemberSelectAll");
	}
	//특정 회원 정보 검색
	public MemberDTO MemberSelectDetail(String id) {
		return sqlSessionTemplate.selectOne("MemberSelectDetail", id);
	}
	//회원 가입
	public void MemberInsert(MemberDTO memberDTO) {
		sqlSessionTemplate.insert("MemberInsert", memberDTO);
	}
	//회원 정보 수정
	public void MemberUpdate(MemberDTO memberDTO) {
		sqlSessionTemplate.update("MemberUpdate", memberDTO);
	}
	//회원 삭제
	public void MemberDelete(String id) {
		sqlSessionTemplate.delete("MemberDelete", id);
	}
	//아이디 중복 검사
	public int CheckedId(String id) {
		return sqlSessionTemplate.selectOne("CheckedId", id);
	}
}
