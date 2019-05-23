package com.kh.semi.member.model.vo;

import java.sql.Date;

public class Refund implements java.io.Serializable{
	private int refundId;
	private String status;
	private String reason;
	private Date refundDate;
	private Date refundEndDate;
	private int odId;
	
	public Refund() {}

	public Refund(int refundId, String status, String reason, Date refundDate, Date refundEndDate, int odId) {
		super();
		this.refundId = refundId;
		this.status = status;
		this.reason = reason;
		this.refundDate = refundDate;
		this.refundEndDate = refundEndDate;
		this.odId = odId;
	}

	public int getRefundId() {
		return refundId;
	}

	public void setRefundId(int refundId) {
		this.refundId = refundId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Date getRefundDate() {
		return refundDate;
	}

	public void setRefundDate(Date refundDate) {
		this.refundDate = refundDate;
	}

	public Date getRefundEndDate() {
		return refundEndDate;
	}

	public void setRefundEndDate(Date refundEndDate) {
		this.refundEndDate = refundEndDate;
	}

	public int getOdId() {
		return odId;
	}

	public void setOdId(int odId) {
		this.odId = odId;
	}

	@Override
	public String toString() {
		return "Refund [refundId=" + refundId + ", status=" + status + ", reason=" + reason + ", refundDate="
				+ refundDate + ", refundEndDate=" + refundEndDate + ", odId=" + odId + "]";
	}
	
	
}
























