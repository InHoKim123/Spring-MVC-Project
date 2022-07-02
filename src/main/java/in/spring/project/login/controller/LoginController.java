package in.spring.project.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import in.spring.project.login.service.LoginService;
import in.spring.project.member.dto.MemberDTO;

@Controller
public class LoginController {
	/** * Slf4j Logger */
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private LoginService loginService;
	
	@RequestMapping(value = "Login", method = RequestMethod.GET)
	public String login() {
		return "./login/login";
	}
	
	@RequestMapping(value = "Login", method = RequestMethod.POST)
	public String login(@RequestParam("id") String id, @RequestParam("passwd") String passwd,
						HttpServletRequest request, HttpSession httpSession, MemberDTO memberDTO) {
		httpSession = request.getSession();
		memberDTO.setId(id);
		memberDTO.setPasswd(passwd);
		int result = loginService.Login(memberDTO);
		logger.info("dd" +result);
		//sql문 count(*)의 값이 0이면 => 일치하는 아이디가 없으므로 로그인 실패, 1이면 로그인
		if (result == 1) {
			int mannum = loginService.Mannum(id);
			String nicname = loginService.Nicname(id);
			logger.info("번호" + mannum);
			logger.info("닉네임" + nicname);
			//세션 저장
			//아이디
			httpSession.setAttribute("id", memberDTO.getId());
			//비밀번호
			httpSession.setAttribute("passwd", memberDTO.getPasswd());
			//관리자 여부
			httpSession.setAttribute("seman", mannum);
			//닉네임
			httpSession.setAttribute("senic", nicname);
			//로그인 성공 후 글 목록 불러오기
			return "redirect:/PostSelectAll";
		}else {
			//로그인 실패
			return "./login/LoginFail";
		}
		
		
		
	}
	
	@RequestMapping(value = "LogOut", method = RequestMethod.GET)
	public String logout(HttpSession httpSession) {
		//세션 초기화
		httpSession.invalidate();
		return "redirect:/Login";
	}
	
	
}
