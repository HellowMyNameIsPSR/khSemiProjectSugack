package com.kh.semi.funding.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class FUS implements Serializable{
	private int fusId;
	private Date fusDate;
	private int fundPrice;
	private int memberId;
	private int workId;
	
	public FUS() {
		// TODO Auto-generated constructor stub
	}

	public FUS(int fusId, Date fusDate, int fundPrice, int memberId, int workId) {
		super();
		this.fusId = fusId;
		this.fusDate = fusDate;
		this.fundPrice = fundPrice;
		this.memberId = memberId;
		this.workId = workId;
	}

	public int getFusId() {
		return fusId;
	}

	public void setFusId(int fusId) {
		this.fusId = fusId;
	}

	public Date getFusDate() {
		return fusDate;
	}

	public void setFusDate(Date fusDate) {
		this.fusDate = fusDate;
	}

	public int getFundPrice() {
		return fundPrice;
	}

	public void setFundPrice(int fundPrice) {
		this.fundPrice = fundPrice;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public int getWorkId() {
		return workId;
	}

	public void setWorkId(int workId) {
		this.workId = workId;
	}

	@Override
	public String toString() {
		return "FUS [fusId=" + fusId + ", fusDate=" + fusDate + ", fundPrice=" + fundPrice + ", memberId=" + memberId
				+ ", workId=" + workId + "]";
	}
	
	
} //end class
