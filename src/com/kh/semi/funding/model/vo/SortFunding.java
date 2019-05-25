package com.kh.semi.funding.model.vo;

import com.kh.semi.author.model.vo.PageInfo;

public class SortFunding {
	private int workId;
	private String workName;
	private String wrDate;
	private String fcStart;
	private String fcFinish;
	private String funStatus;
	private PageInfo pageInfo;
	
	public SortFunding() {
		
	}

	public SortFunding(int workId, String workName, String wrDate, String fcStart, String fcFinish, String funStatus,
			PageInfo pageInfo) {
		super();
		this.workId = workId;
		this.workName = workName;
		this.wrDate = wrDate;
		this.fcStart = fcStart;
		this.fcFinish = fcFinish;
		this.funStatus = funStatus;
		this.pageInfo = pageInfo;
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

	public String getWrDate() {
		return wrDate;
	}

	public void setWrDate(String wrDate) {
		this.wrDate = wrDate;
	}

	public String getFcStart() {
		return fcStart;
	}

	public void setFcStart(String fcStart) {
		this.fcStart = fcStart;
	}

	public String getFcFinish() {
		return fcFinish;
	}

	public void setFcFinish(String fcFinish) {
		this.fcFinish = fcFinish;
	}

	public String getFunStatus() {
		return funStatus;
	}

	public void setFunStatus(String funStatus) {
		this.funStatus = funStatus;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	@Override
	public String toString() {
		return "SortFunding [workId=" + workId + ", workName=" + workName + ", wrDate=" + wrDate + ", fcStart="
				+ fcStart + ", fcFinish=" + fcFinish + ", funStatus=" + funStatus + ", pageInfo=" + pageInfo + "]";
	}

} //end class
