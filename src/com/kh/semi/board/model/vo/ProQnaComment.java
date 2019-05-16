package com.kh.semi.board.model.vo;

import java.sql.Date;

public class ProQnaComment implements java.io.Serializable{
	//f
	private int cid;
	private Date writeDate;
	private String content;
	private int bno;
	private int writerId;
	private int writeLevel;
	private int star;
	private String writer;
	
	
	public ProQnaComment() {}
	
	public ProQnaComment(int cid, Date writeDate, String content, int bno, int writerId, int writeLevel, int star,String writer) {
		super();
		this.cid = cid;
		this.writeDate = writeDate;
		this.content = content;
		this.bno = bno;
		this.writerId = writerId;
		this.writeLevel = writeLevel;
		this.star = star;
		this.writer = writer;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getWriterId() {
		return writerId;
	}

	public void setWriterId(int writerId) {
		this.writerId = writerId;
	}

	public int getWriteLevel() {
		return writeLevel;
	}

	public void setWriteLevel(int writeLevel) {
		this.writeLevel = writeLevel;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	@Override
	public String toString() {
		return "ProQnaComment [cid=" + cid + ", writeDate=" + writeDate + ", content=" + content + ", bno=" + bno
				+ ", writerId=" + writerId + ", writeLevel=" + writeLevel + ", star=" + star + ", writer=" + writer
				+ "]";
	}


	
	

}
