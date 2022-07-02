package in.spring.project.post.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import in.spring.project.post.dto.PostDTO;

@Repository
public class PostDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	//게시글 전체 검색
	public List<PostDTO> PostSelectAll(){
		return sqlSessionTemplate.selectList("PostSelectAll");
	}
	
	//게시글 자세히 보기
	public PostDTO PostSelectDetail(int postnum) {
		return sqlSessionTemplate.selectOne("PostSelectDetail", postnum);
	}
	//게시글 작성
	public void PostInsert(PostDTO postDTO) {
		sqlSessionTemplate.insert("PostInsert", postDTO);
	}
	//게시글 수정
	public void PostUpdate(PostDTO postDTO) {
		sqlSessionTemplate.update("PostUpdate", postDTO);
	}
	//게시글 삭제
	public void PostDelete(int postnum) {
		sqlSessionTemplate.delete("PostDelete", postnum);
	}
	
	//게시글 조회수 증가
	public void PostViewUpdate(PostDTO postDTO) {
		sqlSessionTemplate.update("PostViewUpdate", postDTO);
	}
}
