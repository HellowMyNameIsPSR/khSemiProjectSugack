package com.kh.semi.product.model.vo;

public class OrderList implements java.io.Serializable{
	private int odId;
	private String bundleCode;
	private int basketId;
	private String payId;
	
	public OrderList() {}

	public OrderList(int odId, String bundleCode, int basketId, String payId) {
		super();
		this.odId = odId;
		this.bundleCode = bundleCode;
		this.basketId = basketId;
		this.payId = payId;
	}

	public int getOdId() {
		return odId;
	}

	public void setOdId(int odId) {
		this.odId = odId;
	}

	public String getBundleCode() {
		return bundleCode;
	}

	public void setBundleCode(String bundleCode) {
		this.bundleCode = bundleCode;
	}

	public int getBasketId() {
		return basketId;
	}

	public void setBasketId(int basketId) {
		this.basketId = basketId;
	}

	public String getPayId() {
		return payId;
	}

	public void setPayId(String payId) {
		this.payId = payId;
	}

	@Override
	public String toString() {
		return "OrderList [odId=" + odId + ", bundleCode=" + bundleCode + ", basketId=" + basketId + ", payId=" + payId
				+ "]";
	}
	
	
}
