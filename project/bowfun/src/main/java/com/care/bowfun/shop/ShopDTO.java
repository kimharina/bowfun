package com.care.bowfun.shop;
/*
CREATE TABLE shop_bowfun(
	cnum number,
	code varchar2(50),
	cname varchar2(100),
	cimage varchar2(500),
	cimage1 varchar2(500),
	cprice number,
	quantity number,
	primary key(cnum)
);
COMMIT;
 */


public class ShopDTO {
	private int cnum;
	private String code;
	private String cname;
	private String cimage;
	private String cimage1;
	private int cprice;
	private String catename;
	private int quantity;
	
	protected String memId;
    protected int itemCode;
	

	
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCimage() {
		return cimage;
	}
	public void setCimage(String cimage) {
		this.cimage = cimage;
	}
	public String getCimage1() {
		return cimage1;
	}
	public void setCimage1(String cimage1) {
		this.cimage1 = cimage1;
	}
	public int getCprice() {
		return cprice;
	}
	public void setCprice(int cprice) {
		this.cprice = cprice;
	}
	public String getCatename() {
		return catename;
	}
	public void setCatename(String catename) {
		this.catename = catename;
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
