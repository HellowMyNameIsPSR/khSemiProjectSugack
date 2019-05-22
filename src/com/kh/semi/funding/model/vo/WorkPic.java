package com.kh.semi.funding.model.vo;

import java.io.Serializable;

public class WorkPic implements Serializable{
	private String wpId;
	private String originName;
	private String changeName;
	private String filePath;
	private String picType;
	private int workId;
	
	public WorkPic() {
		// TODO Auto-generated constructor stub
	}

	public WorkPic(String wpId, String originName, String changeName, String filePath, String picType, int workId) {
		super();
		this.wpId = wpId;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.picType = picType;
		this.workId = workId;
	}

	public String getWpId() {
		return wpId;
	}

	public void setWpId(String wpId) {
		this.wpId = wpId;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getPicType() {
		return picType;
	}

	public void setPicType(String picType) {
		this.picType = picType;
	}

	public int getWorkId() {
		return workId;
	}

	public void setWorkId(int workId) {
		this.workId = workId;
	}

	@Override
	public String toString() {
		return "WorkPic [wpId=" + wpId + ", originName=" + originName + ", changeName=" + changeName + ", filePath="
				+ filePath + ", picType=" + picType + ", workId=" + workId + "]";
	}
	
	
	
} //end class
