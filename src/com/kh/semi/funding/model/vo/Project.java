package com.kh.semi.funding.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Project implements Serializable{
	
	private int projectId; //프로젝트 코드
	private int total; //총 모집 인원
	private Date startDate; //모집 시작일
	private Date endDate; //모집 마감일
	private int workId; //작품 코드
	
	public Project() {
		// TODO Auto-generated constructor stub
	}

	public Project(int projectId, int total, Date startDate, Date endDate, int workId) {
		super();
		this.projectId = projectId;
		this.total = total;
		this.startDate = startDate;
		this.endDate = endDate;
		this.workId = workId;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getWorkId() {
		return workId;
	}

	public void setWorkId(int workId) {
		this.workId = workId;
	}

	@Override
	public String toString() {
		return "Project [projectId=" + projectId + ", total=" + total + ", startDate=" + startDate + ", endDate="
				+ endDate + ", workId=" + workId + "]";
	}
	
	
}
