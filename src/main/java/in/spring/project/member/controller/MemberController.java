package in.spring.project.member.controller;

import java.io.File;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import in.spring.project.member.dto.MemberDTO;
import in.spring.project.member.service.MemberService;

@Controller
public class MemberController {
	/** * Slf4j Logger */
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	// 회원 전체 검색
	@RequestMapping(value = "MemberSelectAll", method = RequestMethod.GET)
	public String memberlist(Model model) {
		model.addAttribute("memberlist", memberService.MemberSelectAll());
		logger.info("memberSelect", model);
		return "./member/member_select_all_view";
	}

	// 회원 정보 검색
	@RequestMapping(value = "MemberSelectDetail", method = RequestMethod.GET)
	public String memberdetail(Model model, MemberDTO memberDTO) {
		model.addAttribute("memberSelectDetail", memberService.MemberSelectDetail(memberDTO.getId()));
		return "./member/member_select_detail_view";
	}

	// 회원가입 get
	@RequestMapping(value = "MemberInsert", method = RequestMethod.GET)
	public String memberinsert() {
		return "./member/member_insert";
	}

	// 회원가입 post
	@RequestMapping(value = "MemberInsert", method = RequestMethod.POST)
	public String memberinsert(Model model, MemberDTO memberDTO,
			MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {

		// 프로필 사진 업로드
		// 클라이언트의 파일 시스템에 있는 원래 파일 이름을 반환
		// getFileName => MultipartFile형을 저장할 공간 DTO에 추가
		String realFileName = memberDTO.getFileName().getOriginalFilename();
		logger.info(realFileName);
		// 파라미터 이름을 키로 파라미터에 해당하는 파일 정보를 값으로 하는 Map을 가져온다.
		Map<String, MultipartFile> map = multipartHttpServletRequest.getFileMap();
		// 앱 요소로 반복하는 동안에만 유효하며 맵 요소의 키와 값을 Set 인터페이스로 반복하여 호출
		Iterator<Map.Entry<String, MultipartFile>> iterator = map.entrySet().iterator();
		// 파일을 전달받는다.
		MultipartFile multipartFile = memberDTO.getFileName();
		// logger.info("multipartFile : " + multipartFile);

		// 파일이 없으면 기본 이미지 이름을 DTO에 저장
		if (multipartFile.isEmpty()) {
			memberDTO.setAttachedfile("dog.jpg");
			// DB에 저장
			memberService.MemberInsert(memberDTO);
			return "./member/member_insert_view";
		}
		// 파일이름
		String fileName = multipartFile.getOriginalFilename();
		// 저장경로
		String savePath = multipartHttpServletRequest.getSession().getServletContext().getRealPath("./resources/img");
		String filePath = savePath + "\\";
		String saveFileName = "";

		while (iterator.hasNext()) {
			Map.Entry<String, MultipartFile> entry = iterator.next();
			multipartFile = entry.getValue();
			String extension = fileName.substring(fileName.lastIndexOf(".") + 1);
			String saveFilePath = filePath + File.separator + fileName;
			File saveFile = new File(saveFilePath);

			if (saveFile.isFile()) {
				boolean fileExist = true;

				// 이미지 파일 랜덤이름으로 설정하여 중복 방지
				UUID uuid = UUID.randomUUID();
				// 랜덤이름 중 '-' 를 제거하고
				String uuids[] = uuid.toString().split("-");
				// 0번 인덱스 값을 랜덤이름으로 지정(데이터 베이스에 저장될 이름이 너무 길기때문)
				String uniqueName = uuids[0];

				while (fileExist) {
					// 저장되는 파일 이름
					saveFileName = uniqueName + "." + extension;
					String dictFile = filePath + File.separator + saveFileName;
					logger.info("dictFile : " + dictFile);
					fileExist = new File(dictFile).isFile();
					if (!fileExist) {
						saveFilePath = dictFile;
					}
				}
				memberDTO.setAttachedfile(saveFileName);
				multipartFile.transferTo(new File(saveFilePath));
				logger.info("회원DTO : " + memberDTO);
			} else {
				memberDTO.setAttachedfile(fileName);
				multipartFile.transferTo(saveFile);
				logger.info("회원DTO : " + memberDTO);
			}
		}

		model.addAttribute("memberlist", memberService.MemberSelectAll());
		logger.info("memberlist" + memberDTO);
		logger.info("파일 : " + memberDTO.getAttachedfile().toString());
		memberService.MemberInsert(memberDTO);
		return "./member/member_insert_view";
	}

	// 회원 정보 수정 get
	@RequestMapping(value = "MemberUpdate", method = RequestMethod.GET)
	public String memberupdate(Model model, MemberDTO memberDTO) {
		model.addAttribute("memberlist", memberService.MemberSelectDetail(memberDTO.getId()));
		return "./member/member_update";
	}

	// 회원 정보 수정 post
	@RequestMapping(value = "MemberUpdate", method = RequestMethod.POST)
	public String memberupdate(Model model, MemberDTO memberDTO,
			MultipartHttpServletRequest multipartHttpServletRequest, HttpSession httpSession) throws Exception {
		// 프로필 사진 업로드
		// 클라이언트의 파일 시스템에 있는 원래 파일 이름을 반환
		// getFileName => MultipartFile형을 저장할 공간 DTO에 추가
		String realFileName = memberDTO.getFileName().getOriginalFilename();
		logger.info(realFileName);
		// 파라미터 이름을 키로 파라미터에 해당하는 파일 정보를 값으로 하는 Map을 가져온다.
		Map<String, MultipartFile> map = multipartHttpServletRequest.getFileMap();
		// 앱 요소로 반복하는 동안에만 유효하며 맵 요소의 키와 값을 Set 인터페이스로 반복하여 호출
		Iterator<Map.Entry<String, MultipartFile>> iterator = map.entrySet().iterator();
		// 파일을 전달받는다.
		MultipartFile multipartFile = memberDTO.getFileName();
		logger.info("multipartFile : " + multipartFile);
		
		// 파일이 없으면 기본 이미지 이름을 DTO에 저장
		if (multipartFile.isEmpty()) {
			memberDTO.setAttachedfile("dog.jpg");
			// DB에 저장
			memberService.MemberInsert(memberDTO);
			return "./member/member_insert_view";
		}

		String fileName = multipartFile.getOriginalFilename();
		String savePath = multipartHttpServletRequest.getSession().getServletContext().getRealPath("./resources/img");
		String filePath = savePath + "\\";
		String saveFileName = "";

		while (iterator.hasNext()) {
			Map.Entry<String, MultipartFile> entry = iterator.next();
			multipartFile = entry.getValue();
			// 확장자 이름
			String extension = fileName.substring(fileName.lastIndexOf(".") + 1);
			// 파일 저장 경로
			String saveFilePath = filePath + File.separator + fileName;
			File saveFile = new File(saveFilePath);

			if (saveFile.isFile()) {
				boolean fileExist = true;

				// 랜덤이름으로 설정하여 중복 방지
				UUID uuid = UUID.randomUUID();
				// 랜덤이름 중 '-' 를 제거하고
				String uuids[] = uuid.toString().split("-");
				// 0번 인덱스 값을 랜덤이름으로 지정(데이터 베이스에 저장될 이름이 너무 길기때문)
				String uniqueName = uuids[0];

				while (fileExist) {
					// UUID로 받은 랜덤 이름을 저장 파일 이름으로 설정
					saveFileName = uniqueName + "." + extension;
					String dictFile = filePath + File.separator + saveFileName;
					logger.info("dictFile : " + dictFile);
					fileExist = new File(dictFile).isFile();
					if (!fileExist) {
						saveFilePath = dictFile;
					}
				}
				memberDTO.setAttachedfile(saveFileName);
				multipartFile.transferTo(new File(saveFilePath));		
			} else {
				memberDTO.setAttachedfile(fileName);
				multipartFile.transferTo(saveFile);			
			}
		}

		model.addAttribute("memberlist", memberService.MemberSelectAll());
		logger.info("memberlist" + memberDTO);
		logger.info("파일 : " + memberDTO.getAttachedfile().toString());
		
		//세션에 저장된 id가 관리자이면..
		if (httpSession.getAttribute("id").equals("admin")) {
			// 회원정보 업데이트
			memberService.MemberUpdate(memberDTO);
			// 회원 목록으로 이동
			return "redirect:/MemberSelectAll";
		} else {
			memberService.MemberUpdate(memberDTO);
			// 일반 회원이 정보수정을 하면 세션을 삭제하고 로그인 페이지로 이동
			// => 변경된 정보를 세션에 다시 저장하기 위해
			return "./login/ChangeMemberInfo";
		}

	}

	// 회원 삭제 get
	@RequestMapping(value = "MemberDelete", method = RequestMethod.GET)
	public String memberdelete(Model model, MemberDTO memberDTO) {
		model.addAttribute("memberlist", memberService.MemberSelectDetail(memberDTO.getId()));
		return "./member/member_delete";
	}

	// 회원 삭제 post
	@RequestMapping(value = "MemberDelete", method = RequestMethod.POST)
	public String memberdelete(MemberDTO memberDTO, HttpSession httpSession, HttpServletRequest request) {

		httpSession = request.getSession();
		// 세션에 저장되어 있는 id가 admin(관리자)이면
		if (httpSession.getAttribute("id").equals("admin")) {
			// 회원을 삭제하고
			memberService.MemberDelete(memberDTO.getId());
			// 회원 목록으로 이동
			return "redirect:/MemberSelectAll";
		} else {
			memberService.MemberDelete(memberDTO.getId());
			// 일반 회원이 회원 탈퇴를 하면 로그아웃 후 로그인 페이지로 이동
			return "redirect:/LogOut";
		}

	}

	// 회원 가입 시 아이디 중복 검사
	@RequestMapping(value = "CheckedId", method = RequestMethod.POST)
	@ResponseBody
	public int CheckedId(@RequestParam("id") String id) {
		//일치하는 id를 검사하여 idCheck에 저장 => sql문에 count(*)을 하여 일치하는 id가 있으면 1을 반환
		int idCheck = memberService.CheckedId(id);
		logger.info("idCheck : " + idCheck);
		if (idCheck == 1) {
			logger.info("이미 존재하는 아이디");
		} else {
			logger.info("사용 가능한 아이디");
		}
		return idCheck;
	}

}
