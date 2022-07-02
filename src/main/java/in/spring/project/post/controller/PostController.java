package in.spring.project.post.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import in.spring.project.post.dto.PostDTO;
import in.spring.project.post.service.PostService;

@Controller
public class PostController {
	/** * Slf4j Logger */
	private static final Logger logger = LoggerFactory.getLogger(PostController.class);

	@Autowired
	private PostService postService;
	//게시글 전체 검색
	@RequestMapping(value = "PostSelectAll", method = RequestMethod.GET)
	public String postlist(Model model) {
		model.addAttribute("postlist", postService.PostSelectAll());
		logger.info("postlist", model);
		return "./post/post_select_all_view";
	}
	//게시글 전체 검색
	@RequestMapping(value = "PostSelectDetail", method = RequestMethod.GET)
	public String postdetail(Model model, PostDTO postDTO) {
		postService.PostViewUpdate(postService.PostSelectDetail(postDTO.getPostnum()));
		model.addAttribute("postSelectDetail", postService.PostSelectDetail(postDTO.getPostnum()));
		return "./post/post_select_detail";
	}
	//게시글 작성
	@RequestMapping(value = "PostInsert", method = RequestMethod.GET)
	public String postinsert() {
		return "./post/post_insert";
	}
	//게시글 작성
	@RequestMapping(value = "PostInsert", method = RequestMethod.POST)
	public String postinsert(Model model, PostDTO postDTO) {
		model.addAttribute("postlist", postService.PostSelectAll());
		postService.PostInsert(postDTO);
		return "./post/post_insert_view";
	}
	//게시글 수정
	@RequestMapping(value = "PostUpdate", method = RequestMethod.GET)
	public String postupdate(Model model, PostDTO postDTO) {
		model.addAttribute("postlist", postService.PostSelectDetail(postDTO.getPostnum()));
		return "./post/post_update";
	}
	//게시글 수정
	@RequestMapping(value = "PostUpdate", method = RequestMethod.POST)
	public String postupdate(PostDTO postDTO) {
		postService.PostUpdate(postDTO);
		logger.info("postDTO : " + postDTO);
		return "./post/post_update_view";
	}
	//게시글 삭제
	@RequestMapping(value = "PostDelete", method = RequestMethod.GET)
	public String postdelete(Model model, PostDTO postDTO) {
		model.addAttribute("postlist", postService.PostSelectDetail(postDTO.getPostnum()));
		return "./post/post_delete";
	}
	//게시글 삭제
	@RequestMapping(value = "PostDelete", method = RequestMethod.POST)
	public String postdelete(PostDTO postDTO) {
		postService.PostDelete(postDTO.getPostnum());
		return "./post/post_delete_view";
	}
}
