package com.kh.semi.board.model.vo;

import java.sql.Date;

public class ProQna implements java.io.Serializable{
	
	private int rowNum;
	private int bno;
	private int mid;
	private String content;
	private Date writeDate;
	private int bCount;
	private int division;
	private int workId;
	private Date modifyDate;
	private String category;
	private String writer;
	
  
	public ProQna() {}


	


	public ProQna(int rowNum, int bno, int mid, String content, Date writeDate, int bCount, int division, int workId,
			Date modifyDate, String category, String writer) {
		super();
		this.rowNum = rowNum;
		this.bno = bno;
		this.mid = mid;
		this.content = content;
		this.writeDate = writeDate;
		this.bCount = bCount;
		this.division = division;
		this.workId = workId;
		this.modifyDate = modifyDate;
		this.category = category;
		this.writer = writer;
	}





	public String getWriter() {
		return writer;
	}





	public void setWriter(String writer) {
		this.writer = writer;
	}





	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
	}


	public int getMid() {
		return mid;
	}


	public void setMid(int mid) {
		this.mid = mid;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Date getWriteDate() {
		return writeDate;
	}


	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}


	public int getbCount() {
		return bCount;
	}


	public void setbCount(int bCount) {
		this.bCount = bCount;
	}


	public int getDivision() {
		return division;
	}


	public void setDivision(int division) {
		this.division = division;
	}


	public int getWorkId() {
		return workId;
	}


	public void setWorkId(int workId) {
		this.workId = workId;
	}


	public Date getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}


	public String getcategory() {
		return category;
	}


	public void setcategory(String category) {
		this.category = category;
	}

	
	public int getRowNum() {
		return rowNum;
	}


	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


//d


	@Override
	public String toString() {
		return "ProQna [rowNum=" + rowNum + ", bno=" + bno + ", mid=" + mid + ", content=" + content + ", writeDate="
				+ writeDate + ", bCount=" + bCount + ", division=" + division + ", workId=" + workId + ", modifyDate="
				+ modifyDate + ", category=" + category + ", writer=" + writer + "]";
	}


	
	
	

}
