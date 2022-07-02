package in.spring.project.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.spring.project.post.dao.PostDAO;
import in.spring.project.post.dto.PostDTO;

@Service
public class PostService {

	@Autowired
	private PostDAO postDAO;
	//게시글 전체 검색
	public List<PostDTO> PostSelectAll(){
		return postDAO.PostSelectAll();
	}
	//게시글 자세히 보기
	public PostDTO PostSelectDetail(int postnum) {
		return postDAO.PostSelectDetail(postnum);
	}
	//게시글 작성
	public void PostInsert(PostDTO postDTO) {
		postDAO.PostInsert(postDTO);
	}
	//게시글 수정
	public void PostUpdate(PostDTO postDTO) {
		postDAO.PostUpdate(postDTO);
	}
	//게시글 삭제
	public void PostDelete(int postnum) {
		postDAO.PostDelete(postnum);
	}
	//게시글 조회수
	public void PostViewUpdate(PostDTO postDTO) {
		postDAO.PostViewUpdate(postDTO);
	}
}
