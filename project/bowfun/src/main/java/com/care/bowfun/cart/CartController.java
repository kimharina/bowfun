package com.care.bowfun.cart;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import jakarta.annotation.Resource;


@Controller
//@RequestMapping("kcart")
@RequestMapping("/api")
public class CartController {
	
	@Resource(name="cartService")
	private CartService cartService;
			
    @PostMapping("/updateQuantity")
    public ResponseEntity<String> updateQuantity(@RequestParam("quantity") Integer quantity) {
        // 수량을 받아와서 서비스로 전달하여 처리
        cartService.updateQuantity(quantity);
        return ResponseEntity.ok("수량이 업데이트되었습니다.");
    }
	
    

    @PostMapping("/deleteCart")
    public String deleteCartItem(@RequestParam("itemCode") int itemCode, @RequestParam("id") String id) {
    	System.out.println("it"+itemCode +"id"+ id);
    	
            int deletedRows = cartService.deleteCart(itemCode, id);
            System.out.println(deletedRows);
            return "redirect:/kcart";
    }
    
}