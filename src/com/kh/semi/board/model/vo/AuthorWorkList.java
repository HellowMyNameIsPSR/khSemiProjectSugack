package com.kh.semi.board.model.vo;

import java.util.Date;

public class AuthorWorkList {
	
	
 private int workId;  // 작품코드
 private String workName;  // 작품이름
 private String workContent;//작품 상세내용
 private int  deliPrice;//배송비 
 private Date wrDate;//작품 등록일 
 private Date rsDate;//작품 출시일 
 private int  maxCount;//최대 구매 수량
 private Date csDate;//판매마감일
 private String workKind;//작품종류
 private int price; //가격
 private int cid; //카테고리 코드
 private int typeId; //유형코드 
 private int wcount;// 조회수
 private int bno; // 게시물코드
 
 
 public AuthorWorkList() {}


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


public int getWcount() {
	return wcount;
}


public void setWcount(int wcount) {
	this.wcount = wcount;
}


public int getBno() {
	return bno;
}


public void setBno(int bno) {
	this.bno = bno;
}


@Override
public String toString() {
	return "AuthorWorkList [workId=" + workId + ", workName=" + workName + ", workContent=" + workContent
			+ ", deliPrice=" + deliPrice + ", wrDate=" + wrDate + ", rsDate=" + rsDate + ", maxCount=" + maxCount
			+ ", csDate=" + csDate + ", workKind=" + workKind + ", price=" + price + ", cid=" + cid + ", typeId="
			+ typeId + ", wcount=" + wcount + ", bno=" + bno + "]";
}
 
 
 
 
 

 
 
}
