package com.care.bowfun.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	@Autowired
	private HttpSession session;
	@Autowired
	private KakaoService kakaoService;
	@Autowired
    private MailContents mailContents;

	@RequestMapping("regist")
	public String regist() {
		return "member/regist";
	}

	@PostMapping("registProc")
	public String registProc(MemberDTO member, String postcode, String detailAddress, Model model, RedirectAttributes ra) {
		if (member.getAddress() != null && member.getAddress().trim().isEmpty() == false)
			member.setAddress(postcode + "," + member.getAddress() + "," + detailAddress);
		
		String msg = service.registProc(member);

		if (msg.equals("회원 등록 완료")) {
			ra.addFlashAttribute("msg", msg);
			return "redirect:index";
		}
		model.addAttribute("msg", msg);
		return "member/regist";
	}
	
	@PostMapping("mailConfirm")
    public String mailConfirm(@RequestParam(name = "email") String email, Model model) throws Exception {
        String code = mailContents.sendSimpleMessage(email);
        System.out.println("사용자에게 발송한 인증코드 : " + code);
        
        session.setAttribute("email", email); // 회원가입 hidden 값 전송
        
        // 모델에 인증 코드를 추가
        model.addAttribute("code", code);

        return "member/regist";
    }

	@RequestMapping("login")
	public String login() {
		return "member/login";
	}

	@PostMapping("loginProc")
	public String loginProc(HttpServletRequest request,String id, String pw, Model model, RedirectAttributes ra) {
		String msg = service.loginProc(request,id, pw);
		
		if (msg.equals("로그인 성공")) {
			ra.addAttribute("msg", msg);
			return "redirect:index";
		}
		model.addAttribute("msg", msg);
		return "member/login";
	}

	@RequestMapping("logout")
	public String logout(RedirectAttributes ra) {
		session.invalidate();
		ra.addFlashAttribute("msg", "로그아웃");
		
		kakaoService.unlink();
		return "redirect:index";
	}
	
	@RequestMapping("userCheck")
	public String userCheck() {
		String sessionId = (String) session.getAttribute("id");
		if (sessionId == null)
			return "redirect:login";

		return "member/userCheck";
	}
	
	@PostMapping("userCheckProc")
	public String userCheckProc(MemberDTO member, Model model) {
		String sessionId = (String) session.getAttribute("id");
		if (sessionId == null)
			return "redirect:login";
		
		member.setId(sessionId);
		String msg= service.userCheckProc(member);
		if (msg.equals("확인 완료")) {
			return "member/userInfo";
		}
		model.addAttribute("msg", msg);
		return "member/userCheck";
	}

	@RequestMapping("userInfo")
	public String userInfo(String id, Model model, RedirectAttributes ra) {
		String msg = service.userInfo(id, model);
		if (msg.equals("회원 검색 완료"))
			return "member/userInfo";
		
		ra.addFlashAttribute("msg", msg);
		return "redirect:index";
	}

	@RequestMapping("update")
	public String update() {
		String sessionId = (String) session.getAttribute("id");
		if (sessionId == null)
			return "redirect:login";
		
		return "member/update";
	}
	
	@PostMapping("updateProc")
	public String updateProc(MemberDTO member, Model model) {
		String sessionId = (String) session.getAttribute("id");
		if (sessionId == null)
			return "redirect:login";
		
		member.setId(sessionId);
		String msg = service.updateProc(member);
		if (msg.equals("회원 수정 완료")) {
			session.invalidate();
			return "redirect:index";
		}
		
		model.addAttribute("msg", msg);
		return "member/update";
	}

	@RequestMapping("delete")
	public String delete() {
		String sessionId = (String) session.getAttribute("id");
		if (sessionId == null)
			return "redirect:login";
		
		return "member/delete";
	}
	
	@PostMapping("deleteProc")
	public String deleteProc(MemberDTO member, Model model) {
		String sessionId = (String) session.getAttribute("id");
		if (sessionId == null)
			return "redirect:login";
		
		member.setId(sessionId);
		String msg = service.deleteProc(member);
		if (msg.equals("회원 삭제 완료")) {
			session.invalidate();
			return "redirect:index";
		}
		
		model.addAttribute("msg", msg);
		return "member/delete";
	}
	
	// http://localhost:8085/dbQuiz/kakaoLogin?code=4aXvkb7fP5uJa7WYukDeFEf4vUJ7R5qYpbFvpAk5WLxbI58E7CdGVku27C3XJO7rIUF_VAo9c04AAAGLA6AY8A
	@RequestMapping("kakaoLogin")
	public String kakaoLogin(String code) {
		System.out.println("code : " + code);
		kakaoService.getAccessToken(code);
		kakaoService.getUserInfo();
		
		return "redirect:index";
	}
}
