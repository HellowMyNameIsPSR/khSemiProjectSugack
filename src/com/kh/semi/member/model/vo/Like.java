package com.kh.semi.member.model.vo;

import java.sql.Date;

public class Like implements java.io.Serializable{

	private int interId;
	private int mid;
	private Date interDate;
	private int aid;
	private int wid;
	
	public Like() {}

	
	public Like(int interId, int mid, Date interDate, int aid, int wid) {
		super();
		this.interId = interId;
		this.mid = mid;
		this.interDate = interDate;
		this.aid = aid;
		this.wid = wid;
	}


	public int getInterId() {
		return interId;
	}

	public void setInterId(int interId) {
		this.interId = interId;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public Date getInterDate() {
		return interDate;
	}

	public void setInterDate(Date interDate) {
		this.interDate = interDate;
	}

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public int getWid() {
		return wid;
	}

	public void setWid(int wid) {
		this.wid = wid;
	}

	@Override
	public String toString() {
		return "Like [interId=" + interId + ", mid=" + mid + ", interDate=" + interDate + ", aid=" + aid + ", wid="
				+ wid + "]";
	}
	
	
	
}
