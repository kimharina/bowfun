package com.care.bowfun.admin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.bowfun.PageService;
import com.care.bowfun.member.MemberDTO;

@Service
public class AdminService {

	@Autowired
	private IAdminMapper mapper;

	public void memberInfo(String select, String search, String cp, Model model) {
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(cp);
		} catch (Exception e) {
			currentPage = 1;
		}

		if (select == null)
			select = "";

		int pageBlock = 7;
		int end = pageBlock * currentPage;
		int begin = end - pageBlock + 1;

		ArrayList<MemberDTO> members = mapper.memberInfo(begin, end, select, search);
		int totalCount = mapper.totalCount(select, search);

		if (totalCount == 0) {
			return;
		}

		String url = "memberInfo?select=" + select + "&search=" + search + "&currentPage=";
		String result = PageService.printPage(url, totalCount, pageBlock, currentPage);

		model.addAttribute("select", select);
		model.addAttribute("search", search);
		model.addAttribute("result", result);
		model.addAttribute("members", members);
	}

	public String adminDeleteProc(MemberDTO member) {
        // 관리자는 자신의 계정은 삭제할 수 없도록 검사
        if ("admin".equals(member.getId())) {
            return "관리자 계정을 삭제할 수 없습니다";
        }
        System.out.println(member.getId());
        int result = mapper.adminDeleteProc(member);
        if (result == 1) {
            return "회원 삭제 완료";
        }

        return "삭제에 실패했습니다. 다시 시도하세요";
    }
}
