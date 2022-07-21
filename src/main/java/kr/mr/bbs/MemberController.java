package kr.mr.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.mr.mapper.MemberMapper;
import kr.mr.model.MemberDTO;

import javax.servlet.http.HttpSession;

@Controller
public class MemberController {
	
	@Autowired // DI(Dependency Injection)
//	private MemberDAO dao;
	private MemberMapper memberMapper;
	
	@RequestMapping("/memberList.do")
	// HttpServletRequest request 대신 스프링에서는
	// Model 클래스를 이용한다. Model클래스: 객체바인딩 전용 클래스
	public String memberList(Model model) {
//		MemberDAO dao = new MemberDAO();
		List<MemberDTO> list = memberMapper.memberList();
		
		// 객체바인딩
		// request.setAttribute("list", list);
		model.addAttribute("list", list);
		
		return "member/memberList";
	}
	
	@RequestMapping("/memberInsert.do")
	public String memberInsert(MemberDTO dto) {
		// 파라미터를 수집해서
		// dto 셋팅해서 인자로 넘겨줘야한다.
		// 이과정을 스프링에서 다처리해준다.
		// DTO를 통해서 자동으로 파라미터를 모아서 만들어준다.
		
		int cnt = memberMapper.memberInsert(dto);
		
		return "redirect:memberList.do";
	}
	
	@RequestMapping("/memberRegister.do")
	public String memberRegister() {
		
	//return "/WEB-INF/views/memberRegister.jsp";
		return "member/memberRegister";
	}
	
	@RequestMapping("/memberDelete.do")
	public String memberDelete(int no) {
	//public String memberDelete(@RequestParam("no") int num) {
		
		memberMapper.memberDel(no);
		
		return "redirect:/memberList.do";
	}
	
	@RequestMapping("/memberInfo.do")
	public String memberInfo(int no, Model model) {
		
		MemberDTO dto = memberMapper.memberInfo(no);
		
		// 객체바인딩
		model.addAttribute("dto", dto);
		
		return "member/memberInfo";
	}
	
	@RequestMapping("/memberUpdate.do")
	public String memberUpdate(MemberDTO dto) {
		int cnt = memberMapper.memberUpdate(dto);
		
		return "redirect:/memberList.do";
	}

	@RequestMapping("/memberLogin.do")
	public String loginProcess(MemberDTO dto, HttpSession session){
		String userName = memberMapper.memberLogin(dto);

		System.out.println("userName : "+userName);

		if(userName !=null && !"".equals(userName)){
			session.setAttribute("userId", dto.getId());
			session.setAttribute("userName", userName);
		}else{ // 로그인 실패
			session.setAttribute("userId", "");
			session.setAttribute("userName", "");
		}

		return "redirect:/";
	}

	@RequestMapping("/memberLogout.do")
	public String memberLogout(HttpSession session){
		session.removeAttribute("userId");

		return "redirect:/";
	}


	// @RequestBody : 
	// web에서 받은 데이터를 java에서 사용할 때
	// : web ->(javaObject변환) -> java에서 이용
	
	// @ResponseBody : 
	// java에서 web 페이지로 data 보낼 때 사용
	// : java->(json Object변환) -> web page
	
	// msg 컨버터 API 사용
	// jackson-databind, jackson-mapper-asl 
	
	/*
	 * @RequestMapping("/memberAjaxList.do") public @ResponseBody List<MemberDTO>
	 * memberAjaxList(){ List<MemberDTO> memberList = memberMapper.memberList();
	 * 
	 * return memberList; }
	 * 
	 * @RequestMapping("/form.do") public String form() { return "uploadForm"; }
	 */
}














