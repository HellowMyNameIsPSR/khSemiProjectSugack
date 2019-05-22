package com.kh.semi.admin.model.vo;

import java.sql.Date;

public class RequestMember implements java.io.Serializable{
	private int memberId; //사용자번호
	private String brandName; //브랜드명
	private String applyContent; //입점신청내용
	private Date applyDate; //입점신청날짜
	private String material; //공예유형
	private String email; //이메일
	private String apply1; //1차승인
	private String apply2; //2차승인 
	private String name;//실명 
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public RequestMember() {}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getApplyContent() {
		return applyContent;
	}

	public void setApplyContent(String applyContent) {
		this.applyContent = applyContent;
	}

	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getApply1() {
		return apply1;
	}

	public void setApply1(String apply1) {
		this.apply1 = apply1;
	}

	public String getApply2() {
		return apply2;
	}

	public void setApply2(String apply2) {
		this.apply2 = apply2;
	}

	public RequestMember(int memberId, String brandName, String applyContent, Date applyDate, String material,
			String email, String apply1, String apply2, String name) {
		super();
		this.memberId = memberId;
		this.brandName = brandName;
		this.applyContent = applyContent;
		this.applyDate = applyDate;
		this.material = material;
		this.email = email;
		this.apply1 = apply1;
		this.apply2 = apply2;
		this.name = name;
	}

	@Override
	public String toString() {
		return "RequestMember [memberId=" + memberId + ", brandName=" + brandName + ", applyContent=" + applyContent
				+ ", applyDate=" + applyDate + ", material=" + material + ", email=" + email + ", apply1=" + apply1
				+ ", apply2=" + apply2 + "]";
	}
	
	
	
}
