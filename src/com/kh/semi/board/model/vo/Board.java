package com.kh.semi.board.model.vo;

import java.sql.Date;

public class Board implements java.io.Serializable{
	
	private int bno;
	private int memberId;
	private String Content;
	private Date writeDate;
	private int bCount;
	private int division;
	private int workId;
	private Date modifyDate;
	private String title;
	
	public Board(int bno, int memberId, String content, Date writeDate, int bCount, int division, int workId,
			Date modifyDate, String title, String material) {
		super();
		this.bno = bno;
		this.memberId = memberId;
		Content = content;
		this.writeDate = writeDate;
		this.bCount = bCount;
		this.division = division;
		this.workId = workId;
		this.modifyDate = modifyDate;
		this.title = title;
		Material = material;
	}


	public String getMaterial() {
		return Material;
	}


	public void setMaterial(String material) {
		Material = material;
	}


	private String Material; 

	public Board() {}


	public Board(int bno, int memberId, String content, Date writeDate, int bCount, int division, int workId,
			Date modifyDate, String title) {
		super();
		this.bno = bno;
		this.memberId = memberId;
		Content = content;
		this.writeDate = writeDate;
		this.bCount = bCount;
		this.division = division;
		this.workId = workId;
		this.modifyDate = modifyDate;
		this.title = title;
	}


	public String getContent() {
		return Content;
	}


	public void setContent(String content) {
		Content = content;
	}


	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}


	@Override
	public String toString() {
		return "Board [bno=" + bno + ", memberId=" + memberId + ", Content=" + Content + ", writeDate=" + writeDate
				+ ", bCount=" + bCount + ", division=" + division + ", workId=" + workId + ", modifyDate=" + modifyDate
				+ ", title=" + title + ", Material=" + Material + "]";
	}




	
	
	
}
