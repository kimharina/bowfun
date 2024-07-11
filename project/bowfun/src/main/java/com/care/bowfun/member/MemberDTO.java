package com.care.bowfun.member;

/*
 CREATE TABLE member_bowfun(
   id varchar2(50),
   pw varchar2(60),
   userName varchar2(30),
   address varchar2(200),
   mobile varchar2(15),
   email varchar2(100),
   primary key(id)
);
 */

public class MemberDTO {
	private String id;
	private String pw;
	private String confirm;
	private String userName;
	private String address;
	private String mobile;
	private String email;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}



}
