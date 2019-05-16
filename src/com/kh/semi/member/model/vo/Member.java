package com.kh.semi.member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable{
	private int memberId;
	private String email;	
	private String password;
	private String memberName;
	private String phone;
	private String gender;
	private Date birthDate;
	private Date enrollDate;
	private String memberType;
	private Date authorDate;
	private Date outDate;
	private Date modifyDate;
	private String status;
	
	
	
	
	
	public Member() {}





	public Member(int memberId, String email, String password, String memberName, String phone, String gender,
			Date birthDate, Date enrollDate, String memberType, Date authorDate, Date outDate, Date modifyDate,
			String status) {
		super();
		this.memberId = memberId;
		this.email = email;
		this.password = password;
		this.memberName = memberName;
		this.phone = phone;
		this.gender = gender;
		this.birthDate = birthDate;
		this.enrollDate = enrollDate;
		this.memberType = memberType;
		this.authorDate = authorDate;
		this.outDate = outDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}





	public int getMemberId() {
		return memberId;
	}





	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}





	public String getEmail() {
		return email;
	}





	public void setEmail(String email) {
		this.email = email;
	}





	public String getPassword() {
		return password;
	}





	public void setPassword(String password) {
		this.password = password;
	}





	public String getMemberName() {
		return memberName;
	}





	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}





	public String getPhone() {
		return phone;
	}





	public void setPhone(String phone) {
		this.phone = phone;
	}





	public String getGender() {
		return gender;
	}





	public void setGender(String gender) {
		this.gender = gender;
	}





	public Date getBirthDate() {
		return birthDate;
	}





	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}





	public Date getEnrollDate() {
		return enrollDate;
	}





	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}





	public String getMemberType() {
		return memberType;
	}





	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}





	public Date getAuthorDate() {
		return authorDate;
	}





	public void setAuthorDate(Date authorDate) {
		this.authorDate = authorDate;
	}





	public Date getOutDate() {
		return outDate;
	}





	public void setOutDate(Date outDate) {
		this.outDate = outDate;
	}





	public Date getModifyDate() {
		return modifyDate;
	}





	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}





	public String getStatus() {
		return status;
	}





	public void setStatus(String status) {
		this.status = status;
	}





	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", email=" + email + ", password=" + password + ", memberName="
				+ memberName + ", phone=" + phone + ", gender=" + gender + ", birthDate=" + birthDate + ", enrollDate="
				+ enrollDate + ", memberType=" + memberType + ", authorDate=" + authorDate + ", outDate=" + outDate
				+ ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}

	

	


}
