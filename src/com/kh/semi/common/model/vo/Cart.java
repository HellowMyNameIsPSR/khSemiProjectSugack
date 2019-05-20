package com.kh.semi.common.model.vo;

import java.sql.Date;

public class Cart implements java.io.Serializable{
	private int basketId;
	private int mid;
	private int wid;
	private Date basketDate;
	private int count;
	private int opId;
	private String filePath;
	private int price;
	private String content;
	
	
	public Cart() {}


	public Cart(int basketId, int mid, int wid, Date basketDate, int count, int opId, String filePath, int price, String content) {
		super();
		this.basketId = basketId;
		this.mid = mid;
		this.wid = wid;
		this.basketDate = basketDate;
		this.count = count;
		this.opId = opId;
		this.filePath = filePath;
		this.price = price;
		this.content = content;
	}
	
	

	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	public int getBasketId() {
		return basketId;
	}


	public void setBasketId(int basketId) {
		this.basketId = basketId;
	}


	public int getMid() {
		return mid;
	}


	public void setMid(int mid) {
		this.mid = mid;
	}


	public int getWid() {
		return wid;
	}


	public void setWid(int wid) {
		this.wid = wid;
	}


	public Date getBasketDate() {
		return basketDate;
	}


	public void setBasketDate(Date basketDate) {
		this.basketDate = basketDate;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public int getOpId() {
		return opId;
	}


	public void setOpId(int opId) {
		this.opId = opId;
	}


	@Override
	public String toString() {
		return "Cart [basketId=" + basketId + ", mid=" + mid + ", wid=" + wid + ", basketDate=" + basketDate
				+ ", count=" + count + ", opId=" + opId + ", filePath=" + filePath + ", price=" + price + ", content="
				+ content + "]";
	}


	


	
	
	

}
