package com.care.bowfun.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {

	
	CartDTO cart = new CartDTO();
	
	public void updateQuantity(Integer quantity) {

		
		if (quantity != null) {
			cart.setQuantity(quantity);
		} else {
			System.out.println("Invalid quantity value: " + quantity);
		}
	}
	
	public Integer getQuantity() {
		
        return cart.getQuantity();
    }

	
	
	@Autowired
	private CartMapper cartMapper;
	
	public List<CartDTO> getCartItems() {
		return cartMapper.getCartItems(); // CartMapper를 사용하여 DB에서 상품 목록을 가져옴
	}



    public int deleteCart(int itemCode, String id) {
        return cartMapper.deleteCart(itemCode, id);
    }
	

}
