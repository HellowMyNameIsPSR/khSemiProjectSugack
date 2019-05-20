package com.kh.semi.author.model.vo;

import java.io.Serializable;

public class AuthorApply implements Serializable{
	private int applyId; //신청 코드
	private String applyStat1; //1차 신청 상태
	private String applyStat2; //2차 신청 상태
	private int memberId; //회원코드
	
	public AuthorApply() {
		// TODO Auto-generated constructor stub
	}

	public AuthorApply(int applyId, String applyStat1, String applyStat2, int memberId) {
		super();
		this.applyId = applyId;
		this.applyStat1 = applyStat1;
		this.applyStat2 = applyStat2;
		this.memberId = memberId;
	}

	public int getApplyId() {
		return applyId;
	}

	public void setApplyId(int applyId) {
		this.applyId = applyId;
	}

	public String getApplyStat1() {
		return applyStat1;
	}

	public void setApplyStat1(String applyStat1) {
		this.applyStat1 = applyStat1;
	}

	public String getApplyStat2() {
		return applyStat2;
	}

	public void setApplyStat2(String applyStat2) {
		this.applyStat2 = applyStat2;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "AuthorApply [applyId=" + applyId + ", applyStat1=" + applyStat1 + ", applyStat2=" + applyStat2
				+ ", memberId=" + memberId + "]";
	}
	
	
} //end class
