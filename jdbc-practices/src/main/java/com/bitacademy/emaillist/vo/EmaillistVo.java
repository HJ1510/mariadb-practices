package com.bitacademy.emaillist.vo;

public class EmaillistVo {
	private Long no;
	private String FirstName;
	private String LastName;
	private String email;
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getFirstName() {
		return FirstName;
	}
	public void setFirstName(String FirstName) {
		this.FirstName = FirstName;
	}
	public String getLastName() {
		return LastName;
	}
	public void setLastName(String LastName) {
		this.LastName = LastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "EmaillistVo [no=" + no + ", FirstName=" + FirstName + ", LastName=" + LastName + ", email=" + email
				+ "]";
	}

	
}
