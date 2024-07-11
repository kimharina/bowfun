package com.care.bowfun.cate;
/*
CREATE TABLE CATEGORY_BOWFUN(
    CATENAME VARCHAR2(30),
    CODE VARCHAR2(50),
    
    PRIMARY KEY(CODE)
);
COMMIT;
 */


public class CateDTO {
	private String catename;
	private String code;
	
	public String getCatename() {
		return catename;
	}
	public void setCatename(String catename) {
		this.catename = catename;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	
}


/*
INSERT INTO CATEGORY_BOWFUN (CATENAME, CODE) VALUES ('간식', '100');
INSERT INTO CATEGORY_BOWFUN (CATENAME, CODE) VALUES ('미용', '200');
INSERT INTO CATEGORY_BOWFUN (CATENAME, CODE) VALUES ('패션', '300');
INSERT INTO CATEGORY_BOWFUN (CATENAME, CODE) VALUES ('위생', '400');
COMMIT;
*/
