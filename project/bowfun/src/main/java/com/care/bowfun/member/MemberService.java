package com.care.bowfun.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class MemberService {

	@Autowired
	private IMemberMapper mapper;
	@Autowired
	private HttpSession session;

	public String registProc(MemberDTO member) {
		if (member.getId() == null || member.getId().trim().isEmpty()) {
			return "아이디를 입력하세요";
		}
		if (member.getPw() == null || member.getPw().trim().isEmpty()) {
			return "비밀번호를 입력하세요";
		}
		if (member.getPw().equals(member.getConfirm()) == false) {
			return "두 비밀번호가 다릅니다";
		}
		if (member.getUserName() == null || member.getUserName().trim().isEmpty()) {
			return "이름을 입력하세요";
		}
		if (!member.getId().matches("^[a-zA-Z0-9]{5,20}$")) {
	        return "아이디 양식 확인해 주세요";
	    }
		if (member.getPw().length() < 8 || member.getPw().length() > 20) {
	        return "비밀번호 양식 확인해 주세요";
	    }

		List<MemberDTO> existEmailList = checkExistEmail(member.getEmail());
		if (!existEmailList.isEmpty()) {
			return "이미 사용 중인 이메일입니다";
		}

		MemberDTO checkId = mapper.login(member.getId());
		if (checkId != null) {
			return "이미 사용중인 아이디입니다";
		}
		// 암호화 과정
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String secretPass = encoder.encode(member.getPw());
		member.setPw(secretPass);

//		암호문 : $2a$10$.njeQHRCrVhekpPC0c8IqerVCwJyWbGqBPfd7oOFS/Gwjh6ZoNRX6
//		암호문 길이 : 60
//		pw 컬럼의 크기를 암호문 크기(60byte)와 같거나 크게 변경
		System.out.println("암호문 : " + secretPass);
		System.out.println("암호문 길이 : " + secretPass.length());

		int result = mapper.registProc(member);
		if (result == 1)
			return "회원 등록 완료";

		return "회원 등록을 다시 시도하세요";
	}
	private List<MemberDTO> checkExistEmail(String email) {
		return mapper.findEmail(email);
	}

	public String loginProc(HttpServletRequest request, String id, String pw) {
		HttpSession sessionCheck = request.getSession(false);
		if (sessionCheck != null) {
			sessionCheck.invalidate();
		}
		if (id == null || id.trim().isEmpty()) {
			return "아이디를 입력하세요";
		}
		if (pw == null || pw.trim().isEmpty()) {
			return "비밀번호를 입력하세요";
		}

		MemberDTO check = mapper.login(id);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//		encoder.matches(pw, check.getPw()); // 매개변수 순서 중요 - 좌 : 평문, 우 : 암호문

		if (check != null && encoder.matches(pw, check.getPw()) == true) {
			session.setAttribute("id", check.getId());
			session.setAttribute("userName", check.getUserName());
			session.setAttribute("address", check.getAddress());
			session.setAttribute("mobile", check.getMobile());
			session.setAttribute("email", check.getEmail());

			// session.setAttribute("member", check);
			// ${sessionScope.member.id}
			// ${sessionScope.member.pw}
			// ${sessionScope.member.userName}

			return "로그인 성공";
		}

		return "아이디 또는 비밀번호가 존재하지 않습니다";
	}

	public String userCheckProc(MemberDTO member) {
		if (member.getPw() == null || member.getPw().trim().isEmpty()) {
			return "비밀번호를 입력하세요";
		}
		if (member.getPw().equals(member.getConfirm()) == false) {
			return "두 비밀번호를 일치하여 입력하세요";
		}

		MemberDTO check = mapper.login(member.getId());
		
		if (check != null) {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			if (encoder.matches(member.getPw(), check.getPw())) {
				int result = 1;
				if (result > 0)
					return "확인 완료";

				return "회원 인증을 다시 시도하세요";
			}
		}

		return "비밀번호를 확인 후 입력하세요";
	}

	public String userInfo(String id, Model model) {
		String sessionId = (String) session.getAttribute("id");
		if (sessionId == null)
			return "로그인 후 이용하세요";
		if (sessionId.equals("admin") == false && sessionId.equals(id) == false)
			return "본인의 아이디를 선택하세요";

		MemberDTO member = mapper.login(id); // 맵퍼 인터페이스에 login 메소드와 중복되어 login를 같은 메소드 이용
		if (member.getAddress() != null && member.getAddress().isEmpty() == false) {
			String[] address = member.getAddress().split(",");
//			System.out.println(address.length);
			if (address.length >= 2) {
				model.addAttribute("postcode", address[0]);
				member.setAddress(address[1]);
				if (address.length == 3)
					model.addAttribute("detailAddress", address[2]);
			}
		}
		model.addAttribute("member", member);

		return "회원 검색 완료";
	}

	public String updateProc(MemberDTO member) {
		if (member.getPw() == null || member.getPw().trim().isEmpty()) {
			return "비밀번호를 입력하세요";
		}
		if (member.getPw().equals(member.getConfirm()) == false) {
			return "두 비밀번호를 일치하여 입력하세요";
		}
		if (member.getUserName() == null || member.getUserName().trim().isEmpty()) {
			return "이름을 입력하세요";
		}
		if (member.getPw().length() < 8 || member.getPw().length() > 20) {
	        return "비밀번호 양식 확인해 주세요";
	    }
		// 암호화 과정
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String secretPass = encoder.encode(member.getPw());
		member.setPw(secretPass);

		int result = mapper.updateProc(member);
		if (result == 1)
			return "회원 수정 완료";

		return "회원 수정을 다시 시도하세요";
	}

	public String deleteProc(MemberDTO member) {
		if (member.getPw() == null || member.getPw().trim().isEmpty()) {
			return "비밀번호를 입력하세요";
		}
		if (member.getPw().equals(member.getConfirm()) == false) {
			return "두 비밀번호를 일치하여 입력하세요";
		}

		MemberDTO check = mapper.login(member.getId());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if (check != null && encoder.matches(member.getPw(), check.getPw()) == true) {
			int result = mapper.deleteProc(member.getId());
			if (result == 1)
				return "회원 삭제 완료";

			return "회원 삭제를 다시 시도하세요";
		}

		return "비밀번호를 확인 후 입력하세요";
	}
	
	//이메일, 주소 가져와서 kcart.jsp
    public MemberDTO getMemberInfoByEmail(String email) {
        // email을 기반으로 회원 정보를 데이터베이스에서 가져오는 코드
    	return mapper.getMemberByEmail(email);
    }

    public MemberDTO getMemberInfoByUserName(String userName) {
        // address를 기반으로 회원 정보를 데이터베이스에서 가져오는 코드
        return mapper.getMemberByUserName(userName);
    }

}
