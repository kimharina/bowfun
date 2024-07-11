package com.care.bowfun.shop;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.care.bowfun.cart.CartDTO;
import com.care.bowfun.cate.CateDTO;

@Mapper
public interface ShopMapper {

	List<ShopDTO> kmart(int begin, int end);

	int totalCount();

	ShopDTO kdetail(int n);

	List<CateDTO> cateList();

	void shopWriteProc(ShopDTO shop);

	void addCartProc(CartDTO cart);
	
	int shopUpdateProc(ShopDTO shop);

	void shopDeleteProc(int n);

	List<CombinedDTO> getCombinedItems(String memId);

	List<ShopDTO> getShopItems();

}
