package com.care.bowfun.cart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CartMapper {
	
	//장바구니에 상품 담기
	void kcart(CartDTO cartDto);

	void updateQuantity(CartDTO cartDto);

	List<CartDTO> getCartItems();


	int deleteCart(int itemCode, String id);

}
