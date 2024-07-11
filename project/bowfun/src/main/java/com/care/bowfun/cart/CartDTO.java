package com.care.bowfun.cart;
/*
CREATE TABLE cart_bowfun (
    item_code number,
    mem_id VARCHAR2(50),
    quantity NUMBER,
    
    primary key(item_code)
);
COMMIT;
 */


public class CartDTO {
	private String memId;
    private int itemCode;
    private int quantity;
    
    
    
	public int getItemCode() {
		return itemCode;
	}
	public void setItemCode(int itemCode) {
		this.itemCode = itemCode;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

    
	
}


/*
INSERT INTO shop_bowfun VALUES('1', '간식', '강아지껌', 'https://puppydog.co.kr/web/product/big/202305/8d7020d98860497a9e10feaf1e8b32cb.jpg', '13000');
INSERT INTO shop_bowfun VALUES('2', '간식', '전연령 강아지전용 간식 양고기 치즈버거 100g 80EA', 'https://puppydog.co.kr/web/product/big/202305/f12f250c317a4ec7969ba985ec31c4d7.jpg', '70200');
COMMIT;
*/
