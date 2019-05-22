package com.kh.semi.member.model.vo;

import java.sql.Date;

public class Point implements java.io.Serializable{
	
	private int pointId;
	private Date pDate;
	private String pLocation;
	private int point;
	private int mid;
	private String status;
	
	public Point() {}

	public Point(int pointId, Date pDate, String pLocation, int point, int mid, String status) {
		super();
		this.pointId = pointId;
		this.pDate = pDate;
		this.pLocation = pLocation;
		this.point = point;
		this.mid = mid;
		this.status = status;
	}

	public int getPointId() {
		return pointId;
	}

	public void setPointId(int pointId) {
		this.pointId = pointId;
	}

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	public String getpLocation() {
		return pLocation;
	}

	public void setpLocation(String pLocation) {
		this.pLocation = pLocation;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Point [pointId=" + pointId + ", pDate=" + pDate + ", pLocation=" + pLocation + ", point=" + point
				+ ", mid=" + mid + ", status=" + status + "]";
	}
	
	

}



















