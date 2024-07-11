package com.care.bowfun.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.bowfun.member.MemberDTO;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	@Autowired
	private HttpSession session;

	@RequestMapping("memberInfo")
	public String memberInfo(@RequestParam(value = "select", required = false) String select,
							 @RequestParam(value = "search", required = false) String search,
							 @RequestParam(value = "currentPage", required = false) String cp, Model model) {
		String sessionId = (String) session.getAttribute("id");
		if (!"admin".equals(sessionId))
			return "redirect:index";
		
		service.memberInfo(select, search, cp, model);
		return "admin/memberInfo";
	}

	@RequestMapping("adminDelete")
	public String adminDelete(@RequestParam("id") String memberId, MemberDTO member) {
		String sessionId = (String) session.getAttribute("id");
		if (!"admin".equals(sessionId))
			return "redirect:index";
		
        member.setId(memberId); // 선택한 사용자의 ID를 설정
        
		return "admin/adminDelete";
	}

	@PostMapping("adminDeleteProc")
    public String adminDeleteProc(@RequestParam("id") String memberId, MemberDTO member, Model model) {
        String sessionId = (String) session.getAttribute("id");
        if (!"admin".equals(sessionId)) {
            return "redirect:index";
        }

        member.setId(memberId); // 선택한 사용자의 ID를 설정
        String msg = service.adminDeleteProc(member);
        if (msg.equals("회원 삭제 완료")) {
            // 삭제 성공 시, 관리자는 다시 로그인해야 하므로 세션 무효화
            return "redirect:memberInfo";
        }

        model.addAttribute("msg", msg);
        return "admin/adminDelete";
    }
}
