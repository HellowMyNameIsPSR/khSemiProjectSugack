package com.kh.semi.funding.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Funding implements Serializable{
	private int workId;
	private Date finishDate;
	private int minVoo;
	private int maxVoo;
	private Date deliDate;
	private String cooperation;
	private Date startDate;
	private int  funDate;
	
	public Funding() {
		// TODO Auto-generated constructor stub
	}

	public Funding(int workId, Date finishDate, int minVoo, int maxVoo, Date deliDate, String cooperation,
			Date startDate, int funDate) {
		super();
		this.workId = workId;
		this.finishDate = finishDate;
		this.minVoo = minVoo;
		this.maxVoo = maxVoo;
		this.deliDate = deliDate;
		this.cooperation = cooperation;
		this.startDate = startDate;
		this.funDate = funDate;
	}

	@Override
	public String toString() {
		return "Funding [workId=" + workId + ", finishDate=" + finishDate + ", minVoo=" + minVoo + ", maxVoo=" + maxVoo
				+ ", deliDate=" + deliDate + ", cooperation=" + cooperation + ", startDate=" + startDate + ", funDate="
				+ funDate + "]";
	}

	public int getWorkId() {
		return workId;
	}

	public void setWorkId(int workId) {
		this.workId = workId;
	}

	public Date getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}

	public int getMinVoo() {
		return minVoo;
	}

	public void setMinVoo(int minVoo) {
		this.minVoo = minVoo;
	}

	public int getMaxVoo() {
		return maxVoo;
	}

	public void setMaxVoo(int maxVoo) {
		this.maxVoo = maxVoo;
	}

	public Date getDeliDate() {
		return deliDate;
	}

	public void setDeliDate(Date deliDate) {
		this.deliDate = deliDate;
	}

	public String getCooperation() {
		return cooperation;
	}

	public void setCooperation(String cooperation) {
		this.cooperation = cooperation;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public int getFunDate() {
		return funDate;
	}

	public void setFunDate(int funDate) {
		this.funDate = funDate;
	}
	
} //end class
