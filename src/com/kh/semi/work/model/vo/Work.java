package com.kh.semi.work.model.vo;

import java.sql.Date;

public class Work implements java.io.Serializable{
	private int workId;			//작품코드
	private String workName;	//작품명
	private String workContent;	//작품설명
	private int deliPrice;		//배송비
	private Date wrDate;		//작품등록일
	private Date rsDate;		//출시예정일
	private int maxCount;		//최대구매수량
	private Date csDate;		//판매마감일
	private String workKind;	//작품종류
	private int memberId;		//작가코드	
	private int price;			//가격
	private int cid;			//카테고리코드
	private int typeId;			//유형코드

	public Work() {}

	public Work(int workId, String workName, String workContent, int deliPrice, Date wrDate, Date rsDate, int maxCount,
			Date csDate, String workKind, int memberId, int price, int cid, int typeId) {
		super();
		this.workId = workId;
		this.workName = workName;
		this.workContent = workContent;
		this.deliPrice = deliPrice;
		this.wrDate = wrDate;
		this.rsDate = rsDate;
		this.maxCount = maxCount;
		this.csDate = csDate;
		this.workKind = workKind;
		this.memberId = memberId;
		this.price = price;
		this.cid = cid;
		this.typeId = typeId;
	}

	public int getWorkId() {
		return workId;
	}

	public String getworkName() {
		return workName;
	}

	public String getWorkContent() {
		return workContent;
	}

	public int getDeliPrice() {
		return deliPrice;
	}

	public Date getWrDate() {
		return wrDate;
	}

	public Date getRsDate() {
		return rsDate;
	}

	public int getMaxCount() {
		return maxCount;
	}

	public Date getCsDate() {
		return csDate;
	}

	public String getWorkKind() {
		return workKind;
	}

	public int getMemberId() {
		return memberId;
	}

	public int getPrice() {
		return price;
	}

	public int getCid() {
		return cid;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setWorkId(int workId) {
		this.workId = workId;
	}

	public void setworkName(String workName) {
		this.workName = workName;
	}

	public void setWorkContent(String workContent) {
		this.workContent = workContent;
	}

	public void setDeliPrice(int deliPrice) {
		this.deliPrice = deliPrice;
	}

	public void setWrDate(Date wrDate) {
		this.wrDate = wrDate;
	}

	public void setRsDate(Date rsDate) {
		this.rsDate = rsDate;
	}

	public void setMaxCount(int maxCount) {
		this.maxCount = maxCount;
	}

	public void setCsDate(Date csDate) {
		this.csDate = csDate;
	}

	public void setWorkKind(String workKind) {
		this.workKind = workKind;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	@Override
	public String toString() {
		return "Work [workId=" + workId + ", workName=" + workName + ", workContent=" + workContent + ", deliPrice="
				+ deliPrice + ", wrDate=" + wrDate + ", rsDate=" + rsDate + ", maxCount=" + maxCount + ", csDate="
				+ csDate + ", workKind=" + workKind + ", memberId=" + memberId + ", price=" + price + ", cid=" + cid
				+ ", typeId=" + typeId + "]";
	}
	
	

}
