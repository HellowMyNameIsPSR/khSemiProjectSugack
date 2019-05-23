package com.kh.semi.product.model.vo;

import java.sql.Date;

public class Delivery implements java.io.Serializable{
	private int deliId;
	private Date deliDate;
	private String deliStatus;
	private int invNum;
	private String deliCompany;
	private int odId;
	private int memberId;
	
	public Delivery() {}

	public Delivery(int deliId, Date deliDate, String deliStatus, int invNum, String deliCompany, int odId,
			int memberId) {
		super();
		this.deliId = deliId;
		this.deliDate = deliDate;
		this.deliStatus = deliStatus;
		this.invNum = invNum;
		this.deliCompany = deliCompany;
		this.odId = odId;
		this.memberId = memberId;
	}

	public int getDeliId() {
		return deliId;
	}

	public void setDeliId(int deliId) {
		this.deliId = deliId;
	}

	public Date getDeliDate() {
		return deliDate;
	}

	public void setDeliDate(Date deliDate) {
		this.deliDate = deliDate;
	}

	public String getDeliStatus() {
		return deliStatus;
	}

	public void setDeliStatus(String deliStatus) {
		this.deliStatus = deliStatus;
	}

	public int getInvNum() {
		return invNum;
	}

	public void setInvNum(int invNum) {
		this.invNum = invNum;
	}

	public String getDeliCompany() {
		return deliCompany;
	}

	public void setDeliCompany(String deliCompany) {
		this.deliCompany = deliCompany;
	}

	public int getOdId() {
		return odId;
	}

	public void setOdId(int odId) {
		this.odId = odId;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Delivery [deliId=" + deliId + ", deliDate=" + deliDate + ", deliStatus=" + deliStatus + ", invNum="
				+ invNum + ", deliCompany=" + deliCompany + ", odId=" + odId + ", memberId=" + memberId + "]";
	}
	
	
}
