package com.care.bowfun.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.bowfun.member.MemberDTO;
import com.care.bowfun.member.MemberService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ShopController {

	@Autowired
	private ShopService service;
		
	@Autowired
	private HttpSession session;

	@RequestMapping("kmart")
	public String kmart(Model model, @RequestParam(value = "currentPage", required = false) String cp) {
		service.kmart(cp, model);
		return "shopping/kmart";
	}

	@RequestMapping("kdetail")
	public String kdetail(String cnum, Model model, HttpSession session) {
		ShopDTO shops = service.kdetail(cnum);
		session.setAttribute("cnum", cnum);
		if (shops == null) {
			return "shopping/kmart";
		}

		int totalPrice = calculateTotalPrice(shops); // totalPrice를 계산하는 메서드를 호출하여 값을 얻어옴
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("quantity", shops.getQuantity());
		model.addAttribute("shops", shops);
		
		return "shopping/kdetail";
	}
	
	@PostMapping("addCartProc")
	public String addCartProc(String sessionId, int cnum, Integer quantity, Model model) {
		System.out.println("sessionId : " + sessionId);
		System.out.println("cnum : " + cnum);
		System.out.println("quantity : " + quantity);
		
		sessionId = (String) session.getAttribute("id");
		if (sessionId == null)
			return "redirect:login";

		String check = service.addCartProc(sessionId, cnum, model);

		if (check.equals("등록 성공")) {
			return "redirect:kcart";
		} else {
			return "redirect:kmart";
		}
	}
	

	// 총금액 계산
	private int calculateTotalPrice(ShopDTO shops) {
		int quantity = shops.getQuantity(); // 상품 수량
		int pricePerUnit = shops.getCprice(); // 상품 1개당 가격

		// 총 주문 금액 계산 (수량 * 가격)
		int totalPrice = quantity * pricePerUnit;
		return totalPrice;
	}
	
    @Autowired
    private MemberService memberService;

    @RequestMapping("/kcart")
    public String kcart(Model model, HttpSession session) {
    	String memberId = (String) session.getAttribute("id");

        if (memberId != null) {
        	MemberDTO email = memberService.getMemberInfoByEmail(memberId);
        	MemberDTO userName = memberService.getMemberInfoByUserName(memberId);

            // 모델에 회원 정보 추가
            model.addAttribute("email", email);
            model.addAttribute("userName", userName);
            
            List<CombinedDTO> cartItems = service.getShopItems(memberId);
            model.addAttribute("combinedList", cartItems);
            
            return "shopping/kcart";
        } else {
            return "redirect:/login";
        }
    }

	@RequestMapping("korder")
	public String korder(Model model) {
		return "shopping/korder";
	}

	@RequestMapping("korder_ok")
	public String korder_ok(Model model) {
		return "shopping/korder_ok";
	}

	@RequestMapping("shopWrite")
	public String shopWrite(Model model) {
		String sessionId = (String) session.getAttribute("id");
		if (!"admin".equals(sessionId))
			return "redirect:index";

		service.insert(model);
		
		return "shopping/shopWrite";
	}

	@PostMapping("shopWriteProc")
	public String shopWriteProc(MultipartHttpServletRequest multi, @RequestParam("code") String code) {
		String sessionId = (String) session.getAttribute("id");

		if (sessionId == null)
			return "redirect:index";

		String msg = service.shopWriteProc(multi, code);
		if(msg.equals("등록 완료"))
			return "redirect:kmart";
		
		return "shopping/shopWrite";
	}

    @RequestMapping("shopUpdate")
    public String shopUpdate(String cnum, Model model) {
    	String sessionId = (String) session.getAttribute("id");
        if(!"admin".equals(sessionId))
        	return "redirect:index";
        
        cnum = (String) session.getAttribute("cnum");
        int n = Integer.parseInt(cnum);
        ShopDTO shops = service.kdetail(Integer.toString(n));
        
        model.addAttribute("shops", shops);
        
        return "shopping/shopUpdate";
    }

    @PostMapping("shopUpdateProc")
    public String shopUpdateProc(MultipartHttpServletRequest multi, String cnum, @RequestParam("code") String code) {
    	String sessionId = (String) session.getAttribute("id");
        if(!"admin".equals(sessionId))
        	return "redirect:index";
        
        cnum = (String) session.getAttribute("cnum");
        String msg = service.shopUpdateProc(multi, cnum, code);

        if(msg.equals("상품 수정 성공"))
            return "redirect:kmart";

        return "shopping/shopUpdate?cnum=" + cnum;
    }

	@RequestMapping("shopDeleteProc")
	public String shopDeleteProc(String cnum) {
		String sessionId = (String) session.getAttribute("id");
        if(!"admin".equals(sessionId))
        	return "redirect:kdetail?cnum=" + cnum;

        String msg = service.shopDeleteProc(cnum);
			
			if(msg.equals("다시 시도하세요")) 
				return "redirect:kdetail?cnum=" + cnum;
			 

        return "redirect:kmart";
    }
}
