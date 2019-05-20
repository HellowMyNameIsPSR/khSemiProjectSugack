package com.kh.semi.product.model.vo;

import java.sql.Date;

public class Payment implements java.io.Serializable{
	private String payId;
	private Date payDate;
	private int payPrice;
	private int refundPrice;
	private String payStatus;
	private String payMethod;
	private String cardNum;
	
	public Payment() {}

	public Payment(String payId, Date payDate, int payPrice, int refundPrice, String payStatus, String payMethod,
			String cardNum) {
		super();
		this.payId = payId;
		this.payDate = payDate;
		this.payPrice = payPrice;
		this.refundPrice = refundPrice;
		this.payStatus = payStatus;
		this.payMethod = payMethod;
		this.cardNum = cardNum;
	}

	public String getPayId() {
		return payId;
	}

	public void setPayId(String payId) {
		this.payId = payId;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public int getPayPrice() {
		return payPrice;
	}

	public void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
	}

	public int getRefundPrice() {
		return refundPrice;
	}

	public void setRefundPrice(int refundPrice) {
		this.refundPrice = refundPrice;
	}

	public String getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public String getCardNum() {
		return cardNum;
	}

	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}

	@Override
	public String toString() {
		return "Payment [payId=" + payId + ", payDate=" + payDate + ", payPrice=" + payPrice + ", refundPrice="
				+ refundPrice + ", payStatus=" + payStatus + ", payMethod=" + payMethod + ", cardNum=" + cardNum + "]";
	};
	
	
}
