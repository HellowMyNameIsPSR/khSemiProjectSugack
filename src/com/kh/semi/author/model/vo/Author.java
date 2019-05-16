package com.kh.semi.author.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Author implements Serializable{
	private int memberId; //사용자번호
	private String brandName; //브랜드명
	private String applyContent; //소개글
	private Date applyDate; //최근 신청 날짜
	private String staus; //상태
	
	public Author() {
		// TODO Auto-generated constructor stub
	}
	
	public Author(int memberId, String brandName, String applyContent, Date applyDate, String staus) {
		super();
		this.memberId = memberId;
		this.brandName = brandName;
		this.applyContent = applyContent;
		this.applyDate = applyDate;
		this.staus = staus;
	}

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

	public String getStaus() {
		return staus;
	}

	public void setStaus(String staus) {
		this.staus = staus;
	}

	@Override
	public String toString() {
		return "Author [memberId=" + memberId + ", brandName=" + brandName + ", applyContent=" + applyContent
				+ ", applyDate=" + applyDate + ", staus=" + staus + "]";
	}
	
	
} //end class
