package com.kh.semi.board.model.vo;

import java.util.Date;

public class authorComent {
	
	private int CommentId ; //댓글 코드
	private Date WriteDate; //작성일
	private String Cntent;  //작성내용 
	private int WriterId ;  //작성자 
	private int WriteLever; //작성위치 
	private int Workid; // 작품코드 
	private int Bno; //게시글번호
	private String email; // 작성자 닉네임
	
	 
	

	public authorComent(int commentId, Date writeDate, String cntent, int writerId, int writeLever, int workid, int bno,
			String email) {
		super();
		CommentId = commentId;
		WriteDate = writeDate;
		Cntent = cntent;
		WriterId = writerId;
		WriteLever = writeLever;
		Workid = workid;
		Bno = bno;
		this.email = email;
	}

	public authorComent() {}
	
	public int getCommentId() {
		return CommentId;
	}
	public void setCommentId(int commentId) {
		CommentId = commentId;
	}
	public Date getWriteDate() {
		return WriteDate;
	}
	public void setWriteDate(Date writeDate) {
		WriteDate = writeDate;
	}
	public String getCntent() {
		return Cntent;
	}
	public void setCntent(String cntent) {
		Cntent = cntent;
	}
	public int getWriterId() {
		return WriterId;
	}
	public void setWriterId(int writerId) {
		WriterId = writerId;
	}
	public int getWriteLever() {
		return WriteLever;
	}
	public void setWriteLever(int writeLever) {
		WriteLever = writeLever;
	}
	public int getWorkid() {
		return getWorkid();
	}
	public void setWorkid(int workid) {
		Workid = workid;
	}

	public int getBno() {
		return Bno;
	}

	public void setBno(int bno) {
		Bno = bno;
	}

	
	

	@Override
	public String toString() {
		return "authorComent [CommentId=" + CommentId + ", WriteDate=" + WriteDate + ", Cntent=" + Cntent
				+ ", WriterId=" + WriterId + ", WriteLever=" + WriteLever + ", Workid=" + Workid + ", Bno=" + Bno
				+ ", email=" + email + "]";
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
	
	
	
	
	

}
