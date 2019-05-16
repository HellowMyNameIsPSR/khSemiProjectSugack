package com.kh.semi.product.model.vo;

import java.sql.Date;

public class Product implements java.io.Serializable{
	
	private int workId;
	private String workName;
	private String workContent;
	private int deliPrice;
	private Date wrDate;
	private Date rsDate;
	private int maxCount;
	private Date csDate;
	private String workKind;
	private int memberId;
	private int price;
	private int cid;
	private int typeId;
	private String changeName;
	
	public Product() {}

	public Product(int workId, String workName, String workContent, int deliPrice, Date wrDate, Date rsDate,
			int maxCount, Date csDate, String workKind, int memberId, int price, int cid, int typeId , String changeName) {
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
		this.changeName = changeName;
	}

	public int getWorkId() {
		return workId;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public void setWorkId(int workId) {
		this.workId = workId;
	}

	public String getWorkName() {
		return workName;
	}

	public void setWorkName(String workName) {
		this.workName = workName;
	}

	public String getWorkContent() {
		return workContent;
	}

	public void setWorkContent(String workContent) {
		this.workContent = workContent;
	}

	public int getDeliPrice() {
		return deliPrice;
	}

	public void setDeliPrice(int deliPrice) {
		this.deliPrice = deliPrice;
	}

	public Date getWrDate() {
		return wrDate;
	}

	public void setWrDate(Date wrDate) {
		this.wrDate = wrDate;
	}

	public Date getRsDate() {
		return rsDate;
	}

	public void setRsDate(Date rsDate) {
		this.rsDate = rsDate;
	}

	public int getMaxCount() {
		return maxCount;
	}

	public void setMaxCount(int maxCount) {
		this.maxCount = maxCount;
	}

	public Date getCsDate() {
		return csDate;
	}

	public void setCsDate(Date csDate) {
		this.csDate = csDate;
	}

	public String getWorkKind() {
		return workKind;
	}

	public void setWorkKind(String workKind) {
		this.workKind = workKind;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	@Override
	public String toString() {
		return "Product [workId=" + workId + ", workName=" + workName + ", workContent=" + workContent + ", deliPrice="
				+ deliPrice + ", wrDate=" + wrDate + ", rsDate=" + rsDate + ", maxCount=" + maxCount + ", csDate="
				+ csDate + ", workKind=" + workKind + ", memberId=" + memberId + ", price=" + price + ", cid=" + cid
				+ ", typeId=" + typeId + "]";
	}
	
	

}
