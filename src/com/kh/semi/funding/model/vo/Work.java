package com.kh.semi.funding.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Work implements Serializable{
	private int workId; //작품코드
	private String workName; //작품명
	private String workContent; //작품설명
	private int deliPrice; //배송비
	private Date wrDate;//작품 등록일
	private Date psDate; //출시 예정일
	private int maxCount; //최대 구매 수량
	private Date csDate; //판매 마감일
	private String workKind; //작품 종류
	private int memberId; //작가코드
	private int price; //가격
	private String category; //카테고리 코드
	private int typeId; //유형 코드
	private String authorType;//작가 유형
	private int wcount; //조회수
	
	public Work() {
		// TODO Auto-generated constructor stub
	}

	public Work(int workId, String workName, String workContent, int deliPrice, Date wrDate, Date psDate, int maxCount,
			Date csDate, String workKind, int memberId, int price, String category, int typeId, String authorType,
			int wcount) {
		super();
		this.workId = workId;
		this.workName = workName;
		this.workContent = workContent;
		this.deliPrice = deliPrice;
		this.wrDate = wrDate;
		this.psDate = psDate;
		this.maxCount = maxCount;
		this.csDate = csDate;
		this.workKind = workKind;
		this.memberId = memberId;
		this.price = price;
		this.category = category;
		this.typeId = typeId;
		this.authorType = authorType;
		this.wcount = wcount;
	}

	public int getWorkId() {
		return workId;
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

	public Date getPsDate() {
		return psDate;
	}

	public void setPsDate(Date psDate) {
		this.psDate = psDate;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public String getAuthorType() {
		return authorType;
	}

	public void setAuthorType(String authorType) {
		this.authorType = authorType;
	}

	public int getWcount() {
		return wcount;
	}

	public void setWcount(int wcount) {
		this.wcount = wcount;
	}

	@Override
	public String toString() {
		return "Work [workId=" + workId + ", workName=" + workName + ", workContent=" + workContent + ", deliPrice="
				+ deliPrice + ", wrDate=" + wrDate + ", psDate=" + psDate + ", maxCount=" + maxCount + ", csDate="
				+ csDate + ", workKind=" + workKind + ", memberId=" + memberId + ", price=" + price + ", category="
				+ category + ", typeId=" + typeId + ", authorType=" + authorType + ", wcount=" + wcount + "]";
	}
	
} //end class
